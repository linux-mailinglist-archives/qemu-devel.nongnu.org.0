Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC093733A7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 03:46:09 +0200 (CEST)
Received: from localhost ([::1]:34172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le6c4-0007PA-5r
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 21:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1le6YI-0006nf-Ki; Tue, 04 May 2021 21:42:14 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:33350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1le6YF-0006Mo-HL; Tue, 04 May 2021 21:42:14 -0400
Received: by mail-qk1-x72f.google.com with SMTP id o5so210381qkb.0;
 Tue, 04 May 2021 18:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1fIDVFNSxPZswI1MhgIs71Bi/WXeW6s6/qftfdRvc4=;
 b=KaVMYTBwY8LkH6aeiZ0CGas9tAFhAAx9Eq67OOAT3T/r1hZkGdYHO9+RUvpzCbk0lk
 IoNM2ka5RjocVkMRC6R7L8FOFOWJ2ZT8X+wFvq+8SC+XtC0Vhnicc8I6X5oBuN9JwpFS
 hYzwvUDf8FyIv/i66Jw5hVmxQt4L2P01onbT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1fIDVFNSxPZswI1MhgIs71Bi/WXeW6s6/qftfdRvc4=;
 b=sJQU59EUA5Vxsl4uDAOLnKVTqIqP01gI4J9QjlYNdQX4d6vEBk9eezIPoCJptbKN3m
 xeCcVM25G0WOnhrGc6C8TtMOehS6VCiD6DO7xxfLMUbHawRl632bIaL9JZsQe/7xGRek
 LeacSjCRMloF60UZBZ6mHdfZE+RdVVzn03RSVWZlfvPFUB2pEXbR9We3N8L9L4pPB3RX
 TALoi14zvVvwmC3WZZ1lhMgv8jEqS1H6UGnQTL2Vn64Ano/v4B0xDfvR0GGDmprLV69C
 DcP4Iwv1/wPW6FKnzd4EH7vBKr3dgM7jOrwd14kBPORr5ERE338vt4xeAH9ch9pfwLT/
 FcMA==
X-Gm-Message-State: AOAM531gIWfyD/rGSrfqE4FSeBua/uWROGZZWmbmkGCuP+b37rdZ2SH4
 dPPR6fRsX0GsAzXQvVeN8UlEnDRdNapTZbd95NI=
X-Google-Smtp-Source: ABdhPJyvJepogZTYINJN8asccDpkienaXrsetbKbxqcf9F6iXtrfuGDqxmKFlyUvyp3u2Hp2KXcKvxiRGj5WiyjPyUY=
X-Received: by 2002:a37:f91a:: with SMTP id l26mr27754167qkj.55.1620178928797; 
 Tue, 04 May 2021 18:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210504162841.2884846-1-titusr@google.com>
 <20210504162841.2884846-2-titusr@google.com>
In-Reply-To: <20210504162841.2884846-2-titusr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 May 2021 01:41:56 +0000
Message-ID: <CACPK8XfYpLpkz8rHmr9A2BcKwZhPA2moyMCRSEsZun_1p+SppA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/i2c: add support for PMBus
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 May 2021 at 16:30, Titus Rwantare <titusr@google.com> wrote:
>
> QEMU has support for SMBus devices, and PMBus is a more specific
> implementation of SMBus. The additions made in this commit makes it easier to
> add new PMBus devices to QEMU.
>
> https://pmbus.org/specification-archives/

I'm not a pmbus expert, but I am happy that someone has created a
framework to model it. I've given them a read and some minor comments
below.

> Reviewed-by: Hao Wu <wuhaotsh@google.com>

Did this review happen on the mailing list? if not, I recommend doing
your review on the public lists, so we can see what comments Hao made.

> Signed-off-by: Titus Rwantare <titusr@google.com>

> +++ b/hw/i2c/pmbus_device.c
> @@ -0,0 +1,1611 @@
> +/*
> + * PMBus wrapper over SMBus
> + *
> + * Copyright 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.

You can replace these two paragraphs with a SDPX line:

 SPDX-License-Identifier: GPL-2.0-or-later

In addition, add this to your git config to put the .h files on top :

git config diff.orderFile = /some/path/qemu.git/scripts/git.orderfile

It's easier for review.

I'd also suggest putting your tests in a separate patch, following the
addition of the model, again for easier review.

> + */
> +#include "qemu/osdep.h"
> +#include <math.h>
> +#include <string.h>
> +#include "hw/i2c/pmbus_device.h"
> +#include "qemu/module.h"
> +#include "qemu/log.h"
> +
> +uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value)
> +{
> +    /* R is usually negative to fit large readings into 16 bits */
> +    uint16_t y = (c.m * value + c.b) * pow(10, c.R);
> +    return y;
> +}
> +
> +uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value)
> +{
> +    /* X = (Y * 10^-R - b) / m */
> +    uint32_t x = (value / pow(10, c.R) - c.b) / c.m;
> +    return x;
> +}
> +
> +static void pmbus_send(PMBusDevice *pmdev, const uint8_t *data, uint16_t len)
> +{
> +    if (pmdev->out_buf_len + len > SMBUS_DATA_MAX_LEN) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "PMBus device tried to send too much data");
> +        len = 0;
> +    }
> +
> +    for (int i = len - 1; i >= 0; i--) {
> +        pmdev->out_buf[i + pmdev->out_buf_len] = data[len - i - 1];
> +    }
> +    pmdev->out_buf_len += len;
> +}
> +
> +/* Internal only, convert unsigned ints to the little endian bus */
> +static void pmbus_send_uint(PMBusDevice *pmdev, uint64_t data, uint8_t size)
> +{
> +    uint8_t bytes[8];

Do you need to assert that size is less than the array size? Probably
not as all the callers are local.

> +    for (int i = 0; i < size; i++) {
> +        bytes[i] = data & 0xFF;
> +        data = data >> 8;
> +    }
> +    pmbus_send(pmdev, bytes, size);
> +}
> +
> +void pmbus_send_block(PMBusDevice *pmdev, PMBusBlock block)
> +{
> +    pmbus_send(pmdev, block.buf, block.len);
> +}
> +
> +void pmbus_send8(PMBusDevice *pmdev, uint8_t data)
> +{
> +    pmbus_send_uint(pmdev, data, 1);
> +}
> +
> +void pmbus_send16(PMBusDevice *pmdev, uint16_t data)
> +{
> +    pmbus_send_uint(pmdev, data, 2);
> +}
> +
> +void pmbus_send32(PMBusDevice *pmdev, uint32_t data)
> +{
> +    pmbus_send_uint(pmdev, data, 4);
> +}
> +
> +void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
> +{
> +    pmbus_send_uint(pmdev, data, 8);
> +}
> +
> +void pmbus_send_string(PMBusDevice *pmdev, const char *data)
> +{
> +    size_t len = strlen(data);

Do you need to assert that len is > 0?

> +    g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
> +    pmdev->out_buf[len + pmdev->out_buf_len] = len;
> +
> +    for (int i = len - 1; i >= 0; i--) {
> +        pmdev->out_buf[i + pmdev->out_buf_len] = data[len - 1 - i];
> +    }
> +    pmdev->out_buf_len += len + 1;
> +}
> +
> +
> +static uint64_t pmbus_receive_uint(const uint8_t *buf, uint8_t len)
> +{
> +    uint64_t ret = 0;
> +
> +    /* Exclude command code from return value */
> +    buf++;
> +    len--;
> +
> +    for (int i = len - 1; i >= 0; i--) {
> +        ret = ret << 8 | buf[i];
> +    }
> +    return ret;
> +}
> +
> +uint8_t pmbus_receive8(PMBusDevice *pmdev)
> +{
> +    if (pmdev->in_buf_len - 1 != 1) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: length mismatch. Expected 1 byte, got %d bytes\n",
> +                      __func__, pmdev->in_buf_len - 1);
> +    }
> +    return (uint8_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);

The casts are implicit in C, so you do not need to explicitly cast the
return types in this and the functions below.

> +}
> +
> +uint16_t pmbus_receive16(PMBusDevice *pmdev)
> +{
> +    if (pmdev->in_buf_len - 1 != 2) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: length mismatch. Expected 2 bytes, got %d bytes\n",
> +                      __func__, pmdev->in_buf_len - 1);
> +    }
> +    return (uint16_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
> +}
> +
> +uint32_t pmbus_receive32(PMBusDevice *pmdev)
> +{
> +    if (pmdev->in_buf_len - 1 != 4) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: length mismatch. Expected 4 bytes, got %d bytes\n",
> +                      __func__, pmdev->in_buf_len - 1);
> +    }
> +    return (uint32_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
> +}
> +
> +uint64_t pmbus_receive64(PMBusDevice *pmdev)
> +{
> +    if (pmdev->in_buf_len - 1 != 8) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: length mismatch. Expected 8 bytes, got %d bytes\n",
> +                      __func__, pmdev->in_buf_len - 1);
> +    }
> +    return (uint64_t) pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
> +}
> +
> +PMBusBlock pmbus_receive_block(PMBusDevice *pmdev)
> +{
> +    PMBusBlock data = { pmdev->in_buf, pmdev->in_buf_len };
> +    return data;

Returning the local variable seems like a dangerous function to have.
You don't have any users of this function in the models you have
submitted.


> +static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
> +{
> +    PMBusDevice *pmdev = PMBUS_DEVICE(smd);
> +    PMBusDeviceClass *pmdc = PMBUS_DEVICE_GET_CLASS(pmdev);
> +    int ret = 0;
> +    uint8_t index;
> +
> +    if (len == 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func__);
> +        return -1;
> +    }

I was going to suggest you find a meaningful error code to return.
Poking around at this callback, it seems like there's not much error
checking going on at the call sites, so it's hard to make a
suggestion.

Cheers,

Joel

