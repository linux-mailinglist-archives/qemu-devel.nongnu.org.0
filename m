Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233AB310051
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 23:52:25 +0100 (CET)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7nU7-00051k-Um
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 17:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7nSa-00043A-Tl
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:50:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7nSZ-00061u-28
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612479046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oPGTla5PrkCsppu+7N9sKNWNuYVuSz/EYc1S5deb/zQ=;
 b=EfoD2MV0tbsNOfetVLSqIW7a2YUvjn7Tff1Gmx146lTHHfTVXS4dRWKaRXrtctSH09nOma
 91C08K/a+TivCAsQ1hF3vIIXWIpiw4tNCYFGXAzlaCwMTQsAcK30/vMd4lz2a5yNs5DreI
 0ouN7zt3tgweDhz18nnipHJD/qrFdKA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-DyU9awsWNpKh5bF2b8l-mA-1; Thu, 04 Feb 2021 17:50:44 -0500
X-MC-Unique: DyU9awsWNpKh5bF2b8l-mA-1
Received: by mail-ej1-f69.google.com with SMTP id yh28so4211103ejb.11
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 14:50:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oPGTla5PrkCsppu+7N9sKNWNuYVuSz/EYc1S5deb/zQ=;
 b=ZN1SF1U4WSmG0vo0sl2hhQCmWYevIVnL9kdekNW/TDDvV9ha7yrvyEUhUyHv+QNSaD
 3V4g5oiH8LPSMljqfYRzb+J/lBAnroSUXx2FTxQHDwZ8pEyuHimvt9tDQrTIqDN3byO0
 4pzAaHMUanjTeR+DapfPf2OHkAV7hIDrr6gsU7op75eD8XNlR7DCSx5SOb/PBUhLl4kX
 /wiO4nKaj1Vl6YZOAL3ublevpcoynZ5bFpFrxAgUV0vCxav+nkg0y5r+LJRjUyLDc453
 pyT/JlaV46a2rTDIWxmyBhKOMgADr7BGVEzaFS78PXZZ7D40GcVav6SDxcvt/Vcqwoak
 Em2A==
X-Gm-Message-State: AOAM531txoXftOndgG6tWxyCqYa1XZd5sWmc2LtqWg2bCOYSuFKFEa3W
 UvLHI3iGmF7V13kpoYMhhMvwaJYp+aCTqqfJLoYpN/YJZRPpltojARBD3uZ03mG3J1KeuyH/toH
 yvzyiDke6oUI88j19UEyBf9Zo+4p65B8BeYCoPE/AUU4dq1xtJ6aCml16RotczvQN
X-Received: by 2002:a17:906:d8b5:: with SMTP id
 qc21mr1247221ejb.62.1612479043418; 
 Thu, 04 Feb 2021 14:50:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxda5jqG/9SAr1NKPWhmgnkgZT1Om4oLaqKxWLHM3keC8no89hmuUxGPwAz3c0j+qMKmOQDdg==
X-Received: by 2002:a17:906:d8b5:: with SMTP id
 qc21mr1247208ejb.62.1612479043253; 
 Thu, 04 Feb 2021 14:50:43 -0800 (PST)
Received: from x1w.redhat.com (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id cw21sm3083641edb.85.2021.02.04.14.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 14:50:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/scsi/scsi-disk: Fix out of bounds access in
 mode_sense_page()
Date: Thu,  4 Feb 2021 23:50:40 +0100
Message-Id: <20210204225041.1822673-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Alexander Bulekov <alxndr@bu.edu>,
 Li Qiang <liq3ea@gmail.com>, qemu-stable@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "SCSI Commands Reference Manual" (Rev. J) chapter 5.3
"Mode parameters" and table 359 "Mode page codes and subpage
codes", the last page code is 0x3f. When using it as array index,
the array must have 0x40 elements. Replace the magic 0x3f value
by its definition and increase the size of the mode_sense_valid[]
to avoid an out of bound access (reproducer available in [Buglink]):

  hw/scsi/scsi-disk.c:1104:10: runtime error: index 63 out of bounds for type 'const int [63]'
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/scsi/scsi-disk.c:1104:10 in
  =================================================================
  ==1813911==ERROR: AddressSanitizer: global-buffer-overflow
  READ of size 4 at 0x5624b84aff1c thread T0
      #0 0x5624b63004b3 in mode_sense_page hw/scsi/scsi-disk.c:1104:10
      #1 0x5624b630f798 in scsi_disk_check_mode_select hw/scsi/scsi-disk.c:1447:11
      #2 0x5624b630efb8 in mode_select_pages hw/scsi/scsi-disk.c:1515:17
      #3 0x5624b630988e in scsi_disk_emulate_mode_select hw/scsi/scsi-disk.c:1570:13
      #4 0x5624b62f08e7 in scsi_disk_emulate_write_data hw/scsi/scsi-disk.c:1861:9
      #5 0x5624b62b171b in scsi_req_continue hw/scsi/scsi-bus.c:1391:9
      #6 0x5624b62b2d4c in scsi_req_data hw/scsi/scsi-bus.c:1427:5
      #7 0x5624b62f05f6 in scsi_disk_emulate_write_data hw/scsi/scsi-disk.c:1853:9
      #8 0x5624b62b171b in scsi_req_continue hw/scsi/scsi-bus.c:1391:9
      #9 0x5624b63e47ed in megasas_enqueue_req hw/scsi/megasas.c:1660:9
      #10 0x5624b63b9cfa in megasas_handle_scsi hw/scsi/megasas.c:1735:5
      #11 0x5624b63acf91 in megasas_handle_frame hw/scsi/megasas.c:1974:24
      #12 0x5624b63aa200 in megasas_mmio_write hw/scsi/megasas.c:2131:9
      #13 0x5624b63ebed3 in megasas_port_write hw/scsi/megasas.c:2182:5
      #14 0x5624b6f43568 in memory_region_write_accessor softmmu/memory.c:491:5

Cc: qemu-stable@nongnu.org
Reported-by: OSS-Fuzz
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Buglink: https://bugs.launchpad.net/qemu/+bug/1914638
Fixes: a8f4bbe2900 ("scsi-disk: store valid mode pages in a table")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Mention reproducer link
---
 hw/scsi/scsi-disk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index ed52fcd49ff..93aec483e88 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1089,7 +1089,7 @@ static int scsi_emulate_mechanism_status(SCSIDiskState *s, uint8_t *outbuf)
 static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
                            int page_control)
 {
-    static const int mode_sense_valid[0x3f] = {
+    static const int mode_sense_valid[MODE_PAGE_ALLS + 1] = {
         [MODE_PAGE_HD_GEOMETRY]            = (1 << TYPE_DISK),
         [MODE_PAGE_FLEXIBLE_DISK_GEOMETRY] = (1 << TYPE_DISK),
         [MODE_PAGE_CACHING]                = (1 << TYPE_DISK) | (1 << TYPE_ROM),
-- 
2.26.2


