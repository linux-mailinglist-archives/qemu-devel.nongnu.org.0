Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E735A610976
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:03:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHRm-0003lS-R9; Fri, 28 Oct 2022 00:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRj-0003jx-9p
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:19 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRh-00026I-05
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:18 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4MWZp011302; Thu, 27 Oct 2022 21:58:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=IvlVyUTOqsfYiyRmPJbagrL+jOmKpxiu8ckJ0uMgbFg=;
 b=o1FBwTCzwA8+FPR6dEXW1ewmI2C87X12/2HVG93JL7zGC7qWJxUTfXICkrWXsDlEF5am
 DUjFuzOnNPZue9kLl/RUt1+CClozxHTapC7HS+486ryuRCL0XVtyG+xycGem4kqXLKxG
 rbcSC7s0GZzW+5XabTFgaZvMksDLhAqkVFkm+iGQgXI8a07xJ5y73XsRuNLL3Q+WSRp4
 avsirB6UCUxeSIg9losjkzRrRTvhztEZfkwFb0aQ8Yb2nnnfOgzh9NaAfqdkiDYQswT1
 cJDTEKnwK6evccPE9gzp/MhptkdspgcA1MaZ5MDfz5P4vg2ejmPps71DRVSB/cCJj+pb 1w== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3gs4ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 21:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LY4vrWAGdGiNXjW7Gyx6CpigSVYMvA5DRUIRjuVzQ7fG+qY4LCOKzv6nD/oqJMdV18GZa1+zORfMCbgIGrdCJWyDqdNkmhKt6h0zP+lWv37WJG049GnPVYE9Zb7hNVl2UTXNxeIBxdqPD9DHODlV7QYNBS9/YWS26ssiWmiIkd3lqPd7gQvGZi5KxqVYAsC5T/aC1Au8ragWldtioWMobdQYE5BykeZmoy4+HhFNZgM/9WYPXYTVllMTLebqZWPlcXouGoc9+CLwdpmOk7p58ZWr2LZbbeROhRfAwqBeYmAPA/nzIICurKEhpF7kkEuj8hvb17Ij+9XX/yyHNmk2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvlVyUTOqsfYiyRmPJbagrL+jOmKpxiu8ckJ0uMgbFg=;
 b=czoIXOglv3OsbzfHSNjiefaGVozKdITx+01oqXoJFlGo1i9tNT/2vkzEDc3qm/CM0p6O9bQC5kNqmp+N5fO9Rab4HcbH6u9Ye10OHQ8+9WtDUrE6Hhngj5dB7Y3GK+HHTwl7m4KAg2qqL7S49OHzGW5LdjjJeh2lvS3JHk9QQ6YzZpjwTGrsZ0/pugOCy89j0dsqPl9xbSjWtuWU9ro4VsC2ok8lbbCQ9G7p2ni7x1R7gn8AJMomUtiCPr43CuE/t2FvkgBHe/zXseA7tPxkMXGjVPvZzss7mCtAoOKe8ysq358fUbdqwLI010PSH/rGTf+mgKzbZW3s4zIJ9Clv0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:03 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:03 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 01/11] accel/qtest: Support qtest accelerator for Windows
Date: Fri, 28 Oct 2022 12:57:26 +0800
Message-Id: <20221028045736.679903-2-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 95aead34-074a-45f6-810e-08dab8a0fe19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7DA7R38OJ2vqX001h786XU1wMlDOFEuS++l/2wv7jc8Y194cSdkZTrUE0zgVrrje2CveNBBI7cs1sgvvJ5uZe5YXKvHWQiW5XkfvnHa72Q0IIKoH8Y/BpzQ3hULzzQkRSvDVqcUSIAGNAYRjJgChWrPbYTZoPoE8NFK31LErppfzo91LASPmUdKAmVGVhyCll1xmQn7DkoV6zH1kjP1V74zV1vQeCR3Fe4ZDJAbt/dd9eGSZ1oYK4fd0oguDwuOZclqZ1loS1DLFGVUwLWa4PvgxqO88dNVBP8FXCFS5jJa+76LOTTePdtao8TwSWa9ymQ9xuV+oLFksJfgW1Jy8LZg0IdUFPn4N5ROKStTmJ58P/tJPYaXi3RYIlZMlM2sNNwwg0PByh2AIq0OTIfV3X641LoaRgdFTSWJHuSZ4QRNK6li59bWzY7qy8Q9IzDvlSfemIPv+PtUKA7ISxzW4p/Fyguhy98dEXLxCmPtr4oNOeKkUlH2Fj+nE/5kYBvAqojG+1HEvS4ORziHe5fyvhEHVlZ1V5c44QB0SNUN4eab32An9s5ruC1S0JRy4CqTSG2zpTeC5itAzlrjuVzDvgJynJV43Fm9xd7N9h6lTBiOO1Oas1NXuDnU4CruwlBWB2VtwOnXttkEHYhG40BU+IiNEgBbFHzLEfac3T4g13S32RXTPnlh+0S8fapILK/izN/8OyN4J1aoxVETA259Q44YZk8G7rgc7uAw99pqlLTQp0enMciFHhuL+T4XCjZk9RqaVaaQaP3PmWLy67VX8nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(6666004)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(7416002)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1YyZlJuUWVBVWxZRnB6TmNDZk9kZDd0SFNZNllvRm5TK2cxRk1Dc3Q2NUNB?=
 =?utf-8?B?aHJYdERYSU5maERMUXVYMjZLeXFQWVJMQVpuZGVBTnpvK0I5bEtibnlVU2ly?=
 =?utf-8?B?WVZMd2VmSHpxZUtKUm1PWHh6Tmo3aXE1SGZ3U3AvK2YrU0xaWlVwcTVKNWFC?=
 =?utf-8?B?QUVNdGtQVjRZOFkzQkJkUHo4dTduNEo4eGd0TmFucXdwcWoyclNDOWdJZ2Nt?=
 =?utf-8?B?RkhweXZ5Q3NhZlFsVGR4blRmNWFKK2tGU2x1b0hJUlVXSThYQkFxODJSRE5o?=
 =?utf-8?B?c2VCUlhpcDRjdytvZFRYOE9FM3RzNWdsVmhSTHgwWmRBTi9xMGdteWV4cDhI?=
 =?utf-8?B?TVZJUnVBbWNvUzIySmY3Yjl4S2VNOXlHYlpybEhNZjEwa2E2MVN6TkRGQngv?=
 =?utf-8?B?Nm5RLzIvN2xVQ2FaazBseGtZcmkySk9NcXZvSlJobEt3QjQzMEU1V09oRTQx?=
 =?utf-8?B?TE14c3pEZFUxNVVvQUJ3Rnc4WTdkNHNsVnNKOUQ1UG9RN05JOU9NT0cyN0Qv?=
 =?utf-8?B?UTJvWTV6cGpIMk1QZ2RFbU43Z3RpV09pOEVQYXd4aGVrbEZHajMvWk9SUC9R?=
 =?utf-8?B?UWhvdkNlckU2aXJFNzBmazFkVlZPNHFzRDRDczRFaW96Tm9GeE5CL1ZwQ2Y3?=
 =?utf-8?B?S3Rrcmx6ZUM2NE1yTGFnVVhybHV0R2dOS29Sa2xaUWVQYURzNFp4UklXZ0ZT?=
 =?utf-8?B?dmUrYWNTYUdEdUhGa1FJa004dnZxYllXSSszVU5CWjAwcThzWDBaOWVsT2xl?=
 =?utf-8?B?aGlJbnNLNS9USmlDdDc1K05iNDVjSXo3bXJFaFlaZEd3S25QYnRyaERxNm95?=
 =?utf-8?B?cnJyN2ZaRGQ3bzV6UVp3UnQvN0JTYmk3UWVudmtuUzNNY3pFM0ZWTStCSzhG?=
 =?utf-8?B?S1ZBTFBveS9ZZVI3RHUxMmlvR0tkSEJwblhNQWk0NUEvVkZqbWZHaWIxMzdX?=
 =?utf-8?B?YndsQzcvUlhVdG1sbGMvTnphWThSYktSem1TbTZtZk14TUp4MGQ2YXN2b3R2?=
 =?utf-8?B?RzI2dmZsVC8rc2QwaTMzN3NPVTh2a3UrbnpIS3RtZE5Na0FMdkZsK01heDMr?=
 =?utf-8?B?ZEF1Y2pyRnRRbTRzK1pGdzQ0c2V0QnBGRnBOMXBUa1hvekN4a205Rmpjc3hv?=
 =?utf-8?B?S1l6ZGtuKy9sNHlXZ0ZFdzJ2VHJZdllXVDErS2JFcXE4VzRjd3Vxd2d5Y1BL?=
 =?utf-8?B?Um9CWVArdVFBSFBhNjNHUk5wUlhiKzFkalpTMTZtZm5uWUpRelh5djQrMkt6?=
 =?utf-8?B?OWk1b1Jod0J4OHc1ZnVmUURBd2JQWTZQem91czVFV2FDTWhneU9qRUVJMG1E?=
 =?utf-8?B?VVNWMnVVSmt4dXkrWHBJRnJvbzNCSFM3SlQrTUdoZTk3eDdUaGxmeXEyRkhR?=
 =?utf-8?B?SHpSQ2psVFB6dGJGa2NQRzk3YllleUFxZ1R2bytTb2tTZkFabHNwa1V1Qytp?=
 =?utf-8?B?MjJGd05sQ1ZWOXZyS0xEMjVpSmhBd1paMjBxMmhyTmZYaWFaVFdNMHpoTHdO?=
 =?utf-8?B?Y1lBV3RvZUxJSWE0R3RydDBhNTFuUU0xc05XTlV2R1orbDZJZWpGdzVsRHk0?=
 =?utf-8?B?WjJ6UFppejBlaGlEU0RjN2pHUGpjWVNEaTlKcUQ3SnN1Z1pyemF6UDJNdVV6?=
 =?utf-8?B?UHhNeFdMQnRJdld5Nm5mdk50aFpXYkJ2UXN3aUltei9RYkZodEZnN0NiN21P?=
 =?utf-8?B?VnVwNTZ3Q1k2NGI3aGxEbG43SUEvVytoblo0bTNPMU9mRmtUaC94ZlBrcjNY?=
 =?utf-8?B?ZUtYRnZZYlplVUt0NkhLNFN1N1ZSRUt3cy9maWJtbElFVFRuTXY2SVFkWkVM?=
 =?utf-8?B?eVVxRDZTRkxjOTlpR0MzdG11QXViaTNTaEFZUDhmWTZSUDROWTVmN0VkMEpI?=
 =?utf-8?B?OUNmSFozUXJuU1ZORWFWVVNXMXZsdHYvWjYraGJTc0RZb2xQMHdiaFc1RnIv?=
 =?utf-8?B?eGZZTERyN0pZaXNQMHlDcjdNWVBvVVZwcXZKZ1FqekpsdXFUbEQ1RzdRaXNr?=
 =?utf-8?B?cnZVQUl1S2ZpeE9zckg0Z2RCQm1idTBKMG4xeGtLdkxVYzVBTVhkd1hPeHJl?=
 =?utf-8?B?V3MvaEd5UzRHTlZWRVJ2a0tDMmh0cVBOUkoxTzhKZ3lKQnlWREhZME02VVlz?=
 =?utf-8?Q?SYRedtmYerS6tN3alrMjkrO59?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95aead34-074a-45f6-810e-08dab8a0fe19
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:03.1366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +46MRmHF/3tv56/g3Ha1vFDIOBz0rXqN2CuPP0M29QxLqCtT1AVEsznny7k7e8w9S37Q5jVqPjsG/dIGoKWHLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: QpxRZX62BtWkxRtUqnHbHWjahKbGiSr7
X-Proofpoint-ORIG-GUID: QpxRZX62BtWkxRtUqnHbHWjahKbGiSr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210280030
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=7300ee25fa=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Currently signal SIGIPI [=SIGUSR1] is used to kick the dummy CPU
when qtest accelerator is used. However SIGUSR1 is unsupported on
Windows. To support Windows, we add a QemuSemaphore CPUState::sem
to kick the dummy CPU instead for Windows.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

---

Changes in v6:
- remove CONFIG_POSIX from meson.build

Changes in v5:
- restore to v1 version which does not touch the posix implementation

 include/hw/core/cpu.h   |  1 +
 accel/dummy-cpus.c      | 14 ++++++++++++--
 softmmu/cpus.c          |  9 +++++----
 accel/meson.build       |  2 +-
 accel/qtest/meson.build |  3 +--
 5 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index f9b58773f7..8830546121 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -333,6 +333,7 @@ struct CPUState {
     struct QemuThread *thread;
 #ifdef _WIN32
     HANDLE hThread;
+    QemuSemaphore sem;
 #endif
     int thread_id;
     bool running, has_waiter;
diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
index 10429fdfb2..d6a1b8d0a2 100644
--- a/accel/dummy-cpus.c
+++ b/accel/dummy-cpus.c
@@ -21,8 +21,6 @@
 static void *dummy_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
-    sigset_t waitset;
-    int r;
 
     rcu_register_thread();
 
@@ -32,8 +30,13 @@ static void *dummy_cpu_thread_fn(void *arg)
     cpu->can_do_io = 1;
     current_cpu = cpu;
 
+#ifndef _WIN32
+    sigset_t waitset;
+    int r;
+
     sigemptyset(&waitset);
     sigaddset(&waitset, SIG_IPI);
+#endif
 
     /* signal CPU creation */
     cpu_thread_signal_created(cpu);
@@ -41,6 +44,7 @@ static void *dummy_cpu_thread_fn(void *arg)
 
     do {
         qemu_mutex_unlock_iothread();
+#ifndef _WIN32
         do {
             int sig;
             r = sigwait(&waitset, &sig);
@@ -49,6 +53,9 @@ static void *dummy_cpu_thread_fn(void *arg)
             perror("sigwait");
             exit(1);
         }
+#else
+        qemu_sem_wait(&cpu->sem);
+#endif
         qemu_mutex_lock_iothread();
         qemu_wait_io_event(cpu);
     } while (!cpu->unplug);
@@ -69,4 +76,7 @@ void dummy_start_vcpu_thread(CPUState *cpu)
              cpu->cpu_index);
     qemu_thread_create(cpu->thread, thread_name, dummy_cpu_thread_fn, cpu,
                        QEMU_THREAD_JOINABLE);
+#ifdef _WIN32
+    qemu_sem_init(&cpu->sem, 0);
+#endif
 }
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 61b27ff59d..9dd1a4dc17 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -437,18 +437,19 @@ void qemu_wait_io_event(CPUState *cpu)
 
 void cpus_kick_thread(CPUState *cpu)
 {
-#ifndef _WIN32
-    int err;
-
     if (cpu->thread_kicked) {
         return;
     }
     cpu->thread_kicked = true;
-    err = pthread_kill(cpu->thread->thread, SIG_IPI);
+
+#ifndef _WIN32
+    int err = pthread_kill(cpu->thread->thread, SIG_IPI);
     if (err && err != ESRCH) {
         fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
         exit(1);
     }
+#else
+    qemu_sem_post(&cpu->sem);
 #endif
 }
 
diff --git a/accel/meson.build b/accel/meson.build
index b9a963cf80..259c35c4c8 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -16,5 +16,5 @@ dummy_ss.add(files(
   'dummy-cpus.c',
 ))
 
-specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
+specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: dummy_ss)
 specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
index 4c65600293..176d990ae1 100644
--- a/accel/qtest/meson.build
+++ b/accel/qtest/meson.build
@@ -1,2 +1 @@
-qtest_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
-                    if_true: files('qtest.c'))
+qtest_module_ss.add(when: ['CONFIG_SOFTMMU'], if_true: files('qtest.c'))
-- 
2.25.1


