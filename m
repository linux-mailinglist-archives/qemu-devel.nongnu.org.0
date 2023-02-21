Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA7D69DD50
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:52:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPIz-0007SU-Hs; Tue, 21 Feb 2023 04:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pUPIp-0007El-LS
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:51:16 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pUPIi-0006uu-94
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:51:09 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 na9-20020a17090b4c0900b0023058bbd7b2so4114920pjb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wNQkeraNsuw6hFISAboGasHi5jkq9Qw1lk2C7Y7QJNM=;
 b=Sp7J+0CTBva8aEj2O9RPa7/fe/vPPgO/x/0R35WMCIEt+K5/CuaIDpJV5pICjBM3i/
 7+YqI+uYKU28wB0J6rXEsxFspuixkueTtJC1QuHP618WlV+JcjMm7ok4BlQCOStrfpNM
 2yQVECM/gqB9R4OI372Uh0Ob8q/K1DnWn1311m8zKpRNAwuAVkwMdZXA366q40fR2nt8
 +kg02BiIzImPF1W3uJpLDlBacsl39TblpS4TdxtPbW5oVShvfF9GEySZukT2XuIVm+KG
 ppaGdIC0ARz6+iYjOoPQ3rYf6JzbmxSu+M/7nVry3YTqF5A1nug85vTy/hUml6ZvFuwm
 u/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wNQkeraNsuw6hFISAboGasHi5jkq9Qw1lk2C7Y7QJNM=;
 b=lu2nT0It7Y/adwmYrm2lFugry/beotgAuWhsICbAi/qwbJECgOTxoRmUeu4RmvhJPz
 HT0CtOu5Bb4QFo5sxx2+GTs9dVeJT8zpCkss4+7RIcx2pF3zoZsEHPml0Axt7EHz+IJV
 XOPVYtdkoYp6CBoLCZyrvkH///CiU+nLSFPf/zAHd8WP8mAsJNKpLJZMCGEF9VzWbXrR
 F0jDU0PcfK/2umvJTaLJ54OZ0krBwJ1F034mD0+n7ECDD/Q/yQg7OCq1enmSlM3WDY9h
 ZmR4oY2R17b1lBERl5sIcljqnHTeVM6xu2rjPMZtgOq5ZMAnSwFIxhxx50P8rcxrt6eM
 I8ug==
X-Gm-Message-State: AO0yUKUv9C6+gNDd89sCTgK/L8O/LUWi2LsX0G0OX/YSKzq+vAp3Fhib
 nj043hldlPjmyrx0Hymmx5lhqfjRL/BiBI8m
X-Google-Smtp-Source: AK7set/pSiw2S4PkO5YI37ejuDhSsbMg0prresPSYVtL1WK1e+9RTLesegPL247GZtqxm3Qr6U8vqw==
X-Received: by 2002:a17:902:ee91:b0:19a:b302:5158 with SMTP id
 a17-20020a170902ee9100b0019ab3025158mr4053751pld.29.1676973062371; 
 Tue, 21 Feb 2023 01:51:02 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902c21100b00199190b00efsm9493493pll.97.2023.02.21.01.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:51:01 -0800 (PST)
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
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [RFC QEMU] docs: vhost-user: Add custom memory mapping support
Date: Tue, 21 Feb 2023 15:20:41 +0530
Message-Id: <d9beee5f7b4a4acdb5f5eff8af55bed50b33d722.1676971686.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102c.google.com
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

The current model of memory mapping at the back-end works fine with
Qemu, where a standard call to mmap() for the respective file
descriptor, passed from front-end, is generally all we need to do before
the front-end can start accessing the guest memory.

There are other complex cases though, where we need more information at
the backend and need to do more than just an mmap() call. For example,
Xen, a type-1 hypervisor, currently supports memory mapping via two
different methods, foreign-mapping (via /dev/privcmd) and grant-dev (via
/dev/gntdev). In both these cases, the back-end needs to call mmap()
followed by an ioctl() (or vice-versa), and need to pass extra
information via the ioctl(), like the Xen domain-id of the guest whose
memory we are trying to map.

Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_CUSTOM_MMAP', which
lets the back-end know about the additional memory mapping requirements.
When this feature is negotiated, the front-end can send the
'VHOST_USER_CUSTOM_MMAP' message type to provide the additional
information to the back-end.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/interop/vhost-user.rst | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3f18ab424eb0..f2b1d705593a 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -258,6 +258,23 @@ Inflight description
 
 :queue size: a 16-bit size of virtqueues
 
+Custom mmap description
+^^^^^^^^^^^^^^^^^^^^^^^
+
++-------+-------+
+| flags | value |
++-------+-------+
+
+:flags: 64-bit bit field
+
+- Bit 0 is Xen foreign memory access flag - needs Xen foreign memory mapping.
+- Bit 1 is Xen grant memory access flag - needs Xen grant memory mapping.
+
+:value: a 64-bit hypervisor specific value.
+
+- For Xen foreign or grant memory access, this is set with guest's xen domain
+  id.
+
 C structure
 -----------
 
@@ -867,6 +884,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_CUSTOM_MMAP          17
 
 Front-end message types
 -----------------------
@@ -1422,6 +1440,20 @@ Front-end message types
   query the back-end for its device status as defined in the Virtio
   specification.
 
+``VHOST_USER_CUSTOM_MMAP``
+  :id: 41
+  :equivalent ioctl: N/A
+  :request payload: Custom mmap description
+  :reply payload: N/A
+
+  When the ``VHOST_USER_PROTOCOL_F_CUSTOM_MMAP`` protocol feature has been
+  successfully negotiated, this message is submitted by the front-end to
+  notify the back-end of the special memory mapping requirements, that the
+  back-end needs to take care of, while mapping any memory regions sent
+  over by the front-end. The front-end must send this message before
+  any memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_TABLE``
+  or ``VHOST_USER_ADD_MEM_REG`` message types.
+
 
 Back-end message types
 ----------------------
-- 
2.31.1.272.g89b43f80a514


