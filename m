Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6C0115535
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 17:25:56 +0100 (CET)
Received: from localhost ([::1]:40830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idGQU-0003dl-ST
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 11:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1idF9J-000419-Qq
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:04:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1idF9I-0001mB-N2
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:04:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24014
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1idF9I-0001jJ-IR
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575644642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xu6TG8bRrU5Xm9Ytckrjk+EDTC9su5c/kXa41oBjr74=;
 b=W2m6DHl5qFI2MxcdCO2XcpdqW372MBmJr5NP+D2KFcF0lb+wVCeNSXK6o3kvB0XYrxMxdU
 kG10aCPHm7eLDJ+xZOt6IbABpFAy3ehYFdOlST4wcFQGdYSIiLv+uOFLMNm5UPwUn8Ctr1
 sNEBBe2FTxjJmoOjM2arGp7hp1sd4QA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-lZKRn4FzNN6_dJSodWBWZw-1; Fri, 06 Dec 2019 05:02:50 -0500
Received: by mail-wr1-f72.google.com with SMTP id z15so2954619wrw.0
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 02:02:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xu6TG8bRrU5Xm9Ytckrjk+EDTC9su5c/kXa41oBjr74=;
 b=AdL72oTgeQKQvJRrGra6Y/ZaPLEFJiwccQ/j7Xra+W/3qRDmylB3G6pNVACtHgW/Pn
 9d11fUZeqvvpsffktVK2tKRyYuHP75jSpWTiBt0uN1MqfzHOwOYilsl8wcMRVklFltBY
 7KzR/uzIM7i0JbC9bAXkI3DCPnxN88XYrJWuoeK8zecn1J8OBtJRhCX5lTVi7O1n2GI8
 F5HKrv5ZEBkwDUsAuC43Ba8d+LI6AV8/Zr/dJT6ptI9vK6SR+bPq+k285YJDOfQHejWb
 J2j4pVoStqdnxMk0tUU47GYtYMroAEVmeJLYJEQKMneV2Gfyt81QtXN7Y7u9YfHR7ili
 Jcfw==
X-Gm-Message-State: APjAAAVd32z0GDojVcOUR2tN0u1/vU7ivRcIXozNvr7nOMt9thnOAncI
 7Sm4o6RitJuNtbF4DwRHcrD3dwTulUJZbvMXfzF1B8evPyg68TSoT1R71fWqvpZDTIeQPvLWrbW
 hU9tFmdgdsJo4K4I=
X-Received: by 2002:adf:f885:: with SMTP id u5mr15133452wrp.359.1575626569065; 
 Fri, 06 Dec 2019 02:02:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqxfjqlBWsnmhtM1edPSxVAKWQK0D6tSoo2KGI386CB0kQXwuZ4cz4Afi10Rfj9JZOMJc4hPaQ==
X-Received: by 2002:adf:f885:: with SMTP id u5mr15133431wrp.359.1575626568850; 
 Fri, 06 Dec 2019 02:02:48 -0800 (PST)
Received: from [10.201.49.168] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id q6sm16604130wrx.72.2019.12.06.02.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2019 02:02:48 -0800 (PST)
Subject: Re: [PATCH] target/i386: disable VMX features if nested=0
To: Yang Zhong <yang.zhong@intel.com>
References: <20191206071111.12128-1-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5e9a669a-f81d-fbfb-4486-246949dc48c6@redhat.com>
Date: Fri, 6 Dec 2019 11:02:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191206071111.12128-1-yang.zhong@intel.com>
Content-Language: en-US
X-MC-Unique: lZKRn4FzNN6_dJSodWBWZw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/19 08:11, Yang Zhong wrote:
> If kvm does not support VMX feature by nested=0, the kvm_vmx_basic
> can't get the right value from MSR_IA32_VMX_BASIC register, which
> make qemu coredump when qemu do KVM_SET_MSRS.
> 
> The coredump info:
> error: failed to set MSR 0x480 to 0x0
> kvm_put_msrs: Assertion `ret == cpu->kvm_msr_buf->nmsrs' failed.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  target/i386/kvm.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index bf1655645b..e8841dcdb9 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -2572,6 +2572,14 @@ static void kvm_msr_entry_add_vmx(X86CPU *cpu, FeatureWordArray f)
>      uint64_t kvm_vmx_basic =
>          kvm_arch_get_supported_msr_feature(kvm_state,
>                                             MSR_IA32_VMX_BASIC);
> +    if (!kvm_vmx_basic) {
> +        /* If the kernel does't support VMX feature(nested=0 in kvm)
> +         * and kvm_vmx_basic will be 0. This will set 0 value to
> +         * MSR_IA32_VMX_BASIC MSR.
> +         */
> +        return;
> +    }
> +
>      uint64_t kvm_vmx_misc =
>          kvm_arch_get_supported_msr_feature(kvm_state,
>                                             MSR_IA32_VMX_MISC);
> 

Queued, thanks.

Paolo


