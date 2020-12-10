Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB92D58A6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 11:57:32 +0100 (CET)
Received: from localhost ([::1]:49910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJdb-00073D-CO
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 05:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knJc2-0005zF-BT; Thu, 10 Dec 2020 05:55:54 -0500
Received: from mail-eopbgr50114.outbound.protection.outlook.com
 ([40.107.5.114]:30848 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knJbx-0005ly-5R; Thu, 10 Dec 2020 05:55:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clx6/vPDqfcrCgvSiKdD8NF3NZampZ/mS1UGedJNTu9EW6fd578Ars4b6rhH5FDaIUGYb8lUVd2htkK/5Sj5BChKwLbqVqu4g5gDbYNMHE/aU6wzQ3NAme6nfOiKDdIXN1LBqVn94i99FgxPa9ninCw9DovpcChtinBo8neYkksqOpi6+C43TEpfRVH8pPN9ap4ZdwFyuzeuJBq/JgbnwQLKPW64lmPHnK8SBpv/CKX3fLTDcwfLKPg8VdK6LhbE4VD2+jjI/AMSD0/goriC9r4DO2V/rWIPTIqwEMTXedoTKq6aMwD+xbjL29oaAkNUBgnI3VSyNla50EjngIEfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVFQbTQwrUfaoCS2eLhQkOa12AeglmFxuEkyuzxnIac=;
 b=irbiklo0cpXuRAwhITNP7g0ehCQ2vhBqrrAgUG6OGgx8WENVtgIGEmZrwIpv0d3qZWTNORy8Qq8Aw3ib2IN0PjMCtKA7Rk/IeAPdGNA64uGslNQRmPlitFdHEDzfAHkyLzwWSZU0ILy3/cGJoUm33NH8Afq/CqKH9mrlk87eCTRUZFCqDvTLpJntAa05lkU6ZRPGlcLGOOLTM2LeylLXxd/CH6Q9De/3waLOvzP7Iu/JFjrtHG0w6XSqT70U+l27pcmaXr8nE2zHDlozRFhKo6n+m2a+4Sz1NTnXiL686Dvyy7yefOF3cpBonQD9nfQZJlewVe5TABbm+921fX7eYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVFQbTQwrUfaoCS2eLhQkOa12AeglmFxuEkyuzxnIac=;
 b=eup5alA153kzcnM6QIXRGqQoDLxmhCHFu0MznDYjXKujFU1RVY1sM6Yz0oPeeUguVYtYEwrmpSLOfX3MyjiuZVt5Yp3qbki3scqfidQnPQDsUYKT9vygOfd/lfeMb0Y2Ep3j0coW3XNCEyxyPmn1znSBlFhG8MnuYAhGdhmAyrc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 10:55:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 10:55:45 +0000
Subject: Re: [PATCH v5 3/4] crypto: luks: use bdrv_co_delete_file_noerr
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201209203326.879381-1-mlevitsk@redhat.com>
 <20201209203326.879381-4-mlevitsk@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <84fc0e9b-2101-c5ef-3afd-1f4799c1cc58@virtuozzo.com>
Date: Thu, 10 Dec 2020 13:55:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201209203326.879381-4-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR02CA0219.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR02CA0219.eurprd02.prod.outlook.com (2603:10a6:20b:28f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23 via Frontend
 Transport; Thu, 10 Dec 2020 10:55:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 735520d6-dee2-4c9f-d76a-08d89cfa2561
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45369162C77996929D07BF52C1CB0@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YLu6UfHCi/5kHdVVeOmVd20zD2A/cfxahAR+KVxO3rfjjs1QXk77tna05dijIOPcL+F5m8cWRy6/5YoO1ClOCbYEQWkoktk40oKvUDHVNaK2FkDpcIAnFz7/WFg1h2KccDeaclKavytUQIu0qz8IaUHJ4jGV4HN65oqLY5fGTU/KKORjByod2eWXVG+8X7yL64nswPsaRTSKEcJz6nQatDTOI/9dxwjpo3DKaFTflVo3Vib7Ftxza0W7ojkwjA0mq+wSPNuZWRDEUQIqZWv02mxSOyPZhsU4Bt4qqyNCxmU+ntePXeGDNstSQQCXGv3/jKBxePIizFxk4bpeyVxy8r3KQGg2smYjK2NYlT2AYOvnHZ2J423PJlmhA3MnYOecWlvce8VAov7Ble6k5QXXWffyfenNmc4e9EmQqxwRO/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39830400003)(136003)(376002)(54906003)(2616005)(86362001)(16576012)(5660300002)(66476007)(66946007)(4326008)(956004)(66556008)(26005)(31696002)(52116002)(558084003)(36756003)(8676002)(478600001)(31686004)(6486002)(316002)(186003)(8936002)(16526019)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TnZpNFpCS3JKZVlIRTlVbjIxd1N3SDFEZitRU1pCWVZ1cElDcFVnWXdkNlJM?=
 =?utf-8?B?Y2s0MVowTGREc3RkTkF4TnJ0OFpFN25pcXZwdXBia1ExMkVXcGJ1Nnk5Z2l6?=
 =?utf-8?B?d0lxZ0pNRzdkeFk2bFFLUUJsSWRCZ0w0QVB3YTFlTE5vZnRTQzEvRk1TbGVQ?=
 =?utf-8?B?WlRBOHFhLzBsaEZyVktsSDdiOXdsbFBpbldxQ2J5OUVQVDZZUlBUQTNXM2ll?=
 =?utf-8?B?S1JsZzBxTXdaTFlwV3kvaUd0WG8rUldOQWlCbzdkUTh1bXJvbEdrZUd3ckxj?=
 =?utf-8?B?TkFWWFp1dHF3bGNGaUhaOEgyNVI1dTZJcHdEK3lhcU95S1AwVkNWeGNkRW5k?=
 =?utf-8?B?MUNTeGlUYUFicFFsOXFub3Q4VWQ2YXhxT3J4b0xNZjE2aTc2Q0o4NjVWU2RV?=
 =?utf-8?B?TE4xVC8yYjRYclJkcGplQXpEY29XWUpLWmxhNVQvU1U3QkRTRTRXR3BCZzYv?=
 =?utf-8?B?SlNNUWZiaDNzYXpKRExmQVBzMVl6T0tWODRyTDlhYS9mUzc1djZMdjVMeXJy?=
 =?utf-8?B?VDYwUkszVnNqN0ZPTVN3U0ZSYmZtcElJV1VBWi9TVHdxYncrNk5LTlNEWXhz?=
 =?utf-8?B?bkRidmFENklZZ2RBejh2Nk8rZHE2aytEWGExWXUvY1RHSWdWU1VpSUk4NXBU?=
 =?utf-8?B?OGlRTG9YVk9xTDhHVWprSGswT042TzdadHFrenEwUkZreXZ2UFdtL1I3SWt6?=
 =?utf-8?B?TWEyMzBtckhqdVQ4Z3orcGVXM0JzZEZQZzRVV0FvSzhlaGlwa044dmdsbmFu?=
 =?utf-8?B?ZGVnRlA3M3QrRHNMS3pYaUFDdkFWU0JpSW9PMkZ5dTBnSXg3N3NtdTBDWjJM?=
 =?utf-8?B?dVArYk5sQXFGbFpXajlpVnprRXRNZk4rQ1B6TkVLSkp3bENQZFBrSUFqVzZP?=
 =?utf-8?B?cHA2LzZxTVZHclY3czhVeUpjRDZNRHB2bWFHZVlXYW01RXpBMDc1a2IwUlhq?=
 =?utf-8?B?V3AwVGpqM0lqdFVjZG5SN0txeU9PRGRaTDYrNC9nK3NoQk1NSmVscGZrL3dq?=
 =?utf-8?B?N0tOeGRDY2tiTGxxbTBoRWlEcVRPZS9DSDIrbVVXTm8rUmVNUFNxQlQ5YWE3?=
 =?utf-8?B?SXh5cWtncE9sTVJMN0srTDJZRVFscWovcHpRb3czUllLcDVHVVhJYlo4K2tQ?=
 =?utf-8?B?ZWtkM0hMU0JzMmhDOHUwQ0NhSDQrZjF3RzFPS2I4Y0Ryb3NBWld6Si8yYTMr?=
 =?utf-8?B?YTl2UmYwUGxWeHoxb2VZR21NaWQ5NjNscVpBb29yNnR4S1lKRXI5bGhZcE5C?=
 =?utf-8?B?cUgxZUNBOE1DWkZvWWZWYWdBSkdjTG5GRitaWEJCMzJiMm5vR2p3WWRsY1VI?=
 =?utf-8?Q?84dbkojHU5mAcvEdOECSN9UE1TbafxKAg3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 10:55:45.4815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 735520d6-dee2-4c9f-d76a-08d89cfa2561
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvA8RPEtat7DSDTfk5HzOil5qtQ9iVx60VtqWF8vHDP6vNzCVRdN1hXBkI36fV5qwNfzNBUccrTzjOJP7y0zmbci5uJCpwKFSA5xVwMtOrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.5.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.12.2020 23:33, Maxim Levitsky wrote:
> This refactoring is now possible thanks to this function.
> 
> Signed-off-by: Maxim Levitsky<mlevitsk@redhat.com>
> Reviewed-by: Alberto Garcia<berto@igalia.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

