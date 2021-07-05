Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A6D3BBAA4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:58:39 +0200 (CEST)
Received: from localhost ([::1]:43912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LN8-0007HV-KA
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0LJY-0002KZ-4r; Mon, 05 Jul 2021 05:54:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0LJW-00038N-MF; Mon, 05 Jul 2021 05:54:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id n9so4005656wrs.13;
 Mon, 05 Jul 2021 02:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7sDqVjLN/uNuE//u9iIQ6Y6SpkJIXLkP3Kv89A/noUo=;
 b=E1/yVDMUCho8QVgCQZ3I80h2uakjAjC8KW5OB7KDY7S82KAhyJNyxnAa03YCypEXYP
 /6Jv8pIB80prMYBk13RbOSugw4VKSMQO8lBgyrrlpxMrP8OuoA6I8OmIEaUY+xZ/Zb0+
 MzdeXbM60+XVX/0M3co1YuY70kt4EeFvrdqxonk3eEUG/4YiL6oqgdG6UnxsfLONiuCD
 wEwTGkrHuyIzpgaAVuZ1wPVnOsj7/bxl/NHNGRc+tfrnbHEIE5jpzzp3BPYaByxahRRW
 /v+cV2eX2yku9MUzXSrxJ02GVjdoXSaJv0/3Q7kGNMpJFeCUFLT3ImXdy8UEDkEEPYA/
 qWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7sDqVjLN/uNuE//u9iIQ6Y6SpkJIXLkP3Kv89A/noUo=;
 b=AtmRwRV/ZF7Z1OcQl9QxoUJj9W8chUK/UO6TPSgeOLnOsKe9vRW9vMu8DtOFhku6WT
 vf/Zx4d6gCb1icbmt7QFHOsr1Zm8HqZtnh3CEl36J7dzbCzNTdzHmt/YX80jFPDDEwll
 PH1CrOUGxdWuTlMNzwbdk2w8e3vl4jLaL7g+g+8bCvQJBLdFp+aSuURvgv7FLjQQil0+
 AD6Q0ro7uH9wFxBIZt0d97VPL0YTNZB+iy7j7Jgcvreq4as+8YGGSwJhlHM/IMIgaZEJ
 Of2UZHGUkHgMeQlZoWR83Qdj+Olj8cKEoj+eC3Rn1WayZh93J6Ac+OKQ2/t2E0Etu5Ox
 R9wg==
X-Gm-Message-State: AOAM531OWc4rw2BcMAjIj9NTfqOCZdiKEWHbVlJjJ0xbXcC+4PDvxa2H
 KlvrVhf+kErs+U4RBSDKc1Lc9RWR6VQ=
X-Google-Smtp-Source: ABdhPJxEnxM2Usp/QawLtJB/skSG+2H6sKQxejyIek3lTfxzcFindRSNBtUaW+njmanBxjQ0EKdv2Q==
X-Received: by 2002:a5d:6daf:: with SMTP id u15mr14702073wrs.400.1625478892901; 
 Mon, 05 Jul 2021 02:54:52 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l1sm16321079wme.11.2021.07.05.02.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 02:54:52 -0700 (PDT)
Subject: Re: [PATCH] hw/sd: sdhci: Enable 64-bit system bus capability in the
 default SD/MMC host controller
To: Joanne Koong <joannekoong@gmail.com>, qemu-devel@nongnu.org
References: <20210623185921.24113-1-joannekoong@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <063df3cc-cb5b-1181-6cfa-a6f02959e70d@amsat.org>
Date: Mon, 5 Jul 2021 11:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623185921.24113-1-joannekoong@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 8:59 PM, Joanne Koong wrote:
> The default SD/MMC host controller uses SD spec v2.00. 64-bit system bus capability
> was added in v2.
> 
> In this change, we arrive at 0x157834b4 by computing (0x057834b4 | (1ul << 28))
> where 28 represents the BUS64BIT SDHC_CAPAB field.
> 
> Signed-off-by: Joanne Koong <joannekoong@gmail.com>
> ---
>  hw/sd/sdhci-internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, series applied to sdmmc-next tree.

