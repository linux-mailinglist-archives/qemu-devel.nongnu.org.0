Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2BD628DC8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:55:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidt-0001s8-Gx; Mon, 14 Nov 2022 18:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidn-0001eb-U3
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJJ-00035i-ES
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dn4u5c7k0NDmH+fmkZZ9nPfDWOXKvhaM7RFY3LonV6A=;
 b=bzi2uBHoR4qBFJuZZU0amtG1HsRB54Q3APCPPzu3XkNGwzhqics0YBGNVBaj+a6As0PGwb
 5Jdww+hl49xkYBwuAcgpyFK3258IuW1iq6P3mgsYX2Fqm/oQw/cChvdXvKuNsJ8qt8AF6J
 2Ij5oycwpuSMKPMwlwn6qWJR1J3QkKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-eKppC75POrCF_C0b4JsMYg-1; Mon, 14 Nov 2022 17:52:10 -0500
X-MC-Unique: eKppC75POrCF_C0b4JsMYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA35F858F13;
 Mon, 14 Nov 2022 22:52:09 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84FCF40E9786;
 Mon, 14 Nov 2022 22:52:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 14/23] info: Expose extended-headers support through
 nbdinfo
Date: Mon, 14 Nov 2022 16:51:49 -0600
Message-Id: <20221114225158.2186742-15-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Add another bit of overall server information, as well as a '--can
extended-headers' silent query.  For now, the testsuite is written
assuming that when nbdkit finally adds extended headers support, it
will also add a --no-eh kill switch comparable to its existing --no-sr
switch.
---
 info/nbdinfo.pod     | 11 ++++++++++-
 info/can.c           |  9 +++++++++
 info/info-can.sh     | 27 +++++++++++++++++++++++++++
 info/info-packets.sh | 17 ++++++++++++++++-
 info/main.c          |  7 ++++++-
 5 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/info/nbdinfo.pod b/info/nbdinfo.pod
index c47e5175..2455e1c0 100644
--- a/info/nbdinfo.pod
+++ b/info/nbdinfo.pod
@@ -86,6 +86,7 @@ the I<--json> parameter:
    "protocol": "newstyle-fixed",
    "TLS": false,
    "structured": true,
+   "extended": false,
    "exports": [
      {
        "export-name": "",
@@ -165,6 +166,11 @@ Test if the NBD URI connection is using TLS.
 Test if server can respond with structured replies (a prerequisite
 for supporting block status commands).

+=item nbdinfo --can extended-headers URI
+
+Test if server supports extended headers (a prerequisite for
+supporting 64-bit commands; implies structured replies as well).
+
 =item nbdinfo --is rotational URI

 Test if the server export is backed by something which behaves like a
@@ -312,6 +318,8 @@ Display brief command line help and exit.

 =item B<--can df>

+=item B<--can extended-headers>
+
 =item B<--can fast-zero>

 =item B<--can flush>
@@ -341,7 +349,8 @@ and the following libnbd functions: L<nbd_can_cache(3)>,
 L<nbd_can_df(3)>, L<nbd_can_fast_zero(3)>, L<nbd_can_flush(3)>,
 L<nbd_can_fua(3)>, L<nbd_can_multi_conn(3)>, L<nbd_can_trim(3)>,
 L<nbd_can_zero(3)>, L<nbd_is_read_only(3)>,
-L<nbd_get_structured_replies_negotiated(3)>.
+L<nbd_get_structured_replies_negotiated(3)>,
+L<nbd_get_extended_headers_negotiated(3)>.

 =item B<--color>

diff --git a/info/can.c b/info/can.c
index 08d6bcd5..f602ffce 100644
--- a/info/can.c
+++ b/info/can.c
@@ -50,6 +50,15 @@ do_can (void)
            strcasecmp (can, "structured_replies") == 0)
     feature = nbd_get_structured_replies_negotiated (nbd);

+  else if (strcasecmp (can, "eh") == 0 ||
+           strcasecmp (can, "extended header") == 0 ||
+           strcasecmp (can, "extended-header") == 0 ||
+           strcasecmp (can, "extended_header") == 0 ||
+           strcasecmp (can, "extended headers") == 0 ||
+           strcasecmp (can, "extended-headers") == 0 ||
+           strcasecmp (can, "extended_headers") == 0)
+    feature = nbd_get_extended_headers_negotiated (nbd);
+
   else if (strcasecmp (can, "readonly") == 0 ||
            strcasecmp (can, "read-only") == 0 ||
            strcasecmp (can, "read_only") == 0)
diff --git a/info/info-can.sh b/info/info-can.sh
index 3edc3948..e5f6a44b 100755
--- a/info/info-can.sh
+++ b/info/info-can.sh
@@ -61,6 +61,33 @@ esac
 EOF
 test $st = 2

+# --can extended-headers cannot be positively tested until nbdkit gains
+# --no-eh support.  Otherwise, it is similar to --can structured-reply.
+
+no_eh=
+if nbdkit --no-eh --help >/dev/null 2>/dev/null; then
+    no_eh=--no-eh
+    nbdkit -v -U - sh - \
+           --run '$VG nbdinfo --can extended-headers "nbd+unix:///?socket=$unixsocket"' <<'EOF'
+case "$1" in
+  get_size) echo 1024 ;;
+  pread) ;;
+  *) exit 2 ;;
+esac
+EOF
+fi
+
+st=0
+nbdkit -v -U - $no_eh sh - \
+       --run '$VG nbdinfo --can extended-headers "nbd+unix:///?socket=$unixsocket"' <<'EOF' || st=$?
+case "$1" in
+  get_size) echo 1024 ;;
+  pread) ;;
+  *) exit 2 ;;
+esac
+EOF
+test $st = 2
+
 # --can cache and --can fua require special handling because in
 # nbdkit-sh-plugin we must print "native" or "none".  Also the can_fua
 # flag is only sent if the export is writable (hence can_write below).
diff --git a/info/info-packets.sh b/info/info-packets.sh
index 82bb526c..a6b307a0 100755
--- a/info/info-packets.sh
+++ b/info/info-packets.sh
@@ -27,12 +27,27 @@ requires nbdkit --no-sr memory --version
 out=info-packets.out
 cleanup_fn rm -f $out

+# Older nbdkit does not support extended headers; --no-eh is a reliable
+# witness of whether nbdkit is new enough.
+
+no_eh=
+if nbdkit --no-eh --help >/dev/null 2>/dev/null; then
+    no_eh=--no-eh
+fi
+
 nbdkit --no-sr -U - memory size=1M \
        --run '$VG nbdinfo "nbd+unix:///?socket=$unixsocket"' > $out
 cat $out
 grep "protocol: .*using simple packets" $out

-nbdkit -U - memory size=1M \
+nbdkit $no_eh -U - memory size=1M \
        --run '$VG nbdinfo "nbd+unix:///?socket=$unixsocket"' > $out
 cat $out
 grep "protocol: .*using structured packets" $out
+
+if test x != "x$no_eh"; then
+    nbdkit -U - memory size=1M \
+           --run '$VG nbdinfo "nbd+unix:///?socket=$unixsocket"' > $out
+    cat $out
+    grep "protocol: .*using extended packets" $out
+fi
diff --git a/info/main.c b/info/main.c
index 5cd91fe1..9794c109 100644
--- a/info/main.c
+++ b/info/main.c
@@ -302,11 +302,13 @@ main (int argc, char *argv[])
     const char *protocol;
     int tls_negotiated;
     int sr_negotiated;
+    int eh_negotiated;

     /* Print per-connection fields. */
     protocol = nbd_get_protocol (nbd);
     tls_negotiated = nbd_get_tls_negotiated (nbd);
     sr_negotiated = nbd_get_structured_replies_negotiated (nbd);
+    eh_negotiated = nbd_get_extended_headers_negotiated (nbd);

     if (!json_output) {
       if (protocol) {
@@ -314,8 +316,9 @@ main (int argc, char *argv[])
         fprintf (fp, "protocol: %s", protocol);
         if (tls_negotiated >= 0)
           fprintf (fp, " %s TLS", tls_negotiated ? "with" : "without");
-        if (sr_negotiated >= 0)
+        if (eh_negotiated >= 0 && sr_negotiated >= 0)
           fprintf (fp, ", using %s packets",
+                   eh_negotiated ? "extended" :
                    sr_negotiated ? "structured" : "simple");
         fprintf (fp, "\n");
         ansi_restore (fp);
@@ -333,6 +336,8 @@ main (int argc, char *argv[])
         fprintf (fp, "\"TLS\": %s,\n", tls_negotiated ? "true" : "false");
       if (sr_negotiated >= 0)
         fprintf (fp, "\"structured\": %s,\n", sr_negotiated ? "true" : "false");
+      if (eh_negotiated >= 0)
+        fprintf (fp, "\"extended\": %s,\n", eh_negotiated ? "true" : "false");
     }

     if (!list_all)
-- 
2.38.1


