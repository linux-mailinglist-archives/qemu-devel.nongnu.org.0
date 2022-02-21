Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CB54BEAE4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:37:14 +0100 (CET)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMEUk-00038y-1G
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:37:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFp-0007lY-Ck
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:21:49 -0500
Received: from [2a00:1450:4864:20::335] (port=54261
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFi-0002d1-DM
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:21:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id n8so10069727wms.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 11:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q6GLpIPj+eVLViV+q/ZagCH+41+t4ZXoq4KtoJfYsvM=;
 b=WQUACE1BbIS5O+HbJV6386e7i3T/ECAXDt2I5BB3eRwXLS1yS9hDE3FuoqHB55Ms6h
 0Yy1UP3Xephx4zDsiDWXxTQOxnGZeBteGGOfoFqyeXd1x5qAUX89f6u/g6bZ+bg7SogC
 xJqJXirpRaYQ55SJvPtFU9dQz5kOMD2sejGsaBHsvcglUwwpHxKC9enkX/roWlrlVoYs
 MKF7ID7z5+WpYm/za2i3ViLoBg2bP6YEqBkdDUEZcF0esQUSgczdZmolv0gfl6fTnOqm
 jbfpmPvhibcnvBjd39oqBT6xXa7USspgDX8FIBpWoJ5pK+WhJmZa/Kd9tstA+epzdSjB
 Ueow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q6GLpIPj+eVLViV+q/ZagCH+41+t4ZXoq4KtoJfYsvM=;
 b=7ImglYJ+AE/pU3QX+mQi7tqvetaHUEEfys8R07/j9+k0+84tL2evFEPa2tyBSPad8w
 2q7qoipLSnA/l8Ve2wZffB6hfboxHn0WQtj/bosxqgW7kFeST/8QYatHPvbuiOsDPqjU
 2D5sFPUedbBHcnKO1/oityM+SGLXwO+0ZR7ufcUTRQWsaHh5/Gvv85q+jukyqdF/dPiZ
 EozYAMuU33jYFHulu0wvBuKn81i2uKjD3yhdzEmVB1w9UDZfr0iRXay8dwe2liJo7PJP
 ec0xp3TUf5hyKDYnN6sNUm/KCmV8Z0yrQCLw+oyPKZwJ2VE19C4Z8iEbhwoM1k/evrHJ
 RRjw==
X-Gm-Message-State: AOAM532XESlGG1XtUnVJsC4Ifgu8K4yBG/xUCAYOlLFi28FSNffkiIR/
 2XXIDrBy7WxymRjDAtbB6JSdHA==
X-Google-Smtp-Source: ABdhPJzvTH8c7RxFhWdKVcF1H/lPxRZjGwf7s5aSu7h6Y6b6+ydyq0bYPLMlKbL6/djnxQhPxsipkA==
X-Received: by 2002:a1c:a1c2:0:b0:37b:aa06:9c51 with SMTP id
 k185-20020a1ca1c2000000b0037baa069c51mr409590wme.114.1645471285541; 
 Mon, 21 Feb 2022 11:21:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j6sm38958226wrt.70.2022.02.21.11.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:21:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] qapi: Move RTC_CHANGE back out of target schema
Date: Mon, 21 Feb 2022 19:21:20 +0000
Message-Id: <20220221192123.749970-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset moves RTC_CHANGE back to misc.json, effectively
reverting commit 183e4281a30962, which moved the RTC_CHANGE event to
the target schema.  That change was an attempt to make the event
target-specific to improve introspection, but the event isn't really
target-specific: it's machine or device specific.  Putting RTC_CHANGE
in the target schema with an ifdef list reduces maintainability (by
adding an if: list with a long list of targets that needs to be
manually updated as architectures are added or removed or as new
devices gain the RTC_CHANGE functionality) and increases compile time
(by preventing RTC devices which emit the event from being "compile
once" rather than "compile once per target", because
qapi-events-misc-target.h uses TARGET_* ifdefs, which are poisoned in
"compile once" files.)

Patch 2 fixes some minor documentation issues for the RTC_CHANGE
event, noticed during development of the patchset.

Patch 3 makes the pl031 a build-once file again, which was the
initial motivation for the series.

Changes v1->v2:
 * patch 1 needs to change the #include line for pl031.c, now that
   the change to make that device emit RTC_CHANGE has landed upstream
 * patch 2 now also notes in the RTC_CHANGE documentation that
   not all devices/systems will emit the event (suggested by Markus)
 * patch 3 is new

My default assumption is that this series will go in via the
qapi tree; let me know if you'd prefer me to take it via
target-arm instead.

thanks
-- PMM

Peter Maydell (3):
  qapi: Move RTC_CHANGE back out of target schema
  qapi: Document some missing details of RTC_CHANGE event
  hw/rtc: Compile pl031 once-only

 qapi/misc-target.json | 33 ---------------------------------
 qapi/misc.json        | 24 ++++++++++++++++++++++++
 hw/ppc/spapr_rtc.c    |  2 +-
 hw/rtc/mc146818rtc.c  |  2 +-
 hw/rtc/pl031.c        |  2 +-
 hw/rtc/meson.build    |  2 +-
 6 files changed, 28 insertions(+), 37 deletions(-)

-- 
2.25.1


