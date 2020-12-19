Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8412DEE58
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:02:48 +0100 (CET)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqa0d-00056n-TK
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtp-0004hP-4l
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtj-0007EH-Mi
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rCtEO6UkdVoldCnYGM1ell4q8/Mgw7rPSKkWgSwaC+U=;
 b=CQHSUHYzotyM7HJXKiYWoLOgtgoBNWCNPwBqF3A2BU0SRA6zkYbK+KVlUhFz4lHgIrhJdq
 RI/+P45O4kXRx0Dg3jgeWcy/zzhPVaboU+RgYH/JFgcdPj4L+WAzRikU75ZZkv0JHaTUjv
 4pDlAEkmCf3LNp4ekWFtie/wnSQXuSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-7CDGbBpaOjeKfHo_WXB8Fw-1; Sat, 19 Dec 2020 05:55:36 -0500
X-MC-Unique: 7CDGbBpaOjeKfHo_WXB8Fw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0934107ACE6;
 Sat, 19 Dec 2020 10:55:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3316A8F1;
 Sat, 19 Dec 2020 10:55:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A36611275EC; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/33] qobject: Fix qnum_to_string() to use sufficient precision
Date: Sat, 19 Dec 2020 11:55:08 +0100
Message-Id: <20201219105532.1734134-10-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should serialize numbers to JSON so that they deserialize back to
the same number.  We fail to do so.

The culprit is qnum_to_string(): it uses format %f with trailing '0'
trimmed.  Results in pretty output for "nice" numbers, but is prone to
nasty rounding errors.  For instance, numbers between 0 and 0.0000005
get flushed to zero.

Where exactly the incorrect rounding can bite is tiresome to gauge.
Here's my take.

* In QMP output, type 'number':

  - query-blockstats value avg_rd_queue_depth

  - QMP query-migrate values mbps, cache-miss-rate, encoding-rate,
    busy-rate, compression-rate.

  Relatively harmless, I guess.

* In tracing QMP input.  Harmless.

* In qemu-ga output, type 'number': guest-get-users value login-time.
  Harmless.

* In output of HMP qom-get.  Harmless.

Not affected, because double values don't actually occur there (I
think):

* QMP output, type 'any':

  * qom-get value

  * qom-list, qom-list-properties value default-value

  * query-cpu-model-comparison, query-cpu-model-baseline,
    query-cpu-model-expansion value props.

* qemu-img --output json output.

* "json:" pseudo-filenames generated by bdrv_refresh_filename().

* The rbd block driver's "=keyvalue-pairs" hack.

* In -object help on property default values.  Aside: use of JSON
  feels inappropriate here.

* Output of HMP qom-get.

* Argument conversion to QemuOpts for qdev_device_add() and HMP with
  qemu_opts_from_qdict()

  QMP and HMP device_add, virtio-net failover primary creation,
  xen-usb "usb-host" creation, HMP netdev_add, object_add.

* The uses of qobject_input_visitor_new_flat_confused()

  As far as I can tell, none of the visited types contain double
  values.

* Dumping ImageInfoSpecific with dump_qobject()

Fix by formatting with %.17g.  17 decimal digits always suffice for
IEEE double.

The change to expected test output illustrates the effect: the
rounding errors are gone, but some seemingly "nice" numbers now get
converted to not so nice strings, e.g. 0.42 to "0.41999999999999998".
This is because 0.42 is not representable exactly in double.  It's
more accurate in this example than strictly necessary, though.

If ugly accuracy bothers us, we can we can try using the least number
of digits that still converts back to the same double.  In this
example, "0.42" would do.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201210161452.2813491-7-armbru@redhat.com>
---
 qobject/qnum.c      | 24 +++---------------------
 tests/check-qjson.c |  8 ++++----
 tests/check-qnum.c  |  4 ++--
 3 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/qobject/qnum.c b/qobject/qnum.c
index 7012fc57f2..bf1240ecec 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -161,37 +161,19 @@ double qnum_get_double(QNum *qn)
 
 char *qnum_to_string(QNum *qn)
 {
-    char *buffer;
-    int len;
-
     switch (qn->kind) {
     case QNUM_I64:
         return g_strdup_printf("%" PRId64, qn->u.i64);
     case QNUM_U64:
         return g_strdup_printf("%" PRIu64, qn->u.u64);
     case QNUM_DOUBLE:
-        /* FIXME: snprintf() is locale dependent; but JSON requires
+        /* FIXME: g_strdup_printf() is locale dependent; but JSON requires
          * numbers to be formatted as if in the C locale. Dependence
          * on C locale is a pervasive issue in QEMU. */
         /* FIXME: This risks printing Inf or NaN, which are not valid
          * JSON values. */
-        /* FIXME: the default precision of 6 for %f often causes
-         * rounding errors; we should be using DBL_DECIMAL_DIG (17),
-         * and only rounding to a shorter number if the result would
-         * still produce the same floating point value.  */
-        buffer = g_strdup_printf("%f" , qn->u.dbl);
-        len = strlen(buffer);
-        while (len > 0 && buffer[len - 1] == '0') {
-            len--;
-        }
-
-        if (len && buffer[len - 1] == '.') {
-            buffer[len - 1] = 0;
-        } else {
-            buffer[len] = 0;
-        }
-
-        return buffer;
+        /* 17 digits suffice for IEEE double */
+        return g_strdup_printf("%.17g", qn->u.dbl);
     }
 
     assert(0);
diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index 98515b1fd6..ca8fb816e9 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -882,10 +882,10 @@ static void float_number(void)
     } test_cases[] = {
         { "32.43", 32.43 },
         { "0.222", 0.222 },
-        { "-32.12313", -32.12313 },
-        { "-32.20e-10", -32.20e-10, "-0" /* BUG */ },
-        { "18446744073709551616", 0x1p64 },
-        { "-9223372036854775809", -0x1p63, "-9223372036854775808" },
+        { "-32.12313", -32.12313, "-32.123130000000003" },
+        { "-32.20e-10", -32.20e-10, "-3.22e-09" },
+        { "18446744073709551616", 0x1p64, "1.8446744073709552e+19" },
+        { "-9223372036854775809", -0x1p63, "-9.2233720368547758e+18" },
         {},
     };
     int i;
diff --git a/tests/check-qnum.c b/tests/check-qnum.c
index a73809d021..b85fca2302 100644
--- a/tests/check-qnum.c
+++ b/tests/check-qnum.c
@@ -147,13 +147,13 @@ static void qnum_to_string_test(void)
 
     qn = qnum_from_double(0.42);
     tmp = qnum_to_string(qn);
-    g_assert_cmpstr(tmp, ==, "0.42");
+    g_assert_cmpstr(tmp, ==, "0.41999999999999998");
     g_free(tmp);
     qobject_unref(qn);
 
     qn = qnum_from_double(2.718281828459045);
     tmp = qnum_to_string(qn);
-    g_assert_cmpstr(tmp, ==, "2.718282"); /* BUG */
+    g_assert_cmpstr(tmp, ==, "2.7182818284590451");
     g_free(tmp);
     qobject_unref(qn);
 }
-- 
2.26.2


