Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FA13BC844
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:06:45 +0200 (CEST)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0h2S-00048l-Vs
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0h1K-0002qG-An; Tue, 06 Jul 2021 05:05:34 -0400
Received: from mail-eopbgr70108.outbound.protection.outlook.com
 ([40.107.7.108]:51806 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0h1I-0004Vj-9R; Tue, 06 Jul 2021 05:05:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+8APlpH4F9d5hEZ8fOG/RzUGPeS1+2I9zoN2Vsriqy/ZqfegeE9qBhWV11NFkjz9hW4JA4r9oOrz09vkqKNkpNPFkKuSdMrpa1ZN/rW955kuDO8TyATAAZlMaiXxU1Ze64q5W10QBPmIgG5ITZLda/kbjJN3YKgzp13w3sbN10A+dzBqKKKH4H2x458xrRidAv97coSocEAyKA7a2h/p68l6sTHnvEvQG9VnSSz+7bdHG+CSH20cK7HYGa3FVBrOlMph8Ox2DhTsgBb84DF/PEGc4CsUOndTyl2sGe0XNATQdQxJnLE6mdYd1DJKlwABBdp949LtsdWQkhBMQMRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wIGJF+25h06u9Ie+sdU1644dcAG48B1uH04x/PSX98=;
 b=CQ8P2ngdjQmK5UDAOcmbFPC3ECSWuxpa3swm2VPL4/HWNtXovYvkGYn8VpoV++mEKsLqwkcp3zqRm4leld4RveCOzwW6jcf7EGDY/u3VEV2b9YMiFpZksMFOfsKHrWQV9fNF9rBNpbh0/EKeiIV5cvghzUuVV2mqj705Q1AFCNz4fjmTns7yeKwSeFqb5D7FBHafVU+RvMUi9zbkQLcqT8SxN/3M7Rch2dioWChbobeySRPIey2+QThX+xqSMvlkrh0zK/KA4NJ5+B2CfcuJnFJ23IKqVh0z5MJrTMakH9JXTqIkzsi7oBnQ3H0tH1tl6lPkmVsQDWYkxzVNK9bKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wIGJF+25h06u9Ie+sdU1644dcAG48B1uH04x/PSX98=;
 b=YminAVhtOpNfmaagGaGqAAevaacnxPW4/h2h0wXrSQHmXrJb/tlIpqhKV0hXy4h8XMtybWIW0puBg8ayqBJ3EijPmm8vACYtWRz3b0CxGSqEYh4cgDE0LQZAc6obXa2KfaslwHGeW1V5zlQqi1YlGUI3TzLE1dPh441J5S+o72g=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 09:05:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 09:05:25 +0000
Subject: Re: [PATCH 03/10] iotests/297: Don't rely on distro-specific linter
 binaries
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-4-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fa465f99-c4f6-f0f6-814c-be727d6d56a3@virtuozzo.com>
Date: Tue, 6 Jul 2021 12:04:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-4-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3PR09CA0010.eurprd09.prod.outlook.com (2603:10a6:102:b7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Tue, 6 Jul 2021 09:05:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb2fb369-8f98-477b-b1f6-08d9405d316b
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53341C8D3EC5F278B17ABCE4C11B9@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: reNjNsuh6ofdYrWStLOfjTkiE2jB5+eP/B/Ph/v0qEWDN9PfmLgo7iDDRDIGY89ew8hojmmB8bnCOpDptAQqRszCsuDLawEn7y2cxhgjLKiiEMCJdpsNn39MQZRnH5n/26hCBuFbMyz6Jb+rC/mwzl11T5BazqGLb3QosrgsRxxWjtb9RRd9HGQdbc8Br571sUaSqzQJHSjvBa3HCiRkONrEcZwBOmwVjXMMklqjwgloeUvVFaNzx87TUTzJvTaH18GmkXOaEycrs9nNmVxknUNvozvH+1PCuCc43ckkOe6WmM+RZrSKUL20BeSM1xxxf6lhJ0zYAgtb0Y185TYTzLsiEnMe1YJMrCj+zk9qjTry2md/OX1cBjhTXZ+n/reyWpv9SMFoubcHSBfdz5lRFb2+Cb9lcQ9v8Si/sj+RKk+pHXIB4DdN5pvCPFQ159qY2G7R4Pah8lJZG8M+KvHb2DLJ2PBTwH1m+Ojh9Uan8hO91+v60dW5UchtuDUmnIxhptdPoGyXGWBaH93vGk5Y7Bui3MTKwb4GgK6qPFc1IZGnjtnJv++H20yPNa0qlEIXQCOxq7DBTQybZO5TkkBKfjpU8pb+W7ybb7ruy15AkDJi++dz/iSUx4woHmkv70ubsxVIL5lNWdXHJBxNajRnnDnd8m5yHsRpWOHURJjyefKOa7oH4FleG7XAh2Yq5CWPjO8YS27gHK0fXp+ySBk0vLI/TxvIIeDSjiBJ3IIeeUEvBGPC8kS4Gwzq+yxfp5bf1qk+RBqIATXH9LzAQiPJ8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(136003)(346002)(376002)(366004)(31686004)(4744005)(26005)(4326008)(478600001)(54906003)(83380400001)(6486002)(316002)(8676002)(36756003)(8936002)(2616005)(186003)(66556008)(16576012)(38100700002)(6666004)(2906002)(66476007)(38350700002)(52116002)(31696002)(16526019)(66946007)(86362001)(5660300002)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MytqYkRkK043YjlxNUJTMmFsVWR3Vmh0bjF0bjNLWUNnYVRRb2xLbVY1c21C?=
 =?utf-8?B?ZDdmbithaFBLa2R4S1dpWUVVR1d2bUtqRGlRNG9vZElYaHhqZXFXQ1lKdCtH?=
 =?utf-8?B?eEhOT2NMWmp5ZVR0SmxZTG9FM1ZodHdhVFpvUmszY3lGczA5NEhmQjdzb1FO?=
 =?utf-8?B?WGFTQlo3T1NkYkozeGo2T2xidGcxK2xKa1M0SWdUaC8yOE96bERtK3duelNH?=
 =?utf-8?B?Vk1uV2tLemJUWnZTWTlUemdCd0c1MzJtdjR6WUF2QzdRbTE1N09WenZTTFRh?=
 =?utf-8?B?T3k2UXEyMytabDZ5VldiRENOOEVXdmF5V1BCMVhZTlRWbTdzaGlaT0xmdDZE?=
 =?utf-8?B?Z3pLb0VzRWtqblcrYzJFVGxLT1c4K2l0b1RuVkp6TnI0WjdkdWVvcmxISFhB?=
 =?utf-8?B?bzFYMDY1MVlSaHFzcDNqRGgwV0lJVHlBNlNvazZjN3FtR1lFanFsRmFKY016?=
 =?utf-8?B?SE1zQ0Z2VGJiSHRRdUF0SERvek1IUVdhdkxIWDRtSWV5ZWpJRjVPbFhtUUV5?=
 =?utf-8?B?UVlTZDNITmRaYldXSFZaQUpuWkpmMHZVd1kzVFIwSzhHTHZMRDN3VWJKZDhN?=
 =?utf-8?B?U2lCaWxnUk1IV0RqU2xWNkxOeGRHb2F5RUlqYWMwMGVoTU5YRkNWT2M2VENF?=
 =?utf-8?B?WHFaaVplQS9za1Z0bkgrNkZFSnZ2WXFMc05TSU5VUElYRko0ZFlnd0lPbUtQ?=
 =?utf-8?B?azFtcWw3aS92UjJhSlByNGpUZnVrQnN3TXlLQlpmWHBBdEVnK3M1Rmc4YUMz?=
 =?utf-8?B?UFVYcTBEajgvM0QyT2dGTTlEQ3pNUmZ5RTlZck9HZGphc1lyNS9EU1RVR0tk?=
 =?utf-8?B?VFRucVZ0RHVNNnNzN0RnZ3owVTV5SjFtS1dEQ1A3bzBDcExTblZtT2kvbGVE?=
 =?utf-8?B?VlY0bHIzdTc4Zy9uMC9admh3QzM5bkh2enRnNG5hb2VNMVdFNHhBV1VwQ1lV?=
 =?utf-8?B?NzI4eFg4ZTdRRW1NKzFzUXp4TFBOUEVraGtYL2I3S1lpaE9GL0Jla2Fya3p3?=
 =?utf-8?B?TkFyWDMyR1ppNXdNWFlVak1rVW95anR5KzRzeWlOb01XcldsSmxDcUxNUEdh?=
 =?utf-8?B?WjBEQlZmMXlxbTAyYVZYcjROTVoxa2RyZ0tSVlJDMXBsMjFLUkxvaE5UVFpE?=
 =?utf-8?B?OE44Q0tod2ZBanlFdGVyTTAzUGxpaWwwQU5HSng2bzEydmxIQVlscjMralBh?=
 =?utf-8?B?Ym9rb3AweXdWYm1ZNFBhbzlocXQyb3JTdGJyMkdyRkIzTWxHUXJFNVRrNy9L?=
 =?utf-8?B?Vi9KWUJNOUI3UVVwM0JUbSswelVHWmJXc0pjZjVQYmo3TDFWZ1ZDVFdKMjdo?=
 =?utf-8?B?MW1kQURHc1ltVHZBb25nL25tYXhsYkdSOFlrSGpKY3NpeERxbU5FeGg1SlY0?=
 =?utf-8?B?enVGU25iRnRBb0RIRVVMSmdwdVloTjRUMDVRSktDOGpGN2gwaytLVVAzd2JH?=
 =?utf-8?B?TTNyYklocjRsVTI2Ym1yc2wrNU50Mk9QZjVpUUpvSjUwWWRQaEpCdHZYTkxD?=
 =?utf-8?B?bmZzektXaks2elBZM3pCZmlSMUptK1hpQkNLMjV1bVdBSUhmT2RtWVUyUHFT?=
 =?utf-8?B?QUJGZDlwVUkyZUI4TTAwT082NVlKbTB0VGNpQ3pySUpqcUJsNVdIdWZ4RmJY?=
 =?utf-8?B?dkJpdU1iZHpYUXd6MmdNcVJLUm1zMHhVRTdqOGcwZUFvUU5XY0ViUi9yUENk?=
 =?utf-8?B?MC9FQlp3M3RSVlBPR0xvOTJ5c2pVTS9QQ2l2d2VjeFB0elFnVGM3Sis0Rk9K?=
 =?utf-8?Q?Yd5/VGCjCDbgeQKAcGXm9g1LSnEJpxrJe74pP8r?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2fb369-8f98-477b-b1f6-08d9405d316b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 09:05:25.5919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +b4YKbTSBejKnhSWKADMxx5jSi1k6Bg0VbR14Zx7JKZaSRwYjKZfXus1Ou4DY0nNaSKgIm3IAeGl8TLxiE8I4dpBgjCCOJ7NRvRRuJ4vGQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.7.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

25.06.2021 21:20, John Snow wrote:
> 'pylint-3' is another Fedora-ism. Use "python3 -m pylint" or "python3 -m
> mypy" to access these scripts instead. This style of invocation will
> prefer the "correct" tool when run in a virtual environment.
> 
> Note that we still check for "pylint-3" before the test begins -- this
> check is now "overly strict", but shouldn't cause anything that was
> already running correctly to start failing.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

