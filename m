Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A812D8D07
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 13:10:26 +0100 (CET)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koQCn-00031C-UJ
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 07:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koQAu-0002EX-QG
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 07:08:29 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koQAo-0008Uj-Fg
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 07:08:26 -0500
Received: by mail-wm1-x343.google.com with SMTP id 190so1077533wmz.0
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 04:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6dB5Pfi4qMTn0pQeUWpoUkm3K94bwjP/ZJmCFRyjllk=;
 b=s4c7slOdMMZQeyHdmOErrXJkmX0FdDW5rrdDclJzDm3MMyvYJ4wXowPHcypf8U9huS
 p2phFyGKjLee4R9oWKm8Xv8PXxgLL3j0V4dcDkG5Ubh5grVwzp25HxigZ1GdXNqelbcM
 tBNilKrp3o2lzp7Hlo9MB7F9BTpULTFmp3LWvYAVPE8+Ky9GwIhAdWAlq9sLhS3t8MKs
 NM4t7XbpU7YjTZ0jC6qTLCYyZrDoUK+9eTfSorU1uYLX8eS/o3N27eae3IY0q7Zgzrz5
 zAqSs9ZUYQHPnFpc7zMX9HnbXpMSypRSQ6bthVVp/a5PtHvjv7JZwjuLcWBHKCoV2M3d
 qdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6dB5Pfi4qMTn0pQeUWpoUkm3K94bwjP/ZJmCFRyjllk=;
 b=GnxKtk7RN12UmiWUllAxMubqTRRqiLs6Izn6HMxwLFfnHoDWKRBGtRtXEmRZk/VMzg
 pRXUwqXRfJ2//ZpUPCReCgAe8DD1J+PWbcXfk6mrKYuVd5xaBOS1OKOlqEt3dsRUCZmP
 NsO/mF/gRT2hKTUjHodvEPLg7Gu6/QbKT9v8cgCMS6V6+EYBBkGxCVjN8/1hiEdOKIoO
 kdYMWqr6xNrkxF+JrNjaRvDLRJfwYzyPG6jMY6DZLO/6qJblXuebf943tCoJDcnStYlC
 PWRyQmHlyvHRT6lGZoGOQpTztwb7IAmcz+0ATZ34cM9y+BOs+mJTTR0Twz6A7Tues1e6
 qfNg==
X-Gm-Message-State: AOAM530S/Vr9w04CdK9bfQrGOwBPFrtPe2rEf5dWFB7X1lfrI9db7mqR
 FrvmuopIIK47r+CeDr6hCzY=
X-Google-Smtp-Source: ABdhPJz1zfrfdbIWkIbX9QJT1k9L0cVpFQX0VEtlUJaHVADabcUOP21HRdXjtuAHTd/+v8nznOejew==
X-Received: by 2002:a1c:5605:: with SMTP id k5mr22827952wmb.99.1607861297346; 
 Sun, 13 Dec 2020 04:08:17 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id q17sm25373532wrr.53.2020.12.13.04.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 04:08:16 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/sparc: Make grlib-irqmp device handle its own
 inbound IRQ lines
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201212144134.29594-1-peter.maydell@linaro.org>
 <20201212144134.29594-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2ec39316-642e-6bce-b884-d4280e2fe933@amsat.org>
Date: Sun, 13 Dec 2020 13:08:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201212144134.29594-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/20 3:41 PM, Peter Maydell wrote:
> Currently the GRLIB_IRQMP device is used in one place (the leon3 board),
> but instead of the device providing inbound gpio lines for the board
> to wire up, the board code itself calls qemu_allocate_irqs() with
> the handler function being a set_irq function defined in the code
> for the device.
> 
> Refactor this into the standard setup of a device having input
> gpio lines.
> 
> This fixes a trivial Coverity memory leak report (the leon3
> board code leaks the IRQ array returned from qemu_allocate_irqs()).
> 
> Fixes: Coverity CID 1421922
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/sparc/grlib.h |  2 --
>  hw/intc/grlib_irqmp.c    |  5 ++++-
>  hw/sparc/leon3.c         | 21 +++++++++------------
>  3 files changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

