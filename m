Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5493D49DD
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 22:29:00 +0200 (CEST)
Received: from localhost ([::1]:40084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7OGZ-0002Bb-BO
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 16:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7OFP-0001VY-2Z
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 16:27:47 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7OFN-0000ox-By
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 16:27:46 -0400
Received: by mail-ed1-x529.google.com with SMTP id df26so6185924edb.9
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pXRu+mll6+Q7fa4YW9wcgE48pJE3epPEKEsQyZ/+Skk=;
 b=dpFoul6lw2HTxAOhFqKUocTpMxGIG2VdyLopjJCbhqZSTvfMOcs0c6Za90iyyWzX19
 ZNe/dU8ctWPPygnjlZOueuNl0FIknIjzUccZpXi7nMNg7rluraM3ZVFgMb6qk6Gp6WXF
 XuBINHwAgBAHrb7COWMaa9HX5rL3iO0QdpBoRyHv5+TvrV/ZEoayXJFJ4wVGgtZfrb2v
 /yZSoJCa3VcKX+IiaHb6PxrzQTFy58RZDG3pLKSDs8K84SWZ/tg05szt+O6ieXhfF+vJ
 A0mKrcsQeYqmW+P9iGWmgQhctZDl5kNkOBsSVaFnHj9u6wcvjuoxaX3Lh3uRct6rkIB2
 nlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pXRu+mll6+Q7fa4YW9wcgE48pJE3epPEKEsQyZ/+Skk=;
 b=os4CE4SlioMdcmyLXZC7mrLfH+AKxL0cYIp/osm0uUyyR+Or/a+nzd+FLYgG272Lqd
 8bYX9XfzFclyPKVwitDuMXubIkb3ca4GIQnnWpgZVawvfAemeykcl/vRLmDmjElTMTyB
 tOAtmsPRaz2GtpzMz2Hz3ZGqLh6jLTNvqtuZeGjktLVkVWFc93SYZ2scDmxjrY6RvlRW
 FYNQsng3OKQbqDHb4uPErAftEokKiTDygJicPBFiZufrN8Qt7slZ7eW6fc+JYYGQUNI6
 NRIMTt/XtWmW2do+onw0IaeGaO0V688BvLmkWGId2hGCWGIRV+p3j/nOE4y7GHyOgEsA
 CfiQ==
X-Gm-Message-State: AOAM531ct7kQFdoGpZEydR9afo1DYp8zA7ZblJDjtmmyCqYmbGpsnEET
 dHBbwrCNAHAqidx766cp7FXq/gQMx63Hm4CAJAid/sA55OirOg==
X-Google-Smtp-Source: ABdhPJyDAc1MOWph8+4efcyUCG8VF0/ZUexjKM0AMbtzdwh+1f/uM2LzwZEtWBgZcRWCSO6R9IHhvbxG0XpswV6r4eI=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr12519265edt.100.1627158463402; 
 Sat, 24 Jul 2021 13:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210724134902.7785-1-peter.maydell@linaro.org>
In-Reply-To: <20210724134902.7785-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Jul 2021 21:27:01 +0100
Message-ID: <CAFEAcA-r_WUVx+5dFrpRPGppzMon_pDBzytTp5QwVcnbVxCzSw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 0/2] target/sparc: Drop use of gen_io_end()
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 24 Jul 2021 at 14:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> There is a slight difficulty here with testing this: icount
> doesn't seem to work for sparc Linux guests in master at the
> moment. For instance if you get the advent calendar image from
>   https://www.qemu-advent-calendar.org/2018/download/day11.tar.xz
> it will boot without icount with a command line like
>   qemu-system-sparc -display none -vga none -machine SS-20 -serial stdio -kernel /tmp/day11/zImage.elf
> But if you add '-icount auto' it will get as far as
> "bootconsole [earlyprom0] disabled" and then apparently hang.
> I'm not sure what's going on here :-(
> (I filed this as https://gitlab.com/qemu-project/qemu/-/issues/499)

This turns out to be a recent regression, caused by commit 78ff82bb
("accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS"). It's
an intermittent rather than a 100% reproducible hang.

-- PMM

