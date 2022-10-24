Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04651609F13
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:31:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omu3r-0002Ay-2c; Mon, 24 Oct 2022 05:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1omu31-0001q8-Qc; Mon, 24 Oct 2022 05:47:13 -0400
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1omu2X-0002Uh-N3; Mon, 24 Oct 2022 05:47:07 -0400
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Mwqw44vgvz9sQj;
 Mon, 24 Oct 2022 11:46:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1666604788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6jULGxGNtsNAE/2BFhkOSZuUBlXCYqAy5VrKNSdXCE=;
 b=Wy7UWnTwqzqy/uf/7muWQO8M0IlTWSSVDpIyo8pX4MFCGzvGuSi/vOEV1Tf/p74BhTjO5e
 hoDXiSfPhmIuGEhWEtgpc4QEqYZqkgKkb2E8sBfA5MITsM0XE0PfywdT0oK86GtyiV6DKs
 qXMTbAdvFGHHzR8rCjsHgVOStDaBFQ4Uvif29/llbyU4OPZYtJLABOhfHPbFtFO8JESNd9
 bKYbY1rttjYKyqXGpJRVdUfW507x9E8KiRwpFFZaCpdy5X0ZLq8PkU/lR/Hgg68Y3F0/Nb
 FHBcRXaVmudfhj0fefc0wj3VmP2G0IKphbW/Cnw98CA2iItUT2l/wEono0twXA==
From: Lev Kujawski <lkujaw@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1666604786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6jULGxGNtsNAE/2BFhkOSZuUBlXCYqAy5VrKNSdXCE=;
 b=SO/msC6/PrFDVvsr7L022t+P5Da6NC6pZafLjuNOG4gRsS93DXsaEIiYNm8W7XhY8C1QlP
 Fnypn4kxxioHMhRCqEc4gOlSICPLJUL40FHAAFeN5bqHZoVJ6wQBXx6Ya1KbDWI0P/mU9r
 pJEebXU26Y5crhsu6/J+hSJ3S6R1PS4HavovZB0GfRK3i3+Oyg9a2H6QwxcRP8tKxuMqid
 +7q96wSpvRgPcxhuI+KqM83+NtJ6MDtT3DFJrf7v7ep4cc5Y09xoHz71iMNsiCcQtx4Krw
 IlzpS0PjE/etIWPt1UiMj1wyikYT1Bcxwwh16OxBu7mQS/a/U5Zbp93JY6sjDA==
To: qemu-devel@nongnu.org,
	mst@redhat.com
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Lev Kujawski <lkujaw@mailbox.org>
Subject: Re: [PATCH v3 2/2] hw/ide/piix: Ignore writes of hardwired PCI
 command register bits
Date: Mon, 24 Oct 2022 09:46:19 +0000
Message-Id: <20221024094621.512806-1-lkujaw@mailbox.org>
In-Reply-To: <20221007095229-mutt-send-email-mst@kernel.org>
References: <20221007095229-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5df85d2dd0e882e606d
X-MBO-RS-META: whd9m9ue1zq3fkt318ne56cdoqcdyoft
Received-SPF: pass client-ip=2001:67c:2050:0:465::202;
 envelope-from=lkujaw@mailbox.org; helo=mout-p-202.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

> I guess this cna work but what I had in mind is much
> simpler. Add an internal property (name starting with "x-")
> enabling the buggy behaviour and set it in hw compat array.
> If set - do not touch the wmask register.
>
> post load hooks are harder to reason about.

Thanks again for the review and clarification, please find attached an
updated patch.  My only concern with the internal property approach is
a potential proliferation of similar boolean values if someone else
encounters an incompatibility.  I have not conducted a thorough audit
of all the PIIX 3/4 IDE registers for hardwired bits (only what I
encountered testing proprietary firmware - PCICMD), and I do not have
access to my PIIX 3 system at the moment.

Kind regards,
Lev Kujawski

Lev Kujawski (2):
  qpci_device_enable: Allow for command bits hardwired to 0
  hw/ide/piix: Ignore writes of hardwired PCI command register bits

 hw/core/machine.c        |  5 ++++-
 hw/ide/piix.c            | 24 ++++++++++++++++++++++++
 include/hw/ide/pci.h     |  1 +
 tests/qtest/ide-test.c   |  1 +
 tests/qtest/libqos/pci.c | 13 +++++++------
 tests/qtest/libqos/pci.h |  1 +
 6 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.34.1


