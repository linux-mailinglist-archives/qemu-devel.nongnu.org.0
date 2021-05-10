Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80264377D2C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:33:48 +0200 (CEST)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0QF-0006VS-Ia
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lg0Ly-00033i-Lz; Mon, 10 May 2021 03:29:22 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:46755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lg0Lx-00087q-1H; Mon, 10 May 2021 03:29:22 -0400
Received: by mail-qv1-xf29.google.com with SMTP id w9so7847617qvi.13;
 Mon, 10 May 2021 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJ6Hj404qOxsIDHajVUECCuH3xlZo+dbR5WymRvGt+Q=;
 b=HybMX8AEn0xzIOmHgtyouwu20fYvc+UKnngFzdLlv3Y1e1K+ybTPCLNrDXnK5Zr4I/
 UP6Ax2K+Y5tedO0imLZYy66HpfIPs8IVBoWMvgc5kwr7Z7lgk7PKS7Rql1kUxuq8w0vN
 3g6wTdO5EcXBHh4uQFnXrhz6izBUZRZLovXVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJ6Hj404qOxsIDHajVUECCuH3xlZo+dbR5WymRvGt+Q=;
 b=g7RZSCj0Fix6Tyu2QfEVGnPOVax5fWgyOw1HTwnTsz9bTYQ+E+CRA8oKihtJvGJnCl
 JV3x6EthufviCWW2ar0xIQcRG2naRLJEXZuxyUinOOBjOQLReepOt0P+vUvoWGVMRyJZ
 ZKbQTwmg+4/ET7UE1hK2hRqST7cBNwEmJpc3WyS5127gQMw3MxzF4iXt4nlaqiEid+TF
 pPujGu0kGevRfJMmr6dEJrBK8lrmuN2Gi+/slojaJw5sCgUXlF/LTXVPzJ1bh9bAP2rH
 8KQtIIm/OlXZULpgHYnzU6U4f6HkHIQ+TEexSVWTWopjzRdK8M77ZRMahYEGAsSITcG9
 yaRQ==
X-Gm-Message-State: AOAM532+jfse7zCUDc/TcBZ3w94nEIghrfn1YnbtRZfhStnyakUv2UxW
 dwnL7WgrLwxTaMv6+f1ktjh27Qyk7JKUfYN4TQZgMSz/
X-Google-Smtp-Source: ABdhPJzrhRlCYlE+fbLcL0lTQvilCA0eIuTqdESqB8q+I+aiVZBfgZgCBnnwi+EBajzUkGOogUvM/zwwA6obgLpLJ+E=
X-Received: by 2002:a0c:d786:: with SMTP id z6mr22025932qvi.18.1620631759670; 
 Mon, 10 May 2021 00:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210505170101.3297395-1-titusr@google.com>
 <20210505170101.3297395-5-titusr@google.com>
In-Reply-To: <20210505170101.3297395-5-titusr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 May 2021 07:29:07 +0000
Message-ID: <CACPK8Xch1gP7_Gou-ubzUTy57d8ykFUea3pqoGqvksR=BHRfNA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] hw/misc: add MAX34451 device
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

On Wed, 5 May 2021 at 17:29, Titus Rwantare <titusr@google.com> wrote:
>
> The MAX34451 is a Maxim power-supply system manager that can monitor up to 16 voltage rails or currents. It also contains a temperature sensor and supports up to four external temperature sensors.
>
> This commit adds support for interfacing with it, and setting limits on the supported sensors.
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> +static void max34451_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
> +    dc->desc = "Maxim MAX34451 16-Channel V/I monitor";
> +    k->write_data = max34451_write_data;
> +    k->receive_byte = max34451_read_byte;
> +    k->device_num_pages = MAX34451_NUM_PAGES;
> +    /* k->quick_cmd */
> +    /* rc->phase.enter */
> +    /* rc->phases.hold */

These look like they can be removed.

> +    rc->phases.exit = max34451_exit_reset;
> +}

