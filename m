Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A700C2C7B30
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 21:42:01 +0100 (CET)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjTWC-0000AT-Mf
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 15:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjTTt-00076R-NY
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:39:37 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjTTj-0001Hw-Bz
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:39:37 -0500
Received: by mail-wr1-x433.google.com with SMTP id p8so12611133wrx.5
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 12:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ut2OLLId8SxgX7dHWo8pwPyB6I8hBwZRfeKb1sAAlSo=;
 b=Dlyqg2mblkJp1rWXDHPfjp9q9xnMlCX6bRzdqbS91Nctcr6UBjyIy8XBL4R7pR8M1B
 uVU/L4MfmwBVmET3c9gDLPRxfi8l989kh4gMTqz2E0I+sr1WVppZti5rOhVkfTVxwL4X
 Ydg74XgeV8g5QjBpt8FTQFAA+w+fVKq123YruxCQiV+mFhiyTDYawFLCi64CflK5riJp
 4IJ3giY6B1DRk3fRR9RYQbfj5+RvsZi45AFxQ5HwsDfPoM0IGoLH2gqHvsyPr7ZICucG
 nLWSeQ6Dwy9Y4IQw9b3G3MZxTVqKvBRhbttCq/EHcIINRy3VaRcocoZl/V97LL+YNeV/
 B7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ut2OLLId8SxgX7dHWo8pwPyB6I8hBwZRfeKb1sAAlSo=;
 b=Q35s0VixkREQFOxg6ilxd+BYve0b8vs8TFrpDnXklBsBpZ4I86RKriVVCWV5m89SqI
 NN19HabumSwdNje9veZTFuaDBrIZglFom7Qall20DsuhXlmeQw4ciRfViUJHgfejfNhz
 /Q9n2sdIEVgrg0D+TMo6rKcQOKMhW0Mi6gR/Z9rGgNYd1ZHSawwYzGvg3EGzkeCSkwT2
 s/Xf8ouRoUU+4NE72IoUr3ij6kE+NXhR5NlNcF9mvv22LteEZoxRLpE7iyb+M+E/PBKL
 aZLlcTefQoITw6Xi64tSAKXR6meyB1gsjO4BnV9QxBpPaZob7tQivH4r0FmSTAvOXQvD
 NClw==
X-Gm-Message-State: AOAM531lRhXOKK5g3+KebwiBamShTCKE4X947twkWummrrbTWJhjqW79
 iC6v9ajIwdu22sShNSXF3ooByP9r3gVBmA==
X-Google-Smtp-Source: ABdhPJwpIJY2gj9G1lS83cbI4qlywxAw6Y0GQGL3vtveD5tZGjHQ75eTFisuEFdsK2/idgnP8E2tvg==
X-Received: by 2002:adf:f3cf:: with SMTP id g15mr24144057wrp.71.1606682365441; 
 Sun, 29 Nov 2020 12:39:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q12sm23618393wrx.86.2020.11.29.12.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 12:39:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Improve reporting of ROM blob overlap errors
Date: Sun, 29 Nov 2020 20:39:19 +0000
Message-Id: <20201129203923.10622-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(This was inspired by a conversation on IRC with a user.)

We report an error if we detect that there's an overlap in guest
memory between two ROM blobs, but the warning is pretty opaque.
Currently it looks like this:

rom: requested regions overlap (rom dtb. free=0x0000000000008000, addr=0x0000000000000000)
qemu-system-aarch64: rom check and register reset failed

which is pretty cryptic and also is missing information that we
could fairly easily tell the user (like the name of both the ROMs
involved in the overlap rather than just one of them...)


After this patchset it looks like:

qemu-system-aarch64: Some ROM regions are overlapping
These ROM regions might have been loaded by direct user request or by default.
They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into guest memory.
Check whether you intended to load all this guest code, and whether it has been built to load to the correct addresses.

The following two regions overlap (in the cpu-memory-0 address space):
  /home/petmay01/linaro/qemu-misc-tests/ldmia-fault.axf ELF program header segment 0 (addresses 0x0000000000000000 - 0x0000000000008000)
  dtb (addresses 0x0000000000000000 - 0x0000000000100000)

The following two regions overlap (in the cpu-memory-0 address space):
  /home/petmay01/linaro/qemu-misc-tests/bad-psci-call.axf ELF program header segment 1 (addresses 0x0000000040000000 - 0x0000000040000010)
  /home/petmay01/linaro/qemu-misc-tests/bp-test.elf ELF program header segment 0 (addresses 0x0000000040000000 - 0x0000000040000020)



We're still somewhat at the mercy of QEMU code that creates ROM blobs
to give them usefully diagnostic names (in this example, for example
"dtb" is a bit unhelpfully brief -- it's the virt board's "let me put
the autogenerated DTB at the base of RAM" rather than a DTB passed by
the user). I tweaked the names that the ELF loader uses in the last
patch of the series because that's a pretty common source of one of
the ROMs in a conflict.

thanks
-- PMM

Peter Maydell (4):
  hw/core/loader.c: Track last-seen ROM in
    rom_check_and_register_reset()
  hw/core/loader.c: Improve reporting of ROM overlap errors
  elf_ops.h: Don't truncate name of the ROM blobs we create
  elf_ops.h: Be more verbose with ROM blob names

 include/hw/elf_ops.h |  5 ++--
 hw/core/loader.c     | 67 ++++++++++++++++++++++++++++++++++++--------
 softmmu/vl.c         |  1 -
 3 files changed, 58 insertions(+), 15 deletions(-)

-- 
2.20.1


