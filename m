Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7016B6AB401
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyC-0003a1-NI; Sun, 05 Mar 2023 19:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxi-0002tJ-Th
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:25 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxd-0007LW-Gu
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:19 -0500
Received: by mail-pf1-x443.google.com with SMTP id ce7so4705010pfb.9
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRk/sBxN2Mp2s8bNHbXNN808lPIF/0x6nftZ88U8yTc=;
 b=uO8ibFgL4t4e9TAQzMmU2/vmpRcbOUBJHsyc8VXuWVWPXE39axETqBskORb1vqS5Hn
 F/N1fNO25Cmmggcdrz+lowPOTNOELLZZSvZM5I0AG5Izpo6unl5POtjPqHG9mbFx5H8w
 c7r93SRlsRPq/dNnntMVor39aMBsIInV1fxUz1rKcYvYaB2cl6qwALf66qfKU+LXZUAt
 36pPwJymYsMu95C/V+kmIRFvxt3wdoTiWhyvQioZAei05i+6azg35TOeydpkZmbHwgiD
 7bf50qsKwnYXWD5IKRZaAcX0jz3cqYpJi7ySJPYqM4bknuncRmtDUsJ8Bx6SUeJIJbI4
 N7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRk/sBxN2Mp2s8bNHbXNN808lPIF/0x6nftZ88U8yTc=;
 b=Hn3fUb0NYGQo0AM+IQtn/rsU1ujsup+OuzZDz7Ab/YzuUBu0F5bDANEP/EyAicXqOd
 0auPO/W9ueyFaPlVqqVyWU8Ay2qQ7r5Viv0VZa3cn6tWW7EYECEnQDHlaoSSE9aOxcun
 C+aFIQLjCBdDLqc+klxZIqbqKRg5aILH4B2ufto2ES9FOeTCVQkYUV48KNX25/9IZ9/v
 ZTFDql4wkJfGKV45asq1ZLkK0Q910qycOKV6DnOsAEUqhqfE9KS6NbJRlu8/PaOl3dXd
 6dsUXDAA56aaVbpXRONbrMWjKjZkuBlHwjsbvxXKmrnT9HeKYqtebuhyEqCXp9JJ6jqP
 kwNg==
X-Gm-Message-State: AO0yUKUJ4f491vp46nBE+7vRoY5thLaqP6wdUmtVZM1OOHtX7OPQAzEx
 W7Xqo5ZMOzkEZ5XcIzH6t/7rk5V7jWsFp5u2UIVvcsiu
X-Google-Smtp-Source: AK7set+CDutz7V8fMAvtqzoWRmWccqPUWZZmJlH3de+3R1BeMjN5xfs0iHxsN5Bsg4pN1u7GBzs4fg==
X-Received: by 2002:a62:1d0b:0:b0:5df:421d:1962 with SMTP id
 d11-20020a621d0b000000b005df421d1962mr6592487pfd.2.1678063455939; 
 Sun, 05 Mar 2023 16:44:15 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 67/84] tracing: remove transform.py
Date: Sun,  5 Mar 2023 16:39:37 -0800
Message-Id: <20230306003954.1866998-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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

This file, and a couple of uses, got left behind when the
tcg stuff was removed from tracetool.

Fixes: 126d4123c50a ("tracing: excise the tcg related from tracetool")
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                    |   1 -
 scripts/tracetool/__init__.py  |  23 -----
 scripts/tracetool/transform.py | 168 ---------------------------------
 3 files changed, 192 deletions(-)
 delete mode 100644 scripts/tracetool/transform.py

diff --git a/meson.build b/meson.build
index e533d6c95b..6bcab8bf0d 100644
--- a/meson.build
+++ b/meson.build
@@ -2861,7 +2861,6 @@ tracetool_depends = files(
   'scripts/tracetool/format/log_stap.py',
   'scripts/tracetool/format/stap.py',
   'scripts/tracetool/__init__.py',
-  'scripts/tracetool/transform.py',
   'scripts/tracetool/vcpu.py'
 )
 
diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 5393c7fc5c..33cf85e2b0 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -18,7 +18,6 @@
 
 import tracetool.format
 import tracetool.backend
-import tracetool.transform
 
 
 def error_write(*lines):
@@ -190,18 +189,6 @@ def casted(self):
         """List of argument names casted to their type."""
         return ["(%s)%s" % (type_, name) for type_, name in self._args]
 
-    def transform(self, *trans):
-        """Return a new Arguments instance with transformed types.
-
-        The types in the resulting Arguments instance are transformed according
-        to tracetool.transform.transform_type.
-        """
-        res = []
-        for type_, name in self._args:
-            res.append((tracetool.transform.transform_type(type_, *trans),
-                        name))
-        return Arguments(res)
-
 
 class Event(object):
     """Event description.
@@ -358,16 +345,6 @@ def api(self, fmt=None):
             fmt = Event.QEMU_TRACE
         return fmt % {"name": self.name, "NAME": self.name.upper()}
 
-    def transform(self, *trans):
-        """Return a new Event with transformed Arguments."""
-        return Event(self.name,
-                     list(self.properties),
-                     self.fmt,
-                     self.args.transform(*trans),
-                     self.lineno,
-                     self.filename,
-                     self)
-
 
 def read_events(fobj, fname):
     """Generate the output for the given (format, backends) pair.
diff --git a/scripts/tracetool/transform.py b/scripts/tracetool/transform.py
deleted file mode 100644
index ea8b27799d..0000000000
--- a/scripts/tracetool/transform.py
+++ /dev/null
@@ -1,168 +0,0 @@
-# -*- coding: utf-8 -*-
-
-"""
-Type-transformation rules.
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
-def _transform_type(type_, trans):
-    if isinstance(trans, str):
-        return trans
-    elif isinstance(trans, dict):
-        if type_ in trans:
-            return _transform_type(type_, trans[type_])
-        elif None in trans:
-            return _transform_type(type_, trans[None])
-        else:
-            return type_
-    elif callable(trans):
-        return trans(type_)
-    else:
-        raise ValueError("Invalid type transformation rule: %s" % trans)
-
-
-def transform_type(type_, *trans):
-    """Return a new type transformed according to the given rules.
-
-    Applies each of the transformation rules in trans in order.
-
-    If an element of trans is a string, return it.
-
-    If an element of trans is a function, call it with type_ as its only
-    argument.
-
-    If an element of trans is a dict, search type_ in its keys. If type_ is
-    a key, use the value as a transformation rule for type_. Otherwise, if
-    None is a key use the value as a transformation rule for type_.
-
-    Otherwise, return type_.
-
-    Parameters
-    ----------
-    type_ : str
-        Type to transform.
-    trans : list of function or dict
-        Type transformation rules.
-    """
-    if len(trans) == 0:
-        raise ValueError
-    res = type_
-    for t in trans:
-        res = _transform_type(res, t)
-    return res
-
-
-##################################################
-# tcg -> host
-
-def _tcg_2_host(type_):
-    if type_ == "TCGv":
-        # force a fixed-size type (target-independent)
-        return "uint64_t"
-    else:
-        return type_
-
-TCG_2_HOST = {
-    "TCGv_i32": "uint32_t",
-    "TCGv_i64": "uint64_t",
-    "TCGv_ptr": "void *",
-    None: _tcg_2_host,
-    }
-
-
-##################################################
-# host -> host compatible with tcg sizes
-
-HOST_2_TCG_COMPAT = {
-    "uint8_t": "uint32_t",
-    "uint16_t": "uint32_t",
-    }
-
-
-##################################################
-# host/tcg -> tcg
-
-def _host_2_tcg(type_):
-    if type_.startswith("TCGv"):
-        return type_
-    raise ValueError("Don't know how to translate '%s' into a TCG type\n" % type_)
-
-HOST_2_TCG = {
-    "uint32_t": "TCGv_i32",
-    "uint64_t": "TCGv_i64",
-    "void *"  : "TCGv_ptr",
-    "CPUArchState *": "TCGv_env",
-    None: _host_2_tcg,
-    }
-
-
-##################################################
-# tcg -> tcg helper definition
-
-def _tcg_2_helper_def(type_):
-    if type_ == "TCGv":
-        return "target_ulong"
-    else:
-        return type_
-
-TCG_2_TCG_HELPER_DEF = {
-    "TCGv_i32": "uint32_t",
-    "TCGv_i64": "uint64_t",
-    "TCGv_ptr": "void *",
-    None: _tcg_2_helper_def,
-    }
-
-
-##################################################
-# tcg -> tcg helper declaration
-
-def _tcg_2_tcg_helper_decl_error(type_):
-    raise ValueError("Don't know how to translate type '%s' into a TCG helper declaration type\n" % type_)
-
-TCG_2_TCG_HELPER_DECL = {
-    "TCGv"    : "tl",
-    "TCGv_ptr": "ptr",
-    "TCGv_i32": "i32",
-    "TCGv_i64": "i64",
-    "TCGv_env": "env",
-    None: _tcg_2_tcg_helper_decl_error,
-    }
-
-
-##################################################
-# host/tcg -> tcg temporal constant allocation
-
-def _host_2_tcg_tmp_new(type_):
-    if type_.startswith("TCGv"):
-        return "tcg_temp_new_nop"
-    raise ValueError("Don't know how to translate type '%s' into a TCG temporal allocation" % type_)
-
-HOST_2_TCG_TMP_NEW = {
-    "uint32_t": "tcg_const_i32",
-    "uint64_t": "tcg_const_i64",
-    "void *"  : "tcg_const_ptr",
-    None: _host_2_tcg_tmp_new,
-    }
-
-
-##################################################
-# host/tcg -> tcg temporal constant deallocation
-
-def _host_2_tcg_tmp_free(type_):
-    if type_.startswith("TCGv"):
-        return "tcg_temp_free_nop"
-    raise ValueError("Don't know how to translate type '%s' into a TCG temporal deallocation" % type_)
-
-HOST_2_TCG_TMP_FREE = {
-    "uint32_t": "tcg_temp_free_i32",
-    "uint64_t": "tcg_temp_free_i64",
-    "void *"  : "tcg_temp_free_ptr",
-    None: _host_2_tcg_tmp_free,
-    }
-- 
2.34.1


