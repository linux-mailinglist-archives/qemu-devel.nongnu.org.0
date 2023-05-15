Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88635702F9D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:24:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZ6g-0002U0-Q0; Mon, 15 May 2023 10:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pyZ6d-0002TM-EW
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:23:19 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pyZ6Z-000388-3e
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:23:19 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FCKv20003649; Mon, 15 May 2023 07:23:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=P+nfK4fMVmrZ/zVHbwKlnztnguvtxn/+xJVQhMlAa/A=;
 b=Bh4Aw3+/RGDJhYr4y83Bnrk6ZvEdGOzNKkL+/hDU4bmAs41O8MKMhq8lPWzn6gT6ibHo
 /9jYKRCN1sDNFebWM/A/Vl1472FPPqddKOMmOM2sNTzhzA0CBB4Um8Bn1Yh3JB1Hz3vM
 37WWciqnPQq5oaYUv1zoUDFUFlMTpsytmQezxqEvhuoMRBJ5XzgUdstnZog8r28DoS2g
 q69b11PaxoeB1epvNAraLCzua5zn3kUFOslHP/PPhhYZe51G/PBNzypd5lguRb7lGplf
 lp4wmIAHb7E9ZcBVmxyx2TJOiBg8K7gVF7bfO1WPkhDJ35rvrWhYgM3ZPRTyDtvvbfJM Vg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qj838kssv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 07:23:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPjXdMKYYd7l1KQAIE+3rdP4VvK55MQOu/6HPJnS56B1aV/wBQH9OrOEUJzNyprgwgmP6XTu8KSlufgRIOVgh0BfzN/DEEsFPOuDkxXw3Ar3cbBDLBAMhOSwEcPqn9M4KuVl1RHG/0qWAVI4N4lK3G6XmcS5Iv6K0Dh/oDSGNOrHZ44Q7x8OVgUx2O12xJAThaOp/PM7FwPnrcCBE8xpE8uw3mxgbHUVcvYl7CeX5rJZo1sUaMw4HKOgnk5DLYib3fyVxNOFU1D5UI6rUFAlMqPC8IBzhdZCpSPlfgPhbuOS/Gpyeckskx3l+OzfPtUiOV7d7SILutAjOt2MAeKDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+nfK4fMVmrZ/zVHbwKlnztnguvtxn/+xJVQhMlAa/A=;
 b=O5Xp3RINUjSEWBbQNoeh40o3m/szjPZt07i60nHCNkmhQeA2HA1DZPUHMY6WWoeXkclHQz3ldSbOQUpuzHjJmGAcR14GIs4fum0ganw6O/1Y58M66VJ6HhLn3rsXHaKUYni9d7dUAP8xzUSMpYP3NqC/WVdpmDdYQPntqViYf996pka3cUj+V739vLXUQzjjunqxBqnYUFRjDoCrkJezPz4gHxsyqUXOVK1AdwGI4YPCiVizm76SWxQPHtRaIbuREuQmd5HPQ35lUCyiPwEopFoCSEwPUWw6iINtn5Sfpp2bl1uGBFF03CPTJ41KXZTtlMvYnga1HBDeUL4dTBgyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+nfK4fMVmrZ/zVHbwKlnztnguvtxn/+xJVQhMlAa/A=;
 b=xGSeuiVDGOEciGXVVoqUKOu3QlK9RrHp9rF/aD2ahRrhyLo5antKqoA/uAwyVgdKQPXpAFnTyjvKBMw8oiMi17ta/YNRXRiGahQaMQ2861X7ZRwnqH6wuM6TObviqxYpsf0VhJ662RmL2R3GCFb3NfkuF3HfV+FExkNfe2xp6a/NpXGk2HMivUGVQnuv40gdAwqOqC9waKZU75HXnkUtQmoro4XCe8zPr5FhJg/vGSAeQOZs0fOUV/dWesN2l+m/n+FXChxVwmGgys8WFZw1QDDxA5wZx3BTmIsdhU7EXgh6NN1D1Ye5K7rVBcx7R+dNW0NQt7zLHMmekYpLp5PoXg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BL0PR02MB6530.namprd02.prod.outlook.com (2603:10b6:208:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 14:23:06 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 14:23:06 +0000
Message-ID: <71658ac2-6aa9-cde3-0eb9-82dae3c7ed0b@nutanix.com>
Date: Mon, 15 May 2023 19:52:54 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 3/8] migration: converts socket backend to accept
 MigrateAddress struct
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-4-het.gala@nutanix.com> <ZGIGxf5WaHwasY1p@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <ZGIGxf5WaHwasY1p@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::20) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|BL0PR02MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: d9333f8d-a891-4e36-0a35-08db554fe65a
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tMd+n2QFP90UnrU4oh655LvRT7Um0OLHzxBNx9P+D0roij0XnHr81RahK+AVxx5toe4G2xM3G3236IPhr4y0nkmtVPjxmEsTS1yZJpFjQ+4VmMmAXS7Z/zo2yMc6z4dx3bvZPVZITOJMFSUWT6xBS64TB2jerd9jYsBQAobhuvUxSUC/tWI9hEEXe/kXlUogzm0rm/r8iVMopalApnJip5geuYpUxhMxQ/etNJ5IZA+MNhUSL1sCtDdhhjYy247czhE+aLdxOZRDgsYpSbUGnveKNK2M18+8jObzgkaFsMHjJKQatjwpqj3MYCnfZZNPPF6ekW5JCqK9FTCd0CWJvafBToTJOvnm6rZo1TXJnRT29dhcYxKO5aaiUM0eRsOngM6VHdsx6GyWJtTPzlH779xUT5F2h8kPC7yYuKf3dVBgGMi7VXyP/upMPfpJsADaOl38UIt8Ahv2Yddn4E/PR0TPw7cdPdr+kOt4WT/okzFZTygQpPNWxNe3+p7z2pGVGWU7oO+JYZ3mFx4KGN5NxmdkyB/6muW3W5Guhvep3dq981nrdmvqUrDdCncjix0Q1Nox8Zx7s0jXWBtfWnkvFRrGahbqHUmVp5hvrnV2PyC5aSwqMfp3dp1qFOeuFQlLbdCr0//V1derKZNDwQvmfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(39850400004)(346002)(396003)(451199021)(2616005)(38100700002)(107886003)(186003)(26005)(83380400001)(53546011)(6512007)(2906002)(30864003)(41300700001)(6506007)(5660300002)(44832011)(8936002)(8676002)(36756003)(31696002)(478600001)(66556008)(6666004)(6486002)(66946007)(66476007)(6916009)(316002)(86362001)(4326008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzltcTdVdVJobTFmczVCQjBDNkVPWndjK1pWdEV4NVl6WndxK2IvTlFBaWtE?=
 =?utf-8?B?a3ZweWhtTVBjWk5GRSttek5wVm5MbmpSaUhXTFc5Q0lCeUJkNXpqOVNqUTQy?=
 =?utf-8?B?bEo4V0hpd3FiOFc0OUk1NnY5ZGtyR0NEU0Y3cGZXdkgvQ1BtWVlZa3Nja1RP?=
 =?utf-8?B?THhRQ1pYM1VnaVBJNmVUUmZyWW5CZStwTGNDb2dSdzk1dVFKMXVobnJDai9j?=
 =?utf-8?B?VG9GQXpDSERucEI4aGVDYi9hZkVlZUU4ZGw3c3lXcWw3di9sOGpTemNlYnFj?=
 =?utf-8?B?dHB1SjJxejAyajlRL2Y0QW4yMFA0RGlRdWxHSkxCMUZiRnJheXFSNzM4Q25I?=
 =?utf-8?B?SVBjWDlqZUovVlpBS1dBWUhjYzcrRHhWbGVtMElmT0s3d3JQUGFhMmpyRkUw?=
 =?utf-8?B?S1VOYWZHdEREWGlwdFBJdjRBM2QvSzVuaU1pdkp4bEVucTFnZ21mV0NUeHhN?=
 =?utf-8?B?VmQ3d0IyRjM2ZFU0VmtiWks3N0NQdzVjVGFsL3ZBWEJZYWVtdlI1VHhYNlNZ?=
 =?utf-8?B?d1JUS3dUQWFVQ0paTlF1U09leHQzeVRvZ2VDRjM3OHdXZHpGZzUwR1M0czZ1?=
 =?utf-8?B?MXFuMjJJckFXYTg5cWcwNmZyZERBQmhlMEpSYm9wYWUxdCtuMlhvWWJwME5G?=
 =?utf-8?B?Rjkzb0hIYm1NanNlb3lSazF3N3ZVcjNyN0dyVFBHcDdOaHN1T091L2xLRkFp?=
 =?utf-8?B?ckErbnhEdUJNaUJFMEJUcHJqc2xvcDVzMHlXSkdpVk1OUjQ5TVM1Wkg4SGpQ?=
 =?utf-8?B?VmNaME0reDFjblBDYlF6aWdLR3M0bWdSbm9kTzVWVTg4RWdmbUNuRHdlczBE?=
 =?utf-8?B?TjlPbld5NGVUNm9WNkFxNXZpcXlCcExSOWJRcnM5cCtpRHBSbjRnQnpuUmhh?=
 =?utf-8?B?QVhDQ0NqQlRmdmRQNWJyTE1nL1AydVI5cXRkNEZNcklqRWJwTXdVTDhvQnhI?=
 =?utf-8?B?VUV2OWhtQjZUbk1lSmNEMmd4Y1BoZ2IxVm92cW9QYldGbVJ0K2I2bkJjQ2dO?=
 =?utf-8?B?eU1tbXJ6YXlqVktwWWozU2RvNW8zVnR3dUFSNkV5WURzaGlYaWRUZEJ5M044?=
 =?utf-8?B?cmRjMXlSbGpzaUJwcWJZcWxWOStwOTVWVy9SVGlsMGFlaldMelBtaEhpUTBQ?=
 =?utf-8?B?WGVpVkptdTlpYSsyNFZ1YjBHREZ3ZVA2REpTUWFvbnVNRWJTMjcwVFJ1M09X?=
 =?utf-8?B?bGpFc25ucElnd0JMSXFDeVZBQ1gwM1l4RVBSL0J2c0ZiMmhIZDA4Y2czZlAr?=
 =?utf-8?B?K0wzem1uYUxwYUZGaHBQWjBBM1liRmlHOWhQMkpWcEN6bzgzeFZHeUVjQXJX?=
 =?utf-8?B?eUVLcDJXZnpPeWlIZXZRdTJVemYxTlR0aHBOMlFKMk5kQXIyQ3lCOG90OGhh?=
 =?utf-8?B?QlJXNmFyWFk0WFByUEhFTnJaZ1lPdXVJUDBkMVJRYml6SnhlYVBLNkhIREpE?=
 =?utf-8?B?NmxncWdXZUVXcGtrUUg2MlU5Ujk1T2xKejlMaDlEVzltOWZwemY2SXdCZVEv?=
 =?utf-8?B?b3Y4VUdZNUErUHFLejNUNTBuTDNRc1RWc3kvQ2JublBINmE0YUo2SVlrWEtx?=
 =?utf-8?B?Mmc3SjcwREhVU2ZOeHVFQ245NExZVERFLzlETUZEdXpMVXQxVWhndjdxeHcx?=
 =?utf-8?B?QVVYMTFtSDJkdzRlaXo4OHhSakNnVCtxM1dKMlNBWGY0alJFbmhjQks2d2o3?=
 =?utf-8?B?ZE1RK3VmZW1sa1Q1c3dnVFlIVitxTlZ4cDh4cXRCV0kzNFhLRHg5UndRK3ly?=
 =?utf-8?B?K2VheGdVTTRmUE03ejBtc2hOblZDVVFxYjlrY3NRQmhKMjJidGlqR2tpQ2xn?=
 =?utf-8?B?bkVjTFY0YXpMa0JNajFKelhsTVFsd0pBL0JqQkdhRkNVcUF6WFVrM052MVVt?=
 =?utf-8?B?SnBZdm5uRnVPMzNXNzB2UzhEN2E5UVl3UkdhZEx3TlM4WDRsTUU5TXcvTHMv?=
 =?utf-8?B?RElVUjNNZGVPWU5kS0ZOVXZoK2dZVFE2aEVTUVhKUWdpZGZnc1N2WUU0U003?=
 =?utf-8?B?UlYyNUJIRUN5ZGNDZkdqTnFJaFpiN1RWd3NVY01zT0pFVi9BWk5qbkJoODl1?=
 =?utf-8?B?dlNZK05BSjFSYlIxczg4b2tBWCtGcVhMdG83QnllZjVZR0M1Mno2WEl6djF2?=
 =?utf-8?Q?gQOIlPw93mMpNsgx/BnORCq1g?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9333f8d-a891-4e36-0a35-08db554fe65a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 14:23:06.3156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWP3WnPO+FIlQEeQC3Eh7rn8qoIo+9gPQm9b9MgVcJycJNgJGHhH9dvjETLCwHWfXVQOz+wcr8k42//3pJUFog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6530
X-Proofpoint-GUID: 1NXkulqfrHhAIgbT3LgVp_gy_j34_jcH
X-Proofpoint-ORIG-GUID: 1NXkulqfrHhAIgbT3LgVp_gy_j34_jcH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.811, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 15/05/23 3:47 pm, Daniel P. Berrangé wrote:
> On Fri, May 12, 2023 at 02:32:35PM +0000, Het Gala wrote:
>> Socket transport backend for 'migrate'/'migrate-incoming' QAPIs accept
>> new wire protocol of MigrateAddress struct.
>>
>> It is achived by parsing 'uri' string and storing migration parameters
>> required for socket connection into well defined SocketAddress struct.
>>
>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   migration/exec.c      |  4 ++--
>>   migration/exec.h      |  4 ++++
>>   migration/migration.c | 44 +++++++++++++++++++++++++++++++------------
>>   migration/socket.c    | 34 +++++----------------------------
>>   migration/socket.h    |  7 ++++---
>>   5 files changed, 47 insertions(+), 46 deletions(-)
>>
>> diff --git a/migration/exec.c b/migration/exec.c
>> index 2bf882bbe1..c4a3293246 100644
>> --- a/migration/exec.c
>> +++ b/migration/exec.c
>> @@ -27,7 +27,6 @@
>>   #include "qemu/cutils.h"
>>   
>>   #ifdef WIN32
>> -const char *exec_get_cmd_path(void);
>>   const char *exec_get_cmd_path(void)
Even this, I will shift it to the 2nd patch, where I need to move 
exec_get_cmd_path() out accross other file (migration.c).
>>   {
>>       g_autofree char *detected_path = g_new(char, MAX_PATH);
>> @@ -40,7 +39,8 @@ const char *exec_get_cmd_path(void)
>>   }
>>   #endif
>>   
>> -void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
>> +void exec_start_outgoing_migration(MigrationState *s, const char *command,
>> +                                   Error **errp)
>>   {
>>       QIOChannel *ioc;
Sure, Juan. Will change this in the 2nd patch itself instead of here. I 
am not very convinved why should we have a different patch all together 
for this, because we are just using this code outside this file in my 
opinion? But if you still think so, I can make a different patch for that.
>>   
>> diff --git a/migration/exec.h b/migration/exec.h
>> index b210ffde7a..736cd71028 100644
>> --- a/migration/exec.h
>> +++ b/migration/exec.h
>> @@ -19,6 +19,10 @@
>>   
>>   #ifndef QEMU_MIGRATION_EXEC_H
>>   #define QEMU_MIGRATION_EXEC_H
>> +
>> +#ifdef WIN32
>> +const char *exec_get_cmd_path(void);
>> +#endif
>>   void exec_start_incoming_migration(const char *host_port, Error **errp);
>>   
>>   void exec_start_outgoing_migration(MigrationState *s, const char *host_port,
>> diff --git a/migration/migration.c b/migration/migration.c
>> index a7e4e286aa..61f52d2f90 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -421,7 +421,11 @@ static bool migrate_uri_parse(const char *uri,
>>   
>>       if (strstart(uri, "exec:", NULL)) {
>>           addrs->transport = MIGRATE_TRANSPORT_EXEC;
>> +#ifdef WIN32
>> +        QAPI_LIST_APPEND(tail, g_strdup(exec_get_cmd_path()));
>> +#else
>>           QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
>> +#endif
> This windows portability code should have been in the previous patch
> I think.
Ack, yes, it could have also been added in the 2nd patch. Will 
accomodate windows portability change there itself.
>>           QAPI_LIST_APPEND(tail, g_strdup("-c"));
>>           QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
>>       } else if (strstart(uri, "rdma:", NULL) &&
>> @@ -450,8 +454,10 @@ static bool migrate_uri_parse(const char *uri,
>>   
>>   static void qemu_start_incoming_migration(const char *uri, Error **errp)
>>   {
>> +    Error *local_err = NULL;
>>       const char *p = NULL;
>>       MigrateAddress *channel = g_new0(MigrateAddress, 1);
>> +    SocketAddress *saddr;
>>   
>>       /* URI is not suitable for migration? */
>>       if (!migration_channels_and_uri_compatible(uri, errp)) {
>> @@ -463,23 +469,32 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>>           goto out;
>>       }
>>   
>> +    saddr = &channel->u.socket;
> Accessing u.socket before checkout transport == SOCKET is bad
> practice, even though this is technically safe.

Ok, Ack. I understand your point, before defining whether transport 
could be a socket or not, it is not a good way representing and defining 
it earlier.

Thanks for pointing it out Daniel. I will change this in all the places, 
where I have accessed it before confirming if the transport == socket.

>>       qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>> -    if (strstart(uri, "tcp:", &p) ||
>> -        strstart(uri, "unix:", NULL) ||
>> -        strstart(uri, "vsock:", NULL)) {
>> -        socket_start_incoming_migration(p ? p : uri, errp);
>> +    if (channel->transport == MIGRATE_TRANSPORT_SOCKET) {
> THis should have
>
>      SocketAddress *saddr = &channe->u.socket
>
> so that 'saddr' is limited in scope to where we've validated
> transport == SOCKET
Yes, Ack. Makes sense.
>> +        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
>> +            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
>> +            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
>> +            socket_start_incoming_migration(saddr, &local_err);
>> +        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
>> +            fd_start_incoming_migration(saddr->u.fd.str, &local_err);
>> +        }
>>   #ifdef CONFIG_RDMA
>>       } else if (strstart(uri, "rdma:", &p)) {
>>           rdma_start_incoming_migration(p, errp);
>>   #endif
>>       } else if (strstart(uri, "exec:", &p)) {
>>           exec_start_incoming_migration(p, errp);
>> -    } else if (strstart(uri, "fd:", &p)) {
>> -        fd_start_incoming_migration(p, errp);
>>       } else {
>>           error_setg(errp, "unknown migration protocol: %s", uri);
>>       }
>>   
>> +    if (local_err) {
>> +        qapi_free_SocketAddress(saddr);
>> +        error_propagate(errp, local_err);
>> +        return;
Juan, I get your point. But I think, we won't be needing local_err at 
all, if I use g_autoptr for 'channel' and 'saddr' is a part of 
'channel'. Let me have a v2 patchset and if it is still not convinving, 
we can have a discussion on this.
> THis leaks 'channel', and free's 'saddr' which actually  belongs
> to channel.
>
> With my comments on the previous patch suggesting g_autoptr for
> 'channel', we don't need any free calls for 'saddr' or 'channel'.

Right. With g_autoptr used for freeing 'channel' in last patch, we wont 
have to worry about freeing 'saddr' at all. Thanks Daniel

if (local_err) {
     qapi_free_SocketAddress(saddr);
     error_propagate(errp, local_err);
     return;
}
And after changing the position for assigning 'saddr' and using 
g_autoptr for 'channel' I believe we can get rid of 'local_error' 
variable too and replace it with 'errp'. Please suggest if I am missing 
something here. TIA!

>> +    }
>> +
>>   out:
>>       qapi_free_MigrateAddress(channel);
>>   }
>> @@ -1688,6 +1703,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>       MigrationState *s = migrate_get_current();
>>       const char *p = NULL;
>>       MigrateAddress *channel = g_new0(MigrateAddress, 1);
>> +    SocketAddress *saddr;
>>   
>>       /* URI is not suitable for migration? */
>>       if (!migration_channels_and_uri_compatible(uri, errp)) {
>> @@ -1711,18 +1727,21 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>           }
>>       }
>>   
>> -    if (strstart(uri, "tcp:", &p) ||
>> -        strstart(uri, "unix:", NULL) ||
>> -        strstart(uri, "vsock:", NULL)) {
>> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>> +    saddr = &channel->u.socket;
> Again, put this *after*  checking transport == SOCKET
Ack.
>> +    if (channel->transport == MIGRATE_TRANSPORT_SOCKET) {
>> +        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
>> +            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
>> +            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
>> +            socket_start_outgoing_migration(s, saddr, &local_err);
>> +        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
>> +            fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
>> +        }
>>   #ifdef CONFIG_RDMA
>>       } else if (strstart(uri, "rdma:", &p)) {
>>           rdma_start_outgoing_migration(s, p, &local_err);
>>   #endif
>>       } else if (strstart(uri, "exec:", &p)) {
>>           exec_start_outgoing_migration(s, p, &local_err);
>> -    } else if (strstart(uri, "fd:", &p)) {
>> -        fd_start_outgoing_migration(s, p, &local_err);
>>       } else {
>>           if (!(has_resume && resume)) {
>>               yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>> @@ -1739,6 +1758,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>           if (!(has_resume && resume)) {
>>               yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>>           }
>> +        qapi_free_SocketAddress(saddr);
> This saddr pointer belongs to 'channel' which must be freed.
Again here, with your comment in last patch to use g_autoptr, we need 
not to explicitly free 'channel' or 'saddr' right.
>>           migrate_fd_error(s, local_err);
>>           error_propagate(errp, local_err);
>>           return;
>> diff --git a/migration/socket.c b/migration/socket.c
>> index 1b6f5baefb..8e7430b266 100644
>> --- a/migration/socket.c
>> +++ b/migration/socket.c
>> @@ -108,10 +108,9 @@ out:
>>       object_unref(OBJECT(sioc));
>>   }
>>   
>> -static void
>> -socket_start_outgoing_migration_internal(MigrationState *s,
>> -                                         SocketAddress *saddr,
>> -                                         Error **errp)
>> +void socket_start_outgoing_migration(MigrationState *s,
>> +                                     SocketAddress *saddr,
>> +                                     Error **errp)
>>   {
>>       QIOChannelSocket *sioc = qio_channel_socket_new();
>>       struct SocketConnectData *data = g_new0(struct SocketConnectData, 1);
>> @@ -135,18 +134,6 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>>                                        NULL);
>>   }
>>   
>> -void socket_start_outgoing_migration(MigrationState *s,
>> -                                     const char *str,
>> -                                     Error **errp)
>> -{
>> -    Error *err = NULL;
>> -    SocketAddress *saddr = socket_parse(str, &err);
>> -    if (!err) {
>> -        socket_start_outgoing_migration_internal(s, saddr, &err);
>> -    }
>> -    error_propagate(errp, err);
>> -}
>> -
Actually Juan. I don't need this function at all, because parsing of uri 
into socketAddress using socket_parse is already done. So there is no 
use of having this function in the first place, so I decided to delete 
this fucntion all together. Same with incoming function.
>>   static void socket_accept_incoming_migration(QIONetListener *listener,
>>                                                QIOChannelSocket *cioc,
>>                                                gpointer opaque)
>> @@ -172,9 +159,8 @@ socket_incoming_migration_end(void *opaque)
>>       object_unref(OBJECT(listener));
>>   }
>>   
>> -static void
>> -socket_start_incoming_migration_internal(SocketAddress *saddr,
>> -                                         Error **errp)
>> +void socket_start_incoming_migration(SocketAddress *saddr,
>> +                                     Error **errp)
>>   {
>>       QIONetListener *listener = qio_net_listener_new();
>>       MigrationIncomingState *mis = migration_incoming_get_current();
>> @@ -213,13 +199,3 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
>>       }
>>   }
>>   
>> -void socket_start_incoming_migration(const char *str, Error **errp)
>> -{
>> -    Error *err = NULL;
>> -    SocketAddress *saddr = socket_parse(str, &err);
>> -    if (!err) {
>> -        socket_start_incoming_migration_internal(saddr, &err);
>> -    }
>> -    qapi_free_SocketAddress(saddr);
>> -    error_propagate(errp, err);
>> -}
>> diff --git a/migration/socket.h b/migration/socket.h
>> index dc54df4e6c..5e4c33b8ea 100644
>> --- a/migration/socket.h
>> +++ b/migration/socket.h
>> @@ -19,13 +19,14 @@
>>   
>>   #include "io/channel.h"
>>   #include "io/task.h"
>> +#include "qemu/sockets.h"
>>   
>>   void socket_send_channel_create(QIOTaskFunc f, void *data);
>>   QIOChannel *socket_send_channel_create_sync(Error **errp);
>>   int socket_send_channel_destroy(QIOChannel *send);
>>   
>> -void socket_start_incoming_migration(const char *str, Error **errp);
>> +void socket_start_incoming_migration(SocketAddress *saddr, Error **errp);
>>   
>> -void socket_start_outgoing_migration(MigrationState *s, const char *str,
>> -                                     Error **errp);
>> +void socket_start_outgoing_migration(MigrationState *s,
>> +                                     SocketAddress *saddr, Error **errp);
>>   #endif
>> -- 
>> 2.22.3
>>
> With regards,
> Daniel

