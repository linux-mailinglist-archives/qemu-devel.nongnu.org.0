Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834196AF67C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:14:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZdhN-0000wk-ET; Tue, 07 Mar 2023 15:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZdhI-0000wD-74
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:14:08 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZdhG-0008H9-Kz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:14:07 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso7986486wmo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 12:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678220044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jXb7gGfjGLSJFrKKojTOIufzKngniDdZ5o60aPHqjJI=;
 b=UXEUzKMAUjYZlN0Ba9HmfEYCdyggI6xHlQFswtoDheXAx9zjQkGn8xmC18U/9EP3bO
 Yp6MFZFsoX3Xu8o3qmCoNggTkpGbc0TCk+NS+s72sCzBJxYm+9LHM/z0saO2NITq9It+
 3DsKlOiuxAv3aUiZ95U19fj4NUrBbRuSUC+ZrkUgX4++fyrSBSjl7ZITxIxmFkJ7T27T
 LazycATk7I5pNeKo8X+XKAVBdpsu2rC4U+a3k0qVsYu0tYgq9z7t010mzCrIrevv0tuC
 JxhyjtBwexaorKGgblmNz8+I9MbtH0y2tLHh78nz5BazM9g7xRXU1pl1aDeChVSi/m8a
 Vb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678220044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jXb7gGfjGLSJFrKKojTOIufzKngniDdZ5o60aPHqjJI=;
 b=wEvA9LepdDfKLFYTfYGvdFIM2HP9nIXVKRDQXZrNj5FOkugLakndGhy2J4lScnlnLw
 dESmEoz8q3yXjWeimm8lA1hPU09yY6bAs+4H3aD/CpMpR53BH6+R2LvNwn9Ne9xLHbLi
 qFeSxWUTo42+vhl1iKAaBOpulnmUW23x0mLprva6krP8/Sfx4sHLAVFI7RVJFE7DNJxP
 5QAZxAyiIrdr50b/HF7DMKkmDmpi6j1QbAHWQmdFwABGNOv2/MV6T9fYQA5KeM6ybaWM
 6w0z8e6SGeoeeN/xCEncLI5A5vbpI8mr9bd7MIv00J8MxbQpp+d3GY0U3NZUzoBE/mvH
 2/Kw==
X-Gm-Message-State: AO0yUKUtUNxED/eMl4HAc3kHbt7kiLtwfdyFnB+ak46vAqsUT8mDV+gs
 LrVbwS29g6Z4Vm7Dp573Z7zg8A==
X-Google-Smtp-Source: AK7set9yycrYlR4NRJxEUMU/BRyfrNtNytNdh6BJzrQ1605DbYzyRemnZIV6xprbyqVnWOLFkD99HA==
X-Received: by 2002:a05:600c:2199:b0:3eb:f59f:6daf with SMTP id
 e25-20020a05600c219900b003ebf59f6dafmr2624321wme.34.1678220044039; 
 Tue, 07 Mar 2023 12:14:04 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 t21-20020a1c7715000000b003e2096da239sm17137645wmi.7.2023.03.07.12.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 12:14:03 -0800 (PST)
Message-ID: <d300dc97-557c-a0ca-0206-02068655135c@linaro.org>
Date: Tue, 7 Mar 2023 21:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] MIPS Virt machine
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: QEMU devel <qemu-devel@nongnu.org>
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
 <67f67c63-3706-cb3f-94a8-beea99f62c05@linaro.org>
 <F2FD4D49-9513-4147-B8A2-07048C055A75@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <F2FD4D49-9513-4147-B8A2-07048C055A75@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/3/23 21:07, Jiaxun Yang wrote:
> 
> 
>> 2023年3月7日 15:01，Philippe Mathieu-Daudé <philmd@linaro.org> 写道：
>>
>> On 4/3/23 23:38, Jiaxun Yang wrote:
>>> Hi there,
>>> This patchset is to add a new machine type for MIPS architecture, which
>>> is purely a VirtIO machine.
>>
>>> Jiaxun Yang (2):
>>>   hw/misc: Add MIPS Trickbox device
>>>   hw/mips: Add MIPS virt board
>> Thanks, applied with following changes:
> 
> Thanks for those clean-ups!
> 
>>
>> - remove pointless mask in mips_trickbox_write(),
>> - declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE(),
>> - declare machine type using DEFINE_TYPES(),
>> - do not select PCI in Kconfig,
> 
> Hmm, PCI is sort of mandatory for this machine, any reason not to select it?

The machine itself doesn't expose a PCI bus directly, it
is exposed by the PCI_EXPRESS_GENERIC_BRIDGE.

We have PCI_EXPRESS_GENERIC_BRIDGE -> PCI_EXPRESS -> PCI.

