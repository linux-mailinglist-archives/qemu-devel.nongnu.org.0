Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62847158B
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:15:04 +0100 (CET)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7pm-0007hh-Ri
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:15:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mX-0004kh-5b
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:41 -0500
Received: from [2a00:1450:4864:20::42f] (port=39511
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mV-0006BJ-46
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:40 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a18so20351881wrn.6
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cuhfcvbNslP1KgGtCCb2Ywd3Kea4YuO6J6/VQuuwaJ8=;
 b=e5uBigthB06gVS6pBXbsmtW2DOlF7Az0FJsz5VNlu5Ze/5FgjhiMdRJ9I68VNgXnWa
 HyBrfjW7CJEWDXOtGUFJOY8gmnRlJhYYSoas7IeDur13gliU8JBjmyHOff/pDzOqqdBV
 tBxNP5+9vxg10E4dnigVVmbqhWCXilzK7SjK+Zi50YSuEOEuNdoKTqmEpY0xMPz3CxXU
 ECvd/k71fKIFIGT4aCG74zDwMQtpcaLM37aU3OI+65B2zWzAaWeRNS0ZvyJx4SFif4H3
 iLtFWXVPT1gK3wgt86WmG0mexLavLahR+rWHd32k1IWZKQywcLWfyGS6Kz8P6ZPWB8N0
 A4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cuhfcvbNslP1KgGtCCb2Ywd3Kea4YuO6J6/VQuuwaJ8=;
 b=TIuBqTEx/NtSJcKtEMDznIQiY4nB4bl2+thLv1GvIaD5biM4KSRqJlzgikC9PtGzL5
 rFCL6JmhreeM+E0C1DSSQh4cOrpVs3N/xXUoBl9xGstJowwYcYzVT9l9EeZwoq1B508a
 wL4kJ3pXG3U4Vblu4s6h1WmT0QaMkwNEKq0tValxVDdMWYUyNjEMXRQH1rKpjt+TOWyh
 x+YZYBX2jlbl8WLt+SYyFOJsJ/LPMG4hQL5Q9uM8Bf8bFwqNdmHzWi7V3IvrAhkeHvOL
 9ytmZXvdKpKvtFxkTH/f8PLnteyCgA3JOOZWlTjX4xP0EAsPHb2qoCbzpgvapn5YtfId
 XWBA==
X-Gm-Message-State: AOAM5312aKl0xcaybk1mvRg+SqM3O8PfG9HxF+nMAcdE2N1ONfnRK/e3
 nro1H2iCnfyfaMhg4l2LWNHoeA==
X-Google-Smtp-Source: ABdhPJweQZCtZCRk+rhAyjtuyqC5qn9rWK8caQGjnRA2IMtmi9GsgCiHcU0tvVy9ieCbwFFNlvlROA==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr21790673wry.360.1639249896986; 
 Sat, 11 Dec 2021 11:11:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/26] arm gicv3 ITS: Various bug fixes and refactorings
Date: Sat, 11 Dec 2021 19:11:09 +0000
Message-Id: <20211211191135.1764649-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've been working on the ITS to add support for the GICv4 functionality.
In the course of that I found a handful of bugs in it and also some
places where the code benefited from refactoring to make it a better
base to put in the GICv4 parts. This patchset is just the bugfixes
and cleanups, because there are enough patches here that I figured it
made sense to send them out now rather than holding on to them.
I've included Alex's "clean up error reporting" patch as patch 1 in
the series to avoid having to use a Based-on: tag.

Bug fixes:
 * Most of the bounds checks on values provided by the guest in
   command packets had off-by-one errors. In almost all cases this
   was completely harmless since the tables being indexed are in
   guest memory, but for rdbase we use it as an index into a C array,
   so there a badly-behaved guest could probably crash QEMU
 * the loop over the GITS_BASER<n> registers in extract_table_params()
   returned early when it found a register with the Valid bit clear,
   rather than continuing to process the other base registers
 * We miscalculated the entry sizes for the Collection and Device
   tables, with the effect that we could potentially corrupt
   guest memory
 * the MAPI command handling was missing an error check on EventID
 * if the guest confgured a DTE with a size of 32 we would have
   shifted off the end of a 32-bit value
 * the calls to process_its_cmd() put the return value in the wrong
   variable
 * if the memory access to read the first word of the command packet
   failed, our error-handling codepath wasn't quite right
 * we weren't actually implementing the "memory access errors cause
   the ITS to stall command processing, parameter errors cause it
   to continue to the next command" logic that the comments claim

Refactorings:
 * the ITS_CTLR_ENABLED define was a duplicate of R_GITS_CTLR_ENABLED_MASK
 * extract_table_params() had unnecessarily duplicated code for
   handling each table type
 * some refactoring and renaming of variables and struct fields used
   in the bounds-check tests so that we have a consistent convention
   that hopefully reduces the risk of future off-by-one errors
 * some parts of the code which were doing open-coded shift-and-mask
   operations have been converted to use the FIELD macro
 * the code for "find the address of an entry in an in-guest-memory
   table" can be factored out into its own function

thanks
-- PMM

Alex Bennée (1):
  hw/intc: clean-up error reporting for failed ITS cmd

Peter Maydell (25):
  hw/intc/arm_gicv3_its: Correct off-by-one bounds check on rdbase
  hw/intc/arm_gicv3_its: Remove redundant ITS_CTLR_ENABLED define
  hw/intc/arm_gicv3_its: Remove maxids union from TableDesc
  hw/intc/arm_gicv3_its: Don't return early in extract_table_params()
    loop
  hw/intc/arm_gicv3_its: Reduce code duplication in
    extract_table_params()
  hw/intc/arm_gicv3_its: Correct setting of TableDesc entry_sz
  hw/intc/arm_gicv3_its: Don't misuse GITS_TYPE_PHYSICAL define
  hw/intc/arm_gicv3_its: Correct handling of MAPI
  hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
  hw/intc/arm_gicv3_its: Use 1ULL when shifting by (DTE.SIZE + 1)
  hw/intc/arm_gicv3_its: Correct comment about CTE RDBase field size
  hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
  hw/intc/arm_gicv3_its: Fix various off-by-one errors
  hw/intc/arm_gicv3_its: Rename max_l2_entries to num_l2_entries
  hw/intc/arm_gicv3_its: Fix event ID bounds checks
  hw/intc/arm_gicv3_its: Convert int ID check to num_intids convention
  hw/intc/arm_gicv3_its: Fix handling of process_its_cmd() return value
  hw/intc/arm_gicv3_its: Don't use data if reading command failed
  hw/intc/arm_gicv3_its: Use enum for return value of process_*
    functions
  hw/intc/arm_gicv3_its: Fix return codes in process_its_cmd()
  hw/intc/arm_gicv3_its: Refactor process_its_cmd() to reduce nesting
  hw/intc/arm_gicv3_its: Fix return codes in process_mapti()
  hw/intc/arm_gicv3_its: Fix return codes in process_mapc()
  hw/intc/arm_gicv3_its: Fix return codes in process_mapd()
  hw/intc/arm_gicv3_its: Factor out "find address of table entry" code

 hw/intc/gicv3_internal.h               |  40 +-
 include/hw/intc/arm_gicv3_its_common.h |   9 +-
 hw/intc/arm_gicv3_its.c                | 628 +++++++++++--------------
 3 files changed, 303 insertions(+), 374 deletions(-)

-- 
2.25.1


