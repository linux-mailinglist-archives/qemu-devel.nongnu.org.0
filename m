Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274FA3B1FF8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:03:26 +0200 (CEST)
Received: from localhost ([::1]:57164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7Dh-0008SS-3n
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7Ay-0005U7-V2; Wed, 23 Jun 2021 14:00:36 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7At-0002vl-AI; Wed, 23 Jun 2021 14:00:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a13so3602579wrf.10;
 Wed, 23 Jun 2021 11:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMmhRwq9QVb+vgT29BBDohmtThFIC9uWaH3/0GE7Ov0=;
 b=bh+ClY8VUhaPLuvBFEgVFlRahJrlwaAHhl3CfRlHqsoiLyrEQsEDIbmKYE+HwKDrgt
 9zWbeMt1jCOHfPWUUhUmlkE5EnT9E7nrdtFfRJ0453XvwuOuu7VxjQTJDEbQdqAdy/s3
 a47Vs17r9ONSjhIVteeQ0FDS3A5rvdjdtO+CfUbOgmfDbqM2xQJmFcgurz5yOEnLkEvp
 A8UBj2JRy8wavuiQiuVak1ztm5fo7U10VVk43o93yVlRvA+8gVtzx1eGaPIZtru5gQGw
 Thv6yf5CpJxiBY9i3ic4Q6246UcDaCBwhlnWrFmXifx9RCjHjN7DV42iAkC0ksGMC5Qa
 eo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lMmhRwq9QVb+vgT29BBDohmtThFIC9uWaH3/0GE7Ov0=;
 b=dwBdN23h5E67Mf3xxAHPrnVweTTEcG+pX04kVg1eFVbIH7ttvDcBsZP8b4k9gqSCcy
 BDi8MiI6oUU4ze9H58gkecSToh6ZaN5f7YYRRt+oYCGXIHhLQE98vN+LKwpNr55pI+RD
 //ngQjpnUy+fwlT3WRiuVmrbu4KHQPU//XO6DZWc2J4sm33ctdAlVwXCbPfKl+tUN0GX
 JJE47sFVmZKK3K0K3sc16Ds9Iw5RRlYjRqMRdC+Z8H3zy1qzcwSs3FZbCGjW7Go/hMo5
 Ty2bSFK30feh3iALbCaWDxxNUVm/zwN/K/QEMtTZkH4+Ee4CfJYooS1jkUGwXS3EZCWx
 nyBw==
X-Gm-Message-State: AOAM532+gTCt+eG/SnZJ6EC+nYsgdcwSKGkPtu0eWXkRQdgC5yLdt1Si
 l69C7mIaKmU9jACfC9YsxlrVcBzKW7ImDw==
X-Google-Smtp-Source: ABdhPJzNzML8bMPJuTWtDxWPdvHYWG3KtTl6zdLsJC0DtYFzgEnMtFSAtlhZ7q71NWw40C0HxC6HXA==
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr1526373wrd.101.1624471229358; 
 Wed, 23 Jun 2021 11:00:29 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c7sm696213wrs.23.2021.06.23.11.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:00:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] hw/sd: When card is in wrong state, log which state it is
Date: Wed, 23 Jun 2021 20:00:13 +0200
Message-Id: <20210623180021.898286-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623180021.898286-1-f4bug@amsat.org>
References: <20210623180021.898286-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We report the card is in an inconsistent state, but don't precise
in which state it is. Add this information, as it is useful when
debugging problems.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 282d39a7042..d8fdf84f4db 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1504,7 +1504,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
     }
 
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state\n", req.cmd);
+    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
+                  req.cmd, sd_state_name(sd->state));
     return sd_illegal;
 }
 
-- 
2.31.1


