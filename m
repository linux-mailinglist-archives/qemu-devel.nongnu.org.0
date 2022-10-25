Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FA960D22E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 19:00:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onNE9-0001mk-1I; Tue, 25 Oct 2022 12:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onNE6-0001JG-L4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:56:30 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onNE3-0004i6-Qp
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:56:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C17B161A3D
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 16:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C70CC43142
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 16:56:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="eElU1F1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666716982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YlJfh/gNtsMDNta3AgRF8CSZedQFhEuys14w8XaXPZM=;
 b=eElU1F1Pmdmj5w7aGqCAS/l1grPyEP9aGdmcGu8UEhak1evLQ3tudkUItQrVsPvPSDgL5m
 q4nyWq9BIDyGDKyBMcbWpJDOaALuTCALbXnFAgqgCpHt97Jpf1R8oKiSjXL+Ons+IWVWac
 PyIHOJS5s02jxwfgfra3dIlIX7MuZ7Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ffe8d5ff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 25 Oct 2022 16:56:22 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id h4so11635181vsr.11
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:56:22 -0700 (PDT)
X-Gm-Message-State: ACrzQf1IPkBC+VyEvNv8j13ouwVt8w3FWrwuUJtWKrEYLO6CgX0yx4ig
 CyB7QhveV8XW5SldXqWGkP4D6GOgFIoc4Lg8L74=
X-Google-Smtp-Source: AMsMyM5OeY2O0yhK03C24J1fqmLZpzLExI8j3Q4Zg34lZbK6hsILA/mZxFkYE/UHR9wN5LIkyudPX16rHq7Nof8PB08=
X-Received: by 2002:a67:ed9a:0:b0:3a7:718a:7321 with SMTP id
 d26-20020a67ed9a000000b003a7718a7321mr18314714vsp.55.1666716980908; Tue, 25
 Oct 2022 09:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-10-Jason@zx2c4.com>
 <CAFEAcA95Xx6pN8qL4iQG-O_A_tY0ZbtymPfSDfV1Rsro8U75Ug@mail.gmail.com>
In-Reply-To: <CAFEAcA95Xx6pN8qL4iQG-O_A_tY0ZbtymPfSDfV1Rsro8U75Ug@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 25 Oct 2022 18:56:09 +0200
X-Gmail-Original-Message-ID: <CAHmME9qcKd44sLPpMsFVoo+Ty77f5Ke7+Z93fL86YbAMU+hB0A@mail.gmail.com>
Message-ID: <CAHmME9qcKd44sLPpMsFVoo+Ty77f5Ke7+Z93fL86YbAMU+hB0A@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] mips/malta: pass RNG seed via env var and
 re-randomize on reboot
To: Peter Maydell <peter.maydell@linaro.org>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

Hi Peter,

On Tue, Oct 25, 2022 at 6:47 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> So I didn't take this one patch, partly because I don't think

No problem - I'm actually quite happy to finally have this one
reviewed. I'll send you a follow up.

> all our supported build platforms have memmem(), and partly
> because when I then looked a bit closer at it it looks like
> we're searching through the whole blob for the RNG
> seed. We know where it is to start with, so I think it would
> be cleaner to have prom_set return table_addr (ie the offset
> into the blob of what it just wrote) so we can use it here.
> (You could also reverse-engineer it from prom_buf[prom_index - 1]
> but returning the offset seems a bit less awkward.)

You're right that the memmem is a bit lazy. I'll sort out a more
direct way of doing it like I do for the other platforms.

Jason

