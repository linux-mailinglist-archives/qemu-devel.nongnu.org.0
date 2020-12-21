Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2692DFDA5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:39:16 +0100 (CET)
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNHH-0004BH-OH
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krND3-00010L-QA
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:34:53 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krND2-0007RL-3X
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:34:53 -0500
Received: by mail-wm1-x32e.google.com with SMTP id g185so11309770wmf.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 07:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uhiOY+efx9vnfXKKXE2mcYor3GFTvjDkr/Jn1lcn57s=;
 b=ed5Jth10BK50fUMYVcEnVKjxqTSMOr83+pbgXrHRVkq9DQVO6MffFlMhQQqDolWRu1
 p//76s9IZT53BKOi66AH379/Eu99pnSdUJoSuoSmWbE0OV+444haD4aioElleKTHMcFG
 bcMSB4T2PbpZycoM3+TFRbpSIhE1NJhyAfl+rF9RRE+tLdNVoLT5+TuWJPJKv5qImFAC
 /UILHnCHiCa2UNv6K7U3vJIMciHDb7KgW6fo2qkDrfqmKXGJ/eiJ7PD5UxrM2oiUrgEE
 s5YQSaWKplfJfdQkIWtUHcn8J/n0LR1Qv7BwnA58D7o9BzZGFG9xy3NiIfxmfQiwpYJO
 Qc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uhiOY+efx9vnfXKKXE2mcYor3GFTvjDkr/Jn1lcn57s=;
 b=hqvwlhenzpg7GAd+dTI8XnqNn8v3NT5zD2GO/xkHAEmP6pqLkuamB5hJIEy/ARo7es
 9lYcuqfWSeZYNji0AVnEtkwNT9IykyYGTRVlxDtQFVqb9p/hI03ojl9lgiIIzwnLEbLA
 sfppUCADSuEojOHe8selTK7rIXjAKUlxL3b/gv49229BxLgClcDC4XfmT4F6EFrNvYld
 TUCfyNxLvJQaESbz7V2CLU2GVelrnoJEsi7s+57n7lm7mFHT0XzPIA/lg/YTM8TbgfqZ
 ChuQdWbMWSuA8B8j59bU2I1tdi5rPca7b9QRHXWRhvCLU6nOVaUKQGUKKPq78uK0c2dn
 wg+A==
X-Gm-Message-State: AOAM532NxkEyRbphHttPfYGehU7F56GNiNMqxhN0GJsFr5oE9lNN4WrD
 3D3C79m0s3Bl2oiufz4Qa6E=
X-Google-Smtp-Source: ABdhPJwMdVy9BX2D4LrPB1zvAuKR/6j8ASyPNh1O22aFK9BO0t8bD6+pXs8Gq3E4+IC7l+67Qm7xsw==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr17615104wmh.85.1608564888294; 
 Mon, 21 Dec 2020 07:34:48 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id v1sm25767071wrr.48.2020.12.21.07.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 07:34:47 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: Huacai Chen <chenhuacai@kernel.org>, Willian Rampazzo <wrampazz@redhat.com>
References: <20201216181759.933527-1-f4bug@amsat.org>
 <ad7ff216-66b9-9b0c-eece-80a294240c28@redhat.com>
 <CAAhV-H7f4Bw_+BLCC0DcrUQKK0nUanQTTQ+a272ADBheB_NBJQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <57336906-ec68-020a-9388-4d43db937a81@amsat.org>
Date: Mon, 21 Dec 2020 16:34:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7f4Bw_+BLCC0DcrUQKK0nUanQTTQ+a272ADBheB_NBJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.233,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 1:51 PM, Huacai Chen wrote:
> Hi, Philippe,
> 
> On Sat, Dec 19, 2020 at 4:51 AM Willian Rampazzo <wrampazz@redhat.com> wrote:
>>
>> On 12/16/20 3:17 PM, Philippe Mathieu-Daudé wrote:
>>> Test the PMON firmware. As the firmware is not redistributable,
>>> it has to be downloaded manually first. Then it can be used by
>>> providing its path via the PMON_PATH environment variable:
> A1101 is a real machine type, and there is a UEFI-based bios designed
> for loongson3-virt machine (though it is also not redistributable),
> why not test that one?

Well, if you already shared that information, I probably missed it.

I'm trying to add test for your machine to be able to test it regularly
to avoid regressions... I'd rather let you contribute the tests :)

Phil.

