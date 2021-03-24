Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FECB347468
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:20:33 +0100 (CET)
Received: from localhost ([::1]:50006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzgm-0000fO-3t
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lOzdt-0006Z7-OV
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:17:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lOzdm-0008QP-2e
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616577443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/GXiX5ZJ1cX+7W2jhJZxSBTuwWgeMUIEGujJoTgcck=;
 b=MbP0mYzpkq0b0ktq81SY5rUqOaWuKEO1K86kNdTpEV/d7Tm8cB3RERd5OvlwHpTNc/ECln
 n0Ri3CHB+SHwu2akGqYhyMkXl7dJj6WPBcnNbBLPWcS9ib6gAVrdjIfDTgeuUIWz4kzCeQ
 mUBL8XUPfSMUkOIix3Swk0ndlN3M20g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-IzPWaOXgNSKKdsCJy8BBZw-1; Wed, 24 Mar 2021 05:17:21 -0400
X-MC-Unique: IzPWaOXgNSKKdsCJy8BBZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A901C8143FE;
 Wed, 24 Mar 2021 09:17:20 +0000 (UTC)
Received: from [10.36.115.66] (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC8996A046;
 Wed, 24 Mar 2021 09:17:19 +0000 (UTC)
Subject: Re: [PATCH 1/1] linux-user/s390x: Apply h2g to address of sigreturn
 stub
To: Andreas Krebbel <krebbel@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210324085129.29684-1-krebbel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <5070a253-cd95-59b0-dbdb-2eb549e9f61c@redhat.com>
Date: Wed, 24 Mar 2021 10:17:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324085129.29684-1-krebbel@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.03.21 09:51, Andreas Krebbel wrote:
> The sigreturn SVC is put onto the stack by the emulation code.  Hence
> the address of it should not be subject to guest_base transformation
> when fetching it.
> 
> The fix applies h2g to the address when writing it into the return
> address register to nullify the transformation applied to it later.
> 
> Note: This only caused problems if Qemu has been built with
> --disable-pie (as it is in distros nowadays). Otherwise guest_base
> defaults to 0 hiding the actual problem.
> 
> Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
> ---
>   linux-user/s390x/signal.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index ecfa2a14a9..1412376958 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -152,7 +152,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>           env->regs[14] = (unsigned long)
>                   ka->sa_restorer | PSW_ADDR_AMODE;
>       } else {
> -        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
> +        env->regs[14] = h2g(frame_addr + offsetof(sigframe, retcode))
>                           | PSW_ADDR_AMODE;
>           __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
>                      (uint16_t *)(frame->retcode));
> @@ -213,7 +213,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       if (ka->sa_flags & TARGET_SA_RESTORER) {
>           env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
>       } else {
> -        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
> +        env->regs[14] = (unsigned long) h2g(frame->retcode) | PSW_ADDR_AMODE;
>           __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
>                      (uint16_t *)(frame->retcode));
>       }
> 

Sounds sane to me, although I am not an expert on that code :)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


