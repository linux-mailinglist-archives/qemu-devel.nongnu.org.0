Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E7476F7D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:07:56 +0100 (CET)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoc7-0002Sp-Fo
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoaP-0000oJ-9Y; Thu, 16 Dec 2021 06:06:09 -0500
Received: from mail-eopbgr140109.outbound.protection.outlook.com
 ([40.107.14.109]:65155 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoaM-0006MZ-5S; Thu, 16 Dec 2021 06:06:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T89IVPf65bgjgNEwoa5ziXECSomwhPUw/mZ+wv7ngnTIweSyF1LNTB2P62yFoAlT9wZmht1R6ZNILAaJF0bRfp7mW9UjXspdoxYtDNczpV/4uOiP2OTO/QV5wCtxgiLQJVQWYVoT7h7DkylzSasVaiYK0AzG0Fvlj++b61ooEA4n+HmaK0KDAVaXD0BIXXYRx+U2PSocxkuwAqAENd5YLKFW/EdAQePc5w5tGEQ9UoJ94yhRH4XdulmROT13ONpyOSual+Uo7eCBMrdsvPKDXu+4i35CONRWIPedHYZApjFO7l/pBEvJxbzB7U1W1VRdKP2VeglPGlUN3hIz7SOrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C81xuFK9TlroUY8oXvWjA6plDYkQS8At62ugozhKKyM=;
 b=GLmpLPH2gpoBDK2Ei/KLEE2ufovEYZqlD/oPczASyKnnJC8zQpDPmx5EskWnokTkppigCXbypLpkq0f5XimWOG8ybiw4pyGq7JeHyux+i7+w05dEzppYlt1ttGQ/RRJTFWPTtobUdmg9+2k7ViiqUz1+tX7JMBq74UkCtCK/BH5WXtDZuTcxaSl53Qw6iO7wg2RY7WBZBqA7nytit6W2sL/r2T6h9wWcPgI+rfK/jGBgVINxpVi7WB49vIuAJRJO95qnLs1iI+YEjW+T5nJDzbzxG6/zRpbvebjADOE8eq9sIfiV1l+jvfr5pxBNWD9iPKdfkrVpUKYztiMychSJpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C81xuFK9TlroUY8oXvWjA6plDYkQS8At62ugozhKKyM=;
 b=VsNz67fyDlWL40/RqU3P+JSdTJLGsilxeEQJAoXRXWI0gohn4MR7VPvcPcX1M5hFHhXuRTa/TdBukO5/n1ZbGImOZF4qKoMhBsDfrn5QcSGOKpygeyL+/lyVgmNt1W5CSM/i3WWGshpPYHhULaSoip+hPK6VoUOtHvH3CYNG4zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB6609.eurprd08.prod.outlook.com (2603:10a6:20b:317::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 11:06:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 11:06:01 +0000
Message-ID: <f4bf7ede-a2ea-2718-6472-558db3ada40c@virtuozzo.com>
Date: Thu, 16 Dec 2021 14:05:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 20/25] python/aqmp: take QMPBadPortError and
 parse_address from qemu.qmp
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-21-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-21-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0028.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::26) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS9PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:20b:488::26) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 11:06:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9db16c3-1b50-45af-32db-08d9c0840ba8
X-MS-TrafficTypeDiagnostic: AM8PR08MB6609:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB66091E4351C0CB5F7D778BE3C1779@AM8PR08MB6609.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ap57Buh+DUCpwLojcdSu8yBBlu2HFVkGQqNL6SJ8BoZWRGX5gXdncCOAITYwCD6mUDfym7hE7fz52bCEAIb+uJPdA8JqNTwDJh/7T8onbDPVbj5o8Ll6KzXvUSLIdl/Ir3o5ze8KTcTw3PK1Pc6q3mBdaL3f8PLKv30ZP8JMX8OYZlKKCYDqKBxOCzuHokXShxt0QRFDBiRoQxNWyw4Num0nU5fEibncWp1GfJ3IT0ktLXBxw/wp8Esiao9XkC0tej7aoEsX0TIHUeXRSfAKVB2F4En5Itt9g2I5RV6x6YLSkpuV6+dqo/cqLB3QaP1VkG+drSEhTajBgvRsrHRwYbUvd/vANivrUumeynWayGmTY/10ekDAFX9pGJnSbLlv6niG6Wvn131K2rk0FAE/ZKaG6I1JBm/S+94Sap2wzU/HY6iYpiypriO6Or7Sgj/M3erywweGXqlKyKED2Y6+8iO2+SGFGXR2Vdc5NMI8Jzp3il7F+6GXjCIKhb4r1gSVMCutWGZannqS9UxG2EpbxuamC8/da1p4stQBkUFRsGOiIX9U6qD0z/aj949qqz/MrfVtz3xVuwns1fiyAEmlN6YeeVp3S98B11WkuTeuS4rtO86ugfkITonQVig9X5B3Nlg5lMl5QVabIPC+unE9JbPY9byO4U5XGyvonIpd3mKKJ09B11Bo4xqFNUzzmAYU7iQMVQN6XcaBXHNOSrebb6PO7qiGAq6XsPnVTvhJ0cZMYFSSNzxY61IOkXQiurjsPI8UOgPQCdaJldpcUezRvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(38100700002)(7416002)(66476007)(86362001)(66556008)(38350700002)(31696002)(2906002)(4326008)(316002)(558084003)(16576012)(36756003)(31686004)(52116002)(508600001)(54906003)(6486002)(2616005)(186003)(956004)(26005)(5660300002)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTFMZFBYUEY3UFFlQkpKcGJ3YUswMzNZYnY2Y1lTMmxiVmk4bzdjc2N0TFp5?=
 =?utf-8?B?WUJhRWFhUFRBY2lUVDZEcmNtbitucXRwK2RIM3F3dDQ5S3Q5TEszZ3RRZGpo?=
 =?utf-8?B?czA2elROc0h0bWQyNU9Bay8vQzJoR3g0ZDhTOVU4YU1UNXlpYiszRjdpMUxP?=
 =?utf-8?B?eTcyS3IyUUxEREdZTDhqZzlFL1dqSDM2OERtMXBzMUpWb3QwdHJMV01KNzFn?=
 =?utf-8?B?eTdEZTFrNnQyWUVqYTJ3eDhGZ0JtMUlVaG5VOWpHZHRxUDVJZnFGeXU3c0ox?=
 =?utf-8?B?MXZWNmFBL2NmdHZER2pFWUhwYzJNd1VGdHJhc2dVbHBHcU1LanhzMkhHZkZh?=
 =?utf-8?B?TElUTnlQemdCNUc5NGhPTjFPQWQrbVd0Q3crVkQxWUF2SkF3VDZacWRLbE95?=
 =?utf-8?B?b2VzWmVXTDE4aDM4MmtPUm1WcjRTYU9mZjlCWGJoZnJSSWtUVTFjcmJCK2hL?=
 =?utf-8?B?WUlyL3ZzL2p6U2VCMit5a3V5MzAvbjdycmxhcHpiMFFjSWpwcjRydlcyUlYx?=
 =?utf-8?B?RE0ySkpPaUxUVk5CdG8xWnJ6QlpWYXEvTnVSZ1FTZ1BBMzJSTFhwM21VeWRu?=
 =?utf-8?B?UW5JRXdRcnQzMCtYRXpFdkR0MGV4MUpBVlprQ3p3Q3lpOVRWZmtRZ000Ymto?=
 =?utf-8?B?S1hpT0h3eWgyMnp1ZkF1RVEydmdEdkVZY21XbTVUZVRaSnV1RzZLVXdlWHU3?=
 =?utf-8?B?V2dZQThtNExGT0lEbXFQL2Z2U2hFc3k0U2RzUk4zRWk5V2tSVlozb2t0ZFNB?=
 =?utf-8?B?YWUycVJDNnVReUJRR0I4ZDNkVzVSeUZqckxBenVVV1B4UHJSQVFJeEd3UWlD?=
 =?utf-8?B?ZitPNk5XUnkyWUxYQ1crSHhUSXVQczV6aWJpSGpobXBNRGRnMU8ycDlpOW5M?=
 =?utf-8?B?UkJmMjhmTTdobEp3Y0d4TXZ5dGYzQ0xDemM1bVBPQVFhWW92U2t0STFPcTNM?=
 =?utf-8?B?cEl5SWU0a3kwSDU5WWx6MXpWams3eXZZYmt0SjY2Z0hSc2N5aGFKVEF6REF2?=
 =?utf-8?B?OHczblU1ZXpVajBzQ2x3amp2RHlyMVpHWnd4NGxaYjJsMDEyM0VxcDRkUUhK?=
 =?utf-8?B?bDZQUCtLcVozeUJPYldEaUpVa0pJR0tMNlJvZThYM2x5d0xEVXJPcDVyeTRx?=
 =?utf-8?B?Vyt5NE1sejYxbWpHQUZXK2x5SzY4UFBuWDFNaXlOS3lic2I3c3RXQ3QzTXpJ?=
 =?utf-8?B?Sm9qdjNqa1hxb1ZacWdXNk1wbEtzVlhnbE5FWCtpTi8vNlRVaVhnUVkzWDE0?=
 =?utf-8?B?dTU0T3lsRnQyOGlxWUlxUVcyUEtBdXovYXEzWWN3WjBVQndjZndtRjNUMWJt?=
 =?utf-8?B?Z3NseExxMzY2a2hUanpPblNxY2pqZ1BJZTB0L0tDK0pyaFZCTmJ4eTVWNHZo?=
 =?utf-8?B?bkY3ck1tZFFvblczcnhsL2YrcUR6eTVBTk9XaDREZFd3VXZVK056RzBIa3hK?=
 =?utf-8?B?bXliWlhTNUNSZWE2ZHdpaWNnYjh4QmFKQWJ5Kzl6R05yR2FjV0J4a1N2L1Yv?=
 =?utf-8?B?cHFNZTVwYXJXWW5CT1hSTUZNOS8zUVBVRVdCQk9NUFNRcXp1bUZRSnZJbDhp?=
 =?utf-8?B?K0l4ZGdBWVVaZ1lWNzJWUzY2RUQ3WmhaMEJTdnc3ZXBpc1JLNmFudWdPV2NJ?=
 =?utf-8?B?MXA4QVJvTzV4T1REK09FQVcrcXJzeSt5TDAwOHhxUStoZFNGZEJYS0xSck1M?=
 =?utf-8?B?SktsbStqQ0NId2dmMHgxY3VXOG5paDJ3bDNOS0NFbVlDZDZ0ZGFCM3plU1ZI?=
 =?utf-8?B?dmZMWnFTTTNYeHZIRWo4cGIrT1Q5MzVjMEZGZE9lNXVvUkNDRFZXM3dIVXdz?=
 =?utf-8?B?RENVbDc3dGR1Uk1TRU9HZzNwOTFCeU16cGN5NjlqT21UU0NVWHZiMXpWcVNX?=
 =?utf-8?B?cFJWN00wMHFxaUYwNVJyVGp1RmZpbzhXcWZqTk11ZGFLY2JQdi9rZzE2RW8z?=
 =?utf-8?B?dU0zSXQ1MlRvM1E3bjMzWCtnVVpNV0FvdWFDL1V4K1g0SUtMV2d1QXozcXh0?=
 =?utf-8?B?ckVqenhPTFN2ZnZGN0paUGNrTDI4VHZtRmM2NVZjeVZrVW92a3JLV0p6ZVZN?=
 =?utf-8?B?QTBkRUtCN0tqOEJraGxUNGVyVlBnTUVDTmVMTkJma2RXUVUwRHRvbWxjcTFG?=
 =?utf-8?B?WkpGUnhYZzQ1ZWNpQjlleDFYWHhkdzBFdkhTeTl4WWt3YlNtTXFwL2pMYjU2?=
 =?utf-8?B?M3pTUW5sQlJOZHhHeGZocXFwZWVGSVkxMm5RKzBPL0U2RGIvRlVBNDdETHhJ?=
 =?utf-8?Q?LaTGsZkCEWBNIXbiDIkLucK3HpeIf5eESgFXswVvq0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9db16c3-1b50-45af-32db-08d9c0840ba8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:06:01.5584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzTqVISIXucLROmuHe7B351GSggkletmIGRt3VWB/BwhpM4cgORPo+q1em4A29G26ixIFnZLR3A6uaUfhYT4VO//OpRUjBKbJXR07fk5Yqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6609
Received-SPF: pass client-ip=40.107.14.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

15.12.2021 22:39, John Snow wrote:
> Shift these definitions over from the qmp package to the async qmp
> package.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

