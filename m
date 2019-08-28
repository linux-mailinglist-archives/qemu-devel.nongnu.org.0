Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832DFA0B9D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 22:36:40 +0200 (CEST)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i34gI-0004eh-GJ
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 16:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i34Wm-0003ex-7v
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 16:26:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i34Wj-0002nF-Uq
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 16:26:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44466)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i34Wj-0002mP-LK
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 16:26:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F0DBD30842A8;
 Wed, 28 Aug 2019 20:26:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90008600CD;
 Wed, 28 Aug 2019 20:26:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 84D491165616; Wed, 28 Aug 2019 22:26:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 22:26:40 +0200
Message-Id: <20190828202641.24752-9-armbru@redhat.com>
In-Reply-To: <20190828202641.24752-1-armbru@redhat.com>
References: <20190828202641.24752-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 28 Aug 2019 20:26:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 8/9] docs/devel/qapi-code-gen: Rewrite
 introduction to schema
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The introduction to the QAPI schema is somewhat rambling.  Rewrite for
clarity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.txt | 106 ++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 59 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 5c9146c92e..4502502531 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -16,65 +16,53 @@ well as the QEMU Guest Agent (QGA) for communicating =
with the guest.
 The remainder of this document uses "Client JSON Protocol" when
 referring to the wire contents of a QMP or QGA connection.
=20
-To map Client JSON Protocol interfaces to the native C QAPI
-implementations, a JSON-based schema is used to define types and
-function signatures, and a set of scripts is used to generate types,
-signatures, and marshaling/dispatch code. This document will describe
-how the schemas, scripts, and resulting code are used.
-
-
-=3D=3D QMP/Guest agent schema =3D=3D
-
-A QAPI schema file is designed to be loosely based on JSON
-(http://www.ietf.org/rfc/rfc8259.txt) with changes for quoting style
-and the use of comments; a QAPI schema file is then parsed by a python
-code generation program.  A valid QAPI schema consists of a series of
-top-level expressions, with no commas between them.  Where
-dictionaries (JSON objects) are used, they are parsed as python
-OrderedDicts so that ordering is preserved (for predictable layout of
-generated C structs and parameter lists).  Ordering doesn't matter
-between top-level expressions or the keys within an expression, but
-does matter within dictionary values for 'data' and 'returns' members
-of a single expression.  QAPI schema input is written using 'single
-quotes' instead of JSON's "double quotes" (in contrast, Client JSON
-Protocol uses no comments, and while input accepts 'single quotes' as
-an extension, output is strict JSON using only "double quotes").  As
-in JSON, trailing commas are not permitted in arrays or dictionaries.
-Input must be ASCII (although QMP supports full Unicode strings, the
-QAPI parser does not).  At present, there is no place where a QAPI
-schema requires the use of JSON numbers or null.
-
-
-=3D=3D=3D Comments =3D=3D=3D
-
-Comments are allowed; anything between an unquoted # and the following
-newline is ignored.
-
-
-=3D=3D=3D Schema overview =3D=3D=3D
-
-The schema sets up a series of types, as well as commands and events
-that will use those types.  Forward references are allowed: the parser
-scans in two passes, where the first pass learns all type names, and
-the second validates the schema and generates the code.  This allows
-the definition of complex structs that can have mutually recursive
-types, and allows for indefinite nesting of Client JSON Protocol that
-satisfies the schema.  A type name should not be defined more than
-once.  It is permissible for the schema to contain additional types
-not used by any commands or events in the Client JSON Protocol, for
-the side effect of generated C code used internally.
-
-There are eight top-level expressions recognized by the parser:
-'include', 'pragma', 'command', 'struct', 'enum', 'union',
-'alternate', and 'event'.  There are several groups of types: simple
-types (a number of built-in types, such as 'int' and 'str'; as well as
-enumerations), complex types (structs and two flavors of unions), and
-alternate types (a choice between other types).  The 'command' and
-'event' expressions can refer to existing types by name, or list an
-anonymous type as a dictionary. Listing a type name inside an array
-refers to a single-dimension array of that type; multi-dimension
-arrays are not directly supported (although an array of a complex
-struct that contains an array member is possible).
+To map between Client JSON Protocol interfaces and the native C API,
+we generate C code from a QAPI schema.  This document describes the
+QAPI schema language, and how it gets mapped to the Client JSON
+Protocol and to C.  It additionally provides guidance on maintaining
+Client JSON Protocol compatibility.
+
+
+=3D=3D The QAPI schema language =3D=3D
+
+The QAPI schema defines the Client JSON Protocol's commands and
+events, as well as types used by them.  Forward references are
+allowed.
+
+It is permissible for the schema to contain additional types not used
+by any commands or events, for the side effect of generated C code
+used internally.
+
+There are several kinds of types: simple types (a number of built-in
+types, such as 'int' and 'str'; as well as enumerations), arrays,
+complex types (structs and two flavors of unions), and alternate types
+(a choice between other types).
+
+
+=3D=3D=3D Schema syntax =3D=3D=3D
+
+Syntax is loosely based on JSON (http://www.ietf.org/rfc/rfc8259.txt).
+Differences:
+
+* Comments: start with a hash character (#) that is not part of a
+  string, and extend to the end of the line.
+
+* Strings are enclosed in 'single quotes', not "double quotes".
+
+* Strings are restricted to ASCII.  All control characters must be
+  escaped, even DEL.
+
+* Numbers are not supported.
+
+A QAPI schema consists of a series of top-level expressions (JSON
+objects).  Their order does not matter.
+
+The order of keys within JSON objects does not matter unless
+explicitly noted.
+
+There are eight kinds of top-level expressions: 'include', 'pragma',
+'command', 'struct', 'enum', 'union', 'alternate', and 'event'.  These
+are discussed in detail below.
=20
 In the rest of this document, usage lines are given for each
 expression type, with literal strings written in lower case and
--=20
2.21.0


