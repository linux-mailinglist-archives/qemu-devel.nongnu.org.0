Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E935674297
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaPU-00009x-0i; Thu, 19 Jan 2023 14:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIaPR-00009U-Rv
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:17:13 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIaPQ-0006WF-6p
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:17:13 -0500
Received: by mail-pl1-x633.google.com with SMTP id c6so3233133pls.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4aIR1803JxQEDZ4a88ke0Z/jtBLJPlvgWWKYT8SR2Pk=;
 b=rUL/at3fd0Rs+9PbeJbPoo0pXlSklYDgZ1CNPhksusmYyRMPM0bdAuTnkYqGdoApD0
 3crXqqsCDhG6lQGikpTbkWjNp4INqEh8sOFxep6sasku+JRsJ4TpJAIdWdPV304YoiCH
 R19kZS03DT2JBcgIYNkrVYIGW81++rq150e3RhW7Dh2bNiUn8GEMyxJ4cSS/blesJzq+
 7jO8Cy/2fcZv/6CgtJqe8gi+Kgc4xD5Mmqk/yWTthoFmc50uTtOV/wEXhNmOBhezRoCq
 B8A6H1d+QAb44pIcSUuB0AiwJvx9OLhBWmtGST6Ckb8WBtvn8A4C2fkg5PnpxGoId0J6
 to3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4aIR1803JxQEDZ4a88ke0Z/jtBLJPlvgWWKYT8SR2Pk=;
 b=q9mfF47oLTtBCSUTTwxjZhYuDszw/v5KPhaVNu5hmlIrxiV1S5HYfKEtbnKG7jn5WQ
 ew/McEUWPhZm38EKk/gKEalvDOxaujWp0HK70FW7W+V5tHVuh4VA9WM/8U1VKU1XikwU
 ZSqURDZKEWf1Dxnlu/iLK/FraKOsMWWGDi2UhH1p4fWy77i4nBKlw4WI1/W3w0l09XK0
 YfBimJhDvYnEc1g9EfpMluZA+8W/XbTNnFIEjWZIvBn1+gmOb2A3bU3WNpGfMyDmAunf
 SzgFh3QMw/IOR7beGmq32DnUwRKOOtrknFNSfk4zzNlBinAXx4rWVOetfzSMliNcXBrN
 vw1g==
X-Gm-Message-State: AFqh2krNfXXbc4mYvheJpHTny3GKTvnLl6qAUU/2JXC77yS6jXqOcrQe
 fX9H4jfbxhSPNNRIK3qLA3RgUg==
X-Google-Smtp-Source: AMrXdXsSuppHZZQCQyYn8iJwqC60UNuW7uiDY1bN9YBFegq9DmTOYUnSg0EyRCXNODwQuK9zv37txg==
X-Received: by 2002:a17:90a:3e46:b0:229:180a:a18c with SMTP id
 t6-20020a17090a3e4600b00229180aa18cmr12242441pjm.38.1674155830515; 
 Thu, 19 Jan 2023 11:17:10 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f14-20020a17090a664e00b0020aacde1964sm3358004pjm.32.2023.01.19.11.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:17:09 -0800 (PST)
Message-ID: <e8740dac-6c7c-8456-19cc-66fa7d2f6abc@linaro.org>
Date: Thu, 19 Jan 2023 09:17:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 01/15] target/arm: Move 64-bit TCG CPUs into tcg/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-2-farosas@suse.de>
 <6fb8d60e-4283-1429-fd15-f8b799d277cf@linaro.org> <87mt6e4a2e.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87mt6e4a2e.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/19/23 09:07, Fabiano Rosas wrote:
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 1/19/23 03:54, Fabiano Rosas wrote:
>>> Move the 64-bit CPUs that are TCG-only:
>>> - cortex-a35
>>> - cortex-a55
>>> - cortex-a72
>>> - cortex-a76
>>> - a64fx
>>> - neoverse-n1
>>>
>>> Keep the CPUs that can be used with KVM:
>>> - cortex-a57
>>> - cortex-a53
>>> - max
>>> - host
>>
>> All of those cpus can be used with kvm, if and only if you have matching hardware.  There
>> is no rationale for considering any of them differently.
> 
> But is that allowed by QEMU today? If so I must be missing something. I
> see that kvm_arch_init_vcpu looks at cpu->kvm_target, which is only set
> at kvm_arm_set_cpu_features_from_host, called from aarch64_host_initfn.
> 
>      if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
>          !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
>          error_report("KVM is not supported for this guest CPU type");
>          return -EINVAL;
>      }

Hmm, no, you're right.  It could guess that some of those could be marked 
KVM_ARM_TARGET_GENERIC_V8, but there's probably no point, since -cpu {host,max} are the 
only reasonable options to use with kvm, practically.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

