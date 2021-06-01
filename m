Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D10F396E4D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 09:54:30 +0200 (CEST)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzEL-00046A-A2
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 03:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCc-0001ZU-6E; Tue, 01 Jun 2021 03:52:42 -0400
Received: from mail-eopbgr140133.outbound.protection.outlook.com
 ([40.107.14.133]:29384 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCZ-0005x4-38; Tue, 01 Jun 2021 03:52:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTYqXGgUimxpUS3c/cKwXVfi4nrMJlpRLTfXExwIfPHEFJLEavEJge9p3lmi3667TsIbYoql7URdCJTMAapqVH93mrKrrPFPHEJIZUBHQmgJvy2ezFeajAJQJyHbaLKzxLSQCru0YioxMUFwKzhIcbhDYRGxzpKCoHF8YH90hHiqF0dzQuFs4t/RI6j3g0VaeW38l+vMNQf24KL7hZognwQITDH9wBIJLENojkAOUyTPg7T9yCzh1Sotlz2Fm5xIMBNuIjSuBzd87//wGxy44f3CnTUVcF58hwOWdk6/jCgRW/jnhP8ZOmIpcDM9xMHIHRjK40ucAYhyD0fW/OOCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=su2vZohv4wE7q3E7a0qiBjW15Jct3Et1RfY7Soo34Nc=;
 b=b1BLq4uPDEddeOeNXrqceNnPuCCpnoDOLuS9QsJxM5ApGsIV8SqjSGuBoAzefml9PwydSaI62M6u69fWNcSY7sMr+Nhe6dTFLzVhv+5YOOfuaXj3A8xtd5Qq7HhDTpBCWYOx2Iin/LRX9h8c/JyhCWftzxLvPeQmzAq5M3Bz6rT3NDgNLYCYAuhwbJWd30oSGl+fcli/G+gpkP8hT392LawrOIb2tXFoncfPS/tS6HD88ssGWgONvjIpE1uBfo6NS1evagK9tpDF7vyku0v4n8YCuB+o6lRrhMyS1A46ClOiqMmY6reGFhtjyQs2xkhfCzr/8YOxwX3IJYb5UtWvHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=su2vZohv4wE7q3E7a0qiBjW15Jct3Et1RfY7Soo34Nc=;
 b=vYjchc1Zb2tZ1MnAn137MDpLdXtyXVpR+4dgPEX/FNVgopM0GjdBzaY2s/JLjFcN7Tr98ws6jNlnPron9dQzY6UkSnBKpUZISOfK8XqZz9dLPEUDEuSRDyWTVrFiFMW0eRd87qVD9uYlXHNXuU6LAmHvf8DDETpteOVCEIbpM/Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 07:52:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 07:52:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v3 0/6] block permission updated follow-up
Date: Tue,  1 Jun 2021 10:52:12 +0300
Message-Id: <20210601075218.79249-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1PR0802CA0018.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1PR0802CA0018.eurprd08.prod.outlook.com (2603:10a6:3:bd::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 07:52:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24604a85-2983-4c89-4a49-08d924d237ca
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20994E416D42F8E987961560C13E9@AM5PR0801MB2099.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8c1k9BYmCFRLKmWSupdGIhS34tjLSgiloODlIEFJ+2BAo4upaX7wkQR3zqXHJOlTdGUrdHufZl21BKP+3vwxyHzhFrUppQj+OY92LsiJv4yudR6LTTIaZKnu6Hy3tSUJGn8/Ww2jLJDumIkjAFoJ4knx6idD4KhGPUby7d4l0IkjhtFjavrsCs45E3LDyr0MiHlIrHdnPW2KIHhKubUZrgr5/1DRoC6QmvAajZX+gtJufISwl4QEu8VvFExGzqU+hycEPZKbwOhFOhGq3Hjf0oldFfGqo53oxxaUnlF8kdc6C6AAnz0a2XbBvGk5HbeQFW1GtjlxAvi9UWwddVEisXXYEEIFgheE0Gy7G59GU89Be/2Y7ubOqXBv6xBb7w3b7A2nER8d3ujmCom0NhLW9wtxcnx1ojXY37TRBjawFKA264zOvN9xIXkP+Z0XwSiUor2d6jCSodH30eHP0nB7OFRu82Ame2YewNwMIArLLgO3BkxYav/ozMT2SDb1D8FXAOxVeoYaz4fg9CHN7/wfZpOieKYv/FnKDGSTmrY8Giti3hGjev4wHN/uFQ3ma+lwlucuHQGEkrn0hitngcbD5N89ERtL4WDFzcNOW9mdpDKfHey+0aCZwGDfGiuJz1k7IE7blFWECHReV6hdlxQh18c4nbv5BMNg6MbWYyGnaRPZXmmQMTuaKge7VOx3bD5/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(2616005)(6512007)(8676002)(8936002)(2906002)(956004)(36756003)(4326008)(15650500001)(316002)(83380400001)(6506007)(86362001)(107886003)(16526019)(66476007)(66556008)(38350700002)(38100700002)(6916009)(478600001)(6666004)(4744005)(1076003)(186003)(6486002)(5660300002)(26005)(52116002)(66946007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IRWLIJQSqypx9blhiQ+QJiXNAXWdf8dmGbWtAfQrydldM/ADs9I+7n5kNAgk?=
 =?us-ascii?Q?z6Xm+MDRieKau/DVfMOPYyFZuu7W+l/salPRRH29W4rL6jVv1+JHcga58Xfz?=
 =?us-ascii?Q?5A7S0VC7+B4Jh8rbNjGZlyqeB2HTjKikShV2LsJ4J+NBFZMdv+iKdVkegjif?=
 =?us-ascii?Q?Dp+4JD8pXlPQH/1SVXzbwErH4VsNDXnl4DIYv6VUV9nsQ3/LJFC6i8XphMrV?=
 =?us-ascii?Q?XLbYtwVvf1B6yiLABUquqs6kLQxWOh9ZuMrxrYCIl3woIE+uMtZhVTI1fCDn?=
 =?us-ascii?Q?IOt/cMDy+Gi9GXCX+NgaURG/BCcVwJxav5rP3nNhu9tcVz6AqcZIniWYknXT?=
 =?us-ascii?Q?cIfZRqTKGNiwMqKqHjXqYZMw6ZdBsOm2hxXShSpqWzTPIjre3sjAAVWzdlk8?=
 =?us-ascii?Q?xHJhBeNW1GTIFWLug4OxnnZlnEz8jrh2GIaCyOXkqTVAccgQc5BGH23MhWoe?=
 =?us-ascii?Q?2kS4YCNOCSC1GQp3ahOubKxa8KCmy0BjFV7jvR5LpCtq0PHmkIBrE90jRf2c?=
 =?us-ascii?Q?D5FETpcNwU8IqB3xLEL4P5QWDchHmoJvQj0XW5jJbWe87W+8TntRF+UMEb8a?=
 =?us-ascii?Q?ueQ8N25pE8q0isX+N/fZ9KJ4FDYoaQfSIURncMElQ5tuCxf1osBD6KDkU+XW?=
 =?us-ascii?Q?J0/O8daltlwNpX3LNGMpDLbaueW6tJJuACdCtDFPCYRfshNUntK10L84RIFo?=
 =?us-ascii?Q?6P/764H0hkk7xV479arawu2PWjRMwT/+eq43kSM4AFeVHSMNbouWt5Tnii8f?=
 =?us-ascii?Q?6UOgTP2Fy0IYLiHMbc6tEV4gR7UV/O19Nm3xB329ElvX1XrDc8raamwm/V1d?=
 =?us-ascii?Q?n/6N6yyCymZl0zz/ZbCpNIVY3STwxTMY1dMVU+6K7Io1z4mO4QhCA3ljbp/x?=
 =?us-ascii?Q?qTvEIArWCAsgCpRh1WOcHzTObj1JqjjbvLaxrrhQ1CAjd8Z6kra/9f3xaouT?=
 =?us-ascii?Q?9F3cFAj6KBNGGNVPoiAzfay3b60+QFDiRbhg8T/E5Zvds0mleLhdpYV4OMsd?=
 =?us-ascii?Q?UgHGvdNxddkhZFS0QzSTQ4yjmYdmK0w77nuGLocjTZu/Q3k6Kss/FXu5NYsy?=
 =?us-ascii?Q?0lfn8fkKKppeTvpoJ0Fz6yAX7ctBqkFIpXH8rz2BGjWb/pPwnpN5wDSmUuGr?=
 =?us-ascii?Q?rccZJk8DAwteCY2OacvBN8poNjt08FKYhudhpHVMRAhzdLXfucQ42Rohh22O?=
 =?us-ascii?Q?Vh1UXl9OeffcH0NkFZHfUd03KSrY81hPblrldtdVNMgUNVsCMeNtzOrXioWl?=
 =?us-ascii?Q?uDi37FL2Y7bcPqhk+KjhZCwH9obGq45mvKSaSwrw+WJWb3pYcudDnlHFkJsB?=
 =?us-ascii?Q?+6kIqfpKkWgS3jAVWg/ghLzN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24604a85-2983-4c89-4a49-08d924d237ca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 07:52:34.9363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38oMEL+iRZOv+oejRQOVBfImC93KGTGjqntvph9eB+If90QL7hwEmheBHFMP5RQSGkA9oDWEF9D3Huco8F8tMfCnTpuY8quiJ2GJuHJ6tns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.14.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

v3:
02: add article
04: new
05: improve commit message, add assertion
06: rewrite error message

Based-on: Kevin's block branch

Vladimir Sementsov-Ogievskiy (6):
  block: document child argument of bdrv_attach_child_common()
  block-backend: improve blk_root_get_parent_desc()
  block: improve bdrv_child_get_parent_desc()
  block/vvfat: inherit child_vvfat_qcow from child_of_bds
  block: simplify bdrv_child_user_desc()
  block: improve permission conflict error message

 block.c                               | 62 +++++++++++++++++----------
 block/block-backend.c                 |  9 ++--
 block/vvfat.c                         |  8 ++--
 tests/qemu-iotests/283.out            |  2 +-
 tests/qemu-iotests/307.out            |  2 +-
 tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
 6 files changed, 50 insertions(+), 35 deletions(-)

-- 
2.29.2


