Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F856714FE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:19:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI2jK-00021u-UH; Wed, 18 Jan 2023 02:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI2ix-0001sT-2e
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:19:07 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI2iu-0005LH-Sw
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:19:06 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so671386wmq.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 23:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ia2hmW8mHSB1gXnJUL0PmY4N+1YGnMRLUCVCxM2q6is=;
 b=KwrOTPERgmj04I1FGXSaQ4Zr8KZ1crzF4p7rOG+U4aB9ZtOAzagsLgtIoDGylneYh9
 6behMk8K9/67iQAhPBJlfOm3P+J61Z+r9Lp9sLic8W/9C+YQMIKuh/dG7XREU7HoGq9t
 VmDpgH/g7aGGQsdIu/jtQ5xGFLQdKZ69qvjwOi8QNb6Wiw2Q6sgTCas3FQPuUI6QfG5M
 QPB/g5qF70xR8tK4W3yNXBCNrQHjOJvn0x2+UQkiBempJahNmvCEs8R6jMLGjgkzgw1U
 aqvkb1TAxzRSOq/JXe+OPNftHV5Va7dl+26/ZqYc/6WpncV1bynMYS0XBcTFPf+cfF7z
 MABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ia2hmW8mHSB1gXnJUL0PmY4N+1YGnMRLUCVCxM2q6is=;
 b=X+MfMJA9y0oK+erHyaMAgw4WalKrWhvW0JSVnpqikTOrnADvuuPsVTumGJKNHuE0nM
 /Dezjatpj1ZLYizAU6zpqfYwivjHhj1pTMRyOQdKqfAgD1ziFNIp1HBge5Qa9Ex0RJoN
 dd3pFPEyjypTfpUVyOTZ/cDnYIZ4ow2w8E1uE1s1TMN6IbElHC0w3X3uENcOuGFVovt8
 ZC/KMEh4jLe5uq2abGFVXaUrWpuzjgjP4+GuThJfZH/INjBhnr9qUjL61/S0DEDp0EHQ
 bPm6nqhLleQgVd2OQUjFU/akAf1fyaLwccuVxQH+sTLgEBdfl9GpwNt5lwW4rvBbfYqt
 DIpw==
X-Gm-Message-State: AFqh2krGyROlsaCVGnpeIfstLBb/gfPcNLPjYyGu5VZbG4uWQ1qysKlW
 gT3v0bStJQoF4I1kjya7pPfWlNRq3acQfko4
X-Google-Smtp-Source: AMrXdXvnOZBt18kwDpU2yNP/g4AIpW6BWNiV+uvGQIlZOia5KFOkXohQ6CFqF94RZAJbZgY6z49qfA==
X-Received: by 2002:a05:600c:c05:b0:3db:104:7812 with SMTP id
 fm5-20020a05600c0c0500b003db01047812mr5507476wmb.24.1674026343185; 
 Tue, 17 Jan 2023 23:19:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m9-20020a7bca49000000b003d98f92692fsm1070452wml.17.2023.01.17.23.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 23:19:02 -0800 (PST)
Message-ID: <ad71b960-9e4f-7cc7-f0f5-081fccee7913@linaro.org>
Date: Wed, 18 Jan 2023 08:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] hw/misc/macio: Return bool from functions taking errp
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1674001241.git.balaton@eik.bme.hu>
 <bfce0751e82b031f5e6fb3c32cfbce6325434400.1674001242.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <bfce0751e82b031f5e6fb3c32cfbce6325434400.1674001242.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 18/1/23 01:32, BALATON Zoltan wrote:
> Use the convention to return bool from functions which take an error
> pointer which allows for callers to pass through their error pointer
> without needing a local.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 62 +++++++++++++++++--------------------------
>   1 file changed, 25 insertions(+), 37 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


