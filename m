Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F275BF09B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:54:30 +0200 (CEST)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oam8L-0001h5-Ff
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1oaibP-0003V4-GF
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 15:08:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1oaibE-00035T-Sj
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 15:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663700881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ktzlZpwOw1mqf4yROmBwwB/LWKCZseMzSDKapspkc5s=;
 b=J2DvfgPkPas2DouAsaYVHMQFCO0bd11rFObcg7zsZo+5rEzIaTIm6lf3N54fOGnsAkuGMG
 VDawbEMabtlgiGPR8MKGVFi5kh5D73EEwvQ+Orxn9tEcoIGVfB3+PGIPCfV61dMfuGaHag
 zp4UDwf89lq6PoUY9TIQUO+nP10q5/s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-Urp3PljJP8uEskjZfpjyBg-1; Tue, 20 Sep 2022 15:06:22 -0400
X-MC-Unique: Urp3PljJP8uEskjZfpjyBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF1BE185A79C;
 Tue, 20 Sep 2022 19:06:21 +0000 (UTC)
Received: from fuller.cnet (ovpn-112-2.gru2.redhat.com [10.97.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A4D71759F;
 Tue, 20 Sep 2022 19:06:21 +0000 (UTC)
Received: by fuller.cnet (Postfix, from userid 1000)
 id 6F905416D5C1; Tue, 20 Sep 2022 15:33:55 -0300 (-03)
Date: Tue, 20 Sep 2022 15:33:55 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Oliver Upton <oupton@google.com>, Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH] i386: Fix KVM_CAP_ADJUST_CLOCK capability check
Message-ID: <YyoHkzsHbW93u8GC@fuller.cnet>
References: <20220920144024.3559708-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920144024.3559708-1-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mtosatti@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 20, 2022 at 04:40:24PM +0200, Vitaly Kuznetsov wrote:
> KVM commit c68dc1b577ea ("KVM: x86: Report host tsc and realtime values in
> KVM_GET_CLOCK") broke migration of certain workloads, e.g. Win11 + WSL2
> guest reboots immediately after migration. KVM, however, is not to
> blame this time. When KVM_CAP_ADJUST_CLOCK capability is checked, the
> result is all supported flags (which the above mentioned KVM commit
> enhanced) but kvm_has_adjust_clock_stable() wants it to be
> KVM_CLOCK_TSC_STABLE precisely. The result is that 'clock_is_reliable'
> is not set in vmstate and the saved clock reading is discarded in
> kvmclock_vm_state_change().
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index a1fd1f53791d..c33192a87dcb 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -157,7 +157,7 @@ bool kvm_has_adjust_clock_stable(void)
>  {
>      int ret = kvm_check_extension(kvm_state, KVM_CAP_ADJUST_CLOCK);
>  
> -    return (ret == KVM_CLOCK_TSC_STABLE);
> +    return ret & KVM_CLOCK_TSC_STABLE;
>  }
>  
>  bool kvm_has_adjust_clock(void)
> -- 
> 2.37.3
> 
> 

ACK.


