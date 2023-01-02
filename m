Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1810665ADB0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 08:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCF6n-0005Q9-HN; Mon, 02 Jan 2023 02:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pCF6l-0005PV-3X
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 02:19:43 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pCF6i-0000fM-Vg
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 02:19:42 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3025ZGfx000568; Sun, 1 Jan 2023 23:19:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=x6sSGUNZPc6o0FdBcRqPGuWHHWxDnqT0hVUwiuXswQk=;
 b=WdDLM0U5MWPTNQtPy6k+4FtSA2vMWqx1a7oymrqzB2GTha+Ssd7ZJw9XyjcNhCpHqQK0
 k/9ScciOu5z5B73hSMjNiG+XPOh59Bjwm8IM0ceBRWZ4vQi8z2r2x9vM9CPdHFqiV1yn
 9RHRbdPVwAJgEx14si7b/wTuB2vD3anWJnYzHow2zZoLrJ8C+SVsDPfo0DinWBisFXYY
 f7Dx3u2PXgS6wlqPcReufd5U4pjHF6klIwTCE/eass/0iKY4xoxeVeN4WZeq8jYdEho6
 K/TMHoBy+k5Ut15Q9imjj6fITkzSQYKQ+DYFSjDsS79GpJi9W119LdNyXKSbMjNCZUJp Nw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mtja0ky3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 01 Jan 2023 23:19:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYTm3Jp9CWhzHF8SV7Sc2z1YZAOlcuBZUesBxRk4uG3Q3OaklxNnsdci7g9UsHvDJgbIL6MZBdoyZ3L5AJBg2Nnk9JA11sIH+v2BLSdszWs9Bv/2tOSmxtAirc6vJYVPyrz6bqH+kKHcERhXeOm7OY2w73HqX/VOB1KBZC+1IP3HayogHmJ5AXwTOP4vyVI3rrJEanHhTTdObFeYkuQ1faEKXyHzqeepP0PhcCsV+5qIXZPzNl94wbzNTtTpbiphC3TeQ/8Pg7jRMrH4yt48t6v+Q5VSfEorElMLAw0/MAlVldELNtaD9Zx2B6V4FORFBxn7eXcEeuF1xfh/WvgI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6sSGUNZPc6o0FdBcRqPGuWHHWxDnqT0hVUwiuXswQk=;
 b=Tt34hi7GOYCnBjXmQTPha7wF1UvqZ714hyYC/pdOg2Jd9VALRyfRLCaPFEe/GZNzdAjgQvsgLpgZk+UGnlQy2xR/Ty6snlQ0ZbyadUcL+zOq5n38trFPLUE8i5Ut1QfhbStDVNBlh2mk5gTdeXU3nD1KTdK3hPQcz/D1HnlKeMN6J1mCq1XQ5YqwADlGaECLf7uGbxkYL37Z9DRZyC+cbX90fb4VEzO7r3wwD98VVx1fPvON20ABm42Xw9FFSdGHJKS31xU+VkZLNj4fKmY1tadojYwEyAq4Aye38oFjvl53Jy8uEh1PPsaGYw+wVoCbdi+nXdgejp/HLmM7gN7tZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6sSGUNZPc6o0FdBcRqPGuWHHWxDnqT0hVUwiuXswQk=;
 b=TcC6B5Ws7skc3xmbhDxCjMQuWttA9mPLuAwtM41WHEaV6XKT+dwgvM49OMMcv+BydTXAjNHPhz0ABSfJFTqyeLsrlE9LWXuUcfY3yeSZ02Oe0r1v2hw1njLWcloiKJR5vdAcBOPrUTzAtE27/qHXkxBo3JFBikS+a9w3cA5Sv1Pch/vgW03lU2IV1g91FgFxaWX+4Syg14zkgOYpmUZgIpf4RKPDAWrae3cHGv0UZ8qPEVsvJN6YrCUKlmWRoqZhbW/lvvp0ertLJK7vtejbxSdUCIrxg0l5m01myOdV+ATJuscK+Utle9orgFNS3cTxasQn0rbx4Lxv3AlNq0LxEA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM4PR02MB9240.namprd02.prod.outlook.com (2603:10b6:8:104::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 2 Jan
 2023 07:19:33 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3%6]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 07:19:32 +0000
Message-ID: <2b4a7c3e-9124-8fea-380b-64a071feb135@nutanix.com>
Date: Mon, 2 Jan 2023 12:48:37 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/5] migration: Modified 'migrate' QAPI command for
 migration
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com
References: <20221226053329.157905-1-het.gala@nutanix.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <20221226053329.157905-1-het.gala@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|DM4PR02MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: a9549c76-f804-4e53-fe42-08daec91b1f3
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wqkQq88hTU2hUfBb+SyXCqmnBCz2Jwz/wOO2vtU4iVjVnsWK0f+owlrhQ210yMGmEEu/aeW33hrKf3AAO6nik5EvU19kHk95TABG5An8zXw7I8IYezNzv7k21fz/tutYiZAJRzrJUK5yc5SKFh0Q3ZmG8PebG0MKU1A/IuAhu5uN5YHZtxHXQ2FYHVNAcadzMCLgMpvS/1oXW2pyX6cPe+srhBDMAEBsg+PCrDGapZPC/NlrAsUKEOWLLdQkSIJ56jNmNhAgmOZ/pastzSqMFOxbUol3Cy0J4sxnEvQFAPL4L43UItvjjCPVbDbZ+2Kd+n6v1U6nosvI+JXT2lmdbIUdIB0v6RU3lAPjYWHr0n3G7ZA68nb9a0NCgp5RoZOUrbvS343PPavaPM+2UcdVSOrk5B4dWzYtiF8+QUR1ZEFltbnrzj7KNTdqjvH+w2x4JqaPcaWQAvs7khl01E2UP854YGkGjsJ7ZMoIZhKkI4UHoRsJ/YS7OuhXsUIWN/zUw4P9L340vrLhUYXg5nieODcqxB29FNjIn4FWUlHMJGw6pGV6JTtfVniHkGYG7TLXC20eWRI1x41ZnAIJ4TLmJE0dXN5hx9msUev9Nc6vMoiZriompORUotzNnVaqPvabFJhZAnbC/o3mojhnZ7Yn7hHcUI3Js9oPZNwVBfDT+QSDkunwweWJcoYaZ/r8MmnEQ9FRaG3OOnwS6x8xpRwbk9h9zgdMOzeMHsT2Uz3wwzhJapAJStwN/k3MIE21P/Zuw3luG5dTbJk1Dc+4J+r7ZaWTfbyzw50DpteA7rhtbrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(86362001)(31686004)(36756003)(6506007)(31696002)(66556008)(83380400001)(8676002)(66476007)(6916009)(4326008)(41300700001)(66946007)(38100700002)(38350700002)(52116002)(53546011)(6486002)(478600001)(316002)(44832011)(2616005)(5660300002)(2906002)(26005)(6512007)(186003)(8936002)(22166006)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlVFWlk3aCtpU090MzNnK0c5N3RxUXoxenRtS2Q5K1FkR2szeXZXb2REZ21x?=
 =?utf-8?B?ZzM2eVBmZy80dmExSE95Zy83VzBMaGZsd0FSSXdBdjNPQnkvTE54bXROVTJp?=
 =?utf-8?B?azR5NzY3bkhJUzFYVUtvSHoxYkJ1Q1hJU0FrWHZ6N1JvSXZjNXdXdXphQmdz?=
 =?utf-8?B?ckZNRW9Fa0JkeWlyK1lTNHRPYTJmYVdWSFY2eWxENU5XT3U0TVlyYTk2ZTRl?=
 =?utf-8?B?dnE1M3ZMUDdtZ0w3YTlQdWljaitZQUZ6bjlCeDlYVTdRUkcxYWZkWW40SlFv?=
 =?utf-8?B?Ty82NEZvenEwL2tIUnIySGFFdmxXbDhVY0ZMZkJFTVY0Yno4VFBPTzAzWDd3?=
 =?utf-8?B?cjhuSmIwR005T25wUlFsZjJJVklyOWg3M1ZBQ05RVnlQNk13NTFPdXhPRXB3?=
 =?utf-8?B?bmZFZm1yTU84QWVsdEQ0RDNML3k2TTBKa0MySFFwTDFRVWxnNStGakphaDlH?=
 =?utf-8?B?cDZFWFdnOWdwTU05UWttT0NVbCswZkZobGhPT2JCYXRmOWl6a3E3RDM1WlVs?=
 =?utf-8?B?QW40dDFHZk5FU2kyRmlrYm00N25JaUtQcGlsdDlDWmhaZTdhdHd1MzFkc1da?=
 =?utf-8?B?WnJHeU83cXJrc0lVVmVPQyszS2RNMmJadmphdERZM0NUaWhCcEZvSlp6bmZB?=
 =?utf-8?B?enBadk9qNVRpN1Fkd3dvdUQraCt0T1YxL1c3TG0xMlo4MkF5THY4a1hPcm5M?=
 =?utf-8?B?SS9PVGJHYk9yUFA5aHU3Y3BjTnJHYmozN3FRSnVZY0U5cTdXQUhlQlQySm91?=
 =?utf-8?B?NkZlS1pDOG5QeGNPaytBTDZZRHB0OEZWdmFkQ3VsMytBSXdOYTdINVRUVUVY?=
 =?utf-8?B?SHdUUm5VUnQvNVl0SHIyYkNOUjlLcXFJWFAvTHc4N3BTOTZOQ291Tk5uQ3pC?=
 =?utf-8?B?TTgvYTZkWXRyOG91ZkIrc2xQbXROb1AwVy8xbEdxenBFQWxvQlJIWGRhRTBq?=
 =?utf-8?B?dDZSeTUrQWhSMW44Uk85WVlrQkpDMDV3VVpxRnR6WmdpR1diZ0FwOFlPZWtp?=
 =?utf-8?B?TzdWZHM2cGNieXQrSjAyWENyQ2Z2MHJoZ2I2TitSaGJXTWk1T21RS0NxZEJT?=
 =?utf-8?B?WkViN3JlSXVibGcxbXpBNEkyUHRmM3V3QVhxWXhVUmF0eUZOQUpDK1VBdHNr?=
 =?utf-8?B?eDlNNEVkOVBrR0UyY3g2S3lmWmcwcFAyVlRYZmVOSnpiZlE2ald2K00zbXJx?=
 =?utf-8?B?aUlqczlWRmt6elpqeTRxRVNTQlkrbEw4M2Z5NGpGNnJjK3Q4U1Q3M1B3NjZq?=
 =?utf-8?B?OEl5Yk5Pd1ZCRkNVcVFPaVkyaUxUK3BTaUNhQVdmUktuNVdkS3V5Wmw2eTlw?=
 =?utf-8?B?c0JIMmJRU0dUZW1wTHBhc2N4cGh4MG9VVStpd3ZDam5EVktBc3FUZVQrN1hm?=
 =?utf-8?B?RWFnbHpaSnV3SWl1aHhGa2x3SGJwbEdTTnZUT3pDOXBEYkgyRFZnUFNaTktB?=
 =?utf-8?B?dFlvZWdETHV2SWFNaEZpcmNyWVIwd2p6b0o3VVdJUGo1aGJESklNUjJNYVF6?=
 =?utf-8?B?c3JycUU3UjJuWEhaVCtSdEtHbFN1aU1tSjB2em5hWXVrZnpHRnNHRjA3b2ov?=
 =?utf-8?B?STRrZGpoYm9XYzZFUnFva2xKbkF0ampsN1p4d2FhUlIzWTQ0Q0dBc0V4eFg5?=
 =?utf-8?B?N05GbUJSL1FOOWVySVMybnBjRFRVOUp3MmVnZnNrNkt5TEFLS3AxRllJckE3?=
 =?utf-8?B?Z2xmdlZaQVZScWxVTy9EWElhVGE1Y280SmZadnJTWXBBbFRZejFNME1obW9x?=
 =?utf-8?B?Qk56TTNiT2R1WSt3K1N1TWJhM0hLQjRZdkk0MUVYWk9YdG5ON1ZIQktJM2xo?=
 =?utf-8?B?Y3dJVWJwUHYvb0hpRmNLbUxzSTRicWxRQlRnQ0M5dUlTS0VNbnFpZ2djdGh2?=
 =?utf-8?B?c0RwTXdaelp2V2tDQllRbnBlYllQWkV2Z2R6Vmd5V2poVEFlckxMZVRCbDR6?=
 =?utf-8?B?LzBrczlpUmhTYzVLSU0wR1VkYmd4VDYxUDNuTGVaeHFSU1dMSHl6UVB1eEVt?=
 =?utf-8?B?UytlWlpIQS9OK1RPdGVuVTljL3J4Ulc0NjZ4ZlB4azFla2hZdGNhM2hrRkQ1?=
 =?utf-8?B?K3RJZ215NzBUZVUzQ3Z5dEFBVkttSWFVWm51U0d5YWhqcFNZcklSVWVtamFa?=
 =?utf-8?Q?QS5lSk2S0mK0RZ7JQiTIdLLsn?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9549c76-f804-4e53-fe42-08daec91b1f3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 07:19:32.9285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2F1G4MQIqfY0+Kr+1/nykqNmWhvrYX4ih2oGDuLD9+ngZ0yKauqxFXeuXGYJwaw5Nr5bLOuT1JQKRWamGT2qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR02MB9240
X-Proofpoint-GUID: lzlS5dK5sAvdAP4go97pIVMx5mJVBrnV
X-Proofpoint-ORIG-GUID: lzlS5dK5sAvdAP4go97pIVMx5mJVBrnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_03,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.802, SPF_HELO_NONE=0.001,
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


On 26/12/22 11:03 am, Het Gala wrote:
> Current QAPI 'migrate' command design (for initiating a migration
> stream) contains information regarding different migrate transport mechanism
> (tcp / unix / exec), dest-host IP address, and binding port number in form of
> a string. Thus the design does seem to have some design issues. Some of the
> issues, stated below are:
>
> 1. Use of string URIs is a data encoding scheme within a data encoding scheme.
>     QEMU code should directly be able to work with the results from QAPI,
>     without resorting to do a second level of parsing (eg. socket_parse()).
> 2. For features / parameters related to migration, the migration tunables needs
>     to be defined and updated upfront. For example, 'migrate-set-capability'
>     and 'migrate-set-parameter' is required to enable multifd capability and
>     multifd-number of channels respectively. Instead, 'Multifd-channels' can
>     directly be represented as a single additional parameter to 'migrate'
>     QAPI. 'migrate-set-capability' and 'migrate-set-parameter' commands could
>     be used for runtime tunables that need setting after migration has already
>     started.
>
> The current patchset focuses on solving the first problem of multi-level
> encoding of URIs. The patch defines 'migrate' command as a QAPI discriminated
> union for the various transport backends (like socket, exec and rdma), and on
> basis of transport backends, different migration parameters are defined.
>
> (uri) string -->  (channel) Channel-type
>                              Transport-type
>                              Migration parameters based on transport type

I hope all of you had nice a lovely christmas :) and wish you all a 
beautiful new year!!

Just a gentle reminder for patch review.
This patchset series focuses on the idea of modifying qemu 'migration' 
QAPI syntax into a well defined data structure.
Hoping for suggestions and active discussions on the patchset series 
from all the maintainers.


Regards,
Het Gala

