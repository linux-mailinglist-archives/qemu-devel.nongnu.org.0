Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83241625C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:50:08 +0200 (CEST)
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQz9-0008Ni-9M
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTQpc-0007D0-6m; Thu, 23 Sep 2021 11:40:16 -0400
Received: from mail-am6eur05on2137.outbound.protection.outlook.com
 ([40.107.22.137]:49728 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTQpX-00037j-U3; Thu, 23 Sep 2021 11:40:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/U2YSjdsOTw3N4bALBMwa2GEKB7OWOLlU2nP5hvVEw4e/0Q8/NTmZCkdrf+M0W3/BmgO3+g15FlBO1Oc61yAcPjx3WbVKkQ2q7DNrzz6TDyEl8HnxjMc8saThKJhscrnMRmE3XDY5ePASq+oLS3+lSY/hzmuhngfzLYLH23GFgBSNlEUWr/twMEYI0/NGs/SCcwnv5TgGvKIh8wjIgWTgc9LhasHErKQfGTXN2Up7In770cVyRLBYe41/b1wkDfYYAnCRNAgcaIJ/q66R2n4cbPJkYAvfSPHJSJ1PfubdT31AW6zfNjkpX1TxRxknfy6xIN3busWkUZJqBB2H7KDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=MK3jpnatSpcSLWXgsVAtgGJ+rO0UNQrNIwsQS4yGXuk=;
 b=d7jn4NCRp2B29YTkmQpvxOh77BFJ1lV2YuDFEZh8+6X9LqxWAH9uTN8KgIrLT2pmzUpbVb44PZ5K7fKeA7M7jNsOkNeCPC6p+T1T2dVDokCUN4ajfVgibRLI54VL1baN9lK9x4qAPUX/G3Azmu+Yx//X8iBUAXKWJnFqo4AKioFm6vXUOBPnl5unC2LrDYvOyT95Pw9UkYbi5nKsDGT3J2Lmy2QzV7t77n78vzirIOX2FwN8/qSG6Z6Zg6E0ynHyu6W56GyDnMVC2ZfyQ0wChrJhH770CX0AFkM3R3VCw6m8zhkoQg04Z96K+AEZUZqHkTa6Qfkp5bP2raFmQUwLyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MK3jpnatSpcSLWXgsVAtgGJ+rO0UNQrNIwsQS4yGXuk=;
 b=KUAgMhGj/DJCuchTzOxyypL0pNYqSWMyH4IofiyZm/ZRgzB2OI+t0xBcPAS+k3dolPfqb+m/1zl+g23gpEkMaIrcxgXTxr/dfB8f54spwTP0Q/Yl86WOA9PX6xFtWg56dbXJ/69loJP92B1YpuzydrgUn8KSumS63dlIgNCobxU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 23 Sep
 2021 15:40:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 15:40:08 +0000
Subject: Re: [PATCH 4/6] iotests/mirror-top-perms: Adjust imports
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-5-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2280a281-646f-0054-6d08-89f4b52649d2@virtuozzo.com>
Date: Thu, 23 Sep 2021 18:40:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923001625.3996451-5-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0701CA0011.eurprd07.prod.outlook.com
 (2603:10a6:200:42::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 AM4PR0701CA0011.eurprd07.prod.outlook.com (2603:10a6:200:42::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.8 via Frontend
 Transport; Thu, 23 Sep 2021 15:40:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edd73a97-9b68-4c6a-adf8-08d97ea86c46
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4536AE59B1F364D5D9069212C1A39@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGnAXrrQok8HBLp57CmiesUkmsLr618jMi2BHjBXhqwKJ1yO48n6Frld+RoQ72zhbJ8Bth3kuQZUSTwq7mh9AUrcL5otaf/XpEJ6aLUAPuA1h40Or9Ce4ZLbqS2conUP4Qq7k92LrscUVTGecJOs+c3Ek+IkYkL5JUunblqEr0WkSMTgXxxyy9Jv3ZpAM+hoXL7YSQArkK5qztRG6f3vugmczUVaE1iRXQ6ymHkpNpomMKRHLG1QXcLOnxumeY+cpgY8uGsm9RFenh6vFh+CO5/r3J5JqSQv1WZM72qwMNknb4+Cwremn1lLuhmdJtM9biuNuZ79hofLg8wweDe3YuEIsNiekU8ngWmUAJBpcJFnGVGNsG4egaA/LbEv/vKIBWbRtWb2VwB2wL8qITBVMiui26JnvqHQvn7nuHZE2VQsQbaNmI5+OQ/7EU9Ozn/hDfI4sk72pjZzgZLPa3FpXYKkR3M+NKXBAPsssLojPFoBsVnekTUDekO/BUlDhHpRXO25iRb5HSQULtSNO4F5I2CBrgUK+R0OUidxZOidNmC/oSOcKQKPtXueRuTTPfZuYUKHPoDsU9scW/LXjdu20BXqDl2D4c9Wn8wIk9iuBsJGcCNeeb58FU1d3lo4uLjJuV/LKtGC0oAtx/gyJIGqmujFs0u2hbI61Sc5mZyySweBYg4lHGjy+vRHhf2JLW+aXcYbDXkaatjlOQXuxRTJHmUgpxq9UtMMscLG7Qn4rS6xHr/I2AzS3ayqSv+uyK+/15GFnaIBUjlkvRE/rZ9Pgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(66556008)(31696002)(66476007)(36756003)(86362001)(66946007)(16576012)(5660300002)(4744005)(956004)(186003)(54906003)(38350700002)(6486002)(26005)(8676002)(4326008)(8936002)(2616005)(508600001)(31686004)(316002)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHA3WEhIYUdHRTd5bGRLQm4xOFJFTGN4ZHBUbEZHbXlPbkhiVjIwWGhsVnJK?=
 =?utf-8?B?TG0vV2pDZHNsemdMRGpkYzRucENsM3duOWdIbHc4dzN0NjJNaGRCajFNeVB2?=
 =?utf-8?B?aW9NUCtRM3p5MTJNcWRJN1ZkTmNOamc4NHdZbHNIdkkzSGpzVHAyVUs5SjZw?=
 =?utf-8?B?U3g2NHlidEM5czBmVXdYRk9lV3RZenRNYmhyemlEVVFPUmpMeTFZUkNZWFI4?=
 =?utf-8?B?ZTZFMWw4eWVqZ2I0YjB4K1o2V2RsQ0hOaWdkd25pVGRNZXM1djJsOFBxUGc5?=
 =?utf-8?B?UVFBb3NVUzMzQVM0aEx5OHJ4c2YrOEtkWVd5ZmtMS20wQzdWbEJpMEplSlc0?=
 =?utf-8?B?MVlYd1ZzdUgxZ0dwWmp1YzZKRUlrOUVyb2RicTR4M1U3V2dFaFlHUXBLRFdQ?=
 =?utf-8?B?NEdlVkJDeGhxZVRzM21VR1VEY0lBWWRNOWpTQ3BZcjdJK3MrNUdsZURRU0pa?=
 =?utf-8?B?ODdsRytTZkd4dTFrVHZ5QlZuVWJkOEtEWHlGYVBYWWxiZE02TGlXWWtuN2VN?=
 =?utf-8?B?L2F5SU9ZUDVwR0hyT0hnMTR1NEg0Qy9QanBva29SLzlLS3JlQzdESlNXZWlQ?=
 =?utf-8?B?NUtqeWhaenAvUk12RnFWWHArYTZlbUs5Q1A4NWxPTkNLUVMrOHRnQnMxQm1w?=
 =?utf-8?B?Z0phSzQ0VUQyTzRIWTQwL3VmOE9Ya2hldkdYdlRHTmJKNU9pRmNTSGpIeUZa?=
 =?utf-8?B?UHY2ZGtlN2tuZU1KWTdqaUJ5ZjRRWmtZTlljNTJ3VjZuY1E0eHN5bXl1SkJ4?=
 =?utf-8?B?eTRIL2VBOWs0dm5HWWVHOHpuRy9mSXAxSytkQy8wL1RlR2NpSEdEMkkwaE9T?=
 =?utf-8?B?bTBRWVIyOElYb1lpTGMzSUVBRW5lcE42YnVDWGs2Y3JjV3lKWlREaUQvK2pK?=
 =?utf-8?B?S2Z0bTQzb0thSTF6elZzMExuSzJnVjFWbGY0KzlkcFhUcXZaWlRYOTRkTnZR?=
 =?utf-8?B?SzUrbnpKZzMyVmU3bHNkOU40aHVvMnUrekQ3L0tOUlVDMnJiZ0FCUnBPR1pz?=
 =?utf-8?B?ZzNORVZsbUEyRXNreHdsdkMydmZRaENFdlVIUWlQS3lQTzBTRW9OU2JOZ1d3?=
 =?utf-8?B?S1BKbjBwYmFwaitzT29lWElIdTRLK1ViV3RKMm5sdkpHVlFBMTl4ejZkeWo5?=
 =?utf-8?B?UDM0OVV5YnNIdmpxK1FIOWJyanRPSlZnL3p3ZUJxYy9NMEVXaFhkblNEeUNV?=
 =?utf-8?B?R1ZWcjgwaG1ZNzB0V0p3NFk4VHVoeXUwQnpWTWFKM29TWEVxY3c0Q0NTcVNB?=
 =?utf-8?B?WjE5NmpWNFRhL2tWZzBYTWpQQWdiVVlNd2ptb3U2SFY2THBBVHNnbklZV0xk?=
 =?utf-8?B?am55Z3hjekZVN2h4UjUrVXRGTWVrSEk2SThUb05VMnRERS9UOWQxRG9idUpz?=
 =?utf-8?B?R0V2WVZxaGRGekhaRVdiNkhoODY4Ymg2QXlZTkVnUWgwQkcrN3Z0bTI5dmNG?=
 =?utf-8?B?azhPYit2NytldWIzZ1c3THRMbHpSd0F0a0NOTHExb2FaemFIbmJqVzRmeWVi?=
 =?utf-8?B?dXFyYmdPZXJoYm05ZTdMUmV1cm1FVU81a280ZnBwaGNwZ0xDR3lXV0IvUW96?=
 =?utf-8?B?TDRrMlRJSzVnNDI5SXd6OHJRWmFJdUp2aDYxUVQvK3p2Q3FkVzJrYVVqT2Qr?=
 =?utf-8?B?R2ZmRUxTcFhCTkVCTnZDV0dsQkVXQUkvU3dsTWFhUTFUY3NIbEZuWm84MWVW?=
 =?utf-8?B?Z3VZbUR1Q0MwaVY1alNjdW50R0tNOE1UR29nS0luWVBkRk1kTUZreTFaRHA1?=
 =?utf-8?Q?l7+YPmYSFuCoivoUPs2YyM4cHfMjp+7WJqQyTjI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd73a97-9b68-4c6a-adf8-08d97ea86c46
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:40:08.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSwszfGx0xQBYkKdsNaPnVsRgwxTUEfe8RRbODC1RPHjYALikhz+6MnPiwoMdZpYw9tmUWIEFo38GGHthVkg/1/s5xXUX/nugj3pRw9GwKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.22.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

23.09.2021 03:16, John Snow wrote:
> We need to import things from the qemu namespace; importing the
> namespace alone doesn't bring the submodules with it -- unless someone
> else (like iotests.py) imports them too.
> 
> Adjust the imports.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Reviewed-by: Hanna Reitz<hreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

