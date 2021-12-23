Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E58647E211
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:10:44 +0100 (CET)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Lzd-0002s0-Px
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:10:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LxF-0000Tx-Kb; Thu, 23 Dec 2021 06:08:13 -0500
Received: from mail-eopbgr140107.outbound.protection.outlook.com
 ([40.107.14.107]:9686 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LxD-0003is-Mh; Thu, 23 Dec 2021 06:08:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7SP+QCOD/4GCfMzasjoAgyUHw9fpQVLEgY2orEgqxMzVVwrLvHdKOul0lfsbJzl/QeboOWpNcq62xC5k1/ifRmt46s0rvTSCBTV6HCF9Oy0wh4pM8RsJaJs9A/H6b6xyQj/tGxivngwPYa/MQi+KAnf/2/vtMM8GzUFztp3sthtSnZPtuW/qI1fl2684QXZ3NbZKimTQY21+RShN1Zu+SlBXbp8reMw5uiiQ89rcHibHGCT4NZuraqb2Qcz+GxfLS2iBAF483Wmz/dKr3nPNwaKo3pHvTD9T2LneRJEPxXF2c0nDXHEsDrLegwagQNJUKyLECjK8Ryz2olhpL4Frg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9oJSgsBjH4N8E+ng9qYwu4miBD94i21hR31JFJQGUo=;
 b=KcBY7+rWnxk87px68R07PcUo7d+sEUaIstOcCyNl4ompTzPeUEoBwt6TtfzjN7s5sYjKW4jYDjR6QHVPqc1zq0y1do90uGNz89DP2YETQiR4ImT/DWkhw8gP0hoKp+fpOlDJE6K1IYiuuSPb2WcFRE/0nAUwQmsikdGEJ1yRpO3XuhC1VvbMGN/XHIy9YAywX/KU1H42IT0v8Ce5a6SPSnkSJqM7PzmIKDnbmu5dHlAs3HzOdkbBim7dc8lpxSQwv33hV2GyKhCxDrAeJD7IELIsAKdgyRiGoEWXXXk2afVw+GnIZXgjDeSQpbm7nesOsFpmEdSPiOmorADvT9Et3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9oJSgsBjH4N8E+ng9qYwu4miBD94i21hR31JFJQGUo=;
 b=p1fGscrE6470qqJR+wQSxx9fYMloMHqQWW5NEntGyGUp0eRYWQgzydax1XCWxMSiCNvD5M8MoREW7sKbv1ELgQHLOghP98TMEO5TCGKaq8iGdujXZnl3ChxSBE8FiWftfzXo+esnDkmAJp5TMxmqZgUCPh9ufCsmIB3cOxYM/FQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3700.eurprd08.prod.outlook.com (2603:10a6:208:fc::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 11:08:05 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 11:08:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Subject: [PATCH v2 0/4] trace qmp commands
Date: Thu, 23 Dec 2021 12:07:52 +0100
Message-Id: <20211223110756.699148-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0094.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb016c14-0722-47c9-bbda-08d9c6047e4a
X-MS-TrafficTypeDiagnostic: AM0PR08MB3700:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB370044A1D579456241A2851DC17E9@AM0PR08MB3700.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wkdyymX6FAag+aHeqlUgAt5gRcl3tFAgMfqu7zJpFUGJKgHEDELbvYyjrjpON6XqisR2cvdhv0Mp26wBPwbpsO+xVPeN5APxcKALkeKHozGljgrrITum3SldvO+zxkN1esbm3t7zm3qU9RHGD5+/Nw6/k5C0iupy/SKd/9HUnxRDfOelngrxR6cJYYbUG+eFzJGeGtU+lnAFOoQ4Mu2VBmy6IR65/gMisLTu5dI5oekCIoRlD7+XI1whC+es68Mr+zAbvNh10hhMJ+prgNXAdBam6NlvF2MsR7xFA/pZJeOway7xhZXjZYBvLCb5q0ukydJT420b9IOl6GQ5LD1rUeq4PJfbWyauY6RcRRrH2GRqvZpH9a/NVKP03/Kn3W6iidxcTijSg5AyxqxX2jdD/57XAexso4G6AA0S6GbbjshqQYaijuiSCQ9kfsO64Spo7QoVXuc5Zlvpg/G4+UhEvCZLsGQFbA8AiyKUVKmxhDBUHsi9RdCzvAXco6JJkOW4Et4K5n1Gz+seEc1ExoPVC9TkytrExrgr0LWCnrTJIrGYVpTJJYzDYWyn39uk0HMGEEIfFoUEtuBtz4KIjcrQ6sA6O+1J3eJmQGX40O8n2ZPthg9eFAV9yxSXmYQ1juswleNYMlBtddHQLSGk3KC6cJKubiERxSJKBAe17cqpMYR/w3Y6mdxywhcYIjpz9zpE2R1H3CWbPHv1HeW6mvrdRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(6916009)(66946007)(6506007)(2906002)(1076003)(4744005)(7416002)(6512007)(26005)(186003)(508600001)(8676002)(6666004)(316002)(83380400001)(86362001)(5660300002)(38100700002)(8936002)(38350700002)(66556008)(4326008)(66476007)(36756003)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWdvODNWanpIcmRoUzNpUGptaUVma2l2MGh4bzJ4MjRHcnB4RUkxOCt2VnZZ?=
 =?utf-8?B?bWNlb25NZ3BVNWJiMDI2SUN3bGZwOWNPeDhiZ0lrY3d0VGI1Ly8vQ2haTi9K?=
 =?utf-8?B?aWswK3pDdjVkU0VGZmFYNENhSjJlcFlJbm1MQ2I1aGdZUVFGQUx5cTJLVUk4?=
 =?utf-8?B?NUZVcGJPeUNsNDJZTDN2cGYrakg4RWtUVHpObElXL29qOENNUkxXKzhOMUs2?=
 =?utf-8?B?SGM4YjZCS0JacFlqdFdoaXY4dEVOSFhXanJlSU0wdEJRWk9GdytLY3AwZTdD?=
 =?utf-8?B?Z1FnQjA3ZzVjZ3JBT01UYXNGbFdqMTVJT0VyMFB5RTkyNUdmRXJyY1NIUW1a?=
 =?utf-8?B?MnVRUGxlY2FOV0RwMDVNV2JQY2dKNmh1SW90YzNqVHBpZnJXcEgweHhCRnkr?=
 =?utf-8?B?djFZUmVXYXgzVVhudjgzZzJ6UGg0c3RISGN3ei9KVWkrRnZYRDhZNkpqUE83?=
 =?utf-8?B?VjkzcjI3TS8xUDlYcHF6ZG1mNDV2SmZZVXA5d2FVSnBVeG92UG42UVZVWnNM?=
 =?utf-8?B?dmpEdkNxenBjd1lVeWFlY2FoSllwWUJvemFVSVhkVlhPM3NXN3dVMzAvamxG?=
 =?utf-8?B?YkV5anUwSWdwZHRvbjQxWGw1SEw1VCtnb0ZyQ09SUTVYQnc3MFM5Z1dYMk9Q?=
 =?utf-8?B?UTl5ZVRWaFNXU0kxaTdBc3dDcDRjTnZVL3ZET2IrcG1GNzROcjZsK1Y2VjRI?=
 =?utf-8?B?RU5KT2p4QnJhd0dKUGZGbXEyNWZCb2FHZTZ3c3UwUWh4ek9Oall1TFQ0M3hq?=
 =?utf-8?B?ejhyYXVsdWFMZTJ0TTVFZWRnTnRoVkU5MnkvWjRITC9OUTlmd2UySktDM3VK?=
 =?utf-8?B?dE1udkxLc3VEN0pUSGRiZERZdzgyVE5UYUN1cHBLcG1sdUhQUDRadjhnVnlY?=
 =?utf-8?B?TGtjRTVrR0JwbGU3NEVTSUFORkI4WVJicHZxNmczb2tsZjF0RU83K0VEYk1v?=
 =?utf-8?B?TllBV3BtZDJDcDQvY1FSSERsblVaVVpra0xta2hZbURRTHUrRXN6a21VS0xC?=
 =?utf-8?B?T1hXMkFiQktXL0tWVlZKYlJXRTIrRG9EOXRqUXgvZmNIQUswMEN2Q1craEVP?=
 =?utf-8?B?M014ekVxcnBHZkZzNGpESllNZ29yQ1VpNzRjak5BYXpVSmZmWXB4c2ZHbGhj?=
 =?utf-8?B?OUM5QVZoeHpiUnZaMXRuWTFmTlV6cnh1SzhHQlJHYXZDc2FnczNLd2l3Qk9w?=
 =?utf-8?B?c0EwRUlCcnl1ZzRhdWNyKzBPckVYa0I0U0JGdVpleDlWMUpUL3FvUDg4K1VM?=
 =?utf-8?B?ZE50QklINWNwaXRFSnBwa2pRSkpya1hwdnVsMU1uRUZ3aXg4cEJ0TTJ0dHFk?=
 =?utf-8?B?U3hxVUtPVFBDUklpZHRlS1EvLzlQL2V3WE1JNzZwWG9FaVlYWWtIdjZjUFdL?=
 =?utf-8?B?cG55T1FZaU8vZkYySDJUd09VU2FrRHRMQVRwUDNJYnFKcURKQllZdkF3cmw3?=
 =?utf-8?B?bmVOVFlWZkZERWRLTVBIQ0VkRHJ3WDB3YlMzcHJFa0p4YWhuZkszMHJFcUli?=
 =?utf-8?B?eEgxWXl5cVZNUDhPRHo1Q200K2xiOXZ5UFVSaURNUlpDS3UxWWZyenVqeUxa?=
 =?utf-8?B?NTR4RDhoNWtUQTdtWlVFeHBkc240YlplbnBxSkZGeVNtRHU1WEs0U0FhUFkr?=
 =?utf-8?B?VTZZOG5Gc084TDUzMFIyR3h3MDZkd2xWemRrWTJXY3cvRjBIWTRDNkJac3Bq?=
 =?utf-8?B?WWs2Q3N1L3JvQjMwU1lyaHVVMDcyaUh6ZWVESlNUcVNWc0RhYVpuUmdXLytQ?=
 =?utf-8?B?cW9BOVpwWHRtelNWMzlMak9STWV1QytRT0x0RzEvaUwyZm9XQy93WGRiNEcv?=
 =?utf-8?B?MXJvWTA4VWEvb2w0UHBKNW1JVWk4K1RUUE41eGJ3WkxCTVBhOTMxOE5wMGRT?=
 =?utf-8?B?cVByT2lQSmhPRTBqeGlEYmV2SEZZcHdTNDNmK25wNWl1cHgxcmRDS3NsdzJi?=
 =?utf-8?B?SHlubTFLQTZxTnJRMEd3SUJJdjFkMjNocmR0OGFYZmJldnJYQk5HV2gvYitn?=
 =?utf-8?B?TzUxWGRPQ0NLdFdNb2dRd1BEcDJsL1k0QS90aXdVRzlvS0pjbjRNT3RZUTBv?=
 =?utf-8?B?MWNOMStzSzMvQUJ5Q0pQbXRQM2E3THo4SkQ0dTJBSUlKS2FmWmNwM1crbUcw?=
 =?utf-8?B?c2lmWjlzVXh4TmRIazNCc2J0YldGRS9yWUVGYnRFTFR4aUUvbDZDMGhrYWRP?=
 =?utf-8?B?RWVyQ0ZTSmk1WGpCb3YzbWI1ZnZGeDRVZmlXQlpOMVZRaXhvS0xzN0k5bXdx?=
 =?utf-8?Q?snDvrodg+9wrmYMVHthRWfz9FFO0VN5tClDVl/nZhM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb016c14-0722-47c9-bbda-08d9c6047e4a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 11:08:05.2662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gxzrt655NRr5usu2kSHwYwXmoi7mo9Woo/LMp0+fyALZwHFaTMm79n8JzGQhgDhvTHVAkoszeI4FZNtq/2bxmZ6kslP+ddg4Jlw1x/3fNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3700
Received-SPF: pass client-ip=40.107.14.107;
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

Hi all!

This series aims to add trace points for each qmp command with help of
qapi code generator.

v2:
01: new
02: use qmp_* naming for new trace-events
03: add Philippe's r-b, thanks!
04: rewrite, so that it works now! Thanks to Paolo for fast help!

Vladimir Sementsov-Ogievskiy (4):
  jobs: drop qmp_ trace points
  scripts/qapi/commands: gen_commands(): add add_trace_points argument
  scripts/qapi-gen.py: add --add-trace-points option
  meson: generate trace points for qmp commands

 meson.build              |  1 +
 blockdev.c               |  8 ----
 job-qmp.c                |  6 ---
 block/trace-events       |  9 -----
 qapi/meson.build         |  9 ++++-
 scripts/qapi/commands.py | 84 ++++++++++++++++++++++++++++++++++------
 scripts/qapi/gen.py      | 13 +++++--
 scripts/qapi/main.py     | 10 +++--
 trace-events             |  8 ----
 trace/meson.build        | 11 ++++--
 10 files changed, 107 insertions(+), 52 deletions(-)

-- 
2.31.1


