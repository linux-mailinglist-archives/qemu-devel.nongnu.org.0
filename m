Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F84AA1A7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:14:32 +0100 (CET)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5uZ-0000ET-3l
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:14:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WN-0008J8-LX
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:32 -0500
Received: from [2a00:1450:4864:20::42f] (port=34603
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WA-00089F-Ga
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:21 -0500
Received: by mail-wr1-x42f.google.com with SMTP id f17so13491478wrx.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/rWurmul+sbv2Gj26JHhst6/kFendjAqbxz9LYeY1U=;
 b=OHi/BahQ0zXJI80Y3eAZNvTsXtmQFitckKf/WJZJs7a7Twg/M3gpmXUd2GX2rXcVpY
 bno7MRtZ+FV+BVnQjBdni2is0Omzese/JiJSjmqmt9Eeza5W4L2EkaTfr1NKhRREvCMZ
 zknMwhoP8YMmxX8kdqsDOh9b6mUtk4YrNEWnvdEL/7Ca9lQAKQ0wv/2SDSDRkzG9qXQV
 LGTgJZhyoaxWz44unkAEbcVt8YyBrv268sQDbpkKSn1OqlQ4KLJuz+PFYlGqoH+b6xgR
 ZWvFdklTbrOtSj7Z+DBsQM8dKs5KBFFous6Oj116MzheZmxvIbEi9KkEtzYiKHBUDs7p
 wkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/rWurmul+sbv2Gj26JHhst6/kFendjAqbxz9LYeY1U=;
 b=ahg87C6znqNH+lVvh2cjLa/2TaZTmGoengs4IVct7hchVDDimJtW1iIgf7t6BBtpnX
 C6qcOfIbLRviW5ItKsF6bVxTZKgWyTZMWAevqsWjgKr+kO9y377DyZWtpYCxRnKx8LQe
 eUzAKAVMmgQ5h7XwHayEZFiVO3HFJ1FClPUjd1Z31DnfKlz4mj8V2yhRc0lJoP9+woAs
 sjheB3cj2zliICa/vahUWtCAQhRoDxdLZzqmn1r2JNGaOTXjK9be1YHPwR+n8PTrc/10
 9Iuq/eA+OFkBjfY9N+BFCjlOr9vW8B1Lg4mJHw/CXSaW4fftUYjaRvtqm4M2ZGiUtlA4
 uWbw==
X-Gm-Message-State: AOAM533I+AJjfuCW26B+82HfVCh6GuDxd8JCsrUS3usvt4zWsjuswfCX
 LHb12g/P5VS+Jzg6dYsQZUYUDg==
X-Google-Smtp-Source: ABdhPJwR6EgSbzZ/PgRjqKfNYZn3cuquStZ+ivbDzu9H9PbN616HH4zhBnpdgszg6Rb+Qr0P8Znijg==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr530073wrv.169.1644007757077; 
 Fri, 04 Feb 2022 12:49:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o12sm3403319wry.115.2022.02.04.12.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:49:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F8F01FFCB;
 Fri,  4 Feb 2022 20:43:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 20/26] tracing: excise the tcg related from tracetool
Date: Fri,  4 Feb 2022 20:43:29 +0000
Message-Id: <20220204204335.1689602-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, Luis Vilanova <vilanova@imperial.ac.uk>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we have no TCG trace events and no longer handle them in the code
we can remove the handling from the tracetool to generate them. vcpu
tracing is still available although the existing syscall event is an
exercise in redundancy (plugins and -strace can also get the
information).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220124201608.604599-17-alex.bennee@linaro.org>
---
 meson.build                                   |  4 -
 include/exec/helper-gen.h                     |  2 -
 scripts/tracetool/__init__.py                 | 41 +--------
 scripts/tracetool/format/tcg_h.py             | 83 -------------------
 scripts/tracetool/format/tcg_helper_c.py      | 79 ------------------
 scripts/tracetool/format/tcg_helper_h.py      | 48 -----------
 .../tracetool/format/tcg_helper_wrapper_h.py  | 70 ----------------
 scripts/tracetool/vcpu.py                     | 14 +---
 trace/meson.build                             | 13 ---
 9 files changed, 4 insertions(+), 350 deletions(-)
 delete mode 100644 scripts/tracetool/format/tcg_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_c.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_wrapper_h.py

diff --git a/meson.build b/meson.build
index 82db1e7e74..ae5f7eec6e 100644
--- a/meson.build
+++ b/meson.build
@@ -2357,19 +2357,15 @@ tracetool_depends = files(
   'scripts/tracetool/backend/simple.py',
   'scripts/tracetool/backend/syslog.py',
   'scripts/tracetool/backend/ust.py',
-  'scripts/tracetool/format/tcg_h.py',
   'scripts/tracetool/format/ust_events_c.py',
   'scripts/tracetool/format/ust_events_h.py',
   'scripts/tracetool/format/__init__.py',
   'scripts/tracetool/format/d.py',
-  'scripts/tracetool/format/tcg_helper_c.py',
   'scripts/tracetool/format/simpletrace_stap.py',
   'scripts/tracetool/format/c.py',
   'scripts/tracetool/format/h.py',
-  'scripts/tracetool/format/tcg_helper_h.py',
   'scripts/tracetool/format/log_stap.py',
   'scripts/tracetool/format/stap.py',
-  'scripts/tracetool/format/tcg_helper_wrapper_h.py',
   'scripts/tracetool/__init__.py',
   'scripts/tracetool/transform.py',
   'scripts/tracetool/vcpu.py'
diff --git a/include/exec/helper-gen.h b/include/exec/helper-gen.h
index 1c2e7a8ed3..7b6ca975ef 100644
--- a/include/exec/helper-gen.h
+++ b/include/exec/helper-gen.h
@@ -79,8 +79,6 @@ static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
 }
 
 #include "helper.h"
-#include "trace/generated-helpers.h"
-#include "trace/generated-helpers-wrappers.h"
 #include "accel/tcg/tcg-runtime.h"
 #include "accel/tcg/plugin-helpers.h"
 
diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 5bc94d95cf..5393c7fc5c 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -87,8 +87,6 @@ def out(*lines, **kwargs):
     "ssize_t",
     "uintptr_t",
     "ptrdiff_t",
-    # Magic substitution is done by tracetool
-    "TCGv",
 ]
 
 def validate_type(name):
@@ -232,7 +230,7 @@ class Event(object):
                       "(?:(?:(?P<fmt_trans>\".+),)?\s*(?P<fmt>\".+))?"
                       "\s*")
 
-    _VALID_PROPS = set(["disable", "tcg", "tcg-trans", "tcg-exec", "vcpu"])
+    _VALID_PROPS = set(["disable", "vcpu"])
 
     def __init__(self, name, props, fmt, args, lineno, filename, orig=None,
                  event_trans=None, event_exec=None):
@@ -321,15 +319,6 @@ def build(line_str, lineno, filename):
             fmt = [fmt_trans, fmt]
         args = Arguments.build(groups["args"])
 
-        if "tcg-trans" in props:
-            raise ValueError("Invalid property 'tcg-trans'")
-        if "tcg-exec" in props:
-            raise ValueError("Invalid property 'tcg-exec'")
-        if "tcg" not in props and not isinstance(fmt, str):
-            raise ValueError("Only events with 'tcg' property can have two format strings")
-        if "tcg" in props and isinstance(fmt, str):
-            raise ValueError("Events with 'tcg' property must have two format strings")
-
         event = Event(name, props, fmt, args, lineno, filename)
 
         # add implicit arguments when using the 'vcpu' property
@@ -409,33 +398,7 @@ def read_events(fobj, fname):
             e.args = (arg0,) + e.args[1:]
             raise
 
-        # transform TCG-enabled events
-        if "tcg" not in event.properties:
-            events.append(event)
-        else:
-            event_trans = event.copy()
-            event_trans.name += "_trans"
-            event_trans.properties += ["tcg-trans"]
-            event_trans.fmt = event.fmt[0]
-            # ignore TCG arguments
-            args_trans = []
-            for atrans, aorig in zip(
-                    event_trans.transform(tracetool.transform.TCG_2_HOST).args,
-                    event.args):
-                if atrans == aorig:
-                    args_trans.append(atrans)
-            event_trans.args = Arguments(args_trans)
-
-            event_exec = event.copy()
-            event_exec.name += "_exec"
-            event_exec.properties += ["tcg-exec"]
-            event_exec.fmt = event.fmt[1]
-            event_exec.args = event_exec.args.transform(tracetool.transform.TCG_2_HOST)
-
-            new_event = [event_trans, event_exec]
-            event.event_trans, event.event_exec = new_event
-
-            events.extend(new_event)
+        events.append(event)
 
     return events
 
diff --git a/scripts/tracetool/format/tcg_h.py b/scripts/tracetool/format/tcg_h.py
deleted file mode 100644
index 4d84440aff..0000000000
--- a/scripts/tracetool/format/tcg_h.py
+++ /dev/null
@@ -1,83 +0,0 @@
-# -*- coding: utf-8 -*-
-
-"""
-Generate .h file for TCG code generation.
-"""
-
-__author__     = "Lluís Vilanova <vilanova@ac.upc.edu>"
-__copyright__  = "Copyright 2012-2017, Lluís Vilanova <vilanova@ac.upc.edu>"
-__license__    = "GPL version 2 or (at your option) any later version"
-
-__maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@redhat.com"
-
-
-from tracetool import out, Arguments
-import tracetool.vcpu
-
-
-def vcpu_transform_args(args):
-    assert len(args) == 1
-    return Arguments([
-        args,
-        # NOTE: this name must be kept in sync with the one in "tcg_h"
-        # NOTE: Current helper code uses TCGv_env (CPUArchState*)
-        ("TCGv_env", "__tcg_" + args.names()[0]),
-    ])
-
-
-def generate(events, backend, group):
-    if group == "root":
-        header = "trace/trace-root.h"
-    else:
-        header = "trace.h"
-
-    out('/* This file is autogenerated by tracetool, do not edit. */',
-        '/* You must include this file after the inclusion of helper.h */',
-        '',
-        '#ifndef TRACE_%s_GENERATED_TCG_TRACERS_H' % group.upper(),
-        '#define TRACE_%s_GENERATED_TCG_TRACERS_H' % group.upper(),
-        '',
-        '#include "exec/helper-proto.h"',
-        '#include "%s"' % header,
-        '',
-        )
-
-    for e in events:
-        # just keep one of them
-        if "tcg-exec" not in e.properties:
-            continue
-
-        out('static inline void %(name_tcg)s(%(args)s)',
-            '{',
-            name_tcg=e.original.api(e.QEMU_TRACE_TCG),
-            args=tracetool.vcpu.transform_args("tcg_h", e.original))
-
-        if "disable" not in e.properties:
-            args_trans = e.original.event_trans.args
-            args_exec = tracetool.vcpu.transform_args(
-                "tcg_helper_c", e.original.event_exec, "wrapper")
-            if "vcpu" in e.properties:
-                trace_cpu = e.args.names()[0]
-                cond = "trace_event_get_vcpu_state(%(cpu)s,"\
-                       " TRACE_%(id)s)"\
-                       % dict(
-                           cpu=trace_cpu,
-                           id=e.original.event_exec.name.upper())
-            else:
-                cond = "true"
-
-            out('    %(name_trans)s(%(argnames_trans)s);',
-                '    if (%(cond)s) {',
-                '        gen_helper_%(name_exec)s(%(argnames_exec)s);',
-                '    }',
-                name_trans=e.original.event_trans.api(e.QEMU_TRACE),
-                name_exec=e.original.event_exec.api(e.QEMU_TRACE),
-                argnames_trans=", ".join(args_trans.names()),
-                argnames_exec=", ".join(args_exec.names()),
-                cond=cond)
-
-        out('}')
-
-    out('',
-        '#endif /* TRACE_%s_GENERATED_TCG_TRACERS_H */' % group.upper())
diff --git a/scripts/tracetool/format/tcg_helper_c.py b/scripts/tracetool/format/tcg_helper_c.py
deleted file mode 100644
index 72576e67d1..0000000000
--- a/scripts/tracetool/format/tcg_helper_c.py
+++ /dev/null
@@ -1,79 +0,0 @@
-# -*- coding: utf-8 -*-
-
-"""
-Generate trace/generated-helpers.c.
-"""
-
-__author__     = "Lluís Vilanova <vilanova@ac.upc.edu>"
-__copyright__  = "Copyright 2012-2017, Lluís Vilanova <vilanova@ac.upc.edu>"
-__license__    = "GPL version 2 or (at your option) any later version"
-
-__maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@redhat.com"
-
-
-from tracetool import Arguments, out
-from tracetool.transform import *
-import tracetool.vcpu
-
-
-def vcpu_transform_args(args, mode):
-    assert len(args) == 1
-    # NOTE: this name must be kept in sync with the one in "tcg_h"
-    args = Arguments([(args.types()[0], "__tcg_" + args.names()[0])])
-    if mode == "code":
-        return Arguments([
-            # Does cast from helper requirements to tracing types
-            ("CPUState *", "env_cpu(%s)" % args.names()[0]),
-        ])
-    else:
-        args = Arguments([
-            # NOTE: Current helper code uses TCGv_env (CPUArchState*)
-            ("CPUArchState *", args.names()[0]),
-        ])
-        if mode == "header":
-            return args
-        elif mode == "wrapper":
-            return args.transform(HOST_2_TCG)
-        else:
-            assert False
-
-
-def generate(events, backend, group):
-    if group == "root":
-        header = "trace/trace-root.h"
-    else:
-        header = "trace.h"
-
-    events = [e for e in events
-              if "disable" not in e.properties]
-
-    out('/* This file is autogenerated by tracetool, do not edit. */',
-        '',
-        '#include "qemu/osdep.h"',
-        '#include "cpu.h"',
-        '#include "exec/helper-proto.h"',
-        '#include "%s"' % header,
-        '',
-        )
-
-    for e in events:
-        if "tcg-exec" not in e.properties:
-            continue
-
-        e_args_api = tracetool.vcpu.transform_args(
-            "tcg_helper_c", e.original, "header").transform(
-                HOST_2_TCG_COMPAT, TCG_2_TCG_HELPER_DEF)
-        e_args_call = tracetool.vcpu.transform_args(
-            "tcg_helper_c", e, "code")
-
-        out('void %(name_tcg)s(%(args_api)s)',
-            '{',
-            # NOTE: the check was already performed at TCG-generation time
-            '    %(name)s(%(args_call)s);',
-            '}',
-            name_tcg="helper_%s_proxy" % e.api(),
-            name=e.api(e.QEMU_TRACE_NOCHECK),
-            args_api=e_args_api,
-            args_call=", ".join(e_args_call.casted()),
-            )
diff --git a/scripts/tracetool/format/tcg_helper_h.py b/scripts/tracetool/format/tcg_helper_h.py
deleted file mode 100644
index 08554fbc85..0000000000
--- a/scripts/tracetool/format/tcg_helper_h.py
+++ /dev/null
@@ -1,48 +0,0 @@
-# -*- coding: utf-8 -*-
-
-"""
-Generate trace/generated-helpers.h.
-"""
-
-__author__     = "Lluís Vilanova <vilanova@ac.upc.edu>"
-__copyright__  = "Copyright 2012-2016, Lluís Vilanova <vilanova@ac.upc.edu>"
-__license__    = "GPL version 2 or (at your option) any later version"
-
-__maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@redhat.com"
-
-
-from tracetool import out
-from tracetool.transform import *
-import tracetool.vcpu
-
-
-def generate(events, backend, group):
-    events = [e for e in events
-              if "disable" not in e.properties]
-
-    out('/* This file is autogenerated by tracetool, do not edit. */',
-        '',
-        )
-
-    for e in events:
-        if "tcg-exec" not in e.properties:
-            continue
-
-        # TCG helper proxy declaration
-        fmt = "DEF_HELPER_FLAGS_%(argc)d(%(name)s, %(flags)svoid%(types)s)"
-        e_args = tracetool.vcpu.transform_args("tcg_helper_c", e.original, "header")
-        args = e_args.transform(HOST_2_TCG_COMPAT, HOST_2_TCG,
-                                TCG_2_TCG_HELPER_DECL)
-        types = ", ".join(args.types())
-        if types != "":
-            types = ", " + types
-
-        flags = "TCG_CALL_NO_RWG, "
-
-        out(fmt,
-            flags=flags,
-            argc=len(args),
-            name=e.api() + "_proxy",
-            types=types,
-            )
diff --git a/scripts/tracetool/format/tcg_helper_wrapper_h.py b/scripts/tracetool/format/tcg_helper_wrapper_h.py
deleted file mode 100644
index 0c5a9797d1..0000000000
--- a/scripts/tracetool/format/tcg_helper_wrapper_h.py
+++ /dev/null
@@ -1,70 +0,0 @@
-# -*- coding: utf-8 -*-
-
-"""
-Generate trace/generated-helpers-wrappers.h.
-"""
-
-__author__     = "Lluís Vilanova <vilanova@ac.upc.edu>"
-__copyright__  = "Copyright 2012-2016, Lluís Vilanova <vilanova@ac.upc.edu>"
-__license__    = "GPL version 2 or (at your option) any later version"
-
-__maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@redhat.com"
-
-
-from tracetool import out
-from tracetool.transform import *
-import tracetool.vcpu
-
-
-def generate(events, backend, group):
-    events = [e for e in events
-              if "disable" not in e.properties]
-
-    out('/* This file is autogenerated by tracetool, do not edit. */',
-        '',
-        '#define tcg_temp_new_nop(v) (v)',
-        '#define tcg_temp_free_nop(v)',
-        '',
-        )
-
-    for e in events:
-        if "tcg-exec" not in e.properties:
-            continue
-
-        # tracetool.generate always transforms types to host
-        e_args = tracetool.vcpu.transform_args("tcg_helper_c", e.original, "wrapper")
-
-        # mixed-type to TCG helper bridge
-        args_tcg_compat = e_args.transform(HOST_2_TCG_COMPAT)
-
-        code_new = [
-            "%(tcg_type)s __%(name)s = %(tcg_func)s(%(name)s);" %
-            {"tcg_type": transform_type(type_, HOST_2_TCG),
-             "tcg_func": transform_type(type_, HOST_2_TCG_TMP_NEW),
-             "name": name}
-            for (type_, name) in args_tcg_compat
-        ]
-
-        code_free = [
-            "%(tcg_func)s(__%(name)s);" %
-            {"tcg_func": transform_type(type_, HOST_2_TCG_TMP_FREE),
-             "name": name}
-            for (type_, name) in args_tcg_compat
-        ]
-
-        gen_name = "gen_helper_" + e.api()
-
-        out('static inline void %(name)s(%(args)s)',
-            '{',
-            '    %(code_new)s',
-            '    %(proxy_name)s(%(tmp_names)s);',
-            '    %(code_free)s',
-            '}',
-            name=gen_name,
-            args=e_args,
-            proxy_name=gen_name + "_proxy",
-            code_new="\n    ".join(code_new),
-            code_free="\n    ".join(code_free),
-            tmp_names=", ".join(["__%s" % name for _, name in e_args]),
-            )
diff --git a/scripts/tracetool/vcpu.py b/scripts/tracetool/vcpu.py
index 868b4cb04c..d232cb1d06 100644
--- a/scripts/tracetool/vcpu.py
+++ b/scripts/tracetool/vcpu.py
@@ -19,19 +19,9 @@
 def transform_event(event):
     """Transform event to comply with the 'vcpu' property (if present)."""
     if "vcpu" in event.properties:
-        # events with 'tcg-trans' and 'tcg-exec' are auto-generated from
-        # already-patched events
-        assert "tcg-trans" not in event.properties
-        assert "tcg-exec" not in event.properties
-
         event.args = Arguments([("void *", "__cpu"), event.args])
-        if "tcg" in event.properties:
-            fmt = "\"cpu=%p \""
-            event.fmt = [fmt + event.fmt[0],
-                         fmt + event.fmt[1]]
-        else:
-            fmt = "\"cpu=%p \""
-            event.fmt = fmt + event.fmt
+        fmt = "\"cpu=%p \""
+        event.fmt = fmt + event.fmt
     return event
 
 
diff --git a/trace/meson.build b/trace/meson.build
index 29f3bffd5a..26b54714d5 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -66,19 +66,6 @@ trace_events_all = custom_target('trace-events-all',
                                  install: true,
                                  install_dir: qemu_datadir)
 
-foreach d : [
-  ['generated-helpers.c', 'tcg-helper-c'],
-  ['generated-helpers.h', 'tcg-helper-h'],
-  ['generated-helpers-wrappers.h', 'tcg-helper-wrapper-h'],
-]
-  gen = custom_target(d[0],
-                output: d[0],
-                input: meson.project_source_root() / 'trace-events',
-                command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@', '@OUTPUT@' ],
-                depend_files: tracetool_depends)
-  specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
-endforeach
-
 if 'ust' in get_option('trace_backends')
   trace_ust_all_h = custom_target('trace-ust-all.h',
                                   output: 'trace-ust-all.h',
-- 
2.30.2


