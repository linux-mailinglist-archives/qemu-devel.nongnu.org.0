Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E1349BE2D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:05:32 +0100 (CET)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCTwR-00087Z-NH
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:05:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToU-0000N2-Fg
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:19 -0500
Received: from mail-vi1eur05on2093.outbound.protection.outlook.com
 ([40.107.21.93]:28729 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToS-0002I2-Sp
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWnHTAbhcudap8Nlg54VoMt/0i+ISXjc5iRnPhE8SIg3dKw7VSG4ckVXEQ/NgDsfZN59BTMGQSKbBTbKsSxAeeaJTPKOT9phg7MZUKGmvXwUK8HDUHkz3t855nEEwA7Z9qAgpV7/AMX6ZOfRkzMXcNE1V1vKT+0XZz2iTs9G9kUSUPJ/s+0UvfHqI/KrDmYX7fB8X8jCnpN2yblFK3hREngxWO6V7ib7f4LqBzDk8TUORq6Y8DoKhX8olAPk4zJ7WZJUbDNZ+BHGmwMJUyU8JXo0RizKOv5pJiX2m6b7kcMLY6moK7U8Oy5e+8EUJ5AXxDdZxUUnEMxKC/u7cKIAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRTHyO+fl/HL+TkKMYwZEf2Aps2P3eZU8RX8CT6v93c=;
 b=d8JnwJlMOoVcxW8gfpw4pa7yOutxdbwp3y644D693uZeBhrKswX1j7tZGHnrbbyoA3un19L56jf1+ffOYeZcR7UGV20SLY4Wj7NbkvT9deR9WOmIMXhv4bH2FB0utjhylf4/eJRgG5yXw0aT8ZxtzK1qRIboEAfLmdIxu5O7vgOGTpBGXS+5yowUOlLIGhbDkrM3kFYqW2mkwpDqsF9Ac16O6DImNa5pjJPcjsWE6BxCNZxig6qBepvacGyZQlfiJeLqWO5hEMNIVYECr1kA8RX8v5eNrRH7Pen5PLomz4xbR8WwlhkITELXlihzsm37jqoY9c6s+jPVJiC7toE40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRTHyO+fl/HL+TkKMYwZEf2Aps2P3eZU8RX8CT6v93c=;
 b=uIkWTi2+1EH1M6nTUvhkxmUbOcX9PddcilAsRAgBAULLRYqFh9PdFfILhpbZSlehnEkpQcyMGZlkdusLAOGIpPyuTQ7woAcGAGn+fsXke5Epl1IXDpK0lkkYMnwuCbRzGMTsKc8NVUemOyhaiYh5pCJhCTo5tDsbOSb+fnFQC60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB2946.eurprd08.prod.outlook.com (2603:10a6:208:56::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 21:57:11 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 21:57:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v5 5/7] docs/qapi-code-gen: update to cover trace events code
 generation
Date: Tue, 25 Jan 2022 22:56:53 +0100
Message-Id: <20220125215655.3111881-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b67a3c50-605f-4578-1d21-08d9e04da379
X-MS-TrafficTypeDiagnostic: AM0PR08MB2946:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB2946922BA77B0E003D2259C1C15F9@AM0PR08MB2946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1w5mfhLGli9og1nKk76VUmNWIgvUbCLAe1A2LcQtF8rZ1OwWx2fR1KZog+RaxYRwpuW6uzrJQDQu0gcNmzSPF26ZoXxZZa21io9soUkdl7Ly4fRr16Un+3KWENwyV/VDbkP4rbvhbRsdC5fdormTiD/BslrUnyFpjCZ1+7OfKmWT3jduULJEX21enHzYs2hQnj/Hvrc2Hr7xgi6pT9RJVjMZ0QDvQ8xxtmZOskfrFfyrs11Q0fcmjGFsKh7Q2+LC1KV1gJByhnHKBbyIDUF7DZadBG2rP2g+9EoXhiUna6sj9ZThsfvI7bM2RqRAVrEJQK6T9bmxfofGOWpznzuvtYPq1W9CeFKq82CnJxK788qkBW39HMOXdECvrkZuMUu9SbxVBFucHIfYXWV2QExkPBChMdxfiFj+Tk44wmP0VshwK9013XhdQToUqyihtZbee/S9/IzhR8rOPTFcqqdQ3fQ3uCMcUAEOlECPvKcHlL0s2cY8lc66ARFBY+6N07Yhu1Qn+ckBvccGBI+fkXSvkBszTGQZ6MjVIRJ+4pNcvzaM4wF522Lo7TZAhfTbToNi5yA9i+1k0fKasB6k3KtUjItG9sgKpQxmJgiBiHJYGDQAYplksrbwq3bzZruV4QN7UUUIrK9t46wxuUBNIEtHjic6T5wiHr8x1di+4WsmdI4vBe94pT91ASs34cBpMS1flDBvAWv+o074oGPtHRzNLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(508600001)(6916009)(66556008)(6506007)(66476007)(8936002)(186003)(36756003)(2616005)(52116002)(4326008)(83380400001)(6512007)(1076003)(38350700002)(5660300002)(6486002)(8676002)(38100700002)(15650500001)(316002)(86362001)(6666004)(2906002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?guuqTeB8b9nq4WiItDbgQBu+fIELT+76qpGgFSDlnNue5Yy36vMQXOrWj3V/?=
 =?us-ascii?Q?Itc3BTQHKGPpxUqZd3QJZqh+KxxZ0n5ct7JD5O7AR0eX/mjJJC6P4jha3Ef0?=
 =?us-ascii?Q?L9jg2T/CDZ4vC+n4cBMjnknHOb84v+m0IG3qXFJoRGSC7cxKS5DzURqjHdue?=
 =?us-ascii?Q?wUt4KYhDH5kAHhicGTzXfG9JIQib9pXap+K3cZhmpBVkj4pYdhv/Vyc5serE?=
 =?us-ascii?Q?5TL4qP3LEGMj/T3JiMI08Wf0q+p+GpZe7D6oUH/M9EEZYylP0FI8rcydee/Z?=
 =?us-ascii?Q?JN/nwqm0ZcqMLTAMqYQFE+jXvD5WxgpRili1SK31xvEkWsIYADOKZNWjbo9Y?=
 =?us-ascii?Q?1ukfVFaIw5Va5DHhapAQlA33by6TxgxZMLxcQ/2WLTCy3M6xKxUV5gXLwEj+?=
 =?us-ascii?Q?/ABu4fScEz/YAMmPES/gY1FN+SnL3nVj2h27dgaJIhq0rOKHYwtNjGY7yPdK?=
 =?us-ascii?Q?Azxi0v3GTMDquRRZTA0RrCiZH+agdt4FWKyDrP8egH+cXVnRcxCI63DQcU75?=
 =?us-ascii?Q?rIgeAojRU90qwIpmpXnerL+lzr7rigg+ENCY6Br7QZb5FtYsl0cTG3BCfgAr?=
 =?us-ascii?Q?2o87PYmd3txIxIPx5roDE7BovJZdTg/SiYCbQ9B3vvPwY07AMa8GdaEPyRvJ?=
 =?us-ascii?Q?fn2DYCj1PmYKDZWzliyZRUWCOcNxAeMx+wtF9ke2cYOvenI2mZiL9fgespb1?=
 =?us-ascii?Q?wMbZb95Q8nlkRwo0WItJ7S+fFjBHFhSyITxq7jlJrvfW1Y4mV5m1Wfla0hYg?=
 =?us-ascii?Q?sv7ZXlaERB/ewZhQ1pJMQISJJB0/hENBhbIA5VypztpltKrxEOq55Zgs0/DN?=
 =?us-ascii?Q?ZuCzQxIkKWR5iyz6Qyzacemosmllnr0y4N45b/m/XBUviMZB57VZZ9ubHPyP?=
 =?us-ascii?Q?lxgbQEz2A8SbbqLRiBRnBRI/vCwDB4pPvvIQKZKO/ajM3URuaMWGcRdxN8IL?=
 =?us-ascii?Q?9Vu5S1+6T5vE3u1PdYw6iEJOZd7P5VsrxOQJBfiQTX9l+W1ZzqdaVFORlFic?=
 =?us-ascii?Q?OgBmY2qdyy4/PTQ7N34IPUyGQWm2hPtrfnSsTWJfi9fwFiRoLeOD84sjIWzi?=
 =?us-ascii?Q?/IFKJgkkH+ruNIIxb7pw6rlFgu/53AqiKdNN3a/UAEg1ireiggK90gcQkHkL?=
 =?us-ascii?Q?pwsLWsd+XZik4LUhC8Qi9Xj/UxLQGRYx7gFxADeAVVDZa4v5UVJQb8FIFOpf?=
 =?us-ascii?Q?g2PHsVQT77fTSox/BN4inE25pEctcC5ENatYKtwTFia6wlAAkgBOVtXg5tFc?=
 =?us-ascii?Q?dETvLUFpGecqvlrgTZf7mZMsCOBMkrBbau/kdA6vE57y2K5AT1Mzn/XnsxhX?=
 =?us-ascii?Q?imYQkpxVICXiW31spRmxQwSHo3NCGIKKbOhKNG8c98B7dpSTbE1EEAEb8b1b?=
 =?us-ascii?Q?8aJzAZZDoGuVfWkZcMUmvoirwq2zybMj5PHvGEpgX1NEa4wBtGNyyLmFByLM?=
 =?us-ascii?Q?bGAJ7K7OGPdtQvmtlyQHHP9RgMWPr3FQoXsLoKExoaTWe0GHmKaVtcwAtx00?=
 =?us-ascii?Q?NNUBLCrBClQPzyaPdOr1b+ZnBDnS3DXxt51hCXLNvqBdHdS+QShCAQJv8wnf?=
 =?us-ascii?Q?KZur7DPq0pXRGnOZOqYR4JbybaHYn8pchBhN8M/YYXIeyuPUZKfO82RlRT8Q?=
 =?us-ascii?Q?dtHG3wRVDXNI43ikrda2pb4kcpNi82MOTgrCx1e/O6g47+3HhPvyZQT792vl?=
 =?us-ascii?Q?NUausA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67a3c50-605f-4578-1d21-08d9e04da379
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:57:11.0456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNhjDNBvUz7CkNImwr6nmbzUOAN9ESc7MpNj4LvHvCGJrSMhTfNtvoF3C7/MHWmD1SMKSGWZe35OEC60OQxONz4oTuOjfeBVWquH5E/FlIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2946
Received-SPF: pass client-ip=40.107.21.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previous commits enabled trace events generation for most of QAPI
generated code (except for tests/ and qga/). Let's update documentation
to illustrate it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/devel/qapi-code-gen.rst | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index feafed79b5..a3430740bd 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1619,7 +1619,10 @@ Code generated for commands
 
 These are the marshaling/dispatch functions for the commands defined
 in the schema.  The generated code provides qmp_marshal_COMMAND(), and
-declares qmp_COMMAND() that the user must implement.
+declares qmp_COMMAND() that the user must implement.  The generated code
+contains trace events code.  Corresponding .trace-events file with list
+of trace events is generated too, and should be parsed by trace generator
+later to generate trace event code, see `tracing <tracing.html>`.
 
 The following files are generated:
 
@@ -1630,6 +1633,9 @@ The following files are generated:
  ``$(prefix)qapi-commands.h``
      Function prototypes for the QMP commands specified in the schema
 
+ ``$(prefix)qapi-commands.trace-events``
+     Trace events file for trace generator, see `tracing <tracing.html>`.
+
  ``$(prefix)qapi-init-commands.h``
      Command initialization prototype
 
@@ -1689,14 +1695,27 @@ Example::
             goto out;
         }
 
+        if (trace_event_get_state_backends(TRACE_QMP_ENTER_MY_COMMAND)) {
+            g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
+
+            trace_qmp_enter_my_command(req_json->str);
+        }
+
         retval = qmp_my_command(arg.arg1, &err);
         if (err) {
+            trace_qmp_exit_my_command(error_get_pretty(err), false);
             error_propagate(errp, err);
             goto out;
         }
 
         qmp_marshal_output_UserDefOne(retval, ret, errp);
 
+        if (trace_event_get_state_backends(TRACE_QMP_EXIT_MY_COMMAND)) {
+            g_autoptr(GString) ret_json = qobject_to_json(*ret);
+
+            trace_qmp_exit_my_command(ret_json->str, true);
+        }
+
     out:
         visit_free(v);
         v = qapi_dealloc_visitor_new();
-- 
2.31.1


