Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F9378120
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:20:41 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg31k-0001Az-BV
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg30o-0000Va-9T
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:19:42 -0400
Received: from mail-eopbgr140112.outbound.protection.outlook.com
 ([40.107.14.112]:54050 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg30m-0002iY-Oh
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:19:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXKa8rqe4pPt1UD6hZ75TGU3t7UNut92ze7iv6GKlCRqJnukD309reuMZxYjrSp4atC9H+yTozKBSLT6FZJ8Svoi0SjnD18dGC8iRRiuuOzr0RDonsQNE7Mnj0HLdMJVRYjGWcXU1IQER1Glvxo1xr0qosXtzSQOqXF2caItPQKdPC0whsssy6mTs2DGI1S7cu/ze+lBjZQnYjPETxU7ETwhKFSSWgWfU0AcchqOLgepth9FIrAdyF+JdfMuF6/yNBg1vDgTfSjlXx6ChOh4kbR3OLBeiAzsLn8cq5qKZyi+BOAxj7CVXEwbD5zSNy2celzFD7z3Pa8f17SvgGLcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0e104lfnUp+ccCjIP898FhjXoCK4vibpnb7HZKzIYww=;
 b=n93y11OIIdhj6o561jdyxnFGzpw6lJpK8bDhl02I7y4WZ5tujdV8WN5xS+58PSMfGRr4BJ5MRkuq4Ai0BG1C+HQlw4f7dxQZyJZxal5tZGZdaHRRfvR2kKgL34dEMxLGuUCBmFha+K6U8SPImSZ2yREC34LQ4ssv6zF+6fL8wMrbgJX4Qi3Sp0xofAT/3GTbgfUXpXZ9T2feWgbJm3/9zvrtPHNBKe8JcF6dt4DbEPfTKgkX8zPHtM8oYPNLtfaKmM8cF1IO0/1+J0im7x+w1zFNOAHc/ol7VwdHJHFLH6BJCwMLXPobmgNNd945MzGjXi3kyku3juasyA+PhspjJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0e104lfnUp+ccCjIP898FhjXoCK4vibpnb7HZKzIYww=;
 b=lXPzBH9WA5hP4PCdbH7BEe2PH9o9cmx/GTDmuDteQjI3ltuW8DKimNEdoQppk93o+2APmyODh3kLZlDHZEKuCybi57k5JJw3uSDGbGGw7sq9PVsqOQz1GgBQ+Uo4G1gJ5BwJFtAZQ+BpeElpwHGL9KWJOex9pzXbdg7dV7nzJIU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Mon, 10 May
 2021 10:19:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 10:19:34 +0000
Subject: Re: [PATCH 4/6] coroutine-sleep: move timer out of QemuCoSleepState
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com
References: <20210503112550.478521-1-pbonzini@redhat.com>
 <20210503112550.478521-5-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <479fda93-0750-676b-a5fd-85f977ad222b@virtuozzo.com>
Date: Mon, 10 May 2021 13:19:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210503112550.478521-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM3PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:207::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM3PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:207::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 10 May 2021 10:19:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77eac785-b922-4c57-3a2e-08d9139d1bd3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6053421DB99EED24389A364CC1549@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dovCeADHqX1Nku+d0p6fYpTZxLwmmPFdAQ6XQCeY8J8eurmtTRpaEn+coNVSKcwBYc7Bjv1lnjAMaA+1vNlf7TmR3flMkBikIBsrnMCGL8u+PPIKAUsXGsAyQ8p+KOWV0NRjJbagof8akG15VrYsI9Pv8WcsGT3vhGXr8yzpSeVwtH0BKak//3ir6yAnVxtFOKzZ7ls1efH9DTT0yRdtVvqEbf6l4dZgVS//CKxSpXK/mwH3hdans72892m0uYdNdPb797AfykRPW5BrUqzG64Hstz5YtrG/zS8IDaih99NCgMs6xx42P3VB+f7gmmkaFeJStEKlgQVuFUoKtK5ThUHBVrdWz2ieITjRAnVlReNuJ74tQ9yFDUuFOaarEmnqTpNKuE/jPgNJ0gAWSeInkURc3Oyyt5b9qyb/CJSuAoIRlCkuOvJt3DhVMz0O+oKl6SrT+J5ur34CREKKGcSmihqMhzlXSZ8NCtqFBWuo3t2unfjJIeM/Tn/e1LeJmQlD0ZQ8guVZLePlB6ZZLiFMmP4T/NkyHFMLCQr8GIE55vNOY3EHLPHrozqIIk5+CWs50W8GMSa+wnfzYyNtdnLJEGT5PnyVQ8J/J9L1n5FHR5NFMcM3QEoeiIBtgn8RnDCOhmoDHoLFLyE3H8gMT33mR5NUS2YLvWFDAbhgYpfEMrGNLHyIEAbuCbefa0cS+87V2t/XTKi3z1bq3KZgYv2sSzAm3m3AF9ouC/y6kpLh3u4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(396003)(376002)(39840400004)(136003)(346002)(31696002)(5660300002)(4744005)(66946007)(66476007)(66556008)(36756003)(86362001)(2616005)(6486002)(4326008)(186003)(16526019)(26005)(8676002)(8936002)(956004)(478600001)(2906002)(52116002)(38350700002)(38100700002)(31686004)(316002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QkJRQUNHcGNYemdMdkNGSkwzUzluWTB3dnRsaEJTQVJEMnVVeFEvWWVWeUdU?=
 =?utf-8?B?M3ZqVGp4aW5iYU9yVEZrVzVJRnNoT01wZnY4dUhaUUJaZmdFNEFITUNpemJP?=
 =?utf-8?B?b0VZNFZoVyszNzNndkY4N3Q3WGJxV1p0WGFRMHdyZHFjVHdWcDZsK2NnRkd6?=
 =?utf-8?B?R0d6WDMxOEdpelAzNlJ3OXZ2QXZKY0ZoK2h3S2NCTlo0VnFzNy9rcG40UGF4?=
 =?utf-8?B?OFZ3Tm5TY1hqWmVoUGJpQmcySTlPMitSL2ttRGV2R25WRUlKZ2lwV0ZWR0Jn?=
 =?utf-8?B?TDZ4dXJrK0FLazd1VlZBVDRtbHcrMzh1K1kvNitYQVNqZEVSZ2hya3p1NFBW?=
 =?utf-8?B?QUdoT0p2Rk16Q0ppMmJWQmUzU01KSW43TldPOVl6NWFneS93WGdWWW03WEFu?=
 =?utf-8?B?SjFMbTVKa2VLWTMrOCtDMjVvbzRWMlVuUi9uN1hybGRsUVV1U1dUeE5mUkpG?=
 =?utf-8?B?RGtERlk0M0N5ZGZwcUVwL1RmVmJSd1A2TXJYVkEzOFNJWU9FeW1aL1Z3UFl1?=
 =?utf-8?B?aExIeXNOTnN5cVJDS29mMHlTVzhNcTROZUE1elZDaXFnSHJjZXdKbGdzSkc0?=
 =?utf-8?B?YmQvNWxJcmVteFFBbDN3eHJmc0hhUlp3bS9BaXM4WWxFZzZnOVhTUkdPZWdG?=
 =?utf-8?B?NGd6UUdBQkpuSWpkVHQ0dlVFY0xOZmVyZVNuZzMyRXRHMXpnWDJPVlNVUjR1?=
 =?utf-8?B?UHJCZGVGcGY1MWF0cWJHY0hjcEFGbjNWOGt5YmU3dlAxS0lQZ2hYQ2JMZWly?=
 =?utf-8?B?MEsrcmhZalV4VnhCTHRidUVKVUhPei8wOWE1bkRtcHBDYm9kQkVBOEF0OUdJ?=
 =?utf-8?B?WkRwbTBxbWpRV05xMWtENE1BVFVwS0x2UXVMOGN3ek9zc3RtNEUvSlpUY2w2?=
 =?utf-8?B?bWpVZzlJSUkrY0pXcWx3NklrMWVxREFTVlYvWnBuTmlIMnYxM0dqU29wdkZY?=
 =?utf-8?B?cFNtY2RKNmg4YythcFZVVmZzSTBxVkNZcitvdFE4N1ZwM1RhN05WZ1NwQTlu?=
 =?utf-8?B?TkhxYkhTcEllaUw5NmdTQVdMdHhiUE5nS1VENzBPNjB0WTU2Z0hISTd1M3RU?=
 =?utf-8?B?eTBSbWpNekZqcDlsVExRV0JNdHp1d1lscXpGeloxckRqTHAreTlOY2dNeTFl?=
 =?utf-8?B?K2FUajd4MG1aNy9PcXFHK1hjdFhhc1d3UytSeVNONmNxVzNUalV4TnkwVmFW?=
 =?utf-8?B?V2dlVnhJTG4zODU1NVhkVmpSVHVoM3VUcFpwRlhta282a1kweVRPekpQQjI1?=
 =?utf-8?B?bjlOUjFSdnFpNC9xdUZEdHprOFFURXNJNTE1dHh6R0lUQjRTWnVUYVV5eEN5?=
 =?utf-8?B?bTRQTVhYb2Q2U3dUNjhoNm1ER3lTTkp0WjM1KzdaSE9kOXZtZkEzRnY2Qkd1?=
 =?utf-8?B?ZWdTS1h3MnZOUXlWSjljaFI5ZEdNVjVWaVZNeTFTeVlyeSs5SHFvSWVxSm0v?=
 =?utf-8?B?enZSbmE0OFNoRmJVQ0d4TXhQYlNtWjBJc2tsRTAydmZBWmxyZGFjWkRXRnZD?=
 =?utf-8?B?ZjViTlJjbzNaN09PbHFwRVl0R1lia1pKUjJrY3hTK256Tzl3bDByMm9yNHdK?=
 =?utf-8?B?eUVHVW5uaVFDSWRzNm1yUXFmQWxoYVFoekpjY281aFlxeGVKUjQ0S0dVdjdT?=
 =?utf-8?B?cWlSZXBSY2RaQUMyUHZZYTZXZkdtVUJuS3daVjl4bHVnZU5jbEtndnFNeHVP?=
 =?utf-8?B?T21iNnhBZEpkSVljR1Y0TWlzUFE0ME9pMW8vdEZ0NW9lbzBRSmJkcHd0M2Zt?=
 =?utf-8?Q?tVkSH2N9ngiaGz4UQfEDZwRLE2bfKf7ukqEgbR6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77eac785-b922-4c57-3a2e-08d9139d1bd3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 10:19:34.8690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7VqQb8g5BUkJKMEySa/3sm7bcLAb9RcbMKCGiltt+C06OOFpHTxBpfnMqxWe1MqflgfQu+PTOuGX0QGsRfg0e5fjiIFDDmQiN+ap3ENE5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.14.112;
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

03.05.2021 14:25, Paolo Bonzini wrote:
> This simplification is enabled by the previous patch.  Now aio_co_wake
> will only be called once, therefore we do not care about a spurious
> firing of the timer after a qemu_co_sleep_wake.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

