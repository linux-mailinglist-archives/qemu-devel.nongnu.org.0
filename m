Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD46341B8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 17:43:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWMC-0004Fm-F1; Tue, 22 Nov 2022 11:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxWMA-0004FN-S7
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:42:46 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxWM7-0006Mn-MK
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:42:46 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AMEYQQQ022545; Tue, 22 Nov 2022 08:42:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=zuuK56jIOTGkml1X2146oqgSjBUDJhXfwMoB2GW15Lg=;
 b=HYq86Du/BcH6XVhS9ARqHZZ2FxJW5/kC24IMFIHU4y3o0NrZClYJruzzJrm6xvhszsmu
 d1CKtIMFJr6onwi6UzLpZKN33d8IWKDQ9XsFY90ev5aB/Hp1awNf1fBR09W7hlqsKrwW
 Z93v4rJdldzymKkd7sb6UaTIy0/97Y4d4a4NFQo28PXUoY+JkCLi7KCPvxuag8BQN3cm
 siY2KFKMp2h8gfO1lR5ch75s9+QEhlBupqgxFoij3Dl5DiO6efPqh/ZGldVd033XSez8
 AbkmugP/TvEpT5Fw1eoHlDxa4I9tWDQPccf55Pda8QmN8Pna5xlyQ6/dEsEDJxcctKVk BQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxy3mqwnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 08:42:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWOXR7rQfBgJjxzgYBquXZHcnX1P3RIr80ynFCDCc2aWx7AAH4/fxOJt5COt/xdIWiF67rUab6esSfn3bMDbKqhJ5ek2xUJEvKwqfO4iwnSn8JO1uSxICqzO2mR1vJ8YX+zefddhnY51FP1kPpP6kXPsxmzSoksp5w8uddz+YDr7vW/ZMDpRnmsskLR31fxv4O9Xr7JTMLfnWqe63YzGGtKic8GbGNNJx3eBXCBcGPLWzVA07nO9jHhTPGDRy21uW/Twcey/EdzgKy4J1CKCll4JDH3Hzo6c2lNPVHzA56hBEm3PEvXtBWpk+zngOTFuYD23d7KeRaCPAODx8Qcfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuuK56jIOTGkml1X2146oqgSjBUDJhXfwMoB2GW15Lg=;
 b=UrHtWaKvd8TzeWyU/BxGXDYn/sksB8yv61MJJFUkViKvheMQcVu7WbKKHb8tW55iOyxcYKulylBtxmrcNWvKNtJ33gv3dFKFq1ao8Rt+r2l2kjthHvVdr8fB6mRifH2qSZc1DHNBmBsc2nKz3h+1tj03YHou823cQhlCETDHD2SGktHCpFYzHo/gEz1oTCzlHIHWgwErmPUVuUbfjvRbhFoJoWnE1NMT57I2W8OMjz4Ds/ei2U+J6zO109Ne+9OpCLVaiJwuYr9i7xMTlnUVYjnkwd7C3GDXgs0NAJz+R4832pbLimrmeLB6v+a6D6tgqsGw1KU2jpRzCvZFlBNMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuuK56jIOTGkml1X2146oqgSjBUDJhXfwMoB2GW15Lg=;
 b=Yh6elqC4xV0Al3TstL6W8jRkh2LFVrwVNn8iCDVFlwBZiRUWxlDFP6tMbGGEiS3dOrxmQ0WHfuFmkS1a4DemDbCC5Ezum2hCuGKiDK6pryZd4F3BBSJfQ4gW/WW/2k/ShmgowrTxJ4AxVP1ML/EKw2lmI9O3Uxoql2DS4bkGwgPO/G0fP8/aKMnghpYYONwk3OkSDj6CUedu9SX9l/JRvmlaQuQVnS2bqIBT3s9ozRgIAN6z7BPTunua+xWkPAlP49cCcj+ap2hRaQE4mxcEuKZ+ZJN4vjwAItAUWVT673clUmg1+2sZkUWu3zo+W91EtJ1k/pC3enp4s0YBeSuGPw==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DS0PR02MB9102.namprd02.prod.outlook.com (2603:10b6:8:132::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 16:42:34 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 16:42:34 +0000
Message-ID: <00d72719-051f-1fcf-e246-79996349937f@nutanix.com>
Date: Tue, 22 Nov 2022 22:12:25 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/2] io: Add support for MSG_PEEK for socket channel
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
 <20221119093615.158072-4-manish.mishra@nutanix.com>
 <Y3yPoFAo5l/vmB/y@redhat.com>
 <d240734d-8301-ac4f-63de-89e9d2c2174c@nutanix.com> <Y3zffev6eOCl6JBy@x1n>
 <Y3zhcCCf49scoi9u@redhat.com>
 <12383abd-0495-a202-fee2-cce64c3d54b2@nutanix.com> <Y3z0auP3al5qYVIT@x1n>
 <Y3z40TBFLZDeahB4@x1n> <Y3z54h+twgVKKZ2t@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y3z54h+twgVKKZ2t@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::13) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DS0PR02MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc91a52-d3b8-4229-22b0-08dacca88d8b
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Psejd6fQVmfcgYuIO9LwvBCrhVTZA5myjV3xO0skJKeRbAUbQ6I1ZCKGz62wa70W3HrfqFSCt3g3nyMmGBwPcI6uT8sMGYC4AYA6paE0seRscDnXUfRoWLLDEBHDTITeud2y8GTOXknYpAOozy2oX1IDeXDPHW18vap4qj12EbFQHo9oBZfB6dCk39/wQcGKE/06qM54FRDAsrdCOUYs5gjvv4c/7zJet4+P6RHr47wTV52fGD7ozXZKNkrm42c6hUHdXct4wGxLMiZwiSfrVAmxYV/Vlxwdq7DxxSCLRP9gQk4qr0/5MV/WvX5pVBUom34ThGYQQgQ4xUPmrmvjdMiazUP7ozGgEVqLjApocdXi+ExtLIhOzaHzfBY2DhIwTUsoM1B4UNmztwVlfvGlUVst/CT6cUqZ5EphrgqyrBxiehcjln/YTuUbeVTOjSZPMaYkCTbgbzJhSOvvXwDQ7eAr79LlCa5iZ6DLKNbMnD7z1AwredRMVekvwAYA+8Wb+vl/biZLM2IY+SS+Gjg8Exl8Ot4X87dBU0Ad+49gXJDKZ16CMRF0GZYn5u5/pxr9kMg0sgmh+IB61p7V1V7s/lHT6Clj3GQszKUUFmsbLIDPEZylDeAM3pqMw8dRWC7h7Xx0b5MDJYM91l6cwwC7fzIzHnMLW5YAjGzI2fR4fNG0b3q6ynR9djJwV/P44QZui54Xa3UgFccPVBGw4Nevg5luvJsZ26wpwSekD+OkKHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(26005)(6512007)(66556008)(66946007)(316002)(66476007)(83380400001)(186003)(5660300002)(8676002)(8936002)(4326008)(41300700001)(36756003)(2616005)(2906002)(31696002)(38100700002)(86362001)(478600001)(31686004)(6666004)(66899015)(6486002)(53546011)(55236004)(6506007)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzdXeTF6d25HWC9DNVhrdE1hT2Fxd0g3dStHNlJsRHNtZzlYN25hekdGNGdl?=
 =?utf-8?B?TGtYQlJkQktzYUhmMm5veG1tTVlhU3FtTEJRTEwwclFSb1NocFZ6ZlFIKzIx?=
 =?utf-8?B?MElTZUpSTTJlUm1VUWhlcERJMzNwUGorOURpUGJEbGd6QUZiMGZ5bC9QMUNr?=
 =?utf-8?B?UUhrUmduSklQVWNkOXMzWWpVYXZ5MGllK1J4cXg1NVhJYzFqM0tzN3BOL3BO?=
 =?utf-8?B?WlI1NVhwNVJsRW81bXVQL3BIQU1qakRXVFVkRmdPNXlYaWRyM1kzSlNkM2Iy?=
 =?utf-8?B?MkpOYXhzalkzVVZDNDNya0Vhb01MMTBaNTlCbXZZak12dEZUMmZIOUFsbjNY?=
 =?utf-8?B?bTc3elJuSjhiTE9MUnoxSVNPZThFMnB6UGV4ckQ3OUFmMkNYRW53UXI5d2tp?=
 =?utf-8?B?RFNoWXZaaDlqRGh2M08zMWpZS2prTmlIVUpJdE5IMllTUUdFL3V5cVp2cXF0?=
 =?utf-8?B?cVlRMlYyVTZ5UzFkeUxqQk4rNVFEbDlsbWVYUUhEaHFOMk1TaUZCRjNNV1hV?=
 =?utf-8?B?UHUwaDlraStCZVRRZURoZGpJYkJKTkNyejQ2UUllY2JjejMvYyt1eElicW9K?=
 =?utf-8?B?bTQ2dWhtaXNRa0RVM0pJZVRkd293dnZZcjNMVmxXSW5PVWI2L2JremF0Wk16?=
 =?utf-8?B?bER1Z0ZhOXhHaEtmUmE4dmZIbE9ZMmJRN1hEWWJLenB6QndpS3RrVnFIbkFK?=
 =?utf-8?B?R1dNL25FeDZJV1o5aG9KeTkzRVJiK0JqeTFhZGdRSGJwenYzMko4bmU3S084?=
 =?utf-8?B?a25rSXhXY0U2NVpGTml3K0tDeXBTVElFM2JnTHR1OHNzMmhSYUpGS3lZcVkv?=
 =?utf-8?B?Z3hpb08rT1JOZGlGWnkrUVJTcTJuUWYzUDFmRkVlNVlxUXByK2prbWdpRU40?=
 =?utf-8?B?S2ZNbWNsUDlqaytqVUI2RXUrcVoxMExud0JmZStzWUlTK1NEeVZpVEc3LzNx?=
 =?utf-8?B?ZGtqRHFHRW5PWGF1bzFzaUJtVWRpTkZQdUpyb0MyU29ra1Y2cmN2TlZhS1Nj?=
 =?utf-8?B?ZHZlS1E5UTNSbHFkODlzMUxseHhVdFhLWlRZOENpUnFtU0V3bVF0eFBuTU1J?=
 =?utf-8?B?NC9iUldFbUgxWDZjSEsxemRlVWZ4eG9tVEtQY1pLQ1NWb1NDNHFxL1RQUXBy?=
 =?utf-8?B?L1NDY004UzhGY09Pa3hJU0hSTXpMaGhJYnZOTFBYYlF0S2lVWGZYalY4WkQv?=
 =?utf-8?B?Y3JleXhnNlpwVGptWDRtK0l0RG5WdWM1VVl3Ykg2K2l5bnpCUEpTVmQ2SDdm?=
 =?utf-8?B?M1ZiS3VmNnBNL3BjdG5zK1E2d21IL1pLOTRLS3JlRjFERXVpaWRlVzVjOU9w?=
 =?utf-8?B?d3ZxV0xscy9sQWlBQSs1eksrV1EzMjNhRTNSSzAxTVAyQWE2d0t3QkduUnJQ?=
 =?utf-8?B?YVUzY0g2WTBWZktKUmFJNk01enhtVENrOW0vLzQ1TEhYSFp1NWl4aG00b09s?=
 =?utf-8?B?dzFtMjZhblhoVmh4Y1J6VGJ3RU1CV1RsN21ZVHUra281K3d0SFR3ZkRYNlE0?=
 =?utf-8?B?eHphZkFXN2ZYaGszRXFPWkxXYldJRjcvTXBod0lIUkJQV1Y1WTRRbTJmL1l3?=
 =?utf-8?B?TjRQcW9FTFMxZGZ0aFlrZVMzdkFzV2NlOGdONGdoL1B0dW5SU3lQNnJNUkU1?=
 =?utf-8?B?RndMZU5JRjBFeXpuRVRXTVFWZVE1KzA4Zm1LWEpOeHlPbTFaaUFtRFVUNyt3?=
 =?utf-8?B?SXZQK01kaklvL2NpdENjM1diZUt3RW9WRlpQU043cHN3c2tLTUdiSzBMT3BJ?=
 =?utf-8?B?ck5BMVduYzA2bVlqOVA0bTNTVTJWTkJyU0s3V3JXZG81ejFTNW5FME8veDlx?=
 =?utf-8?B?MHN3aUR6Q0t3RzBlUG01cXZnemxnb3hDdTBkbENpaXp2VEsxcnp2WmpoY3h0?=
 =?utf-8?B?L01TSFI5U0RUUXdzVSt0MkF2V2RiMjFMamc2cmFDWUgxUEovejZWbVgxeDBX?=
 =?utf-8?B?bEZlRko4TDBEa3BYamFsWEs4OHNOZkNJekJpZVF2azFLdC9wZUxzWjAwSGhF?=
 =?utf-8?B?aEljeENHbXJmQ1h5VjMxdDhXMjByYitjbW8wUk5XRmF6U3RCUTBRTkpOd05j?=
 =?utf-8?B?QkM3RmQ4YjErTXhsSUppSlZQVWxpM3B0MUh6Y3V0MStGT2x5bXJFVmszQms3?=
 =?utf-8?B?MnNpS3V6dDVQU0FJRS9DdnFseGRBYWdtckNQajVrKzRwbUk4cVhWRjhkckx1?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc91a52-d3b8-4229-22b0-08dacca88d8b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 16:42:34.6046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUeUWx76M+S//kg6W5qunRyix3Ury0wIqXklYX8QSfmF71GXOzgBUy8K7php2KuvqJ8gkUZYwnJ82/iFQ7JK+KKIfG+Zpm0FbH943kk3ZgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9102
X-Proofpoint-GUID: mqyvYtCFu0_5yEb7fqB9jYTxalORXaOr
X-Proofpoint-ORIG-GUID: mqyvYtCFu0_5yEb7fqB9jYTxalORXaOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_11,2022-11-18_01,2022-06-22_01
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


On 22/11/22 10:03 pm, Peter Xu wrote:
> On Tue, Nov 22, 2022 at 11:29:05AM -0500, Peter Xu wrote:
>> On Tue, Nov 22, 2022 at 11:10:18AM -0500, Peter Xu wrote:
>>> On Tue, Nov 22, 2022 at 09:01:59PM +0530, manish.mishra wrote:
>>>> On 22/11/22 8:19 pm, Daniel P. Berrangé wrote:
>>>>> On Tue, Nov 22, 2022 at 09:41:01AM -0500, Peter Xu wrote:
>>>>>> On Tue, Nov 22, 2022 at 02:38:53PM +0530, manish.mishra wrote:
>>>>>>> On 22/11/22 2:30 pm, Daniel P. Berrangé wrote:
>>>>>>>> On Sat, Nov 19, 2022 at 09:36:14AM +0000, manish.mishra wrote:
>>>>>>>>> MSG_PEEK reads from the peek of channel, The data is treated as
>>>>>>>>> unread and the next read shall still return this data. This
>>>>>>>>> support is currently added only for socket class. Extra parameter
>>>>>>>>> 'flags' is added to io_readv calls to pass extra read flags like
>>>>>>>>> MSG_PEEK.
>>>>>>>>>
>>>>>>>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
>>>>>>>>> Signed-off-by: manish.mishra<manish.mishra@nutanix.com>
>>>>>>>>> ---
>>>>>>>>>     chardev/char-socket.c               |  4 +-
>>>>>>>>>     include/io/channel.h                | 83 +++++++++++++++++++++++++++++
>>>>>>>>>     io/channel-buffer.c                 |  1 +
>>>>>>>>>     io/channel-command.c                |  1 +
>>>>>>>>>     io/channel-file.c                   |  1 +
>>>>>>>>>     io/channel-null.c                   |  1 +
>>>>>>>>>     io/channel-socket.c                 | 16 +++++-
>>>>>>>>>     io/channel-tls.c                    |  1 +
>>>>>>>>>     io/channel-websock.c                |  1 +
>>>>>>>>>     io/channel.c                        | 73 +++++++++++++++++++++++--
>>>>>>>>>     migration/channel-block.c           |  1 +
>>>>>>>>>     scsi/qemu-pr-helper.c               |  2 +-
>>>>>>>>>     tests/qtest/tpm-emu.c               |  2 +-
>>>>>>>>>     tests/unit/test-io-channel-socket.c |  1 +
>>>>>>>>>     util/vhost-user-server.c            |  2 +-
>>>>>>>>>     15 files changed, 179 insertions(+), 11 deletions(-)
>>>>>>>>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>>>>>>>>> index b76dca9cc1..a06b24766d 100644
>>>>>>>>> --- a/io/channel-socket.c
>>>>>>>>> +++ b/io/channel-socket.c
>>>>>>>>> @@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
>>>>>>>>>         }
>>>>>>>>>     #endif /* WIN32 */
>>>>>>>>> +    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
>>>>>>>>> +
>>>>>>>> This covers the incoming server side socket.
>>>>>>>>
>>>>>>>> This also needs to be set in outgoing client side socket in
>>>>>>>> qio_channel_socket_connect_async
>>>>>>> Yes sorry, i considered only current use-case, but as it is generic one both should be there. Thanks will update it.
>>>>>>>
>>>>>>>>> @@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>>>>>>>>>     }
>>>>>>>>>     #endif /* WIN32 */
>>>>>>>>> -
>>>>>>>>>     #ifdef QEMU_MSG_ZEROCOPY
>>>>>>>>>     static int qio_channel_socket_flush(QIOChannel *ioc,
>>>>>>>>>                                         Error **errp)
>>>>>>>> Please remove this unrelated whitespace change.
>>>>>>>>
>>>>>>>>
>>>>>>>>> @@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>>>>>>>>>         return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
>>>>>>>>>     }
>>>>>>>>> +int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
>>>>>>>>> +                                   const struct iovec *iov,
>>>>>>>>> +                                   size_t niov,
>>>>>>>>> +                                   Error **errp)
>>>>>>>>> +{
>>>>>>>>> +   ssize_t len = 0;
>>>>>>>>> +   ssize_t total = iov_size(iov, niov);
>>>>>>>>> +
>>>>>>>>> +   while (len < total) {
>>>>>>>>> +       len = qio_channel_readv_full(ioc, iov, niov, NULL,
>>>>>>>>> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
>>>>>>>>> +
>>>>>>>>> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
>>>>>>>>> +            if (qemu_in_coroutine()) {
>>>>>>>>> +                qio_channel_yield(ioc, G_IO_IN);
>>>>>>>>> +            } else {
>>>>>>>>> +                qio_channel_wait(ioc, G_IO_IN);
>>>>>>>>> +            }
>>>>>>>>> +            continue;
>>>>>>>>> +       }
>>>>>>>>> +       if (len == 0) {
>>>>>>>>> +           return 0;
>>>>>>>>> +       }
>>>>>>>>> +       if (len < 0) {
>>>>>>>>> +           return -1;
>>>>>>>>> +       }
>>>>>>>>> +   }
>>>>>>>> This will busy wait burning CPU where there is a read > 0 and < total.
>>>>>>>>
>>>>>>> Daniel, i could use MSG_WAITALL too if that works but then we will lose opportunity to yield. Or if you have some other idea.
>>>>>> How easy would this happen?
>>>>>>
>>>>>> Another alternative is we could just return the partial len to caller then
>>>>>> we fallback to the original channel orders if it happens.  And then if it
>>>>>> mostly will never happen it'll behave merely the same as what we want.
>>>>> Well we're trying to deal with a bug where the slow and/or unreliable
>>>>> network causes channels to arrive in unexpected order. Given we know
>>>>> we're having network trouble, I wouldn't want to make more assumptions
>>>>> about things happening correctly.
>>>>>
>>>>>
>>>>> With regards,
>>>>> Daniel
>>>>
>>>> Peter, I have seen MSG_PEEK used in combination with MSG_WAITALL, but looks like even though chances are less it can still return partial data even with multiple retries for signal case, so is not full proof.
>>>>
>>>> *MSG_WAITALL *(since Linux 2.2)
>>>>                This flag requests that the operation block until the full
>>>>                request is satisfied.  However, the call may still return
>>>>                less data than requested if a signal is caught, an error
>>>>                or disconnect occurs, or the next data to be received is
>>>>                of a different type than that returned.  This flag has no
>>>>                effect for datagram sockets.
>>>>
>>>> Actual read ahead will be little hackish, so just confirming we all are in agreement to do actual read ahead and i can send patch? :)
>>> Yet another option is the caller handles partial PEEK and then we can sleep
>>> in the migration code before another PEEK attempt until it reaches the full
>>> length.
>>>
>>> Even with that explicit sleep code IMHO it is cleaner than the read-header
>>> flag plus things like !tls check just to avoid the handshake dead lock
>>> itself (and if to go with this route we'd better also have a full document
>>> on why !tls, aka, how the dead lock can happen).
>> Nah, I forgot we're in the same condition as in the main thread.. sorry.
>>
>> Then how about using qemu_co_sleep_ns_wakeable() to replace
>> qio_channel_yield() either above, or in the caller?
> A better one is qemu_co_sleep_ns().  Off-topic: I'd even think we should
> have one qemu_co_sleep_realtime_ns() because currently all callers of
I am not aware of this :) , will check it.
> qemu_co_sleep_ns() is for the rt clock.


Yes that also works Peter. In that case, should i have a default time or take it from upper layers. And for live migration does something like of scale 1ms works?

Thanks

Manish Mishra

>

