Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9483B984F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:46:01 +0200 (CEST)
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4VU-0007Jv-UK
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4T9-00044H-46
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:43:35 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4T7-0006W2-Qd
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:43:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id i94so9996136wri.4
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4sC31UyG2bNMfLEP+xEslq07FelVGlf5enq+DRwAGjw=;
 b=THoD6/6cBa2PDLKKVUdGFHpI7/ZGwtl5kacC6kFnUlYFMIi4aaYotPxHwNeB/ks7id
 CqSkwVJvggKtOr0vgOk0M76Jw1gjwVDFru2lI79BbuPmsNns+nh7EnmyMD6kzlQNtNKc
 ubvYpr0sRIW5sTPQkbw6wWGzmFliPVVsOHFnJlWG0tF5oxerqQXsM0eGNgTfdad0Z2ki
 RM7pLPIzyr/IlgEoYviXqs3VutYN2hytCUjbwC/23jK5A9LBYj0F6/3+avWmqxQy6tGX
 0OInMHPu0dLZZGvZn1vzaE7x3oEL3NXLWl7gGutVGFvBXAVoQn/UH8nVFtciEDAxTNWu
 MT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4sC31UyG2bNMfLEP+xEslq07FelVGlf5enq+DRwAGjw=;
 b=WUXuJeEfQ2hRjS9Cgw/A0SVxO5jzRqqJd3c/D/N1q8YJhPzi0f3hrvejFSt1YCve0X
 rId3bI8LYRwGrFTmOOnhNyzTGr1l8nk5n8yiF6Zd6UNDLe6o5PfFtxwWckC0K6v5IMQT
 GVIOntZY3xi48YUyRhbjT0vft8epbDbb8L5itVtG0uyCkJlGbmVcbsqfgMK2rUFdm62C
 LQ1slB4O3kJCxK3gxra1Y+Dy67gwdTQs9MuMjasujT+WpBB1O4z2HQ6F9vSq5O/csySy
 +9Hr8rygkLiQSbMmOquZhFC9+KTCXl0Kjj+m8v5mP3qCbAyJZ0DZSKh/7Lg7YKfwdNwD
 oJGg==
X-Gm-Message-State: AOAM531L/E2gNlTZ//SuXBSBm87xIqakjRZ3+ysrRs/Zhu+kqq2zx5Mt
 Eq/FrvkcE8UDXIxpFhNYTDg=
X-Google-Smtp-Source: ABdhPJzcWsCWQAdox6ZfVAqTtVMciEksyd8Bfg95Iadk+FGDd9oIk8lNzStzlomUTSNqqSQrnOdDmw==
X-Received: by 2002:adf:e8cc:: with SMTP id k12mr1948755wrn.163.1625175812208; 
 Thu, 01 Jul 2021 14:43:32 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id j17sm4828682wmi.41.2021.07.01.14.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:43:31 -0700 (PDT)
Subject: Re: [PATCH v2 04/10] hw/m68k/q800: move PROM and checksum calculation
 from dp8393x device to board
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <79bb2e5b-c10d-ab80-bc0c-a0e819a0aa83@amsat.org>
Date: Thu, 1 Jul 2021 23:43:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
> This is in preparation for each board to have its own separate bit storage
> format and checksum for storing the MAC address.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

