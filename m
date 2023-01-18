Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D0671359
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 06:54:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI1NP-0000jN-Na; Wed, 18 Jan 2023 00:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pI1NM-0000iz-Kw
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 00:52:44 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pI1NJ-0001V8-8W
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 00:52:44 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30I5e9eD028945; Tue, 17 Jan 2023 21:52:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=FInrzzWRdZI14eFjq4cz976ziiy/OP5gKRDPdgX2ZFg=;
 b=1Xc3+DbVb3H8XcoDj9NOhTXXiE2LznonyxWxw5BkN8Vh/6ojDdNXrZTxHRGGhutnEx8p
 558xoyIG3hbBSgDJx8wNnFCoIECr+DsgBitPf4cfVAb4FPnsmlETrItNP8e/EL0HFdnQ
 hPFqYkCKKbFl90rGjplYswm6gcit1TSwVPrZSXQYryOfdMc0Phmrj6zFUbGbCZIOnwvG
 ipyaSJjDyLwE+DOdycW6JyTHmrKokJL94PKwz28xxWUzuY8jYyvP22v0ZGaIcNSBUSLM
 M+ZjHu4FGVw26bJL7O4JcxtRyUGmlAbJRJ0hrmhvEOji9uEmQhmCFR4JK4C93YWh8J38 eA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3n3ucq6g5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 21:52:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewAEB3vvl6g54uLG/KAt2FOjC546dgYPZqb3YnkSygPN8/6NGlsBL8cy2Y+STe7fYfjUL52m6m7W92fdkgZQU6u2Xi6/nSetb3UpkAl8nyqLGZs4Yw/64pGDbiSMX7r+LKLmLYK5lT0nhRmnACPHtDMGIH4+X7mf4wZc06V9gNwcwcBEL8cnq72oUkD0G4EoIesYN9kzfLMv1Qs+mUiYpmesuL3ba4GHOv1jIXpeG9QVoDDEkaom5Di7EGOIMsv9M0/GdGqSd6kNMqrA/Nq3prFkxQnRiSwYWT/9S1v1xpSEg1kY4TmGcTmJdjDzTyH4UwolIqovJaaRFKjia4uO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FInrzzWRdZI14eFjq4cz976ziiy/OP5gKRDPdgX2ZFg=;
 b=S6y7M4wvOF4OK43P2ifkrWRM7m6OJKxiPPDeP1L5LMYTSeghvBqYiVxfnD55vTOJP6F5krnb9Q8szw8aOO36LRa9EX0S8E+kNFPpmsD7v3Kj39GwivH0+yZxVdG36xalnL9oRdLBWz0zmrKBaVezVuBn/R9WbQuOSbJmOF8WEgI5NeRIz9UlDuHtRUQj7q1BBuyGxZwHRevEkcIW/3uQtl6XMgULJz+p7DPGG9Jf49xua54MvOTn8w1NZIOkfAbTEBZww+FU5KeA026T6e90V9i1sw+LqfboQLBrAlu4r/sRkFqj+yjJxX4XnmgJyEYzNgyuQn6maPRurPrn8V/D2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FInrzzWRdZI14eFjq4cz976ziiy/OP5gKRDPdgX2ZFg=;
 b=Lm6jhDNo6ZARjorEAJChbC2qDb60ZiGJ/qMeTROjy/5me/GHO4a/S6urkm41DVZoDmeWsjwZ90kEPCGlMwshxbJUXj/TZAhkRRV6IxudqhXzoH8U15Bga4k+8BV6jdAhFaxme+tk/MVoxV/qhtEnWXJ75kJVCFUR57Ssyo8h82ury5zi70tEFKUwrnc8m3kT94qu6VVxL9z7vAiD5qi8sgYDQHQLjFu7zj0qVAZCWaEGkgUwNxEXn+96t/mJC7yYQv/Zmhg3R3+JxAAHO8PmpRNF1cHdrcTkpmO2JVoqYppEANkhK/gaPvLY3rNt2voPSOw0ekkHmz9Xm+7uRK0myA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by MW4PR02MB7428.namprd02.prod.outlook.com (2603:10b6:303:71::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 05:52:36 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%7]) with mapi id 15.20.5986.018; Wed, 18 Jan 2023
 05:52:36 +0000
Message-ID: <787a413f-605a-6ca8-ee92-d1ab93a7531d@nutanix.com>
Date: Wed, 18 Jan 2023 11:22:22 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/5] migration: Modified 'migrate' QAPI command for
 migration
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Aravind Retnakaran <aravind.retnakaran@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <114351ed-2676-d2d1-d6a6-2eb3732d1c06@suse.de>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <114351ed-2676-d2d1-d6a6-2eb3732d1c06@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|MW4PR02MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce9988d-cbbd-4fab-9160-08daf9183358
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KpmDVJoRLzKYsXtCIzOtYAvC1vzMXiOrJ5nWI0fWbPSIFqiAJznkHAHpdRjAErxmwpI0F/R7qhaRHe/ZwtHP5StPWNSD8Rig9ls/FnH5vJe8eyP5fxpHUoJIvxNs9ZR2XdPUsMBJhc/OSaNkdl6iosx3LNjqIOOtQf9nChPwlq8a0IM7eR442u9hpmC0Dp+WResIyEd6Yz4b6C/82lTWVdNq9jeH9LK/Hq/axkLRBjE0X9pGKGacq5brTe2mmYZ9MURVoufTGS9ULT3Hc194RcWkShUXZQzwNA4Dw5oiM2CY5n91ROcV9WBZQzCIKCG2b7cy7SQiOohiVTIpcWqfKQdAn6JwYOyxcTGVqUKZDbNQXnBVGGAwiy5U6r/9n/6oPKlCFg8kVWZFqr/LRO9t+i+Jh1nrZZH0IsK6f/Hzwcj92YIey7jVyuzQh2dGSzXZomONdUtk590fl2hLFz19/Xm2ttveUZytVI/bbSFL9R4WijbsN6OD1wcSSc5qlr8OW7NwAiyPmtrHop8jIK5+5ljN7sdereX2x4QX8RhLvoJbCIH7n8LoimAk3cAtZAnCj6GqzS3SSRmmeQanVWJO1+yw3pzvMGHqrjnDBg+/CpNfqdLlGGSYbU1ztKXe9L5gOpKuKa0dh0i5+icA3h4xTKCw4phpnpx8DhOk562hvdR+c6kyPZmy+dBKUrBYt50wxApoJeicAgLHyULUFV9CY8EjYRfxBg+Uq+pNeA0jEjv+3Lii9SuqXnAsJBffkjKXvZwZLNTgBvZxd3mNylX6HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(38350700002)(38100700002)(31696002)(86362001)(8936002)(5660300002)(2906002)(44832011)(66946007)(66556008)(66476007)(41300700001)(8676002)(4326008)(2616005)(186003)(83380400001)(6512007)(26005)(53546011)(54906003)(107886003)(6666004)(52116002)(316002)(6506007)(478600001)(36756003)(6486002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDhWR0tJRWdmcVVMdWUrQnBOVmJvUVlWTUErTVNZK2Y4SlA3bThWUVE1N1Ro?=
 =?utf-8?B?RFZkYWVqWkhTdERETU40blIrUDIxR2VqYVdwN3pzVVBXdlhlV21hbjVRSGYw?=
 =?utf-8?B?TUpHeUthem1UMi9MRU13UUczU0VCczU4bllNay9GYnliZENwcEcwa1ljMHJ0?=
 =?utf-8?B?NXlHUXRlL0UvOXE0Q0IzMXlvNHYxMmU5ZWRBUEpkL1R4cnl3VmZPaWkxZDNU?=
 =?utf-8?B?b2FYNSthemxaSFNRaEVZWmZZS2NMMHIyTTBuY0htaUFLME5zQTZPTDFtQnFF?=
 =?utf-8?B?WndLelg1N0VrKzNrbWRTMlF0dnp5amt1T2Z5Nm5zUVE1d0h0VlErZngwb20z?=
 =?utf-8?B?dFE2dElDcG1EaVE5M0F0NjVpSGFuK1Z5NFJVcG5CY1YyWnFicWNTdTJBQzl4?=
 =?utf-8?B?Y1VTaFJrZ0J3TnllR2R6QUxCM0Z3QXNlVHJTQXprOUZTR1N5WHR6dzh5VXNz?=
 =?utf-8?B?T3loZUJna2p5TFAzdklDenI1Q3labkZZeXFZdGRZdU1KN1lVQmNyREF4bUsw?=
 =?utf-8?B?RHNLYWt2VXBEWklLTG1KRlNDUjB1N3J1OVYrT2RaNFVESkQ1SUtXM0pXZGdR?=
 =?utf-8?B?REFKWExXT09zZVBiQmszRDNxVHE0ZVFTclRhb3p5RnJqci93bkQ0Wk1VdE0r?=
 =?utf-8?B?aXdsRFpjaEFkVFg4N1RTQmlaWmhldVNEdzd4N015b25xTk9OOXROb2VzWExJ?=
 =?utf-8?B?eTR1NW44ZnVMejhNMU5rbHQ3MHFhTUNXdVNiUVpDTFNzc25hKy9sQW9tYzBI?=
 =?utf-8?B?cDR4bWF6NG9jd252SkVLdE1NWUprQktqRVZYd08vYm1RYUtzQjJnMURBRU9U?=
 =?utf-8?B?TDIrMU9sZ09IbXQwU3Y4anJYa3p4SlMxcGE3Wk14bEFodzhxWEZZbWN4Y28w?=
 =?utf-8?B?b2VWOS8yRVRFU0lBNHR4YjlaendzTFQ2ZU0xRWhFeDRuaUlOajFTZVZnMHQr?=
 =?utf-8?B?MjR2VWZwaXR1VmwxTmgvU2I0dXpnS1VNN09Pek9KOWgzams2aFFQNmFOWk5U?=
 =?utf-8?B?U1JtVFBKY2RmNFo2RVlqZkFxL0pmYi91RHN4dzcxYThNQXU5UEswWDZEa1JG?=
 =?utf-8?B?d0F4T0pyMHhBbHhFMHlWa05nZVFJOHdzZzg0N29vRVFxd0FvWWt1Vlp5bWZR?=
 =?utf-8?B?ZisxTkpkeTR6VWszY3ZzU3kyRGE4U0xUYTdJaEt6NjJKQlNlMnhtNUsyaUwy?=
 =?utf-8?B?K05zRzBtaWN3UC93SXJZSUI3Z1ROWFJHejdRUllTMFc1WmZyZmRQUzJ2RVUr?=
 =?utf-8?B?T0NzdG56SEIrMkNXTGVXUVlHRTFrOEd2eGt0V2FBaUJON1h6MUpaeGxwaDRZ?=
 =?utf-8?B?VHFNcHJGR0lZUTQrQ3poOStCcldRSXZ4LzI4cUlmWHpJQmQ0bktqcGRaOHdy?=
 =?utf-8?B?U2NjZWJ6REI5YkFDQ1lyRzBHQ3ZLTllJWldZU21waFU0blg1Tk8wbmJhZmxR?=
 =?utf-8?B?WXhrSTFvMXdMZHllRjdGS3YzZ1p2UUhnZGdvVlZ3c28xZWUwQnF6bUJCOVA5?=
 =?utf-8?B?aGRTMVJFVklKeW16RUFoT0Vmb09WYUNva1NlMGlyMUMyQWVUZ0FYRkYrTk84?=
 =?utf-8?B?c3FtMTVTcVlsSitNb09ZVlZUMy9wcDZJekpLSWZMZ2Z2RWNvcTZ6QWMxcE5F?=
 =?utf-8?B?RjRraWIxTlNqLytMeGh0cEpjV2piWnZkRDdOSnVxZk5ZOFlMWFVlNVQzdEJu?=
 =?utf-8?B?T0NvODluTXlIbHRqbGhHekJCZkE5RmY0ZzZjTXE1eHNYRFczdThMQXYwNjh2?=
 =?utf-8?B?V3VydUlOb3RzWXNZclA5a2gvb0RZZHczM0VQREZnbjBZUE1RZUo2YWtuYnVB?=
 =?utf-8?B?NHF3OHdIcTlQY0ZLcUZsaDY0TW1jbDdzZnM4V09XL2hYV1F2ajM2TWRlblg4?=
 =?utf-8?B?Q2FsMTBKUWw1eVNwZk1tTEhSaFFRdWdsYXJHWEhYdUlCUjNoSFdSdUd2Nldv?=
 =?utf-8?B?cXFVSng0VXdYbVFXVnFLWFA4UEtiNVEvaWtTdUVBdTVZWm90QmVKZFVPV0hO?=
 =?utf-8?B?K05tTDBBaUtRTVQvQ043OEJ1T2dobTA3UlNNT0UzcEdVQVdBVzdWQ3Q3bE9C?=
 =?utf-8?B?TkNlN3N2Ums5WTRFUFRJQVI2WUVRZlBpZ0xEKzBWajFjOFUxZDJwUVBSbWIr?=
 =?utf-8?B?S1czY2E5dUlhbVQ2Q0pScXJ4dEZXS29BU1kzR0JOVDN6b3JPdWQvbGRodGxD?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce9988d-cbbd-4fab-9160-08daf9183358
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 05:52:36.6226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kT0G4Qg+fOtRdQyyUsNf+xYox2iStsKzeHuOB6gx5fTXCNsMZEHpLrApRnRPy9T1C2bPweAS1cl+9enS9zypA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7428
X-Proofpoint-ORIG-GUID: ulipWJzoc96DHTvvI_mdu98FgNVWy-cr
X-Proofpoint-GUID: ulipWJzoc96DHTvvI_mdu98FgNVWy-cr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, SPF_HELO_NONE=0.001,
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


On 17/01/23 4:22 pm, Claudio Fontana wrote:
> Hi,
>
> On 12/26/22 06:33, Het Gala wrote:
>> Current QAPI 'migrate' command design (for initiating a migration
>> stream) contains information regarding different migrate transport mechanism
>> (tcp / unix / exec), dest-host IP address, and binding port number in form of
>> a string. Thus the design does seem to have some design issues. Some of the
>> issues, stated below are:
>>
>> 1. Use of string URIs is a data encoding scheme within a data encoding scheme.
>>     QEMU code should directly be able to work with the results from QAPI,
>>     without resorting to do a second level of parsing (eg. socket_parse()).
>> 2. For features / parameters related to migration, the migration tunables needs
>>     to be defined and updated upfront. For example, 'migrate-set-capability'
>>     and 'migrate-set-parameter' is required to enable multifd capability and
>>     multifd-number of channels respectively. Instead, 'Multifd-channels' can
>>     directly be represented as a single additional parameter to 'migrate'
>>     QAPI. 'migrate-set-capability' and 'migrate-set-parameter' commands could
>>     be used for runtime tunables that need setting after migration has already
>>     started.
> Is efficient and parallel migration to file of large VMs in scope for this design?
>
> Thanks,
>
> Claudio

This patch's design right now mainly focuses on revamping the design for 
'migrate' command.

In the upcomig patchset series in future, it will try to accomodate 
multifd as a feature in the same QAPI command and try to build multiple 
interface support on top of multifd feature. Main aim is to increase 
network bandwidth for migration with help of multiple interface and multifd.

Regards,
Het Gala.

