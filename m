Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A914CA03D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 10:03:31 +0100 (CET)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPKtN-0003sb-M8
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 04:03:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nPKnL-0000Vj-VW
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:57:16 -0500
Received: from [2607:f8b0:4864:20::102d] (port=45690
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nPKnI-0005qx-3Y
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:57:13 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so1202705pjl.4
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 00:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HKcOSKwTYx734ssO2wL5LIpMjhKiy7t98xv/fASrs28=;
 b=fnnURRRzcoQUE7AwLrzTjTnapwT0XKLpc6xBfEeI/6faBoQbb1LOenmVh3Hsb/iErQ
 PLYVQ+HQByM1yrF47ET19qPjQoL+QE/rFmvfPxmqGfmO8PS6H5NG0STSw5+hfLbyjH2Z
 j8MV+9j2B9oDadX18psmDAiRi7ffK+VKKBcW3fnO5EuGDd0w99EbCEeu9Uz80DV7fd54
 pDjuTf3TTPIDMO84OiC5iV/V414XxQls14wiPPfj8frtVdrUvPFcP5RtgoRlSo8No6Fi
 N9ztkthP0Jf5r45pUOff6nj1+4H/ysetD128Mgs6p5WTIMSxiuvDtny5YF+lTTt/vAu0
 h2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HKcOSKwTYx734ssO2wL5LIpMjhKiy7t98xv/fASrs28=;
 b=esB1QeyQjsYFQ4U7lNZ37u1EgH3mXkxncDbwDWzElPZbaY86d5ePV9ImS7IWGH+7uB
 BX8qzOUs/hvZv0ZDhHe1qOC2VKWR76fVZIpx5Hj9/FaVz7UUoW5kEGMVGHwMCGNLaBX+
 32EYR9hcuCbKC9/V9GvwGYMu90lNVI8UV4RFQqrUUr8rXIPY8wPStHhR+VE5kp1WRmlj
 l8ty5VDND8Cg5kYDKinPRsoA2IU8+ZfEDKfib0mSCQyvYKIK7GifZnIBfuMYJ7m05cFb
 PCQICEJhk4hnHSU+U0OQcjPdBWPdmDzsS8mpqlBtcjSZk3wP9r7fD1k/Qv/CSVkxH/DT
 2G5Q==
X-Gm-Message-State: AOAM533ygO4Zo+1d8ob+6uCXtsdlvsp5liCo5HLy3UHprAAhTIOu+eGP
 FInaiJqqPI16YagAAnz1BMV/Eg==
X-Google-Smtp-Source: ABdhPJwK6ZKc40L3nQG2rSrIQswdaWmSEqTkTwCi5QYF5Xw5Dq+/wq+lLtfZmNDry/6YmE27YKfERw==
X-Received: by 2002:a17:90b:1d10:b0:1bd:500:c1b with SMTP id
 on16-20020a17090b1d1000b001bd05000c1bmr23587102pjb.177.1646211429980; 
 Wed, 02 Mar 2022 00:57:09 -0800 (PST)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a056a00149500b004e15a113300sm21075094pfu.198.2022.03.02.00.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 00:57:09 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com
Subject: [PATCH 1/2] qapi: Introduce NVMe disk bus type
Date: Wed,  2 Mar 2022 16:54:09 +0800
Message-Id: <20220302085410.1302157-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302085410.1302157-1-pizhenwei@bytedance.com>
References: <20220302085410.1302157-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assigning a NVMe disk by VFIO or emulating a NVMe controller by QEMU,
a NVMe disk get exposed in guest side. Support NVMe disk bus type for
QAPI.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qga/qapi-schema.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 94e4aacdcc..1b5ea4c5f8 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -827,13 +827,14 @@
 # @mmc: Win multimedia card (MMC) bus type
 # @virtual: Win virtual bus type
 # @file-backed-virtual: Win file-backed bus type
+# @nvme: NVMe disks
 #
 # Since: 2.2; 'Unknown' and all entries below since 2.4
 ##
 { 'enum': 'GuestDiskBusType',
   'data': [ 'ide', 'fdc', 'scsi', 'virtio', 'xen', 'usb', 'uml', 'sata',
             'sd', 'unknown', 'ieee1394', 'ssa', 'fibre', 'raid', 'iscsi',
-            'sas', 'mmc', 'virtual', 'file-backed-virtual' ] }
+            'sas', 'mmc', 'virtual', 'file-backed-virtual', 'nvme' ] }
 
 
 ##
-- 
2.20.1


