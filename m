Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D283B9851
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:47:48 +0200 (CEST)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4XD-0000XJ-MZ
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4Uk-0006ht-66
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:45:14 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4Ui-0007UD-Om
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:45:13 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so4885333wmh.2
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 14:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o3HH9oRHl+rc0pC8jqxo6L8Wllicf3ymwc9kTKVBE0Q=;
 b=TKonru9UZIvWF8tOZ123UXc0w+zMf/P5NSjRCXF92J6wVwwDNxl7Sd4aq3HPvAo6EY
 Vz9Lx2TK2tJM7+Zi09P585wOM6NA658s15WzlFr9b43dYHvfgjw4lWptBIoPy5THai8D
 o552mRjyU1JGUNjXXZ5aKofeJZtRkqfCqktO46+X7vahxh6YAqsNQUoUc/EutYsB/Bi/
 xGyT3Js5gWjY5RDBXseZE4GGQnVoJNotgOQwt2dN0tp7iA+s3/CkcU04lxBINsJ5Jew7
 8ILdHcjY2JrP2jc8Cj29L1+XNwXl6yWAj5ptAPMkbww1es9bfmdJRfzhSzpBYcRXy8YC
 c6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o3HH9oRHl+rc0pC8jqxo6L8Wllicf3ymwc9kTKVBE0Q=;
 b=IxNlo+r7kh67wdTN+EPDP4td/gGBXp610Ij17Wz518QjGcNaRaPHjTexmfaSetdni4
 MRAtg4f4WD+U4r8L5MFjj41BYT+Rc3ahIITHmIVi7l3hfueOF60rVBluQ7ZVHT1K7JzB
 Vg992oPUGMLEePEoLQjvjUL6tGuid8YTU9BFyh2biK6nwvKjhTkzScx+SGV5+E4X5p1L
 ygY/Jg4GfZBAJuGp1lxqaQB4A6ZM+9sQzXAFlMRrCa0y8gJbcyBuLCGXUkLFzsi+mmPT
 3IaxRjX3ehew8ehKwSVqybBl6N04spV2Whzg/Kz0BAy/DTvEQ7ldmL08oRdRIFnMJad/
 W/eQ==
X-Gm-Message-State: AOAM531ilyFmLjBaCYvEvZKeihV7X+iZqO9VbVVZjisCKP8HHnZ4AQBE
 R705WCheIBlN8lNpGbhI/gU=
X-Google-Smtp-Source: ABdhPJzc3RqXjCKzX+Xbe15P/TbCHYUPE/UKY0qBTG/uE9VaSQBz2Uwjc6mGP20QGxEOKLArU1m1VA==
X-Received: by 2002:a1c:9d10:: with SMTP id g16mr1867020wme.108.1625175911374; 
 Thu, 01 Jul 2021 14:45:11 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id d12sm1151746wri.77.2021.07.01.14.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:45:10 -0700 (PDT)
Subject: Re: [PATCH v2 10/10] hw/mips/jazz: specify correct endian for dp8393x
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-11-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7ec95387-28ea-7ca9-06c1-1734c488bb00@amsat.org>
Date: Thu, 1 Jul 2021 23:45:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 6/25/21 8:54 AM, Mark Cave-Ayland wrote:
> The MIPS magnum machines are available in both big endian (mips64) and little
> endian (mips64el) configurations. Ensure that the dp893x big_endian property
> is set accordingly using logic similar to that used for the MIPS malta
> machines.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/mips/jazz.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

