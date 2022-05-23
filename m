Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67F6531170
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 16:53:13 +0200 (CEST)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9Qn-0003NX-0y
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 10:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt9Pr-0002if-Gg
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:52:15 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt9Pp-0006Vc-UY
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:52:15 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id x2so25503936ybi.8
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 07:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=udDg1WZGLQvEe1qjca65jKSTCK3S4dc0BV5cakK/Upg=;
 b=Q0g0gCo0eBvIN7pF5J7IF/xTQLqI5sxC9Z9KvZFMBBibyh93mX9BBNCZSsp6jHUvgi
 CCO0ysppMirMm+35KV+NTX/1LpPKj0X78i3YNNo8xr2i0P3laiYf4qi8KBAfL24dwVu9
 sle4Hol7dAApYH9GEqgnh7PHeNNnwZtDraT8rqV9RxgFVP5g/ZxSk/BvO5cShGB+ziig
 KJUUD6PMzzCHpUtbeDdEBZPoawdOdywz7oRpuACSSrYEt8MhEvChu+5qbJGucUhmFpVS
 SvPeL5QZH/RdvRcznAzIaEpR/u0YH3H36DrOV3Qm0bDlF3AjpMmB62ZlnYw102niV1Eq
 i+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=udDg1WZGLQvEe1qjca65jKSTCK3S4dc0BV5cakK/Upg=;
 b=JAqZJUfficEG/gm5wrWCrD0XXztKpHOJbjRI3e3MsodENfqLQFQ7TPiYYUsQ9EKKJb
 IoXkobJ56k2Ab2qZJE8p6KlCa7fEBwPM8bJQKbx1meZUfMppHqMvo+QFicbSH4uet/zT
 dEp2O+Up+ywKez2KLQSByaTidloF8ESZJXp5qHI2dhHGViCgsU+6S7Flk7g1CAqab8Pt
 m61xDjEetCudvvcOkjT3IQRP99RegklRN13l9x3TU/TYmSc8fPEyhmtkk5d2IF2wufq9
 BYxvlCtRXqnneyL95uPWzVa3c2rJ6Mxjz7hfNnkiHA5fM3PNPwkdJ0k6eU3kwRc3vWqC
 IeLg==
X-Gm-Message-State: AOAM532v3cxz7KShBWaEdvrtbOzXJuQOZ8iiCksXZrjQxRdAFrHp3Ium
 5adFNChJYalGzDiKTti8UJqcXP6lTLPDP3O/aZD/59pqbN8=
X-Google-Smtp-Source: ABdhPJzFrDixUhYESDD3+QVcnVfD+jloEoPWKUp0fI9MJ/9SueTefQhDIO7sK81KxvWEDQDA+Gtb3x8daCNW2ykTg24=
X-Received: by 2002:a05:6902:102a:b0:64f:4132:9be with SMTP id
 x10-20020a056902102a00b0064f413209bemr19906357ybt.288.1653317531142; Mon, 23
 May 2022 07:52:11 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 15:52:00 +0100
Message-ID: <CAFEAcA-NnZQ+4hoScoZMjOyta9EWv_LusXeZ5HRv4kXSqZjD0w@mail.gmail.com>
Subject: can QEMU's arm smmu model handle non-PCI devices?
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

Hi; in real hardware an SMMUv3 might be sat in front of any
DMA-capable device. Putting one in front of a PCI bus is common
but not the only use case. Does QEMU's SMMUv3 model handle that,
or is the implementation currently restricted to only handling DMA
from PCI devices?

I ask because for the Realm Management Extension (aka Confidential
Compute Architecture) we're going to need to put SMMUs in front of
other devices (such as the GIC), so that their DMA is checked against
the RME Granule Protection Tables. So if we don't currently handle
non-PCI devices then that's a bit of extra preliminary work that we'll
want to do :-)

thanks
-- PMM

