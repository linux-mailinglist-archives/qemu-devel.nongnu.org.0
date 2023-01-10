Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974A5663A1E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:44:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9Iv-00045F-8T; Tue, 10 Jan 2023 02:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pF9Ir-000457-Ho
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:44:13 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pF9Ip-0001v8-OH
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:44:13 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30A6PbbV023032; Mon, 9 Jan 2023 23:44:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=oLsMt/Q3o4TGo5MrH4ayq2S9ElqTY8/Q85tEvCVFX/g=;
 b=WTnLAnrLACtetx4zkxDJAxNA46XAMEJTV3JYU0jDSf4cFG/hLKVI54kBuORfBFS+gF8l
 WaNE+7YIQ3UmZVWL1EPiLvMnJDKNOCsKyiuGLhiVSvk0CxcqPDE79Hxh+t10eu32Or1S
 H+7XCq/Rloe3aZIhoUZjndFsf19hlOruUN/2deEmYJab0tmMGGYjsJraHh2eNPoDpGg3
 nB6O74Phi8JzER6KyiH1YFDFlwkbRk11cv8sM/AHJQt5t0xlKLHf7EZqIWNijpR7x2tY
 Z52XE4I3HTQE7AomRBHdtSBZlPfCcyOtw8Hev48/kfrVO+vBO8NcqjB1AchvGXqL5IV2 /A== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3my75em5hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 23:44:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPdRxU7zXBmvcTEynsdde/TSeqbIThY3PCVIIo5mwl2WiU0SLCD3X6X5GkHyp3r6hL5gLqmgSZh+cr69hWOhKfoBxB6RBm29kt1ocT5mv0yLOwX0mp0UtATWyWJvz5HB1YIl6lW7xRSHHt5kHzUllTyDQ5r39aIBxedoGzn0Y3QwR0BkZF2S5/jZ5/SF9SJeSdBG9txS7LTz0VF3OzePZyrBzDIXb16bz0iMhWfGec+e7oiTYME1Qgvz1ehtyz+j+6PzFEtHc3mgaqCeT55OO7rmtX9XrFOYhi75PBCw7RJy3AOww7Q6V1kPZWL6cGxtHoMaOHlCkUBthzyFo6c+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLsMt/Q3o4TGo5MrH4ayq2S9ElqTY8/Q85tEvCVFX/g=;
 b=nJpyz2k5XGBzqF8bdFzNTdEg2hOGvDpE2eeie6fzIE+zSsCjtl8qS89KTvMv5qRpdDWjGu5z327UvZ1WqGsBnSXvbJx7djwOQ5k2l+lBDjFf1Ext5BsrnWu0/XfybvJczBpHzZ79H+BFn4TdPmutbMPbDsunEtGOx1+sVlor5FEDboUfyCt1mk1Fqt5JdMdFwzdtzE4xO6oIGLQHzTNIMt8xclvLJOgqXZPURkxQI6wCjs6DwAq2/hgI26e7K8kzrawct+Ui/LY+t6ckj9P8TO/v9OSP8Cj570J0Pb6zxJQp5nVcVSfmUJTiWfD2FjuUrdj9RNSc2Xtpa8zIjxb//w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLsMt/Q3o4TGo5MrH4ayq2S9ElqTY8/Q85tEvCVFX/g=;
 b=AeOstPR71hWjdOF3vWG9bkFWLvXIElUjpC0XL1vbnXmbZB0rQ010TbMdeYNuQ8dtGsf3ebJyJMpk45p3CkrPcdxGNygYWaB74fW9hkdCgEdWr2EHE2c/FtRkzDkVzgT1dvKG69BHMTJ7Ke9cL9bVWy/DT+ArPK0T0U2oRuyuLFpVc/mBJ7JtbbRuTcnva7uOQAyARDWy+pjhqtuZ7DCMMCrJs4xoJxPLTN/ML05ZV9pAsE2x1A6sXA8WdIpr5bFC2lZtdIjptcFkCGMPxAeRWHX3d8Bdu+kIhS3/nk6MDvMubCKi0M1zKmDtx4Wtw5FyEnrrEEd0vyYg9zvLewEMEg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH0PR02MB7414.namprd02.prod.outlook.com (2603:10b6:510:1f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 07:44:06 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 07:44:05 +0000
Message-ID: <5b4473b1-0dda-4d46-9bc0-7c705f599cfb@nutanix.com>
Date: Tue, 10 Jan 2023 13:13:53 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/5] migration: Avoid multiple parsing of uri in migration
 code flow
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-4-het.gala@nutanix.com> <Y7whO59PHwUCSaRx@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y7whO59PHwUCSaRx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::20) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|PH0PR02MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dfcc401-a7f0-4373-51ba-08daf2de72f7
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fOstYAVPPqa1uP8yPcZRxF6RKcqCLFsbtuPAB/I7RyrsvPBYyGA/TeWXBRczxR/+7Y5/mKzeNIJFTX4EPqJFBHznZ1C+M8Pweh7R8XIW4tPMhPtJ+lgV8kMtHJNUwIkezCIHtwlXMYLgI7McCc4QqrmSlN4/wJ2oqSktgiFd0+eq2JS0z5UnabLt5fhMDh10SL2ZGYb/rYqjoqPGbDzyLzytGTPPbVcOj1qSZlGTv7mi9HPWQBfEukWyjzIQu7pkIfUBczfYpFqiJkqw183SJJN8Ae6D5UvhvmRHo5Q8hYxhS465xorjZmbnH9q6/D5YvK2xLoqrU7flpFRqNYDrrDucgUlom9fP9OTqJYJiqpJFgJ1bVBMjjK4N97MC9QtEbPLgUlB2M0LiZkpoxAGyNyXn9Lvxapfk7HbAfN7exB3VTGkC5meXvf/M357zNFYz8Zs7UeNEP+Ug5njSxBQY/j9yQiJsvlRegsiQOOMViwrCCUKxXyVt/eLLOPJbk3bg2K7qUW0ikcrrmchoREHewmU7p0RyyLXytAueYZ1d0ACurZNN2myFnW4+7mhpA3YEdM81or76Iqt3X+P/m2jfsPJsXc5ztlHqJcea1GB9sjsYaW6lUxGwCag2DyCdoGbWYhY+/XlGQf8W1TJnKyhADHrt0HyfXaqTFAyKb1D8+IPorcKhBpw6kC0feBawqkMkB+eVysXI6PtjP7q3+n56xGjKp2SM/NPniLJXXaNZBQNphWtxwTaiOw3zdmVeDBMljiBQJW2NsPez82jZmJqsYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(6506007)(38350700002)(38100700002)(53546011)(31686004)(6666004)(107886003)(2906002)(478600001)(6486002)(2616005)(26005)(52116002)(6512007)(186003)(44832011)(5660300002)(316002)(8936002)(36756003)(86362001)(41300700001)(31696002)(8676002)(54906003)(66946007)(6916009)(66556008)(66476007)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emFDY3F2Ym8wSldwb2xtdGRpSnlHNUo0VmtCN3IyUHNQSjBvUU1hNTQrS3l0?=
 =?utf-8?B?ZEdqTVBuaXMrQ2ovaXRrZExWV3A2V2V6eC9mSUxzY1p0a0dPS2FQcm42aWRL?=
 =?utf-8?B?YTBwSTZNUVB4dmx2ckJINkcyVC9yS0RuUi90RGNCV3U3OXB6R0FlWEoybVNJ?=
 =?utf-8?B?SUJtV253dGZLMlVPY3RXZ0N5T1krZ0JRZG1rUGEyckZlakowNEJIVUxuK2Fp?=
 =?utf-8?B?TXN1ekp3QUpBc0hCYmM0N2lwNXgzRnk3ckxXajErVlMwL3RBcEl5OFlORUZR?=
 =?utf-8?B?aWZCUXYyQ0dmVjdEakNxU2JJSTdhbnAwSnlNYkFQaHRpY050N1FhM0dZQzlV?=
 =?utf-8?B?QVVrM0tRaTNnZ1E4RWlYdGdOZE5TaEFEcExCYmFQVnk1bHVrY0RTUWcvVG85?=
 =?utf-8?B?amN0QkFIS3pzOFdoTk82eG1tUUR1eUd5S21NK2d4Yk9yWHNqeEcwME8rQjQ1?=
 =?utf-8?B?ZG04SGZxSlBrV3ZCM0hlUVYyVGNrcWJKTVFmZXFHYVVaSXlhUndzRkRUNFlV?=
 =?utf-8?B?dUlHcnpzemVYRE85VTIrb2NqSE1mWXlzS2ZDTjlNeGtuR3JhTUExMTc1Z1pL?=
 =?utf-8?B?Zm92NTAxTzY0c3BsMFRDdXh1bjRsdXZadDgxUVZPSWVYOGFvZWFqNVA5cmF4?=
 =?utf-8?B?U0RVNjBVbm1IOTFUMUlnWUM1VElFdDNtZ1pGbkNVZWpRajZsSWVsN1QxVklW?=
 =?utf-8?B?clk1a1A3cFRqY3d6MXhtZ0Rjc21jM3djTDB4N0VVSHFoMUgxNkZIUVV6dkVW?=
 =?utf-8?B?YS9vWnZjZXViS05pQitSMk5oQy9RMlZSQUpUbU1vVmpRcE9xUFJIdHVWYVMw?=
 =?utf-8?B?NlRFcC9YdmhEd3IraWxUQXJ1S2lQbHpUVWczWXo2eVczcDkvckJ2Y3ZTcWtm?=
 =?utf-8?B?czlGVlhWTzRsaS9IMmdBWk1xK1MwSXNJL3hUSDdILzRrcjM2RGt2RGIwOFpv?=
 =?utf-8?B?bm9ERVpUU1NzT2hqaW5oSTZZL2JVY29CaEc5MDE2ZEpJelNPdzNPVzZwaXlP?=
 =?utf-8?B?LzdUc1hBN0ZRUGRqWGllOHk2QUV0M0ZUMnlXZjkzRW1iL2F6WVAvcUEzRG5l?=
 =?utf-8?B?QXJicXkwWXRTWkJJUFJOTDEwSWkvdmVjNjIzVWgyMGQ3dmhwc05EcHVmOEFz?=
 =?utf-8?B?QWxRMm41aE9LVmJSdHNnSko0dXgvS29qT2k0QS9nTEpoUkRWeHhKSXAxelJO?=
 =?utf-8?B?Q1NRdjRqa21kbndVeGNJVG1xN2dNNE5aWGo3VVUyWkxvajdMVWZCekJqR2Fj?=
 =?utf-8?B?OVRiUjRaeXp2UWhESlBDc1ZGdU1sdzZvb2FzbUNpNXlScmlhMm5pdk9FdXNL?=
 =?utf-8?B?bzMwaFcyS2xVV2RvWWRuMVlQZzJSYkNDTjRxTmNFdENLMDBCTWgzNEh5aHJk?=
 =?utf-8?B?Vlp4eENIekVrTS9jSkw0NytYVFJTa09BKzBhV1NVeTBlQ203ZEtsMDdTRnJs?=
 =?utf-8?B?cG9IUUFpY2JnUEcvVnl1R3VXR21uNFlKeUF5bllzcGlkTjlILzkyL2JQU1l1?=
 =?utf-8?B?dGlIeTExQ2RSaUl2MlhOcU5NVzBvV0NQUU5VMkREZ1llRjdMb2JLZmowbG5j?=
 =?utf-8?B?UlFMT3dHaWxlM1plK1RVMDdmTXpLUDlNTHlZTEFydjFucStKcUtRcFZxS1Nz?=
 =?utf-8?B?RDlCSll1YmtZY0ZQdEo3blZCQmVQMmRJalY3ZDZiMmdPWEtBNTFCS0QxNGU2?=
 =?utf-8?B?d3RlZVhJeXZVY2pUQ3U3dktKVEtqWDVmQW8xcGhBWU9qeEhSek02UUFVU3dQ?=
 =?utf-8?B?RzgrZzdDNzNobFlXbWRqTE1QMGJLQ3NUaS9FTkt3ZnU4OFRjWVEyVUs0TzJD?=
 =?utf-8?B?WXFJb1F2a28vZ1llOUtOaFlZKzhjWkl5RE1oaFAxcVFTOVBVdjllZVNBMGFS?=
 =?utf-8?B?ZEpHRXdZQmkzRnhwZTQ3MjhaMnNlQ0JlK3diTy9CbFRIVXJoOWVVVWc5Q2VI?=
 =?utf-8?B?WE9VNXRONlVaVDFSQ0h5Q0xiUzdRZVZPUXg0RGc1Q1JGMy9EMThoZFRqMTdr?=
 =?utf-8?B?S0NLZjhJU0EyN2J4b2hkSUN2OXRLQUpqNTBTV3k2aHduTG5ZYVF4VFNpdktX?=
 =?utf-8?B?cWYxRlpiak9SMVZ1WVFlUHZXbHRIajhXVE54aFNtWEhqQ0FydUJTRWs1ZDNL?=
 =?utf-8?B?T3lSOFAzSDlCNFhLME5Ld0h3T0pHTlBLRTFwQmoyajJQUzVRZzlPRGdXZ2hq?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfcc401-a7f0-4373-51ba-08daf2de72f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 07:44:05.5881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGsG+xVV+zudoCmHbWwojZ+kidBJV2DXkn5xzA/QTYeLf2F2AKA5CmOiBICM3C5FUl2ZnLaeMMExHdxSyvSGlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7414
X-Proofpoint-ORIG-GUID: MD-gyu8zixzA302rEQwck7JSQpXhv4Je
X-Proofpoint-GUID: MD-gyu8zixzA302rEQwck7JSQpXhv4Je
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_02,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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


On 09/01/23 7:44 pm, Daniel P. Berrangé wrote:
> On Mon, Dec 26, 2022 at 05:33:27AM +0000, Het Gala wrote:
>> From: Author Het Gala <het.gala@nutanix.com>
>>
>> Existing uri is encoded at multiple levels to extract the relevant
>> migration information.
>>
>> The modified QAPI design maps migration parameters into MigrateChannel
>> struct before, thus avoiding double-level uri encoding.
>>
>> socket_outgoing_migration() has been depricated as It's only purpose was
>> uri parsing.
>> Renamed socket_outgoing_migration_internal() as socket_outgoing_migration().
>> qemu_uri_parsing() has been introduced to parse uri string (backward
>> compatibility) and populate the MigrateChannel struct parameters. Note that
>> the function will no longer be needed once the 'uri' parameter is depricated.
>>
>>   
>>   
>> @@ -486,6 +487,39 @@ void migrate_add_address(SocketAddress *address)
>>                         QAPI_CLONE(SocketAddress, address));
>>   }
>>   
>> +static void qemu_uri_parsing(const char *uri,
>> +                             MigrateChannel **channel,
>> +                             Error **errp)
> Coding style would prefer 'bool' instad of 'void'...
>
> Also lets call this 'migrate_uri_parse'
Sure, Ack. Will change it in the upcoming patch.
>> +    if (strstart(uri, "exec:", &p)) {
>> +        addrs->transport = MIGRATE_TRANSPORT_EXEC;
>> +        addrs->u.exec.exec_str = g_strdup(p + strlen("exec:"));
>> +    } else if (strstart(uri, "rdma:", NULL)) {
>> +        addrs->transport = MIGRATE_TRANSPORT_RDMA;
>> +        addrs->u.rdma.rdma_str = g_strdup(p + strlen("rdma:"));
>> +    } else if (strstart(uri, "tcp:", NULL) ||
>> +                strstart(uri, "unix:", NULL) ||
>> +                strstart(uri, "vsock:", NULL) ||
>> +                strstart(uri, "fd:", NULL)) {
>> +        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
>> +        saddr = socket_parse(uri, &local_err);
>> +        addrs->u.socket.socket_type = saddr;
>> +    }
>> +    val->channeltype = MIGRATE_CHANNEL_TYPE_MAIN;
>> +    val->addr = addrs;
>> +    *channel = val;
>> +
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>       ...   'return false';
>> +    }
>    ...  'return true;'
Ack.
>> +}
>> +
>>   static void qemu_start_incoming_migration(const char *uri, Error **errp)
>>   {
>>       const char *p = NULL;
>> @@ -2397,7 +2431,8 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
>>   {
>>       Error *local_err = NULL;
>>       MigrationState *s = migrate_get_current();
>> -    const char *p = NULL;
>> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
>> +    SocketAddress *saddr = g_new0(SocketAddress, 1);
>>   
>>       if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>>                            has_resume && resume, errp)) {
>> @@ -2411,20 +2446,35 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
>>           }
>>       }
>>   
>> +    /*
>> +     * motive here is just to have checks and convert uri into
>> +     * socketaddress struct
>> +     */
>> +    if (uri && channel) {
>> +        error_setg(errp, "uri and channels options should be"
>> +                          "mutually exclusive");
> Needs a 'return' statement after reporting the error. ALso, this
> check should be moved to the earlier patch that introduced the
> 'channel' field.
Okay sure. Will introduce the check in 2nd patch itself.
>> +    } else if (uri) {
>> +        qemu_uri_parsing(uri, &channel, &local_err);
> Needs to 'return' on error, eg
>
>    } else if (uri && !qemu_uri_parsing(...))
>        return;
Ack.
> With regards,
> Daniel
Regards,
Het Gala

