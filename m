Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CEC13A2EC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 09:24:18 +0100 (CET)
Received: from localhost ([::1]:34398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irHUn-0003rg-6S
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 03:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48263)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1irHT2-00021x-8X
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 03:22:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1irHT1-0006lL-6K
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 03:22:28 -0500
Received: from relay.sw.ru ([185.231.240.75]:36834)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1irHSy-0006jl-Ij; Tue, 14 Jan 2020 03:22:24 -0500
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1irHSs-0005Ix-1G; Tue, 14 Jan 2020 11:22:18 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/3] qemu-img: sort key options alphabetically
Date: Tue, 14 Jan 2020 11:22:16 +0300
Message-Id: <1578990137-308222-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578990137-308222-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1578990137-308222-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Put qemu-img key options in the alphabetical order in the code
for a faster finding.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 qemu-img.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 6233b8c..c86f760 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -703,7 +703,7 @@ static int img_check(int argc, char **argv)
             {"force-share", no_argument, 0, 'U'},
             {0, 0, 0, 0}
         };
-        c = getopt_long(argc, argv, ":hf:r:T:qU",
+        c = getopt_long(argc, argv, ":f:hqr:T:U",
                         long_options, &option_index);
         if (c == -1) {
             break;
@@ -715,11 +715,14 @@ static int img_check(int argc, char **argv)
         case '?':
             unrecognized_option(argv[optind - 1]);
             break;
+        case 'f':
+            fmt = optarg;
+            break;
         case 'h':
             help();
             break;
-        case 'f':
-            fmt = optarg;
+        case 'q':
+            quiet = true;
             break;
         case 'r':
             flags |= BDRV_O_RDWR;
@@ -733,18 +736,15 @@ static int img_check(int argc, char **argv)
                            "(expecting 'leaks' or 'all'): %s", optarg);
             }
             break;
-        case OPTION_OUTPUT:
-            output = optarg;
-            break;
         case 'T':
             cache = optarg;
             break;
-        case 'q':
-            quiet = true;
-            break;
         case 'U':
             force_share = true;
             break;
+        case OPTION_IMAGE_OPTS:
+            image_opts = true;
+            break;
         case OPTION_OBJECT: {
             QemuOpts *opts;
             opts = qemu_opts_parse_noisily(&qemu_object_opts,
@@ -753,8 +753,8 @@ static int img_check(int argc, char **argv)
                 return 1;
             }
         }   break;
-        case OPTION_IMAGE_OPTS:
-            image_opts = true;
+        case OPTION_OUTPUT:
+            output = optarg;
             break;
         }
     }
-- 
1.8.3.1


