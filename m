Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9422E27038C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 19:52:26 +0200 (CEST)
Received: from localhost ([::1]:48572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJKYb-0002Ep-NQ
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 13:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kJKNz-0002oK-5H; Fri, 18 Sep 2020 13:41:31 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kJKNx-0000Gb-S1; Fri, 18 Sep 2020 13:41:26 -0400
Received: by mail-wm1-x343.google.com with SMTP id l15so7162673wmh.1;
 Fri, 18 Sep 2020 10:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9qL0PD5p90+XPqlO1VLzLa4jpbVXhICHWwCAyjStqAk=;
 b=kc8vt670RThIdeLyqUfZB8/x40+sNMqw/aWLn9hZe9RgTgt8uquese1vzigY6nk2rn
 cYtHls0KTtwC9eQCBFkxYrB6TqqNDSQaMYOQPUYfVbw113+SMPiQi8CxBFu0002BYsmS
 hSzSMSgEtsQn2S7NxBnOK6baIajMlAscgVdVeb9+hybNmgcGwGsnPI4zmFoH4Trs3FxQ
 lLNHK4/av0wiZNRYpR46sv/h3R0B5EPX05DPuc5JxHfykItIobn1YAeuzlTEnAHATh0s
 SDFJJoxrqVmp7QKj+B+KSOPFMcYBNru+qN7WMzYMtF0aaaHORgWAKG3BJX6zploNCZNg
 UnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9qL0PD5p90+XPqlO1VLzLa4jpbVXhICHWwCAyjStqAk=;
 b=WajeOC8j/pq4ofD21B+jnzSlad6obY0s0bP21vAC+8gU86zb9OYEZ1xAA/x5VlfFj0
 VRSe/tQKxn93GLsR/LK4duY1jc9ZA/itAxFzWcggH9tz7SyKI8PRYIGY3OqcrVkbKPNr
 arfsdG210s/Z7y4nwsUiY9ECuSEIkVU7KqtC5Gigp2jstmfuvYhaQu4VixWef3aFkpUS
 48l7/Zdgs4rQgBpmqUn1olgqWFYM9IXU+apKh53X2xNh3dxf9i/ozrEFU471ygvW/1/Q
 gvNdB4ZRzsZKINHs+nEDcKJ4IHDMxs5ztxX64PAEuWPG7MxcfMpcivOYNADLSaneRB8j
 weBg==
X-Gm-Message-State: AOAM533QtkFEZ7vcDjLp/dle0d0bYVBQNOYUM6h9vujNQQDuty6pVqGd
 S4T/ymG/ClTIplLEC6aZgJEeI6HX8t0=
X-Google-Smtp-Source: ABdhPJxhSHxBRUHQMt9KdRkjOhKY6YC4yv2/MaFbOc1nmsMQh+gPeo0sncyIECuXISgziq6IjriccQ==
X-Received: by 2002:a05:600c:2cc1:: with SMTP id
 l1mr16314746wmc.78.1600450883801; 
 Fri, 18 Sep 2020 10:41:23 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id a81sm6356179wmf.32.2020.09.18.10.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 10:41:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/6] hw/sd/sdcard: Reset both start/end addresses on error
Date: Fri, 18 Sep 2020 19:41:15 +0200
Message-Id: <20200918174117.180057-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200918174117.180057-1-f4bug@amsat.org>
References: <20200918174117.180057-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From the Spec "4.3.5 Erase":

  The host should adhere to the following command
  sequence: ERASE_WR_BLK_START, ERASE_WR_BLK_END and
  ERASE (CMD38).

  If an erase (CMD38) or address setting (CMD32, 33)
  command is received out of sequence, the card shall
  set the ERASE_SEQ_ERROR bit in the status register
  and reset the whole sequence.

Reset both addresses if the ERASE command occured
out of sequence (one of the start/end address is
not set).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4c05152f189..ee7b64023aa 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -755,6 +755,8 @@ static void sd_erase(SDState *sd)
     if (sd->erase_start == INVALID_ADDRESS
             || sd->erase_end == INVALID_ADDRESS) {
         sd->card_status |= ERASE_SEQ_ERROR;
+        sd->erase_start = INVALID_ADDRESS;
+        sd->erase_end = INVALID_ADDRESS;
         return;
     }
 
-- 
2.26.2


