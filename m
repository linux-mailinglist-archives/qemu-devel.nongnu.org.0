Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2F0443170
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:18:48 +0100 (CET)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvYl-0004Jl-T7
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhvUR-000623-LF
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:14:19 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhvUP-0005uq-90
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:14:18 -0400
Received: by mail-wm1-x336.google.com with SMTP id 71so13601125wma.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WtUVyFSBroAAhUV7RVGOXYjdLZ1X3Vzhb9sone+tHLo=;
 b=t2w2sItQLFmIMPoajJaT5KW+SItQ4BTBKw35cBXSxVNOhkxYD6JuwH4RKvYy24IbOW
 Xa6A1g199ToMUVMIBpYbOXxXdWb1Qe4OANbCQkrN6HIqKBTRZEleNRUK3tydSXZDvuWx
 SiJhzVjiBN1OWLgT54iJgtWabXTYhGkgC6PUmUKvGJwJH5bhRn7dMF0zIqu2a51evI/m
 l2GWJ6qjyZ6KeQ/26d28fDCTnnca/gX+SPkaWZx50xWujCNrOrydutMhsZr76v6IFqrr
 Dwqv4BRZ8dJ+vgTA6Up5MnqSh+u0gFvcr/jUs80Wd4o/NNHxRfhW/OK48XJ9PQKX/6Yt
 e1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WtUVyFSBroAAhUV7RVGOXYjdLZ1X3Vzhb9sone+tHLo=;
 b=WquJmssbTno3O6uO2RZ48jEY71yKvgNzpbuy6ztR3OzzNhXnnKgXSIfg3z127jeKia
 vh+DXFxfV40RlT/kGkndkS5AZeS64YVxCAJjpJMIzdOxUhz3eSSNilxXuUcObnGaohFg
 5zIvJheue9vyBe/LBmleKHlH8YhlQxjeDY46OU6Z3SLSj7SeMmlZaqRshzcnl5+lLXhX
 9HsW1/XhjwwoUZe6livWV43AFfRA4NT0s48NSIwmiXtFzjVXkTfLB7U/IDNUuw/vHQPg
 ov7BXSXOiY8xmJeNJMXg+PRbSzmCWYX4EbbbdwII6gfAN7pqN2sAtK2pqlVHwpr4ElzV
 V0Yw==
X-Gm-Message-State: AOAM530xBHg7faWkoopY2pfo7EPopQM+DwMYM0JGiFFbCWkAlkRhSa9P
 NrePKWfi4MEI2jcIM6NYwIfNbm13zfWTZaICc7UIaoWpZQlt9Q==
X-Google-Smtp-Source: ABdhPJxBveW962b23JmzgLoglld2E7gdHYdixJKfc06RtLZPukSbkEAHXppaijAxM8f7GMqqTh0JMOLUgMdpv0p6YE8=
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr7902984wmq.21.1635866053655; 
 Tue, 02 Nov 2021 08:14:13 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 15:14:02 +0000
Message-ID: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
Subject: does drive_get_next(IF_NONE) make sense?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Does it make sense for a device/board to do drive_get_next(IF_NONE) ?

At the moment we have exactly one user of this, which is
hw/misc/sifive_u_otp.c. This is a model of a one-time-programmable
fuse, and the drive is providing the backing store for the fuse
contents. Borrowing an IF_NONE for this seems a bit odd, but
it's not clear any of the other IF_ types is better.

We also just (this release cycle) added models of the Xilinx
efuse OTP fuses. Those have been implemented to use IF_PFLASH.
(This is a somewhat unfortunate inconsistency I guess.)

We also have a patchseries currently in the code review stage
which uses IF_NONE:
https://patchew.org/QEMU/20211101232346.1070813-1-wuhaotsh@google.com/20211101232346.1070813-6-wuhaotsh@google.com/
Here we are trying to provide a drive as backing store for some
EEPROMs that hang off the i2c buses on some npcm7xx boards.

Are these uses of IF_NONE OK, or should we be doing something
else (using IF_PFLASH, defining a new IF_*, ???)

thanks
-- PMM

