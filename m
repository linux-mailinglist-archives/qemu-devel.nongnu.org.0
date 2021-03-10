Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D2334519
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:27:53 +0100 (CET)
Received: from localhost ([::1]:57100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2ci-0002nT-3S
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2I1-00062I-6o
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2Hy-0000JE-8t
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xx92GyJcKDec9ihkE2KCgTkx1XXRENYEtB83EjOcbgc=;
 b=E52ubEM/jRT+UL1SE61xxp1DVdPx+grjNrf2lzO7efXNbcG/Cslw5uCcHD5VMyzd4g7vDv
 92DkLLBejqjUq4wHSEtrjb/0dBCXmkWSIbCxd2/2Ui/RaJPDIh06n/WbIkUNUawtL+SUP5
 UKwczniVRuqCbZKpV99/IdJH822ogEw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-bd_ogUTTNpKgzLxb-KB6kA-1; Wed, 10 Mar 2021 12:06:20 -0500
X-MC-Unique: bd_ogUTTNpKgzLxb-KB6kA-1
Received: by mail-ej1-f70.google.com with SMTP id gn30so7449994ejc.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xx92GyJcKDec9ihkE2KCgTkx1XXRENYEtB83EjOcbgc=;
 b=XSQf7PE0kIblKMavlsAOBEoXTw57SLEafY6F6rxt5h8pw7ArE46aYVVCrvgef4nZCL
 jc7sZS3LIM1W6HmPz9+WfMdNGDpenvLk9NeODjT2eoA0yppKSV7a7plxuobAOC3PIPAu
 0OOChA3TJczaE83KJymnCnyoZ67EzIU0u83ihfQd+/vrcuiF0vqjJh0NkWqGnHCYE3Oh
 Ie9mhyi6wU8p3vhfURJKu2nf88QZOfdbyqSs7GjnjvdU5YViGA7z0VPxFCkKVFIblJ8E
 lzcTERg6VNqTyj8rZ4D0Wr6ZyOvD5OvW3yLzT1F34qXufzQQzgwav6pkWnWs3xAox4r2
 JkPw==
X-Gm-Message-State: AOAM5306LgP0DFZv9WJExL+G8UwwghdD/YW1Kd6/CkBMLAa0LsqHo27m
 AfSrc0Zi8a7HJOQ2xL+OZsZrT+eElbEYNfa/RgDe7WB8ygNWbptRSVybsKHxiNnhQ1tM6nJSmx6
 LRa9D1ngdiwq97DWFgGM0NHUNDZIQ81oDXraaUhP9D3ToGGhcYswJHhH8IZBFX8/n
X-Received: by 2002:a50:ec07:: with SMTP id g7mr4438462edr.72.1615395979113;
 Wed, 10 Mar 2021 09:06:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzltBhQM/nIoGAXOTteIpW4DjJt2eiK6oPdsWyVC5ftA50YZpxSfRXnhjHY6DNQf7DAZbIQZw==
X-Received: by 2002:a50:ec07:: with SMTP id g7mr4438439edr.72.1615395978996;
 Wed, 10 Mar 2021 09:06:18 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q26sm36453eja.45.2021.03.10.09.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:06:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] hw/block/pflash_cfi01: Clarify trace events
Date: Wed, 10 Mar 2021 18:05:25 +0100
Message-Id: <20210310170528.1184868-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310170528.1184868-1-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the 'mode_read_array' event when we set the device in such
mode, and use the 'reset' event in DeviceReset handler.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 03472ea5b64..2618e00926d 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -663,7 +663,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  mode_read_array:
-    trace_pflash_reset();
+    trace_pflash_mode_read_array();
     memory_region_rom_device_set_romd(&pfl->mem, true);
     pfl->wcycle = 0;
     pfl->cmd = 0x00; /* This model reset value for READ_ARRAY (not CFI) */
@@ -886,6 +886,7 @@ static void pflash_cfi01_system_reset(DeviceState *dev)
 {
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
 
+    trace_pflash_reset();
     /*
      * The command 0x00 is not assigned by the CFI open standard,
      * but QEMU historically uses it for the READ_ARRAY command (0xff).
-- 
2.26.2


