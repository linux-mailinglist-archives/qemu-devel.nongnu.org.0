Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571B2356B98
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 13:56:45 +0200 (CEST)
Received: from localhost ([::1]:42582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU6nc-0007n4-5z
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 07:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU6mN-0007DK-Rl; Wed, 07 Apr 2021 07:55:28 -0400
Received: from mail-eopbgr130134.outbound.protection.outlook.com
 ([40.107.13.134]:6117 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU6mJ-00080j-NF; Wed, 07 Apr 2021 07:55:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbBBuFFHgEiymLFaLkVfEdhjhdlo79Y/C8NlO4DX4plYp/BcGBqioFpj8c+iPQWmaL4H5+HBgYElyxibpit04oDwYn3QaRxKkkrtnHN1FwLj+VNoUgGjGmsUvf/yIZCp3ULZ7STVU/sQ2u30a7kCy/9zm/ubGJfp++S/2WKt7J3Td4zRHQwibLTl5p3pokwZevZXeFzENAg/wQMVtrPXQOy9bFdl6iXkKouwqnnWqtYAq/dE8MdgHEJyNJQoXsQ78ZaNJk1tkcFvS62BatSkDdXcv2Az416ylXq5GiHlEK5FAiBlZBUHF9W+SZmbqUt+i3pZ+UEpy5bJG847dnyzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4vStfUFKDEVS9ugO9r2TL8104WFGLc55YI9T+L+DTg=;
 b=LhxnOTtZcDFn1qohxCy9a7cr2Gazm2aqTwMBLDkaZ3+EqmrjLCje7VMG+jeSSY5MYdTpZLs9FmTbxilWlYhpYMSmMDvb0wH2k7Nd5h+K+b2cCVBU5p/smdaxnL4j6xwqmX6lsqJiADALLOGMdcVP6QD0D/6wWebf9Zrvf6l65tgXWq995ccTQrkCbO0L5IApl47RZ/KPj0jJurBUGlzLj1mYqoXQQt7zloY61cUOdxN171ytAcpVQIMkadJABMFjAMuE1MWWUi4BSWWXppCZuSkaU72AFkl3YiaH0MRcreCT1S4URktNKX5OuTdZUUviDn3ogxPLuRsI/cJT3tvVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4vStfUFKDEVS9ugO9r2TL8104WFGLc55YI9T+L+DTg=;
 b=ats9XUENIJUG/4GXZvsDvEwRhtaV5dBll+y/q0Ogd8ckgDNNBlZlutEaJSrwpAhsUXI8/A7Bn9L0tdQFKEG6KAYvPsrymmwDTp6d9wL1QTrSm8HYSkIJekiDddYBlwuHl/OTVVFWN7fPUw9x49oneqAkZoI7TgR3GtKPvczK8R4=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 11:55:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 11:55:18 +0000
Subject: Re: [PATCH 03/14] block/nbd: drop unused NBDConnectThread::err field
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, den@openvz.org
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
 <20210407104637.36033-4-vsementsov@virtuozzo.com>
 <YG2akBHjJyoPSm12@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4e05dbfa-b84c-11c4-4f69-287a33447952@virtuozzo.com>
Date: Wed, 7 Apr 2021 14:55:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <YG2akBHjJyoPSm12@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.12 via Frontend Transport; Wed, 7 Apr 2021 11:55:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a106eff-cd98-48da-3929-08d8f9bc03dd
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5446A4066E24CAF3D145ACE2C1759@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xCFF8i4c0vobBePno1unJbCjAuYOCEjTqHz04PNHCG6Ez9kFs58YHjxkYRT+A814md9caQpCusWO5YG6L7+7bykTf6kZl1LXx8Pa8JQtcIjbQOPRYHv2T+iSD57yUgRyIfhMRWJqM2sbukqjM2fSUQU19zzTRcJLQqWLdavxioQ5fGs+ehSAco1is0DEB6ouWxHCcge/38rV4QDqFZYj6Ber9td2nHUDO2sAoedwgERgQsmgolnHbdCsPNVGGusPYzsrdQBrOmWbg2N3rj9d1lRUF6e4dj5Z/gtY2Sx4pFXEvzj4ZB2rNaEGbiYXnul+sxfnB6gchugCOQYJE6yiGLPvRJOrzD4TATbrdAUHMhqWWnZlf6f9O7YtwgSKpdKTBCmnz36oCHQSS+Kc3iu7XxRR1pIXwQBe23EgbOUU/VxzZpayedwlP9sOmanA3SJ1UL4Ms2dn7Fs/Qtx5FlTX/z7mDiKc8E4Mbq/MUIDjod/3UMAtnY1L2n3M336Cw9ws/MTaz2oz1umuBcPixFuSI1t2JJZaf7roxs4N/9sycXjofRDV7MnTalaNnFMn0D56DUF84zsDq5jZY1z+ez6NXKFaJ9o85fFvwoH80sGy1hIWNIgi7MJQEqFowbFPsxXs1A7dSlUKScBxefPo24+4dP+bN5LKLTyzjpxdP3w52Lw8L9Eg7Ai31ZEqgP0CUPxkXAvSxY+mS5njrQXF+fPPzArwL1q6+k0Pa6ilFOTjUdEySXemgWYGvtQAjhXL/hoB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39840400004)(52116002)(31696002)(86362001)(4744005)(6486002)(2906002)(5660300002)(2616005)(66476007)(316002)(8936002)(38350700001)(186003)(8676002)(66556008)(36756003)(16576012)(31686004)(956004)(83380400001)(38100700001)(478600001)(26005)(16526019)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y3E1K2tLbEJLU1hpc01wYVFOQkhEVHdNblphak5uZ09CdHVRMjN2ektCWXB4?=
 =?utf-8?B?Vi96YzNCY0hLb0d5ZEUxYW9WbjZjalRIZVRyTDhCWWhiTVFjaGRQNkxmdVE1?=
 =?utf-8?B?bVd2TUxQdXpIKzVRMWY1QmNwUUt3K0YxYmVRbXozak1nYTQzT0xuVDZBTVIr?=
 =?utf-8?B?aFA2bGdsc3prTVBlQ1k1allWV0h2TEtuazAyWk44SmtQOW9NMzgraUFESGZC?=
 =?utf-8?B?aTlSV1Z5YkI1UXY0eWhjMHdqQnZ3YlFhQWxFdUUzK3dtS0lQQlVSL0JiTWh4?=
 =?utf-8?B?ejdlazFWbGdZTE5lYVo0RGYydmJtaW5SSVp3dXlXMDlNNE9saG1TcGM2eWM4?=
 =?utf-8?B?TUdLNHNTbS9xajNuRjMrQzVDUkVlZUpmUTI3L2x2K1FiUWJmZlhNNWVXQ2hD?=
 =?utf-8?B?MUMxbU1nWEFHaEJSdEVZcFNvOWZseUg1QVduenQwY3NMUmtvRkJuSzlsQWpQ?=
 =?utf-8?B?eENSK2VqakFQYkJaUXpTY1dSZDF2Y21RNUtLYVhHTWJLRm1RdW5qWjJHaEc0?=
 =?utf-8?B?clZLV3ZUY2JYcGZUZTJsZXhoTTRwa1VMb3FsRkdjV0xJREduRjYwQWFwdCtC?=
 =?utf-8?B?Zy9HUDhCQXZIRDhURUVSY21oNTJpK0pFUi9kMER3YXZJbXl6V3l5ZE1IVzlE?=
 =?utf-8?B?YUN3aEowOVJOSGZ3ZGh4NWtNcDlUR05KUmQ3NFZKTS9IeDg2aERCc3pIRU8v?=
 =?utf-8?B?MUE0d0V4SFR6OUxTVkpyRmJtNGNvQWVqbmpGU1BEeGFKcFdnSjFoTXgvOGNZ?=
 =?utf-8?B?TWZLdlpnMGpXRUJuTmxXTkM5R2hCNFJkb1JIRXdaYTV1ZFh5V3RGSS9DOEp4?=
 =?utf-8?B?MXNGY1ZMdEhYbjdzdC9SVHY4L2NrR2VFeDZnbkRWQjZLTVdUNGx3L0lmaGdB?=
 =?utf-8?B?TmlEaGU4UmpGQWkwMFpSOFU0OTBxS2RmaFUvMDl5R3k1Q3l3eTNEY0dLcjNy?=
 =?utf-8?B?ajNmNDhheTBDRi9vd3o0MWlvcHM5ZlJYcmZnbG9ZVG5yNmFKMkF3TmN1Mnkv?=
 =?utf-8?B?QlNocGZsVnBIaHdlQ00wQnNEeEtjZE5xQnVmOTRVUGFGd3JFaDlleTRLemJY?=
 =?utf-8?B?M0prTjhiVVFsRnd5aVo5NVBiZDJWUkpNU1JWVmNVR1ZUV01yZUpWRDBzbnFL?=
 =?utf-8?B?dDhVVm9kanpQNTZYYzE2SStVNmNtWEVpTzFHN2I4ejRGMjJ0cWM1MjVscGVY?=
 =?utf-8?B?Z1BjUE54S2tMOFl3Q1FJVkJCSmtQSENXZzhnSi9oTUxNVVk1L3JYK09HL1JO?=
 =?utf-8?B?NTFHOWFuZFVQRVFvMjFBRVlRNmxxTDZWcm45NFY5a0poZS9nMEhVenIzSWxJ?=
 =?utf-8?B?MnJycll0Y1h6cXA1N2VUeDNadkFScHZzSkp6Uk9MQ052bzV3WVREOEU3M2Vw?=
 =?utf-8?B?NDVoQTZFdUNPWFVBU3Q3OEUzbk9DR1N2NHFZV2VEQ3VzbjZnbEhUbVA4Z2tq?=
 =?utf-8?B?dnpoa2VBdXlhcmMxWUFaRm9jZ2hyNVRDMWliRnVzanIvSklQOEFCQmRQS0JM?=
 =?utf-8?B?clAzQWRycTFxb09mdlRBZldtVmpnaFFDMWw1ZHJkdkFLR0xYOWhtbEE4MHoz?=
 =?utf-8?B?Z1cxUTdQcmZSN2x4RW0xbWt4VTM1ZWVCRjJhV2VpSTJIWWxSRG9xcDRISU1p?=
 =?utf-8?B?UEE3RjRXTVcwZ1huNENKN1F1Q0VrVzRERXZNQ1YxVXp1MnFZM21QTGxwRmU1?=
 =?utf-8?B?Q3ZMS2dHeDcxMytOUjV5Z2tnMWJxaEFrOFY3eHFyZDRBTUpJY2VmbzdLRDBm?=
 =?utf-8?Q?4VcBbgqGw7+DVeLyMn716oezd6nbXsqhjnijyhr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a106eff-cd98-48da-3929-08d8f9bc03dd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 11:55:18.8008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1yKLijafdOrOmH8Wv5ea2+4NNoB/TMYUn/LYS0xe4hnaDVfLLGnNW9k2xEySrFSjztBhDYeMluDvy+WVkxeHUmGSXXCF1OV12KIDzQ8oCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.13.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

07.04.2021 14:42, Roman Kagan wrote:
> On Wed, Apr 07, 2021 at 01:46:26PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> The field is used only to free it. Let's drop it for now for
>> simplicity.
> 
> Well, it's *now* (after your patch 2) only used to free it.  This makes
> the reconnect process even further concealed from the user: the client
> may be struggling to re-establish the connection but you'll never know
> when looking at the logs.
> 
> As I wrote in my comment to patch 2 I believe these errors need to be
> logged.  Whether to do it directly in the reconnection thread or punt it
> to the spawner of it is another matter; I'd personally prefer to do
> logging in the original bdrv context as it allows to (easier) tag the
> log messages with the indication of which connection is suffering.
> 

I see your point. It may be more reasonable to rebase my series on your patch and just save the err. Could you send your patch based on master?


-- 
Best regards,
Vladimir

