Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24D5EBF80
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:15:08 +0200 (CEST)
Received: from localhost ([::1]:49654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7cJ-00064b-42
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1od79a-0000y6-7O
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:45:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1od79W-0006Cy-EQ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664271917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PmKEctSqdRlqsl1/Zw75K12LZab6lElkfTLue1bH3z4=;
 b=V89FKpdK2r1kq9+2iIn7EJ51aATxgFuYlA7zNsr8HsXWvwQxNTv6NN24LXM/PaXcH9kQ/J
 Gt89Ieema/puMYQTulC2Mi/NvCr1Z2qMDPbJcolXFbTULweFC9Ev1hxl4qmIFdM01yQY40
 CjQSulOrfrxYfxskC8sj8/zU3dp8TXA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-AAyNw-ZkPs6NTsHF6UKT6w-1; Tue, 27 Sep 2022 05:45:15 -0400
X-MC-Unique: AAyNw-ZkPs6NTsHF6UKT6w-1
Received: by mail-ej1-f69.google.com with SMTP id
 hr29-20020a1709073f9d00b0078333782c48so2624570ejc.10
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=PmKEctSqdRlqsl1/Zw75K12LZab6lElkfTLue1bH3z4=;
 b=ZpkL2wCgXH2CqFqVBOWOA4oPR5myOf9xgWzH6PgK13TBWAbBG2A9JpkBCRqgs3IFtf
 hB4q4deZzlGku+AyS3za8O8SPmVHnAmhowg0vNHQ3lXBDn1M/kNm0tSRT+IJ6usOYAEe
 NIP1Qefs8IdbdgdbGsh37gXajvpHUcrfagPy33DfkA6aWDTXH2QDk0gE4oCEySgxSw+P
 Jn204jARpu/1ubsar5775qZ3Y52sH78JsHQqyjTeagVYDoIHrWOcr8wg18uGoVBrU4G1
 FBNegYA7VQL8eRwIUTI+UAD1CAICzr8bXhRnAAbxfegFSTp/xbZnhcLlKugyelqhnUJw
 O5nw==
X-Gm-Message-State: ACrzQf1xvk5xPLuLaBvq672Z1DbjgSe/zsaNYXgKMhTYjzS8zWX+RgfG
 g5NfKNPeHL4s69wRHKBntKDqK6NNRdcTTSJPKE863vlXrpysy7ud+KL4LhlYKzKUTn2HKCry1Zg
 yuerHTJKrIQbQCB4=
X-Received: by 2002:a17:907:75e7:b0:77a:2378:91bb with SMTP id
 jz7-20020a17090775e700b0077a237891bbmr21942462ejc.329.1664271914892; 
 Tue, 27 Sep 2022 02:45:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50pDtv6ra4evi7RNdXk5wWMYUp2tnBOnjouQVVzd2PfMQoiksBUrQZ/eJGzmMMPyBK7Qgsvw==
X-Received: by 2002:a17:907:75e7:b0:77a:2378:91bb with SMTP id
 jz7-20020a17090775e700b0077a237891bbmr21942445ejc.329.1664271914686; 
 Tue, 27 Sep 2022 02:45:14 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 t8-20020aa7d708000000b0045461b8deabsm912322edq.41.2022.09.27.02.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 02:45:14 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Oliver Upton <oupton@google.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH] i386: Fix KVM_CAP_ADJUST_CLOCK capability check
In-Reply-To: <20220920144024.3559708-1-vkuznets@redhat.com>
References: <20220920144024.3559708-1-vkuznets@redhat.com>
Date: Tue, 27 Sep 2022 11:45:13 +0200
Message-ID: <87wn9pkv6e.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

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

Ping) This issue seems to introduce major migration issues with KVM >= v5.16

-- 
Vitaly


