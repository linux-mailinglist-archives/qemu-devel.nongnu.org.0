Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E743E47E215
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:13:07 +0100 (CET)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0M1z-0007k7-11
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:13:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LxK-0000Zs-OG; Thu, 23 Dec 2021 06:08:19 -0500
Received: from mail-eopbgr50093.outbound.protection.outlook.com
 ([40.107.5.93]:38670 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LxJ-0003iq-2D; Thu, 23 Dec 2021 06:08:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiwpVJTb+AWimniOOtvQsmZNdQm2EaxNea/VVP6yvdWaUaIisnqDOKU/56nKcBQd3U8QStXmXGYQ03LOt5t8VP70PbP4bBK4djm+y4lMy38UDS10lrc+ifELVhV5T/xZSrA+981fXq9mRNiLA6Lu6cz8NGDvmiQtrBpBCn+EkcigSpO+I7S7FQ0v2P+7G9mucnw/BvczSYHVaj6ZaxoJdIBXvoBOvV0fIhhxVF6zjJAgKoZ2ISJkO19LQYBtuDakqF4yNK8TN9BhODkWhE9PT0c/i9ihsjCZ1uiD5uiEOkHsPKk6HF/GVBL7FojjFz10na7dJhskHQrNtzgnDZSu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4mGe/IxL/nOoPOBwTgyQ8IiyoH/TlDZ5ZwUUt2Z7k0=;
 b=IwOk4ksjIhWUc1Ax9qK1UVpgrm+GKpm7EcK/69K440R3DTDipV8C0IKDnr2kt4Nk4D3Kg5iYMKF3MLyitUtbETmzmwAISAGKSwQlMmTk/tZbCXbw5enllHVAQnzXJ2Kiq3OfX45B7UkhM8vDP44pR5ekNVTuADvS6shG0hw1D8YDmHLBxgva255/A0TzCv2zZ2/m+UJH7ci7c6CM45SEOH+6tPlMbCSAlMH75H2D9CSGBXU1pbnLqr/aR8F0nN30R25S2WMdxJMFABUNeKMyyYe68HCsuULHM0xO/PAmau+6DmBC87d++u8SFtRvmSqjxq86IBSbHTGdw/VuU8y1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4mGe/IxL/nOoPOBwTgyQ8IiyoH/TlDZ5ZwUUt2Z7k0=;
 b=wKVZ9tgwuBnIftsQrgVYzR8RTmOc/oYYHVDjJSgyLgaIz8cNbPXdcbLV361YldooTOK2do3+Egf0OyzQcgGkvpUhdy26zj0t+XWzuMjMJb5W5D2UnUjNWzwGmXaNp+JPYY5Wiil0ivshL/b5tslBGum0p3HEpkToyn+fRt6H2AU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5393.eurprd08.prod.outlook.com (2603:10a6:208:18c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 11:08:07 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 11:08:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Subject: [PATCH v2 3/4] scripts/qapi-gen.py: add --add-trace-points option
Date: Thu, 23 Dec 2021 12:07:55 +0100
Message-Id: <20211223110756.699148-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223110756.699148-1-vsementsov@virtuozzo.com>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0094.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ff37a66-1942-4b91-1c91-08d9c6047f58
X-MS-TrafficTypeDiagnostic: AM0PR08MB5393:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB5393CA643BED47CBEA14BE43C17E9@AM0PR08MB5393.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kZz8VOBQPHxj2t8Da/QM9md4oHPF8ljFnocS3XEZ8pHVhtrW546j4XDYEGSZ6Nyktg0bwXmff5nPPPn6P3/9ENGJX8Gsx1kNI1rsF4hNNTCRaJ7hOxawjtdAVhFgdX24Kipg6MCtNpwuQjf/TokfqOFrvXlG0mt7/Y5RA8zeMqTQtBL1/m89rXUvOu2fQTSQoR4ibcfKfzhzXRe/7EOizb/qplW5/X068U09Mu0OfFWSx1yhwghmtIqylcFppr+SKx+g0/MUsujwVsElPuAlvXs3MU5s0s6LkaaZMXK5C/8PXUGra66XxCmnKKvSgLPA9lrM46ui8jRa9OGkTgtewWJnaI3RuGNhIjXcF0MXPRLaR+ly/afE9gkpiO69qikJ9c51tZZC6QZ2WOby7y/V4nJPjwkMaHpxCcX4AqaTQdqlZRZjc5rY1X8Oqc8NygdCu2OZ1xFnWtStwDZ1K/Jn1anko+GtxFsU7JFN3N4A4WOBgIjucXyVHjy8lM0XAjbxc0b22YvX5L+Z0hxkFmdXCtlmELD2A2FCzKha4GwadKq4K5Gej+FciZHvNghUL/J3GDfj8bqIX6qlAgErSmNN5gC8jRm+8npkFcNSvRjmpnCI43Qz2esjy8SMM/W/nq4SOiO+RXKUO/QDWpdxdQ0JcjkH+T3HVH55X+b72Fagx6sOZMI2z6IrJ5r/nJZ9NjjN14GtMGdFZL1Iursz0kLGNMB2qHS32Qx0BoChb3o0sxQ5hfeAlYthiVMHGLA5xvW7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8936002)(26005)(6506007)(52116002)(6916009)(36756003)(8676002)(316002)(508600001)(6512007)(38350700002)(5660300002)(4326008)(38100700002)(7416002)(2616005)(1076003)(6666004)(6486002)(83380400001)(86362001)(66556008)(66476007)(2906002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFhHdGZ5YWJ5T05DemFPelZkWks2SytpbVNlMGd2QUV2SXJLaXhET1JoK3lx?=
 =?utf-8?B?NEhLamZzREh0eUIwUGxYYk9TbGk3ZHNwNEhBcVk4Z3NRNTJnbEtFOU9vRFRJ?=
 =?utf-8?B?Y25WNGN2WHhidjFpM3hXODAzd0dSd3JCOVg3MVp5Vm9Oc1VVM3YvMVRPTXlC?=
 =?utf-8?B?S1ZGekJOT2dPWnFQTHBJb0JabDdkQTRkdGRhM2I5cjUxUVV6TXdnZ3lYYldx?=
 =?utf-8?B?Rk9uWmJGa0VxTUxDM2s1UUxRYW5NVXd1Q0JMNUdKSFI3S1hSN2FoZTMrcndU?=
 =?utf-8?B?YjBROUw2RkpHNm1vOTVNSVJkYXk4Q3kyS0hqWkdBWk9kRldiQS9qZXY0N1RX?=
 =?utf-8?B?ek04dGloUmY4VkZoektPdFlMeDFwZEpzVlp5WXV2Tkltc0V3UG9sN0NDMnJL?=
 =?utf-8?B?N211NzJuWkVsVVBhV2YrQU9kYVJZdU8wZERCSFByQm9DVWVaSzQxQ0VrZnJ5?=
 =?utf-8?B?TE9ackF4S1dic29ZVjJTaENTVUpyTCtWb3ZyQ1ZoTFNxckk3c2FJQUhhQ1dr?=
 =?utf-8?B?cEl2aEFsaHltdERhY0E3V1R1b01IL2ExNnlTSms5cmo1N0JxbW02ZS9PdXVW?=
 =?utf-8?B?MFFBT2paVzQ4WGh6Wjd2UGV2M3FyUXF6YjBpUXU1dnF2ZjA3OWVoYkZIL3dS?=
 =?utf-8?B?MHM5T3N6WUJneHV2cEtUZDVDL0E0WXdmUXNmS3FubnFhRXpsd0o1dWhqM3M5?=
 =?utf-8?B?OWt3M0wxTmUzbW5VZWJxUXBFQmZ0S0xVTFFzWVJmM0hudHlQb3ZVb2oyeEIx?=
 =?utf-8?B?SEVqTk0vaE1wMFZWZ3F2ZDRZZWo5VFdTVUhkRGMxYVprYlJYZjg2Kzdiekli?=
 =?utf-8?B?aU14citjc2l5V0NSWldhY3RvMyt4S3crUXBlM2ZIL2lyLzFLeG03WWhSSjFS?=
 =?utf-8?B?UlRRRzFHNVBiaHF3NG1wSEp3cGhCTEYyMUI0SHRXMTIrUU1vT1lXWVJDWkQ5?=
 =?utf-8?B?ZHY3ZlprbS9zRDJPdXRUMEltbU82dXBaMDBzSnhXYURDeWNoNGxZMWJmeDdp?=
 =?utf-8?B?Nm55ZjExN1VCa2MrSnI1a1ZXUExqeW02RXZZZ0hQbXNNUHJkVkplNXNFajNZ?=
 =?utf-8?B?eFJvOEJVKzdjUEhOSm5ZY3lpSlQwTUlULzNtMGhBVDg1Rm41c0w3UEx4czJI?=
 =?utf-8?B?eThXRGQ0NklYK0tvVzBYTUtPdWFBM3puSCs5UTVWVUJsUldpRjFVZ00yUExU?=
 =?utf-8?B?NjdjWSttRUhPZm4yNU9kcUZGeC9BMWhtNDgvb1Jha0NXb1o2OWNaUVMxVmlr?=
 =?utf-8?B?ZlJwSlBRK2RZTVJuYjhWYUlpK1BjdW1tV3BTZ2dsUEtaeHkwK1lYS1lKbDlO?=
 =?utf-8?B?WHpEN0tVVHM2TjA1TTB5KzJMWnNHSlRhclNkeVMrUE0yQkVVWmpDRXBSM1Fq?=
 =?utf-8?B?WE1KKzJKa0xvei9IY05rMTlRU20xd1NvS0Nua1FZTjd0UjZqdGd1dzU3S0M4?=
 =?utf-8?B?WHRJMVhJcHVoaXZqQllEZzE5VjJjanVwaVQ0T2ZVeWJVYm5mNEZHd1ZQQjRq?=
 =?utf-8?B?c01Jd2czZE1rbno5bHhwb1c5S25HVGp3Q2U4WnZtNHZqUkl0NjU1eExZSkEr?=
 =?utf-8?B?Nm5KOHBrUUVLV3Zva3lyZUVDdHcyQWk5bFpzMlhWcWF3YmdMWnkrNUJtMHZy?=
 =?utf-8?B?ck1Gc2J2aTBrczgzd0dob2FIWFRlcENsV25rV1owRTVmVlA2Nm9qcDRyRFpy?=
 =?utf-8?B?dUp4TXhHTGU5dUsrL3dCekxHRzUveFVRMHB0R0hSbVJiYWFSbEZHL2xIMnFO?=
 =?utf-8?B?Y1llcmJzZ2ZOMzBxalB0WVQweTExZWxFeUM4bzBaMWNTSjdTdThxcW5CNkhr?=
 =?utf-8?B?Z2RHUXZ1RXZGTkxSNDZzeUVmNTY4U0swVWZ2MWJQVW00NExBdXdkZVpENnJB?=
 =?utf-8?B?NWNGMWY0OG5xNmducGFUbkxPdjkvZStyN2NWRGFQc1VpcFJka0J6YUpybHZv?=
 =?utf-8?B?T1NHSjRCM25qVFlvL3ZXSVBNRjhWbjU0b2w5ZmZMZWduZUlmMVBkS1pWQWFQ?=
 =?utf-8?B?U3hTNTh3N0JpLzlZQU8vQTJ1QWlRUzMvcC9oQk8rUjNNQi8zRWgzTjhSRVlY?=
 =?utf-8?B?K3VFaTNpVmdUbzhMcUM4WTY5cEJEUlNZYkEyRVZMbS8xZFU5TnNhcTJ4OEZz?=
 =?utf-8?B?WXFDSE9KTzg0aEN1aFM0NDd5SU9XallGbEhSNW5TcEs3YktFcksrbFc5N3NZ?=
 =?utf-8?B?cklFY2dtZnJzZDJVdE13dEhIZWxYbVpnc1V0YXFmNnFmS25jRUVtUlM2NlNl?=
 =?utf-8?Q?EamOPyWqsBJBi5K312HIRefRgO09prYtimObH4XtaM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff37a66-1942-4b91-1c91-08d9c6047f58
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 11:08:06.9691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86D2w8FrzUIKrG0QJARBqIovs8UikVUwX5ALlT0mqr+9txqcxCBxWbhCql437/EXRgDat31gSWXz9fBnC62jR35eBnufioS63YOGO2XanHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Received-SPF: pass client-ip=40.107.5.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Add and option to generate trace points. We should generate both trace
points and trace-events files for further trace point code generation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/qapi/gen.py  | 13 ++++++++++---
 scripts/qapi/main.py | 10 +++++++---
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 995a97d2b8..605b3fe68a 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -251,7 +251,7 @@ def __init__(self,
         self._builtin_blurb = builtin_blurb
         self._pydoc = pydoc
         self._current_module: Optional[str] = None
-        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
+        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH, QAPIGen]] = {}
         self._main_module: Optional[str] = None
 
     @property
@@ -264,6 +264,11 @@ def _genh(self) -> QAPIGenH:
         assert self._current_module is not None
         return self._module[self._current_module][1]
 
+    @property
+    def _gent(self) -> QAPIGen:
+        assert self._current_module is not None
+        return self._module[self._current_module][2]
+
     @staticmethod
     def _module_dirname(name: str) -> str:
         if QAPISchemaModule.is_user_module(name):
@@ -293,7 +298,8 @@ def _add_module(self, name: str, blurb: str) -> None:
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
-        self._module[name] = (genc, genh)
+        gent = QAPIGen(basename + '.trace-events')
+        self._module[name] = (genc, genh, gent)
         self._current_module = name
 
     @contextmanager
@@ -304,11 +310,12 @@ def _temp_module(self, name: str) -> Iterator[None]:
         self._current_module = old_module
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
-        for name, (genc, genh) in self._module.items():
+        for name, (genc, genh, gent) in self._module.items():
             if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
                 continue
             genc.write(output_dir)
             genh.write(output_dir)
+            gent.write(output_dir)
 
     def _begin_builtin_module(self) -> None:
         pass
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index f2ea6e0ce4..3adf0319cf 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -32,7 +32,8 @@ def generate(schema_file: str,
              output_dir: str,
              prefix: str,
              unmask: bool = False,
-             builtins: bool = False) -> None:
+             builtins: bool = False,
+             add_trace_points: bool = False) -> None:
     """
     Generate C code for the given schema into the target directory.
 
@@ -49,7 +50,7 @@ def generate(schema_file: str,
     schema = QAPISchema(schema_file)
     gen_types(schema, output_dir, prefix, builtins)
     gen_visit(schema, output_dir, prefix, builtins)
-    gen_commands(schema, output_dir, prefix)
+    gen_commands(schema, output_dir, prefix, add_trace_points)
     gen_events(schema, output_dir, prefix)
     gen_introspect(schema, output_dir, prefix, unmask)
 
@@ -74,6 +75,8 @@ def main() -> int:
     parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
                         dest='unmask',
                         help="expose non-ABI names in introspection")
+    parser.add_argument('--add-trace-points', action='store_true',
+                        help="add trace points to qmp marshals")
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
 
@@ -88,7 +91,8 @@ def main() -> int:
                  output_dir=args.output_dir,
                  prefix=args.prefix,
                  unmask=args.unmask,
-                 builtins=args.builtins)
+                 builtins=args.builtins,
+                 add_trace_points=args.add_trace_points)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
-- 
2.31.1


