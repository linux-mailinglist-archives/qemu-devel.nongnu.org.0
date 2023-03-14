Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0166B9C97
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc8At-0007tE-1L; Tue, 14 Mar 2023 13:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pc8Ar-0007sw-H2
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pc8Aq-0006hn-0j
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678813854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4PYgyOxeR5+eOGjEFvqln5giBofMppJcvVU2OGTTScQ=;
 b=VzhydFqAqdaF7uYRu1tShT0puZulQVjj0H6d7S4a8CPEfanKZe/apg7n4Z3ow5qZXNsnf3
 FRBi8xAn6v6OY3u1KsnZzGO24gbogQFPzT1DnGzl/Zcl0+4nqQjBm5iOZ2tQXBs5WLtb1w
 cvpIAaSFaAJiqEAAD7M5S53RAW8q890=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-aslWB7QiOWKrZBTSyB4Otw-1; Tue, 14 Mar 2023 13:10:50 -0400
X-MC-Unique: aslWB7QiOWKrZBTSyB4Otw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9BBC381494A;
 Tue, 14 Mar 2023 17:10:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 476552166B29;
 Tue, 14 Mar 2023 17:10:47 +0000 (UTC)
Date: Tue, 14 Mar 2023 18:10:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, armbru@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v2 0/6] block: switch to AIO_WAIT_WHILE_UNLOCKED() where
 possible
Message-ID: <ZBCqlTExahQBniwy@redhat.com>
References: <20230309190855.414275-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309190855.414275-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 09.03.2023 um 20:08 hat Stefan Hajnoczi geschrieben:
> v2:
> - Clarify NULL ctx argument in Patch 1 commit description [Kevin]
> 
> AIO_WAIT_WHILE_UNLOCKED() is the future replacement for AIO_WAIT_WHILE(). Most
> callers haven't been converted yet because they rely on the AioContext lock. I
> looked through the code and found the easy cases that can be converted today.

Thanks, applied to block-next.

Kevin


