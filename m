Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87248633800
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:10:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPHP-0000oa-Qs; Tue, 22 Nov 2022 04:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxPHF-0000hi-83
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:09:14 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxPHA-0003Xu-FQ
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:09:11 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AM71SHt032006; Tue, 22 Nov 2022 01:09:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=UZ+3oaIEFcO1m+BwidQ2/zW+bzaq0U5E5U4vKvKjn7U=;
 b=rk77gBr/9IgQ0rZAS16OcTIYy3IWkA0vDwFe3p7TkCr1Bxi3/PqgteHq/GQT9w3Hx1Bn
 djUR2jBp24mdUH09FXB81LARAYjZcnCYiN4kLXYU73zqFD4fwSOa3XjeT9MgpT9Ozx02
 LIYFQX7ath3UMwyVzPfDRvjJAOdIIXa3CjAw/jDgwO0JfXvgngGMCbDuS5XIm1dm4zS8
 7DCUpi9KBntV671Y02CT02W/BmTpTeEQ22QzdLb3aP7SBQKPxNPiZt9Ch0sGdesjPWE7
 4lKin26NHdjmBIH6vywM+k51cgbndb3ZJAjNs5TNMEasP7+aAhERaHTC8jdNREg75PMz zA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxyk36ydh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 01:09:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXJM3LrwloezwMg4/CyUgjE+xJW4TJjA4h88gBIENTviYTkeKzIJMRvuxv6g3ebGXHdk8mOPjMfVQ2vhp0xdU/W4ZnAFPpGhwNtq9q8apfQ+FEgaxioJB/Kux0RLkhzA4PYqbnf6sdxv4GFfgBvGm5no4shvvDAi05o482KrdhUjxE3qJ43SEfdCUjz0AfF+2G3AtlSdxTk0iy2VErUKoWlvN9VBOI5zxnS2yPsYaiJRNdu2vWXqAyYbAzJ5GTRVl0jUc1yOWiR4QWOHCvXlZ/35wV8cINIhEpGn6mu/8HfJ4jbKhAV4FBguzkmF7WnVPQdYvOVOxUW9PQP/yhljlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZ+3oaIEFcO1m+BwidQ2/zW+bzaq0U5E5U4vKvKjn7U=;
 b=lCZ+o5mgrrck0pp0jzgLNSdPmD1C89SJm01jdF9g3qpUT9XCqNkBOFxAsP6D9SXUftKjC7vqJ3sOhiTrRnMzABUreHnDsL9gaZa4Ibu2OoLUIclVOcJBozOZxcJT2oPD6yTi0vok0mfwKSedHamZycc6ZQx/UAjNy9/nOI27ugCpreIs3m4fywOY6jJ8sp8175wrg8JU7PqMTUqudMUa4dqNrM/hvVdVxBZK0+YyJGUPV1S6dVUTdzSIMoYSVMtGAR3NAG6CCH9dDmm0uEX1WWM4+vxCqXaPs5D93xYmm6Qvb+LM1IQUdwmBsDiuHBIbenGCPTm5cTM5aUQu43ECGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ+3oaIEFcO1m+BwidQ2/zW+bzaq0U5E5U4vKvKjn7U=;
 b=hDS/nD7wm/IMHI8J8zQ41YQ4a5IlBmtjoAwlpHZ9VYswOXFIXETUwMIBEI+B6v5/JyZBiDWoDsglkpPyWpc6OYN3qLb4JDd28EthrhAwHBhsZMCa5CMDjsLsx9RRrrcNkISiODEZsmElmEW87+Ls32JbYoFu7HGiRWEHqJ8bY8qEC6BWr51pxL9pFMtXjGxSBOydASqxZsPA3OuVBF03uWvROmtWIQ9AmX3Zw9Dq7onJFU8URN2enAlbIBP3fGwY6YQ8JybEkgFyQNEYk8A/cwAzuTZ4+22Sk1AnmO9+zebfdOZtHo03sZMQusqZaMdb+uwUErdwR0UsjP7w6PJDwQ==
Received: from MW4PR02MB7379.namprd02.prod.outlook.com (2603:10b6:303:66::13)
 by SA0PR02MB7483.namprd02.prod.outlook.com (2603:10b6:806:ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Tue, 22 Nov
 2022 09:09:01 +0000
Received: from MW4PR02MB7379.namprd02.prod.outlook.com
 ([fe80::b122:cd0:7fb8:4985]) by MW4PR02MB7379.namprd02.prod.outlook.com
 ([fe80::b122:cd0:7fb8:4985%7]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 09:09:01 +0000
Message-ID: <d240734d-8301-ac4f-63de-89e9d2c2174c@nutanix.com>
Date: Tue, 22 Nov 2022 14:38:53 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/2] io: Add support for MSG_PEEK for socket channel
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
 <20221119093615.158072-4-manish.mishra@nutanix.com>
 <Y3yPoFAo5l/vmB/y@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y3yPoFAo5l/vmB/y@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To MW4PR02MB7379.namprd02.prod.outlook.com
 (2603:10b6:303:66::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR02MB7379:EE_|SA0PR02MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 03bcec2f-6ec4-4e7d-3528-08dacc693205
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rR7aMgBWiAMgtAb8RKvz5HHKQKODGEe9aEbJXJtOKfvjNknowbhgMtMJVaTCWlQ++J0mmdEfhE/y8ZQ1txNiuWklbnYqUpg6HmB3rhEQ3s8b06CHh0gWHUV9moaQydPtPLQLkDHGrwgcKYvoHU9iNgYOj/BxIZ0KLUrxrvAdMbF8IkRuRkltYckKzSUAJRanG+NffhsEiY4lrkMGn3tidFnItyp9TTblDo6SDSLjqQYb8t1cwnNMRUSbPOnv1fii8IqadHc5QCArG/2l2nAboKpvOCsDE1zUM8cD1LCIbqXnVh8NmAEnxmj/lM75tPUbJPnUCUptVXQwAOf1MmX2exrCpmWcd6WxPgGEu6nFbyjAVtfcNsFdqKLisafrEoVhNldcF0GCybFQu34JxzmFi0teEkr1s7DjAzdubzYV7EByZOxeP2ZZYnmX63MkoY4Uwr0SoeWo7zXRJ1i1snMZ42OBR/9js68IqOTlknyNHhwyla/nprGevss20wCxig67OArfZEBz7G3n+ddDNHROe5T9sY2hDB/mR3LWFYHfamLgiAClYJPa410hq7EZF+LwGlhJDfMFDZtYlqwMw4zv5IN/iGo2AQi68MIAztmLgT/xqT0DZdJUe4tPCYRYvCQxEc4ELwJIJ8fzsWCOaNjP1cuJ/UweWgj15JlziKV6aTZq0d3bqMjvBkWG1krdaPm/4NdeTtYFBjE7QBYq/to4zme659zyDeZlM47ElWN3ozw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7379.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199015)(2906002)(2616005)(6916009)(55236004)(26005)(53546011)(316002)(8936002)(36756003)(186003)(66556008)(6512007)(5660300002)(66476007)(4326008)(66946007)(8676002)(31696002)(41300700001)(31686004)(6486002)(86362001)(478600001)(38100700002)(6506007)(6666004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThCWnRXMjR1NWdid1VNOW1Ub2pyZkxrbkQ3S2VtL0FpaDlQdFFkYy9lcmp0?=
 =?utf-8?B?OFIyYUE0dk5GNWxmOFBTMGdaWmt5c0lvRkZ2WjF1MWJtWW1BS0VBOWYvRXdV?=
 =?utf-8?B?RFRZN0JqSXZoMlhPVWZaMGdiYVhKMWNXYU12amdSNzFYcFVMamQzWkEvOGlv?=
 =?utf-8?B?aHZVcFYrYkRmSlVXVzB6M3VTdndoMU9UMkEwakZQS1VMN3ErbUpvdjJoT28z?=
 =?utf-8?B?aEthaDd0dlpwRWVoclU0dHd6bkxhdHJxaStkUVgvZWNLWEtkNWtPL0lJalVl?=
 =?utf-8?B?RXVzcHpzOThYYzlKak5iS0JmKzdLVGJkeUVaUktZb0FYVll6Q3BQc3kwazNk?=
 =?utf-8?B?YW9ZZTFOTDB0R0l3NVdFYURIbU1McDJaeHZNOWd0M0xJZkN1VDlPMnRDUDlY?=
 =?utf-8?B?WVRLMGV3Tis4K3BMSTQwRUgrUlVCT1hhTU5uekZtSUFrUFFqbWpEV2U3SWN3?=
 =?utf-8?B?Q1FnQnhEVHg2V2V1RHA2aWovSHpFVDFVd2prWGlVenNvTE9uU2FrYTdzTVhP?=
 =?utf-8?B?U2lsVVBPL253cjBPa0F2M1kzWTMranFaaW1DOGlnOHdlUFptOWJHVDJsL2ov?=
 =?utf-8?B?YlNqZ2owaW1zOGVIM2Mxb0tacEhEWkNjL05Da3ZSSmxZWjlGR2NXOXZhL0F1?=
 =?utf-8?B?cDNWUmxlaVVna2Y2OHg3OEwxQ2RUMlJRL1JITHNvaWdXemtzcmR5dVJra1Rp?=
 =?utf-8?B?Mk5zQzY1VHEyRmMyemRRcFRTL0VZTGt3SHNlVjFMSmRlbUQ4cWhjeU4va3Ns?=
 =?utf-8?B?QmVpNFVYSldLL095cHhKY1VmWnVMOEdqLyt0SFRuWmhPT1JTcnRJalJaSTlZ?=
 =?utf-8?B?ZVhRZXNIejdHVGppWDduZHpSWGlWMzFBOHFmNUFjUWwyTTFnYkVDL0dpVDRl?=
 =?utf-8?B?Nmh5YW9ZUmdzU08rMFlOdlNkSEZDVUIwYnJGVDdmdEVuN05YaDduVldLeWt1?=
 =?utf-8?B?cEdKR0Jtc0lvU05PMTVKamlrRmN1QTFXYWhsbjg4eENuQTF1UEp1S3o2SmQz?=
 =?utf-8?B?cmZ2VUN5WHpzNnBRMlpjNE03dXZncGpHQ0ZNQ0ZuQWd4bUNVUTBBdW5DRVI1?=
 =?utf-8?B?S0VhNHJ0YUNaNjJFeGRRVk9mZERwelA0Q09VNGxzdjVvQTRDa1NWc2lOTTJa?=
 =?utf-8?B?TFlXV1o3eUkra0JpN3IrVlAxUXQvcHNrc3lIa2EyYXRxQUJ6dllKaHU5ZzhB?=
 =?utf-8?B?cWdqSjBWdlZZQk8wbVcweVd4aW1XSE9ZYkQvSUluSVNML0ZzUWNPUWRVcG5S?=
 =?utf-8?B?MHNOaXE4WTh5WXVLNlJJWUZMZVZ4N3VNWWJWM1dBTS9hTldycGV0OTFXVURX?=
 =?utf-8?B?KzVVaEJtUndDaklwa1dxSWtLSExicGlPSjI5V0grNTJyOVJNaGdLMC9GbUZl?=
 =?utf-8?B?cC9MbWZDSXlRSEsvc0VJY3lkY1lobU1EbTZmdncvb1M4eEx0TjRUMWZKZUg0?=
 =?utf-8?B?bXF3Z1Z4OE5xeEx4YUU4M1JkcU43TkowbDlxVHdDcWt1dUZtem5TN3k2TXVz?=
 =?utf-8?B?NmV0SXJLbDM0c0ppUzNaM2VQVGNvV3pRQytFUFlCaXI2d2s0MDNZTTFSeENl?=
 =?utf-8?B?Nms2VGNkbzllWDF1UUhLa3QvSkxZRGFURlRFdW1kSWtybDgyZHpWYTJMK1Bu?=
 =?utf-8?B?ZmFBVTBUdlh1WkxyMHkzYW4vRTBXREdlNFp3U0dzaHdRYlR2aWpneEJkeFRI?=
 =?utf-8?B?eEkyS1Q5cXo4VStQM2NDVDFuVGpGQ3I3SGdEZGIyZTJxcUVDWlkzUHY1dkFT?=
 =?utf-8?B?ZTZhS1R3dE9TemI4anJCbHN3L0JWVnJMdjNNZnNNR20wck5CaEIra3VVOXk1?=
 =?utf-8?B?U01wN2IrN1A1b3RvZnd3emdpZUh6elFmb2NLcmZ2TkhEeUlRSXBkSVRmMjZX?=
 =?utf-8?B?a0t2ZEhNSkZHU21nbHRZTFdVcFNwdUxpZHViMzRLY0lxMXpncDVVdWNDUjNa?=
 =?utf-8?B?R2J6Wk1FVXhLa2pWQkQzb2c5eHVaRkNNZVpGcnpmeUQ2TGt2L2hCY1hNSmw0?=
 =?utf-8?B?a1p6Y2NnTThEWmU5WW1FRVMxZFNWejZ4b1JYbnpNM2R4QVF0ZzZvSWViaDVU?=
 =?utf-8?B?T1J6WktFM2lPZ3lCYnZmb3dZZ3Q3Z3dMdmxDQllBSWJJR0NoME5kczNmNmNX?=
 =?utf-8?B?NDR0U05ma2pEb2dpTWZCNDhDWU15SlFhT0NQdVdVbGpvM2I3SFVPZm5ESldz?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bcec2f-6ec4-4e7d-3528-08dacc693205
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7379.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 09:09:01.3086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNicFM9KAWG+C5pnkaAGblbpEDUwH2ZkIZ42AJqrrcbO/e41gLTWwPtiQXAZCQGBt2S81GSjsWfdCQVqarUY31bBVs3E3iEc6yPAT3Qm0mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7483
X-Proofpoint-ORIG-GUID: Sz0j6oSrkjutgO_kKndjubukFw1OlnSZ
X-Proofpoint-GUID: Sz0j6oSrkjutgO_kKndjubukFw1OlnSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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


On 22/11/22 2:30 pm, Daniel P. Berrangé wrote:
> On Sat, Nov 19, 2022 at 09:36:14AM +0000, manish.mishra wrote:
>> MSG_PEEK reads from the peek of channel, The data is treated as
>> unread and the next read shall still return this data. This
>> support is currently added only for socket class. Extra parameter
>> 'flags' is added to io_readv calls to pass extra read flags like
>> MSG_PEEK.
>>
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>> ---
>>   chardev/char-socket.c               |  4 +-
>>   include/io/channel.h                | 83 +++++++++++++++++++++++++++++
>>   io/channel-buffer.c                 |  1 +
>>   io/channel-command.c                |  1 +
>>   io/channel-file.c                   |  1 +
>>   io/channel-null.c                   |  1 +
>>   io/channel-socket.c                 | 16 +++++-
>>   io/channel-tls.c                    |  1 +
>>   io/channel-websock.c                |  1 +
>>   io/channel.c                        | 73 +++++++++++++++++++++++--
>>   migration/channel-block.c           |  1 +
>>   scsi/qemu-pr-helper.c               |  2 +-
>>   tests/qtest/tpm-emu.c               |  2 +-
>>   tests/unit/test-io-channel-socket.c |  1 +
>>   util/vhost-user-server.c            |  2 +-
>>   15 files changed, 179 insertions(+), 11 deletions(-)
>
>
>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>> index b76dca9cc1..a06b24766d 100644
>> --- a/io/channel-socket.c
>> +++ b/io/channel-socket.c
>> @@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
>>       }
>>   #endif /* WIN32 */
>>   
>> +    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
>> +
> This covers the incoming server side socket.
>
> This also needs to be set in outgoing client side socket in
> qio_channel_socket_connect_async


Yes sorry, i considered only current use-case, but as it is generic one both should be there. Thanks will update it.

>
>> @@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>>   }
>>   #endif /* WIN32 */
>>   
>> -
>>   #ifdef QEMU_MSG_ZEROCOPY
>>   static int qio_channel_socket_flush(QIOChannel *ioc,
>>                                       Error **errp)
> Please remove this unrelated whitespace change.
>
>
>> @@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>>       return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
>>   }
>>   
>> +int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
>> +                                   const struct iovec *iov,
>> +                                   size_t niov,
>> +                                   Error **errp)
>> +{
>> +   ssize_t len = 0;
>> +   ssize_t total = iov_size(iov, niov);
>> +
>> +   while (len < total) {
>> +       len = qio_channel_readv_full(ioc, iov, niov, NULL,
>> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
>> +
>> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
>> +            if (qemu_in_coroutine()) {
>> +                qio_channel_yield(ioc, G_IO_IN);
>> +            } else {
>> +                qio_channel_wait(ioc, G_IO_IN);
>> +            }
>> +            continue;
>> +       }
>> +       if (len == 0) {
>> +           return 0;
>> +       }
>> +       if (len < 0) {
>> +           return -1;
>> +       }
>> +   }
> This will busy wait burning CPU where there is a read > 0 and < total.
>

Daniel, i could use MSG_WAITALL too if that works but then we will lose opportunity to yield. Or if you have some other idea.


> With regards,
> Daniel


Thanks

Manish Mishra


