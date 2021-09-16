Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1758540D79D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:42:35 +0200 (CEST)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoqg-0007uV-5F
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQom3-0000xy-3I
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:37:47 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQom1-0003x6-J3
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:37:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id g16so8695804wrb.3
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L1WU4NgLO43+kVwTjWtfUA9zQc8r8Exsc9SJc6OQAMs=;
 b=nLOiBNrsHip3MTjj0K63+ABtqXSnylS0BYElCIPBN1lBt+bGu+3ZXwCV44P565bMts
 kRu0NW2+WoQnXdlummZ6YY8fadqjrOH9mVzshExoxvGp0oLLgdt2HlddW5fHZn8Rkd+U
 YQy3EWrQPuLzeOUHAkMWwn2kfXAd5FcoGgjWiqmodhW0GS33lK6I1nUXZroN4+kI5zAC
 R5hF9D2amfrreUGroMffLVqxhHGauFBLMIh8HvnPsFyQbR1NLGX9yBMVYBpQfofdsz0i
 eGtJ6uxQmC4UCzuGMMn3SG8E0Awj5h52dukEIeug9+xrQiarhnK0bv7R5l4XLQhPnL+w
 XXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L1WU4NgLO43+kVwTjWtfUA9zQc8r8Exsc9SJc6OQAMs=;
 b=LqgA/f376iWlaw8xxjysiGno33Ncgdz4MsLR7rzxs1M6OM0QusToh3+FT1eot1zou/
 lzPdj9qpLu61OASw091tngJ6lm9hgGwb/hRScRz0RGiEYYuGP6ENLyJXUXYR+Toia1Yk
 JZVa5W9nsyyKX+h258KIHZ8WE1vAox0OkjBKftFV/+x4F4t3y5YhN4bL7L0Yw4PxtdD3
 43JzPs6x45Yw4YrAQ6OtqKcExJS+2NtBOiqXcFbYHZiiyAqhiOfDWWoh9x9enxoz3wd2
 PD+HId1i3oHjP5MT4Odb9ymEq3pqV6RlgFXSaS/6IOcEadsrdLo9ES3iELhp+NjKGEQX
 IhsQ==
X-Gm-Message-State: AOAM531SbNgTp4R4JXvITYSX1VuxVu1HhyLqjHynb9uDoLoEHlg2lfAL
 JvDghjab8XPeSX71iWdZdSSp+Qqxp6Y=
X-Google-Smtp-Source: ABdhPJz8A2P0zAd+8MFYAQtAQAf7xGRiZq8sVPJOSVY+FhJDLFcdeMaMjPYqGNZ6VcQM262IUCdUgg==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr3146089wri.74.1631788663933; 
 Thu, 16 Sep 2021 03:37:43 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id i1sm2813423wrb.93.2021.09.16.03.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 03:37:43 -0700 (PDT)
Subject: Re: [PATCH v3 05/20] nubus: move slot bitmap checks from NubusDevice
 realize() to BusClass check_address()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
 <20210916100554.10963-6-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <677dcedd-5f06-2b32-3fea-1b1a701c168b@amsat.org>
Date: Thu, 16 Sep 2021 12:37:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916100554.10963-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
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

On 9/16/21 12:05 PM, Mark Cave-Ayland wrote:
> Allow Nubus to manage the slot allocations itself using the BusClass check_address()
> virtual function rather than managing this during NubusDevice realize().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bus.c    | 37 +++++++++++++++++++++++++++++++++++++
>  hw/nubus/nubus-device.c | 29 -----------------------------
>  2 files changed, 37 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

