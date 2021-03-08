Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ED73305B2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 02:53:18 +0100 (CET)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ55B-0001o5-2b
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 20:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJ53y-0001MX-6J
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 20:52:02 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJ53v-0003k5-ON
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 20:52:01 -0500
Received: by mail-yb1-xb31.google.com with SMTP id u75so8522424ybi.10
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 17:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ovBAJ9yiy0kF8bkfEvmcTEl3ioSx2ZuhHUSEcP9l39E=;
 b=najBIkWOX0eJYLZNMsxQab/Myp/V5ZUtLuTFDFMupvhp/x6knX2LCv4qFqMBL4fx03
 mebs/pRc6GFFlPfr8UM8IbnviCxcRW6N52wd5gtYJUulEpU3xlSKVOmPuDRt78O8HlAq
 TPmfb49aUmZeaxIGlqa5EjkNPyZjWth5Yjbc7OB0xwrf2QavQNo+NjKtUxSgnbytMWrA
 IODHVi0H81njK1VfXit62KjuZzbykuh5d5FOXdHpql+fKuFijLx7co9kITfRXtADWVVk
 O9PSlG/KrEvxNcM3+hC4zwfPflnsrDZpMBEwrir5zU10He4374vmm8SVhFFzuCXIh7im
 yrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ovBAJ9yiy0kF8bkfEvmcTEl3ioSx2ZuhHUSEcP9l39E=;
 b=XzJd1f+BjGHA23+CqYzcfQx8EXW+cAuHDXc4QneSItWmx87JLj+MfdAXanv7Q/QTIH
 gWtqLgPWfzOCmET1DL2jCgF4YdWl4iR1A3weWxv6LTwSUIOuZlelmE6KoErsnjMW6vYI
 mUnHOFaS2aNZtGjri6wSkSoxeXqB61esHRiSCJjti9TT67UxzHRGBM/lIxE0ugie28C6
 bP9wNqlm5e+rSRvcSw8YIA8yhtWk4w+KCWtHe5d960Wi7bCUhFY73WJgJlbtn0xxO8HF
 zwovl8oicRafqHJ3yxzGLYijSu6pEud1WVujWXiQY5UfiLghEkaPSjwiKstdVedFjz5y
 GRsQ==
X-Gm-Message-State: AOAM532eXrNuMqcfSDV0+5nG1PR/tZCZ7jy1GOikZnQXczqDZdhX3X/K
 ywIVQP3vQTdtX9NuqoXMsnQL6f6Wwmhia2IL6VU=
X-Google-Smtp-Source: ABdhPJxkHsRCa943W2Y4epYa5enrHGePYZbUHt+WhHdhCg6OzbKw/XoNZtxwZ0z1RMhn3FF0Iis9TTHAJs09jupDErw=
X-Received: by 2002:a25:c090:: with SMTP id
 c138mr28336452ybf.314.1615168316717; 
 Sun, 07 Mar 2021 17:51:56 -0800 (PST)
MIME-Version: 1.0
References: <20210303191205.1656980-1-philmd@redhat.com>
In-Reply-To: <20210303191205.1656980-1-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Mar 2021 09:51:45 +0800
Message-ID: <CAEUhbmWUSJbuXPxWywZ_eU+mrmE88qpnF4_1Q80uGNVyi_JN3g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/10] net: Handle short frames for SLiRP/TAP
 interfaces
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 4, 2021 at 3:12 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> This is Bin's series but using iovec structure in 1st patch
> for zero copy.
>
> Bin's cover:
>
> The minimum Ethernet frame length is 60 bytes. For short frames with
> smaller length like ARP packets (only 42 bytes), on a real world NIC
> it can choose either padding its length to the minimum required 60
> bytes, or sending it out directly to the wire. Such behavior can be
> hardcoded or controled by a register bit. Similarly on the receive
> path, NICs can choose either dropping such short frames directly or
> handing them over to software to handle.
>
> On the other hand, for the network backends SLiRP/TAP, they don't
> expose a way to control the short frame behavior. As of today they
> just send/receive data from/to the other end connected to them,
> which means any sized packet is acceptable. So they can send and
> receive short frames without any problem. It is observed that ARP
> packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> these ARP packets to the other end which might be a NIC model that
> does not allow short frames to pass through.
>
> To provide better compatibility, for packets sent from SLiRP/TAP, we
> change to pad short frames before sending it out to the other end.
> This ensures SLiRP/TAP as an Ethernet sender do not violate the spec.
> But with this change, the behavior of dropping short frames in the
> NIC model cannot be emulated because it always receives a packet that
> is spec complaint. The capability of sending short frames from NIC
> models are still supported and short frames can still pass through
> SLiRP/TAP interfaces.
>
> This commit should be able to fix the issue as reported with some
> NIC models before, that ARP requests get dropped, preventing the
> guest from becoming visible on the network. It was workarounded in
> these NIC models on the receive path, that when a short frame is
> received, it is padded up to 60 bytes.

Ping?

