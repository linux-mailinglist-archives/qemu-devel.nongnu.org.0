Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A85783DF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:38:17 +0200 (CEST)
Received: from localhost ([::1]:34782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQwx-0007FP-Ez
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oDQsm-0007UG-PT
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:33:56 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:45666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oDQsj-0007OK-4C
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:33:56 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IBctTU009547;
 Mon, 18 Jul 2022 06:33:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=T3hcdc0XuHpCN58nfWw1XMpDR8pCiV/y9NNTZryyCFg=;
 b=rY0VSYiGKoAW7UhJc426h8HGF/JstKbshX+/pr8eYWgshV7HKXs014ccFP8NxJZxn7cb
 QbtKnUNHUpixnsYdz1+n+6gtMF+FT4QpeKBXqmJbICoScXR/hdGq/EmRVG8toWidKiHW
 jbPl1ichm1fDcsRZcX6En2mUt6fS+ozpKf2LZNyiHJfnIyAzjhFqJFXKfUw36NZr1yfA
 4/+by+99+6bicRdlPyNOvFDawXKHKc7voqEEYqwRFAtZ2ITmJg0XjuhJZjAbgrBG8Jfa
 Jy1bDWgT0cEPvnS+d1lqrjRHYKMh4I9k98tIPbF76WaCL6vEIHwOiUkjZaxRgNlYmgsb CA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbvv1uf55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jul 2022 06:33:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feaSGBj4YkJ7l3QRZ92+FqSmb4NnHjgtH8fku9YI5HGK+MHyceRSCO4mE08jzp/INsl+wDaQTKI1eq/63uQ1z1n/JrBidRo/hmFningkPKe30ApTCdhZrYC676RRkUlS9/gfSfmqHNceszsmn2/oNTwmjQZGqhJFmL/cGeX0fWoyZZ5NpoyD+lTas7gUbTIWSr767I5yX2NUUMmDdW8bah4aB0nWCogJAUJw2Vp//1k4LS8XzPGGJdY7YYdr2sJjSF0trlRYj6Gv+qFHqJe7RMMQBt7jR2ccrlOpcZZTyLT1CY/d+kbOn3qqLtMZNc/ScG3+auaJu9nEsQgV27Ilhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3hcdc0XuHpCN58nfWw1XMpDR8pCiV/y9NNTZryyCFg=;
 b=AP601cwfOsM2brVAGFUuBo1pVsRDtHr3IO1GGyhaT3woe7kB6Sw8eSWwI9eJx/pc4uF0W48aXREHkh4iNPAO8TByJL+UOhSp4CzS7fqDrKKPPbKHexba2375V8SYLYm5Xp3epet9FAEs68YQmHjU5CTo1kDjS65tb75c2668/2Jed9BnJSQHwdiPrlaVzqQL0XrqzP2Qbw0GtTbF5Ze650P3ljPc4rGB/dijIvwQNBzxIAhuifgFdW9agd3IYUQ0qohJLdBgAhumHz6lX2P6PMr/LmEOEFGEj5hf/UxUJbTf9unoFDUlrkhuWdVVWGYg7uLFMmnYTch/yxhMcfpCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CH2PR02MB6871.namprd02.prod.outlook.com (2603:10b6:610:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 13:33:47 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 13:33:47 +0000
Message-ID: <06e02954-f94d-0508-90f1-a8610e1a09cf@nutanix.com>
Date: Mon, 18 Jul 2022 19:03:34 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzRdIE1vZGlmeWluZyDigJhtaWdyYXRl4oCZIHFt?=
 =?UTF-8?Q?p_command_to_add_multi-FD_socket_on_particular_source_and_destina?=
 =?UTF-8?Q?tion_pair?=
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-2-het.gala@nutanix.com> <87h73ees2r.fsf@pond.sub.org>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <87h73ees2r.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::11) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33a6d97f-653c-4690-e792-08da68c2244d
X-MS-TrafficTypeDiagnostic: CH2PR02MB6871:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tv00WxLp9yj/VFbM2giuuC306q8fMttycQc2O/Ctw7b74iLNegVk6xZo1KZ68xYVRfkuCm7/6ApmCtcUUyyfFtmpCGFsCmRmhhekvLGNbc6Cmp5RiE6atzCUevQehNs2GB42VsDJlxHE20UKpnSvOBJ3beofuOq/ozWl1OQg9QO/dZqYoxTiilSJbqwvWuPSSq6RFNB9S28Awn1U/pbfWihUYWsgS9jaR/2aokf/mOJaZEt+pukNoXhKNjekHXeUyOgIQm8yMjQUcUoDwu4w8AaXgTqOI8lZIGfKDO1nsoNqtgyofGG6NJ8Du3Y9WD97TRSdc06u/FIC/hFI4mKzSXQBMggzMBQ6GGBNmJdR0zaCpz7rduII1jixX4AwEQLjjiVz+0Kow0kUCjr5PkxQ4y0l8YgR4cOuXxP7oZMj9H+cqHao7svWwmYiJlY7iBindRxymSyct1j3N8n4j6t6dLFYJsZUSKGcx6f1fgOeS3LYy8v6Au+GrlqhfvUdPZaa4r/tU/jfUbz8x/REHpL12QSXLFbAUlseFRuuyNaQdUXJrBzjQRQpD89W92EcDJhRu7OQXYreP64SnSfSE2OS+AvCEjRj5I6+tINknEymKKo5VAtiW33aCzBnXQFZrB2HS5L7qKRUjgCSFrx24/3rmUD9MUxXJimzuk3w570wMa37ai07qa6NE2GJwpUkmnleFzVkELQE62f2KCmYKZRrD/90H7QIZvqkeHGixK8BEeM6dqj6GvHQ9MyN1NdiFYSceBToXtOBUcHq9aqda66ZP4VQL0y+eA1rnOdf/ZYrv1fPEUBv2etTJZ3AtfJTvmG3oL08Bo8hDq949PlwdxGHyW3EgRPfDarDtKj/84TSAbdwPnjJXzscaKZwfZ0OuKoZSMfPrdZXR2aKVmE3Dg5PVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(346002)(376002)(366004)(136003)(8936002)(44832011)(30864003)(5660300002)(4326008)(66476007)(2616005)(38350700002)(66946007)(66556008)(36756003)(31696002)(38100700002)(2906002)(86362001)(6486002)(41300700001)(6666004)(478600001)(6916009)(52116002)(316002)(26005)(186003)(83380400001)(6506007)(6512007)(107886003)(53546011)(31686004)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek5jTEVYbExrWHFoOHBhRTcxMVhjb245VUE2bHh1VzVDeFVwdE0vZW1ZZ0Vk?=
 =?utf-8?B?K3NQOVhBNzVnTGQzOTZPWHdKdkErWll6enVaYTJxZ2RIZGN5cExMYkRZcWhR?=
 =?utf-8?B?QmpIMWtPanBGRThJNGovUnRJSW1tK3d5MEpNbDY1bEwremR4bnhHTHJZYXhm?=
 =?utf-8?B?dDBXSzRnci9UYVZiN1MrNHpSek1BRkRrNkpWYXBxcTBoTVhFSzlCUTd5OHI2?=
 =?utf-8?B?eFpaR0lDQ3pKN0s2T0pLMmJCMThKdlExSzEvcjRQZXZFdmhhUndzOWFtaXA5?=
 =?utf-8?B?VURPOGxvSFR5REthQXh0OVpjRmhsVU5iNHlTRGJGaGhzaGFOM3pXSURxRU1G?=
 =?utf-8?B?RitwNmxrQUp0QlQvSUU0NWcydHlYQW1aQlNMbjU1Uit1VmZJdDM2cG1DU3Zs?=
 =?utf-8?B?cysvZU84MCt2WUdzejVkWFJOQ3VPRTljNVlYTGF4RFFpVG93ZzZ0M05nbG5k?=
 =?utf-8?B?N2JoRytBWXVKL3FwSi8yVy9MMnNTYzRSK0NrR01rK09IMEhNaldObzh4UFFi?=
 =?utf-8?B?YzIwRXVjTjBPazlIYzdnTlJUckxCZDlhaVcycVFHcStFYjBFZnJtNWE2UUJJ?=
 =?utf-8?B?bUEzVVZBUUpDMkI2Rk1CbklnODhKaEtEZUtLbXkybnQzeGFBam56Q0NaWXpX?=
 =?utf-8?B?NzJOYlJIcERmWnA2ekY3b1MyNEpoOVhTZDY3NHdvQmh4dFpva0FiaDJCUEox?=
 =?utf-8?B?SGxRR3RyaUx3ekdFNU5CdERjN2VtUkdLMll4aFNsY2kzdVVzcjk4MmpxTUFo?=
 =?utf-8?B?ZWhJeDlOY0xYL2FPZnZSTHhHdFdkWnYycXdab1hKVmJreFBsTnJtSW9NMUds?=
 =?utf-8?B?elNMSHhXUnBYNmNreXlXV1o4d0FjSkFsZjNMYVZFcXdHbktRTkpYL2U4MndX?=
 =?utf-8?B?VVU4dU9YZUtmZ0VYT3BKNnFEZ2hSOXV2dEszMnRYZWNtYVJvK08ySjFnMDlV?=
 =?utf-8?B?d01PNDZtajhsOXZzSDFacFlVUFhtdVdSaXVMWGtoejNmK1puZThVY0NLNjJu?=
 =?utf-8?B?QzlSTjNjNEdueVF1RjJGOCtVYzM4b0dYYmxVK01RWG94YmJySnljWTU4M3RS?=
 =?utf-8?B?WEVxTmZZaXh1a0trWTdTdUV2cjcxSk9ySXA3Rmc1eTAvMUIyOFB4dmNyRlo1?=
 =?utf-8?B?SHNRQ2pVb2QrVVNGcjV6bFdQY0h4SHMwak9xVVhjR2pTN2tnUWxyZXN4T2Rv?=
 =?utf-8?B?SFBFNFhyOXJaeFEwbEFienN1K0lVZE9RcEhCbFl5QkIvaStFdk15T2hsVlJz?=
 =?utf-8?B?dzhveTg2NVB5bk9FRzdtTk5uNURIOGpxZDY4Zjh0NUtaMm9RN0tkc0FvaU5G?=
 =?utf-8?B?MVl6cnZoUGVQVkxJYVlFQnl2ZGlZcndDSVFWTDBUdERzQ0RnSWJRRWNtVmYr?=
 =?utf-8?B?bDlYK3I0V3dpRzZaeXdhL1BETHJESkNsTWh0VHRnOXhDd3FJYytXaGxyMjNu?=
 =?utf-8?B?eXh0OXBMMVo0Ny92dDBZUmhxNkxiN2ZUbGJtVWY1NzQ1clAveGhHODFRbHlF?=
 =?utf-8?B?S0pVeDV6RjlsV3pkaURROVRUemJNbmZlN1RRWENFOXdmcnFEMldBQVQwbWZs?=
 =?utf-8?B?UjBucXVLM3luaHA3ZFBXNndCU0NwS25lMGExN1R6Y3BwbUJpeU1hRTFtMGJ3?=
 =?utf-8?B?S09SZm41MU4zMzU1b09LOEdaWkR0QXo4SG1LRVBJaExDMTFYTnNnRmhUVGdo?=
 =?utf-8?B?TjNLeEF0QnhHTWJXdWJqb2xXN2FlZ1NVQVhPdWkyV3dZRWtyUVRDcXpqWDht?=
 =?utf-8?B?YkUvdVpnVC9nN0J5TGFUajN0OTlSOVViYURFZTdOZ2J1NHFNa1hWRmhDUk4y?=
 =?utf-8?B?M0xROEYrcGlLODJVdSszUkdUQXFiZDNhenBmYzBxOWZsLzJENmtVb2Y5SG1H?=
 =?utf-8?B?bDl3T2VoRHZQcTlTZDZuTGs3a2FxY3JBV2VpU3hkemV0NS82dUdicjhtSzRt?=
 =?utf-8?B?ZDVuNERVd0t3a1VlanBoU2szUmVERUJsMkt1MkJJTHQ0cy9nUXFSUEJVS1Nl?=
 =?utf-8?B?dThEK29MQ2d3cy9BUGNhMHRNenl2NkVXWUxXNXRVSXRJZjJZd3I0NUVEMUli?=
 =?utf-8?B?Q2xscnJEUjZBZ3drc1BDa3Fqa1M3L3F6NkhVaEpaOW52b2RFcTljT3granph?=
 =?utf-8?Q?yTex+zoKY0IYhOq3qsc1IbK6i?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a6d97f-653c-4690-e792-08da68c2244d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 13:33:47.0250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNcDDDhfkNTrAxmJI2WA51qkq3/LrxSsakMAim/f7rBnYy33MxK+/ahypuKGlqu5+surzQ2DXMhMPXrNTF5eyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6871
X-Proofpoint-ORIG-GUID: p4SAJlKIhSfy1CTUjvFn9NUcFvM4FYio
X-Proofpoint-GUID: p4SAJlKIhSfy1CTUjvFn9NUcFvM4FYio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_12,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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


On 18/07/22 2:05 pm, Markus Armbruster wrote:
> Het Gala <het.gala@nutanix.com> writes:
>
>> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>>     each element in the list consists of multi-FD connection parameters: source
>>     and destination uris and of the number of multi-fd channels between each pair.
>>
>> ii) Information of all multi-FD connection parameters’ list, length of the list
>>      and total number of multi-fd channels for all the connections together is
>>      stored in ‘OutgoingArgs’ struct.
>>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   include/qapi/util.h   |  9 ++++++++
>>   migration/migration.c | 47 ++++++++++++++++++++++++++++++--------
>>   migration/socket.c    | 53 ++++++++++++++++++++++++++++++++++++++++---
>>   migration/socket.h    | 17 +++++++++++++-
>>   monitor/hmp-cmds.c    | 22 ++++++++++++++++--
>>   qapi/migration.json   | 43 +++++++++++++++++++++++++++++++----
>>   6 files changed, 170 insertions(+), 21 deletions(-)
>>
>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>> index 81a2b13a33..3041feb3d9 100644
>> --- a/include/qapi/util.h
>> +++ b/include/qapi/util.h
>> @@ -56,4 +56,13 @@ int parse_qapi_name(const char *name, bool complete);
>>       (tail) = &(*(tail))->next; \
>>   } while (0)
>>   
>> +#define QAPI_LIST_LENGTH(list) ({ \
>> +    int _len = 0; \
>> +    typeof(list) _elem; \
>> +    for (_elem = list; _elem != NULL; _elem = _elem->next) { \
>> +        _len++; \
>> +    } \
>> +    _len; \
>> +})
>> +
> Unless there is a compelling reason for open-coding this, make it a
> (non-inline) function.
 > if kept as a function, the datatype of list is different every time 
in the qemu code, and that led to multiple copies of this function. So 
we decided, it would be best to keep it as a macro defined function. We 
would be happy to hear any suggstions to solve this problem while the 
function non-inline.
>>   #endif
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 31739b2af9..c408175aeb 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -2328,13 +2328,14 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>>       return true;
>>   }
>>   
>> -void qmp_migrate(const char *uri, bool has_blk, bool blk,
>> +void qmp_migrate(const char *uri, bool has_multi_fd_uri_list,
>> +                 MigrateUriParameterList *cap, bool has_blk, bool blk,
>>                    bool has_inc, bool inc, bool has_detach, bool detach,
>>                    bool has_resume, bool resume, Error **errp)
>>   {
>>       Error *local_err = NULL;
>>       MigrationState *s = migrate_get_current();
>> -    const char *p = NULL;
>> +    const char *dst_ptr = NULL;
>>   
>>       if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>>                            has_resume && resume, errp)) {
>> @@ -2348,20 +2349,46 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>           }
>>       }
>>   
>> +    /*
>> +     * In case of Multi-FD migration parameters, if uri is provided,
>> +     * supports only tcp network protocol.
>> +     */
>> +    if (has_multi_fd_uri_list) {
>> +        int length = QAPI_LIST_LENGTH(cap);
>> +        init_multifd_array(length);
>> +        for (int i = 0; i < length; i++) {
>> +            const char *p1 = NULL, *p2 = NULL;
>> +            const char *multifd_dst_uri = cap->value->destination_uri;
>> +            const char *multifd_src_uri = cap->value->source_uri;
>> +            uint8_t multifd_channels = cap->value->multifd_channels;
>> +            if (!strstart(multifd_dst_uri, "tcp:", &p1) ||
>> +                !strstart(multifd_src_uri, "tcp:", &p2)) {
>> +                error_setg(errp, "multi-fd destination and multi-fd source "
>> +                "uri, both should be present and follows tcp protocol only");
>> +                break;
>> +            } else {
>> +                store_multifd_migration_params(p1 ? p1 : multifd_dst_uri,
>> +                                            p2 ? p2 : multifd_src_uri,
>> +                                            multifd_channels, i, &local_err);
>> +            }
>> +            cap = cap->next;
>> +        }
>> +    }
>> +
>>       migrate_protocol_allow_multi_channels(false);
>> -    if (strstart(uri, "tcp:", &p) ||
>> +    if (strstart(uri, "tcp:", &dst_ptr) ||
>>           strstart(uri, "unix:", NULL) ||
>>           strstart(uri, "vsock:", NULL)) {
>>           migrate_protocol_allow_multi_channels(true);
>> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>> +        socket_start_outgoing_migration(s, dst_ptr ? dst_ptr : uri, &local_err);
>>   #ifdef CONFIG_RDMA
>> -    } else if (strstart(uri, "rdma:", &p)) {
>> -        rdma_start_outgoing_migration(s, p, &local_err);
>> +    } else if (strstart(uri, "rdma:", &dst_ptr)) {
>> +        rdma_start_outgoing_migration(s, dst_ptr, &local_err);
>>   #endif
>> -    } else if (strstart(uri, "exec:", &p)) {
>> -        exec_start_outgoing_migration(s, p, &local_err);
>> -    } else if (strstart(uri, "fd:", &p)) {
>> -        fd_start_outgoing_migration(s, p, &local_err);
>> +    } else if (strstart(uri, "exec:", &dst_ptr)) {
>> +        exec_start_outgoing_migration(s, dst_ptr, &local_err);
>> +    } else if (strstart(uri, "fd:", &dst_ptr)) {
>> +        fd_start_outgoing_migration(s, dst_ptr, &local_err);
>>       } else {
>>           if (!(has_resume && resume)) {
>>               yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>> diff --git a/migration/socket.c b/migration/socket.c
>> index 4fd5e85f50..7ca6af8cca 100644
>> --- a/migration/socket.c
>> +++ b/migration/socket.c
>> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>>       SocketAddress *saddr;
>>   } outgoing_args;
>>   
>> +struct SocketArgs {
>> +    struct SrcDestAddr data;
>> +    uint8_t multifd_channels;
>> +};
>> +
>> +struct OutgoingMigrateParams {
>> +    struct SocketArgs *socket_args;
>> +    size_t length;
> Length of what?
 > length of the socket_args[] array. Thanks for pointing it out. I will 
be more specific for this variable in the v2 patchset series.
>
>> +    uint64_t total_multifd_channel;
> @total_multifd_channels appears to be the sum of the
> socket_args[*].multifd_channels.  Correct?
 > Yes Markus, you are correct.
>
>> +} outgoing_migrate_params;
>> +
>>   void socket_send_channel_create(QIOTaskFunc f, void *data)
>>   {
>>       QIOChannelSocket *sioc = qio_channel_socket_new();
>> @@ -47,6 +58,14 @@ int socket_send_channel_destroy(QIOChannel *send)
>>           qapi_free_SocketAddress(outgoing_args.saddr);
>>           outgoing_args.saddr = NULL;
>>       }
>> +
>> +    if (outgoing_migrate_params.socket_args != NULL) {
>> +        g_free(outgoing_migrate_params.socket_args);
>> +        outgoing_migrate_params.socket_args = NULL;
>> +    }
>> +    if (outgoing_migrate_params.length) {
>> +        outgoing_migrate_params.length = 0;
>> +    }
>>       return 0;
>>   }
>>   
>> @@ -117,13 +136,41 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>>   }
>>   
>>   void socket_start_outgoing_migration(MigrationState *s,
>> -                                     const char *str,
>> +                                     const char *dst_str,
>>                                        Error **errp)
>>   {
>>       Error *err = NULL;
>> -    SocketAddress *saddr = socket_parse(str, &err);
>> +    SocketAddress *dst_saddr = socket_parse(dst_str, &err);
>> +    if (!err) {
>> +        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
>> +    }
>> +    error_propagate(errp, err);
>> +}
>> +
>> +void init_multifd_array(int length)
>> +{
>> +    outgoing_migrate_params.socket_args = g_new0(struct SocketArgs, length);
>> +    outgoing_migrate_params.length = length;
>> +    outgoing_migrate_params.total_multifd_channel = 0;
>> +}
>> +
>> +void store_multifd_migration_params(const char *dst_uri,
>> +                                    const char *src_uri,
>> +                                    uint8_t multifd_channels,
>> +                                    int idx, Error **errp)
>> +{
>> +    Error *err = NULL;
>> +    SocketAddress *src_addr = NULL;
>> +    SocketAddress *dst_addr = socket_parse(dst_uri, &err);
>> +    if (src_uri) {
>> +        src_addr = socket_parse(src_uri, &err);
>> +    }
> Incorrect use of &err.  error.h's big comment:
>
>   * Receive and accumulate multiple errors (first one wins):
>   *     Error *err = NULL, *local_err = NULL;
>   *     foo(arg, &err);
>   *     bar(arg, &local_err);
>   *     error_propagate(&err, local_err);
>   *     if (err) {
>   *         handle the error...
>   *     }
>   *
>   * Do *not* "optimize" this to
>   *     Error *err = NULL;
>   *     foo(arg, &err);
>   *     bar(arg, &err); // WRONG!
>   *     if (err) {
>   *         handle the error...
>   *     }
>   * because this may pass a non-null err to bar().
 > Thankyou Markus for sharing this knowledge. I was unaware of the 
dont's with &err.
>>       if (!err) {
>> -        socket_start_outgoing_migration_internal(s, saddr, &err);
>> +        outgoing_migrate_params.socket_args[idx].data.dst_addr = dst_addr;
>> +        outgoing_migrate_params.socket_args[idx].data.src_addr = src_addr;
>> +        outgoing_migrate_params.socket_args[idx].multifd_channels
>> +                                                         = multifd_channels;
>> +        outgoing_migrate_params.total_multifd_channel += multifd_channels;
>>       }
>>       error_propagate(errp, err);
> Consider
>
>         struct SocketArgs *sa = &outgoing_migrate_params.socket_args[idx];
>         SocketAddress *src_addr, *dst_addr;
>
>         src_addr = socketaddress(src_uri, errp);
>         if (!src_addr) {
>             return;
>         }
>
>         dst_addr = socketaddress(dst_uri, errp);
>         if (!dst_addr) {
>             return;
>         }
>
>         sa->data.dst_addr = dst_addr;
>         sa->data.src_addr = src_addr;
>         sa->multifd_channels = multifd_channels;
>         outgoing_migrate_params.total_multifd_channel += multifd_channels;
 > Thanks Markus for this amazing suggestion. Your approach looks 
simpler to understand and also resolves the error it had with &err. I 
will surely implement this in the upcoming v2 patchset.
>>   }
>> diff --git a/migration/socket.h b/migration/socket.h
>> index 891dbccceb..bba7f177fe 100644
>> --- a/migration/socket.h
>> +++ b/migration/socket.h
>> @@ -19,12 +19,27 @@
>>   
>>   #include "io/channel.h"
>>   #include "io/task.h"
>> +#include "migration.h"
>> +
>> +/* info regarding destination and source uri */
>> +struct SrcDestAddr {
>> +    SocketAddress *dst_addr;
>> +    SocketAddress *src_addr;
>> +};
> QEMU coding style wants a typedef.
 > Okay, acknowledged.
>>   
>>   void socket_send_channel_create(QIOTaskFunc f, void *data);
>>   int socket_send_channel_destroy(QIOChannel *send);
>>   
>>   void socket_start_incoming_migration(const char *str, Error **errp);
>>   
>> -void socket_start_outgoing_migration(MigrationState *s, const char *str,
>> +void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
>>                                        Error **errp);
>> +
>> +int multifd_list_length(MigrateUriParameterList *list);
>> +
>> +void init_multifd_array(int length);
>> +
>> +void store_multifd_migration_params(const char *dst_uri, const char *src_uri,
>> +                                    uint8_t multifd_channels, int idx,
>> +                                    Error **erp);
>>   #endif
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 622c783c32..2db539016a 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -56,6 +56,9 @@
>>   #include "migration/snapshot.h"
>>   #include "migration/misc.h"
>>   
>> +/* Default number of multi-fd channels */
>> +#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
>> +
>>   #ifdef CONFIG_SPICE
>>   #include <spice/enums.h>
>>   #endif
>> @@ -1574,10 +1577,25 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>>       bool inc = qdict_get_try_bool(qdict, "inc", false);
>>       bool resume = qdict_get_try_bool(qdict, "resume", false);
>>       const char *uri = qdict_get_str(qdict, "uri");
>> +
>> +    const char *src_uri = qdict_get_str(qdict, "source-uri");
>> +    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
>> +    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
>> +                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
>>       Error *err = NULL;
>> +    MigrateUriParameterList *caps = NULL;
>> +    MigrateUriParameter *value;
>> +
>> +    value = g_malloc0(sizeof(*value));
>> +    value->source_uri = (char *)src_uri;
>> +    value->destination_uri = (char *)dst_uri;
>> +    value->multifd_channels = multifd_channels;
>> +    QAPI_LIST_PREPEND(caps, value);
>> +
>> +    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc,
>> +                inc, false, false, true, resume, &err);
>> +    qapi_free_MigrateUriParameterList(caps);
>>   
>> -    qmp_migrate(uri, !!blk, blk, !!inc, inc,
>> -                false, false, true, resume, &err);
>>       if (hmp_handle_error(mon, err)) {
>>           return;
>>       }
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 6130cd9fae..fb259d626b 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1454,12 +1454,38 @@
>>   ##
>>   { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>   
>> +##
>> +# @MigrateUriParameter:
>> +#
>> +# Information regarding which source interface is connected to which
>> +# destination interface and number of multifd channels over each interface.
>> +#
>> +# @source-uri: the Uniform Resource Identifier of the source VM.
>> +#              Default port number is 0.
>> +#
>> +# @destination-uri: the Uniform Resource Identifier of the destination VM
>> +#
>> +# @multifd-channels: number of parallel multifd channels used to migrate data
>> +#                    for specific source-uri and destination-uri. Default value
>> +#                    in this case is 2 (Since 4.0)
> You mean "(Since 7.1)", I guess.
 > Yes yes. Also David pointed this thing out. I will update the version 
in the v2 patchset.
>> +#
>> +##
>> +{ 'struct' : 'MigrateUriParameter',
>> +  'data' : { 'source-uri' : 'str',
>> +             'destination-uri' : 'str',
>> +             '*multifd-channels' : 'uint8'} }
>> +
>>   ##
>>   # @migrate:
>>   #
>>   # Migrates the current running guest to another Virtual Machine.
>>   #
>>   # @uri: the Uniform Resource Identifier of the destination VM
>> +#       for migration thread
>> +#
>> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
>> +#                     Resource Identifiers with number of multifd-channels
>> +#                     for each pair
>>   #
>>   # @blk: do block migration (full disk copy)
>>   #
>> @@ -1479,20 +1505,27 @@
>>   # 1. The 'query-migrate' command should be used to check migration's progress
>>   #    and final result (this information is provided by the 'status' member)
>>   #
>> -# 2. All boolean arguments default to false
>> +# 2. The uri argument should have the Uniform Resource Identifier of default
>> +#    destination VM. This connection will be bound to default network
>> +#
>> +# 3. All boolean arguments default to false
>>   #
>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should not
>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should not
>>   #    be used
>>   #
>>   # Example:
>>   #
>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>> +# -> { "execute": "migrate",
>> +#                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
>> +#                                "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
>> +#                                "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
>> +#                                "destination-uri": "tcp:11.0.0.0:7789", "multifd-channels": 5} ] } }
>>   # <- { "return": {} }
>>   #
>>   ##
>>   { 'command': 'migrate',
>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>> -           '*detach': 'bool', '*resume': 'bool' } }
>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'], '*blk': 'bool',
> Long line.
 > Okay, acknowledged. Even for example, should it be under 80 
characters per line, or that is fine?
>
>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>   
>>   ##
>>   # @migrate-incoming:

Regards,

Het Gala


