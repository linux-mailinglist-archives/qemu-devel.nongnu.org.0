Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A36AC255
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:07:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBUo-0005vP-BB; Mon, 06 Mar 2023 09:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBUm-0005up-8v
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:07:20 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBUk-0007XL-PL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:07:20 -0500
Received: by mail-pf1-x42e.google.com with SMTP id fa28so5816434pfb.12
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111637;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T2wiUiHhuPJjTnJkQ4TTXnOMH9vrpZf0Lp9HQB8GqL4=;
 b=V3ARhmoTufWbfV0Vcpl/3fe+TlOifJipmvHV6cxnRvL+97HfRy5OGetevfH7+JSJgu
 kD2r0dNu72AxjZgv+Z8Bk8hlPKGn1eJovdVdsHjUaVVYzQDXXOq0uqbmsEwrShSoMTRR
 /FWuattScQMJrBbEXOOAkSpp2PIHSsIZ2PrfPQDQQsn4VoVWh1YX8CncPzG2Aevue4z5
 7q07uXAN6MMGJ+gkGBEBBpCy0Q2jhZZrR9vDCe9HZKRagj1NgloEvbgVqAMgl2ZBjzn1
 9jSvJtxNVnu/Uum8FFDd6pzogrXWC0NiltYcMtHUH0b+HlFRKaAMkP645x+ItHSksc0y
 Fl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111637;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T2wiUiHhuPJjTnJkQ4TTXnOMH9vrpZf0Lp9HQB8GqL4=;
 b=Y8zUpy51KTezt0d3qqKMUBa2Ab+90yspI3lrCaNAtzEFC5wsf+A2/p9TGXBEapyB5O
 fgcfPfS8RA0K/vP8tW5sD1Pi7Ex+mfR4dCJvelxSSUOuC7jWhrf7X0vrfCGZ97c+57Ax
 N3GZ4Iekhp7SzTkkRY+YseTkE9j8GqNL7sysimlG0KYnTBIVkPDzoCT9pXNEFr/hJUIy
 SG7yF84EZKIAGYfwsN6dRTJ7lM2I1Bqe0v8YK/sRDss3wv/k4JeMxBizDI4NL3TNQEhK
 Gq2Q5rrZuFWXDjqnNBfpvWHxG3RmXEzjF0omeiwoZuS2iTj8u9dxVMHTc1XU4BcrilhR
 gOgA==
X-Gm-Message-State: AO0yUKVLTRw4wAS3wrVCpcfQloIY9BQhYlQgmCFOTKEFvZX7W1LpUdO1
 TXbSmPXliR/0uQ6T3Ri1XqQlBVAW0Vod7X5qWPzMcw==
X-Google-Smtp-Source: AK7set/Fa95eMaCUF3i3OVejhDpepbU5x+llNxk7PPKJGfdVANhU1OulKDDcmh0bLQewS1KJhkhdZILfDJsw+VHd73s=
X-Received: by 2002:a63:a80c:0:b0:503:a7:d244 with SMTP id
 o12-20020a63a80c000000b0050300a7d244mr3827135pgf.9.1678111637286; 
 Mon, 06 Mar 2023 06:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20230220081252.25348-1-qianfanguijin@163.com>
 <CAFEAcA_VzChyJ=E_QG0PUd==9YfEwmthO7MfYoXpp7=XfgqZ5Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_VzChyJ=E_QG0PUd==9YfEwmthO7MfYoXpp7=XfgqZ5Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 14:07:06 +0000
Message-ID: <CAFEAcA8GkvJixkaiwMJU7JMf+ZUjG57KUA=12G49zvMS8PKW=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw: allwinner-i2c: Make the trace message more
 readable
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Mar 2023 at 13:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 20 Feb 2023 at 08:13, <qianfanguijin@163.com> wrote:
> >
> > From: qianfan Zhao <qianfanguijin@163.com>
> >
> > Next is an example when read/write trace enabled:
> >
> > allwinner_i2c_write write  XADDR(0x04): 0x00
> > allwinner_i2c_write write   CNTR(0x0c): 0x50 M_STP BUS_EN
> > allwinner_i2c_write write   CNTR(0x0c): 0xe4 A_ACK M_STA BUS_EN INT_EN
> > allwinner_i2c_read  read    CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
> > allwinner_i2c_read  read    STAT(0x10): 0x08 STAT_M_STA_TX
>
> This seems like overkill to me. We don't do it for
> any other devices. If we did want to do it we should
> do it by providing a generic mechanism somewhere that
> it's easy for devices to use, not by implementing a lot
> of string operations inside the code for this one device.

I disagree with this patch, but I've taken patches 2 and 3
into target-arm.next for 8.0.

thanks
-- PMM

