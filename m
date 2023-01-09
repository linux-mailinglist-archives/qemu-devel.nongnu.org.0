Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CD066346E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF12G-0004gt-ES; Mon, 09 Jan 2023 17:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF12A-0004cP-AH
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:54:26 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF128-0007i5-JL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:54:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id g10so7513350wmo.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qSermBP5/xXhGWhvny4/gfNcgaMNo5optvZ6TnwS3lw=;
 b=ZubaV9u/NuFYbN6RwQ2kYcGCYlv99oUhzK//4N6LEFAPMrH09Y9IK0NfecBDdleHnn
 G0ZpHL4vkW0TRTjBD1ag4TbPPphoEK2LRIMjZpnXUmKzvJkViUUAUBZMj4IAqoS7Z5dO
 NsK9lfjMjOsBxVhcpZW3XlBLg5OHOM2lxe6ULTUISw8KU9deCu0qYK5dcz8eCbRRY3Mn
 eKLOY28yMKJqBDOkQsiqTEZGZamZyYtFkWUBEaIXp/0Kf7KRYmGEcWHfyF8weGgPbs8W
 zdbYMRMFgl93g2vJxf18uXJXnToXZ6KHOhSX2y6QaGpO1FJdn491MkVz3Cc2cD2cmddW
 3X/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qSermBP5/xXhGWhvny4/gfNcgaMNo5optvZ6TnwS3lw=;
 b=KEcEaak+0iNPv5s7gqXRUgpVluhJMjKMWRAPJJQveeiNpzs325v1XT6WxVkdkQjbMl
 jTrksqQwxCIKcexbiRpEzzqTadE05zdLUGo6TpZ1VdX4yGM/MAsQX3UvwJBYFj8Rg4SX
 67KusrCa72pqsrJoGM4plbTW4LdGZ2YLP4itBes1HO6j/6FeXx6j+b2I0s3XizK5F18L
 BPCYnd+AjWQih3GAql79p4gvp72Ocd/w4KChMdKh0YsNLjtfQK33Zx1NuCZFFU0U6sx0
 t8h5fKqfxWLted/qzI5wOUTb7lumXbjleunmfknSI9UyZUzdjI5uDkr647y4hUmSXnuh
 iHcg==
X-Gm-Message-State: AFqh2kpY5zUBdCuL5vSV/5q1xC/9YZv6aNLtx0e4giq2RCfkD0PCfNEJ
 SpYnHwbRRs37dc+NzENoFyFJfQ9fJPZjRZVT
X-Google-Smtp-Source: AMrXdXtwTvn2vj4y3wga6jFeklOeoQhLi/VsrnKWzZAAUOJBcF0cL5TyXhci6QfKH92FDY+ZvkB5Yw==
X-Received: by 2002:a05:600c:1c21:b0:3d2:2faf:e54b with SMTP id
 j33-20020a05600c1c2100b003d22fafe54bmr47383950wms.6.1673304862158; 
 Mon, 09 Jan 2023 14:54:22 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a0560001b0800b002423edd7e50sm9553651wrz.32.2023.01.09.14.54.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 14:54:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [RFC PATCH 0/4] qom: Introduce object_class_property_deprecate()
Date: Mon,  9 Jan 2023 23:54:15 +0100
Message-Id: <20230109225419.22621-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

There will always be a need to deprecate things. Here I'm
tackling the QOM (class) properties, since they can be set
from some CLI options (-object -device -global ...).

As an experiment, we add object_class_property_deprecate()
to register a class property as deprecated (since some version),
then we deprecate the TYPE_PFLASH_CFI02 'width' property, and
finally as a bonus we emit a warning when the deprecation period
is over, as a reminder. (For that we introduce few 'versions'
helpers).

Output example:

$ qemu-system-arm -M musicpal,accel=qtest -S \
  -drive if=pflash,driver=null-co,read-zeroes=on,size=8M \
  -global driver=cfi.pflash02,property=width,value=2
qemu-system-arm: warning: Property 'cfi.pflash02.width' is deprecated (renamed as 'cfi.pflash02.device-width').

$ qemu-system-arm -M musicpal,accel=qtest -S \
  -drive if=pflash,driver=null-co,read-zeroes=on,size=8M \
  -global driver=cfi.pflash02,property=device-width,value=2
qemu-system-arm: warning: Property 'cfi.pflash02.width' has been deprecated in release v8.0 and can be removed.

Thought?

Regards,

Phil.

[earlier inspiration: https://lore.kernel.org/qemu-devel/Y7wlnqwU+/auE0Jj@redhat.com/]

Philippe Mathieu-Daudé (4):
  qom: Introduce object_class_property_deprecate()
  hw/block: Rename TYPE_PFLASH_CFI02 'width' property as 'device-width'
  util: Introduce helpers to compare QEMU versions
  qom: Warn when deprecated class property can be removed

 hw/block/pflash_cfi02.c     |  8 +++++++-
 include/qemu/qemu-version.h | 36 ++++++++++++++++++++++++++++++++++++
 include/qom/object.h        | 17 +++++++++++++++++
 qom/object.c                | 30 ++++++++++++++++++++++++++++++
 util/meson.build            |  1 +
 util/qemu-version.c         | 37 +++++++++++++++++++++++++++++++++++++
 6 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 include/qemu/qemu-version.h
 create mode 100644 util/qemu-version.c

-- 
2.38.1


