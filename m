Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0544E3F97
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:33:05 +0100 (CET)
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWedE-0000Vf-W4
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:33:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWecJ-0008GL-Nh
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:32:07 -0400
Received: from [2a00:1450:4864:20::32d] (port=45849
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWecH-0004on-W5
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:32:07 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso1734472wmz.4
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 06:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d2iR2FoNdBn4DNZV9E+JHPz0SVO4EksRjf/jzISZbwc=;
 b=bT4wM8xwSq/LWeAqn3HOWG6B46wsIBcMDYOBgjaronhdk7SqiPpKgzIi2j681Zq8C1
 jSQ0Ax9DLT9hykowEOvUsXlk8jzK3KfdBvtKbypnnAp/8z1TmjmzR9pOqGY7zmBaRSRU
 tOBe7MWAFLmKXDZNKc5EGnej1i25Hj16s7b2EwV/QNvJ++85KdlOGU9Ri+NAZydHZjRO
 Y3P9fv7UoOLGKYfq24mNP2vH0zT97l3ijJEh4sL7td3O9kNGR2lOe99GqMbatnLyKRh4
 C56LAK3SBLBaPelabXezIQBffvuMwMNiZek8ZpixDiHUOOWmfPXC26SNr0hgnt5BQbEN
 c2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d2iR2FoNdBn4DNZV9E+JHPz0SVO4EksRjf/jzISZbwc=;
 b=ELfEZHC2ZfYZTpFNo2lWvlYyzz/lzYy+JC//WisnQAMntHqcB5djRY/NM5w8hOq0jm
 ZbpyOSbXkf0Jw/kowBJlELWT7ZSRt71+kEO2qkbL1t31B3NCP2jO5vEcWRsDKxDpQYsS
 P5dzh01aFuRktHnH18riBWLqmBoBSMoD2FJKZW38v0xO7WWp1EXdx2F4kZFfF24hBFRY
 qj3ePpis2Wgg9IK8VBDg5/CdfciQioIFaajha0Uyi4T7gNxxxu7QJBfeqLZRPSylEn1D
 1nfqQ0QlSVUrx2yRJfCKQv7IXQcfR+n1J9j5DEINwR7RY2Joi8ZDVKICDlgoHLwwJZ8Z
 JnIQ==
X-Gm-Message-State: AOAM532nOXigH4A6WuSpXizUZI/fkcGDX1gx3FqhhQMxd/548PevG0J5
 9/GMt+69e04hz3a4DFC4BSs=
X-Google-Smtp-Source: ABdhPJxagaFZS78aYtib9c+JvgLVNOr9Q7qw+yTZryQkpsGM8eFCJk9hTWojMhuuZ4DBam5TADJC4g==
X-Received: by 2002:a05:600c:4f04:b0:38c:72f0:1c37 with SMTP id
 l4-20020a05600c4f0400b0038c72f01c37mr3744896wmq.201.1647955924239; 
 Tue, 22 Mar 2022 06:32:04 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c4f5400b0038b5162260csm3356052wmq.23.2022.03.22.06.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 06:32:03 -0700 (PDT)
Message-ID: <ef2dc982-1434-affd-c4e3-894258b13469@gmail.com>
Date: Tue, 22 Mar 2022 14:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/5] softmmu/cpus: Free cpu->halt_cond in
 generic_destroy_vcpu_thread()
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
 <20220321141409.3112932-4-mark.kanda@oracle.com>
 <652c4cf9-65d4-33fb-805e-07d156271ccb@gmail.com>
 <41ab0621-fd01-9d1e-f8f6-d434b80aca8e@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <41ab0621-fd01-9d1e-f8f6-d434b80aca8e@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/3/22 13:52, Mark Kanda wrote:
> Thanks Philippe,
> 
> On 3/21/2022 5:12 PM, Philippe Mathieu-Daudé wrote:
>> On 21/3/22 15:14, Mark Kanda wrote:
>>> vCPU hotunplug related leak reported by Valgrind:
>>>
>>> ==102631== 56 bytes in 1 blocks are definitely lost in loss record 
>>> 5,089 of 8,555
>>> ==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
>>> ==102631==    by 0x69EE4CD: g_malloc0 (in 
>>> /usr/lib64/libglib-2.0.so.0.5600.4)
>>> ==102631==    by 0x924452: kvm_start_vcpu_thread (kvm-accel-ops.c:69)
>>
>> Here we want to extract a common generic_init_vcpu_thread().
>>
> 
> How about I add extracting 'generic_init_vcpu_thread()' as a separate 
> cleanup patch at the end? I'll also drop my xsave_buf patch due to your 
> followup.

I plan to queue patch #4 for v7.0, but I'd rather have the first ones
reworked by extracting the common vcpu_thread_create() code (which
only differs in TCG/RR). I'll give it a try and send a respin later
today.

