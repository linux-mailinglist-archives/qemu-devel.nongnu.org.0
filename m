Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D693915CF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 13:18:07 +0200 (CEST)
Received: from localhost ([::1]:39920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llrY6-0005Uv-FR
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 07:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llrWn-0004mZ-QJ; Wed, 26 May 2021 07:16:45 -0400
Received: from mail-eopbgr40125.outbound.protection.outlook.com
 ([40.107.4.125]:36859 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llrWl-0007Gr-Ra; Wed, 26 May 2021 07:16:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmrRmZ3PiPXiznIbfjjOIsC/oN9D+cc7z53961+1GycjqYAVkP3R/awpf2JNcDXqx5vzCBv3d5x1ewYbZaxRu87sKfEcpJJ6+Db7shDu/34sTwq/fph4wdOQHBJ7lEfXm4Xht4jiSL1D4BIYrjCkqDldmqjb+zWGnSX6sgjuGrp+ellyuvBrIGesuSkCBt56GS7b1icXB2Ie3kjAhhJqtCuzJSrkRtlViyzaBeD6dpC52FHGERm68sF3R22wj8U6ssKFCekhN+eGMjxXdDdl6L08ZuM3UPywNrSaorNzvCCyyM2hBH/DI+l//1Ong+Jaf2d2kcZWxY2QBcYmOwp0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPeoOqyztLTXfmG7BCR/EYfBmzwbsYMs0f66vTElxOY=;
 b=CkX+B+qcga9PX2rUFVulp7Lw+j1zq4zjKedDu5Vo/iEpZ6hu2JWqin8qB60XUbvyDrCN38vLWk2eRkAdIh6QuFH9L5LX8rJE6cHNn6v7zKLJKjNlYu7t6o+CXT19AYrG8a12IGh8jBnh+MP9BDVz3suoB1HjeEf9MBIaRbtcphodk9hd0xLJ89gXG6Ko7yJs7kDr5J8XOiMhhH6TZRUkiFquyVBRoVbotE/8JjKFCd7HHx1AbTmY6dP6msP1+x58XjwuHWjX8qmAUM6n0KuFgDFd2K8i74kzlbT+Ac6DO6fAz6+gIE4delJ7rpbV4g3w94LMoQr+NZKRxAYzB39zxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPeoOqyztLTXfmG7BCR/EYfBmzwbsYMs0f66vTElxOY=;
 b=qt0UaJwZ/g1l+x5No3yPz/7LJilsqaye3sP5Hhi3x/3iOtmq60ISPAXljpTf02rZ9E3B7FdLrJ19S6lpYIr3JyYLPM5Ig3UKBZ0H9ZgHqJPFlQvJOix2Ay2m0UduiDLWMTQzYAsHPrCn5jszz6SEKPmZHiOpMkRHBfpHvJvO7pY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3958.eurprd08.prod.outlook.com (2603:10a6:20b:a6::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 11:16:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 11:16:40 +0000
Subject: Re: [PATCH v4 02/15] python: qemu: pass the wrapper field from
 QEMUQtestmachine to QEMUMachine
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <13411f15-e526-f555-b2f3-259a74a8acbc@virtuozzo.com>
Date: Wed, 26 May 2021 14:16:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-3-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: PR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 PR1P264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.24 via Frontend Transport; Wed, 26 May 2021 11:16:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b26b13a5-a413-49e4-3789-08d92037bc2d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3958:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3958DEADDD15507AAC76E890C1249@AM6PR08MB3958.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYw/us7ucWDZgA8Z3kKJv5I5ZxQkl158Ok7vI9hqHEU7vm4ALX5NPdegXehHwyrWVHkrCNssiWkisXgAlPp8EXx3lV1XCApQeR+eXXix1bC0/O4G7oOgNOofee1ApzECu819s3ior9a4pya0vSGVN1WorOS7qDlZ8cYoxl+spsgFKZYka34nC8Vf6EyAzP+6cw3SXXXBwO1AasO131FLaul+0fOSlRYR0MZe/yjebPINtnNf9XD4pQWJvFH0Cw89YrxeBgJ7Gl0Tdm/Z8nos6l5fYN6MCMIMyyPB1cMEbfuYCxL8RTD4dAAxQWNqzUVu9k1pv8MPWpmO/kAbZA0mpAq518BW64gl3xf6Geq1Wv31oI2Sv6tICp7IccIv5H+FY96N5Ls7ifxdClL3RhWmKuFAgeCDAvedGAgOFmEPrn8K3vdp463A90nDlpF8z93zXig2Nb2WXC/O/h7ewao/qenHEEzu7QKzbMXEQmUlccZDFg47bHf47S0kzfRmdZw6b+d1yW4W/NJXeT2r8duVT3Crg5pW/OBpaFsoZfKUn5vkg4cgS+QdhCCT7ml/PtEszspiiRIQbAczMlPwSpULdCSjowGCwE6ZYLMMOH3bzNUBCI3QkRZZtuGq9j14IN66sjBghFyDXB1ZSLHbKw9PbdQuUfZpxU0P1yEC9VIjsQzUbl1fbP1jEJED0Eiz3eYIuOhabZ0qCUhBX7uUfesuOfE7K/Ma15zf38tpQkD8aKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(16576012)(4326008)(31686004)(38350700002)(66556008)(83380400001)(478600001)(316002)(31696002)(8676002)(2616005)(26005)(54906003)(16526019)(8936002)(66946007)(956004)(2906002)(36756003)(86362001)(6486002)(186003)(66476007)(5660300002)(52116002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mm1neVhvMjNscHY1eTRQTlp0a21uRnZPL0JURzlrRjdLeEdLSFRZaU5DdmQ0?=
 =?utf-8?B?YTRCaXNzTUl0YXhjQ0VMTGVrMkpDWU1HaTJwOG8xMVBMVitNV3h6Z2cxS28w?=
 =?utf-8?B?YzNUVTJEblhqQzNEZW05Zjk1VytiSzdybGRVczRNdzNEVXF3a2JvVS9Oc01j?=
 =?utf-8?B?Kzk5OGYwMnpTTDA3QVFZRnVGUExDTnZkZ0w4dVNZZVcrc1RjU3piK2ovcXgx?=
 =?utf-8?B?NXNQNlJ2QVJBNnNNNmh0akt2bHp1MGo5R2VLZnEzdGFiaTQ2MVgzM25LbDJC?=
 =?utf-8?B?VVFEcXZVSVZyVmtGREtlb09FK1RKSXcwNG43d2pFTndiRDViZkJqU0JTSVUw?=
 =?utf-8?B?Yis3UmVaS0JRdUkwTFd6V1JOb3IyaE54ekR5VHRiTmFtU3Z0Yy9lQkpXMGda?=
 =?utf-8?B?VW04WWU4ZXJBcS9tOHo5V25UV2w4c1I4dHU3OVY2WTBlS2wrVGVwaDl5QWMv?=
 =?utf-8?B?Rld2cjBLZm1qWnlubEpJMFlDVFhMWkhMOWFwVFFueHpIbkJPYVd4K3h0d2xG?=
 =?utf-8?B?cU44MDZBRjE4a2RyNUtnOEM3M0drNUh1Q3V5ZFcxRXZ3Y1BGMWpLSEFPWE1F?=
 =?utf-8?B?WHlzbXN1c1VFblYvZlE2YURXZFBOWXFRZVF4aDJ0V0dmOGtOc0xjaTBtWkdM?=
 =?utf-8?B?ZVdJMlhTdG9DelF3UDlNUHNnKzFTM05sWEhWT2VEK2duRldEUE5nYVRRWFVz?=
 =?utf-8?B?ZDdsSjZnbms0SkRaYkRoSGlrZ0NSdnVGTVQvL3FXamxDcE9HblpTci9ab1FT?=
 =?utf-8?B?cElnSVZZbTlTa1l4QWo0bXZLR1VFeUI5c0xienB0RzZtZHN0RlBFZXNqSHB0?=
 =?utf-8?B?RjJiRkxPNEVvUVhKc2YrR2RZTWpHT1FINWJGbTlscHZzSVRCNWZ1dTZ3TjRQ?=
 =?utf-8?B?dzhNRW5UOHRzMnlvZW9paHl6MDJaK0pTZG1pV1dTYzJVSGpzeUhqb1poM0JT?=
 =?utf-8?B?eURPK3VTNHVFdE9DRVB3a3YvTnJ3dTNMN2pVZk5FR1B4NmRjVkMvMFV4OXgz?=
 =?utf-8?B?TlRGUDA3cm0vYkVqczAvdjBhc2l5SVNhaUJVcTFPNnYxWUlmUlZYNXBFYWNl?=
 =?utf-8?B?aXdjRmJJalNSVWVsVytYVHpYNExWY1QwckdVeEErYzNwU2ZnVGhEN2tzbTJP?=
 =?utf-8?B?Mzhlc0FBSkVQZHpmVmdGdWMza1ZSUDY2N2NXVWRmR2FtZkNhdHhSRlVzRUdh?=
 =?utf-8?B?NmkzWTAyZ1IvSGlOaWNqZG1NUzdKdlJvOWs2bG1CRWI1czJ4SUU0OE1CMS9q?=
 =?utf-8?B?cTFrYnUwaXBKTTBWRmYvTUxOYnp6RVErN2VaUktmYWdtdDI3aFprTjI1Q1pP?=
 =?utf-8?B?WkJBTE9kcXNUc0xPMHZuczhldXhqbjZ3dnZ6ZkVkeHlxdXVkYmJKN1pCNnFz?=
 =?utf-8?B?Wmc2bjJ4MG9DVFNXamRMcENYZDZ6U3g0QUNoWVR2a2QxcFVTWTY2T0h2N28r?=
 =?utf-8?B?eUd6ZldzV2t3dXlCcExMNWhJMXFCLzZpNmlHWUowUXdZY2ZmNlBqbnY1TU5D?=
 =?utf-8?B?QmV6S0lyZkF0ZUFKcW1Lbjl0V0k5RjMrWG9XQXh2SHNXb2tUVU8zSGRBaGtP?=
 =?utf-8?B?RW5RMk1NZjNqOUxQR3NiUFlwVDRZWVN2Y3FFbCt6Z05uVVcyaXFPaHoySmcz?=
 =?utf-8?B?bDVoVlQrVUc4N3BYTWp6NE5Zc3NqYWwxeEFoaktiVGJzeUxLS1o5dldYT1F6?=
 =?utf-8?B?ZmF5N3ZlOUpzL1ZqempvcEx3dWtrZ2MrL1VGQWVhMjBRNW05RDlMMTB4aktU?=
 =?utf-8?Q?TyeL0gayLOf+TgWz4o6XrAPk0D1gA4jRzc4wy2m?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b26b13a5-a413-49e4-3789-08d92037bc2d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 11:16:40.4196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7CGnxbUYkh0NUVgI7ogNDVlr3sgVatznE2sBqIDNuWh3MX57W59CZpjJv0BKKLhOw8K0McoByvlaCbJzQqGxCvpzVs5XjD6bWb3TCOrvOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3958
Received-SPF: pass client-ip=40.107.4.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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


in subject: s/QEMUQtestmachine/QEMUQtestMachine

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> Reviewed-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Usually, r-b lines are placed below s-o-b line.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   python/qemu/qtest.py | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
> index afea210d9d..e6a8fb5984 100644
> --- a/python/qemu/qtest.py
> +++ b/python/qemu/qtest.py
> @@ -111,6 +111,7 @@ class QEMUQtestMachine(QEMUMachine):
>       def __init__(self,
>                    binary: str,
>                    args: Sequence[str] = (),
> +                 wrapper: Sequence[str] = (),
>                    name: Optional[str] = None,
>                    test_dir: str = "/var/tmp",
>                    socket_scm_helper: Optional[str] = None,
> @@ -120,7 +121,8 @@ def __init__(self,
>               name = "qemu-%d" % os.getpid()
>           if sock_dir is None:
>               sock_dir = test_dir
> -        super().__init__(binary, args, name=name, test_dir=test_dir,
> +        super().__init__(binary, args, wrapper=wrapper, name=name,
> +                         test_dir=test_dir,
>                            socket_scm_helper=socket_scm_helper,
>                            sock_dir=sock_dir, qmp_timer=qmp_timer)
>           self._qtest: Optional[QEMUQtestProtocol] = None
> 


-- 
Best regards,
Vladimir

