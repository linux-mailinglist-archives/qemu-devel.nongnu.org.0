Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182413ADA67
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 16:34:31 +0200 (CEST)
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luc3J-0002s3-KV
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 10:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luc2P-00023l-Gi; Sat, 19 Jun 2021 10:33:34 -0400
Received: from mail-eopbgr60107.outbound.protection.outlook.com
 ([40.107.6.107]:4227 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luc2M-0006Kt-Jx; Sat, 19 Jun 2021 10:33:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rtoyp+vUeVm00ewWrt6ztZTfs9xjj4KnfUuymt71mlyOR0PDuMJVPk5xWaMq3a71zTyqGYnVTbuQUgjidxTl4iBWGZLDQCFGE0OIAYeQCfwYTY0F7iP2XNJe5xXYuvAeqmaNOgvxd5G2KNey2VSBD9LF1D9fcgDIhBTe1aHo77Xnmiz5z9+564p6zpnkgq4fiOHhIF3nGRw6K671yDeN0spTKzs4PSsVzSqb/K9DgedXivusmMXcQC11AaGxWk0R35sqoaO7QrRTOMs+UOusEQf0NE/avXA5tfyjdJwplacYb2MwmohoHT8PCKEDI7nBI1uI7SSTS6ZK2uvVugSXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKRwnYuiAKMH6p5G3sDcOqwQeV45QCrxqVHr8cbemag=;
 b=jS3LAT0d3anSnDZ3Goa70o4tgyX2NNpslNtLHmgImYFLD9CIsd+1okdl2UWQPwYZoW6GKVCM40vUgACLcWf85TbHphgNILJFuaQQoEXTjEDkeF/95mywhcHsmdVGL4OTT3edi7ehfltyHyAXSzXDJTJ2hpLR6twAWf6X9jp6l9PWXjryDxY+YzHR1Wr7/OXKJF604S1diWHbUVW5aGW2nbBbNc/2gE2tnqD+/N4cNzE8RrgejlAVKOtv8tM1DEvAkuePUwq5Ahfeim/PafiIT0OBlt1y3afa9slo/8Rz/+qbnkmfFd23JyUCRXUeN6uqOsAmcghr8tQfnsjEHURBpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKRwnYuiAKMH6p5G3sDcOqwQeV45QCrxqVHr8cbemag=;
 b=izriJywDQPl+oJOod6rcnvFIqV1sey91tAkdAw9UvazNsLOXpsFIHdtNxh/A2L6kDxIv0uBORdJGQg/N0XyAsKdnHqKD+fHcCyX1vJRZvRmlPoaUHmOmIwThJrQG2371ZOwioTrCLe7wtcEQ8L2TF0E3hWhMyxAcLNsQSZWAZuo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6726.eurprd08.prod.outlook.com (2603:10a6:20b:39a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 14:33:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 14:33:26 +0000
Subject: Re: [PATCH v4 1/6] block-copy: small refactor in
 block_copy_task_entry and block_copy_common
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-2-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0d060544-a6c3-a547-86ac-38f9d7093f51@virtuozzo.com>
Date: Sat, 19 Jun 2021 17:33:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614073350.17048-2-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0102CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0102CA0062.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend
 Transport; Sat, 19 Jun 2021 14:33:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8685f0b-8c4d-4d4c-edc0-08d9332f32dc
X-MS-TrafficTypeDiagnostic: AS8PR08MB6726:
X-Microsoft-Antispam-PRVS: <AS8PR08MB672600E47956C3D727C0B80FC10C9@AS8PR08MB6726.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BvTwZQNooIiCh5GapSQjEZd1/v30sdQOI+BBA+73s1xMz9GOzNrEO9MpiS8T1huYOd03K4epEivYJvPoeLgeos7MNE7fyHpDwztL5fsjh2ZsVNt5aVHmjGDlRfBoAe7wtiVnc5ffFVSw9oMNvFaqwN4k9AW17TM0bxy6qUONkdTYohzyebkE0VkwMA38RxSOZP7PmE2IlkKRvEDAQgBqsPzPfHqZeMCMNirBkT0dwxXuRnGPXwGn5pQCD8lVnk9i82KKb4sJlx5Loic6HhHuZ2GZXwJWHlXhbkZJePMvHn58P/HP845iN5Jm+tKLqmjl9zZnyQwvXtMCaf2IHeOKI4zxSFyrxGT2+k9ov7mcOaPciyLIcVqGElncO/aduSsacbj84SQmmThkBeqseVEzPGrSYSciusRusN6xfxVX5D4JtNPbdo66cyTA1kKKWH4rXbhwtcrj0uXQtbviX+FCb1HZH/f0O60Fa/6P8pl5beBk6EsboB4u1UdF0vZza/rFgovLpGyjHPKjih7AvGHwmCBhnfSP1fswLNMaeTPG1nVF8eJBzVGipNaJpHXJfb9IfcFVtVXOThlSxlIC5FUOERzk+143Q9LnbcKmkh8F4gS2w4CpuyRUWUPczHbWJD0UH4hp+1WpivV/pu4S6/qZ/VQVtLVSup56XzkI0kFILkuj6E/vHwF5mj/Kpk+v1Cy5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(136003)(376002)(366004)(36756003)(54906003)(4744005)(5660300002)(8676002)(31686004)(6486002)(2616005)(2906002)(8936002)(16576012)(956004)(38100700002)(31696002)(4326008)(38350700002)(86362001)(66556008)(52116002)(16526019)(66946007)(66476007)(316002)(83380400001)(26005)(478600001)(186003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enR4dFRhR0h3dGc3M3NBNGVyNDgyRlFVRWVSRUdSSFVRaC9pcjVIeFp1VDNz?=
 =?utf-8?B?R2J4Q2E5d3Yvd2FkekZaemdIQkoxNEc4SkV3eXcyaDBNQmN5T2ZWaTNTYUhR?=
 =?utf-8?B?cG41ei92bkFwUktXVll3Y08vVEVWWUZzbzdUNWtpKzJLMnNrQzg5T3UwMkM5?=
 =?utf-8?B?OTdWaFlhbUJLTGl4TW9oZ3dicDdUUldjcjcvZFE0VVR6ODZGTFBCM09xNlhN?=
 =?utf-8?B?LyszTElPS2pIQzVzYVFkNEErM3hxd3RucjVBRVJzQzBPNXBSYWlNTVdXWXA1?=
 =?utf-8?B?TlBCZmVTajBCMGhpWXJ6WjhUQU8rbXEvTDZlakgxckpKV1VHZ2VtVS9HNFRN?=
 =?utf-8?B?aGZhZk8xSkU0U1FQTDdleDkvRDR3ZzlFTXliNnI2ejc1YlZGZ3lOOEQ4MVZI?=
 =?utf-8?B?SGRIQXBSMXhTakh0SXExRzlMWGZudHovdzBYVjYvUGkrZVJ0N2dVeVlpNHNy?=
 =?utf-8?B?MVdzUSswcnJFRExFcm1TWCtBL0dCSDRCeHlWa1JWY25ocFg5bFRYTVJOSEFh?=
 =?utf-8?B?WkF5ZzkyM0JreVBVb0JZdy9aVXo5a0tXM0tQcjVocnpIa1ZSQ3o1Q3RhUWpx?=
 =?utf-8?B?dExMYUcwckZnT2JaMkpMc2lLMURrTU9EbTU3eUJOU0txRDhCOVl3VWYwZ1Jj?=
 =?utf-8?B?RUx1TGZxWTlPQjVWOXNOM2F1cEQvLzNQVEQ4WDhCTkVEaXQyV0pCZGpQNWUx?=
 =?utf-8?B?N3duTzBPZS9URGdPL0NKWEpCY3E1Qk1qU2o4OE1SbGc1MW5tN0xaRndpc1ZI?=
 =?utf-8?B?QUo1WnpmcjF0K1g3MmdBT2l6Y2Z3Z2pXU3FQVkszYk5LR0p4RUVKa1NFbitJ?=
 =?utf-8?B?Uys4SjJHdkFiZ3FhNjNhVC9OUi82Zk44Uyt1a2ZuYVQ4cEN6YSsyQS95SDhp?=
 =?utf-8?B?OE1hZG1QYmtQQlZNLzkxSTR1eVVzMnlCQ01OQm9neENHamZOTUYvbXI1T1hm?=
 =?utf-8?B?emlFRmZFdzl3WTNIKzBuZ09TSzArbnFlc1QrYVNtUTliVkJkN0M2WkdUV1lE?=
 =?utf-8?B?OHVSNXdMN3VQYkIwaVBmRkkyaERWZHlpNTRFeHJobFdycFBVRkJlYnZNQjdS?=
 =?utf-8?B?QTFpVkNhUXdncjVZMXRFNzlPMC96bWxzV2lNUlYxQklxZ0I0SHNjWmtQRTV0?=
 =?utf-8?B?YVdMSlplRHhwM0lsRGlCd3htN1BqUkNWZEYwSHJ0UkdvZEN6STdkRks5NkJ1?=
 =?utf-8?B?TWtuTkZxVC9VRERXZk5wTzBRV3ZiMDM4UytJYno1bU9RR1pXUHhpalZ5ajJV?=
 =?utf-8?B?WStXMUVOQjRIY2RzTzR0TWx0NzBHbnNXdmh0UTZ2aU5tRWZEMmN1YndMMFN2?=
 =?utf-8?B?ZFBBVWRDQ21Xb2d0NS9mSUxHbW1zRys5SEFYTVNNdm9adnlPaWRFL0o0b051?=
 =?utf-8?B?NC9vTi8yaVR6ekVxeFZ5T0hWZ1hrYjJ5ZHhKR2kyUU5EZDRwWVpqLzNTNG9S?=
 =?utf-8?B?djYxZTRnR09vRWdvQXRBYUZ2eVVxRk5Ba2ZrVzBCbjlxSkl2ME92WWxFejM5?=
 =?utf-8?B?R0U4TkVWS2VTWi8xZDlUTldvRjYwNlpaZ1ZMNTFSSEtDekF5ZkpiNEdhMkFY?=
 =?utf-8?B?MkFTWUZYdFAyK3hPcWlzRlptZExQNzlwVEZVY3FqY0NLeVJLcVdWVmR3Zy9S?=
 =?utf-8?B?TXVMS3pvaWxzMTNPV1ZPSjJIeXJ3SVdLUkhpN2Q3ei85aDRKVnh6Nkx4d01U?=
 =?utf-8?B?QUs0WGErc0FTeEd6dlFaVGtNSkJuVUtYV2xEZDhscXJ1QWl0TWgveWFFSDZL?=
 =?utf-8?Q?WgCpgdWnpJZwwfhD+pqUltLRHfCUJ3UZBjJoPOh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8685f0b-8c4d-4d4c-edc0-08d9332f32dc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 14:33:26.1983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8qEz2F0PGj9SCE+bcbBBACuA5G5wvlRwS7AZQtAo3Vw8ITPuiYAvC1EtfEAd1/Ph2xQw279yPr0AkZ2Pcafq34npiBHEiKSKtwsBZZyYSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6726
Received-SPF: pass client-ip=40.107.6.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
> Use a local variable instead of referencing BlockCopyState through a
> BlockCopyCallState or BlockCopyTask every time.
> This is in preparation for next patches.
> 
> No functional change intended.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

