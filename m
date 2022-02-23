Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310064C159A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 15:42:02 +0100 (CET)
Received: from localhost ([::1]:42214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMsq9-0000nl-7X
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 09:42:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiQ-000153-KD
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:02 -0500
Received: from [2607:f8b0:4864:20::1029] (port=56053
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiL-0005Zz-Qo
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:02 -0500
Received: by mail-pj1-x1029.google.com with SMTP id gb21so630868pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 06:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6k7dzw+wjQP6xMRbpFIU+8O7iNbBQrw6ndM2cloE9Fs=;
 b=rP8IoseEoxTNvAnSull9oOQeqmwWMbYLpgvFtES0YvNlEjIfWB3htwgfbE0I4AwoQZ
 KD+KvW1ZJOvAtbf21aX/I1CupCcf8+7eawJcBskbF2Pu3ibbJzuzfUGIo/LZwBJ6UdFX
 D/WzdsippH4sA9Lc0mbcVsFdLwG/rpJdFVlFI1CgEsmucAzaQnLa9vkQAj6Cd4eJeYmb
 BFp20d9KKMxPdbjA4V4leod1qh42yYPmTeLxHNNviUvcX4o7Ke6zEpAxvR8JvdRSmDQX
 6+yXfCFTWjuvqoAEPY3iuROMkancm8yrHGIXVwLOdrdFb+q7UpQLHHZaEfoT6902l0ei
 2jzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6k7dzw+wjQP6xMRbpFIU+8O7iNbBQrw6ndM2cloE9Fs=;
 b=hARI5/3pkrJB9CwLNTqYkZrXd4wW2hv9OiUd44XC7aL9cjeHAPJsGacgwqfWKmLdf/
 qPuk2GhDNg63ei+Audkf74oOCEI2Hl3nY/W48NywnoknH4IJ5GdjxxELDyXZheOWWANf
 HwM/cu0qOEEWRJOepkR4n+gvVjOdvmCOvdqaD4YbC/RAtuWZMpo8d8ubI5GIVPRf1PXf
 lmoZIOGeKbNkk8Etqj3rRcmWmhT30B6FOSZm1K+7bgjuQBath+up5O+KeVG/sBz6GstA
 dI9N5tOeA8/coOcG0+jk/8v1S9w8lg2G/JdC/6PXuV5x0qQOdpTJiLu2CY8kttEECM7L
 OCsw==
X-Gm-Message-State: AOAM531pcBWL0jPUlgN8ukSK5AjfWBHBoOgTMWjEr/TLhv+WWffRI+1t
 5ml7hh2/dwLAV0zWjV08avUhi9NKZAKKQQ==
X-Google-Smtp-Source: ABdhPJxJIyPPDyeCb4Pu7/RO24mFAaHdz3382MSfzucU9ZYx2AWZ56UJKAxOOUZbCqTTUQnavwcfhQ==
X-Received: by 2002:a17:90a:6043:b0:1bb:e73f:9640 with SMTP id
 h3-20020a17090a604300b001bbe73f9640mr9450193pjm.65.1645626836188; 
 Wed, 23 Feb 2022 06:33:56 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.81])
 by smtp.googlemail.com with ESMTPSA id
 l21sm22929583pfu.120.2022.02.23.06.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 06:33:55 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, mst@redhat.com,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 3/7] docs/acpi/erst: add device id for ACPI ERST device in
 pci-ids.txt
Date: Wed, 23 Feb 2022 20:03:18 +0530
Message-Id: <20220223143322.927136-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223143322.927136-1-ani@anisinha.ca>
References: <20220223143322.927136-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ani Sinha <ani@anisinha.ca>, Eric DeVolder <eric.devolder@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding device ID for ERST device in pci-ids.txt. It was missed when ERST
related patches were reviewed.

CC: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 docs/specs/pci-ids.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index 5e407a6f32..dd6859d039 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -65,6 +65,7 @@ PCI devices (other than virtio):
 1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
 1b36:0010  PCIe NVMe device (-device nvme)
 1b36:0011  PCI PVPanic device (-device pvpanic-pci)
+1b36:0012  PCI ACPI ERST device (-device acpi-erst)
 
 All these devices are documented in docs/specs.
 
-- 
2.25.1


