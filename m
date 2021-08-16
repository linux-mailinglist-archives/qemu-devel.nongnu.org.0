Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BC53EDDA7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 21:12:50 +0200 (CEST)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFi2T-00039V-Ur
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 15:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFi0B-0000gm-Fg
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:10:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFi09-0000iy-J8
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629141024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7IKI5vQIS+8GpRtM/YVzKeZQYmQAc9qsC0uwxv7xsHM=;
 b=e6jDx+Nl/9jaqYMADpAZtX7YzQL3cDybBV2/a9KJmgzPra8UzIJA/YtTijgXzD/2otnZ6L
 l6w4dKj1abRFbadTkOFyEAW620yE5+6rEGov9TROOag7h6jhm5lFOXRNlkLZynQorPCJ0P
 eNOzma1dmRD0pCjz0dpxIEKaOEIk21s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-0qCKYnrlMzeu7gspuU-ZWg-1; Mon, 16 Aug 2021 15:10:23 -0400
X-MC-Unique: 0qCKYnrlMzeu7gspuU-ZWg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so69806wmj.8
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 12:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7IKI5vQIS+8GpRtM/YVzKeZQYmQAc9qsC0uwxv7xsHM=;
 b=FNOqmGUPWbLUKL0I8lKEdjSTQBjY9kv7gPVJglc3ZLo4v3CvBPn5413MUATg4/MAnn
 jG//pi7eGTB9t3XoEDIdhdRsXbhDaYAGq11Z3+NRDUkkwjMo+jdAhc5EwmyZHKH7UFhc
 JiOU7iNvIvXzCI6lkLXnqPISkFwuyYomODGzpqX2ZaZjNmOMS2WC8HY82LDgnrmZMW9q
 vhb2jT+47neLboCh8OfGawJFnwjqKpelLujGuNmdM3TvoHGIYK3YP5lHL1WFTyJdhiDz
 TLArbV3drV2sbBKI9ZdZituiObJKWDXpukw0RbZtFhTHlP+bvbiQPgMOXoxMH+yLoqm1
 oPGg==
X-Gm-Message-State: AOAM531/NB4qY2RB2lyvfgkqSdv5uoU7bhsZ3fxQlcEnT23LD73UUBAi
 O2mBVzL/8W7L89kcLcRqcejKoKq2Ga1WYFlnZbYnFBny5hfRDx4PBKP2boBB5kSnA9/R+Ydz6uv
 X0t+a4b4oeD236s+KpUNoztFgqBWPBTXnloGOsIjoxj33ihuSY05dx+Ps2zlrHzj+
X-Received: by 2002:a1c:f414:: with SMTP id z20mr579864wma.94.1629141021783;
 Mon, 16 Aug 2021 12:10:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6+yzHnPMHR5zq6nZzK0/QO26yMBCJMlxZYH+fACbnKD1PwwHbsBU0loTUfOM6Q3+y4xU/3g==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr579842wma.94.1629141021532;
 Mon, 16 Aug 2021 12:10:21 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b12sm71745wrx.72.2021.08.16.12.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:10:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] MAINTAINERS: Split Audio backends VS frontends
Date: Mon, 16 Aug 2021 21:10:12 +0200
Message-Id: <20210816191014.2020783-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816191014.2020783-1-philmd@redhat.com>
References: <20210816191014.2020783-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, clamky@hotmail.com,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=20Zolt=C3=A1n?= <dirty.ice.hu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b3697962c1..9ec6baa7e4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1660,6 +1660,16 @@ F: hw/net/opencores_eth.c
 
 Devices
 -------
+Overall Audio frontends
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Odd Fixes
+F: hw/audio/
+F: include/hw/audio/
+F: tests/qtest/ac97-test.c
+F: tests/qtest/es1370-test.c
+F: tests/qtest/intel-hda-test.c
+F: tests/qtest/fuzz-sb16-test.c
+
 Xilinx CAN
 M: Vikram Garhwal <fnu.vikram@xilinx.com>
 M: Francisco Iglesias <francisco.iglesias@xilinx.com>
@@ -2256,17 +2266,11 @@ F: include/net/can_*.h
 
 Subsystems
 ----------
-Audio
+Overall Audio backends
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Odd Fixes
 F: audio/
-F: hw/audio/
-F: include/hw/audio/
 F: qapi/audio.json
-F: tests/qtest/ac97-test.c
-F: tests/qtest/es1370-test.c
-F: tests/qtest/intel-hda-test.c
-F: tests/qtest/fuzz-sb16-test.c
 
 Block layer core
 M: Kevin Wolf <kwolf@redhat.com>
-- 
2.31.1


