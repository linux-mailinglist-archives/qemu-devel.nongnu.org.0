Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B35639B206
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 07:31:45 +0200 (CEST)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp2Qq-0006rb-6M
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 01:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp2P4-0005Z1-DZ; Fri, 04 Jun 2021 01:29:54 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:36928 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp2OS-0002UU-Sa; Fri, 04 Jun 2021 01:29:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+1HqvzPIgEKlfSJ+j82pEXjnzaMi7QoMGRrgLhktRcAXvMqicJ8h1Hh3wW/11x8wCk+/PHkIof9futWvF7KAVH28ef8BAvE0ToSx/PWwqExXa6YTXe7jjeBbfDajQyq427zWZWeXkoLtRMwqrNT9/fIvzXI+NLHy0//u/d5UH0QZMt7LIr0JM8GZA44ydbNroGC6yLDh5zRSNZcIeOGY4Z3yt0SpmweQRtheZNcHnqCi0Ayo+Djn8qdTkRJvyGJjaJTw26ajHDNs4NZRLv0cIZVjcWMOwx765D5yQ62aMvg2hwcgQjyBNowUjBbKoZ0M3wF797GXvjVFF20gmc+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEN25DATNC1t/qKvpfX1cgRj0j14T+I6OK5LY5fWudU=;
 b=gWMpn5k36JTMSP1oNLHIbg476toGsr/wbnVQYXBvQThy7YsL22gXN5ToAqdq0d28aT9mJ910FNA+abRQGa5dRZ++0w+H7E3QLbZqO4x/W8yHgGF7D7ir1Sl4fvlzoSoS+zso9fF6mjoRdXfth9o5FNVl5K+F6p/0FjNUE/DaHQwpz9EuoR1F8NDCgk4T3SmApAwxL0zBKc2nfJoiVsZukLpI46GDAc/ltlo4dsydp657voHgNZtRmFGIYaKFPepaneG8ckXlkvhKkioI4pNxsmf/XQjmcJlZNAaOofVaElE2t0W3IB7j+p7nla4MgwLUnG4eG0D6X2wU27DAQMDQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEN25DATNC1t/qKvpfX1cgRj0j14T+I6OK5LY5fWudU=;
 b=GG3hQRukASo7j+JTmyQUV5YyURzm8ng3RJSJV4oIixZpEeZtEZSFJR1PhHYLcNcAhUklazByAF3wG/JK+/8e0VrFVUEsGkr6I/JpSOH5VtlciKQD+8lnmbch8HEnnxsiJg1NnwPpBkgUtQz33MqGwtBSyGNf5tq3k/ZdQ+2EQTg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 05:29:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 05:29:12 +0000
Subject: Re: [PATCH v3 26/33] block-coroutine-wrapper: allow non bdrv_ prefix
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-27-vsementsov@virtuozzo.com>
 <20210603205332.ktnifbsvubusii5b@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a594403e-7224-1f12-3bb8-1f9b89e22cf1@virtuozzo.com>
Date: Fri, 4 Jun 2021 08:29:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210603205332.ktnifbsvubusii5b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: AM0PR01CA0163.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 AM0PR01CA0163.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend
 Transport; Fri, 4 Jun 2021 05:29:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88de4676-cede-4406-ba65-08d92719af5d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6134654C7B34DA5DAF690846C13B9@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 37XSMtYjceBpx12Br7t6K/FAV7NFItSMkRHORwNM8ZDYeWTqsNVhjVBIu+BYnK7/5TtsDdrSFONhJprFULB3Ijstc0KLQojR7+UDe905e36cXz4x2NbdzKW93vzqznNLl1zLqvP/aRuZnOZlNYdIIsJzZWaEHsyMCfh2IJflbcGekuC6CmULBViFJTUBQo9gY0/9VBrx0AjK9g0dHiqVHRleX7mhzYtj0lbGw21QKZyP35jhN55mUBT9U/MeOz5RSc8cdCKaj86WFRSLdqW7+7ubQ0TX2/L/ar5C3SexzSF7W0h6Rd0bHo/U8GCwCN1T/02SIQajDfWnW3b3YZeKUlQLcPuCoNiOXXRnJHBY4LLK4t0jPiyOelSOs1+3AtrM/d5jSEWOzbSPS/m8dfHovu6tfLZmVP4de6lPnwD6EBRaBZ554ViAdNxI60oAskXE7wYvjAw77my7my9AKnJ2P5Ki3Vlqq4wR5RYjfEdZZjWRsCOmWoYBkFLZO8iQi8gXVEwpFGuNdbEQaZpfJL3cV4THTrwXwws6pTun4ogwJCIo1C7Iq7GswkLgrQPMnnblkZmDCLGvA8kfNx0vA+5UQLbnekV7bISWcIeQxyEy+ihMbKZuQJrbv6CjOrBwDU0XjkIE8PD1wt/qf+ruscrJFOxiBix01DayCDK8XXLTv2pWyFCty9josP6MUQS9aX2N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(376002)(136003)(396003)(366004)(2616005)(956004)(52116002)(5660300002)(8676002)(54906003)(316002)(16576012)(36756003)(478600001)(66556008)(66476007)(2906002)(66946007)(8936002)(4326008)(16526019)(186003)(4744005)(38100700002)(38350700002)(31686004)(86362001)(26005)(31696002)(6916009)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1VTUFFSUWxaMEFSdEhHc3FxM1dxZlNVRlI1Y0VjemNvQlBjYU5zUVkyUjlh?=
 =?utf-8?B?ZUVwVnhLdDhsTmRjZzdNMGgyNlo4UER5MG1YcHJabXVuT0g1TGNSOG5OQ0hp?=
 =?utf-8?B?SWQ1ODM2cVo5R3VMZTZEbDBESUpjMmVHZ3lZVDgwWGZCbXA0MmVJenAvWGpE?=
 =?utf-8?B?YzVGdjBXRFFlZVlwZ1ZYeCtIdGZpUE0rZUdvTmtrallpU2xtNk1jTXU1OVJT?=
 =?utf-8?B?UjllbnRJd1hldXNibUh1eWxwUjFVcGMwc0UydVFaaDRmRVlwN2NPWngrZmJl?=
 =?utf-8?B?aDhqK2JQcmt4M1JpdlpEb21UZjRJTDZ5VWF0RE9NdFZWRUdFeGppTUFqTFNF?=
 =?utf-8?B?TFpBMzdhL25KeWVEVEhPdVNnOGdrOCtsVXdtRDdKaFlhaFYxNXpWN0ZyNytL?=
 =?utf-8?B?MVJ1NDFETjlnWUFXVmpEb0c2TXp4US9IbFd6bzNnT3JHN0lrTVFUNzZSRnpr?=
 =?utf-8?B?aGgvK2xXLzA2d0c4SnJ6MkU0WUxLV3ZxRTVpM3pFZVJaSC9qUlRkazRxQ3Uv?=
 =?utf-8?B?ZkhIVmUzRGxjTXZjMkJBZEt4enFTV0RScDJGWjBtRFpuNDJ1WWR6OVZJdDB1?=
 =?utf-8?B?clZnSC9HejhpTkRjSjFOZ3VILzhvTzBkK3RKdlIyRjk3WjVIamFybThJZy9R?=
 =?utf-8?B?Q1ExN2Y5WVBqczZHMHA0b0ppdHpvT0trZHNyVWZic3M5dURqUWtSNVlvVGFt?=
 =?utf-8?B?OXNrL1lGK1JCRUZTMGxCRTJHaHZCU1ovVUQ4WUNyMXgxMVAvVFQvV0JoZm56?=
 =?utf-8?B?VjM0T0FESDdxL0xsZ2dEbVl0UE9EbjI5U3RpUHVzYjBLTUE4VFhQR3ZKUEx6?=
 =?utf-8?B?Skk5ZFdoSEVYMlNtYzh2dzRmVDlpbndkQmFPMVAwdXNmNmpBT2s0QVdTTXY3?=
 =?utf-8?B?MTQ1Q3J1Rk1uN0dTaVM2TnM0enBlZDBkbUNuWWQzUzRXbmhXeEVscGt6K1A0?=
 =?utf-8?B?djNYQk9nZ3RGYkNZUXdHSkhVdDcwZ0pDaHR1QnAwMVNOaGQ4MUpGbkZnRTNZ?=
 =?utf-8?B?V1pmaXk0bGc3YU84RjFnMnhRNUlyK09aQ0xaNXZQbEVWTXA4YmNMb3NUWnlw?=
 =?utf-8?B?UGlhVWtsWWtVMWxsQ3ZCVHRJSExJR3N0UkkxY0s4YTRCNDdHeno5MytVZDlQ?=
 =?utf-8?B?MlQwbHR2L1R0Q0ZUdElrY2pJdUxTejNhU0plc3MzeUc0TVVrVkZOMzYvWWRU?=
 =?utf-8?B?Z0ljbmRCd1ltQ0kwbEhWbDBQeCt6VWd2VDRXZXJqd2k1dUg1SXMzQzN5Nlhp?=
 =?utf-8?B?d0JjZ0pTaXBlOFB5c3Z6RFlteVNVVnU0UWQ4S0hmSkJNRjV1clRjbUVpT3VM?=
 =?utf-8?B?TTNmb1JxNkViWCtlTGZKQkJzazhOM2xPb3R4MXh5RGZrd0hvakJ5Y2hEZUJh?=
 =?utf-8?B?aVNNOTM3WGdwVXo5c0hHNmdtOHpzUHNCUHY3UnBSZUJpR2tIcVJFWDZtZC9q?=
 =?utf-8?B?eHdTcWV6SFJUbHBnMm5uMG9oWlpLMjN0VWN5allZU3FDWGVWQ2RJU1V4akMx?=
 =?utf-8?B?bVlSQmZPdC9XY3hGS3hVY1gyVUVTb0RIaVgrOFQ3SUFHODZjQnhINmg3aGlU?=
 =?utf-8?B?S2g4TnNCN0hFQlVnSEs2cjFaTXBoL2plek1CWXBYSkdKd004djNzTEtlSUd2?=
 =?utf-8?B?QTYxbVRyL0lVb09LdDFOWlNaaHNsdk9zemJDOVlEbURTZTdodDZnNFlCQVJ1?=
 =?utf-8?B?WHk3OVZ0eGkyaVNZaDAzMmhvU2VicG52bDJqMWxRWnRUc2cvZ0xNVnl2cFBC?=
 =?utf-8?Q?AfG1H1MluX2B7jhZHwvcJanzDHj4RdMcuconULq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88de4676-cede-4406-ba65-08d92719af5d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 05:29:12.0870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IlRhS/Zgq+TxkK0OaR1l6zRXv15XYyYi16F3Ax2wOtXWKmUPx5BZU1mJHodZYnHsOFa4smJW4Mw60S45gnZ9xl3zuFy4DoDIoP5x4UHj1fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=40.107.21.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.06.2021 23:53, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:09:04AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to reuse the script to generate a qcow2_ function in
> 
> Is qcow2_ right here?  Looking ahead to patch 30/33, it looks like you
> meant nbd_, at least in the context of this series.
> 

will change. This because the patch was taken from my parallel qcow2 series

-- 
Best regards,
Vladimir

