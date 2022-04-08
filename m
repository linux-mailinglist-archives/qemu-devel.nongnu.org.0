Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9C4F8FA4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 09:30:06 +0200 (CEST)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncj4G-0003d1-Tq
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 03:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1ncioo-0000yD-7g
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 03:14:06 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:33736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nciol-0004pt-RD
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 03:14:05 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2387AHBo023969;
 Fri, 8 Apr 2022 00:14:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=DLr087wiwgqVF2LkWuQviXKfRSS5CR5TFv+Ef3Tr1Ig=;
 b=I/aLUEpc9OcKZaUHqXfpQ7dCXRasZTSeRNau97dLtE2RH8g49Rl+gK3jhj6W0uDZjMfT
 J07e3QNlqWovgOu3MsrhajUQ+QlMy3rkI6HZheXn7js4lor07vhVuevZorGllpDyv5xZ
 Q56qtx2xfsuiv1kTkhQ8uhee97e9hSmasHqTkA92grIxRAnIIGw1NAIFGKdxjqqd0+/f
 6BgKN0z9QynPXYJjrDamX74SPa9l1NJnWAJ1zz9EbelYXDR5VetwKoDMgms6fYkbDrNB
 u0DN7c2D9whttsYMWRCOKOclwDzS5L2xmmnWlkTPn4YRxeXSUmkvrMgP/k5y/NWwlILK sg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f6njfvs19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 00:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyHEM5kiso4kf6y0wiSdeXII1mcIiuuOi5bg0yAaG0iMztbQydoMLcXzx3qBVSwjeu/LfMIqSNeuEgIJN5OotnMKHmHDNWSdJMbZdLFzLb6rt1KP4zctAJRNBLFSEHoafKi3WDaMHb6CgrIkHgWc7U88NetVEH9C1gwQjzlV55vRvCRSYo3A5EYMbK66/yphLAD7asi8OZcRTHV7NgDcvgvFrR8rnfKUSnZoaHcYIa44ZPQRqdIrlOJ12FNtkSL/6RE5x3tZKupDoBkRZKy2AY4Cumexm0hCU814y0CLMdP7IZpuW4rFwEcTjDsJTp+HNQksVWxmMAFwin1jep3KWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLr087wiwgqVF2LkWuQviXKfRSS5CR5TFv+Ef3Tr1Ig=;
 b=Ro5FkBOZhcc5qA62JjL4bcSfWRACpjOEFTjFrtnDBsgJ8zaAuY7pdrpjl8INMX5h8vol79kZxZLdAR+p5r0CAY03A55UTYVVFab6r9EOkDiwOoN+5sf/tnNFiLRZCpvRj03S5TDaKy4kSkcvex40IKCH6SFivt6wgjSl7A/uOpcIHU0ATMazc59Xj5pNsvEktgaT3vLC1vKDzeNWmlz6g2G9N25yDrDIt5b3kpBrOVYTSi8dsZ3mWwEdBAX5HoaPv+2r4AnPARz43WaaPXV3rndNAC78yona1SbOC97kNlbC1cEI11HJdEwwLihC8dndYMiBOytdxB5ceE/l9+3F8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB3281.namprd02.prod.outlook.com (2603:10b6:405:6c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 07:13:59 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::df1:1d4d:e30c:55e6]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::df1:1d4d:e30c:55e6%3]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 07:13:59 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] Added parameter to take screenshot with screendump as
 PNG
Date: Fri,  8 Apr 2022 07:13:35 +0000
Message-Id: <20220408071336.99839-3-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220408071336.99839-1-kshitij.suri@nutanix.com>
References: <20220408071336.99839-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::29) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98d2667b-7863-44cd-abdd-08da192f59f3
X-MS-TrafficTypeDiagnostic: BN6PR02MB3281:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB32817563E70A0CB4E9A2E4F299E99@BN6PR02MB3281.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tr5xiTKMsd4frIdKDSbofb6D4EMgxu6ORUhZXs6RMaKMJOwphwXQxQOPy2TlVlqKptPev9pBDR+VrbTXWuxsHOdfQkKCHmXkAvvdp7NzFIUi/uXV/k7NYGhJMBNT/2F0a79ZZrMWm4/4xN4wwqAhp7FF00f1GNvNtV5IRviwOGD0pJ7VJaRHpauSiuSsigj8b0XCFabTs7uTSXOL1Lw4yS59OmjtYtL84CJhRU4JhUWjR2hNLH/jil8/tv6MUkhfgxjekRrt2j3R88sz/NPJuJawYX+T9HyNTqd5Oc01TBFhWzpEZkjVdf6n1S7ILqVNGeYQHdwGOUKrCrj41H7XM1cHfagarp3P93Ep7NkdJh0TKAUR391kWlOC+W+uk10tLBwwfDFcKpuE7gtLIEh8XxDTBHFbp0/ZZ18kros8mzZ0nc+kkAUZ7ZCHgXXTzpXu1VyBH0RWv+z9CBti3thBhsNZZx3IKIaXm213jgvkd+uvA6gl2T+Ck3TxbVx2A20rt+hNKTca/wcaoadSq9TXLLrRSSobnIezRMG17sIafqCVxy6cQ6zFwrVoZ4psPnl0AJxD3ctano9OYrxuAmcA4lhXsfb5P4X/KSrQt82UVxDdZu3pkQdFIrjay3vIHLR6hDElTT20Jp/+NxxsYtJ39OYmIkB6QC+lYBbqzRuNA43tlM/cwOiC8zc64CHJdeUzN/T8WOHu6NmRvci2JLJ2EdhLxi4RecNAE0eiaPn3gokGVSprytwnzw/meE80kIvyJOJRV9jxBEV42c/DKVriOmXa3nEY49FETN9PDAPtg6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(316002)(1076003)(66946007)(66556008)(66476007)(38350700002)(38100700002)(8676002)(4326008)(36756003)(966005)(6486002)(2906002)(6506007)(44832011)(6512007)(7416002)(508600001)(86362001)(52116002)(6666004)(5660300002)(2616005)(107886003)(83380400001)(8936002)(26005)(186003)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE1iOEpPOVZDd1k4NU50TW5QajlaeXRCekR2VnNPQ1lyRkpPYVJhOVB3VnJz?=
 =?utf-8?B?V0NoTmFzdmxqVkdXeU9oMmFyQlJMTVBySGpBN1NtOVJwa1dWZWlPaG9JV2Zh?=
 =?utf-8?B?Z3Bxb3dUTEhFZWl3bEV0ZEd2QnF1TUNST3pMYm0vUXI1Z3kyRThXc1pzQzhE?=
 =?utf-8?B?YjlVTUdmbGpCMUNqMm04ajlKUWdJcEh6ZnJJVVNmQlhGVzlRR2w5MVJvRzJq?=
 =?utf-8?B?T3pxcmM4QkhFZExjTmFzSGZ2Nml2M2VnZWhGUHlYcjdPQi9EUFhhN1haUEJW?=
 =?utf-8?B?TlFUOWx0Vm9weCtMMURScTVSWm5oTGFjWkdwY3FKK0xiUE9BSWNnTVBhMHpi?=
 =?utf-8?B?Nm1senpsL21pTHRIdjFxeE50Q1l2ZjM4Sk5EQng2cFVvLzduSDJFdTl1SnVk?=
 =?utf-8?B?L0s4cStyM2VWTEMxTVRrVFRFSjc1bFlHZWpWQWREU01aaGZjOTZ6dUwvMEhL?=
 =?utf-8?B?SGFmT1NDRWNhUEN5Z212RThZYWNYNTdTQ05CaW1DMjBDMlhKNVVJNGFwd1hP?=
 =?utf-8?B?aXBETGxQcU5GekZ6RGFuNG5WUW4xUnpaVjdUSWovdEdJVzBTNE9lSXRuQ3JM?=
 =?utf-8?B?Z0NkbU5pSHVBV1Y4QWg3ZTNFanBnSmpjYzhLaXJpTWVVaU1iVk9rZG91L2wv?=
 =?utf-8?B?cWNzZHBOUjYwaFlSaVY1Qkx3TmJKMTcvT0M1QnZlc09TbFVsYURraFlCTFhM?=
 =?utf-8?B?dHlsU2RWbG5TUTRYc2RLeFhPbzZ0eHFxeU1nK1A5elJEYmxrTy92clBXakJS?=
 =?utf-8?B?dk0yVzNadnNuNHhWRWF6a080L2dGcXdva2dQUlptU3YwMVE3Sy95akFJUU9p?=
 =?utf-8?B?dWFnZXducWlkNW92VWllTU1ESE1qbVZNV3NPL2VhWDVHWDhHeGc0RXVkZTlQ?=
 =?utf-8?B?SzN2TmYyZHRJUTkzVG5IR0RhUlUyQ0ZZNU8yNzZNMWZqd3ZKTEMvZHVpZkNM?=
 =?utf-8?B?VksxRlkrOHhveHJsNjVhTkdsNUFhTEx4R0x2MlJPYjBLeUR4NjNMMU9qRTVR?=
 =?utf-8?B?TXdLWkJNNCtsQXExSTRHbUlZRGlFZnV6N0E0MDEzTjRTZDdQTlFHbmFBbWRa?=
 =?utf-8?B?QW1ITmZDc01ScHQ3eEQ5T1RoZjV1aDZhN1M1QllRS0didDlaS0JGL2RtYmtI?=
 =?utf-8?B?MTgxVlVnbWxjNTd1UVFlS05SUGpiR21aNUpnK3hBaXVrWHI4R2dJdFJoUFR6?=
 =?utf-8?B?MkNYUndIRDByMTRlSVZISllDb1FBZlZpYzRiNUJ1ajJpYlE5YklkTSt6WUpJ?=
 =?utf-8?B?bDM3eXE2SkJ0VERmaTIrK1BrV2xqQjZHaEdJZ0phZzl5cExWTEl4UjBIT09T?=
 =?utf-8?B?ZHhSQUt5YlIrekZYZmY4WlMvUXBqbG8xRE5USngvZGoyN0tjTzhqYTkrQy9n?=
 =?utf-8?B?RDZhd3lBOU44eWIrMjJzUUFhSG1rRERmN0RyQUtEbmRNQlpDRFhpU3A0OFc2?=
 =?utf-8?B?VGVoa2FYVmdWOW4rNXk1dUNHOTBndWIxVjVsRjlWZnhNUVdWWWVnNUw4SzVh?=
 =?utf-8?B?ZVZjREZRSTE2S3lXKzB4em9KZmZBWWEwQVB5TnY4TWVGa3gxQ1B4bDdBZ2sy?=
 =?utf-8?B?Vzl3Rytvd1NOM05LL3kxUjFtOWhEVjRGbDJSR0dza3ZGbnZ4Wk05NmxBRVdU?=
 =?utf-8?B?SCtYRU9yNEkxODJWMGZGbkx0UHh4c3BNOEhHTWZEQndra1loTjZHdmNndWlE?=
 =?utf-8?B?cFMzY1c2LzJJTmhjcEJ0U2Zubzc2U01kcmhnc1dQMHBJK2R4QkdXY1NkdEhY?=
 =?utf-8?B?Z0NrVG9vWEUrSitwbVNzbDVRSEMwNGg2N0EvY2N0U2l1MXV6c0t3L3I3SlpF?=
 =?utf-8?B?bWhMc09FendydFZ6NUllNEh3TXBXSkJNWHROZjU1WkllZitGZzdOOXlJMlhV?=
 =?utf-8?B?TmZSTmduZlY4MHNGb1JCcnNmU0EvODJVN0d1eHA5c1hJYTluY0FXV0dLaDBR?=
 =?utf-8?B?cndBMmFGMzA4Y0Jhc3NZY1ZvWnhMdk91ZTZlS3hvcW5BakNFRFk1dmExbng1?=
 =?utf-8?B?M0hYMkZ6MTFrM2N0L21PL0lSRW5iRkp1K29zaGd6Y0I4Yy9MTVNLdW1RYjY1?=
 =?utf-8?B?OUxtSWROQ3ptNjMwTFhmSm05ZldtNXh1TEEwMkM3V3Y1cXFCTlRudmF5LzRi?=
 =?utf-8?B?aE1ZSlQzL3prcXlBN2pJQVdmV2IxRi9LeUZ0K2UzK1R4R1ltUE40QmxoRmZD?=
 =?utf-8?B?VnNFTWhsa2ZUby8vclZDQVczMjVaNjd2UHVFRHVFSDcxTmF6WFh5eWN3dnMz?=
 =?utf-8?B?YnJFeTNPclVnNjFQWndNMXZCRXRzcVgrb210ZGhPUTMzS2NKb0FNVzk0WjY3?=
 =?utf-8?B?WGZGbWl2Q0JCMFpYMXgxUkdYRmpTZ3U4QVNaZzdzL3N2ZUFYdVJYcS90Rm9l?=
 =?utf-8?Q?1bJJ5zeK0oGauX18=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d2667b-7863-44cd-abdd-08da192f59f3
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 07:13:59.0582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X35ZBg7MqLzZv2yBO3BUaFTn8fTM2j/J7NF0pOd8Mu0AsW1KORSI7Lbvf6evUAbpxCB977KNvEDjg32DELnt3Mp0jsXr44qE8EDe/LYbN/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3281
X-Proofpoint-GUID: KanF8E1Y5pTCdlzTleZ7EVbhs-njDBZT
X-Proofpoint-ORIG-GUID: KanF8E1Y5pTCdlzTleZ7EVbhs-njDBZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_02,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, dgilbert@redhat.com,
 armbru@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com, pbonzini@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently screendump only supports PPM format, which is un-compressed. Added
a "format" parameter to QMP and HMP screendump command to support PNG image
capture using libpng.

QMP example usage:
{ "execute": "screendump", "arguments": { "filename": "/tmp/image",
"format":"png" } }

HMP example usage:
screendump /tmp/image -f png

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
diff to v4:
  - Modified format to be an optional flag based parameter in HMP.

 hmp-commands.hx    |  11 ++---
 monitor/hmp-cmds.c |  12 +++++-
 qapi/ui.json       |  24 +++++++++--
 ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 136 insertions(+), 12 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8476277aa9..808020d005 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -244,11 +244,12 @@ ERST
 
     {
         .name       = "screendump",
-        .args_type  = "filename:F,device:s?,head:i?",
-        .params     = "filename [device [head]]",
-        .help       = "save screen from head 'head' of display device 'device' "
-                      "into PPM image 'filename'",
-        .cmd        = hmp_screendump,
+        .args_type  = "filename:F,format:-fs,device:s?,head:i?",
+        .params     = "filename [-f format] [device [head]]",
+        .help       = "save screen from head 'head' of display device 'device'"
+                      "in specified format 'format' as image 'filename'."
+                      "Currently only 'png' and 'ppm' formats are supported.",
+         .cmd        = hmp_screendump,
         .coroutine  = true,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 634968498b..2442bfa989 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1720,9 +1720,19 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     const char *id = qdict_get_try_str(qdict, "device");
     int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *input_format  = qdict_get_try_str(qdict, "format");
     Error *err = NULL;
+    ImageFormat format;
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
+    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
+                              IMAGE_FORMAT_PPM, &err);
+    if (err) {
+        goto end;
+    }
+
+    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+                   input_format != NULL, format, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 664da9e462..98f0126999 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -157,12 +157,27 @@
 ##
 { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
 
+##
+# @ImageFormat:
+#
+# Supported image format types.
+#
+# @png: PNG format
+#
+# @ppm: PPM format
+#
+# Since: 7.1
+#
+##
+{ 'enum': 'ImageFormat',
+  'data': ['ppm', 'png'] }
+
 ##
 # @screendump:
 #
-# Write a PPM of the VGA screen to a file.
+# Capture the contents of a screen and write it to a file.
 #
-# @filename: the path of a new PPM file to store the image
+# @filename: the path of a new file to store the image
 #
 # @device: ID of the display device that should be dumped. If this parameter
 #          is missing, the primary display will be used. (Since 2.12)
@@ -171,6 +186,8 @@
 #        parameter is missing, head #0 will be used. Also note that the head
 #        can only be specified in conjunction with the device ID. (Since 2.12)
 #
+# @format: image format for screendump. (default: ppm) (Since 7.1)
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -183,7 +200,8 @@
 #
 ##
 { 'command': 'screendump',
-  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
+  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
+           '*format': 'ImageFormat'},
   'coroutine': true }
 
 ##
diff --git a/ui/console.c b/ui/console.c
index da434ce1b2..f42f64d556 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,6 +37,9 @@
 #include "exec/memory.h"
 #include "io/channel-file.h"
 #include "qom/object.h"
+#ifdef CONFIG_PNG
+#include <png.h>
+#endif
 
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -291,6 +294,89 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
 
+#ifdef CONFIG_PNG
+/**
+ * png_save: Take a screenshot as PNG
+ *
+ * Saves screendump as a PNG file
+ *
+ * Returns true for success or false for error.
+ *
+ * @fd: File descriptor for PNG file.
+ * @image: Image data in pixman format.
+ * @errp: Pointer to an error.
+ */
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    int width = pixman_image_get_width(image);
+    int height = pixman_image_get_height(image);
+    g_autofree png_struct *png_ptr = NULL;
+    g_autofree png_info *info_ptr = NULL;
+    g_autoptr(pixman_image_t) linebuf =
+                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
+    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
+    FILE *f = fdopen(fd, "wb");
+    int y;
+    if (!f) {
+        error_setg_errno(errp, errno,
+                         "Failed to create file from file descriptor");
+        return false;
+    }
+
+    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
+                                      NULL, NULL);
+    if (!png_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write struct");
+        fclose(f);
+        return false;
+    }
+
+    info_ptr = png_create_info_struct(png_ptr);
+
+    if (!info_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write info");
+        fclose(f);
+        png_destroy_write_struct(&png_ptr, &info_ptr);
+        return false;
+    }
+
+    png_init_io(png_ptr, f);
+
+    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
+                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
+                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
+
+    png_write_info(png_ptr, info_ptr);
+
+    for (y = 0; y < height; ++y) {
+        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
+        png_write_row(png_ptr, buf);
+    }
+    qemu_pixman_image_unref(linebuf);
+
+    png_write_end(png_ptr, NULL);
+
+    png_destroy_write_struct(&png_ptr, &info_ptr);
+
+    if (fclose(f) != 0) {
+        error_setg_errno(errp, errno,
+                         "PNG creation failed. Unable to close file");
+        return false;
+    }
+
+    return true;
+}
+
+#else /* no png support */
+
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    error_setg(errp, "Enable PNG support with libpng for screendump");
+    return false;
+}
+
+#endif /* CONFIG_PNG */
+
 static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
 {
     int width = pixman_image_get_width(image);
@@ -329,7 +415,8 @@ static void graphic_hw_update_bh(void *con)
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
 qmp_screendump(const char *filename, bool has_device, const char *device,
-               bool has_head, int64_t head, Error **errp)
+               bool has_head, int64_t head,
+               bool has_format, ImageFormat format, Error **errp)
 {
     g_autoptr(pixman_image_t) image = NULL;
     QemuConsole *con;
@@ -385,8 +472,16 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
      * yields and releases the BQL. It could produce corrupted dump, but
      * it should be otherwise safe.
      */
-    if (!ppm_save(fd, image, errp)) {
-        qemu_unlink(filename);
+    if (has_format && format == IMAGE_FORMAT_PNG) {
+        /* PNG format specified for screendump */
+        if (!png_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
+    } else {
+        /* PPM format specified/default for screendump */
+        if (!ppm_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
     }
 }
 
-- 
2.22.3


