Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC9A2CBA56
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:19:39 +0100 (CET)
Received: from localhost ([::1]:35026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPEY-0000ar-Bx
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3r-0003nU-39
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3j-0004hU-RG
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/I1UKAuFkhg4uNFK4p8T6uf6h2FIq3Qwbuil6+xSpM=;
 b=TTHikudw65cMErtulP50GSudeGncuaHImKSshxlQImLdeKQAlUe5jmnX0tY9h962D8K5ze
 m5PYtmzTOwa605hxaV7JtBXiNS5rrgm/RvEa46sF5hMvt5uh/or77NYLITu6l/efACbKa6
 vQFjEMomiS4i5g1gOqsOk5iXqNwUotk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-Dh5-1MKuOR6jKrTsw1Wc4A-1; Wed, 02 Dec 2020 04:04:20 -0500
X-MC-Unique: Dh5-1MKuOR6jKrTsw1Wc4A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60BF7873093;
 Wed,  2 Dec 2020 09:03:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0A015C1B4;
 Wed,  2 Dec 2020 09:03:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/28] qemu-img: use keyval for -object parsing
Date: Wed,  2 Dec 2020 04:02:58 -0500
Message-Id: <20201202090305.4129317-22-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable creation of object with non-scalar properties.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-img.c | 258 +++++++++++------------------------------------------
 1 file changed, 52 insertions(+), 206 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 8bdea40b58..a91bbba4c6 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -227,21 +227,27 @@ static void QEMU_NORETURN help(void)
     exit(EXIT_SUCCESS);
 }
 
-static QemuOptsList qemu_object_opts = {
-    .name = "object",
-    .implied_opt_name = "qom-type",
-    .head = QTAILQ_HEAD_INITIALIZER(qemu_object_opts.head),
-    .desc = {
-        { }
-    },
-};
-
-static bool qemu_img_object_print_help(const char *type, QemuOpts *opts)
+static void qemu_img_object_parse(const char *optarg, int exit_code)
 {
-    if (user_creatable_print_help(type, opts)) {
-        exit(0);
+    QDict *args;
+    bool help;
+    Error *local_error = NULL;
+
+    args = keyval_parse(optarg, "qom-type", &help, &local_error);
+    if (local_error) {
+        error_report_err(local_error);
+        exit(exit_code);
     }
-    return true;
+    if (help) {
+        user_creatable_print_help_from_qdict(args);
+        exit(EXIT_SUCCESS);
+    }
+    user_creatable_add_dict(args, true, &local_error);
+    if (local_error) {
+        error_report_err(local_error);
+        exit(exit_code);
+    }
+    qobject_unref(args);
 }
 
 /*
@@ -567,14 +573,9 @@ static int img_create(int argc, char **argv)
         case 'u':
             flags |= BDRV_O_NO_BACKING;
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *opts;
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                goto fail;
-            }
-        }   break;
+        case OPTION_OBJECT:
+            qemu_img_object_parse(optarg, 1);
+            break;
         }
     }
 
@@ -590,12 +591,6 @@ static int img_create(int argc, char **argv)
     }
     optind++;
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        goto fail;
-    }
-
     /* Get image size, if specified */
     if (optind < argc) {
         int64_t sval;
@@ -805,14 +800,9 @@ static int img_check(int argc, char **argv)
         case 'U':
             force_share = true;
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *opts;
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                return 1;
-            }
-        }   break;
+        case OPTION_OBJECT:
+            qemu_img_object_parse(optarg, 1);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -832,12 +822,6 @@ static int img_check(int argc, char **argv)
         return 1;
     }
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        return 1;
-    }
-
     ret = bdrv_parse_cache_mode(cache, &flags, &writethrough);
     if (ret < 0) {
         error_report("Invalid source cache option: %s", cache);
@@ -1035,14 +1019,9 @@ static int img_commit(int argc, char **argv)
                 return 1;
             }
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *opts;
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                return 1;
-            }
-        }   break;
+        case OPTION_OBJECT:
+            qemu_img_object_parse(optarg, 1);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -1059,12 +1038,6 @@ static int img_commit(int argc, char **argv)
     }
     filename = argv[optind++];
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        return 1;
-    }
-
     flags = BDRV_O_RDWR | BDRV_O_UNMAP;
     ret = bdrv_parse_cache_mode(cache, &flags, &writethrough);
     if (ret < 0) {
@@ -1424,15 +1397,9 @@ static int img_compare(int argc, char **argv)
         case 'U':
             force_share = true;
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *opts;
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                ret = 2;
-                goto out4;
-            }
-        }   break;
+        case OPTION_OBJECT:
+            qemu_img_object_parse(optarg, 2);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -1451,13 +1418,6 @@ static int img_compare(int argc, char **argv)
     filename1 = argv[optind++];
     filename2 = argv[optind++];
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        ret = 2;
-        goto out4;
-    }
-
     /* Initialize before goto out */
     qemu_progress_init(progress, 2.0);
 
@@ -1642,7 +1602,6 @@ out2:
     blk_unref(blk1);
 out3:
     qemu_progress_end();
-out4:
     return ret;
 }
 
@@ -2344,15 +2303,9 @@ static int img_convert(int argc, char **argv)
                 goto fail_getopt;
             }
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *object_opts;
-            object_opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                                  optarg, true);
-            if (!object_opts) {
-                goto fail_getopt;
-            }
+        case OPTION_OBJECT:
+            qemu_img_object_parse(optarg, 1);
             break;
-        }
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -2380,12 +2333,6 @@ static int img_convert(int argc, char **argv)
         out_fmt = "raw";
     }
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        goto fail_getopt;
-    }
-
     if (s.compressed && s.copy_range) {
         error_report("Cannot enable copy offloading when -c is used");
         goto fail_getopt;
@@ -2977,14 +2924,9 @@ static int img_info(int argc, char **argv)
         case OPTION_BACKING_CHAIN:
             chain = true;
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *opts;
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                return 1;
-            }
-        }   break;
+        case OPTION_OBJECT:
+            qemu_img_object_parse(optarg, 1);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -3004,12 +2946,6 @@ static int img_info(int argc, char **argv)
         return 1;
     }
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        return 1;
-    }
-
     list = collect_image_info_list(image_opts, filename, fmt, chain,
                                    force_share);
     if (!list) {
@@ -3219,14 +3155,9 @@ static int img_map(int argc, char **argv)
                 return 1;
             }
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *opts;
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                return 1;
-            }
-        }   break;
+        case OPTION_OBJECT:
+            qemu_img_object_parse(optarg, 1);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -3246,12 +3177,6 @@ static int img_map(int argc, char **argv)
         return 1;
     }
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        return 1;
-    }
-
     blk = img_open(image_opts, filename, fmt, 0, false, false, force_share);
     if (!blk) {
         return 1;
@@ -3390,14 +3315,9 @@ static int img_snapshot(int argc, char **argv)
         case 'U':
             force_share = true;
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *opts;
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                return 1;
-            }
-        }   break;
+        case OPTION_OBJECT:
+            qemu_img_object_parse(optarg, 1);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -3409,12 +3329,6 @@ static int img_snapshot(int argc, char **argv)
     }
     filename = argv[optind++];
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        return 1;
-    }
-
     /* Open the image */
     blk = img_open(image_opts, filename, NULL, bdrv_oflags, false, quiet,
                    force_share);
@@ -3548,14 +3462,9 @@ static int img_rebase(int argc, char **argv)
         case 'q':
             quiet = true;
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *opts;
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                return 1;
-            }
-        }   break;
+        case OPTION_OBJECT:
+            qemu_img_object_parse(optarg, 1);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -3577,12 +3486,6 @@ static int img_rebase(int argc, char **argv)
     }
     filename = argv[optind++];
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        return 1;
-    }
-
     qemu_progress_init(progress, 2.0);
     qemu_progress_print(0, 100);
 
@@ -3973,14 +3876,9 @@ static int img_resize(int argc, char **argv)
         case 'q':
             quiet = true;
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *opts;
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                return 1;
-            }
-        }   break;
+        case OPTION_OBJECT:
+            qemu_img_object_parse(optarg, 1);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -4002,12 +3900,6 @@ static int img_resize(int argc, char **argv)
     }
     filename = argv[optind++];
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        return 1;
-    }
-
     /* Choose grow, shrink, or absolute resize mode */
     switch (size[0]) {
     case '+':
@@ -4187,12 +4079,7 @@ static int img_amend(int argc, char **argv)
             quiet = true;
             break;
         case OPTION_OBJECT:
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                ret = -1;
-                goto out_no_progress;
-            }
+            qemu_img_object_parse(optarg, 1);
             break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
@@ -4207,13 +4094,6 @@ static int img_amend(int argc, char **argv)
         error_exit("Must specify options (-o)");
     }
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        ret = -1;
-        goto out_no_progress;
-    }
-
     if (quiet) {
         progress = false;
     }
@@ -4672,7 +4552,6 @@ static int img_bitmap(int argc, char **argv)
 {
     Error *err = NULL;
     int c, ret = 1;
-    QemuOpts *opts = NULL;
     const char *fmt = NULL, *src_fmt = NULL, *src_filename = NULL;
     const char *filename, *bitmap;
     BlockBackend *blk = NULL, *src = NULL;
@@ -4766,10 +4645,7 @@ static int img_bitmap(int argc, char **argv)
             merge = true;
             break;
         case OPTION_OBJECT:
-            opts = qemu_opts_parse_noisily(&qemu_object_opts, optarg, true);
-            if (!opts) {
-                goto out;
-            }
+            qemu_img_object_parse(optarg, 1);
             break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
@@ -4777,12 +4653,6 @@ static int img_bitmap(int argc, char **argv)
         }
     }
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        goto out;
-    }
-
     if (QSIMPLEQ_EMPTY(&actions)) {
         error_report("Need at least one of --add, --remove, --clear, "
                      "--enable, --disable, or --merge");
@@ -4878,7 +4748,6 @@ static int img_bitmap(int argc, char **argv)
  out:
     blk_unref(src);
     blk_unref(blk);
-    qemu_opts_del(opts);
     return ret;
 }
 
@@ -5040,10 +4909,7 @@ static int img_dd(int argc, char **argv)
             force_share = true;
             break;
         case OPTION_OBJECT:
-            if (!qemu_opts_parse_noisily(&qemu_object_opts, optarg, true)) {
-                ret = -1;
-                goto out;
-            }
+            qemu_img_object_parse(optarg, 1);
             break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
@@ -5090,13 +4956,6 @@ static int img_dd(int argc, char **argv)
         goto out;
     }
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        ret = -1;
-        goto out;
-    }
-
     blk1 = img_open(image_opts, in.filename, fmt, 0, false, false,
                     force_share);
 
@@ -5272,7 +5131,6 @@ static int img_measure(int argc, char **argv)
     char *snapshot_name = NULL;
     bool force_share = false;
     QemuOpts *opts = NULL;
-    QemuOpts *object_opts = NULL;
     QemuOpts *sn_opts = NULL;
     QemuOptsList *create_opts = NULL;
     bool image_opts = false;
@@ -5317,11 +5175,7 @@ static int img_measure(int argc, char **argv)
             force_share = true;
             break;
         case OPTION_OBJECT:
-            object_opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                                  optarg, true);
-            if (!object_opts) {
-                goto out;
-            }
+            qemu_img_object_parse(optarg, 1);
             break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
@@ -5351,12 +5205,6 @@ static int img_measure(int argc, char **argv)
         }
     }
 
-    if (qemu_opts_foreach(&qemu_object_opts,
-                          user_creatable_add_opts_foreach,
-                          qemu_img_object_print_help, &error_fatal)) {
-        goto out;
-    }
-
     if (argc - optind > 1) {
         error_report("At most one filename argument is allowed.");
         goto out;
@@ -5444,7 +5292,6 @@ static int img_measure(int argc, char **argv)
 
 out:
     qapi_free_BlockMeasureInfo(info);
-    qemu_opts_del(object_opts);
     qemu_opts_del(opts);
     qemu_opts_del(sn_opts);
     qemu_opts_free(create_opts);
@@ -5496,7 +5343,6 @@ int main(int argc, char **argv)
         error_exit("Not enough arguments");
     }
 
-    qemu_add_opts(&qemu_object_opts);
     qemu_add_opts(&qemu_source_opts);
     qemu_add_opts(&qemu_trace_opts);
 
-- 
2.26.2



