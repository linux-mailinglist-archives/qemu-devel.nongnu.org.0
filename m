Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79DF2B024D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:54:30 +0100 (CET)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd9JF-00045E-VI
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kd9HH-0003aO-R5
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:52:28 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kd9HG-0001Qt-Em
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:52:27 -0500
Received: by mail-wm1-x343.google.com with SMTP id c9so4672278wml.5
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 01:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xYEIW82b5MHqFEKL+1JEgs0hKZZIrkZWrh5gxg7iaIY=;
 b=vHWt51A0CSo+177Z43iK44k3kQ+T/Wo03zZ5omZyem5Wli57Fl47HoYQslSQH0VLgM
 T0OLEFZH+16Vw3ibjHOWP3n3bniHHUoqjLybnvyov7d+iQJWy0vaGWJp6PadWDzQ2kC3
 HqgcNYSZCBQKA79prkxsDUF+F0DN2cHErGfp03Nz51f7R1ghC6SashDJ14JO3VTSEASY
 /6MtM+CrWfFEYhWhKcG5aFhJIdgQ6PpyYorBAxjgwLtDXQdihOrNODyxBqH6UoCwxTC7
 nfal/ma6slP5BG68x9YP8Ng1h0+AtE0rYfdAmtn1xc8jXkhG3wOIEBmeBFTocWX0kwFf
 LEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xYEIW82b5MHqFEKL+1JEgs0hKZZIrkZWrh5gxg7iaIY=;
 b=mN9+VX3RPexcniI6sKpVJIHogDMTEY7AVAYWoKsHdjPqn8CJlBKj2dz+/7lvI3FfvG
 eLQjw2tYNEqxeNRBcMXFK6QuAR1SWKXbDOFp2qJtBRPRneqTiOuXKiin42Nevc5CXOW/
 5nCwp0EtMi5VNG/Tio0cvMSt2B5r81YgLsE36v4dXST9hjv0/LNUGa3QW7X2PA/XGzBo
 q2lyJYg/CqTmwxKqTtXr844gjbFENWvdwatHiBngKoTrhW38Dv3sOu35/Gp5Y7kUnojp
 XCm/vWFZb9SevdQGr3sB/RCTdKUat81Xp4eJIhCrxqAcEU0NVkWaz9UzOrC8bmKlw+Uc
 wBsw==
X-Gm-Message-State: AOAM530WsNZkKopIU5GcDv3hTP95X+R0vd5bjxtGMIZECDe0C1sc6cjB
 eUsPmRj/U/2ukeImsCWm+wvux/seFnI=
X-Google-Smtp-Source: ABdhPJw9m/qYMYWyUaoe58rnXXWBENbIEDlIgf75aOIa+UcwC/02zTC7YMonq63jhcqoKQVls2Gvmw==
X-Received: by 2002:a1c:4888:: with SMTP id v130mr8519165wma.84.1605174743031; 
 Thu, 12 Nov 2020 01:52:23 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id a128sm5859902wmf.5.2020.11.12.01.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 01:52:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scsi-disk: convert more errno values back to SCSI statuses
Date: Thu, 12 Nov 2020 10:52:20 +0100
Message-Id: <20201112095220.52590-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux has some OS-specific (and sometimes weird) mappings for various SCSI
statuses and sense codes.  The most important is probably RESERVATION
CONFLICT.  Add them so that they can be reported back to the guest
kernel.

Cc: Hannes Reinecke <hare@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 424bc192b7..fa14d1527a 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -461,6 +461,25 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
             }
             error = scsi_sense_buf_to_errno(r->req.sense, sizeof(r->req.sense));
             break;
+#ifdef CONFIG_LINUX
+            /* These errno mapping are specific to Linux.  For more information:
+             * - scsi_decide_disposition in drivers/scsi/scsi_error.c
+             * - scsi_result_to_blk_status in drivers/scsi/scsi_lib.c
+             * - blk_errors[] in block/blk-core.c
+             */
+        case EBADE:
+            /* DID_NEXUS_FAILURE -> BLK_STS_NEXUS.  */
+            scsi_req_complete(&r->req, RESERVATION_CONFLICT);
+            break;
+        case ENODATA:
+            /* DID_MEDIUM_ERROR -> BLK_STS_MEDIUM.  */
+            scsi_check_condition(r, SENSE_CODE(READ_ERROR));
+            break;
+        case EREMOTEIO:
+            /* DID_TARGET_FAILURE -> BLK_STS_TARGET.  */
+            scsi_req_complete(&r->req, HARDWARE_ERROR);
+            break;
+#endif
         case ENOMEDIUM:
             scsi_check_condition(r, SENSE_CODE(NO_MEDIUM));
             break;
-- 
2.28.0


