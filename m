Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE5A3FD8D9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:35:18 +0200 (CEST)
Received: from localhost ([::1]:35576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOWT-0005eA-Ot
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLNrf-00030r-VV; Wed, 01 Sep 2021 06:53:07 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLNre-0001W3-D6; Wed, 01 Sep 2021 06:53:07 -0400
Received: by mail-yb1-xb32.google.com with SMTP id n126so4236592ybf.6;
 Wed, 01 Sep 2021 03:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Un+ZolysfcyfTySKsZ6MUdvG6CF06LXmy81Vz+1IUwc=;
 b=jcVbY0IWLzIOneqJpFjvnom1Qhg1cTp7JIaoDzxz5Q8oluCi07p5JNn6xHAU3C43SE
 s0nTQnqmLHgdfgvLJjG8Lh26gY1n3Ydiw6D5Qeogq5t45kFDfeK2hWBvXAcCjQoyPx4m
 9Ana7uM4FuzOIVK45zxmba15kU+/ZMPKxiIBkvWmD6nlEa5eXVOvL06dSq1I85iMid3r
 V20fgw9Z9SrXWmilj0FSpg1SRsQrtZ1Y5ohfKBbZV6GQ8tiDtcBHub8ZTJzwL7p+hylY
 0lp2m8y7HOR4prH+7Ebq5k/2k407ESgg+hQ/CSXQPNpAu79mEq1SbOGuGpRDef1lpFAM
 9uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Un+ZolysfcyfTySKsZ6MUdvG6CF06LXmy81Vz+1IUwc=;
 b=GiRm5IPi7x4XOZzJSwGmB9tzvZF2OZ7tCgZ3x9Vs7dpufhAISag7v3rgTtNvn7krCS
 8MjjdHzxb1ABNuln3m6HAYJSpCiaGSEvridEYS6TBtfOa/E5nK6prLHtOTQMwsX9/KrX
 omrrimD2Q5c8EoYyom/IJVGoFxmnlfhqT62ww9AjgPm0B3QEBz0IsWrhpo1Zh48p/ltc
 YJReU8zHEhnqT2ag3QG/FzlM6q5IctdEPv0okYQWTP1wLlS65tIlp5NVkI3UF0j9/2mD
 FraXbnMPDoxf1aHu5o4dIX+duHowmURhNeYOIc3XGZimNA3rI98WJovEv8iNVarV7pPj
 2wAQ==
X-Gm-Message-State: AOAM533eMhA5OemlMFuii0nMSQpUbsv8M4j9M2VjcmgeXsBlVgS+j2R0
 5Zl6/y9jDbVjoukbdMy3CXSnbZvtLvatxXrcl9Y=
X-Google-Smtp-Source: ABdhPJwvf01WjmptrIrh7vAeX/eN22DT8g1MCuZ5lYnBFUPmoLknlL63q3xB7kNRlQwiVQOuvlrPowf2B6Bm1Zj8kGU=
X-Received: by 2002:a25:be09:: with SMTP id h9mr39523943ybk.239.1630493585103; 
 Wed, 01 Sep 2021 03:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-6-bmeng.cn@gmail.com>
 <20210901083251.GG6340@toto>
In-Reply-To: <20210901083251.GG6340@toto>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 1 Sep 2021 18:52:53 +0800
Message-ID: <CAEUhbmUs+K2-5iM93vdTxdJ6H-tDo9etwzao5cXJzLFCC5rtXA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] hw/char: cadence_uart: Ignore access when
 unclocked or in reset for uart_{read,write}()
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

On Wed, Sep 1, 2021 at 4:32 PM Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
>
> On Wed, Sep 01, 2021 at 11:27:24AM +0800, Bin Meng wrote:
> > Read or write to uart registers when unclocked or in reset should be
> > ignored. Add the check there, and as a result of this, the check in
> > uart_write_tx_fifo() is now unnecessary.
>
> Hi Bin,
>
> I thought I had replied to this but it must have gotten lost somewhere.
>
> We've got SW that expects FSBL (Bootlooader) to setup clocks and resets.
> It's quite common that users run that SW on QEMU without FSBL (FSBL typically
> requires the Xilinx tools installed). That's fine, since users can stil use
> -device loader to enable clocks etc.
>
> To help folks understand what's going, a log (guest-error) message would
> be helpful here. In particular with the serial port since things will go
> very quiet if they get things wrong.
>
> Otherwise, this patch is fine with me.
>

Thanks. Will add a separate patch to enable a log message for all places.

Regards,
Bin

