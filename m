Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9475D578621
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 17:19:41 +0200 (CEST)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDSX6-0002LM-EZ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 11:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oDSVg-0008Jd-Vj
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 11:18:13 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:45002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oDSVb-0007sz-Rl
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 11:18:11 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IC0fN0017227;
 Mon, 18 Jul 2022 08:18:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=N0UL4OtA2JzNEUSVwfmnjg+uIJ/k7SaTJ13/d5qx9pQ=;
 b=wKEU3lwFep4EiVYyeg+9QJbD6164un0lkvzbIxvPOIYVBZEfXXYeXSaCHE8bk17ZGzEs
 al1WnI0OGmdZFsKi6hpdWNx/BFlYcQuDaXEBk8KBSyShl7tY5zE+6QwVxrZ7pxYHQbFz
 GBBMYtcIxXApTwOhtwQFYD7xMYfqL0GvVKM35F0XOh/TgVE/UamCLSRAAopAGieQrtqq
 JPkG5HUGLGUtvV5As947vTgJ7W66e9lPgEY7BL8BhO/DN+GS8KoEHNBygrVllvHW9bh9
 5qKFeYVuoLQifx/2+3iYPcrA0XLvc5uD325M1m3z8uRsQ/KpJdF4siFuUHJGutVMMnoX RA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbs87uxad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jul 2022 08:18:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtbHgnIam9ebIQ78jwHAmtCaT7+Ep3eNLAXYpPvXLzeM4H6O5THjlR5RLMCDDaFFecRUEHxrTe9PA0LyxsTjr9ZxK7bKL3Vymf2YlZCDBD1LOnuy/lRi9/0V5eVaodxspv5HdSjdGTk389Qh/uCYptbvASzBM+pLtKvta/26hkSfZoS38+PrEz2JsHVMw4X8uMmjxVHkEMDw5g/uTBQie28VPHeAYYx2+t0zUjuz+7TqK3U4Gu1cguf5KPyfgskiEDevQkHY7dtA1jdGW4F8/Tnbwli8Iv8xe15kMu0Lm4rKsgN+pKwwXrtIZrjGnd8CM4XZErEU2kIUE1pmDT8Vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0UL4OtA2JzNEUSVwfmnjg+uIJ/k7SaTJ13/d5qx9pQ=;
 b=c6qEC/w1H6mnnCy6eAdCHwt+b+9QH0SB17/1IsHq8OM/qv116t9Lphe84gPa2/wMBFlsUez7SFKtYbiKeV8EuFgvWlF56MqFayQ9u4+9SzcA3ACfyo82SJjcgM1frz95lhfmKsFY3CZIQRs21hkC6UqRwY6l6pU+xpT9lbE2CKRw5SRZn8fDShF+ymeRP/Qjmo4+KwYz4yb+nfuIHm83SB44Ak5faCcElYRRqOtnC23rSQiMbf6a4GUTM993hO5huFFaLo9XhbLQE/+NinbirjiBsOz5p5W14UGpcOSqFfi5EHnH7m1EjVzATcsN/BbhDhmnEtq4tFf0qT/gOSxzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SN4PR0201MB3455.namprd02.prod.outlook.com (2603:10b6:803:48::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 15:18:02 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 15:18:02 +0000
Message-ID: <c3792d65-b24c-be02-f988-fa1c0e27d490@nutanix.com>
Date: Mon, 18 Jul 2022 20:47:53 +0530
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
 <06e02954-f94d-0508-90f1-a8610e1a09cf@nutanix.com>
 <877d4a7ang.fsf@pond.sub.org>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <877d4a7ang.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::12) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e93bdaf-6f97-4ace-1b93-08da68d0b4b6
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3455:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPg6RaqGdgDhC/xn9MtdsOvj86Qbt/QAYO2x/vHYgRM1Abjs52wHqCUdUxlqatbPu06gSWFUFc4Viz+hDeheV70rywL+tZg+p2PGe6BxdSFvOifzRGZENd5FE7O+kF8IeTMFBhaWeyHmSexm7yzahdmw6q6RNCmcWrCxBpfjwOF5X/Br2EF6k6t8fJ0wzpTWADpGpiXxqJL2J3ZBB1nibh2eh2gdYjSbr1yFekuG9Od/j3gL/tR0YVLaTc3dVGMUgLQecLMFEjP1a5ASd8xQ0eGntPJ7eFEguYpHTvfVWlY/uCXAAPNl2Mn8AokZHnrdROk7m+fcD81ZOFPxQ4tDN3Kdzb8FzZj2xiPIgoSfI6zYEhGAZOR0XMav6sjdN3mbm6oighlM/1AbkOnM3Qrn/5j90d8FQqdJFB64rV6NND/3cj62Cy6WoPX0UpXJgmS+uNksQDT4rym7vrtIYMn+2r75t7/0CYGMDPX/hBN5cVekqw02U1jCehcI1/D0K4f6Bcn+Gbfa1TcVxWHsy5izrDLoG6XOo01fGdteOVb0cyePAeOYh4v7ptShVftunMkCW7iGyKKVN95r8MyUNrtgF9g/GglHv3DGDZaty+Yxiq1le6Q99FAPnFzptD1QYaIwQ1PM7cjlkE0+C/TRdC8t9yFFCRU9lYsUCm1v1W2PRMse9chqEmQwL6dRwt2yeTrhjblBUnwQapFQSVqsPP6/ZgNzTyishOc0PAt47C//pOYJIzeQEMhRbXOwFpLD7kV9nG79FL7vz0Bm3lk3a37et0nEst326FzT4q8mVErlohthVG9dexX+yPT/6Z9xv4s+nv9GqY40ZNkBSoJVSn+cLghvoH7A9u1M7bTfb0e+ceqJ9u2OoDRRkHnZ3dWw7w5tSN+1SVyH+7pEfxViN25kLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(39860400002)(396003)(366004)(376002)(5660300002)(8936002)(2906002)(44832011)(86362001)(30864003)(31686004)(6916009)(66946007)(4326008)(36756003)(316002)(66476007)(66556008)(26005)(6506007)(52116002)(38350700002)(478600001)(41300700001)(6486002)(6666004)(31696002)(2616005)(186003)(53546011)(107886003)(83380400001)(38100700002)(6512007)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVV3dHYyMXdNMWFicUZZRk1FdDhZLzYzU2ZDRTF1WTZDZEpYQjR1SFN0YlVG?=
 =?utf-8?B?SUFWclppdGg1WWxhSVdPdEMxOG9EMXNQMzNuZXVBV1NZc2xiR2N3MFJzcW9j?=
 =?utf-8?B?UmZ5OGJhVnMya2FIOWxYeFUweVMrZXVFWTFXWnkvNkZHZXdXbllLVzlYZDN6?=
 =?utf-8?B?dlZNZi91M2ZXNCtsK2ZuWXhYa3o4Rm1OeVo2bEVHb2pTQVVEdnpNdmorM0o4?=
 =?utf-8?B?SXBxQlFoYnNGYXE3bGdxY1p0ZGs4Ty9qQ2VTQzhpeTJmZmNTcmNkR0FqM3g2?=
 =?utf-8?B?MTNZVDBRbjV4NWVOTnZoVG42UUtuUVV5S2FGanUxSlI4OWxld3g0eWp2RWxT?=
 =?utf-8?B?N3IwY0U0c2hkNjRQU29oYlJTYnB3U2hCOU1pQ25QRVNRYysxUjJQOVNhemc3?=
 =?utf-8?B?S04yY0x2dnc1cmkya1lLNXFKV0dCbEtWSjB4L1RIR2FiRVE1NHFmOXlKUnVK?=
 =?utf-8?B?S25KWmMyOUU1Q1VwQU5aNllUdWowZnRtamJWaUUrQjdCZEZEbWF2MGdhWUhW?=
 =?utf-8?B?UmR0WUEzdFVpdkVnMmJvS0dmL05YR2pVdENadkVoM1ZHSlNieXBxWU5rMEdp?=
 =?utf-8?B?U09nUGtZSUVlSEpiYzl4YTZVYlpndkRDM255ckQ3bXgxWlhvVVBId2lCckJG?=
 =?utf-8?B?TFVNK3gyV1lsRWtpbFdNSUQ0TGlESDI0Uk1HMVBGOWFhZEMvTUJhWFo3M082?=
 =?utf-8?B?Tkh0WjRybm9RV1NNRTRwdkhKRnlYbEJuOERVaHU4TGt2QXhhS1R6U0JwM3VG?=
 =?utf-8?B?Yy9QRFdIKzJtZ2hocVRBdFdYVTFiczlKbXcxLzBCVEIrSERQK3BrQmJ6d1E5?=
 =?utf-8?B?QTMyR1BPR1FwNWUzdGtZQm9BVG5MRXNybTh4c21ZU2Z0bkd6QlZIWlFiN1Az?=
 =?utf-8?B?SWpRYi9Qbk5jYUpxdHVTUXRNTjlldUt2dVduOWtGTWJxYlRhVTRtdkp4ZHZP?=
 =?utf-8?B?dUFkQTJNVlNHZGdtVUNkNTh4N2FJdVREK1FsbWl5WDRqbm9mSnJsd1ZRc1pv?=
 =?utf-8?B?d2JFaU9hZHpNcnp3d2twc1RZMEZKU2ZpZSs4RExmMVpVYUFNQVdYazEwbGU1?=
 =?utf-8?B?ZHVKT2xnZ2IwNngzMTZwOHdOUjZUUml5d21LSlNtS0EzL2xVMmg5SmtlRjVM?=
 =?utf-8?B?WmROc050bWhzcmxVc3MwS1VYb2U3Z0R5dXFYUmpEdUk2T2RkRGNRRVB1OTJh?=
 =?utf-8?B?UHhsQWpWZW9JQUhwYmRUZzNEQzV5dHhza2xRaE1tTEgxdEVuSld0NnFVcWJX?=
 =?utf-8?B?VVFYZ0lITFRyZGV5d1hYaS9tNStvUE9paFY0YlhwWXFBWHFwUnc0RWdiS2E4?=
 =?utf-8?B?Vm9paTBNUThIZWZGWnhwMURiU3ovUXBlMkk5TWxMTmZlSUh2OFZDdEQxczlQ?=
 =?utf-8?B?ejVmOHcrb2d3akJBakU4ZkJPY1YzcGkreDNtN0FCanNQQVA2enRRaStjdFBj?=
 =?utf-8?B?TVIxd0pTa3ZmYWdUNG9JVEk4T1RIb1QxemZPOFJYOTJGemN1Ry9GbXJrZ2tu?=
 =?utf-8?B?N0FiVjJRYVNNVll0bnIwRzQ3L3pRYVphZGhORHB0SXNKWDNxVHdhTStNUDM3?=
 =?utf-8?B?RFV4MVFoUWF1cSt0bWZCcjNLT0l4UW1JejZxbHh2Um1wWUI3cjFqSHZRelpP?=
 =?utf-8?B?MUNIOGh5SlBjQzRyb3hhVGdQS3pyNHFxWWkyd2hZaTZuRWxOWHlERkhoT1dn?=
 =?utf-8?B?L042bnk1QVJBQUxzb3R6TjlENklzTmFVSE1zVTd4R0J5YmRkMWhnMmlNRW9F?=
 =?utf-8?B?OVZWbEwvVkpWZHBiU2dOVHZpZExwRXZnSTQ5eVlVYVdja2pkcklXWlJiMjR5?=
 =?utf-8?B?dk1XQUc2NEcwRXFQc09kN0tFNkpFWTJsQS9WdFZIUkZBUjliQ3FtTlFJTnBK?=
 =?utf-8?B?WlJQcDg5SXNtaldmNllNdnpJMkprV3MwSVJUQlVPRCtyNHc4bkx1ZCtmUGNK?=
 =?utf-8?B?cFBjdGszOE15ekRMYzB6NXVEK3Z3bzlEd2lUQk5vZGxjTXp4aU84U0Evd3dr?=
 =?utf-8?B?SzNiT3dER2g2UlYyRHlBK3Y2QmdnL2hOSC9ZOVhrYnJwNFZTMWlxSkJ5Z24z?=
 =?utf-8?B?WGF4Z0FSM1pidnYzclNBVWZTNXhkRFdDMGlIcGZaaUNqaENrclp0bW1LdXVw?=
 =?utf-8?Q?ivgDaBTJZqUwI80PGCYf9h5eh?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e93bdaf-6f97-4ace-1b93-08da68d0b4b6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 15:18:02.3947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7ZO6pJOXpPah8sHCxin3S2Dq+cgjjiNYDWL3ZKgMV3FwvPh3yKg/qIvq7vbUS4Anoz/sdT/GtNyua+XV7SEvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3455
X-Proofpoint-ORIG-GUID: lDdgcnsJRaosYADEdmZKa3c8kKw8Or6Q
X-Proofpoint-GUID: lDdgcnsJRaosYADEdmZKa3c8kKw8Or6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_14,2022-07-18_01,2022-06-22_01
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


On 18/07/22 8:03 pm, Markus Armbruster wrote:
> Het Gala <het.gala@nutanix.com> writes:
>
>> On 18/07/22 2:05 pm, Markus Armbruster wrote:
>>> Het Gala <het.gala@nutanix.com> writes:
>>>
>>>> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>>>>      each element in the list consists of multi-FD connection parameters: source
>>>>      and destination uris and of the number of multi-fd channels between each pair.
>>>>
>>>> ii) Information of all multi-FD connection parameters’ list, length of the list
>>>>       and total number of multi-fd channels for all the connections together is
>>>>       stored in ‘OutgoingArgs’ struct.
>>>>
>>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>>> ---
>>>>    include/qapi/util.h   |  9 ++++++++
>>>>    migration/migration.c | 47 ++++++++++++++++++++++++++++++--------
>>>>    migration/socket.c    | 53 ++++++++++++++++++++++++++++++++++++++++---
>>>>    migration/socket.h    | 17 +++++++++++++-
>>>>    monitor/hmp-cmds.c    | 22 ++++++++++++++++--
>>>>    qapi/migration.json   | 43 +++++++++++++++++++++++++++++++----
>>>>    6 files changed, 170 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>>>> index 81a2b13a33..3041feb3d9 100644
>>>> --- a/include/qapi/util.h
>>>> +++ b/include/qapi/util.h
>>>> @@ -56,4 +56,13 @@ int parse_qapi_name(const char *name, bool complete);
>>>>        (tail) = &(*(tail))->next; \
>>>>    } while (0)
>>>>
>>>> +#define QAPI_LIST_LENGTH(list) ({ \
>>>> +    int _len = 0; \
>>>> +    typeof(list) _elem; \
>>>> +    for (_elem = list; _elem != NULL; _elem = _elem->next) { \
>>>> +        _len++; \
>>>> +    } \
>>>> +    _len; \
>>>> +})
>>>> +
>>> Unless there is a compelling reason for open-coding this, make it a
>>> (non-inline) function.
>>>
>> if kept as a function, the datatype of list is different every time
>> in the qemu code, and that led to multiple copies of this function. So
>> we decided, it would be best to keep it as a macro defined function. We
>> would be happy to hear any suggstions to solve this problem while the
>> function non-inline.
> Point taken.
>
> You could make it a function taking a GenericList *, but then you'd have
> to cast actual list pointers to GenericList, which isn't nice.
>
>>>>    #endif
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index 31739b2af9..c408175aeb 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -2328,13 +2328,14 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>>>>        return true;
>>>>    }
>>>>
>>>> -void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>>> +void qmp_migrate(const char *uri, bool has_multi_fd_uri_list,
>>>> +                 MigrateUriParameterList *cap, bool has_blk, bool blk,
>>>>                     bool has_inc, bool inc, bool has_detach, bool detach,
>>>>                     bool has_resume, bool resume, Error **errp)
>>>>    {
>>>>        Error *local_err = NULL;
>>>>        MigrationState *s = migrate_get_current();
>>>> -    const char *p = NULL;
>>>> +    const char *dst_ptr = NULL;
>>>>
>>>>        if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>>>>                             has_resume && resume, errp)) {
>>>> @@ -2348,20 +2349,46 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>>>            }
>>>>        }
>>>>
>>>> +    /*
>>>> +     * In case of Multi-FD migration parameters, if uri is provided,
>>>> +     * supports only tcp network protocol.
>>>> +     */
>>>> +    if (has_multi_fd_uri_list) {
>>>> +        int length = QAPI_LIST_LENGTH(cap);
>>>> +        init_multifd_array(length);
>>>> +        for (int i = 0; i < length; i++) {
>>>> +            const char *p1 = NULL, *p2 = NULL;
>>>> +            const char *multifd_dst_uri = cap->value->destination_uri;
>>>> +            const char *multifd_src_uri = cap->value->source_uri;
>>>> +            uint8_t multifd_channels = cap->value->multifd_channels;
>>>> +            if (!strstart(multifd_dst_uri, "tcp:", &p1) ||
>>>> +                !strstart(multifd_src_uri, "tcp:", &p2)) {
>>>> +                error_setg(errp, "multi-fd destination and multi-fd source "
>>>> +                "uri, both should be present and follows tcp protocol only");
>>>> +                break;
>>>> +            } else {
>>>> +                store_multifd_migration_params(p1 ? p1 : multifd_dst_uri,
>>>> +                                            p2 ? p2 : multifd_src_uri,
>>>> +                                            multifd_channels, i, &local_err);
>>>> +            }
>>>> +            cap = cap->next;
>>>> +        }
>>>> +    }
>>>> +
>>>>        migrate_protocol_allow_multi_channels(false);
>>>> -    if (strstart(uri, "tcp:", &p) ||
>>>> +    if (strstart(uri, "tcp:", &dst_ptr) ||
>>>>            strstart(uri, "unix:", NULL) ||
>>>>            strstart(uri, "vsock:", NULL)) {
>>>>            migrate_protocol_allow_multi_channels(true);
>>>> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>>>> +        socket_start_outgoing_migration(s, dst_ptr ? dst_ptr : uri, &local_err);
>>>>    #ifdef CONFIG_RDMA
>>>> -    } else if (strstart(uri, "rdma:", &p)) {
>>>> -        rdma_start_outgoing_migration(s, p, &local_err);
>>>> +    } else if (strstart(uri, "rdma:", &dst_ptr)) {
>>>> +        rdma_start_outgoing_migration(s, dst_ptr, &local_err);
>>>>    #endif
>>>> -    } else if (strstart(uri, "exec:", &p)) {
>>>> -        exec_start_outgoing_migration(s, p, &local_err);
>>>> -    } else if (strstart(uri, "fd:", &p)) {
>>>> -        fd_start_outgoing_migration(s, p, &local_err);
>>>> +    } else if (strstart(uri, "exec:", &dst_ptr)) {
>>>> +        exec_start_outgoing_migration(s, dst_ptr, &local_err);
>>>> +    } else if (strstart(uri, "fd:", &dst_ptr)) {
>>>> +        fd_start_outgoing_migration(s, dst_ptr, &local_err);
>>>>        } else {
>>>>            if (!(has_resume && resume)) {
>>>>                yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>>>> diff --git a/migration/socket.c b/migration/socket.c
>>>> index 4fd5e85f50..7ca6af8cca 100644
>>>> --- a/migration/socket.c
>>>> +++ b/migration/socket.c
>>>> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>>>>        SocketAddress *saddr;
>>>>    } outgoing_args;
>>>>
>>>> +struct SocketArgs {
>>>> +    struct SrcDestAddr data;
>>>> +    uint8_t multifd_channels;
>>>> +};
>>>> +
>>>> +struct OutgoingMigrateParams {
>>>> +    struct SocketArgs *socket_args;
>>>> +    size_t length;
>>> Length of what?
>> length of the socket_args[] array. Thanks for pointing it out. I will
>> be more specific for this variable in the v2 patchset series.
>>
>>>> +    uint64_t total_multifd_channel;
>>> @total_multifd_channels appears to be the sum of the
>>> socket_args[*].multifd_channels.  Correct?
>> Yes Markus, you are correct.
> Sure you need to keep the sum separately?

 > So earlier, the idea behind this was that, we had this intention to 
depreciate the migrate_multifd_channels() API from the live migration 
process. We made total_multifd_channels() function, where it used to 
calculate total number of multifd channels every time, for whichever 
function called was computation internsive so we replaced it by 
returning sum of socket_args[*].multifd_channels i.e. 
total_multifd_channel in the later patches.

  But now in the v2 patchset onwards, Thanks to inputs from Dr. David 
and Daniel, we are not depricating migrate_multifd_channels() API but 
the value from the API will be cross-referenced with sum of 
socket_args[*].multifd_channels i.e. total_multifd_channel, and error if 
they are not equal.

>
>>>> +} outgoing_migrate_params;
>>>> +
>>>>    void socket_send_channel_create(QIOTaskFunc f, void *data)
>>>>    {
>>>>        QIOChannelSocket *sioc = qio_channel_socket_new();
>>>> @@ -47,6 +58,14 @@ int socket_send_channel_destroy(QIOChannel *send)
>>>>            qapi_free_SocketAddress(outgoing_args.saddr);
>>>>            outgoing_args.saddr = NULL;
>>>>        }
>>>> +
>>>> +    if (outgoing_migrate_params.socket_args != NULL) {
>>>> +        g_free(outgoing_migrate_params.socket_args);
>>>> +        outgoing_migrate_params.socket_args = NULL;
>>>> +    }
>>>> +    if (outgoing_migrate_params.length) {
>>>> +        outgoing_migrate_params.length = 0;
>>>> +    }
>>>>        return 0;
>>>>    }
>>>>
>>>> @@ -117,13 +136,41 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>>>>    }
>>>>
>>>>    void socket_start_outgoing_migration(MigrationState *s,
>>>> -                                     const char *str,
>>>> +                                     const char *dst_str,
>>>>                                         Error **errp)
>>>>    {
>>>>        Error *err = NULL;
>>>> -    SocketAddress *saddr = socket_parse(str, &err);
>>>> +    SocketAddress *dst_saddr = socket_parse(dst_str, &err);
>>>> +    if (!err) {
>>>> +        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
>>>> +    }
>>>> +    error_propagate(errp, err);
>>>> +}
>>>> +
>>>> +void init_multifd_array(int length)
>>>> +{
>>>> +    outgoing_migrate_params.socket_args = g_new0(struct SocketArgs, length);
>>>> +    outgoing_migrate_params.length = length;
>>>> +    outgoing_migrate_params.total_multifd_channel = 0;
>>>> +}
>>>> +
>>>> +void store_multifd_migration_params(const char *dst_uri,
>>>> +                                    const char *src_uri,
>>>> +                                    uint8_t multifd_channels,
>>>> +                                    int idx, Error **errp)
>>>> +{
>>>> +    Error *err = NULL;
>>>> +    SocketAddress *src_addr = NULL;
>>>> +    SocketAddress *dst_addr = socket_parse(dst_uri, &err);
>>>> +    if (src_uri) {
>>>> +        src_addr = socket_parse(src_uri, &err);
>>>> +    }
>>> Incorrect use of &err.  error.h's big comment:
>>>
>>>    * Receive and accumulate multiple errors (first one wins):
>>>    *     Error *err = NULL, *local_err = NULL;
>>>    *     foo(arg, &err);
>>>    *     bar(arg, &local_err);
>>>    *     error_propagate(&err, local_err);
>>>    *     if (err) {
>>>    *         handle the error...
>>>    *     }
>>>    *
>>>    * Do *not* "optimize" this to
>>>    *     Error *err = NULL;
>>>    *     foo(arg, &err);
>>>    *     bar(arg, &err); // WRONG!
>>>    *     if (err) {
>>>    *         handle the error...
>>>    *     }
>>>    * because this may pass a non-null err to bar().
>>>
>> Thankyou Markus for sharing this knowledge. I was unaware of the
>> dont's with &err.
> The big comment should help you along.  If it doesn't, just ask.
 > I read the comment, and it is pretty well explained out there.
>
>>>>        if (!err) {
>>>> -        socket_start_outgoing_migration_internal(s, saddr, &err);
>>>> +        outgoing_migrate_params.socket_args[idx].data.dst_addr = dst_addr;
>>>> +        outgoing_migrate_params.socket_args[idx].data.src_addr = src_addr;
>>>> +        outgoing_migrate_params.socket_args[idx].multifd_channels
>>>> +                                                         = multifd_channels;
>>>> +        outgoing_migrate_params.total_multifd_channel += multifd_channels;
>>>>        }
>>>>        error_propagate(errp, err);
>>> Consider
>>>
>>>          struct SocketArgs *sa = &outgoing_migrate_params.socket_args[idx];
>>>          SocketAddress *src_addr, *dst_addr;
>>>
>>>          src_addr = socketaddress(src_uri, errp);
>>>          if (!src_addr) {
>>>              return;
>>>          }
>>>
>>>          dst_addr = socketaddress(dst_uri, errp);
>>>          if (!dst_addr) {
>>>              return;
>>>          }
>>>
>>>          sa->data.dst_addr = dst_addr;
>>>          sa->data.src_addr = src_addr;
>>>          sa->multifd_channels = multifd_channels;
>>>          outgoing_migrate_params.total_multifd_channel += multifd_channels;
>> Thanks Markus for this amazing suggestion. Your approach looks
>> simpler to understand and also resolves the error it had with &err. I
>> will surely implement this in the upcoming v2 patchset.
> You're welcome :)

 > I just wanted to have a double check on the solution you gave above 
Markus. The suggestion you have given there has been deliberately 
written in that way right, because

src_addr = socketaddress(src_uri, errp);
dst_addr = socketaddress(dst_uri, errp);
if (!src_addr) {
     return;
}
if (!dst_addr) {
     return;
}

would still be an error right according to the &err guidelines from 
error.h file.

>
>>>>    }
>>>> diff --git a/migration/socket.h b/migration/socket.h
>>>> index 891dbccceb..bba7f177fe 100644
>>>> --- a/migration/socket.h
>>>> +++ b/migration/socket.h
>>>> @@ -19,12 +19,27 @@
>>>>
>>>>    #include "io/channel.h"
>>>>    #include "io/task.h"
>>>> +#include "migration.h"
>>>> +
>>>> +/* info regarding destination and source uri */
>>>> +struct SrcDestAddr {
>>>> +    SocketAddress *dst_addr;
>>>> +    SocketAddress *src_addr;
>>>> +};
>>> QEMU coding style wants a typedef.
>> Okay, acknowledged.
>>
>>>>    void socket_send_channel_create(QIOTaskFunc f, void *data);
>>>>    int socket_send_channel_destroy(QIOChannel *send);
>>>>
>>>>    void socket_start_incoming_migration(const char *str, Error **errp);
>>>>
>>>> -void socket_start_outgoing_migration(MigrationState *s, const char *str,
>>>> +void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
>>>>                                         Error **errp);
>>>> +
>>>> +int multifd_list_length(MigrateUriParameterList *list);
>>>> +
>>>> +void init_multifd_array(int length);
>>>> +
>>>> +void store_multifd_migration_params(const char *dst_uri, const char *src_uri,
>>>> +                                    uint8_t multifd_channels, int idx,
>>>> +                                    Error **erp);
>>>>    #endif
>>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>>> index 622c783c32..2db539016a 100644
>>>> --- a/monitor/hmp-cmds.c
>>>> +++ b/monitor/hmp-cmds.c
>>>> @@ -56,6 +56,9 @@
>>>>    #include "migration/snapshot.h"
>>>>    #include "migration/misc.h"
>>>>
>>>> +/* Default number of multi-fd channels */
>>>> +#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
>>>> +
>>>>    #ifdef CONFIG_SPICE
>>>>    #include <spice/enums.h>
>>>>    #endif
>>>> @@ -1574,10 +1577,25 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>>>>        bool inc = qdict_get_try_bool(qdict, "inc", false);
>>>>        bool resume = qdict_get_try_bool(qdict, "resume", false);
>>>>        const char *uri = qdict_get_str(qdict, "uri");
>>>> +
>>>> +    const char *src_uri = qdict_get_str(qdict, "source-uri");
>>>> +    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
>>>> +    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
>>>> +                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
>>>>        Error *err = NULL;
>>>> +    MigrateUriParameterList *caps = NULL;
>>>> +    MigrateUriParameter *value;
>>>> +
>>>> +    value = g_malloc0(sizeof(*value));
>>>> +    value->source_uri = (char *)src_uri;
>>>> +    value->destination_uri = (char *)dst_uri;
>>>> +    value->multifd_channels = multifd_channels;
>>>> +    QAPI_LIST_PREPEND(caps, value);
>>>> +
>>>> +    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc,
>>>> +                inc, false, false, true, resume, &err);
>>>> +    qapi_free_MigrateUriParameterList(caps);
>>>>
>>>> -    qmp_migrate(uri, !!blk, blk, !!inc, inc,
>>>> -                false, false, true, resume, &err);
>>>>        if (hmp_handle_error(mon, err)) {
>>>>            return;
>>>>        }
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index 6130cd9fae..fb259d626b 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -1454,12 +1454,38 @@
>>>>    ##
>>>>    { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>>>
>>>> +##
>>>> +# @MigrateUriParameter:
>>>> +#
>>>> +# Information regarding which source interface is connected to which
>>>> +# destination interface and number of multifd channels over each interface.
>>>> +#
>>>> +# @source-uri: the Uniform Resource Identifier of the source VM.
>>>> +#              Default port number is 0.
>>>> +#
>>>> +# @destination-uri: the Uniform Resource Identifier of the destination VM
>>>> +#
>>>> +# @multifd-channels: number of parallel multifd channels used to migrate data
>>>> +#                    for specific source-uri and destination-uri. Default value
>>>> +#                    in this case is 2 (Since 4.0)
>>> You mean "(Since 7.1)", I guess.
>> Yes yes. Also David pointed this thing out. I will update the version
>> in the v2 patchset.
>>
>>>> +#
>>>> +##
>>>> +{ 'struct' : 'MigrateUriParameter',
>>>> +  'data' : { 'source-uri' : 'str',
>>>> +             'destination-uri' : 'str',
>>>> +             '*multifd-channels' : 'uint8'} }
>>>> +
>>>>    ##
>>>>    # @migrate:
>>>>    #
>>>>    # Migrates the current running guest to another Virtual Machine.
>>>>    #
>>>>    # @uri: the Uniform Resource Identifier of the destination VM
>>>> +#       for migration thread
>>>> +#
>>>> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
>>>> +#                     Resource Identifiers with number of multifd-channels
>>>> +#                     for each pair
>>>>    #
>>>>    # @blk: do block migration (full disk copy)
>>>>    #
>>>> @@ -1479,20 +1505,27 @@
>>>>    # 1. The 'query-migrate' command should be used to check migration's progress
>>>>    #    and final result (this information is provided by the 'status' member)
>>>>    #
>>>> -# 2. All boolean arguments default to false
>>>> +# 2. The uri argument should have the Uniform Resource Identifier of default
>>>> +#    destination VM. This connection will be bound to default network
>>>> +#
>>>> +# 3. All boolean arguments default to false
>>>>    #
>>>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should not
>>>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should not
>>>>    #    be used
>>>>    #
>>>>    # Example:
>>>>    #
>>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>>> +# -> { "execute": "migrate",
>>>> +#                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
>>>> +#                                "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
>>>> +#                                "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
>>>> +#                                "destination-uri": "tcp:11.0.0.0:7789", "multifd-channels": 5} ] } }
>>>>    # <- { "return": {} }
>>>>    #
>>>>    ##
>>>>    { 'command': 'migrate',
>>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'], '*blk': 'bool',
> ??

 > Sorry Markus, I think the statement I wrote did not make sense, I 
apologise for that. I meant to say example in the sense:

   # Example:
   #
# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
# -> { "execute": "migrate",
#                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
#                                "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
#                                "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
#                                "destination-uri": "tcp:11.0.0.0:7789", "multifd-channels": 5} ] } }

even this we should try to wrap within 80 character column right? or is 
that okay to go beyond 80.
>>> Long line.
>> Okay, acknowledged. Even for example, should it be under 80
>> characters per line, or that is fine?
> docs/devel/style.rst:
>
>      Line width
>      ==========
>
>      Lines should be 80 characters; try not to make them longer.
>
>      Sometimes it is hard to do, especially when dealing with QEMU subsystems
>      that use long function or symbol names. If wrapping the line at 80 columns
>      is obviously less readable and more awkward, prefer not to wrap it; better
>      to have an 85 character line than one which is awkwardly wrapped.
>
>      Even in that case, try not to make lines much longer than 80 characters.
>      (The checkpatch script will warn at 100 characters, but this is intended
>      as a guard against obviously-overlength lines, not a target.)
>
> Personally, I very much prefer to wrap between 70 and 75 except where it
> impairs legibility.
 > Okay thanks again Markus for your valuable suggestion. I will try to 
wrap within 75 in almost all the cases.
>>>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>>>   
>>>>    ##
>>>>    # @migrate-incoming:
>> Regards,
>>
>> Het Gala

Regards,

Het Gala


