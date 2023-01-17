Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5717C66E287
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:43:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHo7W-000094-Ga; Tue, 17 Jan 2023 10:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHo7G-0008NM-MX
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:43:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHo7E-0007A0-VU
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:43:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673970191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jkyBZAuthZO9WJ3zDFG11dE7dIr1qAw8S7QBSLqc/nc=;
 b=c3G6TdBkd4SFOEuIVHwYVwN2G3ujQwjdvHn2WNT3/Z+uFeIVI45zvdd4HKM16P0FNvZW9m
 ZtLNZmm5Zvt11u8NWAv9t4C00GD/XwfGjE3AD16BnLgGSWE/iS3mo9eLXICk2BqqWcuYxR
 ZykaGvbrQVGEwh2Y3mq1gFph2bRus3s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-b2FzGGIlNwGS5y0vdNUkCg-1; Tue, 17 Jan 2023 10:43:09 -0500
X-MC-Unique: b2FzGGIlNwGS5y0vdNUkCg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C2AF3C11A1B;
 Tue, 17 Jan 2023 15:42:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90F50492B00;
 Tue, 17 Jan 2023 15:42:00 +0000 (UTC)
Date: Tue, 17 Jan 2023 16:41:59 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, afaria@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH 0/2] Make coroutine annotations ready for static analysis
Message-ID: <Y8bBx6PAr/o4knPc@redhat.com>
References: <20221216110758.559947-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216110758.559947-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Am 16.12.2022 um 12:07 hat Paolo Bonzini geschrieben:
> Clang has a generic __annotate__ attribute that can be used by
> static analyzers to understand properties of functions and
> analyze the control flow.
> 
> Unlike TSA annotations, the __annotate__ attribute applies to function
> pointers as well, which is very fortunate because many BlockDriver
> function driver run in coroutines.
> 
> Paolo
> 
> v1->v2: improved comments for patch 2

Thanks, applied to the block branch.

Kevin


