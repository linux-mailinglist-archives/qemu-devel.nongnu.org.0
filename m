Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E84793A6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 19:14:57 +0100 (CET)
Received: from localhost ([::1]:39634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myHku-00049n-Fd
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 13:14:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myHjd-0003Hb-Uw
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 13:13:37 -0500
Received: from [2a00:1450:4864:20::436] (port=45838
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myHjZ-0000Bg-57
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 13:13:37 -0500
Received: by mail-wr1-x436.google.com with SMTP id o13so5575781wrs.12
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 10:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Bm+aSZYgso3t8XB9VmT13ulejIPNPIsHpJl3VT7kIHM=;
 b=FtWLY0+ebAm4SffSW0J+ZeH8ENL/H3tfMoBWqzgOEuM5fh8xKBTFozfDdjRxUvy/8K
 spjJcjZhb1BvrlSbkkUMVzRLPzzwK6Jp2bAFUdXd+aghGoKZJUkcDPNUGR9TU4sgweVk
 U08RQSdxXFquIDSYhFJtATb4kGuQ1/oLkQ2/JYCcqetV9fO/FPReg9QlX3qsDMJ4m27i
 CoPlcjQnPIq9m53bmDmtcEGx6+Fl17UtF/o4BG/sGeynQDc8wHdUf4vlUrd7iA4A+QAu
 Y+nRlckkjdr8YGebvFru/ekiUddDEBM0IhkWz6Y3I76T6yWwkwyo1DTHns/ETZ80Daq3
 mu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Bm+aSZYgso3t8XB9VmT13ulejIPNPIsHpJl3VT7kIHM=;
 b=tr/1pQe4igROEvfZEtkhNoHEsm29yZM9ah4+W24/wHbZUixaAb8/tko45r6y9wTZK7
 6GVJeuT0SdHaqew0m5OMia50lTLNsiCCL7yzz0ZJqf0Vu4AUPdMbLuKxyuMggtlGGYTf
 agVhDMV5Fcl45qduCWEz8JZoTHzEJqPrzUFu63hnvjWvOj6+e/T6MTnUReBkpGIhLdTB
 S7yqQYVamni5SE0PAD3NrlsmyGHfWqg3KctmgFWjc/joTX7lyDRMvoVeUP1M4nL4ahz3
 MSDxCOBJJw1CfZykppB3OiLLXHdFwRjRA9Lk9w3yV2qLPe04WdMmX90gSBgeBz08zrzG
 I08Q==
X-Gm-Message-State: AOAM530TpG664ylLFexrSglnTg5C7OZQ9rYUUNHdbSOODg58MXfWxzZc
 AO0+ZXlgOFrPI6td+Tt8b5xcjw==
X-Google-Smtp-Source: ABdhPJxsFcxMn9DyYpu8Gg/hAVw2tP/PAmHpLtwGjRX/EEbyBQ3QGgIQGyfKkgJC0hQa6zOuK/QHwQ==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr3422906wrg.433.1639764810838; 
 Fri, 17 Dec 2021 10:13:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d9sm7649315wre.52.2021.12.17.10.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 10:13:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A98F1FF96;
 Fri, 17 Dec 2021 18:13:29 +0000 (GMT)
References: <20211213182449.7068-1-bslathi19@gmail.com>
 <87wnk8i4x7.fsf@linaro.org>
 <d0f649f7-4d5d-9b15-829c-d5cef2137797@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
Date: Fri, 17 Dec 2021 18:12:12 +0000
In-reply-to: <d0f649f7-4d5d-9b15-829c-d5cef2137797@linaro.org>
Message-ID: <8735mrdrqu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Byron Lathi <bslathi19@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/13/21 1:02 PM, Alex Benn=C3=A9e wrote:
>>> +    cpu->midr =3D 0x410fc0f1;
>> hmm wikipedia lists the part number as 0xc05 (and the a15 as 0xc0f)
>> but
>> I can't find the actual value in the TRM.
>
> https://developer.arm.com/documentation/ddi0434/c
>
> has exactly this value at the top of table 4-9.

Ahh good find - 0x410FC051 it is.

>
>>> +    cpu->reset_fpsid =3D 0x41023051;
>> I think for the a5 the FPU is optional so maybe we need a cpu option
>> here? Or maybe just assume it's enabled on QEMUs version?
>
> Yeah, there's no entry for fpsid in the above manual.
>
>>> +    cpu->isar.id_mmfr0 =3D 0x00100103;
>> the TRM says [11:8] Outermost shareability 0x0 L1 cache coherency
>> not supported.
>
> Again, this does match table 4-9.

0x00100003

>
>
> r~


--=20
Alex Benn=C3=A9e

