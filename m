Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AECF628D3E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:15:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidz-00021A-Qu; Mon, 14 Nov 2022 18:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidm-0001eb-KN
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJG-00034m-7c
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jcl1g0NTgJdaOT8hk77pigXhAVIVBMnr6sGj9adZyjQ=;
 b=L813RCQTQYVnZmnauGhXGu35XIJHRrygJnIxvq0uL5CnDt6IgiBPi5mjP8QAFIiYAl2N9x
 x1lMEhSzamfjcVdS6MkD2Q/bXZqXOvEYTuvFSWt8rqbqU1rJasQQTsHuBu/X2SdvklM6DK
 Cpyoy859cOVV+/X9ISVnTRMA4fvmzKs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-f1ZHxNNnOTSRmxXqOC1qHw-1; Mon, 14 Nov 2022 17:52:06 -0500
X-MC-Unique: f1ZHxNNnOTSRmxXqOC1qHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 095E838164CB;
 Mon, 14 Nov 2022 22:52:06 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8779640E978A;
 Mon, 14 Nov 2022 22:52:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 07/23] generator: Add struct nbd_extent in prep for
 64-bit extents
Date: Mon, 14 Nov 2022 16:51:42 -0600
Message-Id: <20221114225158.2186742-8-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The existing nbd_block_status() callback is permanently stuck with an
array of uint32_t pairs (len/2 extents), which is both constrained on
maximum extent size (no larger than 4G) and on the status flags (must
fit in 32 bits).  While the "base:allocation" metacontext will never
exceed 32 bits, it is not hard to envision other extension
metacontexts where a 64-bit status would be useful (for example, Zoned
Block Devices expressing a 64-bit offset[1]).  Exposing 64-bit extents
will require a new API; we now have the decision of whether to copy
the existing API practice of returning a bare array containing len/2
extent pairs, or with a saner idea of an array of structs with len
extents.  Returning an array of structs is actually easier to map to
various language bindings, particularly since we know the length field
can fit in 63-bits (fallout from the fact that NBD exports are capped
in size by signed off_t), but where the status field must represent a
full 64 bits (assuming that the user wants to connect to a metadata
extension that utilizes 64 bits, rather than existing metadata
contexts that only expose 32 bits).

This patch introduces the struct we plan to use in the new API, along
with language bindings.  The bindings for Python and OCaml were
relatively straightforward; the Golang bindings took a bit more effort
for me to write.  Temporary unused attributes are needed to keep the
compiler happy until a later patch exposes a new API using the new
callback type.

Note that 'struct nbd_block_descriptor_ext' in lib/nbd-protocol.h is
exactly the same as what we want to use in C.  But it is easier to
stick a new public type in <libnbd.h> than to figure out how to expose
just part of a header we only want to use internally.

[1] https://zonedstorage.io/docs/linux/zbd-api
---
 generator/API.ml    | 12 +++++++++++-
 generator/API.mli   |  1 +
 generator/C.ml      | 24 +++++++++++++++++++++---
 generator/GoLang.ml | 24 ++++++++++++++++++++++++
 generator/OCaml.ml  | 19 ++++++++++++++++---
 generator/Python.ml | 21 ++++++++++++++++++++-
 ocaml/helpers.c     | 20 ++++++++++++++++++++
 ocaml/nbd-c.h       |  3 ++-
 golang/handle.go    |  8 +++++++-
 9 files changed, 122 insertions(+), 10 deletions(-)

diff --git a/generator/API.ml b/generator/API.ml
index beb7a2b4..85509867 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -42,6 +42,7 @@
 | BytesPersistOut of string * string
 | Closure of closure
 | Enum of string * enum
+| Extent64 of string
 | Fd of string
 | Flags of string * flags
 | Int of string
@@ -157,6 +158,14 @@ let extent_closure =
                             "nr_entries");
              CBMutable (Int "error") ]
 }
+let extent64_closure = {
+  cbname = "extent64";
+  cbargs = [ CBString "metacontext";
+             CBUInt64 "offset";
+             CBArrayAndLen (Extent64 "entries",
+                            "nr_entries");
+             CBMutable (Int "error") ]
+}
 let list_closure = {
   cbname = "list";
   cbargs = [ CBString "name"; CBString "description" ]
@@ -166,7 +175,8 @@ let context_closure =
   cbargs = [ CBString "name" ]
 }
 let all_closures = [ chunk_closure; completion_closure;
-                     debug_closure; extent_closure; list_closure;
+                     debug_closure; extent_closure; extent64_closure;
+                     list_closure;
                      context_closure ]

 (* Enums. *)
diff --git a/generator/API.mli b/generator/API.mli
index b0267705..12ad1fb4 100644
--- a/generator/API.mli
+++ b/generator/API.mli
@@ -52,6 +52,7 @@ and
 | BytesPersistOut of string * string
 | Closure of closure       (** function pointer + void *opaque *)
 | Enum of string * enum    (** enum/union type, int in C *)
+| Extent64 of string       (** extent descriptor, struct nbd_extent in C *)
 | Fd of string             (** file descriptor *)
 | Flags of string * flags  (** flags, uint32_t in C *)
 | Int of string            (** small int *)
diff --git a/generator/C.ml b/generator/C.ml
index f9171996..51a4df65 100644
--- a/generator/C.ml
+++ b/generator/C.ml
@@ -93,6 +93,7 @@ let
   | Closure { cbname } ->
      [ sprintf "%s_callback" cbname; sprintf "%s_user_data" cbname ]
   | Enum (n, _) -> [n]
+  | Extent64 n -> [n]
   | Fd n -> [n]
   | Flags (n, _) -> [n]
   | Int n -> [n]
@@ -128,7 +129,7 @@ let
   (* list of strings should be marked as non-null *)
   | StringList n -> [ true ]
   (* numeric and other non-pointer types are not able to be null *)
-  | Bool _ | Closure _ | Enum _ | Fd _ | Flags _
+  | Bool _ | Closure _ | Enum _ | Extent64 _ | Fd _ | Flags _
   | Int _ | Int64 _ | SizeT _
   | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> [ false ]

@@ -182,6 +183,9 @@ and
       | Enum (n, _) ->
          if types then pr "int ";
          pr "%s" n
+      | Extent64 n ->
+         if types then pr "nbd_extent ";
+         pr "%s" n
       | Flags (n, _) ->
          if types then pr "uint32_t ";
          pr "%s" n
@@ -292,6 +296,11 @@ and
          pr "%s, " n;
          if types then pr "size_t ";
          pr "%s" len
+      | CBArrayAndLen (Extent64 n, len) ->
+         if types then pr "nbd_extent *";
+         pr "%s, " n;
+         if types then pr "size_t ";
+         pr "%s" len
       | CBArrayAndLen _ -> assert false
       | CBBytesIn (n, len) ->
          if types then pr "const void *";
@@ -463,6 +472,13 @@ let
   pr "extern int nbd_get_errno (void);\n";
   pr "#define LIBNBD_HAVE_NBD_GET_ERRNO 1\n";
   pr "\n";
+  pr "/* This is used in the callback for nbd_block_status_64.\n";
+  pr " */\n";
+  pr "typedef struct {\n";
+  pr "  uint64_t length;\n";
+  pr "  uint64_t flags;\n";
+  pr "} nbd_extent;\n";
+  pr "\n";
   print_closure_structs ();
   List.iter (
     fun (name, { args; optargs; ret }) ->
@@ -716,7 +732,7 @@ let
          pr "    char *%s_printable =\n" n;
          pr "        nbd_internal_printable_string_list (%s);\n" n
       | BytesOut _ | BytesPersistOut _
-      | Bool _ | Closure _ | Enum _ | Flags _ | Fd _ | Int _
+      | Bool _ | Closure _ | Enum _ | Extent64 _ | Flags _ | Fd _ | Int _
       | Int64 _ | SizeT _
       | SockAddrAndLen _ | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> ()
     ) args;
@@ -735,6 +751,7 @@ let
          pr " %s=\\\"%%s\\\" %s=%%zu" n count
       | Closure { cbname } -> pr " %s=<fun>" cbname
       | Enum (n, _) -> pr " %s=%%d" n
+      | Extent64 _ -> assert false (* only used in extent64_closure *)
       | Flags (n, _) -> pr " %s=0x%%x" n
       | Fd n | Int n -> pr " %s=%%d" n
       | Int64 n -> pr " %s=%%\" PRIi64 \"" n
@@ -764,6 +781,7 @@ let
          pr ", %s_printable ? %s_printable : \"\", %s" n n count
       | Closure { cbname } -> ()
       | Enum (n, _) -> pr ", %s" n
+      | Extent64 _ -> assert false (* only used in extent64_closure *)
       | Flags (n, _) -> pr ", %s" n
       | Fd n | Int n | Int64 n | SizeT n -> pr ", %s" n
       | SockAddrAndLen (_, len) -> pr ", (int) %s" len
@@ -787,7 +805,7 @@ let
       | StringList n ->
          pr "    free (%s_printable);\n" n
       | BytesOut _ | BytesPersistOut _
-      | Bool _ | Closure _ | Enum _ | Flags _ | Fd _ | Int _
+      | Bool _ | Closure _ | Enum _ | Extent64 _ | Flags _ | Fd _ | Int _
       | Int64 _ | SizeT _
       | SockAddrAndLen _ | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> ()
     ) args;
diff --git a/generator/GoLang.ml b/generator/GoLang.ml
index eb7279a4..39b6cc64 100644
--- a/generator/GoLang.ml
+++ b/generator/GoLang.ml
@@ -49,6 +49,7 @@ let
   | BytesPersistOut (n, len) -> n
   | Closure { cbname } -> cbname
   | Enum (n, _) -> n
+  | Extent64 n -> n
   | Fd n -> n
   | Flags (n, _) -> n
   | Int n -> n
@@ -71,6 +72,7 @@ let
   | BytesPersistOut _ -> "AioBuffer"
   | Closure { cbname } -> sprintf "%sCallback" (camel_case cbname)
   | Enum (_, { enum_prefix }) -> camel_case enum_prefix
+  | Extent64 _ -> assert false (* only used in extent64_closure *)
   | Fd _ -> "int"
   | Flags (_, { flag_prefix }) -> camel_case flag_prefix
   | Int _ -> "int"
@@ -262,6 +264,7 @@ let
        pr "    c_%s.user_data = C.alloc_cbid(C.long(%s_cbid))\n" cbname cbname
     | Enum (n, _) ->
        pr "    c_%s := C.int (%s)\n" n n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Fd n ->
        pr "    c_%s := C.int (%s)\n" n n
     | Flags (n, _) ->
@@ -334,6 +337,7 @@ let
     | BytesPersistOut (n, len) ->  pr ", c_%s, c_%s" n len
     | Closure { cbname } ->  pr ", c_%s" cbname
     | Enum (n, _) -> pr ", c_%s" n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Fd n -> pr ", c_%s" n
     | Flags (n, _) -> pr ", c_%s" n
     | Int n -> pr ", c_%s" n
@@ -524,6 +528,18 @@ let
     copy(ret, s)
     return ret
 }
+
+func copy_extent_array (entries *C.nbd_extent, count C.size_t) []LibnbdExtent {
+    unsafePtr := unsafe.Pointer(entries)
+    arrayPtr := (*[1 << 20]C.nbd_extent)(unsafePtr)
+    slice := arrayPtr[:count:count]
+    ret := make([]LibnbdExtent, count)
+    for i := 0; i < int (count); i++ {
+      ret[i].Length = uint64 (slice[i].length)
+      ret[i].Flags = uint64 (slice[i].flags)
+    }
+    return ret
+}
 ";

   List.iter (
@@ -537,6 +553,8 @@ let
           match cbarg with
           | CBArrayAndLen (UInt32 n, _) ->
              pr "%s []uint32" n;
+          | CBArrayAndLen (Extent64 n, _) ->
+             pr "%s []LibnbdExtent" n;
           | CBBytesIn (n, len) ->
              pr "%s []byte" n;
           | CBInt n ->
@@ -563,6 +581,8 @@ let
           match cbarg with
           | CBArrayAndLen (UInt32 n, count) ->
              pr "%s *C.uint32_t, %s C.size_t" n count
+          | CBArrayAndLen (Extent64 n, count) ->
+             pr "%s *C.nbd_extent, %s C.size_t" n count
           | CBBytesIn (n, len) ->
              pr "%s unsafe.Pointer, %s C.size_t" n len
           | CBInt n ->
@@ -605,6 +625,8 @@ let
           match cbarg with
           | CBArrayAndLen (UInt32 n, count) ->
              pr "copy_uint32_array (%s, %s)" n count
+          | CBArrayAndLen (Extent64 n, count) ->
+             pr "copy_extent_array (%s, %s)" n count
           | CBBytesIn (n, len) ->
              pr "C.GoBytes (%s, C.int (%s))" n len
           | CBInt n ->
@@ -756,6 +778,8 @@ let
            match cbarg with
            | CBArrayAndLen (UInt32 n, count) ->
               pr "uint32_t *%s, size_t %s" n count
+           | CBArrayAndLen (Extent64 n, count) ->
+              pr "nbd_extent *%s, size_t %s" n count
            | CBBytesIn (n, len) ->
               pr "void *%s, size_t %s" n len
            | CBInt n ->
diff --git a/generator/OCaml.ml b/generator/OCaml.ml
index 6a280b67..66dc6cad 100644
--- a/generator/OCaml.ml
+++ b/generator/OCaml.ml
@@ -44,6 +44,7 @@ and
   | Closure { cbargs } ->
      sprintf "(%s)" (ocaml_closuredecl_to_string cbargs)
   | Enum (_, { enum_prefix }) -> sprintf "%s.t" enum_prefix
+  | Extent64 _ -> "extent"
   | Fd _ -> "Unix.file_descr"
   | Flags (_, { flag_prefix }) -> sprintf "%s.t list" flag_prefix
   | Int _ -> "int"
@@ -102,6 +103,7 @@ let
   | BytesPersistOut (n, len) -> n
   | Closure { cbname } -> cbname
   | Enum (n, _) -> n
+  | Extent64 n -> n
   | Fd n -> n
   | Flags (n, _) -> n
   | Int n -> n
@@ -147,6 +149,9 @@ let

 type cookie = int64

+type extent = int64 * int64
+(** Length and flags of an extent in block_status_64 callback. *)
+
 ";

   List.iter (
@@ -268,6 +273,7 @@ let
 exception Error of string * Unix.error option
 exception Closed of string
 type cookie = int64
+type extent = int64 * int64

 (* Give the exceptions names so that they can be raised from the C code. *)
 let () =
@@ -498,7 +504,8 @@ let
   let argnames =
     List.map (
       function
-      | CBArrayAndLen (UInt32 n, _) | CBBytesIn (n, _)
+      | CBArrayAndLen (UInt32 n, _) | CBArrayAndLen (Extent64 n, _)
+      | CBBytesIn (n, _)
       | CBInt n | CBInt64 n
       | CBMutable (Int n) | CBString n | CBUInt n | CBUInt64 n ->
          n ^ "v"
@@ -526,6 +533,9 @@ let
     | CBArrayAndLen (UInt32 n, count) ->
        pr "  %sv = nbd_internal_ocaml_alloc_int64_from_uint32_array (%s, %s);\n"
          n n count;
+    | CBArrayAndLen (Extent64 n, count) ->
+       pr "  %sv = nbd_internal_ocaml_alloc_extent64_array (%s, %s);\n"
+         n n count;
     | CBBytesIn (n, len) ->
        pr "  %sv = caml_alloc_initialized_string (%s, %s);\n" n len n
     | CBInt n | CBUInt n ->
@@ -549,7 +559,7 @@ let

   List.iter (
     function
-    | CBArrayAndLen (UInt32 _, _)
+    | CBArrayAndLen (_, _)
     | CBBytesIn _
     | CBInt _
     | CBInt64 _
@@ -558,7 +568,7 @@ let
     | CBUInt64 _ -> ()
     | CBMutable (Int n) ->
        pr "  *%s = Int_val (Field (%sv, 0));\n" n n
-    | CBArrayAndLen _ | CBMutable _ -> assert false
+    | CBMutable _ -> assert false
   ) cbargs;

   pr "  if (Is_exception_result (rv)) {\n";
@@ -573,6 +583,7 @@ let
   pr "}\n";
   pr "\n";
   pr "static int\n";
+  pr "__attribute__((unused)) /* XXX temporary hack */\n";
   pr "%s_wrapper " cbname;
   C.print_cbarg_list ~wrap:true cbargs;
   pr "\n";
@@ -688,6 +699,7 @@ let
        pr "  %s_callback.free = free_user_data;\n" cbname
     | Enum (n, { enum_prefix }) ->
        pr "  int %s = %s_val (%sv);\n" n enum_prefix n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Fd n ->
        pr "  /* OCaml Unix.file_descr is just an int, at least on Unix. */\n";
        pr "  int %s = Int_val (%sv);\n" n n
@@ -773,6 +785,7 @@ let
     | BytesPersistOut _
     | Closure _
     | Enum _
+    | Extent64 _
     | Fd _
     | Flags _
     | Int _
diff --git a/generator/Python.ml b/generator/Python.ml
index 3585955b..980fdcea 100644
--- a/generator/Python.ml
+++ b/generator/Python.ml
@@ -153,6 +153,7 @@ let
 let print_python_closure_wrapper { cbname; cbargs } =
   pr "/* Wrapper for %s callback. */\n" cbname;
   pr "static int\n";
+  pr "__attribute__((unused)) /* XXX temporary hack */\n";
   pr "%s_wrapper " cbname;
   C.print_cbarg_list ~wrap:true cbargs;
   pr "\n";
@@ -165,6 +166,7 @@ let
   List.iter (
     function
     | CBArrayAndLen (UInt32 n, _)
+    | CBArrayAndLen (Extent64 n, _)
     | CBBytesIn (n, _)
     | CBMutable (Int n) ->
        pr "  PyObject *py_%s = NULL;\n" n
@@ -182,6 +184,16 @@ let
        pr "    if (!py_e_%s) { PyErr_PrintEx (0); goto out; }\n" n;
        pr "    PyList_SET_ITEM (py_%s, i_%s, py_e_%s);\n" n n n;
        pr "  }\n"
+    | CBArrayAndLen (Extent64 n, len) ->
+       pr "  py_%s = PyList_New (%s);\n" n len;
+       pr "  size_t i_%s;\n" n;
+       pr "  for (i_%s = 0; i_%s < %s; ++i_%s) {\n" n n len n;
+       pr "    PyObject *py_e_%s = Py_BuildValue (\"OO\",\n" n;
+       pr "      PyLong_FromUnsignedLong (%s[i_%s].length),\n" n n;
+       pr "      PyLong_FromUnsignedLong (%s[i_%s].flags));\n" n n;
+       pr "    if (!py_e_%s) { PyErr_PrintEx (0); goto out; }\n" n;
+       pr "    PyList_SET_ITEM (py_%s, i_%s, py_e_%s);\n" n n n;
+       pr "  }\n"
     | CBBytesIn (n, len) ->
        pr "  py_%s = nbd_internal_py_get_subview (data->view, %s, %s);\n" n n len;
        pr "  if (!py_%s) { PyErr_PrintEx (0); goto out; }\n" n
@@ -201,6 +213,7 @@ let
     List.map (
       function
       | CBArrayAndLen (UInt32 n, _) -> "O", sprintf "py_%s" n
+      | CBArrayAndLen (Extent64 n, _) -> "O", sprintf "py_%s" n
       | CBBytesIn (n, _) -> "O", sprintf "py_%s" n
       | CBInt n -> "i", n
       | CBInt64 n -> "L", n
@@ -249,7 +262,8 @@ let
   pr " out:\n";
   List.iter (
     function
-    | CBArrayAndLen (UInt32 n, _) ->
+    | CBArrayAndLen (UInt32 n, _)
+    | CBArrayAndLen (Extent64 n, _) ->
        pr "  Py_XDECREF (py_%s);\n" n
     | CBBytesIn (n, _) ->
        pr "  Py_XDECREF (py_%s);\n" n
@@ -302,6 +316,7 @@ let
            pr ".callback = %s_wrapper, .free = free_user_data" cbname);
        pr " };\n"
     | Enum (n, _) -> pr "  int %s;\n" n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Flags (n, _) ->
        pr "  uint32_t %s_u32;\n" n;
        pr "  unsigned int %s; /* really uint32_t */\n" n
@@ -358,6 +373,7 @@ let
          "O", sprintf "&%s" n, sprintf "py_%s->buf, py_%s->len" n n
       | Closure { cbname } -> "O", sprintf "&py_%s_fn" cbname, cbname
       | Enum (n, _) -> "i", sprintf "&%s" n, n
+      | Extent64 _ -> assert false (* only used in extent64_closure *)
       | Flags (n, _) -> "I", sprintf "&%s" n, sprintf "%s_u32" n
       | Fd n | Int n -> "i", sprintf "&%s" n, n
       | Int64 n -> "L", sprintf "&%s" n, sprintf "%s_i64" n
@@ -449,6 +465,7 @@ let
          pr "  if (!chunk_user_data->view) goto out;\n"
        )
     | Enum _ -> ()
+    | Extent64 _ -> ()
     | Flags (n, _) -> pr "  %s_u32 = %s;\n" n n
     | Fd _ | Int _ -> ()
     | Int64 n -> pr "  %s_i64 = %s;\n" n n
@@ -547,6 +564,7 @@ let
     | Closure { cbname } ->
        pr "  free_user_data (%s_user_data);\n" cbname
     | Enum _ -> ()
+    | Extent64 _ -> ()
     | Flags _ -> ()
     | Fd _ | Int _ -> ()
     | Int64 _ -> ()
@@ -834,6 +852,7 @@ let
           | BytesPersistOut (n, _) -> n, None
           | Closure { cbname } -> cbname, None
           | Enum (n, _) -> n, None
+          | Extent64 _ -> assert false (* only used in extent64_closure *)
           | Flags (n, _) -> n, None
           | Fd n | Int n -> n, None
           | Int64 n -> n, None
diff --git a/ocaml/helpers.c b/ocaml/helpers.c
index 6568755b..ac8bb0e2 100644
--- a/ocaml/helpers.c
+++ b/ocaml/helpers.c
@@ -133,6 +133,26 @@ nbd_internal_ocaml_alloc_int64_from_uint32_array (uint32_t *a, size_t len)
   CAMLreturn (rv);
 }

+value
+nbd_internal_ocaml_alloc_extent64_array (nbd_extent *a, size_t len)
+{
+  CAMLparam0 ();
+  CAMLlocal3 (s, v, rv);
+  size_t i;
+
+  rv = caml_alloc (len, 0);
+  for (i = 0; i < len; ++i) {
+    s = caml_alloc (2, 0);
+    v = caml_copy_int64 (a[i].length);
+    Store_field (s, 0, v);
+    v = caml_copy_int64 (a[i].flags);
+    Store_field (s, 1, v);
+    Store_field (rv, i, s);
+  }
+
+  CAMLreturn (rv);
+}
+
 /* Convert a Unix.sockaddr to a C struct sockaddr. */
 void
 nbd_internal_unix_sockaddr_to_sa (value sockaddrv,
diff --git a/ocaml/nbd-c.h b/ocaml/nbd-c.h
index 8b0c088d..9a5a80a2 100644
--- a/ocaml/nbd-c.h
+++ b/ocaml/nbd-c.h
@@ -1,5 +1,5 @@
 /* NBD client library in userspace
- * Copyright (C) 2013-2019 Red Hat Inc.
+ * Copyright (C) 2013-2022 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -63,6 +63,7 @@ extern void nbd_internal_ocaml_raise_closed (const char *func) Noreturn;
 extern const char **nbd_internal_ocaml_string_list (value);
 extern value nbd_internal_ocaml_alloc_int64_from_uint32_array (uint32_t *,
                                                                size_t);
+extern value nbd_internal_ocaml_alloc_extent64_array (nbd_extent *, size_t);
 extern void nbd_internal_unix_sockaddr_to_sa (value, struct sockaddr_storage *,
                                               socklen_t *);
 extern void nbd_internal_ocaml_exception_in_wrapper (const char *, value);
diff --git a/golang/handle.go b/golang/handle.go
index c8d9485d..b8388b61 100644
--- a/golang/handle.go
+++ b/golang/handle.go
@@ -1,5 +1,5 @@
 /* libnbd golang handle.
- * Copyright (C) 2013-2021 Red Hat Inc.
+ * Copyright (C) 2013-2022 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -58,6 +58,12 @@ func (h *Libnbd) String() string {
 	return "&Libnbd{}"
 }

+/* Used for block status callback. */
+type LibnbdExtent struct {
+	Length uint64        // length of the extent
+	Flags  uint64        // flags describing properties of the extent
+}
+
 /* All functions (except Close) return ([result,] LibnbdError). */
 type LibnbdError struct {
 	Op     string        // operation which failed
-- 
2.38.1


