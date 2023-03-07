Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B906AF85D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 23:16:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZfaL-0005io-Rn; Tue, 07 Mar 2023 17:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZfaC-0005hj-D8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 17:14:57 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZfaA-0001JU-H2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 17:14:56 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso64631wmp.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 14:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678227291;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eOv48FgVEhYe6GqBjJkUC+FBPNo2gNENsFHWr4+hpjs=;
 b=mrUEdNxEGa2zu7VAeN2g01Txv2sXtDXgTYg2EsY0pO0GUktIUgy/hJmfBjFbtQWNjw
 RtwYy5Y8RUK7j80IxlnZoc+FnUF+3iMtf7EY92jW2NdMDcO43xDStMGXPQy6KF5hhWzK
 dVxT1OqS0g6/CJjQbMEQxAqvVTd5c/VZxAY/+EpCeCThfeZk2mr3TdKM4p+P10ILfqwZ
 gq2nG75LM9u5bevKyhXygvrCWZfbV1OBA9Shn4Hk0eOhwhz69lRmzN8tcTN3b9Onxu8P
 pLUrZ/N10ppaJD/d06VnED+4SE0aL3Rkh/0SuLtNtTVOUR4x2BXEt/bmYDfer8enSL6x
 XxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678227291;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eOv48FgVEhYe6GqBjJkUC+FBPNo2gNENsFHWr4+hpjs=;
 b=PfxLf0FYNd0iG9z+B6rw6RC3+ZodJ194O7G502XdBTDCmkISTfHuGPuIwqy7eU5sOj
 mAL3Jjdq0gslcfHp1hz1uJYqXPQeUFbX9RXEtPDx7AW8sb2/w2UUUlshrrVNV/oMt+ZT
 jQLLdH+ns3N28eRuYfvr1Mcgg3BKgI594OvEOYLJRESccaZmGFY/LEAJUdXnHNkTq2nf
 PaWZh4UhgR/nP/QJ7RdKfJaAdBm7lSqipl+Ry1ixvm55gDD64tdfvLJg5TWykdnN6fpM
 Ed9o4x7vbGfL4mDTEeqYBY7jFSr5OBn3vAFEV52gFuPnLO6NbiBLcSWbwrsefQ4kfLat
 uX1w==
X-Gm-Message-State: AO0yUKWqG5LNe5klB3KN6KgcVTReZrjD4C23OdpUc312TU/EQqJloHM+
 aqMODiwYOcFSKxKjhbwdqGqpMQ==
X-Google-Smtp-Source: AK7set/1W9GL3/pkcpAq7a81lWmufDJ5i1F1DbJxz6fHWA0skUEsyEXrHuYQMiUPPm8eOPxA5Yxjlg==
X-Received: by 2002:a05:600c:474c:b0:3eb:2de8:b74e with SMTP id
 w12-20020a05600c474c00b003eb2de8b74emr14818086wmo.27.1678227291283; 
 Tue, 07 Mar 2023 14:14:51 -0800 (PST)
Received: from [192.168.1.115] (52.red-88-28-28.dynamicip.rima-tde.net.
 [88.28.28.52]) by smtp.gmail.com with ESMTPSA id
 g40-20020a05600c4ca800b003eb3933ef10sm13708744wmp.46.2023.03.07.14.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 14:14:50 -0800 (PST)
Message-ID: <ff0a52c6-53b2-4a81-8973-feda894998d1@linaro.org>
Date: Tue, 7 Mar 2023 23:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] MIPS Virt machine
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: QEMU devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
 <67f67c63-3706-cb3f-94a8-beea99f62c05@linaro.org>
 <F2FD4D49-9513-4147-B8A2-07048C055A75@flygoat.com>
 <d300dc97-557c-a0ca-0206-02068655135c@linaro.org>
 <db670377-a390-4ff6-14d1-30ab531141bd@linaro.org>
 <817CBBB7-83EB-4A9F-9D61-0A75CAEE7FAC@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <817CBBB7-83EB-4A9F-9D61-0A75CAEE7FAC@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 7/3/23 22:21, Jiaxun Yang wrote:
>> 2023年3月7日 21:07，Philippe Mathieu-Daudé <philmd@linaro.org> 写道：
>> On 7/3/23 21:14, Philippe Mathieu-Daudé wrote:
>>> On 7/3/23 21:07, Jiaxun Yang wrote:
>>>>> 2023年3月7日 15:01，Philippe Mathieu-Daudé <philmd@linaro.org> 写道：
>>>>> On 4/3/23 23:38, Jiaxun Yang wrote:
>>>>>> Hi there,
>>>>>> This patchset is to add a new machine type for MIPS architecture, which
>>>>>> is purely a VirtIO machine.
>>>>>
>>>>>> Jiaxun Yang (2):
>>>>>>    hw/misc: Add MIPS Trickbox device
>>>>>>    hw/mips: Add MIPS virt board
>>>>> Thanks, applied with following changes:
>>>>
>>>> Thanks for those clean-ups!
>>
>> Unfortunately I have to drop this due to the libfdt
>> dependency, which fails the --disable-fdt job:
>> https://gitlab.com/philmd/qemu/-/jobs/3890587748
> 
> Perhaps we should just select TARGET_NEED_FDT for all MIPS variants?

Yes, but then the 'build-without-defaults' job which cover
mips64-softmmu fails:

../../meson.build:2809:2: ERROR: Problem encountered: fdt not available 
but required by targets mipsel-softmmu

It is easy to update the job, but these are too many changes and
the gitlab change need to be reviewed.

