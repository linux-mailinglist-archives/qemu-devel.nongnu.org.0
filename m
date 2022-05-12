Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E2D524F70
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 16:07:24 +0200 (CEST)
Received: from localhost ([::1]:36254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np9TP-00069e-CG
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 10:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1np9RZ-0004Th-84
 for qemu-devel@nongnu.org; Thu, 12 May 2022 10:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1np9RX-0005up-GV
 for qemu-devel@nongnu.org; Thu, 12 May 2022 10:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652364325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qCrooXOGXJB98zMjXfDQyC7coaMtKGNi8zEGsPvgR3g=;
 b=K5TA2/TKprh1+yH+OO8sEHUPiPItMrUfesty7yWMFdf+UlH7rx+h1NpC/+lUURayRDI6SR
 Y8fKGGPgTN3hyA0zL8htM5xR/9HYedIXIL7VAp7HoauKWb2u0bSQkLqygJuxVV2rdOxKwP
 yihbYs0dKf9G8XgHot2NxlRsYdXgnvI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-NhOjYgFVMY-i1Uf0AtNOAw-1; Thu, 12 May 2022 10:05:24 -0400
X-MC-Unique: NhOjYgFVMY-i1Uf0AtNOAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso4439028wma.6
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 07:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qCrooXOGXJB98zMjXfDQyC7coaMtKGNi8zEGsPvgR3g=;
 b=svMkPoURu6UdkU22XUWKgac8vQJ7YifRoGp/m6UYBecyRE7C0czqf4kLkFS6V8PbFe
 hyTtqII9bYHkkxMtOlK2ruE3c1MZ3baA5IoW/U0av578yMcDCXDrsKZ0VJE2ETDivloC
 vdjyal3wf08HyzpAh408p1brKOdwdSQCV/t+KVw5F+7g+pbyGtFth5ZEeq4zLIB6/rbb
 iiTUfuF/YM810u+aiwGX1lVkQHMdWU8mPK6tQd2zKzX+yBq8NuSjLCTPpqRuv2tVUMAK
 BkmcO+bLE1BomjvlhueyaYhrzdIg6BXKLaNuk7TDDedQESi5Ji9hDbqrx5WKSlPSIchg
 Y3jg==
X-Gm-Message-State: AOAM531bbg6GSNfMs4lCkouTyRlzOhsfoe2bG4jsk2CrDz3+H72XNGfI
 GrNkqvJGXtJJOpoyd5UkQ8baj0hWyRDJEenAoYjRRYE30R905eInHNKFE74ddXzdRZrVEmqTcHo
 Dcj2yvfo8+SAdYpDn/CJqMFjX0uW284rD0nhKS0wgZj+ZAYWCfX/Pqzi6i9OzRDLLtns=
X-Received: by 2002:adf:f3cb:0:b0:20a:e4e6:6633 with SMTP id
 g11-20020adff3cb000000b0020ae4e66633mr27903880wrp.512.1652364322934; 
 Thu, 12 May 2022 07:05:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrbBBuqhCOHts/AB5wMhVE75zgxQRmqeGf6wphzPQJKo39MRRA+b25KJZhQ/+8xBRCerkvkQ==
X-Received: by 2002:adf:f3cb:0:b0:20a:e4e6:6633 with SMTP id
 g11-20020adff3cb000000b0020ae4e66633mr27903848wrp.512.1652364322515; 
 Thu, 12 May 2022 07:05:22 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a7bc1d2000000b003942a244ee2sm2731791wmj.39.2022.05.12.07.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 07:05:22 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] vmxcap: add tertiary execution controls
In-Reply-To: <20220511165244.336750-1-pbonzini@redhat.com>
References: <20220511165244.336750-1-pbonzini@redhat.com>
Date: Thu, 12 May 2022 16:05:21 +0200
Message-ID: <8735heyhge.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/kvm/vmxcap | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
> index f140040104..ce27f5e635 100755
> --- a/scripts/kvm/vmxcap
> +++ b/scripts/kvm/vmxcap
> @@ -23,6 +23,7 @@ MSR_IA32_VMX_TRUE_PROCBASED_CTLS = 0x48E
>  MSR_IA32_VMX_TRUE_EXIT_CTLS = 0x48F
>  MSR_IA32_VMX_TRUE_ENTRY_CTLS = 0x490
>  MSR_IA32_VMX_VMFUNC = 0x491
> +MSR_IA32_VMX_PROCBASED_CTLS3 = 0x492
>  
>  class msr(object):
>      def __init__(self):
> @@ -71,6 +72,13 @@ class Control(object):
>                  s = 'yes'
>              print('  %-40s %s' % (self.bits[bit], s))
>  
> +# All 64 bits in the tertiary controls MSR are allowed-1
> +class Allowed1Control(Control):
> +    def read2(self, nr):
> +        m = msr()
> +        val = m.read(nr, 0)
> +        return (0, val)
> +
>  class Misc(object):
>      def __init__(self, name, bits, msr):
>          self.name = name
> @@ -135,6 +143,7 @@ controls = [
>              12: 'RDTSC exiting',
>              15: 'CR3-load exiting',
>              16: 'CR3-store exiting',
> +            17: 'Activate tertiary controls',
>              19: 'CR8-load exiting',
>              20: 'CR8-store exiting',
>              21: 'Use TPR shadow',
> @@ -186,6 +195,14 @@ controls = [
>          cap_msr = MSR_IA32_VMX_PROCBASED_CTLS2,
>          ),
>  
> +    Allowed1Control(
> +        name = 'tertiary processor-based controls',
> +        bits = {
> +            4: 'Enable IPI virtualization'
> +            },
> +        cap_msr = MSR_IA32_VMX_PROCBASED_CTLS3,
> +        ),
> +
>      Control(
>          name = 'VM-Exit controls',
>          bits = {

Not sure which particular CPUs are going to implement this (whould be
nice to add this info to the blurb) but this matches Intel doc
(https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html)
and "IPI virtualization support for VM" series for KVM, so

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly


