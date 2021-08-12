Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEC33EA349
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 13:07:29 +0200 (CEST)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8Ya-0001WO-IC
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 07:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE8XZ-0000nq-HZ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:06:25 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE8XX-0002n2-Q8
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:06:25 -0400
Received: by mail-ej1-x634.google.com with SMTP id b15so10730997ejg.10
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 04:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PoQ+GEcJexW9ooL3MkvbRJkyTJ6aVSrfEyfl+Y4bCv4=;
 b=uibDLYHg5Z4T1VKpMfuGxCKBGZ9Y6BO+V6kkDOLWieveojWlklP2b2MnsYXtMm5bHc
 hr9oLlgN+SDpC+0B2i/Ez2Vrwz9fvEYd2Eah7Le1RKyL0BPoWhhXQpuLLiJu/5Abh0Is
 w+pd3wCiLnPjYskTsAlQ4tCjh1p6UKsEPy6jVUY2kIzZztaOKOrwpDT6CJ29YWZNezne
 oDIjN+4ksbjuvYF+zlzka4dOaicEkOKDdZVtQd6OC337CHoZvpjL0nZbJgLoOYNH6Jgh
 T4qJz7PjhQs9ou/mSIu3KtqjDMmjG01K2GbPZKfHxrTXelQJyCtWL9xUuhDVhvumkFWU
 n+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PoQ+GEcJexW9ooL3MkvbRJkyTJ6aVSrfEyfl+Y4bCv4=;
 b=oFMLh/AUUV8uc47rMJiT6NyD+TjFtr8vHB3QbMkX179/xiR6H8qObMSzKNGM7bH5nB
 F7vvm+Vr3/00k6kPtPnBGEEDK59tgnfoyx8Ls2wd4RcDEvNebBwfr+FF3gwkF+CAOKj+
 rbnk5RFNgnB2f1hxnRy4qgTkRva9PHqluKrhKlFfDdlWv3ONsSVoYzXz+mLl907AHkn5
 +E4oPOYBFOiI2vtWA2b+Rtj4hEFDXLkKgwgqGwawQYxjsYDbvxPMh6RezkZanyXLlNDq
 KJnlHEmerBtZ6Xso1fetxPoGdQ2uX32XdBAnBR+ivpE54DSMdf/noHxV9KVxpz2fogBs
 qBCQ==
X-Gm-Message-State: AOAM531w8iYHG9V6Br0BQAqK4K3QS6aDG0ndbYpBWW37OFN3svXKP7BE
 7ZiFeXUwREjvdAKjRginnB1hxXqKoKmzr0w/E0lX57RiFvU=
X-Google-Smtp-Source: ABdhPJzi2VJkrHAp4Ya1nuvMwT+4Kq/++yfwaEyRztfA9SBoh9IB/9jmRQfsSU9oD8YU03sVrTBpBBQ7zOZxK6YcE/U=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr3166864ejb.4.1628766381324; 
 Thu, 12 Aug 2021 04:06:21 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 12:05:36 +0100
Message-ID: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
Subject: ensuring a machine's buses have unique names
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

What's the right way to ensure that when a machine has multiple
buses of the same type (eg multiple i2c controllers, multiple
sd card controllers) they all get assigned unique names so that
the user can use '-device ...,bus=some-name' to put a device on a
specific bus?

For instance in hw/arm/xlnx-zynqmp.c, the SoC object creates
a set of alias properties on the SoC for the sd-bus buses that
its 4 SD card controllers create. The alias properties are named
"sd-bus%d" so they are unique. This works, but it's kind of error-prone
because you need each machine model to remember to create these
aliases when necessary.

mps3-an524 is an example of a machine that fails to do this
for its i2c buses, and therefore the user can't usefully
tell QEMU which bus to plug a command-line created i2c bus into.

Ideally we should make buses get unique names by default
and also assert() at startup that there aren't any duplicated
names, I think.

Side note: is there a way to mark a bus as "do not consider
this when plugging devices where the user did not specify
the bus themselves" ? Some of the i2c buses on that machine
are purely internal to the board (eg there's one that has
the touchscreen controller hanging off it and nothing else),
and some are "this i2c bus is connected to the expansion port",
so ideally if no bus is specified we would want to prefer
the expansion-port i2c bus, not the ones that are internal-only.

thanks
-- PMM

