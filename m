Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330596AE9FA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZb7n-0008Ch-Nr; Tue, 07 Mar 2023 12:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZb7k-00086a-Ab
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:29:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZb7i-0001KC-V9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678210153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a1J61pJuIrZlTFAtSg8Z90vXDcZddaC5slCAUwzlP4o=;
 b=QP6d3kvmK3fWQ6Vfu31xdoo5l/+zcmyEJbwOd+tqRinF7wUD8lulWotkWitR10DcvGOPLu
 F+fhQ10WGma0QWSeqjYtfVpF1fOZL5BMzSQSAB3zqmwf+EEr6907y4tuuTnFCtH5rQ4FlM
 2EbgZnRA+9/W6Rs75DqFDPkQtX84JGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-IQdqGKt3MLqEXnzPRMH4hg-1; Tue, 07 Mar 2023 12:29:11 -0500
X-MC-Unique: IQdqGKt3MLqEXnzPRMH4hg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B2C1857A94;
 Tue,  7 Mar 2023 17:29:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52A5718EC6;
 Tue,  7 Mar 2023 17:29:10 +0000 (UTC)
Date: Tue, 7 Mar 2023 18:29:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 0/6] block: switch to AIO_WAIT_WHILE_UNLOCKED() where
 possible
Message-ID: <ZAd0ZRR4aI6mg9hq@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301205801.2453491-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 01.03.2023 um 21:57 hat Stefan Hajnoczi geschrieben:
> AIO_WAIT_WHILE_UNLOCKED() is the future replacement for AIO_WAIT_WHILE(). Most
> callers haven't been converted yet because they rely on the AioContext lock. I
> looked through the code and found the easy cases that can be converted today.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


