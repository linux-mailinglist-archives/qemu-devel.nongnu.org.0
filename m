Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5B12B1B86
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:03:13 +0100 (CET)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYjP-0007dw-Ji
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYfe-0005t9-FJ; Fri, 13 Nov 2020 07:59:18 -0500
Received: from mail-eopbgr30096.outbound.protection.outlook.com
 ([40.107.3.96]:46759 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYfa-0004BU-TS; Fri, 13 Nov 2020 07:59:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ygbxmty3psZgzC6UpAHhQZ8lJL4lUpOEM7+uWx/AWSduUG43UcfrXiG+lOeZE6KpmZmQuRZZrOS9VgMmRXZ37lZy9WBQrBRQUN9TIkNrn4Tlu5zqEBr90H6BJg6I0mJUGsyATfyq/l9DHa16CETZfpKgNGhB81Ln0v6w+PgTgcbsEX+IW6yxNYJ55Dv6hAZOtz2ogwSYzYnsRIW3juImUZ8N8MCnsD3P+QlUvoqPSd41Z4qLJDnVJlUPY2Q8axPM8FXXcJYzFeJXSm0CAUmnD4x17i9H/2sYhprTFJwyLorsiDEhW0rnB+7uYB9eSOUR0AbqZjR1qy3rOKqp/GT3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADlE8/px6cBT4XRKDs2ClbGzDrRuSQn80zvDsvZcYgs=;
 b=dEM8nlFOpZHBmNdLsPMyp3hW8H62JWkDj5Ma6N92sums909hC2NbJ/AbI86N3ozm2wl8/KSTzPs4No9jOEAsOwDDQXPAcmNS3ESQ8SEcf+bJI3tB+K7zL9AaDyU5KqejZUlOnDO18om377LZPIweyxFXkkO9LskC1yK4TjYw2SM1DhNCRQP0Idpc5KP/2UAZWujW73o28U8FTLp1fAj1qO9bHypcQjLFwK7yFzS7Z5uqRpiKjByxUgbrRzr82YwNKITXZXwC3JpKcsV3jFSK2bWnGS9pCXfcWBS1zYVYWLHHX+mcd2YB6/Fuli6bVzbdjTY0n5Yg1QkqhXVo04huEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADlE8/px6cBT4XRKDs2ClbGzDrRuSQn80zvDsvZcYgs=;
 b=gsX0gH+tggtXfzy9UjACeYT+4/54qb5BSNsHQ4d5URM1sczxDy7HotZArXNh1/rlW3vbW/hK7+QqaLSLPlC4M3f8Ic124Z+5UMO7k1VGD/vMgN6smCjhO08liLDkyBGhlOatSceU1cNj6Js8xtnsHmMDHPJ7PzjKXDCNQVq8FlY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 12:59:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 12:59:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 dautovri@hpcdlab.com
Subject: [PATCH 1/5] block/prl-xml: add Parallels xml BlockDriver
Date: Fri, 13 Nov 2020 15:58:44 +0300
Message-Id: <20201113125848.20498-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201113125848.20498-1-vsementsov@virtuozzo.com>
References: <20201113125848.20498-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.71]
X-ClientProxiedBy: AM4PR0902CA0003.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.71) by
 AM4PR0902CA0003.eurprd09.prod.outlook.com (2603:10a6:200:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 12:59:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8c0b31a-7b59-4f06-3231-08d887d3e63a
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB58771EF8295BA3FEA7F41727C1E60@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C9gbJM1MERNz0p9NSObEbF8zieVA2UYrDDpgbWBl7KLM+9iz9SNLb1EaZExt00BrdBItgTzzzAJpeZc0Vprsw/Oe5vOK4yZl5dmdrqX8KfI5JaflgVU7/4TB9CQHBrwjE0KBayCcEdkId7LLdrV6XPtOmA+6s9gbzqgc+HfIAa0s5X8w9GvQZb+aZvbhBQ7LZn5r0bk2YsYGxXqXMJj2OFOsSF6FBgtSOTruE9vVpQ2sgeruHNlRBcnnQnGVc4Uz/WYmmZQbbg0HJUYaEpyA0LVCh+Sb8N7jP9t7kt/4COux+L0knxED+498N0ER17bNaiWuzSi1D7YSt8y+09Xmlbwe8fDIaUxIZ4ig3Of77rtVaaesUF9Z+VwYCM2y1UdaVrLeMyrw3tPQKvgbjtkkCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(66476007)(6916009)(26005)(83380400001)(30864003)(8676002)(478600001)(52116002)(6506007)(86362001)(956004)(2616005)(66556008)(8936002)(1076003)(5660300002)(316002)(66946007)(16526019)(2906002)(186003)(6666004)(4326008)(6486002)(966005)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: gbaEg5bSb8FGTNuVOpfrNwDdaA2tidkPpGCtF/BzeloWLiGFa48q8NqT6cgrbGL+rJVxZiIZ70qqLIHV2Rf/H1XgLqehKmhvBQGdDtiD29zALnVVK17SsyTYUM9QF5jsML/DDJQylUvagUME6CXMrP9hdEBPyh0Wtu+9Bf4IPG9/Qhiy6ApL77iWLG1UKFXEcHkM919JkSKhklic4QMKvyd5XQh9/DEjqG0hfwq8Pfbl8KPd48qtInwdDdVFLG2hjdtA+WgP+q4jiAfGZzE+NPcCXjOdch6MMEIOAsMm3xatIaECWBzf/k1zzKVH8MF/IDpe1HkEOfABKTZE1lWw3gZfG2SO/4M5D45kkq35biC7CpPkrk23WZVS4MJOqnoW3KJa5O8GrVkBd8bSR81ejEp+xVCbINBki9JaVBucsbPZ9+AcmMOp+oXkXmrNVniWgFFdfEsPGXur+xpqJ/WKZuOFD2diALNVx1zVYIbKUU68KpkTtG75jUBFp5WtKNv0lQdDjcybXet0LVjZEpakqBujSipXOcpWOiTtsh89zjdUxy5QcYfJIOcxpHfE3ALbnlHuxb1rzf5GnOKpEzJEHfbBxDf5CubUy+c8wjOGJvFhhOOIuhmRJkotRo9JKOssd93JACMht2gI2+r/gIcDWg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c0b31a-7b59-4f06-3231-08d887d3e63a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 12:59:04.5707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dxs+2IKmmzsJPb+ieXNJ9o2Y/Yfiaf4SN4B7ESc5CFOyWtXmxoy2K8eCki7p4atdQ2alG9hnp5qy6DF7CU/o4hoT8NdTmInsx43ois9Fr3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.3.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 07:59:13
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klim Kireev <klim.kireev@virtuozzo.com>

This patch introduces new BlockDriver: prl-xml.
It adds opening and closing capabilities.
All operations are performed using libxml2.

Signed-off-by: Klim Kireev <klim.kireev@virtuozzo.com>
---
 block/prl-xml.c     | 492 ++++++++++++++++++++++++++++++++++++++++++++
 block/Makefile.objs |   5 +-
 2 files changed, 495 insertions(+), 2 deletions(-)
 create mode 100644 block/prl-xml.c

diff --git a/block/prl-xml.c b/block/prl-xml.c
new file mode 100644
index 0000000000..fa9c4fd5fa
--- /dev/null
+++ b/block/prl-xml.c
@@ -0,0 +1,492 @@
+/*
+* Block driver for Parallels disk image format
+* Copyright (c) 2015-2017, Virtuozzo, Inc.
+* Authors:
+*       2016-2017 Klim S. Kireev <klim.kireev@virtuozzo.com>
+*       2015 Denis V. Lunev <den@openvz.org>
+*
+* This code was originally based on comparing different disk images created
+* by Parallels. Currently it is based on opened OpenVZ sources
+* available at
+*     https://github.com/OpenVZ/ploop
+*
+* Permission is hereby granted, free of charge, to any person obtaining a copy
+* of this software and associated documentation files (the "Software"), to deal
+* in the Software without restriction, including without limitation the rights
+* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+* copies of the Software, and to permit persons to whom the Software is
+* furnished to do so, subject to the following conditions:
+*
+* The above copyright notice and this permission notice shall be included in
+* all copies or substantial portions of the Software.
+*
+* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+* THE SOFTWARE.
+*/
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "block/block_int.h"
+#include "qemu/uuid.h"
+#include "qemu/cutils.h"
+#include "qemu/option.h"
+#include "qapi/qmp/qdict.h"
+
+#include <libxml/parser.h>
+
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE
+#endif
+#include <string.h> /* For basename */
+
+#define DEF_TOP_SNAPSHOT "5fbaabe3-6958-40ff-92a7-860e329aab41"
+#define GUID_LEN strlen(DEF_TOP_SNAPSHOT)
+#define PRL_XML_FILENAME "DiskDescriptor.xml"
+
+typedef struct BDRVPrlXmlState {
+    xmlDoc *xml;
+    BdrvChild *image;
+} BDRVPrlXmlState;
+
+enum TopSnapMode {
+    ERROR_MODE = -1,
+    NODE_MODE,
+    GUID_MODE
+};
+
+static QemuOptsList prl_xml_create_opts = {
+    .name = "prl-xml-create-opts",
+    .head = QTAILQ_HEAD_INITIALIZER(prl_xml_create_opts.head),
+    .desc = {
+        {
+            .name = BLOCK_OPT_SIZE,
+            .type = QEMU_OPT_SIZE,
+            .help = "Virtual disk size",
+        },
+        {
+            .name = BLOCK_OPT_CLUSTER_SIZE,
+            .type = QEMU_OPT_SIZE,
+            .help = "Parallels XML back image cluster size",
+            .def_value_str = stringify(DEFAULT_CLUSTER_SIZE),
+        },
+        { /* end of list */ }
+    }
+};
+
+static xmlNodePtr xml_find_element_child(xmlNodePtr node, const char *elem)
+{
+    xmlNodePtr child;
+
+    for (child = node->xmlChildrenNode; child != NULL; child = child->next) {
+        if (child->type == XML_ELEMENT_NODE &&
+            !xmlStrcmp(child->name, (const xmlChar *)elem))
+        {
+            return child;
+        }
+    }
+    return NULL;
+}
+
+static xmlNodePtr xml_seek_va(xmlNodePtr root, va_list args)
+{
+    const char *elem;
+
+    while ((elem = va_arg(args, const char *)) != NULL) {
+        root = xml_find_element_child(root, elem);
+        if (root == NULL) {
+            return NULL;
+        }
+    }
+    return root;
+}
+
+static xmlNodePtr xml_seek(xmlNodePtr root, ...)
+{
+    va_list args;
+    va_start(args, root);
+    root = xml_seek_va(root, args);
+    va_end(args);
+    return root;
+}
+
+static const char *xml_get_text(xmlNodePtr node, ...)
+{
+    xmlNodePtr child;
+    va_list args;
+
+    if (node == NULL) {
+        return NULL;
+    }
+
+    va_start(args, node);
+    node = xml_seek_va(node, args);
+    va_end(args);
+
+    if (node == NULL) {
+        return NULL;
+    }
+
+    for (child = node->xmlChildrenNode; child; child = child->next) {
+        if (child->type == XML_TEXT_NODE) {
+            return (const char *)child->content;
+        }
+    }
+    return NULL;
+}
+
+static inline int get_addr_mode(xmlDocPtr doc)
+{
+    xmlNodePtr root = xmlDocGetRootElement(doc);
+    if (root == NULL) {
+        return ERROR_MODE;
+    }
+
+    xmlNodePtr cur = xml_seek(root, "Snapshots", "TopGUID", NULL);
+    if (cur == NULL) {
+        return GUID_MODE;
+    } else {
+        return NODE_MODE;
+    }
+};
+
+static int xml_check(xmlNodePtr root, Error **errp)
+{
+    xmlNodePtr image;
+    const char *data;
+
+    data = (const char *)xmlGetProp(root, (const xmlChar *)"Version");
+    if (data == NULL) {
+        error_setg(errp, "There is no version attribute in xml root");
+        return -EINVAL;
+    }
+
+    if (strcmp(data, "1.0") != 0) {
+        error_setg(errp, "Format versions differing from 1.0 are unsupported");
+        return -ENOTSUP;
+    }
+
+    image = xml_seek(root, "StorageData", "Storage", "Image", NULL);
+    if (image == NULL) {
+        error_setg(errp, "There is no image nodes in xml");
+        return -EINVAL;
+    }
+    while (image != NULL) {
+        data = ""; /* make gcc happy */
+        if (image->type != XML_ELEMENT_NODE) {
+            image = image->next;
+            continue;
+        }
+
+        data = xml_get_text(image, "Type", NULL);
+        if (data == NULL) {
+            error_setg(errp, "There is no type node in xml");
+            return -EINVAL;
+        }
+
+        if (strcmp(data, "Plain") == 0) {
+            error_setg(errp, "Plain Parallels images are unsupported");
+            return -ENOTSUP;
+        }
+
+        if (strcmp(data, "Compressed") != 0) {
+            error_setg(errp, "Invalid value of type node: %s", data);
+            return -EINVAL;
+        }
+
+        data = xml_get_text(image, "File", NULL);
+        if (data == NULL) {
+            error_setg(errp, "Invalid image xml node");
+            return -EINVAL;
+        }
+        image = image->next;
+    }
+
+    image = xml_seek(root, "Snapshots", "Shot", NULL);
+    if (image == NULL) {
+        error_setg(errp, "There is no snapshots in xml");
+        return -EINVAL;
+    }
+    while (image != NULL) {
+        data = ""; /* make gcc happy */
+        if (image->type != XML_ELEMENT_NODE) {
+            image = image->next;
+            continue;
+        }
+
+        data = xml_get_text(image, "ParentGUID", NULL);
+        if (data == NULL) {
+            error_setg(errp, "There is no ParentGUID node in Snapshot");
+            return -EINVAL;
+        }
+
+        data = xml_get_text(image, "GUID", NULL);
+        if (data == NULL) {
+            error_setg(errp, "There is no GUID node in Snapshot");
+            return -EINVAL;
+        }
+
+        image = image->next;
+    }
+
+    return 0;
+}
+
+static xmlNodePtr uuid_seek(xmlNodePtr node, const char *uuid)
+{
+    while (node != NULL) {
+        const char *cur_uuid;
+        if (node->type != XML_ELEMENT_NODE) {
+            node = node->next;
+            continue;
+        }
+        cur_uuid = xml_get_text(node, "GUID", NULL);
+        if (cur_uuid == NULL) {
+            return NULL;
+        }
+        if (strcmp(uuid, cur_uuid) == 0) {
+            return node;
+        }
+        node = node->next;
+    }
+
+    return NULL;
+}
+
+static xmlNodePtr uuid_image_seek(xmlNodePtr root, const char *uuid)
+{
+    if (uuid == NULL) {
+        return NULL;
+    }
+
+    xmlNodePtr image = xml_seek(root, "StorageData", "Storage", "Image", NULL);
+
+    return uuid_seek(image, uuid);
+}
+
+static xmlNodePtr uuid_snap_seek(xmlNodePtr root, const char *uuid)
+{
+    if (uuid == NULL) {
+        return NULL;
+    }
+
+    xmlNodePtr snap = xml_seek(root, "Snapshots", "Shot", NULL);
+
+    return uuid_seek(snap, uuid);
+}
+
+static inline xmlNodePtr get_parent_snap(xmlNodePtr root, xmlNodePtr snap)
+{
+    const char *uuid = xml_get_text(snap, "ParentGUID", NULL);
+    if (uuid && strcmp(uuid, "{"UUID_NONE"}") == 0) {
+        return NULL;
+    }
+
+    return uuid_snap_seek(root, uuid);
+}
+
+static inline xmlNodePtr snap2image(xmlNodePtr root, xmlNodePtr snap)
+{
+    const char *uuid = xml_get_text(snap, "GUID", NULL);
+    return uuid_image_seek(root, uuid);
+}
+
+static inline xmlNodePtr image2snap(xmlNodePtr root, xmlNodePtr image)
+{
+    const char *uuid = xml_get_text(image, "GUID", NULL);
+    return uuid_snap_seek(root, uuid);
+}
+
+static int snap_open_xml(BlockDriverState *bs, xmlNodePtr snap,
+                         QDict *opts, Error **errp)
+{
+    BDRVPrlXmlState *s = bs->opaque;
+    BlockDriverState *last_bs = s->image->bs;
+    int ret = 0;
+    const char *filename = NULL;
+    size_t len = 0;
+    xmlNodePtr root = xmlDocGetRootElement(s->xml);
+    xmlNodePtr image = snap2image(root, snap);
+
+    if (image == NULL) {
+        error_setg(errp, "Incorrent xml");
+        return -EINVAL;
+    }
+    filename = xml_get_text(image, "File", NULL);
+    if (filename == NULL) {
+        error_setg(errp, "Incorrent xml");
+        return -EINVAL;
+    }
+
+    while (last_bs->backing != NULL) {
+        last_bs = last_bs->backing->bs;
+    }
+
+    len = strlen(filename);
+    if (len > sizeof(last_bs->backing_file)) {
+        error_setg(errp, "Incorrent filename %s", filename);
+        return -EINVAL;
+    }
+    pstrcpy(last_bs->backing_file, sizeof(last_bs->backing_file),
+            filename);
+
+    assert(strlen("parallels") < sizeof(last_bs->backing_format));
+    pstrcpy(last_bs->backing_format, sizeof(last_bs->backing_format),
+            "parallels");
+    ret = bdrv_open_backing_file(last_bs, NULL, "backing", errp);
+    return ret;
+}
+
+static int first_open_xml(BlockDriverState *bs, xmlNodePtr snap,
+                          QDict *opts, Error **errp)
+{
+    char image_path[PATH_MAX] = {};
+    BDRVPrlXmlState *s = bs->opaque;
+    xmlNodePtr root = xmlDocGetRootElement(s->xml);
+    xmlNodePtr image = snap2image(root, snap);
+    if (image == NULL) {
+        error_setg(errp, "Incorrent xml");
+        return -EINVAL;
+    }
+    const char *filename = xml_get_text(image, "File", NULL);
+    if (s->image != NULL) {
+        return -EINVAL;
+    }
+    path_combine(image_path, sizeof(image_path),
+                 bs->filename, filename);
+    qdict_del(opts, "file");
+    s->image = bdrv_open_child(image_path, opts, "image", bs,
+                               &child_format, false, errp);
+    if (s->image == NULL) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static int64_t prl_xml_get_length(xmlNodePtr root)
+{
+    const char *data;
+    int64_t ret;
+
+    data = xml_get_text(root, "Disk_Parameters", "Disk_size", NULL);
+    if (data == NULL) {
+        return -EINVAL;
+    } else {
+        const char *endptr;
+        qemu_strtoi64(data, &endptr, 0, &ret);
+        if (*endptr != '\0') {
+            return -EINVAL;
+        }
+    }
+
+    return ret;
+}
+
+static int prl_open_xml(BlockDriverState *bs, QDict *opts, int flags,
+                        Error **errp)
+{
+    int ret = -EINVAL, snap_mode;
+    xmlDoc *doc = NULL;
+    xmlNodePtr root;
+    xmlNodePtr snap;
+    BDRVPrlXmlState *s = bs->opaque;
+
+    if (strcmp(basename(bs->filename), PRL_XML_FILENAME) != 0) {
+        error_setg(errp, "Invalid xml name");
+        goto fail;
+    }
+
+    doc = xmlReadFile(bs->filename, NULL, XML_PARSE_NOERROR |
+                                          XML_PARSE_NOWARNING);
+
+    if (doc == NULL) {
+        error_setg(errp, "Can't open xml");
+        goto fail;
+    }
+
+    s->xml = doc;
+    root = xmlDocGetRootElement(doc);
+    if (root == NULL) {
+        ret = -EINVAL;
+        error_setg(errp, "Invalid xml");
+        goto fail;
+    }
+
+    ret = xml_check(root, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
+    bs->total_sectors = prl_xml_get_length(root);
+    if (bs->total_sectors < 0) {
+        ret = -EINVAL;
+        error_setg(errp, "Invalid xml");
+        goto fail;
+    }
+
+    snap_mode = get_addr_mode(doc);
+    if (snap_mode == ERROR_MODE) {
+        ret = -EINVAL;
+        error_setg(errp, "Can't determine an address mode");
+        goto fail;
+    }
+    if (snap_mode == NODE_MODE) {
+        ret = -ENOTSUP;
+        error_setg(errp, "The node addressing mode is unsupported now");
+        goto fail;
+    }
+
+    snap = uuid_snap_seek(root, "{"DEF_TOP_SNAPSHOT"}");
+    if (snap == NULL) {
+        ret = -EINVAL;
+        error_setg(errp, "Can't find top image");
+        goto fail;
+    }
+    ret = first_open_xml(bs, snap, opts, errp);
+    if (ret < 0) {
+        error_append_hint(errp, "Can't open top image\n");
+        goto fail;
+    }
+
+    snap = get_parent_snap(root, snap);
+    while (snap != NULL) {
+        ret = snap_open_xml(bs, snap, opts, errp);
+        if (ret < 0) {
+            error_append_hint(errp, "Can't open image\n");
+            goto fail;
+        }
+        snap = get_parent_snap(root, snap);
+    }
+
+    return 0;
+fail:
+    xmlFreeDoc(doc);
+    return ret;
+}
+
+static void prl_close_xml(BlockDriverState *bs)
+{
+    BDRVPrlXmlState *s = bs->opaque;
+    bdrv_unref_child(bs, s->image);
+    xmlFreeDoc(s->xml);
+}
+
+static BlockDriver bdrv_prl_xml = {
+    .format_name                = "prl-xml",
+    .instance_size              = sizeof(BDRVPrlXmlState),
+    .bdrv_open                  = prl_open_xml,
+    .bdrv_close                 = prl_close_xml,
+    .create_opts                = &prl_xml_create_opts,
+    .bdrv_child_perm            = bdrv_filter_default_perms,
+    .is_filter                  = true
+};
+
+static void bdrv_prl_init_xml(void)
+{
+    bdrv_register(&bdrv_prl_xml);
+}
+
+block_init(bdrv_prl_init_xml);
diff --git a/block/Makefile.objs b/block/Makefile.objs
index d644bac60a..df146c77fa 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -6,6 +6,7 @@ block-obj-y += vhdx.o vhdx-endian.o vhdx-log.o
 block-obj-y += quorum.o
 block-obj-y += parallels.o blkdebug.o blkverify.o blkreplay.o
 block-obj-y += block-backend.o snapshot.o qapi.o
+block-obj-$(CONFIG_LIBXML2) += prl-xml.o
 block-obj-$(CONFIG_WIN32) += file-win32.o win32-aio.o
 block-obj-$(CONFIG_POSIX) += file-posix.o
 block-obj-$(CONFIG_LINUX_AIO) += linux-aio.o
@@ -48,5 +49,5 @@ block-obj-$(if $(CONFIG_BZIP2),m,n) += dmg-bz2.o
 dmg-bz2.o-libs     := $(BZIP2_LIBS)
 qcow.o-libs        := -lz
 linux-aio.o-libs   := -laio
-parallels.o-cflags := $(LIBXML2_CFLAGS)
-parallels.o-libs   := $(LIBXML2_LIBS)
+prl-xml.o-cflags := $(LIBXML2_CFLAGS)
+prl-xml.o-libs   := $(LIBXML2_LIBS)
-- 
2.21.3


