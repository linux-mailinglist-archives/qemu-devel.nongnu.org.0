Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63B3B3136
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:24:31 +0200 (CEST)
Received: from localhost ([::1]:40296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQHO-0008U6-Ca
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFH-0005h8-Ug; Thu, 24 Jun 2021 10:22:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFG-0008Ca-C2; Thu, 24 Jun 2021 10:22:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so5749408wms.0; 
 Thu, 24 Jun 2021 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CELNymjR/8pwAF7b6jcb3aIuZvp+QTfxg6AbWcEaa2w=;
 b=XNP2q+upJXB8OfRl7+3GITQyL9vqcNFZWNeZbdt1/m3VbIN/h+f6OCOmyvRsX3KhJP
 2Y12RVAwaxGcgWcp75lU7/W0AoMybDp5LKldsxQobDHh6uPqdwKCmMYEZ30IXkXQdpmD
 cnCbuXOKkVue8EABxbA4QnN0ffjXmBPjPPVq0BnFV3Su6e66sapO6VG1sDgynrNzZRDJ
 /SISFeWCfk+N0Pg0vhVZ9XS6xxOoLnMkhOzqNlXO8IamzyQOqEO4JO89qyyNPqThSB0O
 3ge7EHmTHs9ToajywVOIHqMhUdT2sG4Ird1ClaQcqMEy7QECs7R7aFJ5P1ZHJRfhKWMd
 scbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CELNymjR/8pwAF7b6jcb3aIuZvp+QTfxg6AbWcEaa2w=;
 b=LfDgf0Ft/wX4OeEx8eub8CRUu1l0o6b1hJaklpt6LhJOPEb+SWX3BUF+eYehpdQH/3
 7MDJymPEDvmQyjMeOi7wajyfYOr/NfC/nWcvDV/yqqM9aCV9hvwMKKJUzZ6umatgutZh
 djx39vSFP6vtXKdSRfJj2C2JTUg7V0GjnRzRbLxLvy1GV4hPQTHu1jjlCUKI8RU46Fkm
 Fy6Oy1Xivg2gCKnccxJiE2uVY+YUZeT+IvViPu14TARx0mpn+UxaNmnu3O4MgqQYf+f5
 3FjoCVQniCagXm0B7hV59/Ja+eFjydqcIJiSIM+3V3he7okum7OPbYbOmTAxrcr6JWcc
 Ckgw==
X-Gm-Message-State: AOAM533RPu0SP3DqPyfY55KoF757nGWZcTiGCE+MdygVQVAsy6mEbowU
 FwKVbCpIikz1MzP5o4rh6oMtYPBS7c0CjA==
X-Google-Smtp-Source: ABdhPJwyA+pGRoln1P3Q55Z3GpfdFXAoG5WclsqFpS74C8uFmjAP5OR+upxhxL97vV5TyaMhfeYdZw==
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr4593816wmm.146.1624544536469; 
 Thu, 24 Jun 2021 07:22:16 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g7sm16121wmq.27.2021.06.24.07.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:22:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/10] hw/sd: When card is in wrong state,
 log which state it is
Date: Thu, 24 Jun 2021 16:22:00 +0200
Message-Id: <20210624142209.1193073-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We report the card is in an inconsistent state, but don't precise
in which state it is. Add this information, as it is useful when
debugging problems.

Since we will reuse this code, extract as sd_invalid_state_for_cmd()
helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 282d39a7042..288ae059e3d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -937,6 +937,14 @@ static void sd_lock_command(SDState *sd)
         sd->card_status &= ~CARD_IS_LOCKED;
 }
 
+static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
+                  req.cmd, sd_state_name(sd->state));
+
+    return sd_illegal;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1504,8 +1512,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
     }
 
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state\n", req.cmd);
-    return sd_illegal;
+    return sd_invalid_state_for_cmd(sd, req);
 }
 
 static sd_rsp_type_t sd_app_command(SDState *sd,
-- 
2.31.1


