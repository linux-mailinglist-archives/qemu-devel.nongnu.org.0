Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD76D6C628F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 10:02:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfGod-00052o-Nc; Thu, 23 Mar 2023 05:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pfGob-00052e-Uf
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:00:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pfGoZ-00068l-6N
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679562053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJ2IwegNNAOBYB+5if/LjLO724awVPBVwJNcE1y1qSc=;
 b=YA6WGDiKdQTqf0kU94bcI0vFbfnQi6TFzQyYeHQEAc77hzzyfzql+lxwjgjiDFCXCmWwer
 tdieAXXlNPED8a1RAZWA9QvKIRgpNZq0pxM76yCjK1YMj6NX3bu+TZ4vduyTAXwr+LwsXd
 Q/gGH08dfAiwawgFbO2qG9rRW+9rNHY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-CFAT76EOMO6ulWFJYC-ovw-1; Thu, 23 Mar 2023 05:00:51 -0400
X-MC-Unique: CFAT76EOMO6ulWFJYC-ovw-1
Received: by mail-wr1-f71.google.com with SMTP id
 e15-20020adfa44f000000b002d7ea9d6ef0so1199347wra.8
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 02:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679562050;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJ2IwegNNAOBYB+5if/LjLO724awVPBVwJNcE1y1qSc=;
 b=t432ABnWnZqf9C0LDjN2ZRd/hY7Za6aV/a79NSE6l8OjIC+du3ZGJTkAR8BQsprt3T
 ds2JZ7nIDjDeHtD2jtPSHsixGqFFjUbIQhqBLMbUrhFa8MaOQ445/Jrd+50zNbrFYme1
 8v9OEh2L0dLmLITkULpik2gGusOzvRjez24NoMaXdeetTltp5SqP3yaE4hSvPSx5XZNk
 LY/m4/jma0A2GLoPrhrdpwpIWuPs/ZOsPflCm+H1C31eWpq8+9EKt6uGa37mo87N34rp
 46VDMZIDGln5GLAppTQcPhEf7uD+SrZDriEkx/ZInVDnBe1Oa7Q2++QG8Bno5dmu5cjq
 votg==
X-Gm-Message-State: AAQBX9dCCXtg/Et8nNoH0rmV9oCfRtg+o6Wpih4DPyFNcjb75SBT2NQ+
 68KuWWoQbtw69Q3zGOgeb1uMORinCBcog/nGtOfCA5wA3DulVC/Xf9ziudvK7U/dXUHwEh5DZ5h
 jvV0rv1dSrVXcnyk=
X-Received: by 2002:a5d:4e8f:0:b0:2d2:e9d3:2b72 with SMTP id
 e15-20020a5d4e8f000000b002d2e9d32b72mr1976904wru.35.1679562050681; 
 Thu, 23 Mar 2023 02:00:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350YxZRDNOEDZYC3rtLEEQn9BVzbFabuQUs0OcroBktwkSlAD4yP/mOjCLMdkW7dBtHl6Lt1t7Q==
X-Received: by 2002:a5d:4e8f:0:b0:2d2:e9d3:2b72 with SMTP id
 e15-20020a5d4e8f000000b002d2e9d32b72mr1976878wru.35.1679562050354; 
 Thu, 23 Mar 2023 02:00:50 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adfe889000000b002d97529b3bbsm5336405wrm.96.2023.03.23.02.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 02:00:49 -0700 (PDT)
Message-ID: <4784948c-1a92-1991-d6a2-b4d1ee23136c@redhat.com>
Date: Thu, 23 Mar 2023 10:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL 034/126] softmmu: Extract watchpoint API from physmem.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Bharat Bhushan <bbhushan2@marvell.com>
References: <20230227140213.35084-1-philmd@linaro.org>
 <20230227140213.35084-25-philmd@linaro.org>
 <c8c3c74f-53e6-6b3f-756f-b9c2eaa389a0@linaro.org>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <c8c3c74f-53e6-6b3f-756f-b9c2eaa389a0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23.03.23 09:54, Philippe Mathieu-Daudé wrote:
> On 27/2/23 15:00, Philippe Mathieu-Daudé wrote:
>> The watchpoint API is specific to TCG system emulation.
> 
> I'm seeing CPUWatchpoint being used by KVM:
> 
> $ git grep CPUWatchpoint|fgrep kvm
> target/arm/kvm64.c:1558:        CPUWatchpoint *wp =
> find_hw_watchpoint(cs, debug_exit->far);
> target/i386/kvm/kvm.c:5216:static CPUWatchpoint hw_watchpoint;
> target/ppc/kvm.c:443:static CPUWatchpoint hw_watchpoint;
> target/s390x/kvm/kvm.c:139:static CPUWatchpoint hw_watchpoint;
> 
> Scrolling a bit in git-history:
> 
> commit e4482ab7e3849fb5e01ccacfc13f424cc6acb8d5
> Author: Alex Bennée <alex.bennee@linaro.org>
> Date:   Thu Dec 17 13:37:15 2015 +0000
> 
>       target-arm: kvm - add support for HW assisted debug
> 
>       This adds basic support for HW assisted debug. The ioctl interface
>       to KVM allows us to pass an implementation defined number of break
>       and watch point registers. When KVM_GUESTDBG_USE_HW is specified
>       these debug registers will be installed in place on the world switch
>       into the guest.
> 
> So it seems I missed something big.
> 

Looks like :)

Yes, s390x also uses CPUWatchpoint to translate between a watch-point 
hit in kvm to a watchpoint hit in QEMU on KVM debug exits.

-- 
Thanks,

David / dhildenb


