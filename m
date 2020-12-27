Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0C62E31A5
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 16:09:56 +0100 (CET)
Received: from localhost ([::1]:54736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXgB-0005NE-8i
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 10:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXeW-0004tq-Kp
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:08:12 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXeV-0004ep-4j
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:08:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d13so8286396wrc.13
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 07:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lJ4rV62j7ang9SUvL6PL0Iofa9pkrCSnCO4gMWh2SG8=;
 b=SWaweCMhbWcMX/ywwPEYhZOi/PUyxmOxuD1dacbe9SEArpQnQNzD/82V6WfnsIou9t
 0s0x/9mANjOk3FJlB1FbnOjhVqXnX2Kc7fkx0lD9DQ/UfAf+eEUYcvgjp5aIYiZUDHMT
 9hP0ZcRI3McFohaIdd2ajBfVe1FN47tbHOQF41C9H8TO/K4kgPgAdS20CYsccLKGzZ0o
 QDP3Xh+hCIcasHS6HoeVqflLfZ2abklB1Wmc/rbvrkHZwZ5wcTSNb6e91MXEXcprncat
 eV8kgAq9/o/+xniQPIQZmLmpUBW9RZoE2aAU0lBYVtPdb/sO4bsU+Jvq8SxFTzedvGdx
 l47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lJ4rV62j7ang9SUvL6PL0Iofa9pkrCSnCO4gMWh2SG8=;
 b=mN4aQfxXdzs91UTT6PQOxcSpzHd8pQ6IheKLyhZRfyl1GZYEdM715MV9ACAfDLZE0v
 dbusnJFy6NOrHm6/jge8RffuyGspTUOCq2ypysGBgPwmy9c9ciqOuvUWMPBVr+A4tr1Q
 p9I7n2h2bd4nFFThLO9XKsOKwSLNvjyBPbMnL3Xe9tdP6Nk4riyIDUW7MocQBLNnYGXK
 OT3C+0hG084SoaiObPJ6nv3d9xsS74G6ICKxjAm/eLFHkCitbTBgumcmszkjHzmulFuB
 omBDZBXVtceq37ikFf5WWrmMUc7C3TfDPsjlZTU18tusPKtcHdp46kCwniZ2YlIj5If3
 uk2A==
X-Gm-Message-State: AOAM530uV/4aFIzpMkYZdNu6p9Q7BVGHZoY8jyuXwlfKD1l7sXLXGd4i
 h7P2YkWjg+J3EKOn5AnJ4+WHMuxIhgc=
X-Google-Smtp-Source: ABdhPJyj2au/2uDCXA00nyF9Or1wzv/ti3CzjJNIoZsVHRrt6tpaEJvyOIWjduVKE77aVlg2kVwfeg==
X-Received: by 2002:adf:9cca:: with SMTP id h10mr47071593wre.77.1609081689804; 
 Sun, 27 Dec 2020 07:08:09 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id y7sm15831527wmb.37.2020.12.27.07.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 07:08:09 -0800 (PST)
Subject: Re: [PATCH 09/12] vt82c686: Convert debug printf to trace points
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <d404014f90d8ba9d09d4c000ca599dea86992864.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7d9d823d-d75b-c586-218a-e40de35d8b6d@amsat.org>
Date: Sun, 27 Dec 2020 16:08:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <d404014f90d8ba9d09d4c000ca599dea86992864.1609031406.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/trace-events |  6 ++++++
>  hw/isa/vt82c686.c   | 51 +++++++++++++--------------------------------
>  2 files changed, 21 insertions(+), 36 deletions(-)
...

>          switch (superio_conf->index) {
>          case 0x00 ... 0xdf:
>          case 0xe4:
>          case 0xe5:
> +        case 0xe6 ... 0xe8: /* Should set base port of parallel and serial */
>          case 0xe9 ... 0xed:
>          case 0xf3:
>          case 0xf5:
> @@ -74,18 +68,6 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>          case 0xfd ... 0xff:
>              can_write = false;
>              break;
> -        case 0xe7:
> -            if ((data & 0xff) != 0xfe) {
> -                DPRINTF("change uart 1 base. unsupported yet\n");
> -                can_write = false;
> -            }
> -            break;
> -        case 0xe8:
> -            if ((data & 0xff) != 0xbe) {
> -                DPRINTF("change uart 2 base. unsupported yet\n");
> -                can_write = false;
> -            }
> -            break;
>          default:
>              break;

This hunk belong to a different patch (does not match the patch
description).

