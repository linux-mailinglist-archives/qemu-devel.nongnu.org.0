Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D05690A2E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:31:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ70c-0006T7-Hi; Thu, 09 Feb 2023 08:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ70Z-0006Sa-SI
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:30:40 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ70X-0001nW-Rn
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:30:39 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319B0cag005823; Thu, 9 Feb 2023 05:30:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=jeO09kXdtt3eNEfpH5ps7AX5v8r2AGbvdDS6tpVUQWQ=;
 b=0X9R3dibz0RqH/ik95abOHwFGD1PYc1KH4Ry1hNim4QrfxPZi137K+J+TmVWzIaAHcdl
 KZldkdfmXKK4VR55XKphb8qV3e2X11OlJG3fJKBnvUPAt77gsIRrO/UaTRa7HdlHXKhJ
 NDAZiO9UwT+KzWE1BGMehqw8lokx+PcTgVLse2042Uiq32EMYkiCGBlhQzj/mWX7EoCW
 dYu5z3RZodEzph2Lb1ApPtxg343kpnov17K9o6MPGahE+JHuxhAMf1xPGJSG/affeMGm
 Sd9uJlsuwhfoT/nvqnC0zU5C/sAwoCG1EZGwliGhDjnBjH6fdNQzj8JdPEOBiM69/6+f OQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhmk1fvbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 05:30:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjrCuG/hDmjneXi86+I+UUGl4MdDt5q2Fqw1mfG1obUAXKwSLVCqFoaBV25tXmZF0vufox8kh8S0g+42mojC1qmRABpL7jhKPNcBNQPg/DgtLoheItkV5i2gc1RI2og2txMWQxK/LWeRO3abqJ1vDVejhKt7E+t8TPwMvbKJHLWp71STDz5rPRspAfAxGHADEXf68/1D2PjKmgGKEDU/Zqj8pwjHXvPv1hfQCfuT2nO4lTVeaAtW0/O2P4ha21bmFvfV9SEaMxm+gq+/Ms2gOhEYsxcRKMP9U5vtpHoi3cuTxzaWZdewgY2IJ61TbG72AIcnWoWNB/OXdAYqkT4IKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeO09kXdtt3eNEfpH5ps7AX5v8r2AGbvdDS6tpVUQWQ=;
 b=YaK1EuSEWvVtm0YmXHmCa7lDjGgQ/JxK17W3HD9LSnL68zG1dq1QMLhARvC3kK/UUZQNRVnYHyN4NrtcWHgbb19l0VOY5s70om6VUkpGU7C8uExVXRoJApKEQELxyCbHme4y7KtrFRIjKLoo4zyxb9hHeY+Zot2MEmPpuVllRZ7gGSCtet1E/qIW9B8dQTT9PIOgrXT8X8Dk3v0HZdQ25Yl5fjshrXrtkPRN6ujyleDwwrvw1uGq1OG686zyxDtgshUbiBuRgnnxhJ4Zc9TMBG79b7LENViVujOGy+vORp8Ph7ppm+Sdue3yyWTZgQqlKNQi9EtWtWN/6SplJnbq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeO09kXdtt3eNEfpH5ps7AX5v8r2AGbvdDS6tpVUQWQ=;
 b=m3YVi7OVYMSAIlt+Gk1R1lQp2sRMh0lhmkXB7YoBKBfG0rdU3GEVJ5qnzTyKvRtS4slCPj+UJz7lYt8mSw6ysh/dGEbgHhugmzTVuFSigsdR+TFmkOEwlxJs4XAu7+DBDTZhummSWjweBZJqs4+3mfhVmrkgnLWZqwzzmjOGOFTi/Vm8YOAJrDSo64wLkIy9F/IORyo8kGpFtOC6xJKJbY3yzUhIDUp3ZR2fqTCmyAbvFcloZJ/CszRFrqN1Bl1VHxXehrOB7RLL+hUhQfnUqG3mqNnMT8CtNZ82SqOB2MWOawV7u19kOEGtNL2jgWttruFJqL0YvxGsQyPdH58gRg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM6PR02MB6542.namprd02.prod.outlook.com (2603:10b6:5:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 13:30:31 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:30:30 +0000
Message-ID: <d7ad1656-38a0-7a99-6ff1-476aba8f97e3@nutanix.com>
Date: Thu, 9 Feb 2023 19:00:19 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/6] migration: moved hmp_split_at_commma() helper func
 to qapi-util.c file
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-2-het.gala@nutanix.com> <Y+TgyA469zCrfPfC@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y+TgyA469zCrfPfC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|DM6PR02MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 7607de5c-276a-4b11-0368-08db0aa1d04b
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DYBBr/sQUHkajn5R0rWUdZmXrc4A/zniWE4gtcZsJDMkiq8UtI9CjferH65kOD253CyMKXkDHhsCEf/5OduYdqxlOjaxyhwibwBxHrWy/Jufy2AlY7X/UstZ0bqyYma5/QduCUKKYBfVWqJvy+3WP7siCt09vT7q1xcX7FUCirrGc5DFcnhdl0b4AtLJAs3RNT8ZGhuYSg7y+lZtZt0PjVFZLyj92xA5Ol8/o1AB2kJFWbdcLdPRHzXTV/JQqoNQ6F/aC9Ra+MqJ2cJPSgTryNVu2v+B6sRNHEjz6i7pzvf+fvsp5jNHdc/fwttDLt5JaOThokUVlWyRDXVwnSWIiVaxz1UAj1CbKLRWJpao3TBAafMtbrz3qYX9nt/zpGcuCYmu8O9iY7RyOJWBPAcXAjHT/mfr7kYTaFt275CWZi2kgjVM/L1LqWJB/RLlAsMYg0VJCGXQmpPLfJ9J7WGM/WECjYLe5Cw41qqt2DtXtsa3YWFvHONGzpGA+U+tu3ObVwwxTwqsOY1MJtiz2DqWQIaDbFkyfSwCh9tGyg3vxTbwFpsOyoujjqpTl5RMcRx6RmzoA129sbhHlYx9hwpDC0xHv3lNr/EwpHe/sPShncwSjH05i8E08gvPOtbF10TXgqIMcH5e/4PqD+RbRG+SMswoujYIejGzy7G1a+h3iGFh8N4QpJGeVvoTHFnWgfdiiOmcM4R8VroMn6z+SoqTYYq2rY4v6FzxIssZPNKxE7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(6512007)(26005)(53546011)(6506007)(44832011)(83380400001)(186003)(6666004)(2906002)(107886003)(36756003)(31686004)(6486002)(478600001)(8936002)(41300700001)(2616005)(5660300002)(8676002)(66946007)(4326008)(66476007)(6916009)(66556008)(86362001)(316002)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUYrK0RxUmZBRXBPeGI3YThKeVBpbmptMlZkcW9ldThhZXRxV1B6Z1ZPN3dt?=
 =?utf-8?B?cGJqR1VPY3Z6K0JSY2RReEUxb0drNkkvbElCNTZLcit4ZzJJWDhVeTdmZ0lZ?=
 =?utf-8?B?WEJMampUcjJlcE9WbXo1eDlndjBjdW9pM0FSaG05V0s3TzlTZnMyUkt2U1Fa?=
 =?utf-8?B?M1NKT0VBNjlTdno1VEpSR09rVE1raU1OaWdFWklJUCtlMjA0enI3RHFodEtQ?=
 =?utf-8?B?OG5MSWN5UVJqT1Bubk9vR2hybGhlT2J1ZUFreVAydmh1SllWN3RrYlpRV21H?=
 =?utf-8?B?TlhpU0QwZEU3V0dxak9oVUJvLzlYbVQyOUdsQ1BGVFZKcjNlQy83YWRObmFT?=
 =?utf-8?B?S2FBQjRxd29GQVc1ZXhiYkFBM3d3ekxva2U4K25yWThBc2MwM3B6M2UzdHdR?=
 =?utf-8?B?QjNtV2tLRmVkRVlwZTBKbkJwalU1U0FlSi9yMnFCdjUrQ0pPQmZhWUV5aWVj?=
 =?utf-8?B?eVg3NkNsWDFOdmk1TW9lZzAxYzI0STU3YWYwRTN4dUxkdi9DT2t1VUN3ZUs1?=
 =?utf-8?B?WndZTGp2MHloeGpnNWl0azJSNmJBWXdvRlJiUGlOZ2hrd2JqTkFCZGkvZFJQ?=
 =?utf-8?B?QkRIMjF6djNCa0ducjYrY0gvdUNZSStnK01JSzE5ZWNBZk5md0ZOeXErTS84?=
 =?utf-8?B?YmRUQVdpNE41L0VyNlJCVTd4eEpndnM0R2M5bHc0TEhJTlZjQ2hBQis5YnVj?=
 =?utf-8?B?QnBYQnZNVFFLdlVEbGZlUnlhRGo5VTJsYnRrWEgxbVhLQWhkVFZLVGhkK3Rs?=
 =?utf-8?B?YlhTNkwvNmF6SFMxS3M2Z1JsdlJ0bnlJQjBtbEhjMzBWaDhEdDdRQTE4eER0?=
 =?utf-8?B?UVl4bXVHNHByYTlTWW5VWGJvb0FqUm13T0xHU0dJYi9TMzhPNlcxMnpHeFVk?=
 =?utf-8?B?bUVTVkZRMENoRWQ4NHZuaFhTcis5Nml3bUpnYmNOVUlmTy8rcDJIaTVIQ21u?=
 =?utf-8?B?cHRoWVk1Mk9MMGhsenlKOFlEc3phbitlVXJOWEt1RnFrZnZwSkttVFduZ1VV?=
 =?utf-8?B?d2NwWndvd2dHRTFxbGlwUnpmWDhEZjVxT2JWNUdlMStDMEtXM3FrOWR6aVFK?=
 =?utf-8?B?eFpaQnUraTJRMUxmdHpTZGJlVEhRRnhsQ0pseVArMU9wTUpUamZlTGQremNr?=
 =?utf-8?B?MDBZWlAzeWQzcEgrbDBja096SXhNUjNxZlE1aTkyRStGTU5UMkRnbkJOVmVZ?=
 =?utf-8?B?SEhxdm9PVVVFWTNzazVFa2JUV0ZxRGkydEJGVUhqSEpqTDFJNVE0QnliZXlI?=
 =?utf-8?B?R3laQ2h2TjlweUhIY3VQTFZnWndJQklTQ0NYektMVWc3dEEwS0E4QU5Ra2l5?=
 =?utf-8?B?REFQRVRXUVFCYTlyT0FSZitmR2ZiYkpsL1M2Mk9sNzNQRk14eGFFdUtkaWM5?=
 =?utf-8?B?UE8rQkp2bHRkMFVWNWFzcDVDREtySWoyc1hFUC9Db2lkc1pSWVJSRlNRVS9Z?=
 =?utf-8?B?Z2ZVcG9EcGN1bFpSYW16VHg1YnpRMDIzZU1DWnhTaWh1RExOU3p4d0FjeVFL?=
 =?utf-8?B?R0ZIZkN6N1BxbFVtR1krZ2xwZWFrYU9CQjgzdEp2WnJNdTJSNnJMdFRwS0Zj?=
 =?utf-8?B?MkZES3BjOXh0UU9LWUxQTWdUUmREUzRqWVJ0RE16QlBjTnNsenhTNW5mMnBq?=
 =?utf-8?B?c1NwRjg3TFRFN2h0eUNYMDJwSlZFMU9JY0crUzNWWXZNMlVSVlQ2eXg3T1E5?=
 =?utf-8?B?Z0ROaXZyNVhDOUdsR2NJZFV5MEtFNStiaVpsZ1UvN205VVZOTGJqNDFic0NX?=
 =?utf-8?B?aGJHeTRWUjZIUmtYRDFFeDVFTmNWcVZtVkpxbTBWT1BGM2d3NnAycCtOWTZQ?=
 =?utf-8?B?ejVsanN1ZENqcDV3dW5NSmZHeitIc3kzSGFnWDRWcmJJTWdoZE5Ra2ZpMGo4?=
 =?utf-8?B?K1F1Qzd3N2NvcFFMK2Z4ZTZGck9mckk2eFlhU2h6YWZTWGU4TnYrK2JoaEtB?=
 =?utf-8?B?aTh1ZWp2di8vMDljbUZkdzZ6L2dXa2VKSTIwQUxaR3hsVk8yRUpZYWhHRjVX?=
 =?utf-8?B?MjdoandvL3MxYTZlU0xtZWVBVGgwVnZ4L3p5ZzJtYzNKOTd0NEVGbXdUQW5I?=
 =?utf-8?B?MFFaZExYZmE0ZTJueS9aUUZwWnBwdjNVMEcvM3d2RWtranBlVkZ2V0ZMYjJl?=
 =?utf-8?B?cWQ2ZXdUTUw2dU13Q3ZhQ05VY25zNlV1ais3YXNmUitGOGUyMGRrejl3M25L?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7607de5c-276a-4b11-0368-08db0aa1d04b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:30:30.8021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFd3+MjmMp1AkDfsvFZq2R2QyGwy/CcMgHVHi3JpVIAwIVp4Yrc//BQvpJ4N5eB4nU4s7Hvlw0+OpZZSJN54Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6542
X-Proofpoint-GUID: pUW2gwiIxRqAaMcCYU1ctmVoYXdBh_6E
X-Proofpoint-ORIG-GUID: pUW2gwiIxRqAaMcCYU1ctmVoYXdBh_6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_10,2023-02-09_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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


On 09/02/23 5:32 pm, Daniel P. Berrangé wrote:
> On Wed, Feb 08, 2023 at 09:35:55AM +0000, Het Gala wrote:
>> renamed hmp_split_at_comma() --> str_split_at_comma()
>> Shifted helper function to qapi-util.c file. Give external linkage, as
>> this function will be handy in coming commit for migration.
>>
>> Minor correction:
>> g_strsplit(str ?: "", ",", -1) --> g_strsplit(str ? str : "", ",", -1)
>>
>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   include/monitor/hmp.h  |  1 -
>>   include/qapi/util.h    |  1 +
>>   monitor/hmp-cmds.c     | 19 -------------------
>>   net/net-hmp-cmds.c     |  2 +-
>>   qapi/qapi-util.c       | 19 +++++++++++++++++++
>>   stats/stats-hmp-cmds.c |  2 +-
>>   6 files changed, 22 insertions(+), 22 deletions(-)
> I expect this patch can be dropped, since I don't believe it is
> correct to be using it in patch 2. I left comments in that other
> patch with more details.
Yes Daniel. This patch will be dropped in upcoming version of this 
patchset.
> With regards,
> Daniel
Regards,
Het Gala

