Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310D6407DE4
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:19:46 +0200 (CEST)
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRGj-00041U-8M
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRFK-0002ul-W7
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:18:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRFJ-0004VL-Il
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:18:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id u15so4528917wru.6
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dTu57Md0meovvtAvj3ZgR33IzyjBN7hq39rd7KOP54w=;
 b=JgWzFwKWm29RUl1whJQXBWv6JyEF/jIZIY9JGzMBrLUfzZ2bCKSsro6Jcmm9GcOCio
 +XRuy10ova65VSDSMF0/aeW1meQUPk4X5ONTVAotC130Io3TzVxWqzZLIHXsDOEGshGc
 RO/KTgVbtDTWeXYAZrsCy1pDbMS8JDPCS+ZyZzvnL4OSYBjoczumyKF0o17olU2nVSyU
 1UteoK5FV3isfk4D1yDSw55gMYIYBt9yGbyxi0i+UxKQzad4X2CQk+XresdLZvBAwm7B
 FM6JMaL0BNdAgk99iW7EUiQXFkYMEQkD1XuB/Bl721maNi4NgqomaS/naJdmt+Zx5v0o
 OVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dTu57Md0meovvtAvj3ZgR33IzyjBN7hq39rd7KOP54w=;
 b=d8nMtqDphvnKYBvQj3jeOGO5Jl29vWLPgvFAgnTPAephZhUC9tuxe4kuiS9kmkdZHB
 5azDE3FjLg3SoZ6KQnxINlpA+iNBAZNCk5V66/1ec1CoYk0W+Yk6+XQnvvqLuNtZodg+
 SwcRCBBbAmGx7BI17B/SgGKFkc/8eGckZq0KyESgEW7B830StQFfApa0j75cz+38+Yjq
 moIhK35WRnS5VCDmdr+MFaoqb/IjJ2tbfq40Wv0zB7symIJv4LWLpYnRGKnzwJ6FupQB
 loYh9VvFZP+xxqMz8JtPYEySJMBOMpUXXveeKvgwU6mUFsDVrcwLfLukXcTqHkFtIKDW
 Oz6Q==
X-Gm-Message-State: AOAM532TJb3wj+iE/Cv3JCz0WyMjN2AWU/2b0dAm22drUhqo6oM44+96
 cwYsezddzSmpZpegP2/K5yw=
X-Google-Smtp-Source: ABdhPJzOGQ3qqFhHOoSgWezmtNl+9CKSyPPFEgE9a2J+DPJ0T/XbphPeiUtMk8Csi0gU+G1GrPXP6Q==
X-Received: by 2002:adf:e643:: with SMTP id b3mr8116851wrn.67.1631459895825;
 Sun, 12 Sep 2021 08:18:15 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y4sm4380361wmi.22.2021.09.12.08.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:18:15 -0700 (PDT)
Subject: Re: [PATCH 07/20] nubus: add trace-events for unassigned slot accesses
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-8-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <439e516b-baac-0334-ba61-87c21e666506@amsat.org>
Date: Sun, 12 Sep 2021 17:18:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
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

On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
> These allow tracing of the Nubus enumeration process by the guest OS.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bus.c  | 10 +++++++---
>  hw/nubus/trace-events |  7 +++++++
>  hw/nubus/trace.h      |  1 +
>  meson.build           |  1 +
>  4 files changed, 16 insertions(+), 3 deletions(-)
>  create mode 100644 hw/nubus/trace-events
>  create mode 100644 hw/nubus/trace.h

> @@ -38,7 +40,7 @@ static const MemoryRegionOps nubus_slot_ops = {
>      .endianness = DEVICE_BIG_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> -        .max_access_size = 1,
> +        .max_access_size = 4,
>      },
>  };

This patch does a bit more that what is described.

> @@ -60,7 +64,7 @@ static const MemoryRegionOps nubus_super_slot_ops = {
>      .endianness = DEVICE_BIG_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> -        .max_access_size = 1,
> +        .max_access_size = 4,
>      },
>  };

