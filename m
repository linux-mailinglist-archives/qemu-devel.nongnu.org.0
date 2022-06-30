Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2656215E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 19:36:35 +0200 (CEST)
Received: from localhost ([::1]:36250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6y5i-0005pA-66
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 13:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6y2T-0003q8-EV
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 13:33:13 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:46666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6y2R-0006TO-UP
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 13:33:13 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31bf327d4b5so97041677b3.13
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 10:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SDrOeJtsOLwKhWCSIzRNnzHG+Y1PliIRr5PZhZzxx7M=;
 b=ff3RYV/nScO7xKCwEgjjeZ07YlOuiy0cg1ZDh4vqWI0IGaxFzwUjoS6e849VHQdJto
 dRbaJaNbJ9CK7pKJH8lyMmyVJDRXy9ntGS4LhOBDMCnZho7Ubw6YiaZowM6FQGqMzhNH
 Gxwn4NCvbRlBZPX+DLdfeMIplwdTL29jKz5kuOENu60L2OvNNxPnFChVyl2PZXp0Or+5
 pKza77/Bli4C2tniRpWhG/TUXDcZTIdUXCTn/iMpHYYFurly26OG67KxD8nt4O5pNuRH
 0y0SE58tDma94Nz/PaOBFlrQwepzpzwX8gWdFBH5Kp/lTTmDcewwONEqEpE+FSyKu14M
 /PgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SDrOeJtsOLwKhWCSIzRNnzHG+Y1PliIRr5PZhZzxx7M=;
 b=0vIujA9xS85Yupy11Og6yfUuG+glpAAgbTtGvFPCcc5SnKwDWHd1eTwKVVr4gLFohX
 Y3NiZLQrzRy70ci2S0hoeYj76rlydmnIvlh8jVG/4xOxS0tfBk8Rmtfnt1OCa6cuaHGf
 vgfjZar7CV5BI8moLaa9mfDBFBec9BYbV3mENuNtJ4V5cRgc8d2E0o3XGNgoq9KeXuw6
 YzR2jc1RCJvETVt7q18ItR4oteiCgXkI8mIOef/JhhHa/8wjiZdhlwuzMZiijarFRxZo
 ApLbWdFzEA9UGEsEaaCXybwweWnZdqeYXrAwDd7Z6E9D3k82GW0gSu7K/BDOS5XF33qK
 gVrQ==
X-Gm-Message-State: AJIora9zgxd7lSddWnl631nvEuoXxnUmdQsZG46PtWMgnD3lssWgAgDE
 UIR8q3wDLzOeyT2ipZFUrcbNLOjXOkt88rTv3rCAKQ==
X-Google-Smtp-Source: AGRyM1takTxrbtsV1eUqIoAjReLbcvReHDdL3vs4RixdNdipOzn09XPYniSVTk1PT+H9tsb84etMr91416+196YK4C4=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr11599282ywb.10.1656610390206; Thu, 30
 Jun 2022 10:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220624082730.246924-1-pbonzini@redhat.com>
 <9d4d83cc-d4e5-6b8e-2ed9-00cefb534082@linaro.org>
 <CABgObfa+RqJigqdzq1CJjVyCOh2GUT9CH4YJfDxobXPDi87n5Q@mail.gmail.com>
In-Reply-To: <CABgObfa+RqJigqdzq1CJjVyCOh2GUT9CH4YJfDxobXPDi87n5Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jun 2022 18:32:31 +0100
Message-ID: <CAFEAcA_g3shtZ-AzzYh=Cie4X-0p5=ngx=SMQ1JUHSXPZNs=WA@mail.gmail.com>
Subject: Re: [PULL 00/14] (Mostly) build system changes for 2022-06-24
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Jun 2022 at 18:14, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
>
> Il ven 24 giu 2022, 17:57 Richard Henderson <richard.henderson@linaro.org=
> ha scritto:
>>
>> But then the i386 cross-compiler isn't used:
>
>
> Yeah, that was intentional. In theory a softmmu target is freestanding an=
d does not need anything beyond the compiler install, so configure defaults=
 to the native compiler, which is biarch. That however assumes that the com=
piler install includes the libgcc for both architectures.
>
> Does that mean that Ubuntu installs GCC without a 32-bit libgcc.a?

I think they package it in a separate package, eg lib32gcc-9-dev
(adjust package name to suit gcc version).

-- PMM

