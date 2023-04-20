Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5A6E8F59
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:08:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAd-0001Gp-61; Thu, 20 Apr 2023 06:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppRAa-00018h-GK
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:40 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppRAY-0003et-Pw
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:40 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so446177f8f.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985138; x=1684577138;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j6wh89q0U2BewIHtpyuN2+Npmb4msGCmZvba0xz2tuo=;
 b=DxeCfl3naAv+OxEIbZRiw4w7F+8Lgk2pisQIdhHbaMG1sjEo+MqcnQwY7FRLSn20Uz
 eiOAJ8KiP2rW+Q9zTupWl3EMjcwXVhc0hsZ+MG5DHsAMk5ZUW3qwoJUJ+Y9YukEaBUYA
 /YoGoZfJGkqmvpKvQenIA4gBJU7UNUiWDtLwmGcon8B3aQIVIfBNPSn3nbDSVjyTAe0A
 5XBsSeKBmDOgDU8r1lKZOvXCDTF5q0N7yy+iySIufhnlwMrV3HxlerE9eqD/A2vIlpKy
 6v4yddn5gchG+N+MSf54AoLziny1mlUiRoYsBg+zaX2qHcJK8F7H2bGj8C2Jk0wkjTfv
 ofpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985138; x=1684577138;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j6wh89q0U2BewIHtpyuN2+Npmb4msGCmZvba0xz2tuo=;
 b=Gwp6QPrq6Cgr3HEWrvMfqb6/xdVRaH1naJXBNEgbeZDO/KyUTWNiXdIYbMs+cm4I1F
 F7LkIc+/bngM/bzJcHGugiVidTNCh9ssARnFLxIFFKTjoPuWJlZ7gpNwtrYwyuzoGEcm
 dA1P0ESP6P1ov8LhJ1ou8RA8l4HFdtkHglvzIAMo1hPIDP2sRWyyKjwT8wZLh59duWwM
 6CAB0em61TF3cqEs8T6xCI1GKkE/vfb9MIF58LE2Fj1yhe0sh6qByH3fEpVCDeiyb90k
 JZz67D+bTOen6+GUSLPuOMHsvfO/9v6f7nkD1hj1vz820GtN01UrLrNbHe9U9Z2sVEtB
 9MWA==
X-Gm-Message-State: AAQBX9cMshkTLESBoXbiPyvMVQUSg/tHpBMUlJuF6C6APYdg7JtMoAMw
 N4LeEjT5FUfqVoZUdvzro6/k0Q==
X-Google-Smtp-Source: AKy350YgKe8o9viMvQuTSfwMDfichSSeNoGOzmokrN7NJHIhd6dKMcu9xCxPeKEC5tSCqWNOAUazSg==
X-Received: by 2002:a5d:5312:0:b0:2f7:662:c87f with SMTP id
 e18-20020a5d5312000000b002f70662c87fmr739334wrv.14.1681985137871; 
 Thu, 20 Apr 2023 03:05:37 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003f07ef4e3e0sm6785708wmq.0.2023.04.20.03.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 03:05:37 -0700 (PDT)
Message-ID: <e666b7fe-90de-323d-4bd1-89214b85eb9e@linaro.org>
Date: Thu, 20 Apr 2023 12:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 04/10] linux-user: Add '-one-insn-per-tb' option
 equivalent to '-singlestep'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-5-peter.maydell@linaro.org>
 <eae62bb6-7c94-21be-f69e-8dc90c254297@linaro.org>
 <CAFEAcA_Xq1ZS05UL6O+VEMC_P+TF+_-aPmwy-cHVR93mmVndqA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_Xq1ZS05UL6O+VEMC_P+TF+_-aPmwy-cHVR93mmVndqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 20/4/23 11:19, Peter Maydell wrote:
> On Thu, 20 Apr 2023 at 10:13, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 17/4/23 18:40, Peter Maydell wrote:
>>> The '-singlestep' option is confusing, because it doesn't actually
>>> have anything to do with single-stepping the CPU. What it does do
>>> is force TCG emulation to put one guest instruction in each TB,
>>> which can be useful in some situations.
>>>
>>> Create a new command line argument -one-insn-per-tb, so we can
>>> document that -singlestep is just a deprecated synonym for it,
>>> and eventually perhaps drop it.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Reviewed-by: Warner Losh <imp@bsdimp.com>
>>> ---
>>>    docs/user/main.rst | 7 ++++++-
>>>    linux-user/main.c  | 9 ++++++---
>>>    2 files changed, 12 insertions(+), 4 deletions(-)
>>
>>
>>> @@ -500,8 +500,11 @@ static const struct qemu_argument arg_table[] = {
>>>         "logfile",     "write logs to 'logfile' (default stderr)"},
>>>        {"p",          "QEMU_PAGESIZE",    true,  handle_arg_pagesize,
>>>         "pagesize",   "set the host page size to 'pagesize'"},
>>> -    {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_singlestep,
>>> -     "",           "run in singlestep mode"},
>>> +    {"one-insn-per-tb",
>>> +                   "QEMU_ONE_INSN_PER_TB",  false, handle_arg_one_insn_per_tb,
>>> +     "",           "run with one guest instruction per emulated TB"},
>>> +    {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_one_insn_per_tb,
>>> +     "",           "deprecated synonym for -one-insn-per-tb"},
>>
>> Maybe worth mentioning QEMU_ONE_INSN_PER_TB too here:
>>
>>     "deprecated synonyms for -one-insn-per-tb and QEMU_ONE_INSN_PER_TB"
> 
> There's not a lot of space in the -help output, and I think in
> context it's clear enough without.

Fine.


