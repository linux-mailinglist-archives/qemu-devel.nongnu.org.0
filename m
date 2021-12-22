Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE947D7AA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:27:09 +0100 (CET)
Received: from localhost ([::1]:60262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07GW-0006Mt-1H
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:27:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n077h-0007bY-JB
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:18:01 -0500
Received: from mail-eopbgr140119.outbound.protection.outlook.com
 ([40.107.14.119]:46656 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n077f-0001Jb-Mi
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:18:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzoUHvcvwxn6UYT79cq9B1Hon6vNdc7F5XE2cmVGVZmRi1zGr4Fsg65Ich4ilvnrF4AzhrvIZkmOes+hl+/Zb+wc+zy9CyykhXWL0xJYf+nvy2grh9hlx99ZMXIhX3WmCpMHTYSnoeJzE7oHnBFQAU1UGgD1NqsodVskC+ujIK90R8bpxSneXVRx//CoUnBSayqC0gRBp7qkfWyyLkyQqgpp7/BCLHKwgN633x1fK89Y8F6Aw5FgRowP7lhMmbEpeqzRqspLlUgXJBxnGkiXYYb1uGUgFU5NSun195h4VAw1Z6qO/ysvNROHTyXwD4l1SJAu6qp7QNEAFKYZlX5atw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llS1TjyFmWvFLtpCGp2YfKO92lT1wDZw4gFm+qt4bb4=;
 b=LAR6DNIOA7Wyx7K8RgN+BSuMiWDbA4rXetuCfVHvVG6HYk5YvCi/2ZQHJ91yh8naKbX+vokb6IVKjrPd6PIkWgLok/Cn6NE7ZLmmFEBvnYBHsfK6IfDP3u4uBn3TdwuwgzV7ivybh7bSDatRfNqlqh5WO7Uz18V5+dH4v0WKEHn41O/VUAVDuhQvWZMKSzarPaWD/PDrJEcqYuYCg7F0hTcotswQOUZvZK6t12P3DQviBFs39pobkqNcoPipCcJ/S7eNVZ104qzIzxG+h5jQGNbBxLagcFwRIhN0lkVJ5Z0Xw9rhkTiknjLyCZm0p8xHl0rBXFuY8EZTbP5fwojy7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llS1TjyFmWvFLtpCGp2YfKO92lT1wDZw4gFm+qt4bb4=;
 b=GvVpZzwtKySYzXCaRT9BfagVTbUuNGbdc4aGmRWOmzKlSy/M2+ADwzRh53dDUkCOsRNV6FkC1nDw463VAEQl8vQuoTSBS0VZ7nx00MXLqYGlip91jW2X/FDCvzgjqoZPm4Ir00hYG9S7PkK2hxyphRRRGNF04j4mX5y7BDaa6Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6290.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14; Wed, 22 Dec
 2021 19:17:48 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 19:17:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, philmd@redhat.com, crosa@redhat.com,
 armbru@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 marcandre.lureau@gmail.com, vsementsov@virtuozzo.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 3/3] avocado/vnc: add test_change_listen
Date: Wed, 22 Dec 2021 20:17:31 +0100
Message-Id: <20211222191731.467706-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222191731.467706-1-vsementsov@virtuozzo.com>
References: <20211222191731.467706-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a29555c-75f0-4f3d-c4ba-08d9c57fbcfe
X-MS-TrafficTypeDiagnostic: AM9PR08MB6290:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6290E60234DA47F1AB9BAA03C17D9@AM9PR08MB6290.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X9YAvdi36hotONVSNpy+u5hBjZFbMJFtvhCkACihlvr7DmqTjVWZVJn0/KONedkubOVgehCWl/KCVBtc1rM2C9eLjIUxDt+ccG+Tj+6LUBkRAefFl4a9ptd8J5/CoYUwcKwjU5jRFYN+KpBlpCrsFMu3GDUX+eUYZ4vbDJExiWQsoIo6VJUjTr2/FxW7tnSDw89nLVDbilJTM1X/nH/0YAOUrLdbxPWSnPy6wTLgD0LwGNIlQ+pG6fitXOjpXsbxz7QMwPoQ1ARIwRSU6vwvkHS4w1BbiBbWm1+sYeoNSLkD+jCf95y0K+uaqCw598pkoDmk6MbdnHa0t5AusAOlERz2njycIg/hfjU5wAbW5AhhMxIO9hkmqqaNX3CbWHLmFLM50gHnTqu4PYRALcCBn8zbNUgPVF8zIsSZvbeBr543WbqPINdjMXUmt9Ad54vlNpMwWMu4PC36IwK9OgoGWUR6TcszZT9d388l3vVOviSjr855RwAWmjGf+bNI4MAj+fp0wwk7G1U18UCeMb+8JEK9ASCswrEVJL/mRUwa46no8Im9vV76C826wYe9sJhL7NKXNt8Dp4us2u5BDDwphCnOQ4wXZ0T+LkXIOF4tZNTbleVzcY0rgjnO55uqwcgkfzJbNI/SkHoSp/v4xL7qjLBd3bKUgevjHQbuTGDCw7xn2iDAcIA0G7paLKDBdysvVb/9y9bVvQbWYtXSM/m4kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(52116002)(38350700002)(38100700002)(6506007)(66476007)(66556008)(2906002)(66946007)(6486002)(8676002)(7416002)(4326008)(36756003)(2616005)(6916009)(5660300002)(86362001)(8936002)(186003)(26005)(1076003)(508600001)(6666004)(83380400001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2ZRa3FDQXhnK1oxeHZsb3YxckR0ZnM0OEtHK1JYOVhodXRSd24zeWh4aFlh?=
 =?utf-8?B?b3VBQlZXbEY1bVl5c05heFU0dCtsVkkvVFI5Q3JhYVRUUzVYdmd6R1NmZ0ZK?=
 =?utf-8?B?WE5FSk41emdYRkVDV2pxNm9COTBuTVlFMVFFSklUYzdkSkd1SmVubGY4TUlF?=
 =?utf-8?B?Vi9vRjZuKysrazRQUUJzWnY1eUlGR1diNmkvYVVOT3c4THNzcHhRT0p1RDVM?=
 =?utf-8?B?SW85SUxZWDZQcDV6MFdmOHpNUS9GQi8wWXlZM1JzV2xxWkI0SkpkUjFMdU4z?=
 =?utf-8?B?TkVaRlJyMk53NW9KRnlMci9idDRVNFNYRHQwdmN3UnAybW13dHlNdWhNa3Fi?=
 =?utf-8?B?LzZIZ1F6d25GWXlHY2NnSVJYTmwxaHFJTkZlRE9YWFkzWFA3cm00cXBiMDNy?=
 =?utf-8?B?M1hpSGpkeW5XYUl1VUxkUlUwazlKejYwdk9pL1RvVXc5c1hGNDNPQ0lvbDNs?=
 =?utf-8?B?cm1VZlhtNG11c3NmbzdQQ3JNdDVGRjVYaFl0dTlvU0VUMmZ3SFRVMS80V1VU?=
 =?utf-8?B?U3FrMGxNdXRWdjBmV1dVcXN0Y2hhOFgxTk11eTVHampCdXNFbHlPUGdVRXor?=
 =?utf-8?B?M0Zvd2gxa21KbkdGSnpLY20yeFRSZmtrdWlEY3hvcmMvY0ZQbEE2NWJMZ0o3?=
 =?utf-8?B?eEtJUFlrOTlpQlpYOGFkd3lUTENrN2tocU53RkUzWjRUaElsK3hSUUwyam10?=
 =?utf-8?B?ZGJJcmNDdkhxeHN2WndvRVR6Ni9XWVRLR2tpZ20vMlZRbWpSWVlqSG5IS3pY?=
 =?utf-8?B?SDRnKzRycHdSWlUvTDc2MHVZZEF2SGhWdEpNKzdYdTF1TUxNRnl1RXVPQXVR?=
 =?utf-8?B?ZUVyNHJEaExhOTFvZmZEWjkwaUhwU245VG1KWENPRlZPRjVncnp6dG83SjZ4?=
 =?utf-8?B?TDdyVHFDUEdoeEJud1I1WkMvSUpLeEs0R3FDNUZuTHViM3ZUcFBXUzZDRjFr?=
 =?utf-8?B?THgwQlBkZ3MyTXd2Szc5UThKNnhPSzE5Znoyd21IZ2ZEN3F6QS9NRktLRWpU?=
 =?utf-8?B?MDl1ajhzMUtmMHI2SE8zZ1VTOVZ4YUZ3eEtNekRFQTA5QU4xalhGdVY3eVFZ?=
 =?utf-8?B?UmY3aFViVVRwRFZZcjh6V29qR1ZPazdJL2x1TTZVRFJFNFg1NTN4NXdWMkUz?=
 =?utf-8?B?M2pPU3JoT0dWcmJzWERTanFhdGtEcW9iSGRVaGFyUXhtV2ZnYVFvOE1DaG85?=
 =?utf-8?B?M3o4by9qc3JyZnFRVFBiNTYzMnlKL0ozNXd0WEVLMTVoNzlVUmJjTk5GN2Vu?=
 =?utf-8?B?TFJKUWpqbCt4V0N0RXU2THFSNHV4QmFVMFM1SlRPMkZ6UFEwTThEemZNclJw?=
 =?utf-8?B?cEcvMG9HaHVTc2NLdHgvcWI3RENRM3YveEIwb29KKzVQZkl3dG9lU1JQUElY?=
 =?utf-8?B?ZG9oQm1jQktPaVQzeUt3YXJJZzBFVGdFRER2NkZVbWMrTVdOc0h5eXpwZUpN?=
 =?utf-8?B?dm5xaXJiV1FGaXdFdUxtTjlXd0FMdmFkdnN3NjBnc0RyYmhXcG92L29CUk9a?=
 =?utf-8?B?a1ZtTFFMMVBnNFBiNW5uM3VROG5Hc1l1aUhrSDJCWndWTTErWmxlbUpVYjNa?=
 =?utf-8?B?U1hUQmFhS3ZjczZKT2dWUXBWWnliUVF0WmJmRlNRK1BZOUlWZnMxU2tMOTBN?=
 =?utf-8?B?N0kxWlRPcHdncjlncnVYODN6OTJDak44Z0JNU2xPQ3JHUFRzZENLd1dTRzhr?=
 =?utf-8?B?WldtajZkSWVWUU5LcHVnM1dFcGp6K3RWZWJSQVk2ZWxHbnh0cXluQlo5V1hW?=
 =?utf-8?B?TU5nRm5SUkFqM0ZRSGV0cXZOREpVSUl5dEJEVVc3azJYYnZSSDB5Rmw4aEk5?=
 =?utf-8?B?RiswdHdpb0xjdDF4ZVV1ZWxsSk14bU5DVzJpOEJlK1lFSkc2cEZ0L0RRc29y?=
 =?utf-8?B?VnE1SHRjdUlPNStnY1pDZjJvOHZMV0V1N0NsTitrczQwbTFtY1ZXN2pNcnor?=
 =?utf-8?B?TzM5SkJVbzFQV012eGMxWWlmWjFkQWVYMVRjZGZkVjR4enMybWZXKzRzZ20x?=
 =?utf-8?B?Vkx0OWhHVzhrM1RlOEpVL2lMczdNZGZaMkp0S2dEN1BGYVJZWjQ0S1FVMjV2?=
 =?utf-8?B?VGR0MnIxZDBEWnVRVS9Bbk9PeG9ZVENYeS9qWVdKRHE3ZGhRb0pQQmpTV1h5?=
 =?utf-8?B?d1laSHFUNmNZbVNVUWF3NWpsWTRwa0JRYlNVeENwMW5NVmt0UG9sUHFTdW5P?=
 =?utf-8?B?bVFnZER5akc0NEUydXNhQ2NpWU9Lc09hVUdxNFhrWDhWOE1velpwT2owK01Y?=
 =?utf-8?Q?z4pUjz8vpw/ZC789YRm8LqdufwsxiWnCP3gPcidY9Y=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a29555c-75f0-4f3d-c4ba-08d9c57fbcfe
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:17:47.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dizk86y2EFeR9Uml6AuLvpnfgv0VwtsD2JBCIP2LfuwILjgJ+QO+/lUQBWFjhAuB/uZ4JLfWwBBjcgfy2v2WIi3K/AOUTAGZ8AYcJ2YPNRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6290
Received-SPF: pass client-ip=40.107.14.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

Add simple test-case for new change-vnc-listen qmp command.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/avocado/vnc.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
index 096432988f..f05ee1e00a 100644
--- a/tests/avocado/vnc.py
+++ b/tests/avocado/vnc.py
@@ -51,3 +51,13 @@ def test_change_password(self):
         set_password_response = self.vm.qmp('change-vnc-password',
                                             password='new_password')
         self.assertEqual(set_password_response['return'], {})
+
+    def test_change_listen(self):
+        self.vm.add_args('-nodefaults', '-S', '-vnc', ':0')
+        self.vm.launch()
+        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], '5900')
+        res = self.vm.qmp('change-vnc-listen', id='default',
+                          addresses=[{'type': 'inet', 'host': '0.0.0.0',
+                                      'port': '5901'}])
+        self.assertEqual(res['return'], {})
+        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], '5901')
-- 
2.31.1


