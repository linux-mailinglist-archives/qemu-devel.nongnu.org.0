Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8BA575D22
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:13:58 +0200 (CEST)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCGSS-0000S3-OQ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oCGMd-000270-Ns
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:07:56 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oCGMT-0007kz-4Z
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:07:55 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EM0OPV031316;
 Fri, 15 Jul 2022 01:07:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=lNFj4+dtGwofXNvlF2p0xph8iTwK40b83nZnGpLxWy4=;
 b=gad1P5Pf7JV6yBX81A0KM4B2eTNoWFDAdoExFKhDjE5p+v1ywgXpEz18m9E0Tp4xJY3J
 AhVmm8hFgwgOr1uusYqwZWiD0tW5ftEkBiGzvuaA7fKdM1dy8WTpFzBZW+E+P05lHMQr
 1Pzouf+zjcnFttCw5wSXiZwaG7xGNzsDrN4fgft3iYfIeNtxW3tIwVUPzsjBt4Ma5XH4
 vCfgqufX/12/LwVokkGd/CDyUZeUEOVVEnWK7GaDWEgdbWDgWwoPp1DF4800qzl0TsRM
 fryrRVpYgWIIulww/uDiJISDFeGpGj8fjSeCoiyUagtKvdh0zyHfCTD6vC2usIS/XdVG bQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3h7981mjed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 01:07:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mc10DXRVsPGvW/SHs1h7kGNvk7X9X15vgEHDuPz24eSZWpjAv5tZ3zx8EhJ4iSwp+M9lFx5h+J2QsUjka6QN2KZozAjAw7TfgY3QcZVOAurvuqjnPiEWRgFxtQZuwWYxbcFh/XNv/kmGN12cXp7BOIY7ZuQ8OqKivfUmgi2UuYY1fwPmfv4qsZovCXOCgBNKvqvWSeRDfm9Hxttz35W3gcocU1DpWqQTpzmZBSE4vkxreOESG+KDoHV6sK9eUHj9x8ElhFMERxm13LYlaN5K8C6eLTuCIYUTxmRRKQzf2JE8ne+BCp3FZtq7ligIeCKQxGrK2sd/+STED4+6zK2mPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNFj4+dtGwofXNvlF2p0xph8iTwK40b83nZnGpLxWy4=;
 b=my+H6ycgaj/rgbp5ziBBvPRxB8pJkUV5c65z+BqVwmwMjK6796UG90s04WLYRNTz3HSmKBCf6KdqniCsKw09C6/ZktZG1jsGMhTI+Y8Yr/ab0znDsDj0Vf7/u2sEu6u6x7RGRShucd4StwCILvbdJ084CcDdG1KB4B/RP8p6oE3ak60P8GnfV+FTX7ROCTjdf+b9H9hIZ1YWd0TGfkdDNaeXRANEWiWoK90pat0mjqQIlJJ86WLY5m0zbjGGTAa1LryZaZBJ6OYfW4Q5sW9wq2nTFjEKy9kzqVNu9Y3yDzlaJvbYpSfoQO45DFPppA1YbRaUoJbIeMys5DT0TrLcnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CY4PR0201MB3539.namprd02.prod.outlook.com (2603:10b6:910:94::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 08:07:32 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 08:07:32 +0000
Message-ID: <eba4a86b-a192-c3da-8c99-11d84f62324e@nutanix.com>
Date: Fri, 15 Jul 2022 13:37:20 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzRdIE1vZGlmeWluZyDigJhtaWdyYXRl4oCZIHFt?=
 =?UTF-8?Q?p_command_to_add_multi-FD_socket_on_particular_source_and_destina?=
 =?UTF-8?Q?tion_pair?=
From: Het Gala <het.gala@nutanix.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, cfontana@suse.de
Cc: qemu-devel@nongnu.org, quintela@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-2-het.gala@nutanix.com> <Yqtn1Q5Dkd2fe0G2@work-vm>
 <56453bef-6b73-4493-f3bf-d2d2315be723@nutanix.com>
In-Reply-To: <56453bef-6b73-4493-f3bf-d2d2315be723@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5116b48-153b-4ea5-293f-08da66391114
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3539:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HbJgrIaeGvHGoz49wkk/wRdjxAN9WllVLQPXAeZCUjAcNku1p2ARya2l6uSzqg05ekZBPCbGH4ixt16BoS4lOSxfDoSpxmwDwsmhcdoPyFwHegpvYtQUARUMMytkhvh+uBoRgS6eCf+SANOc5/Zu8gdlZmUdZ2YTdfeGI87idC4ToFVAl5wOjmNCy92DnP9ID3k3cDV7z6Vz3txUAvPtGlX/n8WTQqH5VyguiVuquaIhF9oZo9mMzjBwDitVGypsdTQO79uyWOnJdoWjJpO2XMhgxyYYHZNGVoYp3G9cPYWsDyHOwXLCZ0gOKfzidtKLUWW/UyfqykZboo7hodpxzC5XhIQYC8oWrpGaAsCDk0gcCR/wHLS9NOkJX7HuNasBjKQcFtmJKTXxHGjddFuK+NUx4DevB44uMNITAqKShFte3xzF2EaRSveSmTDs6M97dXeKKyHjBbJVckFyAvNivi1+lA0zkSGOTkwKFaS+9jAGiUq3WXSSkHO/VR0db2IOTRrO+HhZkuppMAD7quEy0uox9NjdENZeCY31VzQiv3AVbQG7CZA9Ka6OZBjh+jp67BzlncDStCn8rvduL2mSY+QZjkMwAwb9GD9N4tpf6y7IUfBx/VzoO3L4NzdBEKxg4PSfpdJUSpiesk2AohThzkGY9/Ni55FcWlPwF+2ZrJxW/bu++A4uDkcsKTq9uWbgZ7Ms4QACzmcq/gWRSbZwxMeEosI56Wnjwxx66Cf/ztv2KdJoQcY7sUzkWASZmiM3aTirK9Df2uG7yyq81+1qJhkfwXFOY57r7Yrh9E+6uAa4l4cFLI1N8Yu2I8N393+uBoy3NuFnZMcmV+1aJ7aRiyj1in4pFhP029sqwfjd04mrq4MJnayAiUvDjBtmB1Q5Fk8JlhOwXdaQ324H4Ou8aN6aq/sRzIeD3Xs3b9+77lU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(39860400002)(376002)(346002)(136003)(4326008)(5660300002)(186003)(31696002)(8936002)(26005)(966005)(2616005)(66946007)(41300700001)(6486002)(38100700002)(66476007)(107886003)(478600001)(52116002)(38350700002)(86362001)(83380400001)(66556008)(53546011)(316002)(6666004)(6506007)(6512007)(30864003)(44832011)(36756003)(31686004)(2906002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWtqeWs3SjhaZ3NQMTFkNmlGU0syVFF1ckRhRktXMUVJbDA5TlY1amNRT3RN?=
 =?utf-8?B?T1NjN29IUG1hc3UwNlljTEhrRFA3aHJZRjBSdmhpSHMxbUp2OFpxSUxNOUpS?=
 =?utf-8?B?Q1QzejRkdXRBbnd1bGd1dXM4THNZK1ZXb1V2R1JHMVRiL3hTWUpUYkxRVWl4?=
 =?utf-8?B?Q2QvcFpjR0Y2Y2RFbXJ2REdteEgrNVJUNVNCVUFCcnpaZVhuRHBlWXpXbm9p?=
 =?utf-8?B?UVFkb1hXUEtkbktYc2tpM0dFYk45UWZWcHJtdEFHQ1lIV2VlSzJrSXNCZ0Fa?=
 =?utf-8?B?VHVFakVCSFdkWnRyelRuaFlFRWI4ZFlsTHAwRE4yM2l6b2RkSDFxUGRhZlBu?=
 =?utf-8?B?Q2s1cGxGd0Y3SWg0STR1SWNUNWd0ZHRGa0liNEhJZ041MlRWUkVDSTZrNE41?=
 =?utf-8?B?SzVoamlRQSt3bVNsRGdtQkkyQWhqOFdRanRLREo1NTBKTVBxMlVIbDZnVjhv?=
 =?utf-8?B?cUxOcEZ6QXFtN2puRzFOZ2dyc25mNXZqc1oyN2IydGN1anlyR2VodFMwN0Vv?=
 =?utf-8?B?QkRzUVp1L3FOTlFBeE5zWjVsdi9iS1FJak5LTHFaOHZKUEtPOGw1MkVFSFRV?=
 =?utf-8?B?cVNtVmhhaFdsOEJYNlRYYVRsY0UvV0NiYWRtWDUxby8yaEltb0pGT1N4WTNv?=
 =?utf-8?B?ZnlaSHJmQTlodWRLeEVPUHJRRmI1emNabGRTN2d4WDc0cm5mY0lJdXkwVml6?=
 =?utf-8?B?RGFtZHloZHhFOUhRRFhaQjBhQmFUV21PQVA4NVRSS0NOanBkYlFYUmFxa1h5?=
 =?utf-8?B?N0RaejZjaGsyaVdPaWZWYVRMT1BJUkhDZUN2Z3NZOE5jSjdla0pYaFNrY2ZU?=
 =?utf-8?B?aGkzZDFxM2lqTU9vSHl1Rkdmc3RFdCtKZ2YzRTVid2tzMDZVNGhnOGpvTXBv?=
 =?utf-8?B?aDFVeEFXUUtIcmlySUhEQU42SVBLSklZSXFHVUQ4bnV6LzhobEdUMTAyVHBY?=
 =?utf-8?B?Zm9wZHZDU1RZSTRSOTlxV2VCK3BOT3JoazVQdkVLdEsyVldQYThENVVCdEw4?=
 =?utf-8?B?WXQyYzV0NEF1a0JINFBWK3drTDVnRk5uTS9lZmh3UTJ2WVR6V3VpK2c5V082?=
 =?utf-8?B?VjFkQkhhSHR3OTV2Q09ZZzBJNEJCNHVwM0dQWlpHTUtNci9WYk95L1Z5MS9a?=
 =?utf-8?B?LytxWXdtN25zTGlyUzh6KzBNSjJuNmZLaVMrY3ZCYjA5cGFSMDdlRU1tdGgz?=
 =?utf-8?B?aFFqQnBzc0lvSEh1Uk5PYlc0SVNBRlI3YVZqQVY0UDNreVVFcHF4bFc1eFJB?=
 =?utf-8?B?SEtNY1RvRURKRWxzZm9wc2ZaYm1tRkg2ZG5zcWNKUWlUNm1MemlGVVhTMjcv?=
 =?utf-8?B?M3VYem9UMHRKcU4xbW5jRklzUDdjZXRvbkxHdnlIWTd3ak1pV096WFJNL2oz?=
 =?utf-8?B?YUJETHVzQzFjTUYvZmtwZTBHQ3RZMjJ2eTFmZTIydXFieDF5L3ZMOXUwUkU5?=
 =?utf-8?B?Zk05c2g2ZDFKazFBRVRJU3k1TzFlZGpQcFRZN1lDTEJBSmsrSW1saU5pVzZw?=
 =?utf-8?B?eldoNU5DblN6VnliQTgrVVVPcktjOGhoYVN2QjcrVXp6N0QrdzZMSXJ0akpl?=
 =?utf-8?B?WDFwTTZUemtacW9WUEMzWTZETzVoMHg0eDYvK2VleVE5UkF2TjZYSjhBeTg4?=
 =?utf-8?B?WnJsSHBGWHdaTlVaejR3YU1hcjY1ZlR0RjB4Y29Sa0ZEaWJncG5FcTdIK2Fq?=
 =?utf-8?B?dFFYUFdtYmE1T3hYMWNZaVNqTVlVazh5a1FHRENOaktuZkNhM2JJaUk4TkJV?=
 =?utf-8?B?d00wVVVUTllHL3B2QTRvak02QW5SbTA1TW5zcHVoMHRJZ3RiZ3pzTERUWjVr?=
 =?utf-8?B?TGFvMWFtUmRWRVhlaEJNcnJQZHJxb251emUwb0tyQjhOTWdQelRNM0JaUjZ3?=
 =?utf-8?B?WUsranc2OW56TmJPOGZWVVYyR3Q4dFl4OERvQVIzeHZCZlJpS1dDWklrbXNw?=
 =?utf-8?B?Qk1FR01IWE9VTkZPRjJrc1FzNk5xTnJ4eVhPRlpwUUhsVllTSEV1Y3NESGo2?=
 =?utf-8?B?VTYrUnNTSHIzVmR5TXpLZnFLVUd2bEMrWE9XejhHNHkrRXY3ZXd2T0dqemRZ?=
 =?utf-8?B?K0NVZEFJSlA4VjlMMWErSWhVWGdZL01RUldPZEd0aFZxbGwzSXZpVFpScE8y?=
 =?utf-8?Q?UOHYysTsLroQfpiStczdXI9PN?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5116b48-153b-4ea5-293f-08da66391114
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 08:07:32.0955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxxn9D3U5S8XuqOxLdapnP5KW7s1P1kjKZJvQyi9CyGHvEpMxvNK5JXc7KItTPZ8pyeZ8aS3fUjaI2LvlzIeqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3539
X-Proofpoint-GUID: d-LVSZQX40WASuYmX2S3wpHzr6cXTpA3
X-Proofpoint-ORIG-GUID: d-LVSZQX40WASuYmX2S3wpHzr6cXTpA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_03,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 13/07/22 1:38 pm, Het Gala wrote:
>
> On 16/06/22 10:56 pm, Dr. David Alan Gilbert wrote:
>> * Het Gala (het.gala@nutanix.com) wrote:
>
> > First of all, I apologise for the late reply. I was on a leave after 
> internship ended
>
> at Nutanix. Hope to learn a lot from you all in the process of 
> upstreaming multifd
>
> patches.
>
>>> i) Modified the format of the qemu monitor command : 'migrate' by 
>>> adding a list,
>>>     each element in the list consists of multi-FD connection 
>>> parameters: source
>>>     and destination uris and of the number of multi-fd channels 
>>> between each pair.
>>>
>>> ii) Information of all multi-FD connection parameters’ list, length 
>>> of the list
>>>      and total number of multi-fd channels for all the connections 
>>> together is
>>>      stored in ‘OutgoingArgs’ struct.
>>>
>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>> ---
>>>   include/qapi/util.h   |  9 ++++++++
>>>   migration/migration.c | 47 ++++++++++++++++++++++++++++++--------
>>>   migration/socket.c    | 53 
>>> ++++++++++++++++++++++++++++++++++++++++---
>>>   migration/socket.h    | 17 +++++++++++++-
>>>   monitor/hmp-cmds.c    | 22 ++++++++++++++++--
>>>   qapi/migration.json   | 43 +++++++++++++++++++++++++++++++----
>>>   6 files changed, 170 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>>> index 81a2b13a33..3041feb3d9 100644
>>> --- a/include/qapi/util.h
>>> +++ b/include/qapi/util.h
>>> @@ -56,4 +56,13 @@ int parse_qapi_name(const char *name, bool 
>>> complete);
>>>       (tail) = &(*(tail))->next; \
>>>   } while (0)
>>>   +#define QAPI_LIST_LENGTH(list) ({ \
>>> +    int _len = 0; \
>>> +    typeof(list) _elem; \
>>> +    for (_elem = list; _elem != NULL; _elem = _elem->next) { \
>>> +        _len++; \
>>> +    } \
>>> +    _len; \
>>> +})
>>> +
>>>   #endif
>> This looks like it should be a separate patch to me (and perhaps size_t
>> for len?)
>
> > Sure, will try to make a seperate patch for QAPI_LIST_LENGTH, and other
>
> such utility functions from the other patches.
>
>>
>>> diff --git a/migration/migration.c b/migration/migration.c
>>> index 31739b2af9..c408175aeb 100644
>>> --- a/migration/migration.c
>>> +++ b/migration/migration.c
>>> @@ -2328,13 +2328,14 @@ static bool migrate_prepare(MigrationState 
>>> *s, bool blk, bool blk_inc,
>>>       return true;
>>>   }
>>>   -void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>> +void qmp_migrate(const char *uri, bool has_multi_fd_uri_list,
>>> +                 MigrateUriParameterList *cap, bool has_blk, bool blk,
>>>                    bool has_inc, bool inc, bool has_detach, bool 
>>> detach,
>>>                    bool has_resume, bool resume, Error **errp)
>>>   {
>>>       Error *local_err = NULL;
>>>       MigrationState *s = migrate_get_current();
>>> -    const char *p = NULL;
>>> +    const char *dst_ptr = NULL;
>>>         if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>>>                            has_resume && resume, errp)) {
>>> @@ -2348,20 +2349,46 @@ void qmp_migrate(const char *uri, bool 
>>> has_blk, bool blk,
>>>           }
>>>       }
>>>   +    /*
>>> +     * In case of Multi-FD migration parameters, if uri is provided,
>> I think you mean 'if uri list is provided'
> > Acknowledged.
>>
>>> +     * supports only tcp network protocol.
>>> +     */
>>> +    if (has_multi_fd_uri_list) {
>>> +        int length = QAPI_LIST_LENGTH(cap);
>>> +        init_multifd_array(length);
>>> +        for (int i = 0; i < length; i++) {
>>> +            const char *p1 = NULL, *p2 = NULL;
>> Keep these as ps/pd  to make it clear which is source and dest.
> > Acknowledged. Will change in the upcoming patchset.
>>
>>> +            const char *multifd_dst_uri = cap->value->destination_uri;
>>> +            const char *multifd_src_uri = cap->value->source_uri;
>>> +            uint8_t multifd_channels = cap->value->multifd_channels;
>>> +            if (!strstart(multifd_dst_uri, "tcp:", &p1) ||
>>> +                !strstart(multifd_src_uri, "tcp:", &p2)) {
>> I've copied in Claudio Fontana; Claudio is fighting to make snapshots
>> faster and has been playing with various multithread schemes for multifd
>> with files and fd's;  perhaps the syntax you're proposing doesn't need
>> to be limited to tcp.
>
> > For now, we are just aiming to include multifd for existing tcp 
> protocol.
>
> We would be happy to take any suggestions from Claudio Fontana and try to
>
> include them in the upcoming patchset series.
>
>>
>>> +                error_setg(errp, "multi-fd destination and multi-fd 
>>> source "
>>> +                "uri, both should be present and follows tcp 
>>> protocol only");
>>> +                break;
>>> +            } else {
>>> +                store_multifd_migration_params(p1 ? p1 : 
>>> multifd_dst_uri,
>>> +                                            p2 ? p2 : multifd_src_uri,
>>> +                                            multifd_channels, i, 
>>> &local_err);
>>> +            }
>>> +            cap = cap->next;
>>> +        }
>>> +    }
>>> +
>>>       migrate_protocol_allow_multi_channels(false);
>>> -    if (strstart(uri, "tcp:", &p) ||
>>> +    if (strstart(uri, "tcp:", &dst_ptr) ||
>>>           strstart(uri, "unix:", NULL) ||
>>>           strstart(uri, "vsock:", NULL)) {
>>>           migrate_protocol_allow_multi_channels(true);
>>> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>>> +        socket_start_outgoing_migration(s, dst_ptr ? dst_ptr : uri, 
>>> &local_err);
>>>   #ifdef CONFIG_RDMA
>>> -    } else if (strstart(uri, "rdma:", &p)) {
>>> -        rdma_start_outgoing_migration(s, p, &local_err);
>>> +    } else if (strstart(uri, "rdma:", &dst_ptr)) {
>>> +        rdma_start_outgoing_migration(s, dst_ptr, &local_err);
>>>   #endif
>>> -    } else if (strstart(uri, "exec:", &p)) {
>>> -        exec_start_outgoing_migration(s, p, &local_err);
>>> -    } else if (strstart(uri, "fd:", &p)) {
>>> -        fd_start_outgoing_migration(s, p, &local_err);
>>> +    } else if (strstart(uri, "exec:", &dst_ptr)) {
>>> +        exec_start_outgoing_migration(s, dst_ptr, &local_err);
>>> +    } else if (strstart(uri, "fd:", &dst_ptr)) {
>>> +        fd_start_outgoing_migration(s, dst_ptr, &local_err);
>>>       } else {
>>>           if (!(has_resume && resume)) {
>>> yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>>> diff --git a/migration/socket.c b/migration/socket.c
>>> index 4fd5e85f50..7ca6af8cca 100644
>>> --- a/migration/socket.c
>>> +++ b/migration/socket.c
>>> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>>>       SocketAddress *saddr;
>>>   } outgoing_args;
>>>   +struct SocketArgs {
>>> +    struct SrcDestAddr data;
>> 'data' is an odd name; 'addresses' perhaps?
> > Sure, Acknowledged.
>>
>>> +    uint8_t multifd_channels;
>>> +};
>>> +
>>> +struct OutgoingMigrateParams {
>>> +    struct SocketArgs *socket_args;
>>> +    size_t length;
>>> +    uint64_t total_multifd_channel;
>>> +} outgoing_migrate_params;
>>> +
>>>   void socket_send_channel_create(QIOTaskFunc f, void *data)
>>>   {
>>>       QIOChannelSocket *sioc = qio_channel_socket_new();
>>> @@ -47,6 +58,14 @@ int socket_send_channel_destroy(QIOChannel *send)
>>>           qapi_free_SocketAddress(outgoing_args.saddr);
>>>           outgoing_args.saddr = NULL;
>>>       }
>>> +
>>> +    if (outgoing_migrate_params.socket_args != NULL) {
>>> +        g_free(outgoing_migrate_params.socket_args);
>>> +        outgoing_migrate_params.socket_args = NULL;
>> I think g_free is safe on NULL; so I think you can just do this without
>> the if.
> > Okay, thanks for the suggestion there David.
>>
>>> +    }
>>> +    if (outgoing_migrate_params.length) {
>> Does that ever differ from the != NULL test ?
>> I think you can always just set this to 0 without the test.
> > Sure.
>>
>>> +        outgoing_migrate_params.length = 0;
>>> +    }
>>>       return 0;
>>>   }
>>>   @@ -117,13 +136,41 @@ 
>>> socket_start_outgoing_migration_internal(MigrationState *s,
>>>   }
>>>     void socket_start_outgoing_migration(MigrationState *s,
>>> -                                     const char *str,
>>> +                                     const char *dst_str,
>>>                                        Error **errp)
>>>   {
>>>       Error *err = NULL;
>>> -    SocketAddress *saddr = socket_parse(str, &err);
>>> +    SocketAddress *dst_saddr = socket_parse(dst_str, &err);
>>> +    if (!err) {
>>> +        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
>>> +    }
>>> +    error_propagate(errp, err);
>>> +}
>>> +
>>> +void init_multifd_array(int length)
>>> +{
>>> +    outgoing_migrate_params.socket_args = g_new0(struct SocketArgs, 
>>> length);
>>> +    outgoing_migrate_params.length = length;
>>> +    outgoing_migrate_params.total_multifd_channel = 0;
>>> +}
>>> +
>>> +void store_multifd_migration_params(const char *dst_uri,
>>> +                                    const char *src_uri,
>>> +                                    uint8_t multifd_channels,
>>> +                                    int idx, Error **errp)
>>> +{
>>> +    Error *err = NULL;
>>> +    SocketAddress *src_addr = NULL;
>>> +    SocketAddress *dst_addr = socket_parse(dst_uri, &err);
>>> +    if (src_uri) {
>>> +        src_addr = socket_parse(src_uri, &err);
>>> +    }
>>>       if (!err) {
>>> -        socket_start_outgoing_migration_internal(s, saddr, &err);
>>> + outgoing_migrate_params.socket_args[idx].data.dst_addr = dst_addr;
>>> + outgoing_migrate_params.socket_args[idx].data.src_addr = src_addr;
>>> + outgoing_migrate_params.socket_args[idx].multifd_channels
>>> +                                                         = 
>>> multifd_channels;
>>> +        outgoing_migrate_params.total_multifd_channel += 
>>> multifd_channels;
>>>       }
>>>       error_propagate(errp, err);
>>>   }
>>> diff --git a/migration/socket.h b/migration/socket.h
>>> index 891dbccceb..bba7f177fe 100644
>>> --- a/migration/socket.h
>>> +++ b/migration/socket.h
>>> @@ -19,12 +19,27 @@
>>>     #include "io/channel.h"
>>>   #include "io/task.h"
>>> +#include "migration.h"
>>> +
>>> +/* info regarding destination and source uri */
>>> +struct SrcDestAddr {
>>> +    SocketAddress *dst_addr;
>>> +    SocketAddress *src_addr;
>>> +};
>>>     void socket_send_channel_create(QIOTaskFunc f, void *data);
>>>   int socket_send_channel_destroy(QIOChannel *send);
>>>     void socket_start_incoming_migration(const char *str, Error 
>>> **errp);
>>>   -void socket_start_outgoing_migration(MigrationState *s, const 
>>> char *str,
>>> +void socket_start_outgoing_migration(MigrationState *s, const char 
>>> *dst_str,
>>>                                        Error **errp);
>>> +
>>> +int multifd_list_length(MigrateUriParameterList *list);
>>> +
>>> +void init_multifd_array(int length);
>>> +
>>> +void store_multifd_migration_params(const char *dst_uri, const char 
>>> *src_uri,
>>> +                                    uint8_t multifd_channels, int idx,
>>> +                                    Error **erp);
>>>   #endif
>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>> index 622c783c32..2db539016a 100644
>>> --- a/monitor/hmp-cmds.c
>>> +++ b/monitor/hmp-cmds.c
>>> @@ -56,6 +56,9 @@
>>>   #include "migration/snapshot.h"
>>>   #include "migration/misc.h"
>>>   +/* Default number of multi-fd channels */
>>> +#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
>>> +
>>>   #ifdef CONFIG_SPICE
>>>   #include <spice/enums.h>
>>>   #endif
>>> @@ -1574,10 +1577,25 @@ void hmp_migrate(Monitor *mon, const QDict 
>>> *qdict)
>>>       bool inc = qdict_get_try_bool(qdict, "inc", false);
>>>       bool resume = qdict_get_try_bool(qdict, "resume", false);
>>>       const char *uri = qdict_get_str(qdict, "uri");
>>> +
>>> +    const char *src_uri = qdict_get_str(qdict, "source-uri");
>>> +    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
>>> +    uint8_t multifd_channels = qdict_get_try_int(qdict, 
>>> "multifd-channels",
>>> + DEFAULT_MIGRATE_MULTIFD_CHANNELS);
>>>       Error *err = NULL;
>>> +    MigrateUriParameterList *caps = NULL;
>>> +    MigrateUriParameter *value;
>>> +
>>> +    value = g_malloc0(sizeof(*value));
>>> +    value->source_uri = (char *)src_uri;
>>> +    value->destination_uri = (char *)dst_uri;
>>> +    value->multifd_channels = multifd_channels;
>>> +    QAPI_LIST_PREPEND(caps, value);
>>> +
>>> +    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc,
>>> +                inc, false, false, true, resume, &err);
>>> +    qapi_free_MigrateUriParameterList(caps);
>>>   -    qmp_migrate(uri, !!blk, blk, !!inc, inc,
>>> -                false, false, true, resume, &err);
>>>       if (hmp_handle_error(mon, err)) {
>>>           return;
>>>       }
>> Please split the HMP changes into a separate patch.
>
> > Okay sure. Will include both on destination and source side HMP changes
>
> into a seperate patch.

 > Hi David. I am very new to upstream changes so I apologise if something

very obvious is not understandable to me. I tried to seperate HMP 
changes from

source and destination side, but the build is failing because it has 
dependencies

from qapi/migration.json and qapi/qapi-commands-migration.h files. I 
also reffered

to this commit

https://github.com/qemu/qemu/commit/abb6295b3ace5d17c3a65936913fc346616dbf14

and they have also put the QMP/HMP changes into a single commit. Let me 
know if there

is a better way we can put the HMP changes into a seperate patch.

>
>>
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index 6130cd9fae..fb259d626b 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -1454,12 +1454,38 @@
>>>   ##
>>>   { 'command': 'migrate-continue', 'data': {'state': 
>>> 'MigrationStatus'} }
>>>   +##
>>> +# @MigrateUriParameter:
>>> +#
>>> +# Information regarding which source interface is connected to which
>>> +# destination interface and number of multifd channels over each 
>>> interface.
>>> +#
>>> +# @source-uri: the Uniform Resource Identifier of the source VM.
>>> +#              Default port number is 0.
>>> +#
>>> +# @destination-uri: the Uniform Resource Identifier of the 
>>> destination VM
>> I would just say 'uri' rather than spelling it out.
> > Okay, acknowledged.
>>
>>> +# @multifd-channels: number of parallel multifd channels used to 
>>> migrate data
>>> +#                    for specific source-uri and destination-uri. 
>>> Default value
>>> +#                    in this case is 2 (Since 4.0)
>> 7.1 at the moment.
> > Thanks for pointing it out.
>>
>>> +#
>>> +##
>>> +{ 'struct' : 'MigrateUriParameter',
>>> +  'data' : { 'source-uri' : 'str',
>>> +             'destination-uri' : 'str',
>>> +             '*multifd-channels' : 'uint8'} }
>> OK, so much higher level question - why do we specify both URIs on
>> each end?  Is it just the source that is used on the source side to say
>> which NIC to route down?  On the destination side I guess there's no
>> need?
>>
>> Do we have some rule about needing to specify enough channels for all
>> the multifd channels we specify (i.e. if we specify 4 multifd channels
>> in the migration parameter do we have to supply 4 channels here?)
>> What happens with say Peter's preemption channel?
>>
>> Is there some logical ordering rule; i.e. if we were to start ordering
>> particular multifd threads, then can we say that we allocate these
>> channels in the same order as this list?
>
> > I certainly did not get your first point here David. On the 
> destination side,
>
> I think we certainly need both, destination and source uri's for 
> making a connection
>
> but on the source side, we do not require source uri, which I have not 
> included
>
> if you look at the 'Adding multi-interface support for multi-FD on 
> destination
>
> side' patch.
>
> > Yes, I agree with you. I will inlcude this feature in the next 
> version of patchset,
>
> where it will check the number of multifd channels coming from API and 
> total
>
> multifd channel number from qmp monitor command, and should be equal.
>
> > Yes David, multifd threads will be allocated in the same order, the 
> user will
>
> specify in the qmp monitor command.
>
>>>   ##
>>>   # @migrate:
>>>   #
>>>   # Migrates the current running guest to another Virtual Machine.
>>>   #
>>>   # @uri: the Uniform Resource Identifier of the destination VM
>>> +#       for migration thread
>>> +#
>>> +# @multi-fd-uri-list: list of pair of source and destination VM 
>>> Uniform
>>> +#                     Resource Identifiers with number of 
>>> multifd-channels
>>> +#                     for each pair
>>>   #
>>>   # @blk: do block migration (full disk copy)
>>>   #
>>> @@ -1479,20 +1505,27 @@
>>>   # 1. The 'query-migrate' command should be used to check 
>>> migration's progress
>>>   #    and final result (this information is provided by the 
>>> 'status' member)
>>>   #
>>> -# 2. All boolean arguments default to false
>>> +# 2. The uri argument should have the Uniform Resource Identifier 
>>> of default
>>> +#    destination VM. This connection will be bound to default network
>>> +#
>>> +# 3. All boolean arguments default to false
>>>   #
>>> -# 3. The user Monitor's "detach" argument is invalid in QMP and 
>>> should not
>>> +# 4. The user Monitor's "detach" argument is invalid in QMP and 
>>> should not
>>>   #    be used
>>>   #
>>>   # Example:
>>>   #
>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>> +# -> { "execute": "migrate",
>>> +#                 "arguments": { "uri": "tcp:0:4446", 
>>> "multi-fd-uri-list": [ {
>>> +#                                "source-uri": "tcp::6900", 
>>> "destination-uri": "tcp:0:4480",
>>> +#                                "multifd-channels": 4}, { 
>>> "source-uri": "tcp:10.0.0.0: ",
>>> +#                                "destination-uri": 
>>> "tcp:11.0.0.0:7789", "multifd-channels": 5} ] } }
>>>   # <- { "return": {} }
>>>   #
>>>   ##
>>>   { 'command': 'migrate',
>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>> +  'data': {'uri': 'str', '*multi-fd-uri-list': 
>>> ['MigrateUriParameter'], '*blk': 'bool',
>>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>>     ##
>>>   # @migrate-incoming:
>>> -- 
>>> 2.22.3
>>>
> Regards
>
> Het Gala
>

