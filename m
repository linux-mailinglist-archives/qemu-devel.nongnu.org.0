Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8156E3B984D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:44:40 +0200 (CEST)
Received: from localhost ([::1]:41848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4UB-0004dj-Ij
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4Sv-0003g9-Tq
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:43:21 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4Su-0006OP-Fu
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:43:21 -0400
Received: by mail-wr1-x431.google.com with SMTP id t15so6619897wry.11
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 14:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jx3AAvUVvNFumbl/bQwCA2mGr83VcNck+8hSsjR40Ws=;
 b=FZGXCmJNJljla2Wy7dqoG2NorbImjgEkONBwNBCKvOO+UFTbxibl9qHPHM/AoHnucr
 Cbs3YEhy8vq6AlbKZaHi2nUTCdq38BJLGA1WbjMjdJgT5Opbb+7GAieDrbRaODJJsrHl
 mfxIFXyiK2mQ2bGjfSj7JVuOXtHtkodNEPX/knUdMz0zC5XxcvVVjR4PAGF6Jiw9Kzg5
 AtThbHqR9u+wqQSsy31X0Xn5fIpK4qP2Iev+bP3U9NlHwfd4y0yuAIRvkNGNIYCchqpG
 fdEzAEpBIpJPdv1Qb7L9w3F4Ftji48zKFmrLSqjDowtvYjA27NXvOL+tT1cBqPAimv5d
 h+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jx3AAvUVvNFumbl/bQwCA2mGr83VcNck+8hSsjR40Ws=;
 b=hFdi2cEXwsjIeM7mZ5Mu1SWHS1ZDQ5mli3Tb54GBHm9nd0hmA2ob//FznSWQi1WxcM
 szWfgaY4WHjVC+nskaB52O9Ztc+i20Loxi9xPlQVUsARhWiiIVNpa89H1woEIN6/83pX
 hMTyc/LZpSg90tpFVhNEiRIJWz1bQnx9Kq3mQzAUYx1DFMQqKwllhgjC3eZkX8/L41Qa
 ERG+3+MR8R1Nc0/+lQ0ULrx8SHcc9dEjKUv5+l0UwTCD5QiFzKA78Sc9pQFDMLEulmxh
 vlk0McwU/9a+nAnabGSIa+cMF5P5eVwM34yx29pPVlVb59hkXvAtoeN2oHCpk8jpiXJT
 vGkQ==
X-Gm-Message-State: AOAM533pY2vwSEfd0aDr6vMgk56WhiF2ubqp8rIgk8/SgDJpzJH0iQY9
 RFfW8A/Evn8sUJwjAesP390=
X-Google-Smtp-Source: ABdhPJzY32/b7cu+2dCNqxLpefB0Ge5e4CdpRHdYwEirhLR8rDoV7CqsXChEUStzRap7HlU6f5RRGA==
X-Received: by 2002:a5d:5292:: with SMTP id c18mr1954100wrv.143.1625175798893; 
 Thu, 01 Jul 2021 14:43:18 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id z4sm1111856wmf.9.2021.07.01.14.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:43:18 -0700 (PDT)
Subject: Re: [PATCH v2 03/10] hw/mips/jazz: move PROM and checksum calculation
 from dp8393x device to board
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-4-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <885a22e0-aafd-57dc-54cc-18c8cbec6d03@amsat.org>
Date: Thu, 1 Jul 2021 23:43:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
>  hw/mips/jazz.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

