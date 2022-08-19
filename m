Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7DF599EF3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 18:25:50 +0200 (CEST)
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4oe-0004Ks-L7
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 12:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oP4mY-0002CM-EQ
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:23:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oP4mU-0004yR-OS
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660926214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oPAjnFu01dQcQk8IS+Xm+P8qEOzZ7fyhjYJLhrFx/b8=;
 b=On2f1McBRLBpho7q2aArwBX5MIlziB4cVRWQn0rAGcwhB85Nc+9CDi/5+9LHwdQyMT8sba
 3wZzv4arYlrq/vgX69s/srM79tTOy8DsG25HENFHRlHlxiMSdZ8HMRJF22NpOK1IyeRnQV
 xMUnBpyec44dL9WmdjlurxTUh8PCiw4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-372-pecRMRpzMOCITC65G7ptkg-1; Fri, 19 Aug 2022 12:23:32 -0400
X-MC-Unique: pecRMRpzMOCITC65G7ptkg-1
Received: by mail-ej1-f70.google.com with SMTP id
 gn23-20020a1709070d1700b0073094d0e02cso1724924ejc.20
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 09:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=oPAjnFu01dQcQk8IS+Xm+P8qEOzZ7fyhjYJLhrFx/b8=;
 b=Oif/n5aZtp3f0faWdsc5+qg/c27ZEeg35TMmJRuf3ocsY1icpBk31rSr0IQr8WoDM2
 96jJ2tb8BGme1XX+s9t4vftEzhTbrSU5xDvm5bzExIyrtwbg5EK/TungdIwvTTe2ooi2
 9TigPkZ7hKqdeldlMj5bVaKB6RsLmJbwgZVQH0iH4+mfQboEN6xBvFufNaobKluVoozi
 OxBJEspPTCTEo8AHm2a3MdgIwHdEBclUiyrZksP1rRkUj0ZJddIYLuOS28ZHn/sDweut
 IoTOWGkYiGe64eMalSAA490UxsPCmjTZosEPNIuz4ep0+34nLIgt61ZO7GgeaOrgploM
 v9BA==
X-Gm-Message-State: ACgBeo1GeapJpyGX15w+uqXd+Eiz81Gsmu6U66sOsDyWkDc173YN6XFX
 pGNm4N6NDJLt6qfp14DsktZFiIeZOgKDcEQsBpN9DA3qqhcHHgB99on0Spu02jT2tCSHZHniGyW
 YsUG9r4rkKrUuqz4=
X-Received: by 2002:a05:6402:369a:b0:43d:75c5:f16c with SMTP id
 ej26-20020a056402369a00b0043d75c5f16cmr6525130edb.57.1660926211273; 
 Fri, 19 Aug 2022 09:23:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6IjPLXi1LBylbfR3J4DXUjQOIft9DKXGy4wE7h2PgE2FTWjB0+X4+YpDPGpeFEM/3Bc6SaLw==
X-Received: by 2002:a05:6402:369a:b0:43d:75c5:f16c with SMTP id
 ej26-20020a056402369a00b0043d75c5f16cmr6525119edb.57.1660926210913; 
 Fri, 19 Aug 2022 09:23:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a1709067cc700b0072f112a6ad2sm2567271ejp.97.2022.08.19.09.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 09:23:30 -0700 (PDT)
Message-ID: <7e96c349-86d9-9b0c-24a3-d4394aa28f7a@redhat.com>
Date: Fri, 19 Aug 2022 18:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 0/2] i386: KVM: Fix 'system_reset' failures when vCPU
 is in VMX root operation
Content-Language: en-US
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
 Sean Christopherson <seanjc@google.com>
References: <20220818150113.479917-1-vkuznets@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220818150113.479917-1-vkuznets@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/18/22 17:01, Vitaly Kuznetsov wrote:
> Changes since RFC:
> - Call kvm_put_msr_feature_control() before kvm_put_sregs2() to achieve
>   the same result [Paolo].
> - Add Maxim's R-b to PATCH1.
> 
> It was discovered that Windows 11 with WSL2 (Hyper-V) enabled guests fail
> to reboot when QEMU's 'system_reset' command is issued. The problem appears
> to be that KVM_SET_SREGS2 fails because zeroed CR4 register value doesn't
> pass vmx_is_valid_cr4() check in KVM as certain bits can't be zero while in
> VMX root operation (post-VMXON). kvm_arch_put_registers() does call
> kvm_put_nested_state() which is supposed to kick vCPU out of VMX root
> operation, however, it only does so after kvm_put_sregs2() and there's
> a good reason for that: 'real' nested state requires e.g. EFER.SVME to
> be set.
> 
> The root cause of the issue seems to be that QEMU is doing quite a lot
> to forcefully reset a vCPU as KVM doesn't export kvm_vcpu_reset() (or,
> rather, it's super-set) yet. While all the numerous existing APIs for
> setting a vCPU state work fine for a newly created vCPU, using them for
> vCPU reset is a mess caused by various dependencies between different
> components of the state (VMX, SMM, MSRs, XCRs, CPUIDs, ...). It would've
> been possible to allow to set 'inconsistent' state and only validate it
> upon VCPU_RUN from the very beginning but that ship has long sailed for
> KVM. A new, dedicated API for vCPU reset is likely the way to go.
> 
> Resolve the immediate issue by setting MSR_IA32_FEATURE_CONTROL before
> kvm_put_sregs2() (and kvm_put_nested_state()), this ensures vCPU gets
> kicked out of VMX root operation.

Queued, thanks.

Paolo


