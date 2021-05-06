Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822237534E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 13:56:33 +0200 (CEST)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leccK-0000zj-5z
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 07:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lecaF-0007Y4-5P
 for qemu-devel@nongnu.org; Thu, 06 May 2021 07:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lecaC-0004p4-HR
 for qemu-devel@nongnu.org; Thu, 06 May 2021 07:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620302059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCDR7NwLoo+uyleOfZbMvSpuJ1r8xPC9IBFC+6Qi/J4=;
 b=gNBT3mXXXA7UO16NgNNOzt5AfA21mc3QC5wV6RTrvSq/Ib8/+x9LNfsqRF+/05QrunC2Zu
 7PFI/17u4WPRSc7rQkUnj2lBo2+D2UxAFsXA19KdnHyeBN+XiCKBq1wIMuADvDLdvWrdzi
 3WattDd0drmo1IN8Ad5vFVS00YjjonI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-LTrDMjvuMRCGiH13dajh1A-1; Thu, 06 May 2021 07:54:18 -0400
X-MC-Unique: LTrDMjvuMRCGiH13dajh1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD0121020C2A;
 Thu,  6 May 2021 11:54:16 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-111.ams2.redhat.com
 [10.36.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 397025C1A1;
 Thu,  6 May 2021 11:54:12 +0000 (UTC)
Date: Thu, 6 May 2021 13:54:09 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 00/15] linux-user/s390x: some signal fixes
Message-ID: <20210506135409.1be1c693.cohuck@redhat.com>
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, david@redhat.com,
 qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021 12:33:53 -0700
Richard Henderson <richard.henderson@linaro.org> wrote:

> Version 2 splits lazy do-it-all patch.
> Patch 1 has an additional fix, so I dropped the r-b.
> 
> r~
> 
> Richard Henderson (15):
>   linux-user/s390x: Fix sigframe types
>   linux-user/s390x: Use uint16_t for signal retcode
>   linux-user/s390x: Remove PSW_ADDR_AMODE
>   linux-user/s390x: Remove restore_sigregs return value
>   linux-user/s390x: Fix trace in restore_regs
>   linux-user/s390x: Fix sigcontext sregs value
>   linux-user/s390x: Use tswap_sigset in setup_rt_frame
>   linux-user/s390x: Tidy save_sigregs
>   linux-user/s390x: Clean up single-use gotos in signal.c
>   linux-user/s390x: Set psw.mask properly for the signal handler
>   linux-user/s390x: Add stub sigframe argument for last_break
>   linux-user/s390x: Fix frame_addr corruption in setup_frame
>   linux-user/s390x: Add build asserts for sigset sizes
>   linux-user/s390x: Clean up signal.c
>   linux-user/s390x: Handle vector regs in signal stack
> 
>  linux-user/s390x/signal.c | 280 +++++++++++++++++++++++---------------
>  1 file changed, 170 insertions(+), 110 deletions(-)
> 

I assume the route-to-upstream for this is through the linux-user tree
and not the s390x tree, right?


