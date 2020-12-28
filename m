Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E274D2E6A97
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 21:27:55 +0100 (CET)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktz7T-0001i9-0B
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 15:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ktz6L-0001J3-0d
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 15:26:45 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:38272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ktz6J-0007vx-6v
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 15:26:44 -0500
Received: by mail-qt1-x833.google.com with SMTP id y15so7687989qtv.5
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 12:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gtcN8z8aXETfKU/Ver8ia532mBM4mZ1ubo8thxOZ908=;
 b=VYrRWDxcJz64GSLAAOUcJvUch9TTOOVmyXRFj3Ig4jQ6l7muYmwzPG0XdQ70W1KGo3
 0Y7ao/erFQoYlogujBU9eqwyvf5TPmfvZzOtYzDQg2eaLTmzHo0XIfSxwZNC7tLEEpum
 OJWXY/0CceoAQabLfpZf1FuOvk/615s9rV3qhEtK3Mt73Xj4te+6TGveNcvAhY8uNhkY
 SWREAjWkBaq7SnYedhdTxQ5Ke7RHES1d9YwqNZDE+dF+Z3Uyg+4F4Qz43d7aTFJT337A
 2oyCE9RJKk+SLjvIBG6PF15k+QoBiFCjcHUo+Dm4OpUBX23Pi+zgBEoT+E9c5gn3tdGd
 AqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gtcN8z8aXETfKU/Ver8ia532mBM4mZ1ubo8thxOZ908=;
 b=A1kQXqqkJzzSOSnGX47Sj1C4fI4wVHmDfAjVviM8lJyGPewFLUIf7G5c+3hik1eoeJ
 nSuiw3EoM4W8sHLM+kllopgVi1Avu9bd3f3qjvYEdR1FAAItgOTx9BuouNcBjQn4wFOu
 aMJejTRo/5IIs7apzwr/9xsrV304hEzDBLPtH+goEbkO+fAHek4LZ0GmbjK24aAqWKqN
 f6ZP71iFWAJ7SsiP8ylzH07R+95fBqlpj7Emlv47RLNC6Z5ZD5kU0uBRF74HnkbfFjnO
 ncy4fB8AL03COA7oGBOHRhehjsM9T1exuxGAsdmfs4E0pp/NxDSTE1UOzOizSnjEsHFR
 hYBQ==
X-Gm-Message-State: AOAM5339INUieBUw7278pa9F1Y+rG6er9tgHnYpnJKhSLleN0Jmix9em
 lKogOo8Oaxs3/PMWadcTbVp2JJNidpsCSY7L9d/5xlfOaaKBMg==
X-Google-Smtp-Source: ABdhPJwIXx4SFMPMTniW+8Gd8K0tRmqwMdPfRNj8/dvLdSms/+9MQDp+UYYXvEXtpkKXXNQwXz0XT5ERYIvcBHiKl+I=
X-Received: by 2002:aed:2d83:: with SMTP id i3mr46543064qtd.248.1609187200268; 
 Mon, 28 Dec 2020 12:26:40 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 28 Dec 2020 12:26:29 -0800
Message-ID: <CAO=notxcp3=_1O8Y2WkPvdgZ9eZ61Ctf3k+gcM-hptA7E=jiKQ@mail.gmail.com>
Subject: RFC: Start-time Device Addition for BMC devices
To: qemu-devel@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=venture@google.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi;

Currently, devices for a BMC are specified in the board init method
for that machine, see:
 - https://github.com/qemu/qemu/blob/b785d25e91718a660546a6550f64b3c543af7754/hw/arm/aspeed.c#L414

This requires listing all i2c devices, and setting some properties.
QMP can be used to set the properties for those devices at run-time
already.

We're looking at developing many BMC boards, but for most boards, the
i2c devices that correspond to PCIe devices vary by configuration --
which PCI cards are plugged into which slots.  We'd like to not
hard-code those i2c devices and have variations of the same device
board.  For instance:

board-bmc + two cards (slot 1, slot 2)
board-bmc + one card (slot 3)

The slot to i2c bus mapping is beyond the scope of this, because that
isn't something that technically changes*.

To solve this problem, we'd like to add an optional device json
configuration parameter.  Using QMP (which I believe supports adding
devices of this type in the schema), the file would be parsed after
the board_init method and additional devices then loaded.

Are there any immediate problems with this kind of approach, or
possibly it's already supported in some way?

Thanks,
Patrick

*The i2c bus numbering can be altered, but typically a BMC's
device-tree uses aliases to ensure consistency of i2c-bus numbering
between configurations.

