Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8AC5FF05B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:31:11 +0200 (CEST)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLiL-0002ql-VV
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojLeF-0005vp-Vp
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:26:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojLe0-0008T7-Ur
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:26:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id a3so7908027wrt.0
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4uD5yivt1pHdZZRlK2EhxLXfCM4gIEIw4oTGPIqGQOY=;
 b=zj5j4OdQAgEFxon942S3CsYsO/2PRlmymPX+41dZg3coEuE+vUWIZGv5KDpjE+t8ZK
 91LZTvWj+Pf9Z6QJbFqLVmYQf6gH6EQxdgdJ18VvCpPfzW0czv+tJUy3fkXpUe+nawz1
 /ww/1o2te0NVVBeGw6UWeyHJ/g+kW/RijfbrkH0UigehbU0/aYbcmRTJ7lNVdm2M2UEM
 9p9A81lg11LYJCi82JqAGnRpylkw4L66FHpGT+Tq10eSeFdst/JKs3eJd2qC3QELr2rr
 TJ01EYmn4XA9n+EXtaArHcPhTWfJfnlIrt/U44ljF5dWo2NdRblRbjiKDHYV7VONBMRo
 m+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4uD5yivt1pHdZZRlK2EhxLXfCM4gIEIw4oTGPIqGQOY=;
 b=fzn5H6WLAPooCZf9kpt5NH5/AOt84cN82oWd2hXj6ywcoRRh46LHNDzHkbPn8eEyy1
 9ZEs7Qs7VvEI+vTKlBMr3MwQCqkoMxbGnUtQ88sFHdhvi0HNdHQGQww0jf49bU43Qlh2
 Mjjfagt1CJOgtjtClHPqtM7MmbvKKlYOBWl6zwlayLa6s8+An1VjUM92C8LYZIIaPFM+
 P9mEH/bj8c+mrVW1vSibu1HRDAHJlbJibPB5H4M6uqlqkqrPIWL2aUXwmzAG6GOSrNAL
 jtaszYP/wrrUE5IhL1vcbI1/w42adxWN3pHWlUuhwaSmYHFDMQbRKWVY3AqqccSDi7Nv
 ZcSw==
X-Gm-Message-State: ACrzQf33/qBnq/+yg5x87dCtdsiXYiGuf26fv6lEi2RBPpDXwIhABy1u
 gN7xyPGFxj+cOe5EBGr9E7MTzEJyHabHxg==
X-Google-Smtp-Source: AMsMyM4QFjC+NnRBCA5fOhfWX32cJTJax9+AJSuydAMm4PbqduLnPxMWHdFNNdTEnuwtdiqDv83uZg==
X-Received: by 2002:a5d:4c8c:0:b0:22e:d81b:67cf with SMTP id
 z12-20020a5d4c8c000000b0022ed81b67cfmr3512743wrs.69.1665757595228; 
 Fri, 14 Oct 2022 07:26:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adfaac3000000b0022e62529888sm2183530wrc.67.2022.10.14.07.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 07:26:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 0/2] hw/audio/intel-hda: Don't use device_legacy_reset()
Date: Fri, 14 Oct 2022 15:26:30 +0100
Message-Id: <20221014142632.2092404-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset removes a use of device_legacy_reset() from the
intel-hda audio device, and removes a duplicated reset of the
codec devices.

Currently the intel-hda device has a reset method which manually
resets all the codecs by calling device_legacy_reset() on them.  This
means they get reset twice, once because child devices on a qbus get
reset before the parent device's reset method is called, and then
again because we're manually resetting them.

Patch 1 drops the manual reset call.  To ensure that codecs are still
reset when the guest does a reset via ICH6_GCTL_RESET we make that
codepath call device_cold_reset() on the HDA device (which resets all
the devices on the qbus as well as the device itself) instead of
making a direct call to the reset function.

This is a slight ordering change because the (only) codec reset now
happens before the controller registers etc are reset, rather than
once before and then once after, but the codec reset function
hda_audio_reset() doesn't care.

Patch 2 is a trivial cleanup I noticed while I was there.

The patchset has been tested with 'make check' and
'make check-avocado' (and a little bit of use of gdb to confirm
that the reset functions still get called as expected).

thanks
-- PMM

Peter Maydell (2):
  hw/audio/intel-hda: don't reset codecs twice
  hw/audio/intel-hda: Drop unnecessary prototype

 hw/audio/intel-hda.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

-- 
2.25.1


