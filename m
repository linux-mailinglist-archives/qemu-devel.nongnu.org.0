Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC86F0261
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:14:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwkp-0005Pb-D5; Thu, 27 Apr 2023 04:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prwkm-0005PE-2b
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prwkk-0006wu-IA
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCAPonF+B5KseqL31ZXLjfYbe9GIRWvU3cm1t+r56b4=;
 b=AMqPlC4KFmU6cdJadVXJ1AGjqu+oHx8F1l5TPuEN96Kf4ThJIs+um1UK1JG344lQ4l6SpX
 2mXY1EAB5VzjtmsgeV2VPvD/H4QvF8Wfz1Hz4WbkbazBUPqKM9mgdz9P+ktA8iUGUFEvdA
 ZszQLjAMOuvQuZbtXLIlOUPCxprJnP4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-74w2Gbf0NWeJiK2LxVSP1g-1; Thu, 27 Apr 2023 04:13:20 -0400
X-MC-Unique: 74w2Gbf0NWeJiK2LxVSP1g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f17b8d24bbso51870795e9.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682583199; x=1685175199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BCAPonF+B5KseqL31ZXLjfYbe9GIRWvU3cm1t+r56b4=;
 b=G1GF+MfYDoF97gV0K1qEMm8kueZQjJaEOE0BUhHYl8/GYStMwa9juovTPu7ZJWkomm
 qV1SnLZW1Jr0e6SXocA975Vha2ybiaCezilfWzun04X+qxygRvhpHR77FlxmTsdWFLkZ
 6r/jfaaIWrHeuKfPJgT57l76bPUhXvDOP9tumXkShbEWQ6QAHAes3yrU9YTrN5U0uZ2E
 labykNwOXAIQIeZIsoBRTDUTY8xlthb9ALl8aGHYyowX/9N/na2jS4l5zroZz1cJpMlB
 KHzOzw7Pzhb4rMEHXXSQFOAHHeaIknO+pcwgMO2QMPfPYA3CzDY+t3F6sfDWwjTj+zzv
 34Wg==
X-Gm-Message-State: AC+VfDyrrq7LUKVhyY8CYLHg4Th30CP020K0PPEi0aw68j21PdXrzKB2
 Z1GK5Gmxol8LV0mbIIexL+pVuUc7QDekLiRHAOExoCHgF1Y8NmlkWw61f3Y9pa25S2VG2Sz34Ww
 gzmH2zHi9U+PbroI=
X-Received: by 2002:a7b:c5d9:0:b0:3f1:8992:3618 with SMTP id
 n25-20020a7bc5d9000000b003f189923618mr790525wmk.13.1682583199085; 
 Thu, 27 Apr 2023 01:13:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Ye0y+8vplLexXVKXq4qtqRqA82NzgZB2a9J13UzdatJlHrdxPUah0CI2v0Aia1tG/RAulHg==
X-Received: by 2002:a7b:c5d9:0:b0:3f1:8992:3618 with SMTP id
 n25-20020a7bc5d9000000b003f189923618mr790480wmk.13.1682583198296; 
 Thu, 27 Apr 2023 01:13:18 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a05600c444f00b003f09cda253esm24045707wmn.34.2023.04.27.01.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 01:13:17 -0700 (PDT)
Message-ID: <f0c9cd0b-d1f4-4fb8-1f47-6506a09a56e0@redhat.com>
Date: Thu, 27 Apr 2023 10:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/3] Deprecate the qemu-system-i386 binary
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230425133851.489283-1-thuth@redhat.com>
 <5fc11d22-275d-cc8d-bf9c-f1c015cbee23@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <5fc11d22-275d-cc8d-bf9c-f1c015cbee23@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/04/2023 12.59, Paolo Bonzini wrote:
> On 4/25/23 15:38, Thomas Huth wrote:
>> - CPU types have different suffixes between the -x86_64 and -i386
>>    variant (see TYPE_X86_CPU in cpu-qom.h) ... do we need to care
>>    about this in the new qemu-system-i386 symlink run mode?
>>
>> - The code in target/i386/tcg/sysemu/smm_helper.c looks like it
>>    maybe needs a runtime switch, too ... or is it ok to leave this
>>    hard-coded to the x86_64 version?
> 
> Yes, it would have to switch based on the CPU's LM feature.

Ok. BTW, what happens if you run qemu-system-x86_64 with -cpu lm=off today? 
Isn't that a problem already?

>> Anyway, I'd like to get some feedback on this idea here... What
>> do you think of the idea of getting rid of the qemu-system-i386
>> binary this way in the future?
> 
> I wonder if we should take this a step further and rename qemu-system-x86_64 
> to qemu-system-x86!  Distros can if they wish create symlinks to both 
> qemu-system-i386 and qemu-system-x86_64.
> 
> Then we would name the CPUs "foo-x86" and alias them to foo-x86_64 and, if 
> they don't have LM set, to foo-i386 as well.

I like the idea! ... we could maybe even go a step further and change the 
default machine to "q35" in the -x86 binary (or use no default machine at 
all), and switch back to "pc" as default if running in -x86_64 or -i386 mode...

  Thomas


