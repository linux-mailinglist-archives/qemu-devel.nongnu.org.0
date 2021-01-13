Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2082F4E0D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:01:38 +0100 (CET)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzheT-0005XN-Aq
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzhcV-0004y6-J4; Wed, 13 Jan 2021 09:59:35 -0500
Received: from mail-eopbgr70095.outbound.protection.outlook.com
 ([40.107.7.95]:17326 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzhcS-0001qT-4S; Wed, 13 Jan 2021 09:59:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJDNkOWzx+chN5CcGklzas3GSaiZxnbgytPf+IlbM/XbAWo0gFx5cQCphk8vJ4MZSWO/93jqUPTCpVPbyWGez0weQoQPY95rC69BHDVqCYPSdICL2xu5MbW7Zx7cQFF5JFgwYlPqqxdvrHaaxTZhWNu4FoQlVdEshFzI9LZkp21mSqi3Lhjmv5LkCs3EjBiu1iCThngTSVqOVmMRfBnlEJ8SgoOxYURefGR2W5gGpGN1AAd1OXgjLS5Wqi+gFWt25L9jPRgzYOPy4skv4G50Th6vkx+2pGM5vzBdxXqIPLvSgYj4QcYqHCAxoZdX6eOonSURypJ1V6J60XAcmpusuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuWsJqXDZXfRUSxu4t4m9KQJNi62XcUNE7x5i+E7YLA=;
 b=epBMuG+zmVCgnr2To3mMD2i+TnQihW63Ib8+qaZeM9MNJAN6+s7vsN2MpGO8ZlOBbF3hi9Hvtd1MAw/5ht/YTVrIHgqYLMsr9X93bKo7fHhT/no4gIWYqsEpDxP9jAVKy3RjLhtl7y8rSfdeSp1VMbjCUedCdUOLiq4CsClqP97qoxYRTplZYV8VhAuznPn1mqOsGQeLiPDgUYkflTw5eDDbxuzIgFw+/Zw4wK4TtfCtz1cO5XiDj0SMCghDRB4JSo650KPT2jDcRe6ggHynbT6zjtUajSueFIiq4X6q5pirtBm5cNm6Pc4pe665BOOOmbJFwVVgavxSftm9L2Rgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuWsJqXDZXfRUSxu4t4m9KQJNi62XcUNE7x5i+E7YLA=;
 b=Jvi6XYV3u+J/miqnCb0ApzFdq0BKTGEbxH8JTSyynAdpIHcMkRdN9+d/2G3j3LidoAJ+TvxdvMdk6QJwDVZRcsiTXZDBN9tWzIldBwf5v0jIkdVprIwN8G07S7/t+LvxR9q+HSCfNHMQ8kLBs+D1ysEbxH4lAIBdlWya85q4NBQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 13 Jan
 2021 14:59:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 14:59:27 +0000
Subject: Re: [PATCH 0/7] iotests/129: Fix it
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113143816.GB5928@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8a674846-1f78-9fd2-b8ef-e0ef73d736ef@virtuozzo.com>
Date: Wed, 13 Jan 2021 17:59:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113143816.GB5928@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR01CA0171.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::40) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR01CA0171.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Wed, 13 Jan 2021 14:59:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f031a64-652e-4b7e-ed59-08d8b7d3d2ed
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-Microsoft-Antispam-PRVS: <AM6PR08MB322183AAAB276EAF5031325EC1A90@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5c7PZA9W2pEZEBv3bkci3pfJ6H0r562WecDfg35WSHDuGIrToslOJ5p+iA2wL/N5Vh6Ii+orBgRF2zfeHysuikpTXI+w6fSxangUJWkMGgpENUfyLtKvyBFbWeCZJajsVJyfZBzzgCBx1MT0lcWTZ5vsqDRcZlL/h0xU78k2DvgVB8NPPmtlzs/56E27bPAtxnRViE2FI4mcdKNxxcP+V1fWOL659oGFqoscGU4a0lbuQaAugn2X0oBCb+kiLmygCS2Y49PTtHvZPTXgF9zRP41Wfe9WoXrKt9kz3pcNxE+MiU8DHUL6FE7KiRrhdC0zcU69ywoPJxLaAuy/LwJDI4bLfClOo6yoYiZg26lBi9zkxBPCiZDLcgZDophktj2kEZL3o4A3J9mqQeMY3A0MqHiUO2KTNLnvJU72h+qc/1K5HQoooYsz9Dsk3jPEc0mN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39840400004)(376002)(396003)(316002)(4326008)(16576012)(5660300002)(2906002)(86362001)(31686004)(16526019)(66946007)(6666004)(186003)(52116002)(6486002)(8936002)(8676002)(956004)(31696002)(36756003)(2616005)(26005)(478600001)(66476007)(66556008)(110136005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDI3V0dmSnpKL3AwTjhjWjd3Nk5DVHdLbXVHWkJ3VGwvaUlaSTFWd0VrK0lv?=
 =?utf-8?B?VnhvTHcxTXljcnB2QitKT25XcTBPOGI5T3JLQmNYWnorVGtvdy9FWWgxYTZI?=
 =?utf-8?B?amt1ZzFjaDA3dndXS003ekVVbTErSG9pOUxxT3pXZDJIdDNEcjdkOWJOaXJJ?=
 =?utf-8?B?YU5TU3JOSzdLTzVGSGhWT240TDk1bGVWZWJTRkJOM3FwNURjcmNxcElrSDA5?=
 =?utf-8?B?ckhwUUs3RGpNRXZPblVVU1NRUnJwanB2NVFGVDhOd3NvakdJZHNUQzZsK01B?=
 =?utf-8?B?b3Z6S2RsZHE2US8zeGdmWVBVRFY4UXpGbER0RXVtaERCZ1BzSjRpM2FLaHpu?=
 =?utf-8?B?aFdTQkwxWm1HRnE5blZYMDBlV3p1YVkrMVZtSWMxUlQ3c0Z3R0cwcU1oVFBt?=
 =?utf-8?B?MGxrR2ZKMEM1S0plcllpZzhaS1RHRFZULzRiWWpIYVFVUGN0d3EzQmxibWdx?=
 =?utf-8?B?NDhGVTE0THRocHRwUi9UaUVmSGVPQUFCL1ZIWDBYbVV4S3JFajBpSzUzaWNh?=
 =?utf-8?B?TVQwdWg5UGVCb0loQlNaclg4Q3VwZUFqRjducU0wcHBIVFY1ZlFwVjFuUU8z?=
 =?utf-8?B?TzBsM2VJRFc5amFvTU82V09KeEd5clhpdlR4ZUN2cy96VHYwZkFrS2lHOU1P?=
 =?utf-8?B?RENOYmYvWjg1b2pEQ0h1ZXhydFFoRWVDYWFhR3F6cm9jM1dEbW53Q1BEL2lM?=
 =?utf-8?B?MWEzS3cvdGlkcTl5Mm1OOFhMc3ZQNTdwUERjVGxOK3lxQzJ4ZHZqZ3V2Vm1I?=
 =?utf-8?B?dXh4dlBmUGdNTnZRZHE0ZEZpUFRpSEhBZTFOdlpOY3NsWlFJaDA0NlFWVlNQ?=
 =?utf-8?B?cFdQZ25oUmpWZmRjR3lFTWdROE5iNk1iek1VNGlvZmJ1NHVacGVmYlNOUVlm?=
 =?utf-8?B?RGc4ZFF3VFdtdjI2VkJiNDNDSXV1R25oQXBReU51ZjUzVUpGbmVqbWpqbzAw?=
 =?utf-8?B?YnlINXk5THB5V0xrakVYQnBTTDAwZ2MySUJBV0JEcG1yUC9oTm92V2lyVEgr?=
 =?utf-8?B?ZWZOK29FdnFXb2dSVmZYeTMrb3MwR3RCRk10c0pUdlFDRUxTUHdzOVJ4RXVy?=
 =?utf-8?B?RHZNMURxMGRtUWtGckk5L0xkdUtnVUVRaFVvY3BzYTErWkpDSTVlaHV6dmwv?=
 =?utf-8?B?d2xKWXJxQy9KcWJpNUMwNzErU3RiZ2U0YzVPSkFqV2RkMk9zd3JyeEF4OE9M?=
 =?utf-8?B?MjN5WnJDZ29jUWdPTVpqdlZ5ckxvUjgzQmhaY2J1VTQ3QmVib1pCTzZiWjQy?=
 =?utf-8?B?a0xOV2NKcGNZM2VvNXlxcFpnMUs3Q2pRcTd2ZnF0WTF3MUd3UHpLOVpJbkdG?=
 =?utf-8?Q?S29e9uIGgLXnQY9nbycyFAGS0HQ1XtF4xA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 14:59:27.6550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f031a64-652e-4b7e-ed59-08d8b7d3d2ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIoKzhEkQh7SMbdECzmBlGGeUXF5NxB5yPc+Ap76ZZgbcPQvmIJtucS4hIIW0LpSD9rxSdgrXQne/k5U0W7a2Ek+3F84/9w6voTZ4x8dJuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.7.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 17:38, Kevin Wolf wrote:
> Am 13.01.2021 um 15:06 hat Max Reitz geschrieben:
>> - pylint and mypy complain.
>>    (Running mypy with the options given in 297.)
>>    [Patch 4 removes one pylint complaint; patch 7 the rest.]
> 
> Should we add it to 297 then to make sure we won't regress?
> 
> At some point, I guess we'll want to cover all Python tests, but I
> assume it was too much to change in the same series as for the
> iotests.py cleanup.
> 

Related:

anyone knows, what's the difference between pylint and pylint-3?

I know I can do pip3 install pylint, which brings pylint binary.. Also there is pylint fedora package which provides pylint binary and python3-pylint fedora package which provides pylint-3 binary, both package names looks so that they are... the same?

Also. Interesting, but pylint don't check PEP8 code style (or at least not everything of it). For example, pycodestyle has a lot of complains about iotests.py (most of them "E302 expected 2 blank lines, found 1").. So, what about adding pycodestyle (or may be better flake8 which is pycodestyle + some additional things) to 127 iotest?

-- 
Best regards,
Vladimir

