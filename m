Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB84861B4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 09:57:40 +0100 (CET)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5OaZ-0007Fs-AT
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 03:57:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n5OXL-0005ks-PU
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:54:20 -0500
Received: from [2607:f8b0:4864:20::633] (port=42619
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n5OXE-0004mQ-Pk
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:54:16 -0500
Received: by mail-pl1-x633.google.com with SMTP id u16so2042743plg.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 00:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PD4vaWS8qThRMxRnTUvLioA/lBSWjZUqaVqN75Oy5v4=;
 b=iNGYe9WFUXCSHbnV9QgVv0OZpMFPY/RY8KNinxu2IClvgDF5wqLjWEPmsygglj8r7u
 kwn5QWnNdbhtbXojPF8yl3FDXNebxoGqKgXhgK89vsyZM3l+Jmv2/czk6v/XkbrgMUI1
 OXmYOHkZi8QU51z3oPwIMZu3L0B6/Qk5WQwORCrabGv7OXQOYCPvDC9C1qnDk0ZtKvkc
 TmP5iq/qVubi0PS2IY0/WQxgsoYUX4etmnDTGrE82zsVqptm2ULShZNCUGS/OjD6yDBQ
 KXowD9yJrtKyoUlMBXcq9v1bp17VqRGDRcbqFslVfLbN67nL5fEe44NjKlLQsgdOsdwf
 KeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PD4vaWS8qThRMxRnTUvLioA/lBSWjZUqaVqN75Oy5v4=;
 b=F+9+jn57aO18DlzeCX3HS1G2//lYHe2yokVlL6a3llEW9VJ5MwxYmmkRsBhxuKTZ3S
 e7yHKJt1lLZUgNfkgPbfAI4FYosc4Z6+nuCVcFeAtn7pKSPA08UDkspT+EHnSh83zkyI
 Nmi7hLgSf7XNVb/ipCI3X2bb+hFgmI3NarNbtPrt1ScwgIKpuSOI3mdpwI5T0K8bZhI4
 kpuCZvxgMgnZwhzkLW9/Ie5f9jVSrGbYV0wrlhM4mDjCDmmWEVA/2QgrrClDeylzFed+
 Ku1nvIhc4ThUmH/bUzLAr/Nhn3jbWlARxILPLMXjXGPybfivh6jpV2JcP+SCQUT+0fqf
 NaCw==
X-Gm-Message-State: AOAM533udosT7y7RWYmdcTWm0yfGgsPk1hQVKb0zWJcmdmx2MjxQQlOz
 5m9Q1y6nxEWxmCTBtjJN0UzvHA==
X-Google-Smtp-Source: ABdhPJwrU5VumQvUiNAgJnZdalq5nl1Sq9EYBCxweKh93qIh9Hi+9sgZEjERXxT9HEv9CkwfIRJhOQ==
X-Received: by 2002:a17:903:41ca:b0:149:2191:d9e9 with SMTP id
 u10-20020a17090341ca00b001492191d9e9mr57620365ple.137.1641459249958; 
 Thu, 06 Jan 2022 00:54:09 -0800 (PST)
Received: from libai.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id o11sm1474355pjs.9.2022.01.06.00.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 00:54:09 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: peter.maydell@linaro.org, richard.henderson@linaro.org, eblake@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, kraxel@redhat.com
Subject: [PATCH v2 0/2] Introduce camera subsystem
Date: Thu,  6 Jan 2022 16:53:02 +0800
Message-Id: <20220106085304.795010-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

v1 -> v2:
  [missing CC qemu-devel@nongnu.org, resend]
  Separate v1 patch set into 2 parts:
    Introduce camera subsystem (this one).
    USB desc fix and UVC.
  Add maintainer infomation.

v1:
1, The full picture of this patch set:
   +---------+       +------------+     +---------------+
   |UVC(done)|       |virtio(TODO)|     |other HW device|
   +---------+       +------------+     +---------------+
         |                 |                     |
         |            +------------+             |
	 +------------+camera(done)+-------------+
                      +----+-------+
                           |
         +-----------------+---------------------+
         |                 |                     |
  +------+------+     +----+-----+        +------+------+
  |builtin(done)|     |v4l2(done)|        |other drivers|
  +-------------+     +----------+        +-------------+

With this patch set, We can run a desktop VM (Ex Ubuntu-2004), several camera
APPs(cheese, kamoso, guvcview and qcam) work fine.

Some works still in working:
  1, hot-plug
  2, compat with live migration
  3, several actions defined in UVC SPEC

Zhenwei Pi (2):
  camera: Introduce camera subsystem and builtin driver
  camera: v4l2: Introduce v4l2 camera driver

 MAINTAINERS             |   7 +
 camera/builtin.c        | 717 ++++++++++++++++++++++++++++++++++++++++
 camera/camera-int.h     |  19 ++
 camera/camera.c         | 522 +++++++++++++++++++++++++++++
 camera/meson.build      |  20 ++
 camera/trace-events     |  28 ++
 camera/trace.h          |   1 +
 camera/v4l2.c           | 637 +++++++++++++++++++++++++++++++++++
 include/camera/camera.h | 238 +++++++++++++
 meson.build             |  20 +-
 meson_options.txt       |   3 +
 qapi/camera.json        | 101 ++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 qemu-options.hx         |  13 +
 softmmu/vl.c            |   4 +
 16 files changed, 2331 insertions(+), 1 deletion(-)
 create mode 100644 camera/builtin.c
 create mode 100644 camera/camera-int.h
 create mode 100644 camera/camera.c
 create mode 100644 camera/meson.build
 create mode 100644 camera/trace-events
 create mode 100644 camera/trace.h
 create mode 100644 camera/v4l2.c
 create mode 100644 include/camera/camera.h
 create mode 100644 qapi/camera.json

-- 
2.25.1


