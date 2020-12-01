Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914572CAB98
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:16:52 +0100 (CET)
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkB8t-0001oL-Ke
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB3B-0004St-IU
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:10:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB38-0001CB-Gv
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606849852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGbOkVtccZuNiaIjB/Ue2VFK3Wp2YM6HNCOG5vhEWr0=;
 b=bYN+OQBiPae1OnIWotgacarQdPnCecnbGG6bmDhjQRzLEvlzKvXGSkGsjLfNHWHRJKo6J6
 Epmh6K0Wu1Io9PH/IoEXLspoIpg78h0pYwmf1mzHNkeTQZMKoVBNuTh5NkUDpfufZXtGLQ
 m7A5r6DTaLE9aVi5al+er+BzwZCPIqw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-WO8qCcm-OyKErjtzgwsKhw-1; Tue, 01 Dec 2020 14:10:51 -0500
X-MC-Unique: WO8qCcm-OyKErjtzgwsKhw-1
Received: by mail-wm1-f69.google.com with SMTP id z16so1161661wma.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGbOkVtccZuNiaIjB/Ue2VFK3Wp2YM6HNCOG5vhEWr0=;
 b=k022j7DUup1ShqJoARaHp2Ew2STB0tiVjKSSGg9YSa6FNUZHfIPO1+2uyg9kQvJ3rz
 4vyYLU/4oPY+Gy/lF11jMT34b5eDKmPhpNMPjt9t2kD1Aa8UJ0U0axI/dTx8b5BU1tDV
 3vzZqSU56xhMyZSAvK/4B4IgRvY7P3VAhouHTr2DPlDkgvCJYNAuZalejoq84tNCXwi8
 vxYv06T0UCZ/gKmysmGDF55Mt7zNSdJTi7JjyIQA6yFO5QUGOGSJm2j7YbVPrAjWmd36
 muSpY49wGEdI6ia13lmhYBl7jLzsq0Ps++Koj7+yFH0DrykS15TFtj86oAcvdme2GBlV
 Znzw==
X-Gm-Message-State: AOAM533Tnb3/yEq4PlP7myFmxROHAziX7hfLVxcA6vC66CPsb383gmwE
 jUB8c3cZbMP+0LwI2RBcIyBVh+L5r9lWodnGogUe42UJ1kcs6+sCeaclvtPxr93fG7vgUr+K8a3
 xTyyjBCghEgHf4OkaZJXGvtN0Fm4XwS8IQNmruYAqaW8owTnV2b8mtjonomclJRTl
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr5837940wrn.207.1606849849684; 
 Tue, 01 Dec 2020 11:10:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydC7yDNoLyIxmWwbBbZ6x6HSLyJYzSndkm+uJT6QjVjkW7JltyycHoMoEcWIPvHZPhKK6UVg==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr5837911wrn.207.1606849849526; 
 Tue, 01 Dec 2020 11:10:49 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id d13sm885463wrb.39.2020.12.01.11.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:10:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/4] hw/scsi/megasas: Have incorrect cdb return
 MFI_STAT_ABORT_NOT_POSSIBLE
Date: Tue,  1 Dec 2020 20:10:26 +0100
Message-Id: <20201201191026.4149955-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201191026.4149955-1-philmd@redhat.com>
References: <20201201191026.4149955-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid out-of-bound array access with invalid CDB is provided.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC because no clue how hardware works
---
 hw/scsi/megasas.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index f5ad4425b5b..7e7cbb8854b 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1680,7 +1680,15 @@ static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
     if (cdb_len > 0) {
         len = scsi_cdb_length(cdb);
     }
-    assert(len > 0 && cdb_len >= len);
+    if (len < 0 || len < cdb_len) {
+        trace_megasas_scsi_invalid_cdb_len(mfi_frame_desc(frame_cmd),
+                                           is_logical, target_id,
+                                           lun_id, cdb_len);
+        megasas_write_sense(cmd, SENSE_CODE(INVALID_FIELD));
+        cmd->frame->header.scsi_status = TASK_ABORTED;
+        s->event_count++;
+        return MFI_STAT_ABORT_NOT_POSSIBLE;
+    }
     if (is_logical) {
         if (target_id >= MFI_MAX_LD || lun_id != 0) {
             trace_megasas_scsi_target_not_present(
-- 
2.26.2


