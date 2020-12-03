Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815B92CD65B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:06:09 +0100 (CET)
Received: from localhost ([::1]:41720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkoJE-00029U-Jy
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kko6P-0004Oa-5b
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:52:53 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:43960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kko6I-0008Kz-Vg
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:52:52 -0500
Received: by mail-lj1-x236.google.com with SMTP id 142so2361858ljj.10
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 04:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HEZu0gb15wHkzlu6krDNXkRlzwjgOoNExS8odb0pUVs=;
 b=C3PK5436R2duRbeGqfd4RUm8oIeqruiW3GcOI0gYskJpf8dZHmT0/33q5cryA1yjNn
 9JtN6KyYazq+j54UOUN+Y7LVfYJdJu163Eg033KWtv/AnVG4TYxG7V3gSvoEpghSqOeg
 QlDkKxqnGkHMe0MqRf6qhm6XrEm2PQCGkJGxOLClrjlK+5y0SGo9suEgS00Li8Hc5c16
 821Uzrqdl94AjdsBIZtKdAtGhnzkZbtvikbAtEB9U9XNGWTfLtNWbcvPQ+tY+r3eCEMw
 aTKK2ZG7EFp1cf5B0lbOeNuhmNPJguhHjzokry0XY7J65rLxwT4EacZTSL4anh6kQj/8
 ghww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HEZu0gb15wHkzlu6krDNXkRlzwjgOoNExS8odb0pUVs=;
 b=j1q+5fYVBszxkRdmwAHJIBiLCf0S4M8iA2lrp4Z0CNMydePfj/f/sZu/SSZbttUH9n
 oGk2uAIDrNGekIwH/3IJivK2WLMMVh4UqSkvwKcip0z2w1c5f4WpCuN6kN9CYnx+erXr
 fZIWvQB2doiI53zan5J0DUuD/MC5p1QNJfC081QNcjhCSO+e26RsZzvvt+1JGv7S+3mD
 KuAyEDwOfuGZ9ol7xbWZX1B+n3lwFIfYXcflPtIGs0oKDFZBwIzag6+gcYmrXfYINCva
 DF4VoxxayTydcbCJzs7PRHt8hTcSA4D+13vXLekWaUtLwE+/hDpB7OqZ3inLV6eYWo/h
 cI6Q==
X-Gm-Message-State: AOAM532jyaGrXal6SVutH+A7z2Y+dTmXfzFotN8qGZRsYAc72k6qJIZj
 v/QqhwBVZTUEVvmhcRnQzRD1uw==
X-Google-Smtp-Source: ABdhPJzdBndgvkAlV1WrXchSYeTzwMyzv1uBTkB6n0wAHhkujRwUxvr45PMFp0wLkWR8DrF0gerjZw==
X-Received: by 2002:a2e:b164:: with SMTP id a4mr1193988ljm.271.1606999964571; 
 Thu, 03 Dec 2020 04:52:44 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id b17sm499891lfc.93.2020.12.03.04.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 04:52:43 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com
Subject: [PATCH v4 0/2] hw/virtio-pci: AER capability
Date: Thu,  3 Dec 2020 15:25:15 +0200
Message-Id: <20201203132517.220811-1-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::236;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: intel-wired-lan@lists.osuosl.org, qemu-devel@nongnu.org,
 alexander.duyck@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Main motivation:
According to Microsoft driver\device certification requirements
for next version of Window Server, PCIe device must support AER.
"Windows Server PCI Express devices are required to support
Advanced Error Reporting [AER] as defined in
PCI Express Base Specification version 2.1."

AER capability for virtio-pci is disabled by default.
AER capability is only for PCI with PCIe interface on PCIe bus.
During migration - device "realize" should initialize AER
if requested by device properties.
Fixed commit message.

Andrew (2):
  hw/virtio-pci Added counter for pcie capabilities offsets.
  hw/virtio-pci Added AER capability.

 hw/virtio/virtio-pci.c | 20 +++++++++++++++++++-
 hw/virtio/virtio-pci.h |  4 ++++
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.29.2


