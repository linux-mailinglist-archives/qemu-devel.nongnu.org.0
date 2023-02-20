Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3A569C849
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:10:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU37F-0008Os-20; Mon, 20 Feb 2023 05:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36r-0008Ji-0b
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:25 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36o-0000B0-J4
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:24 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K9hWqm004096; Mon, 20 Feb 2023 02:08:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nuUMh1QaGvriG9gaT76BowvaIQgTa1Bz5THTubxNj78=;
 b=I/gs9ywgGC4D5y9RcVVVz8YQqU6SbfSr9qCykkvXLGOqozbWjPQpxFPpsRS47F6r3pEo
 aY5rGbMrQkJqqZOls5pDB+GcK2XgLY+DgS57qKW9M61a9QrM7EDQGpvOjw+F+C0jT5GZ
 hh1eNNdDQyXIxiB9BbUcJp2UfVipx+XNlvlehPJoLIpvZLauuXvzCJ4qcphnpRAz6Kgr
 a8bhgcDrmju+ZjFSfWW4Hq+FkH6zuIyA+9v53OTzVZD53DabKMmAILPYVwqN1a/7k6Nb
 YzvygKfsV63Vl0b0Uufxhvp1HmLwq7G9r1DN+faGrWbbn+he4GJZH2QsgoNEdY2PJzMm DA== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6sfsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpcn58NkoUuYyE7gMCNSx5/JwWEd9gHfAtrTG66GDSC2ZihuWChDR6g7OEVX8/J8gqjUCHhDvzyQuHKxtM+lSHV6WgpVfman/yiYWiGpWQJ/DX17oopFA7wrfWEX9sgCT+iAzA83BPzcnOAZSsD/QM9Q75G2A+0n1Wgdb4wW6Wz9/z9kBs+1p/mZDVzVRMQbte1kFRjlrkzFGTpqVfbogwhv7x8eONC7ejmpWeAIxw+m8cmsjheML9NV2NT3SCX/RmoB1+teI++4tAH28SJx4qlHi18flS7y8HBWXv2Srqe8IrDo7SJjfn4ictlkl1OFz7Q8HH1KwYELz0qi0IijHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuUMh1QaGvriG9gaT76BowvaIQgTa1Bz5THTubxNj78=;
 b=Fk7VlI8uR7OnnWT5JwzhI1dX67DNxvRRPKfomk1G6Io8iXyGh9LxOswiCTvE2geaNr0XUddlSFHmRzfvpNadPz2n/QDBxS98Ka7zq02OVpfUeos1jhxU0hI+fcVb4jkVaF5HyAi18RjkmqomJLs8HZi346MUkhGQXE+LiZoNRVqovEIO1uylVxTTNZwEz8fTEx5+1uyfgx6UevzwojwVOFk+v1R1VY+oq0WSfeUcbg/Yild+pZuOuYOgEH1sCTg+SixCM+skQ6St/toRSVtQzwWTeen26lidKLTtGe53/oQMXcEC1wz5kwjVsYcJ3oeYXn58mAtHYVs8gvWizqaXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 10:08:57 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:57 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 14/16] hw/9pfs: Update synth fs driver for Windows
Date: Mon, 20 Feb 2023 18:08:13 +0800
Message-Id: <20230220100815.1624266-15-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220100815.1624266-1-bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 7586213a-b878-4df7-61dd-08db132a7a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rIA4+7aDZiER/Z42aFtwQilhoj7oID65tFzp+Q8lHqydNaTC2pfl7/3Tp5IA7qRDo2eJvc1Jo/yNDVt2lnw+uaRKjlOPXfd0QlwHyBOmSVoDwZdBQOJvw8sXIPH93gn1UEATVgCYKjWZVTjruPTFvDwkDKm4uGz7kUFpxvD0HTAwKpy4kSdp4cqjLJZ0cUbaBiTjYzcA4B6r3ZNxP+HT+9/AGe9EjHBRiHGNDEoyyMjCfhURxKK4stFixRb4vmwh1YgJdJ2XEtTUc/Andx8kfiwSJdq7QA8rbMfG7D1WSLDo/HdwETGqFfJGT0iNffyGWtrfCxbegE6V4MBJJjCmt1OuSt/q9kdQK20seWmbhptRrx3Vz7WUhtiR52AmAuD6DL8POoZT/CAqfHGvSxWcFY3C+78XUIiMiXutODoQxNs00ppQLAqBMlbTuunJtWJJXxUKbeg9Kb+bfy6d77dN/T/kopiaymTca2g/GM/lVFgFYvgnKRUsbWy87htQT56jOUdnCkClFEl6XdLGh2poj/NuFXXR7+t03k4yFvYFNvjWKMJpu5PWsEAXTGjCDllMrOvHOm9LnQzd98bTTa2wipSo2xBChC2KOrFFdHG1z3muuwp0eQtttWBkE+QRJzcsppj+wNFgQuN9olIGM9m+0BjysuFUmEon/CX8Xcl7dW6CcVI4YpDTIUHSINgAQZEtXutLVrYAE4Saz5O1Fjr30w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199018)(8936002)(83380400001)(5660300002)(41300700001)(86362001)(44832011)(2906002)(4326008)(52116002)(6486002)(6666004)(186003)(26005)(6512007)(1076003)(66556008)(8676002)(66946007)(66476007)(316002)(478600001)(2616005)(54906003)(110136005)(38350700002)(36756003)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0lsNXF5bElsYnRUeDNWN2dwaUhaMVA5MFhSY2ZNeGRoRXdYMGdGSTU5R2tS?=
 =?utf-8?B?aitFaXhTWldWbERuRVI0Y3hYcEcxQ0N0eEJPOXk1bHNpbEd5MThEZ2dtalBB?=
 =?utf-8?B?ZmhYSHRhN2JYYVo5YTBra21KSTNzRlBhT3FRUE1NTVcrNkNTTmtlVXZMRDAw?=
 =?utf-8?B?cmV0SW5hbGgycjBheklyRzZXRU5naEdFRmRIMU1oaThnV0lZWFZsY3NZTkVm?=
 =?utf-8?B?QTFVZXB5MmtVaVN0RU9zc2dVMFBVbUlncTc2Q0s1QkI2TDJXaEF2eWkxbDE0?=
 =?utf-8?B?cEhYTWZqd0REMjhaaVJudVpuN3hEekFnUVZ2a3MxNkJ4bUx5WWZDaTJGWDls?=
 =?utf-8?B?c1NndktNeFZWTWZFckNNV0x1T2djNGRBQTFpZXZCaVh0YjNiUTBqakc4Zkhi?=
 =?utf-8?B?LzViRTJtY0U5dG1SbGw5eTArSDhjbWNvUHRyTGhKYjlZNWg3UGxzdDJ6S2hz?=
 =?utf-8?B?QzZvR0l6ZFVKZmxUeStxTWZMMlFsSTlKMVl3eEhycFVSVXdwWnR2aENOUlVC?=
 =?utf-8?B?WFJtZWR3TVBQVWZLd0tqbGxTYmR1aGtKZDNLMlRSeVhXaXAwZ05yYithOGxF?=
 =?utf-8?B?NnFoWXhvbE9kL2NDcklNdndGb1hGRGRhRXhUMDg5cEkrZ1RxUmtXdHI5UlBS?=
 =?utf-8?B?aG0vWTYzVkdLRGZhQURRZlRaSHRYMU84UE5XdzlVNWpkZy81VW5vL3BJTHMv?=
 =?utf-8?B?dXB6cmlLUUM3UWExek9IVy80dld6QjVJODNqM0JXbHdNTDJYK2V2czJCTTd0?=
 =?utf-8?B?eWRaUHE3SWxpR0R0OEpXNUxtT1dWc0o5M0I1MENoVVkyQmNkaC9TSkhRUFNw?=
 =?utf-8?B?dkhZckhGRktCcUxhR0U0T3FTZlhOd0dqU0wrOHB2TXpkclVZUGVMR1hJcVJG?=
 =?utf-8?B?UHBUU0lacFBaMGFpYmdnVGhrMXNFS0RhN2lqQmI3V1JRY1VyOThYbmpaKy9t?=
 =?utf-8?B?c1htUEFHc2oxN09BZFNBbFQyemNYUGErbHlPS3U1QWo0SW11TjdOdGlBMHVK?=
 =?utf-8?B?cDJkT1ZMelNWMnFkMi94RkI3VTRBWUM2NWlxSHFzV1RxY0l5WXZHbldsNzVw?=
 =?utf-8?B?NjdQZG9BZU5hOVB2aG1yKzJRdlNuSU0wNlkyTm9aQWFiUkFaL0dPSEE2c3FP?=
 =?utf-8?B?UVZ6M1B5TGJMUXc0YWQybW4zK2luY1RXd1hOSXlDWmJlbVhRTXRoWVQzOG1p?=
 =?utf-8?B?R29uRlVLNGc2QWNSQk90WlZ5Q290cFRabVVKc09CVUEvZ1FvcnllUS9uQjZz?=
 =?utf-8?B?ZFZmaUZydGdMalpsdzVJQ3pKNmhhdW5IaTkwVW5VcEpNZWtRS0t5YTZ2ekw0?=
 =?utf-8?B?VTM4bW1OeU5YSEhkcjlaNDJWZlN4akdvbGhxOE5iVStReHNSSGJrTitqdlVP?=
 =?utf-8?B?ckxiZENmU01IU0cwcmJPQzhWdGJiaUQ0ajdNVGp2Vzg3MFRrdlBJandOczNz?=
 =?utf-8?B?UVZhM0k2dXk0cUc0Q1BFRUEwN3ZRWDZvRFk4SHY0ZytzVFdWT0l6ZTl3dzQ2?=
 =?utf-8?B?Q1hzOGc2RFcrVHZpZWRFUlE0MlJyN0xlRk15T0grT0VUQVZrcXAwZy9tbVRa?=
 =?utf-8?B?TWErUmQ5N1NISWZ2RjRIZXpzSXA0dFdvSlFidzc5NDhIK3JaaDZLeC93bGpj?=
 =?utf-8?B?M3pESlJIektQbDUwRllodzMwS1RDWks2T2dBQ0hRN1ZhdTdMT0Nkd1F3WEdK?=
 =?utf-8?B?OWZwaW5RQmVnRDluVHlZTzNVUHdkWDRpWURMYlJBZ0g3L0lhd3MyOCtBd3R3?=
 =?utf-8?B?NS8vOTFWM29RaXBmNU83VU9IQ0RvRml6MHgyQkVyWDQwN3doRHQvNmIzb1RL?=
 =?utf-8?B?WXlrOG9YYTZhMHRPaGtoTWJNRzVJeVV6WkZoRlpEbXBlU2NTU0JRRGVuRnJI?=
 =?utf-8?B?NEw3SEZpUitOSGs0RWo4dkVjaGdMeXNjejRBaGh4bENadllhL21sSWpUekxy?=
 =?utf-8?B?V1R0Z0VoZFJNcXpUTXZqejZLdGNQU2ZiZXJadk15WjRzMnF6alpuVStvaWcx?=
 =?utf-8?B?ZXhWUWtOUjhPQ1VVSTZEQmpqSWVxZ0RXRGlkcmdWM1ZacnVmMVE0enhqWVE4?=
 =?utf-8?B?cGxCMlcrTTFCQTJEc0lxU3dJbURuMmt1RjVDWk1QeWtqVVM2YTRDQW9qUE0v?=
 =?utf-8?B?U1h5YVlWUjJ3cmx2V2puekZsdmdIZVlCQmU5ekdjYlV3VlVSVG9oc0s1d250?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7586213a-b878-4df7-61dd-08db132a7a75
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:56.9780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWRkg5hu9PaEvPehdde85lrA6NF7PMgotRl8eoXm+2G1BZO3l8sjSdFCoPfaBDMAspguCwfw/X+YsS0urGrHeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-Proofpoint-ORIG-GUID: 4wHtKcTsaRhf9YGW7mcSPy1FD3CEeO33
X-Proofpoint-GUID: 4wHtKcTsaRhf9YGW7mcSPy1FD3CEeO33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302200091
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Adapt synth fs driver for Windows in preparation to running qtest
9p testing on Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---

 hw/9pfs/9p-synth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index f62c40b639..b1a362a689 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -146,8 +146,10 @@ static void synth_fill_statbuf(V9fsSynthNode *node, struct stat *stbuf)
     stbuf->st_gid = 0;
     stbuf->st_rdev = 0;
     stbuf->st_size = 0;
+#ifndef CONFIG_WIN32
     stbuf->st_blksize = 0;
     stbuf->st_blocks = 0;
+#endif
     stbuf->st_atime = 0;
     stbuf->st_mtime = 0;
     stbuf->st_ctime = 0;
@@ -230,7 +232,8 @@ static void synth_direntry(V9fsSynthNode *node,
     entry->d_ino = node->attr->inode;
 #ifdef CONFIG_DARWIN
     entry->d_seekoff = off + 1;
-#else
+#endif
+#ifdef CONFIG_LINUX
     entry->d_off = off + 1;
 #endif
 }
-- 
2.25.1


