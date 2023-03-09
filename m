Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5BA6B1EC2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:52:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBzZ-0007qk-Is; Thu, 09 Mar 2023 03:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1paBzY-0007qV-18
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:16 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1paBzW-00026u-Cq
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:15 -0500
Received: by mail-pl1-x635.google.com with SMTP id u5so1249950plq.7
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678351873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETLRpO4UaRJv+Jq2cQ1jDXzLWWERHBPOjdPoPBs2HQY=;
 b=kaY7yb4BgtrBRVTJaGL5YIn9l8IoTa4lyVgMiGE+LSI7rvLuSg3awOMLMnJLOKt+lH
 W6d6qR1BZdYIAWI86ipKF6SAvHJt12FDfZXzQex6uuHUqOU7GSMF4kJO+V+fxbDxpS9X
 1dJ3CqLWQIk1MgmIX8taEexVVxGkBm/1PAv3hF+VF4Dlx80Hf3qHflMdy/POb2dqLAQn
 i69WPePj9IV5csX+pp+JjQj9I7BQIWVsygdYSUfiVRefrtYWhnYRgXKGdJIOd+6SyfKz
 C27SGThUJCnUOCTvUfZydDQw+hvdAW4FM7Ke9ONCK8itnaWY98VCIDjqH3mAa3AaK+0A
 026g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETLRpO4UaRJv+Jq2cQ1jDXzLWWERHBPOjdPoPBs2HQY=;
 b=O0nW07SuWnXlSiRd4aIbbx+ZJEIbFKTtlbZmLkwoWbSVFlKt6qm6W1z0c+KBcvfaOH
 F+szb962L3gN9RmS09SS5FDXaE4VN2kikLLKVNRKCAmhw34HOhQKKT1UMHMNFIJBO6uF
 C/kVI6eR3WANAeK/lhBNoP9h1HZHL/yKbb/WsE4g9BtIEFCV5zThJTOgJLzoWN723HP7
 7cg1du9mZPNOYCJsA3GE/QErqMMTFmCIbQtEiTOYJ0M8/9G1RSXJ8ZqnWTrxYtoDevVy
 3pReDgZysMm9/VFRV1Va5ZANxmQ9Mc1JWmWcC+sbGL5ytulO/DTStx+/VsFqPQJ/dR1P
 PbDA==
X-Gm-Message-State: AO0yUKUYhJFYpNK9YYbs5WztXyUTgm/Ozk/gO+Hc9h/0X68Pi9Il9f3J
 mfSfQt4rUZMRdji7ZBhAan4Ek+PewyI+bJEFxgM=
X-Google-Smtp-Source: AK7set/6Djb1zMP9YhPTkWppkZDJ0L3CO0duyd+NyeHjm4Zil4YeTAqUaIBzL/6AzT6fjqaHkZW0kA==
X-Received: by 2002:a17:902:c14c:b0:19d:74c:78e4 with SMTP id
 12-20020a170902c14c00b0019d074c78e4mr18866811plj.55.1678351872801; 
 Thu, 09 Mar 2023 00:51:12 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 kt16-20020a170903089000b0019a7385079esm11058153plb.123.2023.03.09.00.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:51:12 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH V3 2/2] docs: vhost-user: Add Xen specific memory mapping
 support
Date: Thu,  9 Mar 2023 14:21:01 +0530
Message-Id: <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1678351495.git.viresh.kumar@linaro.org>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x635.google.com
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

The current model of memory mapping at the back-end works fine where a
standard call to mmap() (for the respective file descriptor) is enough
before the front-end can start accessing the guest memory.

There are other complex cases though where the back-end needs more
information and simple mmap() isn't enough. For example Xen, a type-1
hypervisor, currently supports memory mapping via two different methods,
foreign-mapping (via /dev/privcmd) and grant-dev (via /dev/gntdev). In
both these cases, the back-end needs to call mmap() and ioctl(), with
extra information like the Xen domain-id of the guest whose memory we
are trying to map.

Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
the back-end know about the additional memory mapping requirements.
When this feature is negotiated, the front-end will send the additional
information within the memory regions themselves.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/interop/vhost-user.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 1720d681264d..5a070adbc1aa 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -145,6 +145,26 @@ Memory region description
 
 :mmap offset: 64-bit offset where region starts in the mapped memory
 
+When the ``VHOST_USER_PROTOCOL_F_XEN_MMAP`` protocol feature has been
+successfully negotiated, the memory region description contains two extra
+fields at the end.
+
++---------------+------+--------------+-------------+----------------+-------+
+| guest address | size | user address | mmap offset | xen mmap flags | domid |
++---------------+------+--------------+-------------+----------------+-------+
+
+:xen mmap flags: 32-bit bit field
+
+- Bit 0 is set for Xen foreign memory mapping.
+- Bit 1 is set for Xen grant memory mapping.
+- Bit 8 is set if the memory region can not be mapped in advance, and memory
+  areas within this region must be mapped / unmapped only when required by the
+  back-end. The back-end shouldn't try to map the entire region at once, as the
+  front-end may not allow it. The back-end should rather map only the required
+  amount of memory at once and unmap it after it is used.
+
+:domid: a 32-bit Xen hypervisor specific domain id.
+
 Single memory region description
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -864,6 +884,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_XEN_MMAP             17
 
 Front-end message types
 -----------------------
-- 
2.31.1.272.g89b43f80a514


