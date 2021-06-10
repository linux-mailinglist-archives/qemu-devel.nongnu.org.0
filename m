Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313683A2B4F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:17:51 +0200 (CEST)
Received: from localhost ([::1]:43032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJd8-0005a9-8L
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJaV-000474-DD; Thu, 10 Jun 2021 08:15:07 -0400
Received: from mail-eopbgr140134.outbound.protection.outlook.com
 ([40.107.14.134]:50758 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJaS-0001zG-CD; Thu, 10 Jun 2021 08:15:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJA6UtYbDp4mbm6xxAq8Vw01dahykR1LN2WJFF56xaBT2YsbAeeUOuKwKYFKTaGFJCgHSt6p+Q5+kWlCVYlgqUzSUlrFcWu2FqtwIm19+zU2dI6LBUiF/USuyWZvMIkvGWsG7f8nWJxh/GOo7npysPakcEKA05RW8JOWeyFVCJGuXuqLNIo85PL0BEQ2fweC0solb685GUkucSPgwJWvZY08XnbACOl5WT+vpmQAtTHh4CDJ2DhXEKDHERxXXMw4f8H2L9DEOjGdPZhkU4WwaIKpRNBfKcpuv0M4mMU5Q7uPB/2qVLEe7nXfJDmB8B8E2532OiB0CWIZUqv3BaTFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsME2Tm6bVfi91BwOE6z7q3lVodX0JskagFaml2T7WY=;
 b=eZ9gFWaiMRF97QL7SL/SS+Ztajt2rhts9g6aQPF88QEK9CCkT7IhHE7MMeZxOlUtBbP/Rt+Xt/Q76CB53mx78s5tCBz8Tz+V6MiL6YmWzMQ3oQp5gd2lLRl5q3M38aaac6K2lIemmzzVUNAFLGfltzgdWKc1oYXxsc3ZEE5PfGRWI7hlb+a/XCGiCvIoNiUNZXUtz1NVZfDjI4jmkGGG9qFIRv1LQ8vdGjJik/iPbKTocdnHJ5xH31A9s22+NJzrt0uJP7ZkIjztSysSGDMX3LmzSPN4uPNaAepNso3oXAm4KP2LQBsL87C74o6kb1Grse8Vu7dr1M464bQz1t2VHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsME2Tm6bVfi91BwOE6z7q3lVodX0JskagFaml2T7WY=;
 b=Tiu58Ny1mN0/aQl9M9YLn/EY8kwYHJuAkc8M70B9nhmgJQGdhk4HUj0sGk++TkO/6JhRFZ4JWUXQpp9MlEzYuN2+fT6pekwXvDFvmjDb/GxSyhRTHM5a5G+D7//zbwA5zta1vbsQF1Xxi5SGs4FllY/+MRwL7itFlldTxmKQrik=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3285.eurprd08.prod.outlook.com (2603:10a6:209:4b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 12:15:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:15:01 +0000
Subject: Re: [PATCH 1/2] iotests: Improve and rename test 309 to
 nbd-qemu-allocation
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nsoffer@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-2-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d33500a2-e0bf-204c-ed91-4ccd2e39a346@virtuozzo.com>
Date: Thu, 10 Jun 2021 15:14:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210609180118.1003774-2-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 12:15:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb980d70-b1cb-4145-a21a-08d92c095ef5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3285:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3285106E2C0B248467DC460FC1359@AM6PR08MB3285.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWx4fjKwOk5/5fuhttwjc0tGlrt1c5HL79TQLgRIRRiUrYi4xJcDV8W7JFaXO0RRlbHubfJyygfyswN4yMY3QzKt6Od0yfMZo1zJPoKuwUuFPoLIja71KCdPYPyh5MrQAcEQVPc0fbdp+N1V1YGKaE2ngRYxeMs+oJIgb6zn8ONG9U0JFnT/fsJ2vStWk0afTqQ7DyE6kN5A4bHUbopVh8UMi2gbX8ZvRAcvj677MTwq33y/k7ANKjogp185iznJ2Z5tlHDKdQkYUaqDZ80npaErDL3hrdUoV6nrrXQS0J6DeMM7i65EQ3DZ0vL4WiPXO6ohgCxcYhVChkrAd2E2lTUmjIKwmr0CyMAHLHH9qcHjNc+MvzB6h8cwSBudAk/0JSBdr/Z8Rxw71cMTrPTf5Tmuzhdwkxlk1zY0RnZB6aozd3Rd7q/QPGUR19/uVWaZFVrHG0YMK+PZM9wVKvaMyx2myO47zOBt4W82rQpBIInRQo+T+DN7OIi1iJAj4l/AjmITd799n8u5y7UV0zjnwFpSgJ7KsgUXQeY49SbXwyZ8Ql+Krg6zfHYKVJyr43K01xTUvl1CzALuTwAABJ0V8bGRY7rZLtapfZP2QwJiYnpDhp4332OWLGPr4LYXxKvgwlBiUiZkU0glWTFOky3Gnhd0xjd6B7rIOXBCQLAtWesgXmtRtXyc9M3gSiesJKYwId7lJsfQ5Lgr/bH/N0bJOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39830400003)(54906003)(316002)(186003)(16576012)(36756003)(4744005)(26005)(4326008)(66556008)(66476007)(31696002)(16526019)(478600001)(66946007)(52116002)(38100700002)(38350700002)(5660300002)(8676002)(8936002)(86362001)(6486002)(31686004)(2906002)(2616005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ykh5eHFmVmRENERSdllwOEptbWs5UzN2Z3FjekJGZ3Q2MklVWFNRTDlxOEtk?=
 =?utf-8?B?Z1NFUE0vT0t4UHNaT2VaWjlQOUhBSHEybmNubVhvSEh5NER5b3J2M0dmWUhz?=
 =?utf-8?B?bGZ0Rk1kb3NaSFNJU1hackErT1FieXRFaWs2VElGVDVzdE5uZzMvQnlYdUVI?=
 =?utf-8?B?K2h3SUNmcmtha2V1SFhkTSsvdEVLUE9WL1dBZ2Z1aEpKdFd3MVNpMlNleVFO?=
 =?utf-8?B?a0s0MGZxUUxyTFhoVnM1eEtYcU1leklFZmFhZDVJOGs2RzB3VU44cW1GWkow?=
 =?utf-8?B?YmwzS1ZZSTB1bnJrZXlNenVJUkpSZGZ5cXppV3EvYnFremJKNW51RGQ1MGdk?=
 =?utf-8?B?YkJDcEduQTJIZzF2QVM0U1JZR08wUVVxc1VzSmNyV1pZRVJJcHY1VVNSeWda?=
 =?utf-8?B?RnpEL09OTDV2dEx2dGdFNk4vTHc0VTNGOTJMa0tNWlY2aUNDYkd1MjRFcUg5?=
 =?utf-8?B?c2xqRzdEcnI0Q3BTWENTUjJDaHFIMnRUTk5aS0o5ZUhUQ0w4Q2x1WC8yTWky?=
 =?utf-8?B?d1U2THdhTHl0ZjB6V1N1cVNmRG1wcDUrZmRGZ0hodVpHdWZPRFc4aWxBVzFV?=
 =?utf-8?B?ZWZRaE1uSmo2TWN4clVXOUZ3ZTBNQWVsZ3JVbmxFYjNQcGdXWXhLSm5ZNWNN?=
 =?utf-8?B?V3kxbDVxRDA1cGVHdUJsdHhHbUdhNEc0bks3T0plL0NFUTZ6Yi96R3lPNXN1?=
 =?utf-8?B?Y1Ztc3ZqRGdaZUFIc1U4L2pGWVRkRk05SXdqK3NZM3RhblNkeDJpVlMyV1pW?=
 =?utf-8?B?U2dRTmdIaEZRWXpVK0Q2eXBTTmd3d0FpZ29JMnpZUWhpODh1RDY1Q093SFhL?=
 =?utf-8?B?bWs4ZDhZcVYrbCtIVkpwc2ZsQy8zbVQ0T3hIMEFQNEh3T0FDNmNvNGQxZHhE?=
 =?utf-8?B?OHo2UGVpUHRQSTlpY1NmZ1hBTmxnQkdjQ0VpMXplWCtZVDJrVk9kaWVNdFd6?=
 =?utf-8?B?NG1rUyszZFdXQnlSd25veGk4TUpRN2U2MFJ0R0FVVEx1cWJ5NmZnRW9GZWRp?=
 =?utf-8?B?NVM4eUExZGF6cVRyeEh1RmgwVTNVdWp5eFAvcFVabGxzYWp5eStVT1VaK3Zx?=
 =?utf-8?B?ZjFDamZIZHNDQWpoTmRaaFpDVTQ0UTloUkJwc080MnY3OU9idUoySkhLUlZq?=
 =?utf-8?B?T0tJd3NOMDdCbHAyZldtNHlmMEJsSTMwbHJEREF4Y3B0M0s0enpkZGFIc0JN?=
 =?utf-8?B?WTBmWFJsTFkzWDYxWngvMk1YaXFqN1NWTzUyRlZNYTNpU0VwT3lFMFdSL092?=
 =?utf-8?B?V1pZYWtDVTRyRGRWRUdIWlZmMzhzQUJwdFhpbFpoT2tQa0p4UklnZnBWZU5Y?=
 =?utf-8?B?SzF6T0t0ckhJR055Vm0rYWxuaXJKL0M0U054Z1AvKzFLOVRkRlQvN1dPV1Iv?=
 =?utf-8?B?czBVU0NlM0hneE9aV3BCVldsL1pQR05mMW9aVnJBREtxa0g2d0hIUlJBbEtt?=
 =?utf-8?B?M2toWERKc281S2R0VDJ6WGZZQ0U0QS9mcDVuVzl4c2dxaytDbGVEd1ZRdUNu?=
 =?utf-8?B?ODNrZ3Vhck1sdjNjanlTcmlZOG5zVWEvWThWWHk3bmJLY2o1SUpWV1BkS2hU?=
 =?utf-8?B?Y3YzcmN1ZTliLzF5bEZ2eVc3cGlFQ3YycWk4RTBmZFpHZkhLOG1QT0pXcXcv?=
 =?utf-8?B?bmpmQ254VW54T0crTDJVcXJwdGxtTUlNeWJ0NysrcXd6TEo4ejdmZjUvMnd3?=
 =?utf-8?B?Y3p4RlRiUElDSERqQi9WRml0YXhZZm5sSC9oMnlWU2xNVDdlcFhkUW42Uy9V?=
 =?utf-8?Q?/FYT0+oxv+MVnXy0ZBZXJhXUzMsElt956SHWJL2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb980d70-b1cb-4145-a21a-08d92c095ef5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:15:01.0762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtCLVkc6jUmdMnVJD6j2pCm2bxDrwRJCIEMa3gahIzwnCENUKfkzNVs+oQr3tsayjm7LVM8fs+bGX2mRKhMkV6nVPDyIlfRjtGdSKXM1fSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3285
Received-SPF: pass client-ip=40.107.14.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

09.06.2021 21:01, Eric Blake wrote:
> Enhance the test to inspect what qemu-nbd is advertising during
> handshake, and rename it now that we support useful iotest names.
> 
> Signed-off-by: Eric Blake<eblake@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

