Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351DA4A677E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:03:24 +0100 (CET)
Received: from localhost ([::1]:47656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1FD-0000OO-AH
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:03:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEysv-0001ew-8K
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:13 -0500
Received: from [2a00:1450:4864:20::32b] (port=51108
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEyst-0002V5-EE
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m26so7265755wms.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NNxoGTM339928Yo84PwOxlFiC7fEAQLsnAwUVkrE8PA=;
 b=YF+9zX61KuTHcViYxllPrM+r4NAINAqlrcNFRCRBFo/vZllYIqWB6Vq3+GKKXCGnCR
 /Yi1sqquVxG9KnkY/ONzpAx14v7lntfI82WmiHaIucDwROE8DVuumWCcBIiCdyokNOJm
 LKTDLX82U51LQFhhHZNpc+YcEiCd3O/D3KjlPBdxKUugO3g+5h9k/6XHCTRMBI6fxdLL
 2oDTaXHLyFWpRY1EKBO6KzIQlFsYBVZ/s92rQxlNq5xPZ4JcGLrWAde1ljpsldQOoAUF
 rrS/hN2bu+iWXT/jVdXHOZh9mrrLIgsTkllMGh/Y98P7w+/neSZvItvDWnBLIbhhb33i
 epzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NNxoGTM339928Yo84PwOxlFiC7fEAQLsnAwUVkrE8PA=;
 b=TB0vJHkq6e6sm1RjDEWabE6H6I8/CWzfwlR1LTG1seUcxiyDFnMP47etSlomvnvZDP
 nYlCdt3aCDCod4sXriYosH0Fk4w5HxnKFSrpSOWiZTa3ERK0LnV2j4fk+alg8iRm2xom
 dKKb4zEGObLMboDP/XfAADruIO92oOEnvVdohlisdG9595FhazYguEQDLSgJYvNbKihS
 thWMyL7Wqq6yeDYnPNO0ah2K7JluH0vu27BvIzx47YKDvLOJRjNacfJ+VMmGKmPg6/+p
 cHT4TJX1yFhz4zuGseNWS7M61fgO9/7ObfsJQLib4xENG74/5TQbfEJ87nob0zwvCvpz
 N0vw==
X-Gm-Message-State: AOAM531u/M5Ge+O+DFzyAuNHniYTDASS5DV49ByyrooOyzcBn5dsbexe
 PNXe3mtf+0uW51PDpckE7h1UgQ==
X-Google-Smtp-Source: ABdhPJxnrq5MRjRHns9Iuwfbrrx2hS0nXyA35zwy6u6qCh+vRUGukQjf3y2ZNzz/63koASUljN9d5A==
X-Received: by 2002:a1c:a98f:: with SMTP id s137mr3163722wme.51.1643743929353; 
 Tue, 01 Feb 2022 11:32:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:32:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/13] hw/intc/arm_gicv3_its: more cleanups, bugfixes
Date: Tue,  1 Feb 2022 19:31:54 +0000
Message-Id: <20220201193207.2771604-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is another set of patches to the ITS emulation; mostly
cleanups, but there are two bug fixes.

Cleanups:

(1) Switch away from reading command packets by multiple separate
calls to address_space_ldq_le(), and instead use
address_space_map()/unmap() to get all 4 doublewords in the command
packet at once in the top level queue-processing loop.  This gets all
the handling of loading words out of the individual command-handling
functions and makes them a lot easier to read IMHO. Plus it reduces
the number of lines of code by about a hundred.

(2) Unify all of the get_foo()/update_foo() functions that we use
for reading and writing the various in-guest-memory tables so that
they use a single style of API rather than being confusingly
different about how they indicate failure and how they return
the interesting fields from the table entries.

(3) A handful of less exciting minor tweaks.

Bugfixes:

(1) We were mis-calculating the address to use for the
last 4 bytes in an interrupt table entry, so they overwrote
the middle 4 bytes... The fix for this one is slightly
awkward because we need to handle migration from guests which
have in-memory tables written using the buggy code.

(2) We shouldn't validity-check rdbase in MAPC with V=0

(3) MAPI/MAPTI with intid 1023 should be rejected

thanks
-- PMM

Peter Maydell (13):
  hw/intc/arm_gicv3_its: Use address_space_map() to access command queue
    packets
  hw/intc/arm_gicv3_its: Keep DTEs as a struct, not a raw uint64_t
  hw/intc/arm_gicv3_its: Pass DTEntry to update_dte()
  hw/intc/arm_gicv3_its: Keep CTEs as a struct, not a raw uint64_t
  hw/intc/arm_gicv3_its: Pass CTEntry to update_cte()
  hw/intc/arm_gicv3_its: Fix address calculation in get_ite() and
    update_ite()
  hw/intc/arm_gicv3_its: Avoid nested ifs in get_ite()
  hw/intc/arm_gicv3_its: Pass ITE values back from get_ite() via a
    struct
  hw/intc/arm_gicv3_its: Make update_ite() use ITEntry
  hw/intc/arm_gicv3_its: Drop TableDesc and CmdQDesc valid fields
  hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field
  hw/intc/arm_gicv3_its: Don't allow intid 1023 in MAPI/MAPTI
  hw/intc/arm_gicv3_its: Split error checks

 hw/intc/gicv3_internal.h               |  23 +-
 include/hw/intc/arm_gicv3_its_common.h |   2 -
 hw/intc/arm_gicv3_its.c                | 696 +++++++++++--------------
 3 files changed, 328 insertions(+), 393 deletions(-)

-- 
2.25.1


