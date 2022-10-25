Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7FC60D1D4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:46:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMxz-0004S5-9M; Tue, 25 Oct 2022 12:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMxs-0004MB-RT
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:39:47 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMxp-0001Nf-3Z
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:39:44 -0400
Received: by mail-pl1-x62d.google.com with SMTP id u6so11409238plq.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eSG8t2EYRF7g/98vc9d+RYyDJ/C2i0OVRbVusy9w+Hg=;
 b=j0pzcmdfNl7Ee89sAwWYmEGGT4On8a5Kcj89ahGF7C5RKjNviGF9e65AnamlglSDCU
 WNVvtBe7ugIHyiusrMCfytIG0B7nsgYU0YTNT2TNNLQal3YbIZDh09eER4DkRL4n4/g4
 sBF5vgzkSF4IJEGuIn7DVnGSqnnblzKnfZZTNtuPTPvQC7prE5l/JWbt52USn7mB5T9e
 j557OBx+Wc3NfTw3ZqqRicg+suqH1ObLNoN2SHOGyL5RCh0FMw+FtaYDx1cEA327DHkv
 D6Kz8rY3BZjjcISsONoQMsx+WXfQrpnmKbPOF2j46AHGW619TyBLLyFCnUZ+J7MpZxyi
 e/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eSG8t2EYRF7g/98vc9d+RYyDJ/C2i0OVRbVusy9w+Hg=;
 b=hXYv9Gc7q3RKjSmiaKYIktYcgBgKr9B4Cwzl2gutG3oc0YkkWOoz0edg/+pehECahj
 HFO/19RWppZOmP1hKHZ5QVmmc7NS58ErF+luh3CSlbtsO9e/qNA9jmnXzSVq0aeHBTNy
 HmGOCx+Gbc+sS6vu5YfxDowhqaQLbhU5Q/EbIm/u9C2Wa6HtfQ/zRtD1D6Rxx6Zg8rW2
 0D8BMJ9jxS2LTwfN38QVrieFH4jxqcb2xTnUJnB5HdFfViFBjh032JXsmLH60euKV841
 TI7TyPaRg+iysamBrr1ymaRu1CHnQbDapzjIMnl3ffcitAlKi3vTzOFkW8WAp+aTuwE3
 j5hg==
X-Gm-Message-State: ACrzQf35KPr+glAPZYCSuhnjnxQNA90gP57pWEbNhc/LmCYkkTwANUBG
 uux7OcCWfxThvFDCJQ8ja4AlmerGRGHStUYC0RHlpA==
X-Google-Smtp-Source: AMsMyM7TsVQ5aqsI9MzSbNWA1E4mBa1Jlj45A4EUBAXi4DlfrszBJ3qo3U7ktaaw0h7M1vvGdnLfEjgx9UXrfDGwQuU=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr38015695pll.19.1666715979354; Tue, 25
 Oct 2022 09:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
In-Reply-To: <20221025004327.568476-1-Jason@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 17:39:27 +0100
Message-ID: <CAFEAcA89uq1UnO=QatVPW08t-THfkq61H7ct3yeaCm24LgoHFA@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] rerandomize RNG seeds on reboot and handle
 record&replay
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 at 01:43, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng seed that QEMU passes should be
> re-randomized, so that the new boot gets a new seed. This series wires
> that up for FDT.
>
> Then, since the record&replay subsystem makes use of reset as well, we
> add a new reset cause for record&replay, so that we can avoid
> re-randomizing in these cases.
>
> Version 4 prevents the new reset type from leaking over QAPI, documents
> this alongside which version it was introduced, and adds mips and m68k
> machine types to the queue.
>
> Jason A. Donenfeld (11):
>   reset: allow registering handlers that aren't called by snapshot
>     loading
>   device-tree: add re-randomization helper function
>   x86: do not re-randomize RNG seed on snapshot load
>   arm: re-randomize rng-seed on reboot
>   riscv: re-randomize rng-seed on reboot
>   m68k/virt: do not re-randomize RNG seed on snapshot load
>   m68k/q800: do not re-randomize RNG seed on snapshot load
>   mips/boston: re-randomize rng-seed on reboot
>   mips/malta: pass RNG seed via env var and re-randomize on reboot
>   openrisc: re-randomize rng-seed on reboot
>   rx: re-randomize rng-seed on reboot

Hi; I've taken all of these except the mips/malta patch into
target-arm.next. I have some comments on that one but I
don't see any reason to hold up the rest of these while we
sort those out.

thanks
-- PMM

