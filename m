Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC953C72C0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:03:36 +0200 (CEST)
Received: from localhost ([::1]:53316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jwd-0008S4-Gb
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju1-0005Ut-9O
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:54 -0400
Received: from mail-dm6nam11on2096.outbound.protection.outlook.com
 ([40.107.223.96]:35521 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Jtz-0002ks-0j
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiNka/ol5LhiOxgzlvk6Vt3/s8qyRz2koSB+yYGH9RQMgJZHqYgtt+lE1UB1ecHcMqZHCjqSFXuH55UqV/V/aV4BuaL5xiI8SEdqo3nTMlynkPyiKf8zjJFEvHxvy0zvRwWuUAEIRbyWmpEa6QptRsWq8mvuXp5NrNEd5dYnFtZEVsif/hBSK5hu3ORg5uo+HXRgbapGf7//qnZe38nV+vMhH5Y04NTBcKBJOtKPGyQuhak+75bnZtqURdNHwhW+fut8HPqqTPVx7LQ0aqwdqAzVCiwglrujbPG0VTedxCxvPcugyiExhkee3DKUtSdnWc8+V4x+vJWRKc5RYERY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/ymUUSnc7nTpuqsWRG1NOs499tHJALJm2rvyFFlKwU=;
 b=mYdsiAmGnbc2/G/DTskgY9u3Z56LbOsGDv0dGYNW1Nf7U2aiDAhsf5yb87G21ZY0lPcurnho+2FVXtOBdNIdxCbqg7Y6sihXWFp+w2wHloT4lcWd8SzdNDptANteEuZrsm+ktqpEZOJDq2zbSRict3W6VYtg+cOC7ww/G2t3IVUadk5hmvgKlOwHSWTqzq+QLktSINIx8LInwCA1MMf0OBrjzb8w//DL1iZRZT+rNOMfVemDQah5LRan2dFKTut6T4+h0hZGjYzsvscQ2ZyfJPl/atchHzieLkeQGgMBrX5ykvJoeThnKsJFUbOAXkw+VBHwmkGjG46sRQcD1c7NsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/ymUUSnc7nTpuqsWRG1NOs499tHJALJm2rvyFFlKwU=;
 b=dWh6ZB7frNLkwbEUBXODdJ2zDLt6aLJBla2Ra6ky3GxO7k24xYdy/L/d1yfvuVk5ZxXhyM7JLDKswh/gdKllCPZvnPvOE84dt9iL9s7rcO8chRne+12oxNDI3jr6LOIl3y7BInH/TaYWeiQfzklnV7XL/3oZVuJaydgwdgzLnLs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5722.namprd03.prod.outlook.com (2603:10b6:806:110::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 15:00:47 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:00:47 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/4] Fuzzing Patches
Date: Tue, 13 Jul 2021 11:00:33 -0400
Message-Id: <20210713150037.9297-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR11CA0002.namprd11.prod.outlook.com
 (2603:10b6:208:23b::7) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:208:23b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 15:00:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26075748-88cc-4796-b1ee-08d9460eff19
X-MS-TrafficTypeDiagnostic: SA2PR03MB5722:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57223D62803D1548086A356BBA149@SA2PR03MB5722.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ks0gne4YKdR0h7rGFbtSa0uMRcdVdTmTADtjVTKVUglY8wShM3gMtprjADYuwfvukEvaovpDafMAN9z9ALuwTPTZAtKj/rNwwxJb1yUqu2egJzHgtH7YMbi2B1XfNlmmYq/bjfCU/aAYEZVmSbh9wdVqHCCCSk1eh7OuQAnSj8tADqPP5NZrBx18Ez4w8UsidI9pGn6cZm2JYjgeDGzXIvaGEdSQMX/RhzegRIa+MuCRkpQs+1E4o5+yYeVRyIOhLI1+Htp9Zfqq754Gyq5x0NA95hOLns7UKLX2TBRzmeG1yanrji+qkWOTVulRVocZyTD8XfnBMEoUIU53s1kJ1lCdK44u+LO8tRZ+kkt+peCIVVHOVXkxDFUHUOALC0kEcA/UGzcCJyzkiTgClaSmMAeNxuvHJOBk8lSPI/AL6TqGcqSRPMVN6xyrxBSuu0frhnMQsrAIvKUa1hJZIjT9L3z3mmG9UiKU8KKh+nEnHyFqr4Q7LCI+/tTr9+kNZzhmih/LC7+yDu7t04OUxVLhuN1kgezKZJgNsQ1fQau4FI9vPw/ixfbTnhKBXOEspVPeT+oH/N+l/dVRW4Ts3aziaMMIE7zZJXDXX6fytPFnNKg140MXt4qeGFn/8OQ+GQtCOHsgReEtsyUP6Vx/wVAhnoDm597kvUye1LPG4AIM3qekSJM0u9KeUc05nnBQ0ZvWwpU9CU0gHNX7sK2+H94rHylCCPYB3r7Le1AjLcLHSxAT5NWyEh02oEw9Kw/dAZ9O01dRKhY7lxSBsl1fE0Rlh08u6hvKTbuhOYZtjWciojM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(6916009)(2906002)(1076003)(66946007)(186003)(83380400001)(6666004)(52116002)(86362001)(66476007)(75432002)(26005)(8936002)(36756003)(8676002)(478600001)(66556008)(2616005)(5660300002)(4326008)(6486002)(54906003)(966005)(6506007)(38100700002)(316002)(38350700002)(956004)(786003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymt1U1I5cUZXUEhSS0dxUHpvOUI3eXg1dXhRTlp2ZkV5L29ZNkxIRHJ1ajl2?=
 =?utf-8?B?emFQMm1ZVXN4bmtFL2VlRCs4WGx6cVBPSEs4Uml6aEZzeEtVYkNtTzhNdUpa?=
 =?utf-8?B?Y1JhcWRPaVpzN0dONTVsTUFtc05Yd3NYWS84MHYyVFR3VGgrelVESTFhd3N4?=
 =?utf-8?B?VWNnR29jVWFpeWpuREpqNWpLY1pxSnA3NVByYzVLMlpuYThVeVJwdEluN212?=
 =?utf-8?B?ZDN6S2UrdWlXeCt2Y3B3NTI0RmJpMnRkNTJ6eVo1WWw3T2lCeG4wNEtvTXkr?=
 =?utf-8?B?YnZqZzV3ZjBrWUswQjhNYlJKUDl1UXJiTUZreWd0ZW5iY2lNaWNnRkZKU2dz?=
 =?utf-8?B?UXV2UFhjd2xnVGRHMHZZOTh1OURQeExGa0ticXRNWmw4UzdNMnJEWTlOL0Fp?=
 =?utf-8?B?dzVIWHZxanVicnJEODJ2c1lreGJSWG15Y3hlNVpneTB3N1RuWThIUWdiQmdZ?=
 =?utf-8?B?VjRTRWRRbEYvcmxIdHBHSVRwY0FubUtjQmk3bGNjV1ZsQkVFaVo1dWdaUm9T?=
 =?utf-8?B?K2J1WXIwQzF3YThOc3hSUGhKeGtkaUFScWREQnVJb2x6Z2JWOWxwQ1F2c2N1?=
 =?utf-8?B?QmtZSkI0NUZaWG95K0lvbkJaWDEyL0hrWUlzdEJYWjA2TmxaNjNJQlB6YlA4?=
 =?utf-8?B?a3JNTEFoUTBXTEM5MWFzN3pjZmVzaHNKTXoxMmJHTnN3L055bVpVM0QrQlM3?=
 =?utf-8?B?TTRoVGhxUktMMEtIcFRKZjdhWXdoUlc5eFhtMlVxUThNRm52VkNma1cwWHcx?=
 =?utf-8?B?dWgzNkdHUXZ5VkZ5TnBlaHZKSHVabjZyY1lrN1kySklMc3dMd3FxTDZsQ09z?=
 =?utf-8?B?V1lJVXJuRXZkeUg3eVNzdHppc1VIQUdFWGVzdFZxLzg2V0grZUNNVGg3ai9W?=
 =?utf-8?B?LzhYMk9tY2p2Tit4SnlFK1BmRWZWRXZicVUwc09tQ0xnRTY2bFZBenIzNlZt?=
 =?utf-8?B?VkM4MjY5WWlhbnNadjJJVjkvVmtzZmJUOHppN1QzNnFlazRoNDlGMTRmNmNZ?=
 =?utf-8?B?VXhybC9QUHVZYXNzR1p4VTBmamt0MS9mMGgwclBOY0FFVkprc0VkVVZwOElM?=
 =?utf-8?B?cVlKR2JaTWhpMkc1REI3dTc4azVVV0x3eVI3YnNhcTIvV1FLVXJ1eHZZTmRG?=
 =?utf-8?B?cHdRRU14V2h3WFJZRkRxYnhOTTZINGpoeWJjZmZKaWtpK3hhRnowcklSWk4v?=
 =?utf-8?B?ZmE4VVFITFpIRWZEakZBNTUxNy9hZUVOSWpvRURpRTdwcitwU0NONEFhMlNz?=
 =?utf-8?B?cDZ4d21lMXFHc1g5bmd4OWhtYlZUckNHTHkvbk8rZ2ZkQ1pZNmpRcTN0Q3Nm?=
 =?utf-8?B?MmpqUlV5ZTRnb3UrZURLUldLWjZvS3JSUDV5bUEwTEh1VTBlbGRlRXh4QitM?=
 =?utf-8?B?TkhMZ2tRNk04dG5mdm1tMTZUK1doeGl1WUVLa243cEs2U3gzUXhTWkhPZU9V?=
 =?utf-8?B?TDFqN0RNLzFOdFdIY1JzcWI1WUVJdEZ4cVAyMCtrV0JJQ3UrRnFqdWViRC9C?=
 =?utf-8?B?MFR3blVXR1ZxUU9mVkpSVnZwR0JwVzhrUlpLQmNtR2xkMFEyWUhYdDAvdk9r?=
 =?utf-8?B?NDVGQklWT1JpRWt6OFVnajFwK2J3S2ZJY3dJZDk5a3FEdFdKK1ZwNTFTeTN5?=
 =?utf-8?B?N2ViWHREcHFId3hQSU1WSmNVZ0dyZzM5OWNTNnI4Z2F2OHM1RWYyVGtjMzJy?=
 =?utf-8?B?YjZzdGlwclF3dXNrTWZMM2t1NDhDNGlTaHYxMmh1NCtjRkp0NDNBbTllV2RF?=
 =?utf-8?Q?JQ/TGWy7C0aI9kAXp8UlO7o5Iew07BIVKlZO6+Z?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 26075748-88cc-4796-b1ee-08d9460eff19
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 15:00:47.5934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFXyQGMmz30M6sS+oh1efuO3e+9/yKGc5wnvQ6+zvbuwHGTBjRg94QFXEKVjxEkO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5722
Received-SPF: pass client-ip=40.107.223.96; envelope-from=alxndr@bu.edu;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Paolo,

The following changes since commit 711c0418c8c1ce3a24346f058b001c4c5a2f0f81:

  Merge remote-tracking branch 'remotes/philmd/tags/mips-20210702' into staging (2021-07-04 14:04:12 +0100)

are available in the Git repository at:

  https://gitlab.com/a1xndr/qemu tags/pull-request-2021-07-13

for you to fetch changes up to 6dd98f1ee0253a57498010ea54f45609552d729c:

  fuzz: add an instrumentation filter (2021-07-13 10:56:13 -0400)

----------------------------------------------------------------
Fuzzing PR for 6.1:

 * Bug-fixes 
 * Refined timeout mechanism
 * Selective coverage instrumentation

----------------------------------------------------------------
Alexander Bulekov (4):
      fuzz: fix sparse memory access in the DMA callback
      fuzz: adjust timeout to allow for longer inputs
      fuzz: make object-name matching case-insensitive
      fuzz: add an instrumentation filter

 configure                                        | 28 ++++++++++++++++++++++------
 scripts/oss-fuzz/instrumentation-filter-template | 15 +++++++++++++++
 tests/qtest/fuzz/generic_fuzz.c                  | 50 +++++++++++++++++++++++++++++++++++++++-----------
 3 files changed, 76 insertions(+), 17 deletions(-)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter-template

-- 
2.28.0


