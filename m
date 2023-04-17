Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E928A6E4E7B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:41:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRuT-0002Mk-0n; Mon, 17 Apr 2023 12:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuQ-0002M4-Ng
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:54 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuM-0001NZ-1e
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f0a80b683fso17869095e9.3
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681749648; x=1684341648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4B6l8UECJ90CPUbM7Klpck4y118EN0eBNxzC139Z/3k=;
 b=If2UGM2x/eZvTfTZMAiUpd0v+VkHctVYZhUMg4zEVeAqPMUpYWyER+VwwkgBiiJMwz
 roEGzJQXJsk2557IWJB2rp/jjzEx1ekQ+3+v0j97iKazGB1NprvhDWGVMLW/wwJZNKTF
 ZNE0WPyvzeGiBtEsorI57XJXymXeautCtZ+tY1lt2oicw4WNz1HGEWsb/JmkBrTspbXN
 YZVM5//IRSif/H/hl2cIeAD/Dw+acDrggMlxjSDvAUyj/YF4S2vfe4fZVDDpxBoKZEpG
 S+/SvqRlnQlZFbCVB/Gc8AiJ6wpyubknirdROkYxzVlb325I9PkIQK+iXkyuS/ffQiH0
 k2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681749648; x=1684341648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4B6l8UECJ90CPUbM7Klpck4y118EN0eBNxzC139Z/3k=;
 b=fmfQUZh4Rv2q+7kgxkiM3jI52BWA5IV+Eyn8di3lHukYV0eGqAPi+49SeANeu7ygMO
 84Js+TYV//EboZB/Alh0MP/sTF3oMO07qiM/6v4Q3TEPa8COZhbl58K9Y9bzj/mUEhyL
 3tY0xqbCvA9RTr0MDMk6D4fRZaBL8TM6/axVmOF2AVyTiXea55qvbOiCe3JYUxT/dTbk
 scCuwhgLfaMkKan8APKSt4CVVdlXP/TdMkivFckA8pDigiTKMa3CLJeCk7KM25g6oE9E
 TVZ4Fx0VKxO/71VodS08zbORoXHXj8/6vCsvISSi4s4Y0H8G1mo+izMldLFbDydpsrsW
 BEJA==
X-Gm-Message-State: AAQBX9eDwzgo73Goug0DIiZlRsgnETycSptD4Wk+299kdAR9FmXKyz1l
 jkn/1divLdORctIlywSmSKohskYF31t056ShpOc=
X-Google-Smtp-Source: AKy350Y37xr+bENfG9mOJznO1VgNCOjSvPo81D7ySH5JUZ1yLVtZYYOQPqeNic6Qh4lbPgIEhCt7OQ==
X-Received: by 2002:adf:f4cb:0:b0:2f5:aadb:4642 with SMTP id
 h11-20020adff4cb000000b002f5aadb4642mr6412555wrp.41.1681749648681; 
 Mon, 17 Apr 2023 09:40:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm2595103wrv.58.2023.04.17.09.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:40:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
Date: Mon, 17 Apr 2023 17:40:41 +0100
Message-Id: <20230417164041.684562-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417164041.684562-1-peter.maydell@linaro.org>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The 'singlestep' member of StatusInfo has never done what the QMP
documentation claims it does.  What it actually reports is whether
TCG is working in "one guest instruction per translation block" mode.

We no longer need this field for the HMP 'info status' command, as
we've moved that information to 'info jit'.  It seems unlikely that
anybody is monitoring the state of this obscure TCG setting via QMP,
especially since QMP provides no means for changing the setting.  So
simply deprecate the field, without providing any replacement.

Until we do eventually delete the member, correct the misstatements
in the QAPI documentation about it.

If we do find that there are users for this, then the most likely way
we would provide replacement access to the information would be to
put the accelerator QOM object at a well-known path such as
/machine/accel, which could then be used with the existing qom-set
and qom-get commands.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
For v3: because we're only deprecating the existing member,
not trying to provide a replacement with a new name, we don't
need to update the iotests that use the command. (We will when
we eventually drop the deprecated member.)
---
 docs/about/deprecated.rst | 14 ++++++++++++++
 qapi/run-state.json       | 14 +++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 6f5e689aa45..d5eda0f566c 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -199,6 +199,20 @@ accepted incorrect commands will return an error. Users should make sure that
 all arguments passed to ``device_add`` are consistent with the documented
 property types.
 
+``StatusInfo`` member ``singlestep`` (since 8.1)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``singlestep`` member of the ``StatusInfo`` returned from the
+``query-status`` command is deprecated. This member has a confusing
+name and it never did what the documentation claimed or what its name
+suggests. We do not believe that anybody is actually using the
+information provided in this member.
+
+The information it reports is whether the TCG JIT is in "one
+instruction per translated block" mode (which can be set on the
+command line or via the HMP, but not via QMP). The information remains
+available via the HMP 'info jit' command.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 9d34afa39e0..daf03a6fe9c 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -104,16 +104,24 @@
 #
 # @running: true if all VCPUs are runnable, false if not runnable
 #
-# @singlestep: true if VCPUs are in single-step mode
+# @singlestep: true if using TCG with one guest instruction
+#              per translation block
 #
 # @status: the virtual machine @RunState
 #
+# Features:
+# @deprecated: Member 'singlestep' is deprecated (with no replacement).
+#
 # Since: 0.14
 #
-# Notes: @singlestep is enabled through the GDB stub
+# Notes: @singlestep is enabled on the command line with
+#        '-accel tcg,one-insn-per-tb=on', or with the HMP
+#        'one-insn-per-tb' command.
 ##
 { 'struct': 'StatusInfo',
-  'data': {'running': 'bool', 'singlestep': 'bool', 'status': 'RunState'} }
+  'data': {'running': 'bool',
+           'singlestep': { 'type': 'bool', 'features': [ 'deprecated' ]},
+           'status': 'RunState'} }
 
 ##
 # @query-status:
-- 
2.34.1


