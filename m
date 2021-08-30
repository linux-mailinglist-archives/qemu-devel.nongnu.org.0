Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8153FBEB7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:07:39 +0200 (CEST)
Received: from localhost ([::1]:35944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpRK-0002C7-3H
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpOO-0000Us-IY
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:04:36 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpON-0001cH-0s
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:04:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id u16so24490117wrn.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 15:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YCrygzVlQeWoWCpG2Go4yhwyEQMd2uYuMlcntkmwuxE=;
 b=astbc6iD73xAaNORmdoHMH1Kh99oNLjh+UWUbe14qGAwXuccC2OJ8QG5tcoIO3OKCz
 lrwN0kBSabDtiptRv1oq8540meqNzjfZb4cOpg4yJ3OB2OjSRk1qUTXXujQ2VBnr1u9g
 uhyxQgB4Y/1yMkFWSw71gG7k2AVwSjvYQB5TAbJq74SGBMQ6QlXKi5Q10DC9nuNZ4RFp
 kz2FMAO+/+nC2eGvlH71Tg+t16WMFlhN9JGkRYy5GiBXJrcCgQi13I+URO4Q0t3ItRjG
 PiLamOFRbsYiqQJYvnFNyZJfT2u//5Nsq2ZRgSBy1ZyNUuba2pujwOyKhpjiTtlo3Cwq
 NmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YCrygzVlQeWoWCpG2Go4yhwyEQMd2uYuMlcntkmwuxE=;
 b=X2ixxcJJR6ZYcJfCrejOUi7NacTVCOUnIUjPFtH1Fe7UGTuCJLj17DThUgGZfRVpYV
 p+5tOPbFPh9socQbSPJOHT09eL+GdUe1pnGHP3qzYVUAgd59wSyr+rBebD8krExhM5w/
 O0tFTPkZTKEBbzMkllS8gXSUGV0MzUJLxhj5B6RXa1lj3PF6mTasJ4wLO+HUn4GWGSKA
 eWkMNwt6AMnRoMUzadDjUuVvzHoKlIH1TEnWgPrV8zOs6ovGVHKyRdZy+jUmH9gt3QhE
 Y9FuAQqv2JpHgtr8j0RYqdRBT0oz2pJYxbfznjVgIcLCprJegNun4stVBVFpVVTRANH+
 0G/Q==
X-Gm-Message-State: AOAM531W+xSH3iONwHz/GqyjKKZsHL+UJDfmoDA6S7LPYBMPE+4Xe1u8
 s/fmPum4mp3404fPMGEPq4I=
X-Google-Smtp-Source: ABdhPJwe87Vo0p6WKViYtD5k8L4HU1oSWI+Lekg15rZL2LAS83IN+bRmQfa24Dz5r8ZMEQ7cALTbqA==
X-Received: by 2002:adf:eac5:: with SMTP id o5mr27612525wrn.22.1630361073643; 
 Mon, 30 Aug 2021 15:04:33 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p13sm16567838wro.8.2021.08.30.15.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 15:04:32 -0700 (PDT)
Subject: Re: [PATCH 07/12] mac_via: move VIA1 reset logic from mac_via_reset()
 to mos6522_q800_via1_reset()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-8-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8242c1fe-a814-5b99-c2d8-dd2303145d3c@amsat.org>
Date: Tue, 31 Aug 2021 00:04:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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

On 8/30/21 12:24 PM, Mark Cave-Ayland wrote:
> After this change mac_via_reset() is now empty and can be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

