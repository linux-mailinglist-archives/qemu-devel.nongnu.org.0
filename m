Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF16325EC6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:18:48 +0100 (CET)
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYKl-0006CV-AG
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY80-0001jq-D3
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:37 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7x-000453-GO
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:35 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u14so7678774wri.3
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54CLPfv727tDDEzkZUVZZm7JwSzL5y7iMO0EvhdL5P8=;
 b=GqI44uY1ZDUJh5GQFhIRcBP78NplQiCfxvN72rapuTL7B6pGPv5D3HQ1k5U9OJbit2
 RwxC23OfqXNx7mXuxvOCetT6arCQnf2M9a71T+kojgkqHzq9T/81YGXx2UPQuEcIrB3z
 lUCl0O5A3uT9dpshXtHQCOLnut3LIfDOzDu/pYfpAyJv/tLCAvIf3wagGp1QXE2st0DC
 3Sln2L8ito9O7MSuSiSuE3TbJ7A+0FjopFmmse930AhJzTORSwRki9DNpA9yPybU1XEV
 uUT+1IRafeL8RScCD/ggW74ySJYXAq2O9cgFbPbFx+s50HDsTgcDwSi6jY/XyKJQ3rBA
 Lv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=54CLPfv727tDDEzkZUVZZm7JwSzL5y7iMO0EvhdL5P8=;
 b=fqnIxhJBozxAF5g9txcF+mNEs10KIW9JEtLMWiUcZsGc5OI3d8QRvXhRJv+RbT7zgz
 Lae7DyvFCq5+5vehl+0ltz+XAGXVhulu/29vEOXyo1W7mKL3QAGlPLBrNgZ4+kMDzpuo
 RroTW5ipBhDBmUhIcs69dpOiwRbYI8N5kPP0O532cqz9c7khntg4RGz3D0giWZKMb/lV
 XZnlfj3KJizfXS7UsKxsvRgy3+MGUJiidx08jEexPxMPysgPtTDwZioLa4zf3gFNjJtv
 Sf0nMiKPNDrqbk3DkXU6HV4/XDXoi+T6tikR0ciZae4ubkiZ5Vd2sxw8s+XcQ4XJBnRw
 oetg==
X-Gm-Message-State: AOAM533PH3m7N30vF/QsD9/GtoTuAiCcXOZDDook7nrPdSLAb1RAo46d
 PZYdNhS3OcFf2xNHCKBvuFr7nvRKrwI=
X-Google-Smtp-Source: ABdhPJwG840UrJMT/kpxHrsXHEQgpCALLzfyZWQ8ZwjPHPy7S1P0lfbxpUaEey7BF4S7FScxdymnGg==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr1795296wrq.136.1614326731715; 
 Fri, 26 Feb 2021 00:05:31 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/29] scsi: allow user to set werror as report
Date: Fri, 26 Feb 2021 09:05:03 +0100
Message-Id: <20210226080526.651705-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Zihao Chang <changzihao1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zihao Chang <changzihao1@huawei.com>

'enospc' is the default for -drive, but qemu allows user to set
drive option werror. If werror of scsi-generic is set to 'report'
by user, qemu will not allow vm to start.

This patch allow user to set werror as 'report' for scsi-generic.

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
Reviewed-by: Fam Zheng <fam@euphon.net>
Message-Id: <20201103061240.1364-1-changzihao1@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 176a72951c..cf7e11cf44 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -673,7 +673,8 @@ static void scsi_generic_realize(SCSIDevice *s, Error **errp)
         return;
     }
 
-    if (blk_get_on_error(s->conf.blk, 0) != BLOCKDEV_ON_ERROR_ENOSPC) {
+    if (blk_get_on_error(s->conf.blk, 0) != BLOCKDEV_ON_ERROR_ENOSPC &&
+        blk_get_on_error(s->conf.blk, 0) != BLOCKDEV_ON_ERROR_REPORT) {
         error_setg(errp, "Device doesn't support drive option werror");
         return;
     }
-- 
2.29.2



