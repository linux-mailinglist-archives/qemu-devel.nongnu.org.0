Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6308D5FD710
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:27:53 +0200 (CEST)
Received: from localhost ([::1]:59376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiuVM-0005ub-Ej
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oiuFA-0000B1-KX
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:11:08 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oiuF5-0002p0-Er
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:11:07 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29D8cobS004643;
 Thu, 13 Oct 2022 02:10:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=7nrVTsQZmqr6Gg3f96bR5J+vunS45UvWB0EiSvjZavw=;
 b=LCvcEnBJLPvFI7nOfgSnkaSFYiLDcgJvN9Azaq3n8tNemR0dtTFm+WGk30ib3Mqjp8wp
 hHLlJb9LR2teLgGIKiy5kzN0zkX8QrPivTWRfYRp5mntkS4GvrFQWNL1cEje3HHmBchd
 ka4dX9/DP3xKhRTeEUzPu6VeyyvprtN4EEM5jqHqL/9xlNlmbG/K7dErk3zs34Pr0zeZ
 +NyiIsvXhViZ6SsU5NivKLMeVuOrTbEjEJ1t0f9Ctv7K1+Ld5xf0RB7PTsozW+mMpq6t
 PrYsq1mxT2IyjwruAxs79sxmcxT/BYYIApEBW88diUzB9ASeoXKvFabwHczhn6zhgUDs CA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3k35474fw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 02:10:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpE/AvIGJ2dEBtrVL6u59/Jl5oEGdfK1DnXReFg+3SFpxDaAhzQUKEXO+BvKAKxhpN+S8VBqrGcNBMaNJxuSJjl+BtpMdCT12qLxjgeg/zT3w97KLoP9NPge3017PT7plPr4wdKV5qDoDVhPOncherrNigFL9RlvApffuNBBT+Bu5DvT+NV4wtRQiA+uQ5dRGiv9GoWnKOUedU36AqeuY3j6X5ZKAO2NpzzPZrsQ8HjY8yvDHK1/6jGlA6zr5r7Fv0sG3islTMdrHQI5i71MfCQxsGecYJMYmAkj9bV1SiuWf0J1UFTPcwDooeAQhbXGRGqy8LvrHpp0h6pON15KxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nrVTsQZmqr6Gg3f96bR5J+vunS45UvWB0EiSvjZavw=;
 b=E+ENNTTwPUqSbhjYjYzrt9py3I7BCyFGiwxuxf3pdnNgwPGiGHP4jEKpALKw+snQA1wH1m94fQoPVOV+uwksE8PbiR25ZVPGs6E/tBikNY/g1wxbrUxvRs/hk54bID2CzL/VxhP6CkjBaI9GN1V74sNCv0Kp7h+9ObMsMaANAv9Eyc8dRPf6CkH2Rgo9ZBJDnLxHv1pL3dI5yTLEDwWwdOdAevr4FsyRlF1edgPYp5uVSO94frtDDXijAqp0WJAgYU94CtzJHDHoIJqSgL/eaVY2uQPlJ+vbbef59BISYcnVRGbsxTwN/FQ0e3Pla+ZwhiusSFAoYs3m+dCrm8mTcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SJ0PR02MB7248.namprd02.prod.outlook.com (2603:10b6:a03:293::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22; Thu, 13 Oct
 2022 08:56:26 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::a88:8114:7d28:5834]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::a88:8114:7d28:5834%8]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 08:56:26 +0000
Message-ID: <8090e692-7919-ea47-5eb9-30834656593d@nutanix.com>
Date: Thu, 13 Oct 2022 14:26:15 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: MultiFD and default channel out of order mapping on receive side.
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
References: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
 <Y0fJFcj9+wcnKYqd@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y0fJFcj9+wcnKYqd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::22) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|SJ0PR02MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: 627604f4-32af-492d-c54a-08daacf8cf59
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kk4FQv5J39uwVDrhdSlcGZar0a3EKVRSERa7LrGbIN2QSinGoLjIIl24ohXCS+eayZ3oE8rKGnBEpgCkd1sUb4hd7NmvFAd3weBLmquZfb9wOfX36GNQDjcKTp42OQm5qdtJ2QxeT/EpmQWSuEUofMl32HID38k6+6bva3Vtel03CHeiR71ywy1i5/agEnkSOJZDcDEgPq4wTnDQ4O2Pd22ScLqxRFSuAszdwPCJvUjuxhCT469YSA6u6wTRuguq7Z8rTKHtWPlqD4HrzRcZPg4qc8nAUfXSujA3UGBbLk7Wsa9t+TcjnscrsP3quLs5pZWxrjP90iRd4VosbeD1fOlCDWU5xPCDuNBRDsyaKMvPkmNbB1ECNEGgrxBppA0I2DLsB28e3E6XTK3KNv+h533eME03VG+jjjUF5S1tJqlFpyHNfIaqIZcI12bYRlbtkfN1+vGoYjmfMEol4+5PJrVCjeXNIcKKGI4dFbbCsnxFpnQLwf2nms3h8WjtjRjr63nvAAOzQPnqb0ps/eTGe99bKHB9GfiC0cTj5TMP7nVwQzofs9kg60LjHnNqj3AJJdRqPhkzOJGdIln0XZetiDk97VTNNreoTkvlA0MAfJTKmuPQI1D75lDF+K94b5h8Q9EL2qpl9/MWLvF1VIUbh+6Ubmwov6zphaiuNAyiNXdcip6xIv/K12M9/+HObL+bJ7TAQZnn9fDdYgRWsWa7rRJtCTgPAfctt0XBC5D6IdpjA+CHuub8GcOpCxAYmXdmE+v/2tHfChi58Ymtpfcr96zTtr8SFkDGMOymhfxjkY+fF0+usCvv26rLHkBYwy1X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199015)(54906003)(4326008)(31696002)(36756003)(41300700001)(53546011)(6506007)(38100700002)(6666004)(86362001)(26005)(6512007)(66556008)(8936002)(5660300002)(66476007)(66946007)(478600001)(8676002)(6916009)(6486002)(966005)(316002)(2616005)(2906002)(186003)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0VoMWhncFZVV0Q2T2ludWowbFQ3a1VIYlVBL3d2OVlwbHVRWXd0NWFLZXNB?=
 =?utf-8?B?bWg5aHVDSjZudks3Zk80S1lDdmtGRlIrQ2hqSFVSbXNWdWhRQkNuQ2syUWpO?=
 =?utf-8?B?emkxNVJRWUtPcTdqYlBtRkFwa1BraW1kOTBlYXZDWmU4dGo2cjdxblVoVm9S?=
 =?utf-8?B?Z1o5SEFTSXdoL1hQVHVMV3dOZkVoSzZtQVFxRTRheWovdHU1UkVuTVBtdHhQ?=
 =?utf-8?B?TmRqS0JsbXlLUVdBS0hjdWFLb0szNjZRdXRqaDhlWDJwNFJiUXk0YzVvdmtC?=
 =?utf-8?B?VDlTUUMva3kwUG9OT05YWlJpeldVZThyc0cxc01KT29ZTmtJTHYrMHk0eFBs?=
 =?utf-8?B?VGNKcWYwYzVML0Y3WnJScHNmWTAyZmJMNHdDR3BFMWtNRmxuZzc1dFlpaUd6?=
 =?utf-8?B?RTJlUzF2cDZkTlBUVEl5aWNocnMxK3VVWkJkWUNEN0liOEhiMVJQM1A3c05i?=
 =?utf-8?B?QTRma0VqNWQ1MnJWd3loZUhZTGFUUXIxbW0zM3JqU052SWVkTXdlMHpFRXF1?=
 =?utf-8?B?YzhXTS9wc3pHWkxEazlsNTRWY2x2Zmt2dERaT0Nla09rYUdFSldIZkM5MTYr?=
 =?utf-8?B?UU1ncGdqWS9LL0w4ZG5xSDJEN3JqYXlIQmVBTUpsQTBSMHh4Z2VKK1paQjNO?=
 =?utf-8?B?alhtS1lDMGtqazJaOEZ2VXN0SlJTZzFCOUdQU1hhenBpRFA2OTdaSDFTZ2xm?=
 =?utf-8?B?Z0M3dTNCVldBSmVJREw0NU9jekczbTROMU5Yd1BsMmw3Snl5U3Q5cTRYbGtn?=
 =?utf-8?B?MTlwKzN2TlZTcUh3VTh6cGxFQjJ1VFBUSVhkRng4R2VJN2N4NDFka2NyQjJ0?=
 =?utf-8?B?aDBEeWJqaitvQ095Q1hRNitoVGpKZFNwR29nQU1CcVd3SE16MlRnYVIvU3R6?=
 =?utf-8?B?bmRsd3BzYm1ld0xFT3VTOHpRTGN2MFh3bk5Nc1NNUlE3b2lxVjJQUnViZzJl?=
 =?utf-8?B?bzhYNUlQZVA5SGluU3hYY3lwNzhUYXVRejZZaWxQZU9IRVhieWs5azZGUzhR?=
 =?utf-8?B?aitPZ2Y0K0p1eEZid0c0Z0ZRMnRMTlZmYm11Zm5saUpqSTM4aE9FcWhvL0xY?=
 =?utf-8?B?ejY0cHlPY3QrZnJwVVRKNVhkRC91eVBIaERFUXlUVldoeEU0NkZScTJ3dDNk?=
 =?utf-8?B?bmNxTFVWdVlXSGNLT1FBMi9TMkRBUjZFbHY5Wnp0akVRQWxqSEFjM05MTXNN?=
 =?utf-8?B?anQ5Rm9GN0dVREIzeFlOdG5pRVVobDJqamc0bTg5TWVmdGlDZldTakExNXNS?=
 =?utf-8?B?UVFPbi9neFloTUs5RGppVmpTdktwcDM2SkNrNTNlRWsxQXQ0MkMrTWpGMmpj?=
 =?utf-8?B?YVBlS2dmRFZoekV2QXdGUEhoYWJEd1dabDUweE1OVWR2Wmk0MVRMVXJNRGE3?=
 =?utf-8?B?UFNPNk14RE8zV01XM3g1bWgrdkgySkFtcTNGVnFwTVg0YVAxYTJWelFQZ2E0?=
 =?utf-8?B?NXpMSFdSZkJLK0VKbTZ2MFl5ZVFQUUQvQXFObm5sdFdpbXpRT1NZV3ZFUGlU?=
 =?utf-8?B?b2lzLyszYlF0bHp2Z0RzV29Zam0wTXF6bzkvakxKdlNXQi9YTzNFRDhoUFNp?=
 =?utf-8?B?SmVPbXNpVGdBOWNNNWJkYXg0NG02a1AyTXNOVWNTQ1NYakFEbEgvL3k3R3NC?=
 =?utf-8?B?N1UxUUtVU3draG9TazMrY2crV3dOenh0eVNSckRxTmpQbUpzcUNQNVFNckwx?=
 =?utf-8?B?MUlVWkZRSnQyeUp1d1hUTmFWY01OTmE5NjVXZFZFVnZDaXpwcDk0WnFiN1NQ?=
 =?utf-8?B?NjVIaE5qK0k3SXA5ckZSVHU0RXhFK1ZCeGxvY2o3RnF3c2F2UkVYQ0V4MGt4?=
 =?utf-8?B?d21Pa2pZbmoxeVdwTmV3dlg2UDFDVjk5ekJYdWVlQ00zd3MvNUlrakFOdTBw?=
 =?utf-8?B?ckhXY1N0a0l1K2grdkgwRjZOdmh6ekV1Yk9kbVB4REJ6aDFPY2lxZ0tTakVz?=
 =?utf-8?B?QitiZm5qV3huS2NaZFN1L255QkhwRzMzakg5SVd3M01PWFJWaFh2SWhQVGVj?=
 =?utf-8?B?aFFTWkZTYUFkZHlXVW5reHNhSXAxYlNtSERMWVhjU0djeldxTzVySXIwNVJT?=
 =?utf-8?B?RVNDUDZWclJXNjEvVUwybkRoNUhSK0thL201L2N2SGN3ZGNmcG94RS94S2RQ?=
 =?utf-8?B?WmFaTGxjejd5Q2FicXFjbDhhdUxJRExOT1RMVEFuUjdtdDcwUitGZmZYRGZJ?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627604f4-32af-492d-c54a-08daacf8cf59
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 08:56:26.0897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUnuvUAIy2hFIEHs+WtwUuonfeboQ8Kyon5Co/hvHJqSBldFN66b0L8asIgBq3ck2rttdiX0gfqpDrc6j+yqKcb9QetZA4Viv/lsVlz+6Kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7248
X-Proofpoint-ORIG-GUID: 6Tx0RMRi-L_MPuVD-k7wivjQNfgZR_D3
X-Proofpoint-GUID: 6Tx0RMRi-L_MPuVD-k7wivjQNfgZR_D3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_06,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.528,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 13/10/22 1:45 pm, Daniel P. Berrangé wrote:
> On Thu, Oct 13, 2022 at 01:23:40AM +0530, manish.mishra wrote:
>> Hi Everyone,
>> Hope everyone is doing great. I have seen some live migration issues with qemu-4.2 when using multiFD. Signature of issue is something like this.
>> 2022-10-01T09:57:53.972864Z qemu-kvm: failed to receive packet via multifd channel 0: multifd: received packet magic 5145564d expected 11223344
>>
>> Basically default live migration channel packet is received on multiFD channel. I see a older patch explaining potential reason for this behavior.
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.gnu.org_archive_html_qemu-2Ddevel_2019-2D10_msg05920.html&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=LZBcU_C3HMbpUCFZgqxkS-pV8C2mHOjqUTzt45LlLwa26DA0pCAjJVDoamnX8vnC&s=B-b_HMnn_ee6JeA87-PVNBrBqxzdWYgo5PpaP91dqT8&e=
>>> [PATCH 3/3] migration/multifd: fix potential wrong acception order of IO.
>> But i see this patch was not merged. By looking at qemu master code, i
>> could not find any other patch too which can handle this issue. So as
>> per my understanding this is still a potential issue even in qemu
>> master. I mainly wanted to check why this patch was dropped?
> See my repllies in that message - it broke compatilibity of data on
> the wire, meaning old QEMU can't talk to new QEMU and vica-verca.
>
> We need a fix for this issue, but it needs to take into account
> wire compatibility.
>
> With regards,
> Daniel

ok got it, thank you so much Daniel, in that case i will try to create some patch considering backward compatibility and send for review. Mainly i wanted to understand if it is handled somehow differently in upstream master, but manually looking code it did not look like that, so just wanted to confirm.

Thanks

Manish Mishra



