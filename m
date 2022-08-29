Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1995A471D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:28:08 +0200 (CEST)
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbzz-0005jc-MW
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSbkU-0008Rh-9K; Mon, 29 Aug 2022 06:12:06 -0400
Received: from mail-eopbgr80121.outbound.protection.outlook.com
 ([40.107.8.121]:23270 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSbkP-0005si-1a; Mon, 29 Aug 2022 06:12:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTs2C3NonJihdvFs/M+zUtjKdyhhK1EK0CDnD9j0ChBwEH2E50VCYObym3Wb0vx1jVkY0UgejD48Y4lbAwgT2PsKL7O4EpPIYscpc9IrJ2nL+y9zU3RWYD8H8YencP69Rpu4QfNCWeHuXuv8nmlAksMK3xCGilnurEyQHu1KDEQymql9e5oZnq6944OLIsxLe9o5Apwi3OO1s9IQfW+MyWkThpI4/ob3EAKlN/drzZDLSKkttcfXx6iFk0G5a3Ti9we9UjOY4QQXz/ZlKrq9yJ20gHwQ/6dqunfTjx9h6kwah4ZuYyTcSotJB1Bekl1wl+WDM3pjgc2hkj+j5hUbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJs9EseRtCl1GSbjQIHkU5aifh7UZtfw8VMMkoraSPg=;
 b=ST6wkZODfwU84Cg/fiAiPkGvGfYls5MXeDsPjfIrpfboSGbFNLdxkSBxoiivWVIGOpmSVmqDkFT0o0hCyX5qWbGIhrts4b6hjzInrl/bYlO8C3CKqLCAn34aDFnojIvlJF6QFNa73A/WKe8E2gTnCR3GB7U9zgYdqFIaBo7ywiqJ7FkQhWVd9z0Y3oXENm1ZFF0c7NqL0Q0jh1qw4CiLsJ7F1fl6xYdcbSQj8O+3uo9XvPP4a1qgT3FVgEui7h5FU1TUNUlDSqLQRVfbHHJz8YelwLNf0SGDa/u4IInfEHlttHmRV22oKCNz8bd8hyh/dobNQHjhP6YbpqMQ1A3jHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJs9EseRtCl1GSbjQIHkU5aifh7UZtfw8VMMkoraSPg=;
 b=CsXsXFyiCNUSB8GefC1MmITh9DaLC4/vL29ga7bmfQmlUGztuxOqRHfDO38bI5HrBxxqJGn+UlcCZNgor1vgIqCcx3rLy4105r9D+FaTyvNjsGQ+dBkwSwjn25WdMoMnUo52uxdX+bw6yLp+B5Y+ItSMxOU1SJrMWrLHH023Lc4GVE0eAxCGVKyIkRBQKxpXJ4KqIVU5+HlTL0czq6NnCuPwKfzLS0bDxrgC4lcBhUuWujazrt8UHnv2HoGuHyxmBjnRemki16V+DyFPjkxf+nu6cuur5tyZRopskJZE6Jb1E34IuOFqykd/cngvDYXGLi/et2KTgANBalftbDg2tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB3023.eurprd08.prod.outlook.com (2603:10a6:803:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:11:55 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:11:55 +0000
Message-ID: <003a16d7-8298-1a16-6ddc-f980a7b8f302@virtuozzo.com>
Date: Mon, 29 Aug 2022 12:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 02/10] parallels: Fix high_off calculation in
 parallels_co_check()
Content-Language: en-US
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2bbf13a-a3a0-44d5-1a25-08da89a6e678
X-MS-TrafficTypeDiagnostic: VI1PR08MB3023:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s6do449nZhoRM58M2ofQbjiqpHnmjUiD5AUOUXvCzr2aMSi+ayBc1qeC/yioJcH3s8yfFQ9OwUAOQdWnh3vYhV3Q34GzG5ypfV9VAg9g+7M/lqZkAjZzEHXAYN992vZUS8aP08JZZ1lf06LvQ1Wwy+SnEIJzmiWPXxoll0mf5E7yg6mdlwe7+8UFTz3MXyOqK6QXaiw67o9iJrdmpQZyAoHM48D3CuKBFbK6KCEm8AhW2v69UCwJztvZ5L8EYft7i/n/napmH6fUau6DaGyxD/cmxoMnzLaFc+tyDrIThnqhan3ABa2pO09IaEUO/svQB7LRtri277ImU08MLAXX7MptG9lKK093cqphGgYmgzi76Ll/gYgQYCG6yoTUplM860IszuiUYscyX5YudIsU/rap1NCUjA2sXXuCpxvQhvH52/VI9QByJ/xmfg7Eo99NNIMfExRpoZw240hqE+JLeq8ZlwGEW5uL+Z6ZU8jjChw50X0CAsVs4CMgyXvQl44PsoeND9Tt2nHkektZ5cHtAkv2rKKLfJNbJpbqhQn5gyVyWBfW+WjP8+XV29uX1DRotdFsJquWIRhUqt07Puh7vjp21lzWWKnmoxznTSTGf9qHF8sinBcoOQ+XnqoazsblWmJJYyYdkEdbZqvo5KGLYrTzuVOIPc10rWA9nUiNxuRFYBbDkx8Fslf1gynQWFg6GiYmwHf6Gw1UOGF58Fkeq2XqFplCTXsEhHwSfDIl8tSTD1J7HA7aE26eUiwkiEBsl9Wt5vIampk/T34k9WRaROiSH6mnKC2oDt7tN/m4CmqMwB7tXitZ4ICuekpAKt28kZs3tbvD6AL/Swvo2bw8+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39840400004)(346002)(136003)(376002)(31696002)(86362001)(186003)(2616005)(38350700002)(44832011)(38100700002)(5660300002)(36756003)(19618925003)(66946007)(4326008)(8676002)(66476007)(66556008)(31686004)(8936002)(2906002)(4270600006)(478600001)(41300700001)(6486002)(6512007)(6506007)(52116002)(26005)(558084003)(316002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmowdnB4clgzb0w2TFFyMHFZZDc0eU52WDBKcnpKQm0vbFZETjlQZTRIUEZn?=
 =?utf-8?B?ZUM5eWVGN0lEeXNEbkpJZ20zalpqbEhnYlFmWmh1SDRLaHI4WDl2bSsxSHY4?=
 =?utf-8?B?R25kbXBzcWsrS01Eck5CeU1QS2pSVnRBRGZxdFc3c21QVzdVcVhOVGV2K1FF?=
 =?utf-8?B?amkxNnZ1czBHd2pNSnhqMXFiMFJidFJJcEtSa3Vub0NJNGhzNDMyYmV5OUZ4?=
 =?utf-8?B?UGU3bkVwL0hWeTJCUExMTkk2eUlxa1phcU50Ymt0UVNOekVEbWhhNWJ2NlJZ?=
 =?utf-8?B?UWFTRWdDeFdFMUZ5TDEwb1dhTHdCbzV4bmRTUHl0MURLSXAvUldGNlJ4dGNY?=
 =?utf-8?B?SUM2Q0NNYmFheEJ4a0FMZFFBcGo3bVpKcFdRN01iOGlQRXFjK3FTTHhHbnYw?=
 =?utf-8?B?dGdZTHdmK3VGQUczWktSQUNGeVFQZUdTUWZmMzVBMXlNejdELzVIejFzNlVL?=
 =?utf-8?B?TWhJWlBTRzkxM3FUekVvTGU4bUhPRW9sS1FjbkY3QTBaQUlEV0ZBUFhxSEpN?=
 =?utf-8?B?SWczV05RamJ2VWJhN1EwZlVNU0xZb3JJTWFqSiswYzRTeTVOMlVSTndiSGxn?=
 =?utf-8?B?cTM3ZmkranlkVHNBdXhQZEwzUE1DUFFoZTUwckc1TjRXT2ZFRHhybU5KUXhM?=
 =?utf-8?B?VGw4UFk1M29YckhrV1NkT0FiYjYyUFE1VnJmODdpZ0FLV01LQXF6akNDRzJi?=
 =?utf-8?B?cXJ1b2JCcVpGcnRPMzVoMVdwRURRaWhpSFgyQURtMElHMVFlV05rOUpzRFFz?=
 =?utf-8?B?bTRaWXVnNkF5VS9KZWVVY2MrYXhzMWlTSDBkZUUva0ZLMWtEN3F2VWdKR1hW?=
 =?utf-8?B?UHJBRW5kcW9BdE5mVDRGMkphZWhvSzBZWTlSZTJRTzFXVXU3SGNMM1laaTJB?=
 =?utf-8?B?aTRCbEdXTk5wQ3dLOGc0WVIybkFwTzRORWpuMkNUSHh5R0xYblVkVGN3dkFj?=
 =?utf-8?B?aHJ0OUYxMUZKUzhrZkRlUFZFeGlzS0Q0RmxZQm1pUVd2bXpZMkZTbytsNW1J?=
 =?utf-8?B?K0JkSkVnUDBHL3BZci9mNmhVSjFxeFNoZ3JVclhvNit6QlJVeUNMMzhDVzdE?=
 =?utf-8?B?ZmpjOXZseW9MajZhdjJaZC96aGVSRWpaTFRkZGJLeklnUnZ1dzlDb1FIM0FR?=
 =?utf-8?B?b2dqWVV5TzlaNnJyRXBiTmFCRFhvQnZZS3dabmxSVUlRb1kwK2Y3SG9VOTlL?=
 =?utf-8?B?Q2JsTVRYN1FoaDIzSmh0aTkraGJiYjJ0Z21ra2cwY2tBNGdQR3NLeHJWdXFV?=
 =?utf-8?B?WGZVMW1Qdjk4WVVLYVVTZWJtdW0xNmNWd1c2SFVDb0UxMkdPWUhZeGJDUzM2?=
 =?utf-8?B?b1c1S2Z1TEswcTFFWlZhdXBnN0pnaUFROG9tUThLVVRxYk9DZG9KbGZrMkc3?=
 =?utf-8?B?WFBPQ1drcjE4N3I1THQ1WFZCVWFoZHVNQ1JTZHgxdU45bEZOMlJMdUtXWnR1?=
 =?utf-8?B?WEM3UmJTeVRIQS9ZOExSYVFyNldnN2lHMjlqVkpBWWVvbVRrRVNqMTBTS2lt?=
 =?utf-8?B?bmJWTnhzZ2VzbC9vYktrclRkZWtkSk9sYzJINTB1UEpZdUNrU041V2laWVpj?=
 =?utf-8?B?OWplSFZRM3ZBV3RHOU5RY0pOY3ZRSElmdXprUGpOMy90VTJ6SEtPcFV3cVVF?=
 =?utf-8?B?cXJjOE94cC9NMkVmQjE2dzBnVjhhTVhMUk5HdVpndjVoZWpDWkJFYU56c1Va?=
 =?utf-8?B?N1puZml3V1JBYTkvQy9YZjZ2ODNXaVBjVnBZbmtJRy82OEJqRm9ZenVyL2N6?=
 =?utf-8?B?aGNPTnREcHdzSms4Y2ZleU1SK2U1YUl3VEtBa0U4NldNYVIzUzlKSnZnRVRH?=
 =?utf-8?B?OW1BQkZTTGhkZnoyc29IOVVkcVFGSFExckw3NzdCLzc1ZCszK01vMENaWTVr?=
 =?utf-8?B?Q3BtckNEcGhkM0hKQUw5Z0orRDNWWVJ5ejk4UEVQKzFETHo2TVpESXc4eDVo?=
 =?utf-8?B?NGFqVGlSSXdla2RlQkFKM0FKa0E0cEdUZS9DamwvYXhzL1VENi9lS1Qvc21i?=
 =?utf-8?B?QVBFWWN3cU9SRnZCbHlWeUhEMWpkZThmZmhGblNTZmVnQWw3RlZwU0hFbFVr?=
 =?utf-8?B?L0Y3OUxzNFRpNmVGUExSaHFvNUlaRlRwR3NSYnBjSmZDd25DMzU4dVBTcHRn?=
 =?utf-8?B?WkJ1MXd2R1Bwbi9tbzdqUHRRc3FocVhFbkZMcFhxYmd0Lzl1UXdGU3d4WEt6?=
 =?utf-8?Q?O7I5/81qFrSYIpRtDPfpZlo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bbf13a-a3a0-44d5-1a25-08da89a6e678
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:11:55.2728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYy+f4VCUsfVlItWnfH2nUnAi2tgirfbDYKxilzxnsfJOVLRyDRPin9xtmmbOUZaNgkVlggOW6VxkMaGEGq/K2DeYxG9cRrGDR731vr/UGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3023
Received-SPF: pass client-ip=40.107.8.121;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Please ignore the patches in this branch.

