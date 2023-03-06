Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780286ABDE0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:10:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8jp-0002z0-Bc; Mon, 06 Mar 2023 06:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pZ8jl-0002x3-Uy
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:10:37 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pZ8jj-0004LY-PL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:10:37 -0500
Received: by mail-pl1-x630.google.com with SMTP id p20so9821899plw.13
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678101034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lzt81DQlpQsWvSvVQpEytEsQpJe9zI8mvbr2m91fVZY=;
 b=KkADiyumUMwnMwSZagTAmvDoqMmGCkviqQ5W3Ewa+3JcciWXtrok3LZkOQpgRqaWN8
 iIraLBPdCrkwyfvvxTfFWrMD07MuMxJtjKz1BdtSHYJjAASZUi+LNNR8UHlYM772k1Xl
 RTyo+wE8i4TbHbQVvuW9wwSRWTQWvdQMKB9oMvQVba+RPf18ATxFLtn/K0H5L8izMZsH
 solmldOc/veuoYtEIY84nID8jNwgdBcj7JlCmIRn5YFhnyLHrCIGn6zU+UaMDrgOBhYW
 xkluFP3sUtX1hyDtiqhgUKPV7wQ+Quody+t3OAoNMG6vOR8/9RjgiU9E/Jm1Wcrwgk04
 52VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678101034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lzt81DQlpQsWvSvVQpEytEsQpJe9zI8mvbr2m91fVZY=;
 b=V8Cn+EyrYBB5t0mN++s4lKmexnWHLys/dyg/H1rEiCy1OqcEBN6NerT2Z7BXGGaOXM
 gnmJC91doiLFu0430y76TuZdWgCeXUgCVYMXZd135NROsn9epZ9tTwUeDRCt/DuKfOWY
 B4oIFVqX3nhxXhOdpIh5kaCdwrSSz7bQSykKgpO65CGfBu2dbo6Z0DQu7YptSm1bokLm
 3YkcCeLqfP0Qa6OJUBm9I0cdFNSN2huBuPv2oAluTF9gFNCasnPvugcJlZRV06rreew4
 42fSfhhvbiZgv0R+Q51uftmUCBfD1sUGiNhT/IAGZzW9wqb6DL5Yy3IoO6cKC+3YZpV7
 uW2Q==
X-Gm-Message-State: AO0yUKUZGqWThcGF2OPzmCcVTXMJutLVEHxHjESgpg/EWGE38HNzy7NG
 UZAjPrElXSdkDthiD9wj2efnR6RCoxkiKbnKdK4=
X-Google-Smtp-Source: AK7set9qaeII3L0WNlhjuyVZJGmfT1j/fje0bHum91rfnikT0gw6CnQ7u6ibmUuIG2PFTWVIbPGn4A==
X-Received: by 2002:a17:903:18e:b0:19a:75b8:f4ff with SMTP id
 z14-20020a170903018e00b0019a75b8f4ffmr13424289plg.35.1678101033802; 
 Mon, 06 Mar 2023 03:10:33 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 ke13-20020a170903340d00b0019ea9e5815bsm4457935plb.45.2023.03.06.03.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 03:10:33 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH V2] docs: vhost-user: Add Xen specific memory mapping support
Date: Mon,  6 Mar 2023 16:40:24 +0530
Message-Id: <7c3c120bcf2cf023e873800fd3f55239dd302e38.1678100850.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x630.google.com
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
both these cases, the back-end needs to call mmap() and ioctl(), and
need to pass extra information via the ioctl(), like the Xen domain-id
of the guest whose memory we are trying to map.

Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
the back-end know about the additional memory mapping requirements.
When this feature is negotiated, the front-end can send the
'VHOST_USER_SET_XEN_MMAP' message type to provide the additional
information to the back-end.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2:
- Make the custom mmap feature Xen specific, instead of being generic.
- Clearly define which memory regions are impacted by this change.
- Allow VHOST_USER_SET_XEN_MMAP to be called multiple times.
- Additional Bit(2) property in flags.

 docs/interop/vhost-user.rst | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3f18ab424eb0..8be5f5eae941 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -258,6 +258,24 @@ Inflight description
 
 :queue size: a 16-bit size of virtqueues
 
+Xen mmap description
+^^^^^^^^^^^^^^^^^^^^
+
++-------+-------+
+| flags | domid |
++-------+-------+
+
+:flags: 64-bit bit field
+
+- Bit 0 is set for Xen foreign memory memory mapping.
+- Bit 1 is set for Xen grant memory memory mapping.
+- Bit 2 is set if the back-end can directly map additional memory (like
+  descriptor buffers or indirect descriptors, which aren't part of already
+  shared memory regions) without the need of front-end sending an additional
+  memory region first.
+
+:domid: a 64-bit Xen hypervisor specific domain id.
+
 C structure
 -----------
 
@@ -867,6 +885,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_XEN_MMAP             17
 
 Front-end message types
 -----------------------
@@ -1422,6 +1441,23 @@ Front-end message types
   query the back-end for its device status as defined in the Virtio
   specification.
 
+``VHOST_USER_SET_XEN_MMAP``
+  :id: 41
+  :equivalent ioctl: N/A
+  :request payload: Xen mmap description
+  :reply payload: N/A
+
+  When the ``VHOST_USER_PROTOCOL_F_XEN_MMAP`` protocol feature has been
+  successfully negotiated, this message is submitted by the front-end to set the
+  Xen hypervisor specific memory mapping configurations at the back-end.  These
+  configurations should be used to mmap memory regions, virtqueues, descriptors
+  and descriptor buffers. The front-end must send this message before any
+  memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_TABLE`` or
+  ``VHOST_USER_ADD_MEM_REG`` message types. The front-end can send this message
+  multiple times, if different mmap configurations are required for different
+  memory regions, where the most recent ``VHOST_USER_SET_XEN_MMAP`` must be used
+  by the back-end to map any newly shared memory regions.
+
 
 Back-end message types
 ----------------------
-- 
2.31.1.272.g89b43f80a514


