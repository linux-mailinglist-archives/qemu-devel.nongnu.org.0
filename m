Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD2476EEE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:32:51 +0100 (CET)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxo4A-0005e9-Fe
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:32:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxo2h-0004lk-R3; Thu, 16 Dec 2021 05:31:19 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:54246 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxo2f-0006Bw-4M; Thu, 16 Dec 2021 05:31:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J02kSKopKB6DMrEM1haRAY7tFioJWG5mKfZ8bw5XI62TGANjkvT4PCHcADkJgy1WD8fDt+p6h5+39gOwCXX0BjucPRO66DkSBUMVlLdFCYzZoXkyt+pHe4pc2rJbuiflnV6LeEj3HFMJzRh3GP5u3FF+aG2ejjOJ1eEIZ8f0c74uz0XA9gD3ifNqqTUxUMJhkG8FVrV1f9RweAi87WnODzxNmP+5UkECB2CGWYGqzmcX7olMQsWEThpfMwhGzOWD+1iTzqDlurPSltXRDZZlNTwTjeJSo81QHHeIUwQlGFqXrQAWjnJhvieBBMFMwzodReZAQ+PqI2mpz3r4cuWImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M+Fmr562CS3/ocPpuSpUnmHV5TH4eUyl4Vqy3AYLw8=;
 b=SIWc/qpYczWN7xRcR0vVjFJM9V1Or87WiV+wVd5XR2wqRewxNkn7rsJBZBlMu6pc6ynnliT8ajN0ultheZtMJs7WLWTsGhWy5UeBpDyezzfEyj5ouvizEbPdZiO8wlJEVtVqT6m7bbPtxicg+Ln7GdJVnBzjrJOs0F6zU5PiXFleQnOpQX5zVxp5gQ5HGhd/Nq1bIfht/mDiWU6qygqL+rB9IBfxrTkrXLihlyBIlnvvm7GhqIe9P5j+Q2eJVY0+3PItDrlBExFADzQuv3G5qFLLPkvjZ0gJxGdPf8t8r6tQHMACWVrBIwNeppA3XOCeMakcO2VySJgZ4P/Pk+2upQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M+Fmr562CS3/ocPpuSpUnmHV5TH4eUyl4Vqy3AYLw8=;
 b=FH2JCknjdhWumDA71he7WYva5GxZhShoAMECTss2VGt2y1Osnog7NpD/doAm3JJ0WwWM+Vgt+IwetakchujrqjLpi+Rlr9Eb9gCwSAldqq611xskSVZp+qAbjve6tQdAUTM1jQ46g6GLgh8lkolJ2I51AUe9i06jgRxqeMcbQD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4067.eurprd08.prod.outlook.com (2603:10a6:208:130::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 10:31:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:31:13 +0000
Message-ID: <12948281-b5ea-b11a-4fbc-f3744254d1b8@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:31:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 07/25] python/qmp: switch qemu-ga-client to AQMP
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
 <20211215193939.3768033-8-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-8-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0215.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS9PR06CA0215.eurprd06.prod.outlook.com (2603:10a6:20b:45e::22) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:31:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60b94ac9-89b0-4c54-b94d-08d9c07f2ec7
X-MS-TrafficTypeDiagnostic: AM0PR08MB4067:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4067630A897B25BF5A891034C1779@AM0PR08MB4067.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9tQ+Cc9twAIxzhJQ1fxORnUp3pWYfhppVOhmcx/f/ciZW7SUg2hjrEYtwYg6kzehrJXblgfMHJloa37ScP4SRn3vixS7PA7k59CmUG8LbKGhVrk0nPohwmaWkM90KLMvoO2UGh3R1Isr4RVfKx2O1DIbb10f+pH8xgTEGiLwcoQGDt1ImphlbJB4f5tL3oQ8sNLj2jEX9AfWcR6pLtT9rNN3c63a1/ahyyBLNathvAtwhj9EyEXwEEQEprt4OM9APoJtU1l9NeWWgaowM01yNYR9MSDq7NulV02cP+cfaeuTiSEd9ZXV7Zt8TqDlfB9P41C67Azy2pQDUSKt/zppeb92VY15d9KXlByMxryG6gBVRFx3xBU6DdYmPMrggybIBAWHvUKgiMYu9q7H3RSYWu+509TH6iiEFVezK71Y+Je+xjEgykFz+2CoBduyOnJZ9LzzdnAbc/5D+iHzW3Gdy1oOn4MfVJY4tNuOwPtY9KvlQnBTwmd3H0M1ANb9nOchufwpcREZExSmmny5b4t1SGjbcqmIVNFbMylYfrnhlTgjCeJYViwDuZ2B11nBWDvORJbqRhxz7MFdrK/mP5S04+F0Ws9afN94D0ML5hKiLlHu3/58pAoG0/ut7g1LnUa2Mylivi+G4d89wQPF4FWpyeY+9ZU9r9A4p3c65ifVA+VO9WUCv430DXYgKJp9GpLgv/gK/6TfO1ZgLLsLHNTMtCi5ltg9NZ4duKQ25IcCvsZ1hiookF1LJK2UR6l0TnJorjHPRuofQEFhHo+zq/r3og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(8936002)(66476007)(66556008)(54906003)(5660300002)(8676002)(83380400001)(86362001)(186003)(956004)(36756003)(7416002)(38100700002)(316002)(38350700002)(2906002)(4326008)(26005)(508600001)(66946007)(6486002)(16576012)(2616005)(31686004)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk03KzJjSnR4V3pCNENnR1A0eXFZeUZJeit4K08zbjIzc1lxajhta3E2VjJ6?=
 =?utf-8?B?UStLSWJxSnNQRjlTemJPZVIyQXpPS0NZN0hwZWduRHNtZThNeHJNVmRyVzhp?=
 =?utf-8?B?TmxLUUxkL3NseHZFeTJzZ1p5QllreCtmT2tpTTQyTEc4N0h3czE1YmZhbS9N?=
 =?utf-8?B?UTYrYXE0aVZxRVUwUFdsdTU3MnVPUndmM01MNm5GalVVVHRhaC8yMzRCU21S?=
 =?utf-8?B?WTE5cnJFQ0tNaCsyY1FPL3hKa3ZLMWw4RDlsVVhSNEpoTFR6WDZoZ050R0d4?=
 =?utf-8?B?OEQ1L0tHemNkQnlOUmV0TXZNV0dvZmFrTGRLcThGQkwwSjZNMXlDUVEvYWZK?=
 =?utf-8?B?R2w3NXZxN2pwWG1rLzZrTENnSE1VM0xCNDAraXBsZ0VLeEMrQ1A3SVhWd0F1?=
 =?utf-8?B?ZGtONTVIVDhNbTVRY09QQUpIeU55Ly9XRXZsR2pLenl3eVorOGJlbUhjbWl1?=
 =?utf-8?B?bm44blpMb0lOMDR0b2pZZXovUjVqS2gzbzBaRnR0U0I3SnFWR0t0RXd6R0Ns?=
 =?utf-8?B?TWpCZWtHYmY4MlU3TDdjS0pCbE5RSFpzRjFJZ1JxQXZhRFZySEtZVVBrU1RI?=
 =?utf-8?B?YXlnT3ZlNEYvdlN2THZWNTVNMzhmUkZ3QkMydk9adnRDaHVrV09jVmVqTnda?=
 =?utf-8?B?R2EzNFRZUGt4bm53SEJPZ2VuRWwzZDJtRjVFcVNRK1N6U0l2SzlyVE9GVVRT?=
 =?utf-8?B?VXRablcxTVU2ZHR2ZXNFSExyMmFOQ3VnTmNpSWw0cEs0YXhVVDhMcXU5RHNZ?=
 =?utf-8?B?d0MvZ3Y3Q1hFdVBVR1lmblJWWjFmM0p0SnRIcHdnVXNON1l2TUkxYlpBZDAz?=
 =?utf-8?B?YlNoMTZkSVlCam5qc09TSGFueExGTXhydjBSVzRtc3ErUmlYRlZ5NWs4Y1ZM?=
 =?utf-8?B?V05qbGhEZVUxNU80emt0UGU5Um9xT1dhSExlUGMxTXFYcnRibDU3bkFZcGFI?=
 =?utf-8?B?cS9ueFE1ZXF0YytxQXVicHBmdS9xL1g1VmV6YmxmTURiZTZwN2NrTEdmT1BS?=
 =?utf-8?B?aFhGazRWVzJTQmNhclprZ0pwWFZ2MTg3dzQ4MUYwdGpIWWNITnRmQzJuOTkx?=
 =?utf-8?B?SGRSUjdUaHBrV21adC9EdmRONFVrYjZkb0V1Z1ZxVy95RW9EeE1sOUV3TlNH?=
 =?utf-8?B?QmJMb1RtNzVYcmo1MWN4SStTMjA3ZHhDeHNJVkZyZGsrMWg1RXhERGw1UjQ1?=
 =?utf-8?B?aW96MUNEV1NEYWpzRXo4WC8wcFhvMWlXVkp2QURDdnBrb0hpZFN2ZmYxQ0h5?=
 =?utf-8?B?S2Z2VyszOFNVakxkU24vTzlka0YxczVrdEkwTFkxUWlMdUdJbkNaU3VGTXR6?=
 =?utf-8?B?N1ZBSDRZQUt0ckNQQXMzTlNEWk01NHdqY3JqdCtiWnJQdkxNa296QitEN2NT?=
 =?utf-8?B?bGoydlZWLzZ5SVdneE1rSjIyVGpwVXFUOUprMFpyQ1pxcVp3M1FxMm1xRnNR?=
 =?utf-8?B?RWhMSmdjK0xrek9idTFIQ1Y1NTJ3MVljaWxndkFuUTlwZWRxdkJuUTFIdjNF?=
 =?utf-8?B?Ty9jeXRpd3JWUXBVTEdDVjdGajI3SUZ0bGNTS3QyS1F2YUQ0U1hxWlFJcjF0?=
 =?utf-8?B?ZENZajRoTFdTdjRON2Z0WjBhU29kYVhPSjZ5TDJDamZBSzVZV1BGU2RJdFFv?=
 =?utf-8?B?VVJMSUJVeG1pbzNLTllXY3M2a3ZMN3FOTzNoZnlMNUFpYjF6Ulo0NVB6Rm56?=
 =?utf-8?B?Wlp2QWNMR2E1ZE1TYWRaSGZVWHViMFZEdGlFaEhYRkNEbDJEYkxYMDBXWnpy?=
 =?utf-8?B?akIyU2Q5TnJYc2l1cTR3N00yK29qQ2M1RlRVQkc1eXZVUEUwS0s4L3NjODZj?=
 =?utf-8?B?NHhvS3U0ZzFPb3M1R1FjR0t6VDF2ZVRoQlJNNWtWYXFtd3BNRGdkeTEzdU4z?=
 =?utf-8?B?WVNTNmFWSS9oM3NXOXJ4OG0va0w3M0FqQ0lmTS9tUkxabVcxNGcxMHBZSTNP?=
 =?utf-8?B?ZWJlMnJ0ODdnU0NUU2xuQVF5aUVBQnJjYXFzbTNIUXhuOG5rZ0NBdWdFNFA2?=
 =?utf-8?B?MnBGSDRkeThPNGI0ZW9BYlZuaWhBMWFDY3pGTGk1TUl6NTVzdzMxS3F4RE4v?=
 =?utf-8?B?SmZUTHcycjlmYTd2MU5FOU41Y00wQitreXUreGJHSFlzclRpUWluVTRRRjhz?=
 =?utf-8?B?MkFnR2lnM0VqUjBIbDZDcTZUZFBBY3JSTHl5eVJXQ2RtVGdFUGcvMDFLcDc3?=
 =?utf-8?B?TGp4UEo1UVZSU0FsSDJPeTM5NXdzRHpLYXVOdFhFQ1dLbnlOdzRvbER0ZHNy?=
 =?utf-8?B?V3dUbGJSUysrTE9QU2Y2MmtJeUtRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b94ac9-89b0-4c54-b94d-08d9c07f2ec7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:31:12.9927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3m+ZoPvq1dAqoLI/ILpxqumsPKaDFojOYI+sct8rymCq0KXYGU0eVP95flKhy3jrT64kimseATg3PYG2QGgxjcuNENgQ6WLBwWBZgIPdJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4067
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
> Signed-off-by: John Snow <jsnow@redhat.com>

Not simple to check, how much new behavior is equal to the old one.. And impossible to check, is everything updated that should be )


> ---
>   python/qemu/qmp/qemu_ga_client.py | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/python/qemu/qmp/qemu_ga_client.py b/python/qemu/qmp/qemu_ga_client.py
> index b3e1d98c9e..15ed430c61 100644
> --- a/python/qemu/qmp/qemu_ga_client.py
> +++ b/python/qemu/qmp/qemu_ga_client.py

[..]

>   
>       try:
>           client = QemuGuestAgentClient(address)
> -    except OSError as err:
> +    except ConnectError as err:
>           print(err)
> -        if err.errno == errno.ECONNREFUSED:
> -            print('Hint: qemu is not running?')
> +        if isinstance(err.exc, ConnectionError):
> +            print('(Is QEMU running?)')

It at least a bit changed from checking errno to checking the class, I'd note it in commit message. And anyway commit message may be more informative. Still, I just don't care too much about testing framework.

Nothing seems wrong to me, so weak:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

