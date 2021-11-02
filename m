Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B938442BBC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:40:42 +0100 (CET)
Received: from localhost ([::1]:54990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrDa-0003f3-Sz
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhrC7-0002zS-FC
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:39:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhrC3-0003Pn-NL
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635849542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhltnQ/IDYqVqoMtn3iaf/jbw6dys4TOAVjSoP2en70=;
 b=ftuYvz0f2o6T0IsG/mLmnfyOCN375S3GXhghzfrdmVhPeap+Y7knJ1neDhzZmJzDbnlPBa
 aS5lwtpPlkwZxoomH5TgLPm4RUt9vV83HzhR49g4HzFtmcjcRWPOFkNvgwd7UgixiVl7Wf
 O2PzCHbDUPKFmidNtWBvr/JUX6Upo9M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-iQCAVvqxPr2XAUPt-T7sDQ-1; Tue, 02 Nov 2021 06:39:00 -0400
X-MC-Unique: iQCAVvqxPr2XAUPt-T7sDQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so3725174wmg.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bhltnQ/IDYqVqoMtn3iaf/jbw6dys4TOAVjSoP2en70=;
 b=giK+WE1GaaGzT0CRgA1hwxiNdMb+/oIhSUzT8iA/ttjDB63YM7744YqD1VHrNbHRPu
 +g6Y+vQrlvut1L3oC+IBFtLPpuGkCG6I5+BnF3ne/TJLNaVxQLzZ/ilXzMUm0AbaS95j
 B8zCXzhqp0IvaLbgy3J/KipJtwkkdsnAtG7JiV1K5DjUZdcQx6IxDXuBBHSH4gA9r6vv
 c4y/FjwPSJvlVQAuVdUumTKOrn6oKNdihTT6DQ59pO6L3rP82rYvkvzfsJy0Mthd6FaQ
 E6qJyrIM1bK69Ek9bP3ysnHYNVex9txppBCOY/xAwSZGmKViJZo9XED009EXwQoWy4bh
 8bxg==
X-Gm-Message-State: AOAM532g2FZOFRNjtWrN/XNqhbkGpD81q2lBlgtrSiq1dwZopXnMgqar
 N7QALztczT7H6DrAJG/MhJCynqSYTomjHzCn5R/qFa6gT6QL03Y/1qcfNzCLAJt1sPZ08i0prID
 d+PRRbKPHSaL3iXU=
X-Received: by 2002:a05:600c:19cf:: with SMTP id
 u15mr5891742wmq.45.1635849539784; 
 Tue, 02 Nov 2021 03:38:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykeawxvx6bfayKvUepPf21+4UINAxY2GvERM+EexrDVyOcHBFWoYxiAKXSaZmBxwjDCvQC3A==
X-Received: by 2002:a05:600c:19cf:: with SMTP id
 u15mr5891714wmq.45.1635849539573; 
 Tue, 02 Nov 2021 03:38:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i13sm2427238wmq.41.2021.11.02.03.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 03:38:58 -0700 (PDT)
Message-ID: <343745d4-d60b-5f62-fef5-a00004a73f71@redhat.com>
Date: Tue, 2 Nov 2021 11:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 3/3] KVM: SVM: add migration support for nested TSC
 scaling
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20211101132300.192584-1-mlevitsk@redhat.com>
 <20211101132300.192584-4-mlevitsk@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211101132300.192584-4-mlevitsk@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/21 14:23, Maxim Levitsky wrote:
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   target/i386/cpu.c     |  5 +++++
>   target/i386/cpu.h     |  4 ++++
>   target/i386/kvm/kvm.c | 15 +++++++++++++++
>   target/i386/machine.c | 23 +++++++++++++++++++++++
>   4 files changed, 47 insertions(+)

It's easier to migrate it unconditionally:

diff --git a/target/i386/machine.c b/target/i386/machine.c
index e1138693f3..83c2b91529 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1286,8 +1286,7 @@ static bool amd_tsc_scale_msr_needed(void *opaque)
      X86CPU *cpu = opaque;
      CPUX86State *env = &cpu->env;

-    return env->amd_tsc_scale_msr &&
-           env->amd_tsc_scale_msr != MSR_AMD64_TSC_RATIO_DEFAULT;
+    return (env->features[FEAT_SVM] & CPUID_SVM_TSCSCALE);
  }

  static const VMStateDescription amd_tsc_scale_msr_ctrl = {

> +    if (env->features[FEAT_SVM] & CPUID_SVM_TSCSCALE) {
> +        env->amd_tsc_scale_msr =  MSR_AMD64_TSC_RATIO_DEFAULT;
> +    }

and also set it unconditionally here, so that it's always passed 
correctly to KVM.

I queued patches 2 and 3, for (1) I need to think more about migration 
to older QEMU versions.

Paolo


