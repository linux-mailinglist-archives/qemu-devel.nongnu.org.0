Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE33C876D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:27:56 +0200 (CEST)
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gnj-0000yg-KU
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m3gZs-0003gq-NO
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:13:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m3gZq-0007JT-UI
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:13:36 -0400
Received: by mail-wr1-x435.google.com with SMTP id t5so3634358wrw.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAn6zfw6aMrYcPgefnzHwccYHf72WoOmDtwMwiOdWOU=;
 b=fRj39jtTk/v/+NScRUCns762SSI2Umn/8EM83cM4eFw4Z0TQ6h3tembfPYxJW7VDxq
 0vqr/qVy6Fm9FuZWyl5as3vQkO5I002HR/njxvAVKDLNuQ/38DVzZVrruczOmfjKGcsk
 MP63t/QNbNeHvUtw8lbOBUkAQjyKZRUgSTOpha626JXWiugJlLv1cHzn/DLdSZ099xUL
 dF/wcz0UPOvx/4HgQcztUY7xa22C7xVt1PQTrm78ZdgG1Or9mcoQKfrWzuGNK/hS7P0a
 /GGL5fiPAUlpA69QNKn0U/UMOWbojBWiIRGEjOaZqIoZ9eIY1IiGpevegMi2/HNEdz/K
 IM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iAn6zfw6aMrYcPgefnzHwccYHf72WoOmDtwMwiOdWOU=;
 b=K1pQ0f+wqbffws8MELcP6fdfiK4ZwJ2Z9GltrIW1LGQd16gjaNxQ911mbAfjHwT02X
 qQ+w5mQNen6ghqZ53yVN0s6IPuOyhGumvl48LZPpYy0A0bObjIxdzEKrLFHQ1fN+mEip
 /xfIuLJ/TkYdaIRNTp/MNXV0oK2jHHOAHu0ehMYgcjfExbPI0l+wEwQ2nlKXBevCnT40
 dfLO83BKLnClOkA9C5UxA5C0ljVHPvUGCUvoCMh/ZcevsJbNlITr1JuK6TKIGyiCdlKB
 aoEwpiz7EPfNOX33aR1VEU+l2j2X+57uKet5r8HahJZ/0aZj2EmoSJ/mfjeYCLL8YEJe
 SgYw==
X-Gm-Message-State: AOAM531GKVgd+3UbwgqLuFGkDQFy/BpDp5r+IPueVSRbUzCJJVHK72ix
 AcOg5J/U8eNxK6ike9rQTlRKnQAxKSQ=
X-Google-Smtp-Source: ABdhPJxdcdN3D0VHsAu0yHO3Rsn7pySXqRovn9hxdKu5oHlK6Upu6DLZzrWUMCajiVapuCdpDOBt3w==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr13427953wrq.383.1626275613508; 
 Wed, 14 Jul 2021 08:13:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 p12sm1623689wma.19.2021.07.14.08.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:13:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] qemu-config: fix memory leak on ferror()
Date: Wed, 14 Jul 2021 17:13:19 +0200
Message-Id: <20210714151319.617860-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714151319.617860-1-pbonzini@redhat.com>
References: <20210714151319.617860-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The leak is basically impossible to reach, since the only common way
to get ferror(fp) is by passing a directory to -readconfig.  In that
case, the error occurs before qdict is set to anything non-NULL.
However, it's theoretically possible to get there after an EIO.

Cc: armbru@redhat.com
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: f7544edcd3 ("qemu-config: add error propagation to qemu_config_parse", 2021-03-06)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index 7db810f1e0..fdf6cd69fc 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -414,7 +414,7 @@ static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
     if (ferror(fp)) {
         loc_pop(&loc);
         error_setg_errno(errp, errno, "Cannot read config file");
-        return res;
+        goto out_no_loc;
     }
     res = count;
     if (qdict) {
@@ -422,6 +422,7 @@ static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
     }
 out:
     loc_pop(&loc);
+out_no_loc:
     qobject_unref(qdict);
     return res;
 }
-- 
2.31.1


