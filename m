Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB11A3AD929
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:51:58 +0200 (CEST)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXdt-0005eY-Ga
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luXRG-00060O-RC; Sat, 19 Jun 2021 05:38:55 -0400
Received: from mail-eopbgr80135.outbound.protection.outlook.com
 ([40.107.8.135]:8454 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luXRD-0004kl-8I; Sat, 19 Jun 2021 05:38:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoiIoQcs9gQ/8OEpfP/H3yjndpvIomkqu8liqkulVETDv7PzZ+1Vnsn/sU9ns/WY9nLoL6C9fiSjjsIh2Ttt227OI7iN7LZoD9GdYYLV00kqn0XseX+rSo558x1QorrgnSZezB2BEtu1/inf7bXnVN1DPeqEDksLXIzHBoApvdnIK2ZHn76E7IBdK1t5QkzWq6AU8VfIngRG7+3NH9vkr+UGBvxjdAivSacsfZ45b52iaWcoomPbmVGGwq8JcjMsqgejVPbFcM+8R/9ib35tJLnLvkN1roXCTnYSfXtKpdAots5hV+9Wu0KUjgu29q7fz2jWSGfriqhYB3W72v8YLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w+3EYQ4shcShrcziiAji/797xJJgVFx6X51z3hNbfA=;
 b=VWAhaOpR+LwqwYDI5Jfo1ZPqQOz750ldE0VfDgR3/hJNM9ea/+bQqlREwYXbBa+9aVqjTkGJDV1Yi1vyIacSkTbMa2BqzYU+nEbQhywg9GmHkw1d+vBQaDU9w9z4E5k67WhmQ0yuBc4LKYEBe0v2oK+Ue6ei3mOhzqDSXh9DM9UwVsAo8qOi3gYaylfCtBQLr0cCZ7TlHAwpdX0MMlpBuLoCdCvhuP+DHFxxYIN11fqg/sPLxl2hGolUoBca6yaUMSFO3lh3F7YYB8A9z0gSlav1likxmh6eNmS78p2R1H3LiMm7LeLq8F0u2j/yxPpkxOuGwPhLnFWLe9csDYUIsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w+3EYQ4shcShrcziiAji/797xJJgVFx6X51z3hNbfA=;
 b=BqIbM+6jT2CmHG0kFoWb3US5t6OHs1gOS+X0xf+FA4ZrJ+Veo6qjy+1RuXMDHvMu2X7iIOXG/Y82nPN6lKyjypkNZ1HVDV071qbRUUm5eFY1RvzxFNrbrtv0LkTIjNMkflsERnH25LexUiFCBzczuh3xUSku4PyQFVVmj5DBoJA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3959.eurprd08.prod.outlook.com (2603:10a6:20b:aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 09:38:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.022; Sat, 19 Jun 2021
 09:38:46 +0000
Subject: Re: [PATCH 1/6] block: Drop BDS comment regarding bdrv_append()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c2cead3c-8940-e508-21af-4480056f6a5f@virtuozzo.com>
Date: Sat, 19 Jun 2021 12:38:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617155247.442150-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0701CA0050.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0701CA0050.eurprd07.prod.outlook.com (2603:10a6:3:9e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Sat, 19 Jun 2021 09:38:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df2443f2-2e45-404d-3063-08d9330608c0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3959:
X-Microsoft-Antispam-PRVS: <AM6PR08MB39597CF5F03AC858309D3D30C10C9@AM6PR08MB3959.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPkmsbFC2a4+pH1v3jyE8QyCur21Tg25nWdA3YNvYnO81iOi69oOcoRlD2+LyvhvPJpvU9vgtdZm4kzrz1E+wcPRue28u7ldzYz+ol6bi01oILI104InSUfgilJo+rLHmxsWJ8KUZNWwJDVcEp1NaIRqNsHoCMR/Taz+k1vdY4wr0rbNV5tGn92ZE/IRAB4gvd27GHa3vG97EsZ7N559m7aO8qNsic1LI8dY1WTMFID//3EEMhWrzdYf8RdtqWfXR42S/XSsfwAx4A/m6uL0M/dUFo/9JRLgEU47nwScU0xsHxTjxiSffyuEeGcPMGCR9InkoUoPwHv3uOwvzlprGkhCAY/tI2xWdJ7BdhpZBn0OZOmBfpQrgYpWzc8a24P/bfwKqrRsZf4e/XucZ3m0SeWd5LhMSC/ixALl7nu3cawY3R5dOHHKdqnTbZ7HsLWzDZV7y9DIb5wK0hsf2cFqfTMmbzpSSpemxgYf6b9gzVM4FsQuh4015F9Sc4/j86Za21jBmLPPUZGKfi1l4+ufqm27E2aEdgllsZ2AErCIaLvpl4n+9mpyXZO5/0E70VkFwtYj7a/fLrMKPJcskfPzQ0KtwnsDNUkr3EtbjMjt5nkO4WEg5QYgO+YHIyuvGJhb7LGNV/IR5F4VgE+QKtFsQktBwvZ4BST9AJ3voKeCdGLkGI1zgp93+JdX4GjvWFnxjoSObH2ko63WzfEG0bUXvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(346002)(366004)(136003)(376002)(86362001)(2906002)(8936002)(66476007)(66556008)(316002)(956004)(2616005)(16576012)(66946007)(5660300002)(4744005)(8676002)(31696002)(36756003)(38350700002)(186003)(6486002)(26005)(16526019)(4326008)(478600001)(52116002)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWcycFdFOVFzWE02NWVGWll0M0hoZ05lYXdqUTJ6bEtNcTlpKzlnYW1sRzRu?=
 =?utf-8?B?a2pLT1dvalkxbEt6RHJGNWRydlpCVXlWTHJWSVphSERaaDNqNjgzVHBzVk1V?=
 =?utf-8?B?T0VTSlgvQ0dVdTg2RDAzenhLYlgzeFhncmxNYzVWZEl0WGwyMkRDbHlEc3Nj?=
 =?utf-8?B?VUoyM25QbndLSTIydDZiQkpCSjErbFgrVmZrS25kZ2VxMWtJWXdaMEtLVnpt?=
 =?utf-8?B?YkNPRm1JZVBQQ25IeWRyLzFORGxBVU5HU1ZCeWoxRHp5d3dWMmozeUtSVG5r?=
 =?utf-8?B?Q2FiOUhqaGpidm1OdGlhY3BueXRJcDRUZlgvdTQ0QUVNb3U3T1R3OSt2UUg0?=
 =?utf-8?B?d2V3TkY3Q1ViR3J1R2o1aC9uYmRxRnl4bDVrRUNCdGR5THZxT2pHc0FIOXFG?=
 =?utf-8?B?bGdFY3NQLzBMbGFJTWJxU2tRM2V2WC8yNlFMRmQ5NVJtRThoVXE4dTNzdDhH?=
 =?utf-8?B?TmhNVGxTY05UUUVEd1k3V2NtYXFiczN0TU5FTTY1YjNTZ1lwNmZEbjVtcGV5?=
 =?utf-8?B?S050QUtXVEdMK1poakd6anVQVmc3K1NZOXUvZ0JxNnNUQWlTcUNpNXJLcUg1?=
 =?utf-8?B?T3AxWEhLV0tSdHFqU0hUL2QwRFBmOFQrbXVYUiszMUtSYUdhYXN2NXZvaitw?=
 =?utf-8?B?emFnNkdWbjk3dzVUN0tvQ0pKRlZYWlc5NS90YmFjdHpNZmZTemRyMXJ0dUlJ?=
 =?utf-8?B?akxsbEVITjQ5WFgyeFpJVm1mRlNzaC8xdi9TNXNJT3YwK01DUFdGL3FHSmlJ?=
 =?utf-8?B?WDFPeEZkb2kvSlFCTGNkYTZPSXZJaVIyQlZUbENhenRzZ1p6NUN2SWtxYnBI?=
 =?utf-8?B?amgrd3RORGo3R1dtaWtXekh6K29BTkhHNW1XbGZHMU5VTEJLdlBEekxjTEtT?=
 =?utf-8?B?Y2x2RENHVG5ZcVhMVmltRXhiZjRNQ2gzRXVqN3B3NDIzeGVvN2x0WnVzbHVN?=
 =?utf-8?B?Z0I4QlRwZVg5UUF6ZHZ1eDVLL1M5VUNneEpKbjBhMmdFdEc1djJHZDFKR2Z4?=
 =?utf-8?B?WXRhV2R4cVlWUkFZZDhYclJCK1dKVitFcjI4MCtpTzBxdHZtb2dpOUorVHcr?=
 =?utf-8?B?Z2JvZ0VacEdQcUkyU0xDL2NsM1IvQnN6YUlxR0QrZjlyeDQxaTZnRnNJRnF1?=
 =?utf-8?B?L2x0Z0hZY2FKRHVyWFVmMWlZWmdJcyttY3R0WGV6VnI1emRXajJXaVN3aThN?=
 =?utf-8?B?U3NjMWlYNm9CVnRzY0ZIWEt4QUJmVldsR21OcCtUaFdIVDY3eUZDSWl1bmoz?=
 =?utf-8?B?VnoyaXFGRDhwdFlLVEFFYU04WWVnMjlNVHpQQWlJNlpGc09rZE00TEFxVVlo?=
 =?utf-8?B?RUtwOUxldjFHdDQyazZlZ05RQWpUa3U4VmtDR3lSNFpDZXNvbDFWRnB1bWNM?=
 =?utf-8?B?d1FXUXdWNTZFaDlrZ2hRT2JiL3FVV0V0b0RORXRUVmh0VUZjZjd4UWlhQk1s?=
 =?utf-8?B?WGNwVXd1Y3RNOXNYTTZ0SXdlckxrNXNqbW1GT2ZzVWF3L3BBMmViREpzbXUr?=
 =?utf-8?B?cEtEUVAwaS96bEhOY29ZYzFtcG9vTk1DL0ZDK3VadVN6eHNrdkJRMWtkbXRh?=
 =?utf-8?B?a3NvcmFDR2ZyN04waml1NklJTGh0U3RTemJtQ09OMVdCblpuTWtUZ1YyWm5l?=
 =?utf-8?B?MUNnbnp5N2JHdnM1ODk1MFFyeTJnUHZIay9EYlh4dFhuNWhoclZkeDE2OXZ6?=
 =?utf-8?B?Q2R6UVp1WkM1bSt0WXJjL0FPYUJYdjFXNTB1QjFnYkxhMkNWdzBPb3VENVBM?=
 =?utf-8?Q?HIFn//clxprBMkqPYNu6d8UQbOxtusUGAy1f4R0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2443f2-2e45-404d-3063-08d9330608c0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 09:38:46.2514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2PD44Xdy4knkU7B1mq+61DZjp0qHEaC84fWMcGIv180iBhFUU/je/FBuj44pxDqkuErvOu5YLKutWXcILAqvQ9gqdZ9c5W7jg2wirk60fA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3959
Received-SPF: pass client-ip=40.107.8.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7,
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

17.06.2021 18:52, Max Reitz wrote:
> There is a comment above the BDS definition stating care must be taken
> to consider handling newly added fields in bdrv_append().
> 
> Actually, this comment should have said "bdrv_swap()" as of 4ddc07cac
> (nine years ago), and in any case, bdrv_swap() was dropped in
> 8e419aefa (six years ago).  So no such care is necessary anymore.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

