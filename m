Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9AB3ADB37
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:06:38 +0200 (CEST)
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufMb-0005M6-Lb
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufLW-00041C-JC
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:05:30 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufLU-0004Og-PX
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:05:29 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so7780672pjn.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pakZ3j01l+gX81MYrZmAUB2w3lvM3O6+kwzZGlIrYpg=;
 b=SyhREtauLaFvreQE2auP+qHZGBD+Ihd0Nmu9dgs1ZruYyAJnj/2j2B0Rs5Z+0dqFH+
 n8rxkDkxjSauOR07cJWe3H0NgT73QlpTyFl5BFwSSzvYQfg+6FZ8vIZLoFKsvZPu2rx7
 7aIvtvbiemtxZL34n/lOdJKctWYZPBfKZwdwjsnlA4FGyruspgJrrOYpUeYAPbXg/jiN
 YhThkT37R55Rl3gKc5HXZ+bmf0CcAy6xKkrKrLh9poGDY1FVWGbgpGdvVBsz5XydALFh
 lZFlU7ZdYSFmsRCmULoKLedFuctbEhkmFZSeSpMWxthxX+qj9kdJpDVdxtsPzWe8Qx3l
 HUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pakZ3j01l+gX81MYrZmAUB2w3lvM3O6+kwzZGlIrYpg=;
 b=oiRhtfp5aHPQPMbiR4XAJeCYUK2ksRgcq6PJrDYByKJY0oJXZ65pr7eismtSSqa50V
 aU1hANCZxQHWYrOJu+o6JqV7xqJKEI/gFfiQvXhOP7gh8H0+V6pItbXH4au93EcbcQGY
 IXP2SuZ4am2OM0BKnCsVdaUR8mw/+DlrvjOgF9sOW2UqIvf9kwo4ULgrU/qSNE/EOvyc
 Tsw/aK4URGMDaGvQctgPhzUSG5ZGo8fWSF5UTQih55frYTN10KBVB66ad1Bz+7+Uc7Hj
 ejXDVjj8XcPOZvmvnX20ny6ypxLwuAdW1JyJ7G9GIuMkl02r9/imRPeFp6NU3WkGBR2z
 bUug==
X-Gm-Message-State: AOAM532fwGEb1m/wI7dRnhFwNcyz9xUu3H3sK4w+zc8G2RiO/qb66swR
 laqiSCzW11/eV2fo0oO13O+NJN6GhW3Qfw==
X-Google-Smtp-Source: ABdhPJywnd6bfQU4H5OjdNi+qQl0BBrII2ayNMgitIH7hcEh+7sAs91Bjw7ZnN1OqtKYi0gIkqaz9w==
X-Received: by 2002:a17:90a:d590:: with SMTP id
 v16mr17407189pju.205.1624125927255; 
 Sat, 19 Jun 2021 11:05:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b21sm11508085pfp.134.2021.06.19.11.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 11:05:27 -0700 (PDT)
Subject: Re: [PATCH v7 15/27] tcg/tci: Change encoding to uint32_t units
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-16-richard.henderson@linaro.org>
 <ca5f8c8e-2e92-75c7-5e09-e82ada0f122b@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97f1c718-b378-c37b-a37c-bd92255707f9@linaro.org>
Date: Sat, 19 Jun 2021 11:05:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ca5f8c8e-2e92-75c7-5e09-e82ada0f122b@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 6/19/21 10:48 AM, Philippe Mathieu-Daudé wrote:
>> +    case INDEX_op_tci_movi:
>> +        tci_args_ri(insn, &r0, &i1);
>> +        info->fprintf_func(info->stream, "%-12s  %s,0x%" TCG_PRIlx "",
> 
> Missing space in format: "%s, 0x%"

Squashed, thanks.

r~

