Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CE06F43BF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:24:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptov9-00043X-NQ; Tue, 02 May 2023 08:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oS-UJ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:34 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouY-0003Dr-Ul
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:22 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so22281615e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029712; x=1685621712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ijXKWKHhny3h877w5LeEg4sVNPT7JiYssZSYC6serVo=;
 b=EQFPl9p8WK2fD8EyQ4QmqtuLs0uARWodtXfOF4Wut1qvdfvdG2rX4VGL0V8UpOP/wZ
 8FDRFANiywcjgdoAHQjoOcLf7fNqPD/grqySPq3o8bBcfkGTJ/o5UJjGsVEccl1jyFDn
 wKniWCoSW8n9YKn1p+hbvhfYM4JxxCaUEei0PJNqiFS5169AWKiEJBlJP6DluqNuW7dr
 s1VZxxpLEeBSmc5Y3Q3ojum0gV6ISqAtXE6YfjdGwVxYFKlqlli12BsDQGYTyUYMoIT+
 UwQjMYAoCrS03SDsrd8D639uNRhm/XHmKsfM5FXNy+FgqjB20iOhqKmPCVE+ikhrD8y6
 wBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029712; x=1685621712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ijXKWKHhny3h877w5LeEg4sVNPT7JiYssZSYC6serVo=;
 b=ZWzSj9wLrPesnk1J1jSIJBpFLqo9xDvvUmMF0Nt9auRC0GJEStz1SEQtVsuOwA+qxc
 XQi3JpDxV6PvVj287XnLPiQwn6/Y4Ql/7G/QO9PIUgYotC6aW0LihuSOpt/6wtvI63Ba
 D/oLoMpWugDoC5Il2kSH/XShohtTN+Q36sR7iyMvIdOYoFShG/cfBMM8ly+MxDSs442c
 UBqIrUTUrV8Ls5ED2bVuTNtHORFpp//nHWqHMi3PCcQWgYpXZQAJvEAtAmCvTqbJpdNu
 eivQIqdhvdM/F9Tzlr9WbJoQDTqPA3DkLsdnJh0sz4rjDWY7AyBSYPazDeM+LC8ydLOv
 Phew==
X-Gm-Message-State: AC+VfDy9suo6m14xMmCWC6JgEIJK9YqUKHwuMNg5DwHIVANMOq6s7Tkr
 RZSyMhflwJPdRg40bmveb5qTSyiElgbh+Cox0OY=
X-Google-Smtp-Source: ACHHUZ69uWxFj61STuTgdlUP6Wi1Ep0zGXdXgFZHtMpAPkVB4RVxhF9BAeWA556dKa4uGrJdoRtGwg==
X-Received: by 2002:a1c:6a17:0:b0:3f1:7c38:719b with SMTP id
 f23-20020a1c6a17000000b003f17c38719bmr13205308wmc.3.1683029712449; 
 Tue, 02 May 2023 05:15:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/35] qmp: Deprecate 'singlestep' member of StatusInfo
Date: Tue,  2 May 2023 13:14:49 +0100
Message-Id: <20230502121459.2422303-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20230417164041.684562-11-peter.maydell@linaro.org
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
index 09ea1202927..db3cf52c62a 100644
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


