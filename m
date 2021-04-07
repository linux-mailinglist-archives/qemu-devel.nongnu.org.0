Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF93576D1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 23:29:20 +0200 (CEST)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUFjj-0004Lk-LH
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 17:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUFho-0002U7-In
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:27:20 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUFhn-0001hI-0j
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:27:20 -0400
Received: by mail-ed1-x52b.google.com with SMTP id w18so22666677edc.0
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 14:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LkRsEFSWEtw6jU5h34hS1nEXV09WhbmAsEHGHMrjMUw=;
 b=L3XVABJOkDQR8iKTD1j8rmNpN94wUuBqk9yqLReB6Fa6jLAdgu2wnNCoCaHXa8cAgc
 HafV74gkhEP7Pelsxs9DJen37+F5CcKSnbKRtW3GSvxGk7fIlyd9oXbCG2y5MLwnuCOk
 7mM4WdZHd21I6fGsY/kDKBUVg21QK+QznqShTrWeYOaXsN/U8okUe5nO3kFJccH1tWUN
 0+qTQGlUvEIhmGWbWcecoDMEr3Cq0K3hsKy+Nluwm1SL2q/cNQl7eeLcUCcITtEueGEs
 lR2lugtBC24g07JVoIewhHk9a6PBHfxeKjFq6AXkGiba5unr7hE4xrQFSX6Prk2uoq3S
 VVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LkRsEFSWEtw6jU5h34hS1nEXV09WhbmAsEHGHMrjMUw=;
 b=XsfOgZxXWZSZvD4g2tVE5D1wUGEblTahe/UDoZPks6auFWACIK1/VVOpJh/h4CLlJY
 weapdPgqG0XHNjQnHX3TCV9CZKk1K927IbbLWBeotTxvVy3Ceq8M8Qt50+TSmIZUleto
 uhPIDRdESWP/0pkbKxBEIA7FRX9IqXrwBYuWCmqCpv80RF64xcEuteichCm9L2lPBEKR
 f3/e/PYL/7O2i0/2Dxj3t2Y2E58IXNXVTjPV2Q6hkb6z6ab2zKgNBy04tGpwGKGWL5Dq
 lrouA7cqZrDfx+kQiyOnR8TPvPDwrpt75cnfu3fPIDVmkzGHFPI9469M9BXQM6C8fTPJ
 OAew==
X-Gm-Message-State: AOAM532gvGjzajrS9ht4yJDCKitVjVXNRk3fqBxcLF8r/JUd9Lv1yBvm
 QO2yiMyHFD9kyJKEGRT2bxE=
X-Google-Smtp-Source: ABdhPJyGxQ03AlkRuV9C6uyzsgU6sAhvDWJhUEEl2liefz7HAPyu+Zol+AXwm3gKjmn6HD987wGlCw==
X-Received: by 2002:a05:6402:382:: with SMTP id
 o2mr7148651edv.238.1617830837615; 
 Wed, 07 Apr 2021 14:27:17 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y7sm8099604edq.88.2021.04.07.14.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 14:27:17 -0700 (PDT)
Subject: Re: [PATCH v4 for-6.0 02/12] esp: rework write_response() to avoid
 using the FIFO for DMA transactions
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210407195801.685-1-mark.cave-ayland@ilande.co.uk>
 <20210407195801.685-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1299d629-fb26-5639-d337-e6f126dfb3d8@amsat.org>
Date: Wed, 7 Apr 2021 23:27:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407195801.685-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

On 4/7/21 9:57 PM, Mark Cave-Ayland wrote:
> The code for write_response() has always used the FIFO to store the data for
> the status/message in phases, even for DMA transactions. Switch to using a
> separate buffer that can be used directly for DMA transactions and restrict
> the FIFO use to the non-DMA case.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  hw/scsi/esp.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

