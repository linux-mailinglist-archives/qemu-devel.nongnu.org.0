Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC4397AFF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 22:08:49 +0200 (CEST)
Received: from localhost ([::1]:60516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loAgy-0000B2-LV
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 16:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1loAbg-0002Re-Ti
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:03:20 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1loAbc-0002x5-TS
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:03:20 -0400
Received: by mail-pf1-x42e.google.com with SMTP id k15so360335pfp.6
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 13:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bw6uvOLKEisckETLGn7QqEllExX+W/+p46wjCLwcazI=;
 b=Zn4t39gQjDWPIh9hs4r3J4Igjv/8VduTKdW0SvyAD31aQjYr9nNhOdx7WdLup8ObT8
 cOAvzax7p3PaTVTiGoj+RzgPmBK3tdgKwL+HnDkyuFENcY48adRnE7jGwWSYJ3ufTqRD
 GH4dgE6JdOSSuDiF/ykNqTuiMOctw7NnzIj7MWPBPpdUwqVVFslkZpbuNHPUsOQFhOak
 Aullbw6hDLfz/ens9AWZAxOjfLRPYzCP43L9ZSD3lvX7C7HzFkfuYZPuQktvWWmcg316
 pqARbDEEK6pXzj9SkNTcof2gw3zfgzyAyvwzHsJyfqusyuwmWqfn5y2KdGUIGWCmyfJS
 eAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bw6uvOLKEisckETLGn7QqEllExX+W/+p46wjCLwcazI=;
 b=pB4PhsoUQftHr3Sf0GKaivjjhP9aGI0xiFLXvKsokyHy8qDcVVtroTr7dHhy2li7v7
 wZaEos9+hW/CjEGmbBLa/kb3VJlQS3RLKrqtotXmVfGtMf/uBquPvltUvXcRxaf0sH0W
 VRe8QNTSOL6ljzVw0NPdlj8uTxdm9MrnJWzjHYWXIOSRMePfycexJvo4/StyfP0efgZm
 eNlyIKHITUHMUm1YDf4BhIKwwXfr/8jHQvGp9DhRkrgyuBpxRPzt+zc8eyqvU3cdvj1B
 5whZu2rRaCQQc95QngZfjuxXSFaaN6icq081qZU2B4fOmMBCpjc1giDj8WoHkQ+kA/e2
 3WJA==
X-Gm-Message-State: AOAM530+/1/+5GeW6aBSTSiMBTljioehJiCy53iYOboL1mry6hVw3EuI
 eQj9r44wlO9kbNCz0cMixTG8gw==
X-Google-Smtp-Source: ABdhPJxmHWEHDPOVaZ/BiGHUlG65MvDjMANP/XwmRwLFdFULf1pbcr3vIQryNdAQTGg2UvR1PyNx4A==
X-Received: by 2002:a63:1613:: with SMTP id w19mr29419436pgl.379.1622577795398; 
 Tue, 01 Jun 2021 13:03:15 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 23sm15486229pgv.90.2021.06.01.13.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:03:13 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH 4/5] docs: Add documentation for vhost based RNG implementation
Date: Tue,  1 Jun 2021 14:03:04 -0600
Message-Id: <20210601200305.1772391-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601200305.1772391-1-mathieu.poirier@linaro.org>
References: <20210601200305.1772391-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: viresh.kumar@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add description and example for the vhost-user based RNG implementation.
Tailored on Viresh Kumar's vhost-user-i2c documentation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 docs/tools/vhost-user-rng.rst | 74 +++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 docs/tools/vhost-user-rng.rst

diff --git a/docs/tools/vhost-user-rng.rst b/docs/tools/vhost-user-rng.rst
new file mode 100644
index 000000000000..7f69d7bb3c58
--- /dev/null
+++ b/docs/tools/vhost-user-rng.rst
@@ -0,0 +1,74 @@
+QEMU vhost-user-rng - RNG emulation backend
+===========================================
+
+Synopsis
+--------
+
+**vhost-user-rng** [*OPTIONS*]
+
+Description
+-----------
+
+This program is a vhost-user backend that emulates a VirtIO random number
+generator (RNG).  It uses the host's random number generator pool,
+/dev/urandom by default but configurable at will, to satisfy requests from
+guests.
+
+This program is designed to work with QEMU's ``-device
+vhost-user-rng-pci`` but should work with any virtual machine monitor
+(VMM) that supports vhost-user. See the Examples section below.
+
+Options
+-------
+
+.. program:: vhost-user-rng
+
+.. option:: -h, --help
+
+  Print help.
+
+.. option:: -v, --verbose
+
+   Increase verbosity of output
+
+.. option:: -s, --socket-path=PATH
+
+  Listen on vhost-user UNIX domain socket at PATH. Incompatible with --fd.
+
+.. option:: -f, --fd=FDNUM
+
+  Accept connections from vhost-user UNIX domain socket file descriptor FDNUM.
+  The file descriptor must already be listening for connections.
+  Incompatible with --socket-path.
+
+.. option:: -p, --period
+
+  Rate, in milliseconds, at which the RNG hardware can generate random data.
+  Used in conjunction with the --max-bytes option.
+
+.. option:: -m, --max-bytes
+
+  In conjuction with the --period parameter, provides the maximum number of byte
+  per milliseconds a RNG device can generate.
+
+Examples
+--------
+
+The daemon should be started first:
+
+::
+
+  host# vhost-user-rng --socket-path=rng.sock --period=1000 --max-bytes=4096
+
+The QEMU invocation needs to create a chardev socket the device can
+use to communicate as well as share the guests memory over a memfd.
+
+::
+
+  host# qemu-system								\
+      -chardev socket,path=$(PATH)/rng.sock,id=rng0				\
+      -device vhost-user-rng-pci,chardev=rng0					\
+      -m 4096 									\
+      -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on	\
+      -numa node,memdev=mem							\
+      ...
-- 
2.25.1


