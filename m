Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A54DAF8C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:23:19 +0100 (CET)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSgQ-0006cU-UX
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:23:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUSbW-00033Y-W1
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:18:15 -0400
Received: from [2a00:1450:4864:20::532] (port=36604
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUSbV-00083U-9y
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:18:14 -0400
Received: by mail-ed1-x532.google.com with SMTP id t1so2480622edc.3
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qxrcwQDo0hV9BWWx1QaHiMAoULFh+feZuHi9EQgJcE8=;
 b=gqKOLaWvuI0TP6cHJ07ZXbrJgWA1+O4w9FbgeoOyGl3FvUXcL2CwmLzrfeLNuJpZXs
 by0cVoUOliECFv6WB1fajR8WQUJo4jHR/5xu7ahvajx5VluLUMOXrLCO2pl5DI9cSyL+
 L3bCQA//Yos23SiyLfLTLyD5NiWu6mxzr8O1eiOs7+XamevLNoqSHZ23AHKn6Q7SUag9
 nk9SFhmPVocmw8kdQrJBxZ1hnDVj+W5p8Ae1PGDueRG/QmDVjjErMXbS1zlfpg3uI5es
 vZy6b6dLJZrcleCuQwzHoBc0jYQBSIhkJc/sw+Ln9QBt3ZgUkahjBEtTkstI6f2IZsxi
 GqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qxrcwQDo0hV9BWWx1QaHiMAoULFh+feZuHi9EQgJcE8=;
 b=xERePZXSqwbpM5W73nsVFsyNWnoknDxFH+Mu6t8TxI8CfidCSLTI1+/fsDqOJuGdL+
 L32Cj/pgmJoXzkwfm1d8YtNLl0Z/lhiJrP/dgV7LPxWzEpyWESDrRVk6mqiCuX0RnhEV
 qTsiH+Yl53zVUdL75PTSFjgAz6m/fSOYwsTnZDznc+hyzk3zj9zRCgQNNji6wcBVuswZ
 AAs7Z0cs44w+W0nyhEi24Mk+nqcOjUKn5XCt82u5qjutOuxcfoa55/3dcdebhN+geuD3
 X+9o7FhPplbP/Stxzp9BpQuQXgjdz6TNXgrjd9kJz+MoaqwLyb+ixDCpfDd+xeajLNAd
 2RUQ==
X-Gm-Message-State: AOAM533uiqZaqZPXSSDL3PA9Eoy/aTRjx5bMRsstgoEW6gV3oxKe02Cg
 4aUfI/O4ieA3hizqMhcf6ps=
X-Google-Smtp-Source: ABdhPJxosG1ED69FU/pUVOSF3toqmIiIMI3QvC4k79oU/BRF9D2tybSiUsh+SLX86bqugjjSeFhewA==
X-Received: by 2002:a05:6402:358c:b0:418:3377:a5f8 with SMTP id
 y12-20020a056402358c00b004183377a5f8mr22596837edc.27.1647433090493; 
 Wed, 16 Mar 2022 05:18:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 q5-20020aa7cc05000000b004129baa5a94sm891308edt.64.2022.03.16.05.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 05:18:10 -0700 (PDT)
Message-ID: <de2b3a0b-5c1e-1cb3-ca97-c67f7272036c@redhat.com>
Date: Wed, 16 Mar 2022 13:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 0/8] s390x and misc fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20220315112052.515467-1-thuth@redhat.com>
 <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 19:58, Peter Maydell wrote:
> On Tue, 15 Mar 2022 at 11:20, Thomas Huth <thuth@redhat.com> wrote:
>>
>>   Hi Peter!
>>
>> The following changes since commit 352998df1c53b366413690d95b35f76d0721ebed:
>>
>>    Merge tag 'i2c-20220314' of https://github.com/philmd/qemu into staging (2022-03-14 14:39:33 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-15
>>
>> for you to fetch changes up to 36149534792dcf07a3c59867f967eaee23ab906c:
>>
>>    meson: Update to version 0.61.3 (2022-03-15 10:32:36 +0100)
>>
>> ----------------------------------------------------------------
>> * Fixes for s390x branch instruction emulation
>> * Fixes for the tests/avocado/boot_linux.py:BootLinuxS390X test
>> * Fix for "-cpu help" output
>> * Bump meson to 0.61.3 to fix stderr log of the iotests
>>
>> ----------------------------------------------------------------
> 
> This results in every "Linking" step on my macos box producing the
> warning:
> 
> ld: warning: directory not found for option
> '-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0'
> 
> Obvious suspect here is the new meson version.
> 

Can you send the meson-logs/meson-log.txt and build.ninja files?  Thanks,

Paolo


