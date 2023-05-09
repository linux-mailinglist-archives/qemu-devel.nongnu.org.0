Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24E6FCE1C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 20:59:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSXf-0006vQ-85; Tue, 09 May 2023 14:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwSXb-0006oO-GQ
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:58:27 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwSXa-0002Mm-0M
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:58:27 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc040c7b8so9728980a12.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 11:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683658703; x=1686250703;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ASFMrHNb5xp5QFLSaDA0esurF2w9cG/taNgQfsWTgP4=;
 b=Md/8owO4LmQ5rsmxqKhKV4z3OtALGoqU2T5tnx9bT/Javl+gcBU+GycBQEenT6IFIk
 5PFladhBkVhy/Nf5ZhYdK+3d/tHpz3WG9izVsy4Xpi/w5QZT3g55PC3w27Y20ZqesU8E
 A36hS931qMrKcc8Ow6f4L3v3HXb9k6WdMJryXcLziO4tqqYTM8AUdcjSopAR9qePHJfa
 5XF/L2Gn7u6gbd0pzh3dYg4Tkvyrl5wxWpnZTYsxByd/0edCb6njpL8Y0ZVat3dmsRN2
 k0+nZ8ZMOwJTnOHJpmq0fqd2vWwluPBr7OBpKW6U7UaQjTNWGxfKI2Tl/dy6/5wD/2BB
 ZQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683658703; x=1686250703;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ASFMrHNb5xp5QFLSaDA0esurF2w9cG/taNgQfsWTgP4=;
 b=Lhz0adQW20OE2mQqKgpQQKowBm7ZcQK0XiBxVNIFUHv6t3KoWw+doNIYaXJeG38ONo
 DF97U4SL7jDdzCgbN4uEGRZf/CazU1An3gwBSZHzhbNOun+9lPNu7xGgu+48m1fl+Nl+
 6lR7muulM4eod956Zoor1ObRKJ6hSsm8LzuFzNNo/5iWDp8eDen7jgcVbPMDKgajb3+9
 qRbiIlAbIv06PwM0ikPzau9XqJ39CZgfJm34T9DyrRcr1BaZtDs2dOm1FaPoYA1ivR4T
 fxfsFS1FE58ieokWaxaXFsZdBE0L4Ok0jx0lerMb6ljLx5RW6GYE9DexnF1HZ1RfZVHg
 Ywvg==
X-Gm-Message-State: AC+VfDwpQDDJdoxfVGT5fDaJFcBWcrnq8cVfZnoIEGlTa4Wg/G1LrdWh
 I8rlD1HOs8UVEMDo0fhtMf7KfuxVO/15URCGWJY3BV0dRumKMsr2
X-Google-Smtp-Source: ACHHUZ6bDzVuxe4wwfqGmwSB3PrGYVNxmKLfxCp2OZBg/t4vdA8yWHlZQ/QRqu4DnW9tx3jZ76BWaRt8v2kfJ+5vGkE=
X-Received: by 2002:a05:6402:4d9:b0:50b:c8bf:67b1 with SMTP id
 n25-20020a05640204d900b0050bc8bf67b1mr12315032edw.10.1683658703555; Tue, 09
 May 2023 11:58:23 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 19:58:05 +0100
Message-ID: <CAFEAcA8rZDtUFTM7Ya6aTTZw0bHYL0y-6Akjoru1SS=qeh+KWA@mail.gmail.com>
Subject: command line, guest console output missing from avocado log
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I just noticed that the guest console output seems to no longer
be in the avocado log file. Can it be reinstated, please?
The console logs are typically the most useful clue to "why did this
test fail" and without it you're just guessing in the dark...
The details of what QEMU command line avocado is running
also seem to have vanished : that also is among the most
useful items of information to have in the log.

thanks
-- PMM

