Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7854C4B3554
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 14:41:57 +0100 (CET)
Received: from localhost ([::1]:46088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIsey-0005NB-Gp
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 08:41:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nIsYU-0002KG-W3
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:35:16 -0500
Received: from mail-os0jpn01on2122.outbound.protection.outlook.com
 ([40.107.113.122]:16902 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nIsYQ-0006sn-8p
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:35:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0qHOoEh8zRQghVHpkpfjP6vMs48WqXwuAp66FIUyLX7Neqv1YhfKnVQsH2tS207YSKjMkIKvkYnTk6s35RBHyTDuayWJIQmsmR84tff6T6zZvw8H9Ytf5RArrGPPy5iNDsIEbfd5NNnWGntushfWpuWUpD0fvYHKizEIcpoNN0I1QuJ/dSQA+coFVZAQmhKTseIve7eqfP/YyS5fYqQIoqIkmwChv9pcHoL3lh+kFYoJCBxWefbu6YMCtbYMEm80NaRaLBAIBywn/zP7Mbj4tDzFMSMw6sr6o/lkb4kS0S1MYANfpHyL3fIdgX6xlxBva3Ny77lfY6sb33bJ9mxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ofWVtyW3qSShzxXKeWd3aQKNuZMJ2jlYX/KvpqPm2w=;
 b=mWW13pbRIVIs43NPG2232/02RHFGkN4Evpm5E4W7iGe3GnPA4rWWxz0SHUePQBV/3JOOFaGYGaDNi6rNr1C2X74qhtOT/OXNyne5DCfdMhLEWeCFlQuu+wBbPo5VGzF/RkONTiDbJOD4hF8DwJ8WKJ2H8lPl4J5KnOgm0wn3U/RdUHaUV+o6T2BKuhwBvFQ5nqX31Ao+WH7xMCN/ejxYTgmhLA7mgUSUyviwJgRk6SrtjLvItG4EoYJuqex9HSSEWoCzp2ZCod5VRRMHXyslEEzFqBI+QBtiP/bYCGVN0WnjN9LEKkMti3k8bKzxHhEgNKy0QgsuFqzs7TuhBkcjaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ofWVtyW3qSShzxXKeWd3aQKNuZMJ2jlYX/KvpqPm2w=;
 b=IiXnb4N6MxwZQaQ1Idzjmy914vdbOT+7WkXrLCxuyD1+19vMq361DdZ+T7Ryebw8i5yV614tG0DF6+aGtXVhlAp9rP8b/DPL6chCzWE+0nu0ozDeJZHcP1vrcQqjbPVh6Q46zTX7g5DV1+6n4GkLeTZadd8edmvtNMIJYlF10DQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS0P286MB0497.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:94::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Sat, 12 Feb 2022 13:29:55 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::6c5a:ce34:e5e:2e82]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::6c5a:ce34:e5e:2e82%7]) with mapi id 15.20.4975.015; Sat, 12 Feb 2022
 13:29:55 +0000
Date: Sat, 12 Feb 2022 21:29:47 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/6] Introduce CanoKey QEMU
Message-ID: <Yge2Sy2sA6JpUvcj@Sun>
References: <YfJozy5qjVYh24Xp@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfJozy5qjVYh24Xp@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: BYAPR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::16) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9350bd62-b252-4d2f-ab25-08d9ee2bc207
X-MS-TrafficTypeDiagnostic: OS0P286MB0497:EE_
X-Microsoft-Antispam-PRVS: <OS0P286MB0497554F3C383089E9D10198BC319@OS0P286MB0497.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9gcLPRCKrj7Mj0H8Ng3wn5oy1gUuC5X7ZwJCnw5vRBv32ooGVo9VNqBs2Dk1RTzAELFA6sZmBI5+6/4i67W/SvXFLmnjzl94XkTvQF6ExN+WqjWUv7NW4xJsrYsLY0TvIqw6T0uJi40vK882uUnQ9AJ0/+xq1xLgvO8aRSvTayXio+gZpKrYN6Pt4zTdQXOPkfQsR8+alBlQmmluKLNgfxIO3GrCJfODh+fmbv+jGAeR7a/eQAWL2aiQC9BP4RCqQr207Rhl9xyvX7vu9Jr1igAbrNNFTgl5GyMZB2vpuZa7u0wC7EeqoXvhOAUsBJ5IwnVSpgshlBnuw7NRqiCIiLBjKmg1N7hPdBpgXm644ZtxSkK59iR2cC7yp0ig1nq2uJRSqKXARZows3EghvaEUJ3hyK2QPnfExREnAU5jvTfzjxgCaQ+NUAnjwCYMoIFFqd7iAlLoFQRKbxEup5yD5hYx1/PNPcU96KgYnA/XvKyaMT1FXRDGFRRXPAeIjWbAbhC4o7zNPLg+qpPc2SY7RvstrinqFGYuzxMTWRACUXOtBXgAPK2Wr72yzSysVX6jy6NBlkday0tg8RVeFx+VxlUDGEJIjVnqh9OgEZhayTyQ4Xt8DuWcABvVyw0LSptQkJ5CHvRgtolzAWnIN7VsF1X/oWdowxZEiTOCWubhGu/murzEbrVRrE3w5744lmNf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(39830400003)(376002)(396003)(136003)(346002)(508600001)(2906002)(38100700002)(8676002)(86362001)(558084003)(6666004)(6506007)(52116002)(5660300002)(6486002)(316002)(786003)(8936002)(4326008)(54906003)(4270600006)(6916009)(66476007)(186003)(33716001)(66556008)(66946007)(6512007)(9686003)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2VkmYVlRMmraDMv+FCtl+vN7vzgqZdjPCAzI5+3guAgLsny7PV3JYYQZHGOE?=
 =?us-ascii?Q?f5S3Cvbe/35tLbIPnpTEahj0E3/6MfAb8LN1bgBSgF/qpy7muwUuknE8ofa6?=
 =?us-ascii?Q?cq3XZIEBuss4sJtGsPV/Monzt3/KoltzCExcsEB/vUyC4w9LQULlbxzbmezE?=
 =?us-ascii?Q?mXaCD5J7rFjrDur0kcwfI+38kKwz2crHwGbL+pzRTQGMy8Ny/GTw5WcbsqzD?=
 =?us-ascii?Q?nBIX0XGiuS+5BIHZgRul+QiXzMjkyzT95GeoyvRvTmcO9/JYrMuGIjPjy6Yx?=
 =?us-ascii?Q?0Q1b8N/BV6GncOoS1dIzr1y8e3B8ByV+fh8ZizUUNXPwjolJe98t/zAP5ery?=
 =?us-ascii?Q?0Sx2v4K7xofRNRk/8zB5wHkFNfS4Xkx00L5vWMAr0qRbqBWF24Aj9ryzJ3wj?=
 =?us-ascii?Q?6Q/9rEx++AOmaWSqLnfX8hyo9oa3Tjg/TErjSH7tUF2QVOhju5/zhd6Xa4uF?=
 =?us-ascii?Q?zztQFdAkTWYdZxq3pJeioVjL0OPCe4kclgCKpSp8eZuTbqQS4WvbgmVGLqHc?=
 =?us-ascii?Q?m7mZOgxS1782YEKMYAdEoAKY7GAPHiDQxFo5xYf+VveqTIICTCyU04xOxH7t?=
 =?us-ascii?Q?PVO9+2QoOZyTakqFURg3BzVBM/NA4e7y+7iEsJ3rfu6+Q0K8EO5jU8wGC+X1?=
 =?us-ascii?Q?1OeQ9wiw2NX/OiIpt0lU/m9cLYCH0EXcRd6yTTVvtqFM9y1bmDIdz5jAoITY?=
 =?us-ascii?Q?E96zTYcybN5zoypfa76Pt1PaKmKrnql/r23X9t4drv22ZCLpvR6b5jgpIx4N?=
 =?us-ascii?Q?+hdNY3+CA14hyUxJEnlssfhLIpZLr7Pnm2bt4YChzrB6Hd4fY4NHZ4X/sUXu?=
 =?us-ascii?Q?FdUojCunN7GCznaZMa6LRAFZ6AHizc9gSrW4dhrlvy2eP/lkNKoELYafLEZr?=
 =?us-ascii?Q?ezkvlBxK6Ae8MHRZAlgneDE/xZWehNMsdl4r7lspOQNFmg+TJn2elRSIVTVP?=
 =?us-ascii?Q?8VaCWFyuGC20RTVSCjP43xCz1GvXK0NaNq+amQcwzeDS3uOC3f8cEZg1qRQ1?=
 =?us-ascii?Q?bFcPMVOhA2G5di6MmvRO43Cp7eXFKUEJOXB9q8LS23qgUB68j25Vk2EAvLId?=
 =?us-ascii?Q?0DsMsjZnH34ilKiejaKBKhfzc1Sij/Sp5qxX7Niq0WA5zQxZs7sM1heX7aT/?=
 =?us-ascii?Q?RhYYWdc8tq3ma2EdUXzkBmRfkv4jKUzqxqmOsIDlL1NP4wel+OAjLdE4wFNu?=
 =?us-ascii?Q?unwBdhljlLk7iGisSEp8NeDIbkqlW6h90JidzFEpL7+5r7VqcH5oMwP6v5d8?=
 =?us-ascii?Q?d4WxMVaKVwzaQiXmNGyTV8Sz02bvUCW2p0Hyk81P3aPb4PU6FhkvmGPhwt4f?=
 =?us-ascii?Q?AEtDfmY8NPMzvY6BPlLeraAoW1fHDK0ERnKL9Yo8/He1+N0grWfk8J6Mrla3?=
 =?us-ascii?Q?vKcfiMPh7iY2eqeiiWt2yTHcreViNwNndxsLWtCAvC4BnBTl6xRbysBo/PTP?=
 =?us-ascii?Q?cw7PgZ/ZY+2vbyFQHwuDU+htJEod5zFyVhQOolqXJvvc0CUStWryIWAc0KHt?=
 =?us-ascii?Q?o5bnM4frkCvhvfcWSLQ505AUDlRRndbhIEzg3NpB4UAuyC+EHGJmtkMGWDME?=
 =?us-ascii?Q?wNJSt2dHeAhYvnzVXFxnXnamxlS+Puom/0EgWjw7?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 9350bd62-b252-4d2f-ab25-08d9ee2bc207
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2022 13:29:55.8734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgjMS3JAga5mgDiaSztpp4DSAb4BTbW6jfJWbRBMCbZlthn66Nm/Ddm7CFz7tX4N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0P286MB0497
Received-SPF: pass client-ip=40.107.113.122; envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Is there any further feedback on this patch set.

Regards,

Zenithal

