Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83938323F60
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:10:29 +0100 (CET)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvo4-00058C-Fx
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvR8-0002li-7E
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvR5-0003oS-Lp
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614178002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LbhhiiNIlKIsm1gnhOQmAJPYmOj0Sf+sYClgkW38Lo=;
 b=Tjy1fj0U/x1b6DXBWN4lAQvdhIwIHVx3iG0wIm6mUWDgTiJi8cUqJZn2J4tKe2z7/LCDkT
 hrV9A/tKMIQNVqF4M7fzOSk0HQl2ky4oAGYCHasqKHrkjFZhqjvxFlnYwZCIsZ5Lf1hRCN
 +rX+7SEgtBO+JGhBfDSd5XxTlS+U45Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-P2vc4KxuM9CoEXTseuvVyw-1; Wed, 24 Feb 2021 09:46:40 -0500
X-MC-Unique: P2vc4KxuM9CoEXTseuvVyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF2D5134C4D;
 Wed, 24 Feb 2021 13:56:19 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E99755D6AD;
 Wed, 24 Feb 2021 13:56:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/31] qemu-img: Use user_creatable_process_cmdline() for
 --object
Date: Wed, 24 Feb 2021 14:52:49 +0100
Message-Id: <20210224135255.253837-26-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This switches qemu-img from a QemuOpts-based parser for --object to
user_creatable_process_cmdline() which uses a keyval parser and enforces
the QAPI schema.

Apart from being a cleanup, this makes non-scalar properties accessible.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-img.c | 239 ++++++++---------------------------------------------
 1 file changed, 33 insertions(+), 206 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index e2952fe955..ebf8661e2a 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -226,23 +226,6 @@ static void QEMU_NORETURN help(void)
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
-{
-    if (user_creatable_print_help(type, opts)) {
-        exit(0);
-    }
-    return true;
-}
-
 /*
  * Is @optarg safe for accumulate_options()?
  * It is when multiple of them can be joined together separated by ','.
@@ -566,14 +549,9 @@ static int img_create(int argc, char **argv)
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
+            user_creatable_process_cmdline(optarg);
+            break;
         }
     }
 
@@ -589,12 +567,6 @@ static int img_create(int argc, char **argv)
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
@@ -804,14 +776,9 @@ static int img_check(int argc, char **argv)
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
+            user_creatable_process_cmdline(optarg);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -831,12 +798,6 @@ static int img_check(int argc, char **argv)
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
@@ -1034,14 +995,9 @@ static int img_commit(int argc, char **argv)
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
+            user_creatable_process_cmdline(optarg);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -1058,12 +1014,6 @@ static int img_commit(int argc, char **argv)
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
@@ -1423,15 +1373,9 @@ static int img_compare(int argc, char **argv)
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
+            user_creatable_process_cmdline(optarg);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -1450,13 +1394,6 @@ static int img_compare(int argc, char **argv)
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
 
@@ -1641,7 +1578,6 @@ out2:
     blk_unref(blk1);
 out3:
     qemu_progress_end();
-out4:
     return ret;
 }
 
@@ -2342,15 +2278,9 @@ static int img_convert(int argc, char **argv)
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
+            user_creatable_process_cmdline(optarg);
             break;
-        }
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -2378,12 +2308,6 @@ static int img_convert(int argc, char **argv)
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
@@ -2971,14 +2895,9 @@ static int img_info(int argc, char **argv)
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
+            user_creatable_process_cmdline(optarg);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -2998,12 +2917,6 @@ static int img_info(int argc, char **argv)
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
@@ -3213,14 +3126,9 @@ static int img_map(int argc, char **argv)
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
+            user_creatable_process_cmdline(optarg);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -3240,12 +3148,6 @@ static int img_map(int argc, char **argv)
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
@@ -3384,14 +3286,9 @@ static int img_snapshot(int argc, char **argv)
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
+            user_creatable_process_cmdline(optarg);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -3403,12 +3300,6 @@ static int img_snapshot(int argc, char **argv)
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
@@ -3542,14 +3433,9 @@ static int img_rebase(int argc, char **argv)
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
+            user_creatable_process_cmdline(optarg);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -3571,12 +3457,6 @@ static int img_rebase(int argc, char **argv)
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
 
@@ -3967,14 +3847,9 @@ static int img_resize(int argc, char **argv)
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
+            user_creatable_process_cmdline(optarg);
+            break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
@@ -3996,12 +3871,6 @@ static int img_resize(int argc, char **argv)
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
@@ -4181,12 +4050,7 @@ static int img_amend(int argc, char **argv)
             quiet = true;
             break;
         case OPTION_OBJECT:
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                ret = -1;
-                goto out_no_progress;
-            }
+            user_creatable_process_cmdline(optarg);
             break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
@@ -4201,13 +4065,6 @@ static int img_amend(int argc, char **argv)
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
@@ -4760,10 +4617,7 @@ static int img_bitmap(int argc, char **argv)
             merge = true;
             break;
         case OPTION_OBJECT:
-            opts = qemu_opts_parse_noisily(&qemu_object_opts, optarg, true);
-            if (!opts) {
-                goto out;
-            }
+            user_creatable_process_cmdline(optarg);
             break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
@@ -4771,12 +4625,6 @@ static int img_bitmap(int argc, char **argv)
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
@@ -5034,10 +4882,7 @@ static int img_dd(int argc, char **argv)
             force_share = true;
             break;
         case OPTION_OBJECT:
-            if (!qemu_opts_parse_noisily(&qemu_object_opts, optarg, true)) {
-                ret = -1;
-                goto out;
-            }
+            user_creatable_process_cmdline(optarg);
             break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
@@ -5084,13 +4929,6 @@ static int img_dd(int argc, char **argv)
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
 
@@ -5311,11 +5149,7 @@ static int img_measure(int argc, char **argv)
             force_share = true;
             break;
         case OPTION_OBJECT:
-            object_opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                                  optarg, true);
-            if (!object_opts) {
-                goto out;
-            }
+            user_creatable_process_cmdline(optarg);
             break;
         case OPTION_IMAGE_OPTS:
             image_opts = true;
@@ -5345,12 +5179,6 @@ static int img_measure(int argc, char **argv)
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
@@ -5490,7 +5318,6 @@ int main(int argc, char **argv)
         error_exit("Not enough arguments");
     }
 
-    qemu_add_opts(&qemu_object_opts);
     qemu_add_opts(&qemu_source_opts);
     qemu_add_opts(&qemu_trace_opts);
 
-- 
2.29.2


