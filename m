Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854D33BC825
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:54:32 +0200 (CEST)
Received: from localhost ([::1]:42742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gqd-0003FQ-Kh
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0gp5-0002QK-5S; Tue, 06 Jul 2021 04:52:55 -0400
Received: from mail-eopbgr00131.outbound.protection.outlook.com
 ([40.107.0.131]:52962 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0gp2-0003bM-7Y; Tue, 06 Jul 2021 04:52:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHY86JESI1pkTSk8E5uSiJpIQjNA9s395/FbYB2tZWHyck2k2Wh21ajlMsALA0LVU9jbc0YHL9RbucsqZ11ooxGVxjqZJp8yob9ktmgHBtMZjTQBRyUgwU9SELA8JawgVeJH5RFM89qCJbpqWQVnGI36np4e8Zd+s/XVw/F0F0lxuBQ8I54ybfhrU1B+DRRKEAg0E1s2scucDLVvHzmEjzi2DAwvoGjG25DFV+2cJw00W2/P4e13tsiJmOU5KVRkMJNNNTVbhE1+xcVl3y/f49qz5w6H7ugOnVBYAYPuTYuFPbFV2nYRy+/Ed8uHmAxFo9tTugLzMsSOVuMe4PozWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4is6UWI78GpLd7I4SO4ScC4I2cF9hjKQ/DW0ieagFQ=;
 b=aNWtbwRXXNGgW4in1XVgVeE1FSe7Tv69VVMrWV6nLquPjySf6Hc0gcixhxNHeA4KS0+9YimMunNSpQa/DF5zXw8l2yMFOeDHfTIAh7ZuSJEUhjniJB4PVWOnV7brCuNC6ucUS7TvB+20TBOH+jcetnp2Jf2zE9F3+zxd1bNdDYI/8MvUVv1IUtSiGlvpK36hBMODuh86oy8ouc4vPUA325KwHpxC4lNjJlVGN5ZMb6t1bSDobNf+wTWBLY3yg9XzjCiazG7WwOqIZGBcFJMHZHLZca72wiYL5BP1xOe6tHglsnjN7LwEqaTUcZFd8aDyBVdq6cnXVTBZ4IMhTUhc5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4is6UWI78GpLd7I4SO4ScC4I2cF9hjKQ/DW0ieagFQ=;
 b=Za2KZfW1Ts2wL/FhZvICd/uUaePqQ+sFY8BI8FrPL53pEMzIV2vBzaqf7uO8WywQRCDJDiHG++QDCMt3SaB9Th2NiS6Ck9a0M5t/2lMVFqK0CdF6zqM6kZZpvzfQNLhfEWkJexbomCkpS4hW+bjuV0lMklBUE9/11Z5WC8V3Nng=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 08:52:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 08:52:45 +0000
Subject: Re: [PATCH 01/10] iotests/297: modify is_python_file to work from any
 CWD
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-2-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <589208de-f46c-e6fc-c7d0-3d6d2c2cda89@virtuozzo.com>
Date: Tue, 6 Jul 2021 11:52:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-2-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P193CA0055.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P193CA0055.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Tue, 6 Jul 2021 08:52:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 573b9c46-e93b-47d1-4c26-08d9405b6c40
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-Microsoft-Antispam-PRVS: <AM6PR08MB36232D0132AF8BDF42057B6CC11B9@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fOp/XkpsNr2MbSgp3eChfRx7XhF8PgzYpWlpKy9ssNIYg8p8IWKLf4MIIVNHcRS9HwFfkEbALB1/Y74Uo1XKzsymsUMXghsw+qHW2LRXg4wyfjCxn00kwJKkZJ3CFmmZquwz4ju9hOcaH4I648ZdtRhTWHSvUEY0doqDSScZeqzR0GDOkyZmnn+/HqJkC83Kz1tojReNYLIqAdxBr7Jh9hRIOry4coe/SYlvDVRdujv/o43r0DVAaKSc6pTOj1Mo0xF0HNprI+xCwtJhpcjlxOyUFlODivOyCgr/TmlrFxbxFW1C4CRG7qBb3543Uh2vZIcZCMtkkZXt7VpiwVrnnAPSbtfU3Y8Ggfdhh9NFOpX18tGReDu1dQpy7HwAdnzhcVJ75EeUhdRyO27skky7FB4R3nLY7iaPcmdjRA1GKqvzglZTtPrh59JCkN1SeIW5M0V3UeO/q8x3GHr9FKTnksY4IAr4HpGP2k60Jy1me6wu4ubVHLFh/XkzXKtwhQ7oSEu3zv0HhN+u9cVYEyVH5CalsNPNgmUpirssNqWwf3Hwgl2Y8vCHfIf6p/o15HIxJSmYEzbNnHK8gQUAnmeWHlV7XqdtgNTpuspJSdZxyLkpZWzb1RDvuZYEBi1PV8M7fvFUNm5lh8A2lpvcG+zVGluYggyLEGCFKY17sIILxD0NoMFRPPMQY19Mel4OZxQppbGQI6txRw5m3gkfuxF8uZF2HoqcOKLEJK3Kez0WLsLGYsczhWVCxPCu+U6jDcmIjORbATgOyz6t9bzjb2Xd4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(396003)(366004)(376002)(346002)(31696002)(36756003)(8676002)(4744005)(26005)(5660300002)(31686004)(86362001)(54906003)(52116002)(2906002)(4326008)(956004)(2616005)(16526019)(8936002)(38350700002)(66476007)(38100700002)(478600001)(6486002)(316002)(66556008)(186003)(66946007)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um9ZL3VEbXZRN2dobythYU43cUZXVW5lRmF0RnYySWNNS2JqQXNCeGlRbCtL?=
 =?utf-8?B?WXArQWdtWTN1SlNkR2hOekk4aTQ1bVlZTTlNK2VLanRKR0lXcHlITit5Zjcv?=
 =?utf-8?B?N3JBbjdscVpIcGFuSXUyMmJDSHpWTmVoMGhGV3lUYklIdEd6S0lyVzlSQ2Zj?=
 =?utf-8?B?eHErUGhlc21saThlUTRWLzE3cXp2OXVSUVVXd0I5bjYza1JVanZ2OHRQczh3?=
 =?utf-8?B?anFaYkhDNmZ3UGxqQm1nTmpyNUZRYjljRHl3OWViREo2UGxJelp4M09LNjdL?=
 =?utf-8?B?UXJ6U3crMEhiN3FiZ3JCcGsxYmpvN2ZlT1pzTUh6aVZBSkM1U0QrU0NGeDVD?=
 =?utf-8?B?LzRyczR1WndpV0hqSWpIZU1MeUI4c3FRbnVkT2hFa2tQcEYzL2grWjRyNFV2?=
 =?utf-8?B?NjhSOUpoVEVwTmpPZ2FiTG9iVERoeFcyRHRESnF0dGI4ZzhjRlZ2WmFzOVJy?=
 =?utf-8?B?N29iUWxkbXNKaTdBU0czMUp5aTljdk8rZm54WUd0a25xM2tkZEZNbkFIQmlm?=
 =?utf-8?B?d05XQ21lencxZ213bXRwWmFJRHdDQVNIV1FPNWVRMXZKVWNORG1uVWlaKzJQ?=
 =?utf-8?B?dUc0SFg5TWdvN3ZxNzQ2TlFnSzZrSDlPcWkzN296aTJPN3hHWmtHM2VqeTdZ?=
 =?utf-8?B?ZDJqS1NpY25COVV4UUxZVGlwZi9PUVQyT1NEZ2wxWUxZOTMxKzRvVk5GbVlH?=
 =?utf-8?B?TVlOQnIrNmlxd1ZWeVdNekdrWnhPNEU4S3UrdE0za0l5N2lqMHBjTUt0aWVo?=
 =?utf-8?B?andoZEcyNmNhS3pZZE4va3pZRzcxVktsY0ZxRmZGdUJjRlUraTI4MVl6NEYv?=
 =?utf-8?B?N2lyUmsrL1J3dC9YaEZTSlliYXVsOXBmR0lQN3RlSllUbWxsWlJGaDIzanl4?=
 =?utf-8?B?Z0pBbFMyZUFSc01ueWdRMnVCNDNLeHRsQkoxaHFtdmVZYUdNNUhuVVRGWTNX?=
 =?utf-8?B?REhLU1V6bHRnZ0RTZ1RCcTFycnBhR2xyaUZTRG5hUit0Rmg0U3RrWlE0YmlD?=
 =?utf-8?B?TWxMSU9hRkNiQ1I4Wk5QN0lLYit6bFFzbnB5bGQ2QWVJYi9UazdoUlVjMGM1?=
 =?utf-8?B?VlU1dVdMWDgwcEJISFFHUnBBZzI3czRkVGxjK1ljSlRuK2xZRjhoR0RTeWxp?=
 =?utf-8?B?SDk2VW1WZlI1MHErdXkxZ1dwUVQ4TnpmOWE2WmNLSXBEOURQQlZMVVl5RDlj?=
 =?utf-8?B?Q2hpajBpWlM0a01zckx4RlVTMGtpRy9KV3A0bTFMUmp2TEpCTVhTRUkvRHhp?=
 =?utf-8?B?aXdTSEtidVJvM01WNHVPdzNrWERzVVExWVFRbm1YTlFIRUxEMExWNzBWUWlI?=
 =?utf-8?B?MHRXdTFxUmpyeWdPbVNzOE9CUFNiOVpNYmp0aDFrM0NkQklac0d0OWtDbVJV?=
 =?utf-8?B?ZE9weXBaaHYydmxSdWIxQU5xcmg3aG5neWZZZlJ5QnZ1YmpxM2g5d2FlcXI4?=
 =?utf-8?B?SkxRY3djanpzZHdXa3FSdlFlcUVZWEhpalZvUEVpV2VCbVZQUEFxWS9VbWZl?=
 =?utf-8?B?bXpHVy85RitMQkhJRVhUclAxWnE2bDJOUzFGU0ppZVBzQnY2bEZHVTdtYUND?=
 =?utf-8?B?Ri9OdnlkcUFJbTYwdkhqQWo4THlYT1BiZEFCcVlkT0JwNUlwajE0cnA0bFN2?=
 =?utf-8?B?Rm1MSFowZ1ZkZG1NcTNnMDllZjFIU3FBMHdoenBJQzdMaitpVFY5ZG9EcmU3?=
 =?utf-8?B?eGJvcmNYMVZEejdpMXB4RDhGVW56d3JBNkNManhQNCtObmt4MmdGNmlEMC9O?=
 =?utf-8?Q?nbQfVfS91zrleJwn1Y0M5BrmBur9mK92ShwXcDY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573b9c46-e93b-47d1-4c26-08d9405b6c40
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 08:52:45.3394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UWNrzaK25ykc0FaZMyNJm4mA1hIbh0MLmZ94bSwx4drf6ajnjDphQfVDEFQQzhf6GYRWtqFu7s6+QQzwyU/VvZ32e13Rd/gwNt6BqBAbmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.0.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

25.06.2021 21:20, John Snow wrote:
> Add a directory argument to is_python_file to allow it to work correctly
> no matter what CWD we happen to run it from. This is done in
> anticipation of running the iotests from another directory (./python/).
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

