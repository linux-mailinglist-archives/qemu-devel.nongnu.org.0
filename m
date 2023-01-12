Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F95C666EAE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:52:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuFY-0000Pn-NZ; Thu, 12 Jan 2023 04:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=03769aa997=zhe.he@windriver.com>)
 id 1pFuF7-0000P5-Ly
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:51:30 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=03769aa997=zhe.he@windriver.com>)
 id 1pFuF4-00039I-9K
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:51:28 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30C9aV7Z026210
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:51:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : from : subject : to : cc : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=D7j7/kJAfbIG7JmtmHTyInWx+CpajpbAZwa4YpHA34E=;
 b=jp+FbMN9FkM0st4zgwrvgHyNL1F7xKPIIgGNUxoCjIDcxLBRBMf42tz1AXN0I+Wfx4l2
 /5+ECmvKuJOR1IO22k7iMjUQPv8m5hsyQnSwZtn+mVlFUWoNck3W15cuL57AcsVa94Ds
 feQN1G6/+0PHAjo7BmJrhBiTeJ0Ec5juQ/F99fhd50kAwKrqFwXNyPLV2Ay2mOLFGo7n
 ZbqvJQPG51bpAewuxqeY3CC/rHT9xMRTzsYHFx8kHh+rBw2tJlTAU5dNAhuMZEHNYhUS
 RHSGnNoEbNcTC0Tx8DNcVLvNbzg4faxck83pViCl4JOQdNy7rYmwT6AIbgxV0Q31cP8w Tw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5th7mr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:51:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqIARukaT65I6NHZtB8d/arvRQefnh0tvgITYZpRd7JbntTFZycDnQxZv4x6cNc24Sfb0h7IqJZMP/dijISRH8AVxV+8ziLHKuwYYQBLXWUYkeG1pjON83XcA2FSmNt8OyEKpf8KtA1yE4UjHUCPp251cwQbnu+Xi2F1F/ANEZWc3QbsjNn59QB0yjaVBNK7WE3/FdYbDwEEucg/cGvA7ieaTcbimK3kvoyWHoQqhVe3whexsIjCL59Wjy9lr5NX23L63ekIBhSLWqljfavdDizvRKpMziU8wV9f6BG0oqSsE1BKDeYLTKgiCS1Z/92O2tuWBm4DZ83k181wVTzsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7j7/kJAfbIG7JmtmHTyInWx+CpajpbAZwa4YpHA34E=;
 b=C33ebcrMM4KEBuWBRc/28DlbYabgmLY36KaNMexVgym+/8MYF6eGz2RzvDqeglcnwz4gAl/SbC5krLKaSCzwYx7l215Gk2Jn+UmSvgvR/dQ77T7maRfH4jFJh3Ik3/y5Zuu15RIFNZ6ZZkTq2ahvd3hX8hO2PM0PeOtMBv3VH8hLVt1pphmutgTMAwnukjMKqwWT5akixnRIo8ZYHk0aJYj8trgwGz+J0I36EfDxH5x/EgeRhZYlOIy5IgdaKJ16rDtZKm3OaDmgZpy150u9ac39LU6RXKM0hVUiQ8UjNfiwO35nNpvYx22WEQN1cS5LVtMzryHJdw3OC6LKffGr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by MW4PR11MB6785.namprd11.prod.outlook.com (2603:10b6:303:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 09:51:14 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::c5d7:fdca:caeb:3e50]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::c5d7:fdca:caeb:3e50%7]) with mapi id 15.20.5986.019; Thu, 12 Jan 2023
 09:51:14 +0000
Message-ID: <fe28e3b9-631c-ddaf-485d-fae345d58d1a@windriver.com>
Date: Thu, 12 Jan 2023 17:51:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: He Zhe <zhe.he@windriver.com>
Subject: qemu-system-i386 and general protection
To: qemu-devel@nongnu.org
Cc: He Zhe <Zhe.He@windriver.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:194::20) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|MW4PR11MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 779bce55-2b04-408e-62e8-08daf4828b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ntIXoPyVUB8tQmY88crhG+uttnRen2AhU7nblbSjqrJ+/2aSbfhpQT5VDGskTXNUwJkRTtt+YfXN06fYBoCGXc+2i0ILEqoJtIaClZYBZ9DAG0NJvCZg/ezzvxBVjVG6UFNTmTRnLbZ3Hz9+7mExKZivPbf60J6fFRnObAygVV+U9FD0P9PK+kwN1X1ezTNqKTClNho4TnC5tDORyxa10dxuuUeGjecjzzUTFbdLTU7IQWn6j11ADKv+HwRH/f4v4R1XJkrcQK/S+7cX4uWUNpjJ/bAswY536oyhqZlTdkDFVuxJ57gOjcZnvXW3hUG+tPZ5KwxxooUp+LNuIpQB5oknkgYZo2Om1L8oPKzzyv+hjGilCZ1vF83pTDZuwoMrRTcq8d98rx4hg7BdwHUYvHMKPACwBME8LRwBziO2HQ3OHdRpkoqflSAYNTB2QLoEHQysrvJFbHHW+RH6c9y2Os2YN234fYRjbFvps1T0Fokq7TeEhY7rtzA33UnWf1siHj146xFTcR29HuhO769M9pC41USUgQ5x9jqlnprOMuSgXVGzWg0/oWrPjtZbjVtzTZiFoFJgIBzLm4WwK0dJq1tQjTqvzaa+vlyrLCzgPztPQxeDTP5Jn11IA4zv493pskOlugcmd1X7lF26Bsr3uVGsFYXIxHbqvKivYIzVFdZFzgv0V1MO3j/Y/cLjYaE6GMXpKag8eivRuIgbup5CbweZmWuXaOYEqxwAjYQstmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39850400004)(396003)(366004)(376002)(136003)(451199015)(2906002)(83380400001)(31696002)(38100700002)(66556008)(8676002)(86362001)(6916009)(8936002)(30864003)(5660300002)(66946007)(4326008)(66476007)(26005)(41300700001)(107886003)(6512007)(186003)(6666004)(66574015)(45080400002)(2616005)(316002)(6486002)(478600001)(6506007)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXd6VDBEMnl3SVdZRmFHVlBtVlpzOE5icjAyOHZVZXM4ZVdvTHpHa2tRQ0h5?=
 =?utf-8?B?MXAzRkhVUk9LbGo2RnBuNFM5empieHZrMTdjK1hMMTM2VElQZlViYzJyUjZo?=
 =?utf-8?B?bTNudDh4elY2VFAzMXN0VE8vWUVldWUzQ1UrNENQTlRNc0RVVnlNZGwyZGlZ?=
 =?utf-8?B?WUZDcVhoM281MEhFeEpoczlYV1Y0bUtJc3BlanFkNlNSdS8vdkVCSnFkSGVC?=
 =?utf-8?B?MktNdmE4WXAycC9LM09ZT1poVUc2QmJWTzZnbkZVMWJSYjRMOWxoKzVzSnFj?=
 =?utf-8?B?UFAySE9ScE5zWk5rMndINitjQ3ZwM3J2dXNtOWFGdVB6NEcrQ3pmZkprMnc5?=
 =?utf-8?B?bEZVNHYzTWd3MFBsY0pJZWNmb1dqcVh6VXdCcW9CZ1pHVUpuUEhrNFJNRDNT?=
 =?utf-8?B?MHp2cjg5VGsxTyt0NmZTcTZXZ25CQVFFdTZ0Mng0L0xxN2U2RENLc3BmQ215?=
 =?utf-8?B?Y2hTbFFMYzIrZnYxeVpVUnZaYWNoYTNpYUhUazNUenZ1TTM3STRoS3hwREND?=
 =?utf-8?B?cGdWQXplOGVoSER6a0wxVnpoRnF1Y3A3b0JVOEN1R2NRUjVKSDU0V2hFa1JG?=
 =?utf-8?B?ZWpBTTdKSExWMnhQQWdmcG9hNU1DeVg2Vmo1cjI4TkRURmlCOEd0MFpTcHpW?=
 =?utf-8?B?dEV1V2ppU2VHb2xSaDFLNGRTb2t1YXBTY0xtekRwRTBVbDQ2VlFqSjV1NFg5?=
 =?utf-8?B?bjB2YkhpdUJnY0J6RlVKQUJRTVJPanphRUM4UGdGcU1XdjlnZnc4ekZCVzZZ?=
 =?utf-8?B?WlNOblhNOER5ZEdEOGlLZGpJbXREREoxQUlKQzlaOXdTQnErSjh3N2YzZDhi?=
 =?utf-8?B?L1N1WnFEOUtnbXNlSHRPdW5TWXczcmprSnJWNVVyWFVGUVVHRHpLRnFNMjRU?=
 =?utf-8?B?aWd1enN5aW9ENlY1MjNldXFKeHdBSmozWlVTRUFxUkdZWHBvMEZ6SURpYzNO?=
 =?utf-8?B?ekg2WGRtOUZUVkpDU0NLNGlwR1NvcGdjRC80YlQ1QW0zb3FTOG1aRFcrUW5Q?=
 =?utf-8?B?clRWanJPekZabUFyK0IzY001dTlnOGxvOGtzRitFNUpTOVYrMjJCSU1ieExi?=
 =?utf-8?B?dS8zQUhyd01ueTU4bUhWUE5meFNnd1hrZVc3ZnJsVWF2aHREMGJaYWV4NTU2?=
 =?utf-8?B?MWg4cWxTd1RFZ3NzRkQ4VDRxK1FLeGZBUC9QK21DV0VxYjM5d1VEOXAzd2pw?=
 =?utf-8?B?bEh1bGRWQmlQSWNENlJiNDFlTjZpeHNaWE51Uk9WMFZRR2RVVWp2L0pYYnow?=
 =?utf-8?B?TFNmRTJqdDQ3Yzhpek92bHdxd21aaEpMLy9EbVFrSHBJT2V3dTdoN0dWWU54?=
 =?utf-8?B?ejFTYVl1Sm5WNmtrYTExdXZTd0cyeXk2dmU0QlJNOC9kTlpYQW03V21lWWFm?=
 =?utf-8?B?TUl4QUM3TytXN1E2T0d4ejlseUxuc3ovc01QNlQ1MEVlTDNyMG9KRmEwVlJI?=
 =?utf-8?B?Z1lKSXlJWnhPMERYTUx1a3BseXRjV1F4aUhqY09lejB5emd1ZlNseWNtZHB4?=
 =?utf-8?B?MWk5UGZYZ282TkxjSk1BVXhXeENMcHBZNXBMbllrbnJqSmFiOFllRWZUZnBF?=
 =?utf-8?B?T1dFRjdxaXdsK1grYVk2ZmdEUWVwdERjdUYrQTB3cGs1T3BmbWkrMlg1WlMx?=
 =?utf-8?B?OGZvZTJ3SC9ocGpuZDZ6VkxMOHNVMUZJWFpyK2d1VDJEaHVYaStSa1IvQjlK?=
 =?utf-8?B?eGlPdzdBTVk0RkF3Ym0yVG1wU1lETXVwTEtTcFYxYURpNTVZcTBLZlpBSTNt?=
 =?utf-8?B?OXJEK3VSUDNnRHlvb2d0b1BwUlY1aytReUJLNm9tZDdFY3ZYL2tuTGVYUWJO?=
 =?utf-8?B?aVd6OWExNGluM2VBR0t2c2JoMjZ0SXVaUThwWXZ2MUNUblM3RVV0K1NqbDVj?=
 =?utf-8?B?R0pTMFFQKzc1alFERjc5SC9ibzRoSHRvNEc3ZW1lZS8wdXlSYU8vcU5FQmpD?=
 =?utf-8?B?OWk4RVg3UFVuNmVtV0l6V0lBTUZlZFE3MzRFWHdHb3NXaFNvK1NYbklsQVNX?=
 =?utf-8?B?cWNLMXl0OTRlc0JmSlVIVTlMZlcxR21icTNNMXM4eG9GaUNMU254djV5RDg1?=
 =?utf-8?B?d0pPSC9EallEamJxeVZiL1RaTFpWMHBKTlA0ODA0bTk5MU5SUjZsR1Jablps?=
 =?utf-8?Q?j/2vnMRLHGnVCqPMH33ziqGyZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779bce55-2b04-408e-62e8-08daf4828b32
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 09:51:14.7732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saXde1e3DbwB8iwAHsEazg89vm+/IEoSDKalaC6yGQ3AM7az+G0HV7G7mpuUlOaX7xKbAR44zTO+BTuBOy1G4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6785
X-Proofpoint-GUID: z1rF0fN566qMzjD6RKMZs1WTz6EyoMPW
X-Proofpoint-ORIG-GUID: z1rF0fN566qMzjD6RKMZs1WTz6EyoMPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_06,2023-01-11_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=993 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120069
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=03769aa997=zhe.he@windriver.com;
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

Hi All,

We are experiencing a general protection fault with qemu-system-i386 as follow.
This can be reproduced with kernel v5.15 and latest v6.2-rc3 as we found so far.

It would work well if we reverted the commit
2f8a21d8ff3af484a37edc8ea61d127ec1529ab5 ("target/i386: Enable AVX cpuid bits when using TCG")
introduced since qemu 7.2.

We also tried setting cpu to Broadwell and Icelake-Server and got the same error.

./qemu-system-i386 -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -drive file=/tmp/rootfs.ext4,if=virtio,format=raw -usb -device usb-tablet -usb -device usb-kbd   -cpu Haswell -machine q35,i8042=off -smp 4 -m 8192  -m 8192 -smp cpus=8 -serial mon:stdio -serial null -nographic  -kernel /tmp/bzImage -append 'root=/dev/vda rw  ip=dhcp console=ttyS0 console=ttyS1 oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1 '

[  OK  ] Started System Logging Service.
[  204.194033] traps: named[280] general protection fault ip:b7ef8545 sp:bf8d5a1c error:0
[  204.198913] audit: type=1701 audit(1673507379.204:2): auid=4294967295 uid=997 gid=996 ses=4294967295 subj=kernel pid=280 comm="named" ex1
[  204.219923] ------------[ cut here ]------------
[  204.220455] Bad FPU state detected at restore_fpregs_from_fpstate+0x3a/0x78, reinitializing FPU registers.                               
[  204.221442] WARNING: CPU: 4 PID: 274 at ../arch/x86/mm/extable.c:127 fixup_exception+0x3f0/0x41c
[  204.223147] Modules linked in:
[  204.223945] CPU: 4 PID: 274 Comm: rs:main Q:Reg Not tainted 6.2.0-rc3 #1
[  204.224769] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[  204.226061] EIP: fixup_exception+0x3f0/0x41c
[  204.226533] Code: ff ff 8d 74 26 00 0f 0b ba 4c c9 dc d1 e9 10 fd ff ff b1 01 89 44 24 04 c7 04 24 e0 44 98 d1 88 0d 69 87 cc d1 e8 8c bf
[  204.228038] EAX: 0000005e EBX: d1aee764 ECX: 00000027 EDX: 00000001
[  204.228498] ESI: c18efee4 EDI: 0000000d EBP: c18efe58 ESP: c18efddc
[  204.229102] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00000086
[  204.229662] CR0: 80050033 CR2: bf8d5d54 CR3: 02aaf000 CR4: 001506d0
[  204.230408] Call Trace:
[  204.232101]  ? restore_fpregs_from_fpstate+0x3a/0x78
[  204.232733]  ? __switch_to_asm+0x1c/0xe4
[  204.233028]  ? __schedule+0x28c/0x844
[  204.233362]  ? _raw_spin_lock+0x10/0x34
[  204.233829]  exc_general_protection+0x81/0x340
[  204.234403]  ? futex_wait+0xb4/0x190
[  204.234818]  ? exc_bounds+0xa4/0xa4
[  204.235054]  handle_exception+0x133/0x133
[  204.235629] EIP: restore_fpregs_from_fpstate+0x3a/0x78
[  204.236113] Code: 0a 8d 76 00 db e2 0f 77 db 45 f4 3e 8d 74 26 00 a1 e8 51 a7 d1 8b 5d f4 21 d0 8b 15 ec 51 a7 d1 8d 7b 40 21 d1 89 ca 04
[  204.236152] EAX: 00000007 EBX: c2047200 ECX: 00000000 EDX: 00000000
[  204.236171] ESI: c20471c0 EDI: c2047240 EBP: c18eff4c ESP: c18eff40
[  204.236191] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00000046
[  204.236309]  ? exc_bounds+0xa4/0xa4
[  204.236475]  ? exc_bounds+0xa4/0xa4
[  204.240268]  ? restore_fpregs_from_fpstate+0x37/0x78
[FAILED[  204.240752]  switch_fpu_return+0x49/0xe0
[  204.241422]  exit_to_user_mode_prepare+0x189/0x1a0
] Failed to start Berkeley Internet Name Domain (DNS).
[  204.241910]  ? syscall_exit_work+0x10b/0x138
[  204.243209]  syscall_exit_to_user_mode+0x1c/0x38
[  204.243707]  __do_fast_syscall_32+0x56/0xac
[  204.243947]  do_fast_syscall_32+0x32/0x74
[  204.244158]  do_SYSENTER_32+0x15/0x24
[  204.244333]  entry_SYSENTER_32+0x98/0xf1
[  204.244759] EIP: 0xb7f59549
[  204.245200] Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 36
[  204.246900] EAX: 00000000 EBX: 012b373c ECX: 00000189 EDX: 00000000
[  204.247352] ESI: 00000000 EDI: 00000000 EBP: ffffffff ESP: b69feff0
[  204.247873] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000282
See 'systemctl status named.service' for details.
[  204.248870] ---[ end trace 0000000000000000 ]---
[  204.251318] general protection fault, maybe for address 0x0: 0000 [#1] PREEMPT SMP
[  204.252076] CPU: 4 PID: 274 Comm: rs:main Q:Reg Tainted: G        W          6.2.0-rc3 #1
[  204.252685] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[  204.253207] EIP: entry_SYSENTER_32+0xe0/0xf1
[  204.253537] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09 96
[  204.254956] EAX: 00000000 EBX: 012b373c ECX: b69feff0 EDX: b7f59549
[  204.255282] ESI: 00000000 EDI: 00000000 EBP: ffffffff ESP: ff8b0000
[  204.255774] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000282
[  204.256136] CR0: 80050033 CR2: bf8d5d54 CR3: 02aaf000 CR4: 001506d0
[  204.256435] Call Trace:
[  204.257004] Modules linked in:
[  204.257824] ---[ end trace 0000000000000000 ]---
[  204.258197] EIP: entry_SYSENTER_32+0xe0/0xf1
[  204.258722] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09 96
[  204.260011] EAX: 00000000 EBX: 012b373c ECX: b69feff0 EDX: b7f59549
[  204.260321] ESI: 00000000 EDI: 00000000 EBP: ffffffff ESP: ff8b0000
[  204.260854] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000282
[  204.261157] CR0: 80050033 CR2: bf8d5d54 CR3: 02aaf000 CR4: 001506d0
[  OK  ] Reached target Host and Network Name Lookups.
[  OK  ] Started NFS status monitor for NFSv2/3 locking..
[  204.744176] audit: type=1701 audit(1673507379.746:3): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=298 comm="systemd" exe=1
[  204.799915] traps: sh[309] general protection fault ip:b7f98545 sp:bf95d5ec error:0
[  204.802469] audit: type=1701 audit(1673507379.809:4): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=309 comm="sh" exe="/bin1
[  204.914694] traps: postfix-script[310] general protection fault ip:b7f19545 sp:bfeb786c error:0
[  204.916148] audit: type=1701 audit(1673507379.922:5): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=310 comm="postfix-scrip1
[  204.931021] traps: postfix-script[311] general protection fault ip:b7ee1545 sp:bfd4a30c error:0
[  204.936395] audit: type=1701 audit(1673507379.939:6): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=311 comm="postfix-scrip1
[FAILED] Failed to start Postfix Mail Transport Agent.
See 'systemctl status postfix.service' for details.
[  OK  ] Reached target Multi-User System.
         Starting Record Runlevel Change in UTMP...
[  205.527483] audit: type=1701 audit(1673507380.534:7): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=312 comm="systemd" exe=1
[FAILED] Failed to start Record Runlevel Change in UTMP.
See 'systemctl status systemd-update-utmp-runlevel.service' for details.
[  205.572397] general protection fault, maybe for address 0x1: 0000 [#2] PREEMPT SMP
[  205.572920] CPU: 4 PID: 278 Comm: (agetty) Tainted: G      D W          6.2.0-rc3 #1
[  205.573244] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[  205.573869] EIP: entry_SYSENTER_32+0xe0/0xf1
[  205.573921] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09 96
[  205.573943] EAX: 00000001 EBX: bfe01cf4 ECX: bfe01c10 EDX: b7f43549
[  205.573956] ESI: 00000000 EDI: 00000008 EBP: bfe01c38 ESP: ff8b0000
[  205.573966] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000246
[  205.573980] CR0: 80050033 CR2: bf602e00 CR3: 02999000 CR4: 001506d0
[  205.573995] Call Trace:
[  205.574085] Modules linked in:
[  205.574491] ---[ end trace 0000000000000000 ]---
[  205.574548] EIP: entry_SYSENTER_32+0xe0/0xf1
[  205.585817] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09 96
[  205.585886] EAX: 00000000 EBX: 012b373c ECX: b69feff0 EDX: b7f59549
[  205.585910] ESI: 00000000 EDI: 00000000 EBP: ffffffff ESP: ff8b0000
[  205.585931] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000282
[  205.585955] CR0: 80050033 CR2: bf602e00 CR3: 02999000 CR4: 001506d0
[  205.621193] general protection fault, maybe for address 0x0: 0000 [#3] PREEMPT SMP
[  205.622087] CPU: 4 PID: 270 Comm: (agetty) Tainted: G      D W          6.2.0-rc3 #1
[  205.622479] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[  205.623978] EIP: entry_SYSENTER_32+0xe0/0xf1
[  205.624242] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09 96
[  205.624941] EAX: 00000000 EBX: 00000003 ECX: bfe01970 EDX: b7f43549
[  205.625285] ESI: b7a22e2c EDI: b74a66b4 EBP: 00000000 ESP: ff8b0000
[  205.626096] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000246
[  205.626687] CR0: 80050033 CR2: bf602e00 CR3: 0317f000 CR4: 001506d0
[  205.627251] Call Trace:
[  205.627720] Modules linked in:                                                                                                           
[  205.628633] ---[ end trace 0000000000000000 ]---
[  205.628919] EIP: entry_SYSENTER_32+0xe0/0xf1
[  205.629228] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09 96
[  205.633931] EAX: 00000000 EBX: 012b373c ECX: b69feff0 EDX: b7f59549
[  205.634311] ESI: 00000000 EDI: 00000000 EBP: ffffffff ESP: ff8b0000
[  205.635297] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000282
[  205.635793] CR0: 80050033 CR2: bf602e00 CR3: 0317f000 CR4: 001506d0
[  205.720018] e1000e 0000:00:02.0 eth0: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: Rx/Tx
[  205.721810] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[  205.724269] general protection fault, maybe for address 0x1: 0000 [#4] PREEMPT SMP
[  205.725238] CPU: 4 PID: 156 Comm: systemd-resolve Tainted: G      D W          6.2.0-rc3 #1
[  205.727191] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[  205.728063] EIP: entry_SYSENTER_32+0xe0/0xf1
[  205.728784] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09 96
[  205.732473] EAX: 00000001 EBX: 00000004 ECX: bfa912f0 EDX: b7fab549
[  205.733121] ESI: ffffffff EDI: 004ba560 EBP: b7b8ee2c ESP: ff8b0000
[  205.734886] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000246
[  205.735516] CR0: 80050033 CR2: bf602e00 CR3: 018ad000 CR4: 001506d0
[  205.735915] Call Trace:
[  205.736108] Modules linked in:
[  205.736829] ---[ end trace 0000000000000000 ]---
[  205.737182] EIP: entry_SYSENTER_32+0xe0/0xf1
[  205.737519] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09 96
[  205.738257] EAX: 00000000 EBX: 012b373c ECX: b69feff0 EDX: b7f59549
[  205.738495] ESI: 00000000 EDI: 00000000 EBP: ffffffff ESP: ff8b0000
[  205.739091] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000282
[  205.740135] CR0: 80050033 CR2: bf602e00 CR3: 018ad000 CR4: 001506d0
[  205.765582] general protection fault, maybe for address 0x1: 0000 [#5] PREEMPT SMP
[  205.766775] CPU: 4 PID: 272 Comm: in:imuxsock Tainted: G      D W          6.2.0-rc3 #1
[  205.767426] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[  205.769185] EIP: entry_SYSENTER_32+0xe0/0xf1
[  205.769279] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09 96
[  205.769326] EAX: 00000001 EBX: b6b00660 ECX: b75ca1c0 EDX: b7f59549
[  205.769346] ESI: b7d39e2c EDI: 00000000 EBP: 00000001 ESP: ff8b0000
[  205.769364] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000282
[  205.769388] CR0: 80050033 CR2: bf602e00 CR3: 02aaf000 CR4: 001506d0
[  205.769409] Call Trace:
[  205.769440] Modules linked in:
[  205.769820] ---[ end trace 0000000000000000 ]---
[  205.769853] EIP: entry_SYSENTER_32+0xe0/0xf1
[  205.769887] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09 96
[  205.769913] EAX: 00000000 EBX: 012b373c ECX: b69feff0 EDX: b7f59549
[  205.769933] ESI: 00000000 EDI: 00000000 EBP: ffffffff ESP: ff8b0000
[  205.769952] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00000282
[  205.769975] CR0: 80050033 CR2: bf602e00 CR3: 02aaf000 CR4: 001506d0
[  205.799858] systemd (1) used greatest stack depth: 5568 bytes left
[  205.799994] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[  205.805801] Kernel Offset: disabled
[  205.806723] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

System hangs...


Regards,
Zhe



