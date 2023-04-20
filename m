Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B06E980A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:07:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVpW-0004Vn-3O; Thu, 20 Apr 2023 11:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppVpI-0003OP-0V
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:04:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppVpE-0004zU-Tf
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:03:59 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 eo4-20020a05600c82c400b003f05a99a841so1281183wmb.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682003035; x=1684595035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQYohNT3C43uNg5/LiZIVBTCcgpU3EnfVN9UI96atEY=;
 b=KJovJjaQQ+GlT1Amcrk1B4Zyrzkn6xfDuj7ogsNhkQlxT0e5D14LiWh92VNeB9rxBt
 Zw9ZxtLKhLpigV082ppCUkNXeTbOOlQo0aksZdV0iU2BHI31/h0nXAndLj59vk1TT4ME
 ZZofz1aCqL2Cz4xfxeASSApeDyIxOGEHk/BFBTOg+I98G57srVnG44jykXzhVVGzkcb5
 AEokkUvWj2FSxJf4P9T17d2OWyjHFLgm2X4mokd++BK55y3O2VGVJEQYD38EDEEtOW83
 jxOhTioh0bt3q0MsZBq6oGw+oIVCnWmCTnwn5Grr0gDV7KMmFh4PBUmk3ea6QFitD/hS
 w2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682003035; x=1684595035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQYohNT3C43uNg5/LiZIVBTCcgpU3EnfVN9UI96atEY=;
 b=hM2GaODPf9f/4sQZ45diyUK5aMLDYZRvNbmQSOyWBu2JVOKzfZpgECuBkF/RqbfD8a
 yfilY5CzXh5Oqldc7ce6y9/VvwSIV2MbNqvUSt4hgNIzCXQz2weZ1Gtwp6EuJMlE2rMm
 yE1TBDh6lnyFddPIA+gfYwEfRM3ywq9QSmAEcU9OAqivmPbHJ3tomviahJ5bFW1cCt89
 NWzRLhUv+ELJcD1JcdQ3Vbj8h6csljHyDrh+3gtn+NmDVmKIcXwU3fkOvq0EyrN0vJxe
 MNwJxYDo+e4srx78zl9yt5OgRq6oywtq8pN1eePSAFPL90uYfc61YKEkzb1jBtYLI4oa
 Q+gw==
X-Gm-Message-State: AAQBX9fP5PCVK4Q2ki5+8Wd0ou/Nvd4Atzn8mZvc7uLsAyOswiwcyF5p
 mZ7531kCJNP6+P9hlH1GILF5TcOU7VzM8JWT+Ao=
X-Google-Smtp-Source: AKy350a+jI/wM3/0/HHG9viJGaSfca5PEkKTCYB8WS1ZLeNhoWsx/0WmaHU55WymS03vDrzgBUrMXg==
X-Received: by 2002:a1c:ed05:0:b0:3f1:72f8:6a92 with SMTP id
 l5-20020a1ced05000000b003f172f86a92mr1393900wmh.20.1682003035000; 
 Thu, 20 Apr 2023 08:03:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y32-20020a05600c342000b003f173956a82sm5542458wmp.21.2023.04.20.08.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:03:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 1/2] docs/interop: Convert qmp-spec.txt to rST
Date: Thu, 20 Apr 2023 16:03:51 +0100
Message-Id: <20230420150352.1039408-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420150352.1039408-1-peter.maydell@linaro.org>
References: <20230420150352.1039408-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Convert the qmp-spec.txt document to restructuredText.
Notable points about the conversion:
 * numbers at the start of section headings are removed, to match
   the style of the rest of the manual
 * cross-references to other sections or documents are hyperlinked
 * various formatting tweaks (notably the examples, which need the
   -> and <- prefixed so the QMP code-block lexer will accept them)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/interop/index.rst                      |   1 +
 docs/interop/{qmp-spec.txt => qmp-spec.rst} | 325 +++++++++++---------
 2 files changed, 180 insertions(+), 146 deletions(-)
 rename docs/interop/{qmp-spec.txt => qmp-spec.rst} (57%)

diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index 6351ff9ba6e..ed65395bfb2 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -15,6 +15,7 @@ are useful for making QEMU interoperate with other software.
    dbus-display
    live-block-operations
    pr-helper
+   qmp-spec
    qemu-ga
    qemu-ga-ref
    qemu-qmp-ref
diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.rst
similarity index 57%
rename from docs/interop/qmp-spec.txt
rename to docs/interop/qmp-spec.rst
index b0e8351d5b2..545098c9931 100644
--- a/docs/interop/qmp-spec.txt
+++ b/docs/interop/qmp-spec.rst
@@ -1,24 +1,26 @@
-                      QEMU Machine Protocol Specification
+..
+    Copyright (C) 2009-2016 Red Hat, Inc.
 
-0. About This Document
-======================
+    This work is licensed under the terms of the GNU GPL, version 2 or
+    later. See the COPYING file in the top-level directory.
 
-Copyright (C) 2009-2016 Red Hat, Inc.
 
-This work is licensed under the terms of the GNU GPL, version 2 or
-later. See the COPYING file in the top-level directory.
+===================================
+QEMU Machine Protocol Specification
+===================================
 
-1. Introduction
-===============
-
-This document specifies the QEMU Machine Protocol (QMP), a JSON-based
+The QEMU Machine Protocol (QMP) is a JSON-based
 protocol which is available for applications to operate QEMU at the
 machine-level.  It is also in use by the QEMU Guest Agent (QGA), which
 is available for host applications to interact with the guest
-operating system.
+operating system. This page specifies the general format of
+the protocol; details of the commands and data structures can
+be found in the :doc:`qemu-qmp-ref` and the :doc:`qemu-ga-ref`.
 
-2. Protocol Specification
-=========================
+.. contents::
+
+Protocol Specification
+======================
 
 This section details the protocol format. For the purpose of this
 document, "Server" is either QEMU or the QEMU Guest Agent, and
@@ -30,9 +32,7 @@ following format:
     json-DATA-STRUCTURE-NAME
 
 Where DATA-STRUCTURE-NAME is any valid JSON data structure, as defined
-by the JSON standard:
-
-http://www.ietf.org/rfc/rfc8259.txt
+by the `JSON standard <http://www.ietf.org/rfc/rfc8259.txt>`_.
 
 The server expects its input to be encoded in UTF-8, and sends its
 output encoded in ASCII.
@@ -45,83 +45,89 @@ important unless specifically documented otherwise.  Repeating a key
 within a json-object gives unpredictable results.
 
 Also for convenience, the server will accept an extension of
-'single-quoted' strings in place of the usual "double-quoted"
+``'single-quoted'`` strings in place of the usual ``"double-quoted"``
 json-string, and both input forms of strings understand an additional
-escape sequence of "\'" for a single quote. The server will only use
+escape sequence of ``\'`` for a single quote. The server will only use
 double quoting on output.
 
-2.1 General Definitions
------------------------
-
-2.1.1 All interactions transmitted by the Server are json-objects, always
-      terminating with CRLF
-
-2.1.2 All json-objects members are mandatory when not specified otherwise
-
-2.2 Server Greeting
+General Definitions
 -------------------
 
+All interactions transmitted by the Server are json-objects, always
+terminating with CRLF.
+
+All json-objects members are mandatory when not specified otherwise.
+
+Server Greeting
+---------------
+
 Right when connected the Server will issue a greeting message, which signals
 that the connection has been successfully established and that the Server is
 ready for capabilities negotiation (for more information refer to section
-'4. Capabilities Negotiation').
+`Capabilities Negotiation`_).
 
 The greeting message format is:
 
-{ "QMP": { "version": json-object, "capabilities": json-array } }
+.. code-block::
 
- Where,
+  { "QMP": { "version": json-object, "capabilities": json-array } }
 
-- The "version" member contains the Server's version information (the format
+Where:
+
+- The ``version`` member contains the Server's version information (the format
   is the same of the query-version command)
-- The "capabilities" member specify the availability of features beyond the
+- The ``capabilities`` member specifies the availability of features beyond the
   baseline specification; the order of elements in this array has no
   particular significance.
 
-2.2.1 Capabilities
-------------------
+Capabilities
+------------
 
 Currently supported capabilities are:
 
-- "oob": the QMP server supports "out-of-band" (OOB) command
-  execution, as described in section "2.3.1 Out-of-band execution".
+``oob``
+  the QMP server supports "out-of-band" (OOB) command
+  execution, as described in section `Out-of-band execution`_.
 
-2.3 Issuing Commands
---------------------
+Issuing Commands
+----------------
 
 The format for command execution is:
 
-{ "execute": json-string, "arguments": json-object, "id": json-value }
+.. code-block::
+
+  { "execute": json-string, "arguments": json-object, "id": json-value }
 
 or
 
-{ "exec-oob": json-string, "arguments": json-object, "id": json-value }
+.. code-block::
 
- Where,
+  { "exec-oob": json-string, "arguments": json-object, "id": json-value }
 
-- The "execute" or "exec-oob" member identifies the command to be
+Where:
+
+- The ``execute`` or ``exec-oob`` member identifies the command to be
   executed by the server.  The latter requests out-of-band execution.
-- The "arguments" member is used to pass any arguments required for the
+- The ``arguments`` member is used to pass any arguments required for the
   execution of the command, it is optional when no arguments are
   required. Each command documents what contents will be considered
   valid when handling the json-argument
-- The "id" member is a transaction identification associated with the
+- The ``id`` member is a transaction identification associated with the
   command execution, it is optional and will be part of the response
-  if provided.  The "id" member can be any json-value.  A json-number
+  if provided.  The ``id`` member can be any json-value.  A json-number
   incremented for each successive command works fine.
 
-The actual commands are documented in the QEMU QMP reference manual
-docs/interop/qemu-qmp-ref.{7,html,info,pdf,txt}.
+The actual commands are documented in the :doc:`qemu-qmp-ref`.
 
-2.3.1 Out-of-band execution
----------------------------
+Out-of-band execution
+---------------------
 
 The server normally reads, executes and responds to one command after
 the other.  The client therefore receives command responses in issue
 order.
 
-With out-of-band execution enabled via capability negotiation (section
-4.), the server reads and queues commands as they arrive.  It executes
+With out-of-band execution enabled via `capabilities negotiation`_,
+the server reads and queues commands as they arrive.  It executes
 commands from the queue one after the other.  Commands executed
 out-of-band jump the queue: the command get executed right away,
 possibly overtaking prior in-band commands.  The client may therefore
@@ -129,8 +135,8 @@ receive such a command's response before responses from prior in-band
 commands.
 
 To be able to match responses back to their commands, the client needs
-to pass "id" with out-of-band commands.  Passing it with all commands
-is recommended for clients that accept capability "oob".
+to pass ``id`` with out-of-band commands.  Passing it with all commands
+is recommended for clients that accept capability ``oob``.
 
 If the client sends in-band commands faster than the server can
 execute them, the server will stop reading requests until the request
@@ -140,57 +146,61 @@ To ensure commands to be executed out-of-band get read and executed,
 the client should have at most eight in-band commands in flight.
 
 Only a few commands support out-of-band execution.  The ones that do
-have "allow-oob": true in output of query-qmp-schema.
+have ``"allow-oob": true`` in the output of ``query-qmp-schema``.
 
-2.4 Commands Responses
-----------------------
+Commands Responses
+------------------
 
 There are two possible responses which the Server will issue as the result
 of a command execution: success or error.
 
-As long as the commands were issued with a proper "id" field, then the
-same "id" field will be attached in the corresponding response message
+As long as the commands were issued with a proper ``id`` field, then the
+same ``id`` field will be attached in the corresponding response message
 so that requests and responses can match.  Clients should drop all the
-responses that have an unknown "id" field.
+responses that have an unknown ``id`` field.
 
-2.4.1 success
--------------
+Success
+-------
 
 The format of a success response is:
 
-{ "return": json-value, "id": json-value }
+.. code-block::
 
- Where,
+  { "return": json-value, "id": json-value }
 
-- The "return" member contains the data returned by the command, which
+Where:
+
+- The ``return`` member contains the data returned by the command, which
   is defined on a per-command basis (usually a json-object or
   json-array of json-objects, but sometimes a json-number, json-string,
   or json-array of json-strings); it is an empty json-object if the
   command does not return data
-- The "id" member contains the transaction identification associated
+- The ``id`` member contains the transaction identification associated
   with the command execution if issued by the Client
 
-2.4.2 error
------------
+Error
+-----
 
 The format of an error response is:
 
-{ "error": { "class": json-string, "desc": json-string }, "id": json-value }
+.. code-block::
 
- Where,
+  { "error": { "class": json-string, "desc": json-string }, "id": json-value }
 
-- The "class" member contains the error class name (eg. "GenericError")
-- The "desc" member is a human-readable error message. Clients should
+Where:
+
+- The ``class`` member contains the error class name (eg. ``"GenericError"``)
+- The ``desc`` member is a human-readable error message. Clients should
   not attempt to parse this message.
-- The "id" member contains the transaction identification associated with
+- The ``id`` member contains the transaction identification associated with
   the command execution if issued by the Client
 
-NOTE: Some errors can occur before the Server is able to read the "id" member,
-in these cases the "id" member will not be part of the error response, even
+NOTE: Some errors can occur before the Server is able to read the ``id`` member;
+in these cases the ``id`` member will not be part of the error response, even
 if provided by the client.
 
-2.5 Asynchronous events
------------------------
+Asynchronous events
+-------------------
 
 As a result of state changes, the Server may send messages unilaterally
 to the Client at any time, when not in the middle of any other
@@ -198,44 +208,45 @@ response. They are called "asynchronous events".
 
 The format of asynchronous events is:
 
-{ "event": json-string, "data": json-object,
-  "timestamp": { "seconds": json-number, "microseconds": json-number } }
+.. code-block::
 
- Where,
+  { "event": json-string, "data": json-object,
+    "timestamp": { "seconds": json-number, "microseconds": json-number } }
 
-- The "event" member contains the event's name
-- The "data" member contains event specific data, which is defined in a
-  per-event basis, it is optional
-- The "timestamp" member contains the exact time of when the event
+Where:
+
+- The ``event`` member contains the event's name
+- The ``data`` member contains event specific data, which is defined in a
+  per-event basis. It is optional
+- The ``timestamp`` member contains the exact time of when the event
   occurred in the Server. It is a fixed json-object with time in
   seconds and microseconds relative to the Unix Epoch (1 Jan 1970); if
   there is a failure to retrieve host time, both members of the
   timestamp will be set to -1.
 
-The actual asynchronous events are documented in the QEMU QMP
-reference manual docs/interop/qemu-qmp-ref.{7,html,info,pdf,txt}.
+The actual asynchronous events are documented in the :doc:`qemu-qmp-ref`.
 
 Some events are rate-limited to at most one per second.  If additional
 "similar" events arrive within one second, all but the last one are
 dropped, and the last one is delayed.  "Similar" normally means same
 event type.
 
-2.6 Forcing the JSON parser into known-good state
--------------------------------------------------
+Forcing the JSON parser into known-good state
+---------------------------------------------
 
 Incomplete or invalid input can leave the server's JSON parser in a
 state where it can't parse additional commands.  To get it back into
 known-good state, the client should provoke a lexical error.
 
 The cleanest way to do that is sending an ASCII control character
-other than '\t' (horizontal tab), '\r' (carriage return), or '\n' (new
-line).
+other than ``\t`` (horizontal tab), ``\r`` (carriage return), or
+``\n`` (new line).
 
 Sadly, older versions of QEMU can fail to flag this as an error.  If a
 client needs to deal with them, it should send a 0xFF byte.
 
-2.7 QGA Synchronization
------------------------
+QGA Synchronization
+-------------------
 
 When a client connects to QGA over a transport lacking proper
 connection semantics such as virtio-serial, QGA may have read partial
@@ -243,86 +254,106 @@ input from a previous client.  The client needs to force QGA's parser
 into known-good state using the previous section's technique.
 Moreover, the client may receive output a previous client didn't read.
 To help with skipping that output, QGA provides the
-'guest-sync-delimited' command.  Refer to its documentation for
+``guest-sync-delimited`` command.  Refer to its documentation for
 details.
 
 
-3. QMP Examples
-===============
+QMP Examples
+============
 
 This section provides some examples of real QMP usage, in all of them
-"C" stands for "Client" and "S" stands for "Server".
+``->`` marks text sent by the Client and ``<-`` marks replies by the Server.
 
-3.1 Server greeting
--------------------
+.. admonition:: Example
 
-S: { "QMP": {"version": {"qemu": {"micro": 0, "minor": 0, "major": 3},
-     "package": "v3.0.0"}, "capabilities": ["oob"] } }
+  Server greeting
 
-3.2 Capabilities negotiation
-----------------------------
+  .. code-block:: QMP
 
-C: { "execute": "qmp_capabilities", "arguments": { "enable": ["oob"] } }
-S: { "return": {}}
+    <- { "QMP": {"version": {"qemu": {"micro": 0, "minor": 0, "major": 3},
+         "package": "v3.0.0"}, "capabilities": ["oob"] } }
 
-3.3 Simple 'stop' execution
----------------------------
+.. admonition:: Example
 
-C: { "execute": "stop" }
-S: { "return": {} }
+  Capabilities negotiation
 
-3.4 KVM information
--------------------
+  .. code-block:: QMP
 
-C: { "execute": "query-kvm", "id": "example" }
-S: { "return": { "enabled": true, "present": true }, "id": "example"}
+    -> { "execute": "qmp_capabilities", "arguments": { "enable": ["oob"] } }
+    <- { "return": {}}
 
-3.5 Parsing error
-------------------
+.. admonition:: Example
 
-C: { "execute": }
-S: { "error": { "class": "GenericError", "desc": "Invalid JSON syntax" } }
+  Simple 'stop' execution
 
-3.6 Powerdown event
--------------------
+  .. code-block:: QMP
 
-S: { "timestamp": { "seconds": 1258551470, "microseconds": 802384 },
-    "event": "POWERDOWN" }
+    -> { "execute": "stop" }
+    <- { "return": {} }
 
-3.7 Out-of-band execution
--------------------------
+.. admonition:: Example
 
-C: { "exec-oob": "migrate-pause", "id": 42 }
-S: { "id": 42,
-     "error": { "class": "GenericError",
-      "desc": "migrate-pause is currently only supported during postcopy-active state" } }
+  KVM information
+
+  .. code-block:: QMP
+
+    -> { "execute": "query-kvm", "id": "example" }
+    <- { "return": { "enabled": true, "present": true }, "id": "example"}
+
+.. admonition:: Example
+
+  Parsing error
+
+  .. code-block:: QMP
+
+    -> { "execute": }
+    <- { "error": { "class": "GenericError", "desc": "Invalid JSON syntax" } }
+
+.. admonition:: Example
+
+  Powerdown event
+
+  .. code-block:: QMP
+
+    <- { "timestamp": { "seconds": 1258551470, "microseconds": 802384 },
+        "event": "POWERDOWN" }
+
+.. admonition:: Example
+
+  Out-of-band execution
+
+  .. code-block:: QMP
+
+    -> { "exec-oob": "migrate-pause", "id": 42 }
+    <- { "id": 42,
+         "error": { "class": "GenericError",
+          "desc": "migrate-pause is currently only supported during postcopy-active state" } }
 
 
-4. Capabilities Negotiation
-===========================
+Capabilities Negotiation
+========================
 
 When a Client successfully establishes a connection, the Server is in
 Capabilities Negotiation mode.
 
-In this mode only the qmp_capabilities command is allowed to run, all
-other commands will return the CommandNotFound error. Asynchronous
+In this mode only the ``qmp_capabilities`` command is allowed to run; all
+other commands will return the ``CommandNotFound`` error. Asynchronous
 messages are not delivered either.
 
-Clients should use the qmp_capabilities command to enable capabilities
-advertised in the Server's greeting (section '2.2 Server Greeting') they
-support.
+Clients should use the ``qmp_capabilities`` command to enable capabilities
+advertised in the `Server Greeting`_ which they support.
 
-When the qmp_capabilities command is issued, and if it does not return an
-error, the Server enters in Command mode where capabilities changes take
-effect, all commands (except qmp_capabilities) are allowed and asynchronous
+When the ``qmp_capabilities`` command is issued, and if it does not return an
+error, the Server enters Command mode where capabilities changes take
+effect, all commands (except ``qmp_capabilities``) are allowed and asynchronous
 messages are delivered.
 
-5 Compatibility Considerations
-==============================
+Compatibility Considerations
+============================
 
 All protocol changes or new features which modify the protocol format in an
 incompatible way are disabled by default and will be advertised by the
-capabilities array (section '2.2 Server Greeting'). Thus, Clients can check
+capabilities array (in the `Server Greeting`_). Thus, Clients can check
 that array and enable the capabilities they support.
 
 The QMP Server performs a type check on the arguments to a command.  It
@@ -342,7 +373,7 @@ However, Clients must not assume any particular:
 - Amount of errors generated by a command, that is, new errors can be added
   to any existing command in newer versions of the Server
 
-Any command or member name beginning with "x-" is deemed experimental,
+Any command or member name beginning with ``x-`` is deemed experimental,
 and may be withdrawn or changed in an incompatible manner in a future
 release.
 
@@ -350,8 +381,8 @@ Of course, the Server does guarantee to send valid JSON.  But apart from
 this, a Client should be "conservative in what they send, and liberal in
 what they accept".
 
-6. Downstream extension of QMP
-==============================
+Downstream extension of QMP
+===========================
 
 We recommend that downstream consumers of QEMU do *not* modify QMP.
 Management tools should be able to support both upstream and downstream
@@ -363,23 +394,25 @@ avoid modifying QMP.  Both upstream and downstream need to take care to
 preserve long-term compatibility and interoperability.
 
 To help with that, QMP reserves JSON object member names beginning with
-'__' (double underscore) for downstream use ("downstream names").  This
+``__`` (double underscore) for downstream use ("downstream names").  This
 means upstream will never use any downstream names for its commands,
 arguments, errors, asynchronous events, and so forth.
 
-Any new names downstream wishes to add must begin with '__'.  To
+Any new names downstream wishes to add must begin with ``__``.  To
 ensure compatibility with other downstreams, it is strongly
-recommended that you prefix your downstream names with '__RFQDN_' where
+recommended that you prefix your downstream names with ``__RFQDN_`` where
 RFQDN is a valid, reverse fully qualified domain name which you
 control.  For example, a qemu-kvm specific monitor command would be:
 
+.. code-block::
+
     (qemu) __org.linux-kvm_enable_irqchip
 
-Downstream must not change the server greeting (section 2.2) other than
+Downstream must not change the `server greeting`_ other than
 to offer additional capabilities.  But see below for why even that is
 discouraged.
 
-Section '5 Compatibility Considerations' applies to downstream as well
+The section `Compatibility Considerations`_ applies to downstream as well
 as to upstream, obviously.  It follows that downstream must behave
 exactly like upstream for any input not containing members with
 downstream names ("downstream members"), except it may add members
-- 
2.34.1


