Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E649668C45D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP54I-0000iV-Kj; Mon, 06 Feb 2023 12:14:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54D-0000hV-8U
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:10 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54A-0001QK-0Q
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:08 -0500
Received: by mail-wr1-x42f.google.com with SMTP id j25so7531247wrc.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 09:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yj1DEvs3X4/BfrWA87uKCI4tHJLA6vEN8CkLaerxWYk=;
 b=uN+LE8QHV5k6EjvWghp3O50yXscrEQvPXcZ8Fsli588A9iK5W1MA94UNcmwNu4V1ie
 gaLG1tmL21+2XNc3ddWALysIV1aSHtoMzGQHWpCrknHujmpR6ConTNewh4cEmfxPEri8
 Kgn1pbmblo4eRZAoay/LnoM/NLjuD+gsjtlt8DJIbHhkajB08sbLfgxvyY0QsQYjzprm
 frLXb8pFJe/awtM+pR8HI3E+F/1/1oxqdyj+yaj2JQBlD5VTg9X9G+m5Fgyb8CE48+ja
 5UOACTTL6/0/8nvd3A+8kZJaG8WOzzegxuiPRcLYovKy98kdW/fur0eOmeGzMBR4+2/I
 eY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yj1DEvs3X4/BfrWA87uKCI4tHJLA6vEN8CkLaerxWYk=;
 b=T2mR2ZISi3VkFvTMyRHeeWQOqfzPtIqcPD9NG+yn5rZgqJoKiMkZ/TUtu8qwVW8exM
 onIX0enDwjwW8CWD7lf71arEoXY0xetsedKnkznesKd/3CBbuuveh11lvijx2Fv+wIzE
 sy9R5p0T4PH2a/tom62bs3qFsp4QBLiQod9mm3ofLRHtMislBD7CqIGRoXwKFDYUQAOy
 ZlP9IVkI85h2EPLj/8XBSveS6phFe929ctWoT2e+MsJoS7+Wt1OXwsN68cEYMMZfuxWo
 h6hVO8iYEKlabzrAPsK2sSEuFJKzXmVKeB5oeF1HTNCb26NdfL+LMbx5jbudhGkMMkrW
 3qiA==
X-Gm-Message-State: AO0yUKWMUg5PiJm1N3zjn5mvv6Y18oI1PbUyvZwFxVI7Vfath0a4ISaD
 vD9A9/PQ+QqyqSqLNjoLztEI4hkQbmdGkqpQ
X-Google-Smtp-Source: AK7set8k2L09YhD93rJ4oLfkMD/1E2e22Wq1zozf2d7Q105CggNdkIbNNAGZO4ObRWosLS7dgpGqKw==
X-Received: by 2002:a5d:6089:0:b0:2c3:ea86:863b with SMTP id
 w9-20020a5d6089000000b002c3ea86863bmr3150743wrt.29.1675703642588; 
 Mon, 06 Feb 2023 09:14:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600015ca00b002bfd137ecddsm9529841wry.11.2023.02.06.09.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:14:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC PATCH 0/5] Deprecate/rename singlestep command line option
Date: Mon,  6 Feb 2023 17:13:54 +0000
Message-Id: <20230206171359.1327671-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The command line option '-singlestep' and its HMP equivalent
the 'singlestep' command are very confusingly named, because
they have nothing to do with single-stepping the guest (either
via the gdb stub or by emulation of guest CPU architectural
debug facilities). What they actually do is put TCG into a
mode where it puts only one guest instruction into each
translation block. This is useful for some circumstances
such as when you want the -d debug logging to be easier to
interpret, or if you have a finicky guest binary that wants
to see interrupts delivered at something other than the end
of a basic block.

The confusing name is made worse by the fact that our
documentation for these is so minimal as to be useless
for telling users what they really do.

This series:
 * renames the 'singlestep' global variable to 'one_insn_per_tb'
 * Adds new '-one-insn-per-tb' command line options and a
   HMP 'one-insn-per-tb' command
 * Documents the '-singlestep' options and 'singlestep'
   HMP command as deprecated synonyms for the new ones

It does not do anything about the other place where we surface
'singlestep', which is in the QMP StatusInfo object returned by the
'query-status' command.  This is incorrectly documented as "true if
VCPUs are in single-step mode" and "singlestep is enabled through
the GDB stub", because what it's actually returning is the
one-insn-per-tb state.

Things I didn't bother with because this is only an RFC but
will do if it turns into a non-RFC patchset:
 * test the bsd-user changes :-)
 * add text to deprecated.rst

So, questions:

(1) is this worth bothering with at all? We could just
    name our global variable etc better, and document what
    -singlestep actually does, and not bother with the new
    names for the options/commands.
(2) if we do do it, do we retain the old name indefinitely,
    or actively put it on the deprecate-and-drop list?
(3) what should we do about the HMP StatusInfo object?
    I'm not sure how we handle compatibility for HMP.

thanks
-- PMM


Peter Maydell (5):
  Rename the singlestep global variable to one_insn_per_tb
  linux-user: Add '-one-insn-per-tb' option equivalent to '-singlestep'
  bsd-user: Add '-one-insn-per-tb' option equivalent to '-singlestep'
  softmmu: Add '-one-insn-per-tb' option equivalent to '-singlestep'
  hmp: Add 'one-insn-per-tb' command equivalent to 'singlestep'

 docs/user/main.rst          | 14 ++++++++++++--
 include/exec/cpu-common.h   |  2 +-
 include/monitor/hmp.h       |  2 +-
 accel/tcg/cpu-exec.c        |  4 ++--
 bsd-user/main.c             |  9 +++++----
 linux-user/main.c           | 13 ++++++++-----
 softmmu/globals.c           |  2 +-
 softmmu/runstate-hmp-cmds.c |  6 +++---
 softmmu/runstate.c          |  2 +-
 softmmu/vl.c                |  3 ++-
 tests/qtest/test-hmp.c      |  1 +
 hmp-commands.hx             | 25 +++++++++++++++++++++----
 qemu-options.hx             | 14 ++++++++++++--
 tcg/tci/README              |  2 +-
 14 files changed, 71 insertions(+), 28 deletions(-)

-- 
2.34.1


