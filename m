Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4383A7075
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:31:39 +0200 (CEST)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lstFC-0004VO-Sx
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lstCa-0001jc-Mh
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:28:56 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lstCY-0005jJ-SO
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:28:56 -0400
Received: by mail-pj1-x1032.google.com with SMTP id k5so10445123pjj.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bw6uvOLKEisckETLGn7QqEllExX+W/+p46wjCLwcazI=;
 b=rtpzrMifexv0tMpt5pch/6fVS/DcGS2EWxZHa7G19DKK0CqrrcXawJkLvelUGYqCEb
 VO/UhL1nD49Z98z3QM8nbs/wo0qpuQIvkYk4qa858sd1/KvUWLJbDufjgeFRleIqGj77
 mJg04i2YSxOpJDb0ulrDEzq+5Y9QESU65kIk/JfN3VcxC+AbRNwpE1yOZ5jP8YgtvFfA
 rCAF6oom0WWD94anc4saGYj/jvJV4M5f5SsVGGJgpc9VoTNIiPzc7E9A1VRO/PyqZay+
 oZlKFhye3ggDjRs0WyuWdus2qX7eioJhTfSyzGq7d2ir+9PdnD4JtPoBY6/7QVqgCDkZ
 jK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bw6uvOLKEisckETLGn7QqEllExX+W/+p46wjCLwcazI=;
 b=t4S5MtVNm24bMnOrVJSdmrO4HKsT/7vi7gi5LbPsrEFJXdZh7CRO67DiaIVe2lthRx
 N9oO1ojChhP2NUYXgt0eiGe0NPnjepX5CCi8N5nHQo2AxgYeUJXt9B56yDDL9qwWclVE
 Oj1IZhGPYaRYkqGfPaci6eYKNTk1SVF/NE4MqaZNFh3JWm15E/TXCCf2AJoSByxJsM17
 GroZgtpu3Sb/eQ7MPlwk/26BHqrP+tIyF+bcJSa/4dCrw0fzCS24EypgukPEgZR+UFgX
 fJJ1fNYXb3pA5Yu9JPUvjwOycAlmCn+KPMwsbT0XI9EieLCb8PEfmCeLlnwl4/RLXmxz
 JxgQ==
X-Gm-Message-State: AOAM532EA3pIx0xn9ER9YC8cWpCmmCssAv0y6ZBl01+bRx+koi4Rwr53
 7OzYG8/WPMBAoczIpAj1og0aAw==
X-Google-Smtp-Source: ABdhPJwj9kf2AVzM4hqMHVQAgxeekTkKkrizxPofiox1MRJdFeIAGUinymW/y+3biGRY54cL3EeJWA==
X-Received: by 2002:a17:90b:1285:: with SMTP id
 fw5mr963928pjb.35.1623702533603; 
 Mon, 14 Jun 2021 13:28:53 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id fs10sm289029pjb.31.2021.06.14.13.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:28:52 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH v2 4/5] docs: Add documentation for vhost based RNG
 implementation
Date: Mon, 14 Jun 2021 14:28:41 -0600
Message-Id: <20210614202842.581640-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614202842.581640-1-mathieu.poirier@linaro.org>
References: <20210614202842.581640-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-devel@nongnu.org, stratos-dev@op-lists.linaro.org
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


