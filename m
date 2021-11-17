Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786F1454DBB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:14:36 +0100 (CET)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnQOB-0003gx-3I
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:14:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mnQMj-0002zp-6W; Wed, 17 Nov 2021 14:13:05 -0500
Received: from [2a01:111:f400:fe08::70c] (port=39334
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mnQMg-0004r0-2r; Wed, 17 Nov 2021 14:13:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5X6wqwy8EdDaMEbdyfa5vOEdw2WdYLhljiJUuJZ6Bj2dkFxfVU3gdo0cVN5DyKPxBbcSKv/fLCaOFP8wtkM/YfjxCZ86z+Ix1G+4S+6n7CdF5VYB3p017t/EkML5WYkuIto0+w5RMjrsffI1nP8rxSLaKx1BFu2edU/ELUU5go1ivH15QvXbqLxghU2KtlpFas+udmJAFDDR2Ej4JAn2tp7FpqGlbZUQOSkBgnYxxXxxmZsmtYL/EfT7EwstBhkaSG7U+siI3wW0THw1RwO6OZFc+xBLSK9VbEBM/aHUqwHUH9opT97MHzNAvYpVvv4ec7u94qQMKDfyOJNvYRvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ7pdC4pAK7wmBmhLzADsIfOu4Ut3Fay9k1Vqp1ZxMw=;
 b=Av5nlbMWkiF8lkbQLlQf5sHuOv+Bal+WrbhzD4EG/Dcou26Ewuamv//nItxUtq6/oNExJRLgx1fjKD6hw8auFOJR/tE80/+9OBoJmSyKVdTSbWZaanm0pWa2tGWPRT0+Sug1i+i4aEwBpUZvpjunxBqTZr02mT9EPulq/em77R5sm9lva3Dz0rcrFqF6DDjyuBRgsLYLktxZkAvZrX/3fGzaKX3HtAo6o6K/lIwTyIbS+EB7DruW8XfboqVdzDFOd8oSJ8upsj69pAkWtzL9QuYbwbofFVpu0WbJSjPLZBJ7J4azuVA7IwCNOhDnfQw18ziWX+MMGpDHPD/aGzDfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ7pdC4pAK7wmBmhLzADsIfOu4Ut3Fay9k1Vqp1ZxMw=;
 b=If+yziSZLjfzaLNtgXkCLwDgf49KVivqfhBMDzwsIf44awQzzXiZFgPtD/fcJDeEOygruB969CsaJ0SO/TRAxUCVQX7mqjMjH1EbDvy5OE5dVxOJfMTF3K7ibd0rK8QsWifhFjGhp6HvoZGhen3hgRpUDXdyusnXienm7PTNNFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6882.eurprd08.prod.outlook.com (2603:10a6:20b:302::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 19:12:58 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.022; Wed, 17 Nov 2021
 19:12:58 +0000
Message-ID: <18cc2754-44bc-9096-e972-35563a8fb0a3@virtuozzo.com>
Date: Wed, 17 Nov 2021 22:12:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 0/5] Python patches
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo
 <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20211117003317.2844087-1-jsnow@redhat.com>
 <20211117094157.cef4x5jdsddd3hfy@sirius.home.kraxel.org>
 <CAFn=p-Y-dxRLrvEwz1M=HgPumQqwzUSHe1UTy-H_9D8PuCv0xg@mail.gmail.com>
 <92fb55dd-1f0c-bf23-2b6f-dfb46c40b3f4@virtuozzo.com>
 <CAFn=p-Z0RPqwN9=KBa2UkHgXmd6fg-KettAtYYygZ2TdOU+BeQ@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAFn=p-Z0RPqwN9=KBa2UkHgXmd6fg-KettAtYYygZ2TdOU+BeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0075.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.233) by
 AS9PR06CA0075.eurprd06.prod.outlook.com (2603:10a6:20b:464::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 17 Nov 2021 19:12:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a55536a4-a5c8-49df-6e7d-08d9a9fe4458
X-MS-TrafficTypeDiagnostic: AM9PR08MB6882:
X-Microsoft-Antispam-PRVS: <AM9PR08MB6882FA4F53634A56E83159F7C19A9@AM9PR08MB6882.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hr++wlh9QmZ2U1i2sKh7xdyfg0S3ZNbDysky38axApnXnrh/yLFVn32I8IyvtTv8K86f9f0B/PXRABagvRt8msmjKjdhyztc1X5G8gywPvJQTcmqA8qSh8R7D2J0Y73zlQSjRoBEsmM8iP+hy3TD8sRNb5NbMHpCQdwiAMcAa2vDXa/bYTVzBzhUd+FX+TBV4FxyUbFHC35NaFJf1DMLlqL5FgZNVVNr9/3fZ6gmZgfgWUPPVKJPMTsoE4ZZNJLlAivca2OJ+YOyCTr+Adc9qllZjrloHrxKnnl/SGhaU6P7JpHKmL7S4egmVXEqpLqppuZoUuCsBV84QrNYbjsDDCVbSwWhfdP/Ap+9ncVMn8gb/I0WuxTs//MvogVe4XuM4RQYCveHJs2ib6nLRnvevPSiMhXK0+b6fVWVyRXbjv2a5d02OaA5GQwqqEbQDtm74a45Z0V8vArzo3PFrX8+n47FWj1rAXch5C4BTIDmdZNgsdynT1fJ/BIn+t/DJ5CnaKP+IBoj5GuITwEbzIBNIMQeX2uHsuwihFb1Dt4ztlok6+cHu/CvZ/dObNvGqZTw19+8HKgXsPUR2Qz2MKaa8lr+p713JROxOpvlN3zFWXiB0wboI2BEuXc9uGtaVdJW/HhIXFV/W1jBZTOWKr4To3hB/WQ+mMhFPF9WyD8Lnr06VD78nXZPYRPyaRhXGJx5VUVlxg/AE/AsyP3vdTPE2DNCX51LSxWhmRnt0qbOWFfUp3tM6+rb4MWfsQ/wvqsAyin16DH075W6l3rawSqnp8/eGTsa4xWFZkvI6uhv6O/ED60QqIlQlGWJzQa1/SP1jlIUkTmdcd1ZNowDTFKXD/r5HUay+TLm+k3cQbxH7io=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(16576012)(2616005)(26005)(966005)(956004)(38100700002)(38350700002)(8936002)(186003)(7416002)(6486002)(6916009)(83380400001)(54906003)(86362001)(316002)(31686004)(66946007)(5660300002)(36756003)(66476007)(508600001)(66556008)(31696002)(52116002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFB1M0lwdy9PejAwNDcrTXNLU1lySFBzM0xBcmQvZ1YvaU43L0tNcUdTL2pk?=
 =?utf-8?B?aHhPQ2Z5cVRPdTJIR0hxaVlJNkJZUGJvRjhwWGVmSFBUcmhvbkFHb2tpNm5o?=
 =?utf-8?B?V3A5WUgwYzh6eDNITFQ5RDVFbjYyWFFZSUxzV2N6TUl1WlNHWGtJcDU0alZH?=
 =?utf-8?B?dXZ0N2Z6MmhqZ2YvWEZtRDdWU3FDaWxWdHFRTnpNbnNPdGxmT3lUeWtCQ2pV?=
 =?utf-8?B?d0tiY0tZbDdYam4xVnBmM3pmc3JoVFJKVnJMTDhQVHhZZ3BMWmFEM1RKYTU4?=
 =?utf-8?B?VmJ3b3NGTTFKQjVqTWJ2WUJYa095OXZTTjZJL3dGVVhjaEowYnVBM1EyVXl5?=
 =?utf-8?B?L3R2OHA2ZE92Y2RRemhsVEFlVzYxSTVhK0xvK0p3aVU3c3ZjWmhQOFVJNHF0?=
 =?utf-8?B?RWRhVFlXNnBlQWF0TEJtZHhRNG1UTEVKTjJZYW5ScUVBTkNIT3RJZU4xT1o2?=
 =?utf-8?B?ZFVORlNuc3lUTi81UEN0eThRc28zWm9pdW9ZbC8zT1AvVUZjZHBzYmJUVUZp?=
 =?utf-8?B?Z3lodzdqUEtCcENIbjg2WDc3YWIrTU44N09jMnIrbWx0dy90Mm93ZlROdnZq?=
 =?utf-8?B?WHNNWXBsdEFhSEwxajd1YlAvWFY1OVVEWC9WK0FtT1pHRnFpbjRTdDJCbTdK?=
 =?utf-8?B?QUdNOVp6VTRGMjg5Sk9XZ0dKWkRWZHltQ08rcTQrb055ZGlraUtjZVRocVFY?=
 =?utf-8?B?SVBnVHJ3andIWXR4THBRcS9sclJMOW5vUUQ1d3Nua3pUV1FyR1hwaTArYU5y?=
 =?utf-8?B?Z0hHMHYrcnhoYlJsUG5oWm5VaG9Nc2hISHZiVHpsMEIvUWdaNlRhSDJTQ1hJ?=
 =?utf-8?B?V2JkQXJhZklvUXBiajl6OWY2NGVwVllxVFRDM05XR0xVWmxTT0cwaXRoUEZh?=
 =?utf-8?B?eng4SnJhZjRycVdKOEN6T0l5TXl2bFgvckllUjNkSEVESTZmQ1FaNDlRVG9E?=
 =?utf-8?B?N0tIWXI5dGdLVUZlZVBLdTRxVHlObnNWSnljMXFxSDYrSTh3NUk0SXQ1V3pj?=
 =?utf-8?B?ZXQvZEhlQlg4M0ZnWUhqQWRCbjk2MUtLejMramQ2QWZKcnM4clcvYmhhd0Z1?=
 =?utf-8?B?dDdzLzB0UEhlMVNQblJjdUxiMFdQT0Q3Q1E4elNBUU5la3MrTDFBR3Y2dEhr?=
 =?utf-8?B?MzcyWWhpRjd1WEVCU3ZpRktBNWh3aGxDbFRwMk5lOXBOWDdXa2ZPS3pHNm9I?=
 =?utf-8?B?bXN1V2pFQVA1emlTamRLQ0h4b2JTOEU2Uk1ZTUZ0ZE10aXpHTW1HaUxrOVlU?=
 =?utf-8?B?NUlsb3R5SmVlVFZ3cHQ3Wk1UNlhYZ3ZIQk1UZ2s2WnhJak5CWEcrQ3JvUnBY?=
 =?utf-8?B?VUpZU0lpRzF2NjFTL3lDSzBCS3VhS2oxRzhpUGpVUmwvdGtNSWJhOWV4RFMv?=
 =?utf-8?B?RFlVU2JHbGhleHZzUHJBZ0NsTmdzZEVEblZNeElhalBmTUJTeElNT2k4V3lP?=
 =?utf-8?B?QjhIWnphY3dybkNnS1RTTUlnaWhONUVmekc2RDUzUnEvbUFBVmtZb0ZPS25k?=
 =?utf-8?B?ODkxWEx4cTJidmtWTWRTOGhGTlhNdnE1b0VsY0RZdGpJS2gvdVRiYnREOHpt?=
 =?utf-8?B?MDdOcnRubnhRbUFHc3hncWIyZWtKdXlBZi9mek82dHp6RW1OSlB6TE1mbzVW?=
 =?utf-8?B?a0JpZ0xpMHZsSW9PdW5qWTMrR0ZiaGJ1dVhnY2syd0lUVXFnNnZQU214R0RX?=
 =?utf-8?B?WkNHbmtHWGhKT2w5eW8vKytyQS8zcnVxT2U2cDNWVisrY05URHA5eGZqSmpV?=
 =?utf-8?B?a0pPUUM4a3M4REdhY3c1SWlKdDV3YlJKdkFXRmdvK0FRSWJZMk9iVjFGaWgv?=
 =?utf-8?B?b2lLcTQ0aWwrcjBGS09BQXdacENwTE8ya2tUNFd5TVF3NC9JRFF1OHN6dFd3?=
 =?utf-8?B?Q2FWcmNpeUFrS1Y1UC9XWGdoSnR1cjNQUFBHVkZwNC9GZVNRVjFNZmZ6NlJG?=
 =?utf-8?B?a2syd2Y0QmxsYlUzcDVEcURHVWx6cnBCN3NoRVgyek9qb0ZVZGExeWNxc1Yw?=
 =?utf-8?B?RllZTlUvYngvblVMeE1uNUtTek9mRm84d1RGNFZZWjRCeHJRSWlydmZiYU9S?=
 =?utf-8?B?NWlhQnZtTVp2dVMvcnpGdkUvVDhKc3hzLzQ2cEovbWp2dGRwSU9YYU1MTmVZ?=
 =?utf-8?B?RWJuZkh1eU9MZEJKc1VwOUxNaUgyeVdtY0NnS2lXeUk5S09PUWVpT2pVWkFp?=
 =?utf-8?B?dk51TmxjV3E0dm5HWTdrci9JNVhoWllJK0VTczkxV3dLM3FBc2V5RGRhUlhS?=
 =?utf-8?Q?GEUlOIBu9NYjjDfwNqEntVjvf5R5w18EiBJ8iQXuE4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55536a4-a5c8-49df-6e7d-08d9a9fe4458
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 19:12:58.4951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTwjEeBusLh0SQ0T2I2vhPBHIdHUJ7+igF2OzPv2FOV2WcVDoc5yYnPasFaaDTru1ThKKdjD/jyxJpU8o2LTsnSlWt4KoGiFQJGsf5I2HlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6882
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::70c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::70c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.009, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

17.11.2021 22:07, John Snow wrote:
> 
> 
> On Wed, Nov 17, 2021 at 1:20 PM Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> 
>     17.11.2021 20:56, John Snow wrote:
>      >
>      > On Wed, Nov 17, 2021 at 4:42 AM Gerd Hoffmann <kraxel@redhat.com <mailto:kraxel@redhat.com> <mailto:kraxel@redhat.com <mailto:kraxel@redhat.com>>> wrote:
>      >
>      >        Hi,
>      >
>      >      > https://gitlab.com/jsnow/qemu.git <https://gitlab.com/jsnow/qemu.git> <https://gitlab.com/jsnow/qemu.git <https://gitlab.com/jsnow/qemu.git>> tags/python-pull-request
>      >
>      >     What is the status of the plan to upload this to pypi eventually?
>      >
>      >
>      > Thanks for asking!
>      >
>      > The honest answer is "I'm not exactly sure", but there are a few things to work out still. Let me use this as an opportunity to try and give you an honest answer.
>      > We've got four packages right now: qmp, aqmp, machine and utils.
>      >
>      > - I don't intend to *ever* upload utils, I created that one specifically as an in-tree package for "low quality" code that we just need as glue.
>      > - aqmp is brand new. It was moved as the default provider for the QMP protocol in the tree (being used by machine.py) only two weeks ago. I am using this current RC testing phase to find any problems with it.
>      > - qmp is something I want to deprecate, I don't intend to upload it to PyPI. I intend to rename aqmp -> qmp and have just the one qmp package. I can't do this until next release, and only after we are confident and happy that aqmp is stable enough.
>      > - machine has a few problems with it. I am reluctant to upload it in its current form. I am actively developing a new version of it that uses the new Async QMP module. However, this might take a bit of time, I fear.
>      >
>      > So, I think I have this timeline for myself:
>      >
>      > - Fix bugs in AQMP package revealed during RC testing
>      > - Introduce sync wrapper for AQMP that resembles the native AQMP interface more than it resembles the "legacy QMP" interface.
>      > - Remove all QEMU source tree uses of qemu.qmp and qemu.aqmp.legacy.
>      > - Delete qemu.qmp and rename qemu.aqmp to qemu.qmp.
>      > - Split python/qemu/qmp out into its own repository and begin uploading it to PyPI, as a test. (Do not delete python/qemu/qmp yet at this phase.)
>      > - Transition any users of the Python packages in the QEMU source tree to installing the QMP dependency from PyPI instead of grabbing it from the tree.
>      > - Delete python/qemu/qmp from the QEMU source tree at this moment; "re-fork" the package if necessary to collect any commits since the "test split" procedure.
>      >
> 
>     That all sounds great!
> 
>      >
>      > Some questions to work out:
>      > - What tools should be uploaded with qemu.qmp? a version of qmp-shell is high on the list for me. qom, qom-set, qom-get, qom-list, qom-tree, qom-fuse etc I am suspecting might be better left behind in qemu.utils instead, though. I am not sure I want to support those more broadly. They weren't designed for "external consumption".
>      > - qemu-ga-client should be moved over into utils, or possibly even deleted -- it hasn't seen a lot of love and I doubt there are any users. I don't have the bandwidth to refurbish it for no users. Maybe if there's a demand in the future ...
>      >
>      >
>      > ... This might be being overcautious, though. Perhaps I can upload a version of "qemu.aqmp" even this week just as a demonstration of how it would work.
>      >
> 
>     Why do we need wait for next release for renaming aqmp -> qmp? Or what next release do you mean? I think you can rename it as soon as 6.3 development phase is open.
> 
> 
> I might be confused in my thinking because there's a ton of little tasks to do, and I won't pretend I have thought extremely carefully about the precise order in which they *have* to be done, only the order in which that it occurs to me to do them. :)
> 
> I suppose I could do something like rename "qmp" to "legacy_qmp" in the tree as an intermediate step and accomplish the "aqmp -> qmp" rename sooner, but there's a lot of churn inherent to that. Since there's a lot of churn inherent to moving users off of the old interface anyway, I figured I'd just tackle it all at once... which I can't do until the tree re-opens again.
> 
> I can certainly work on it in the meantime, though.
> 
>     I'm not sure that's a good idea to upload qemu.aqmp to public and than rename it to qemu.qmp.. Maybe, you can upload it now as qemu.qmp? So, first, create a separate repo with aqmp (already renamed to qmp), upload it to PyPI (as qmp) - this all as a first step. And then gradually move Qemu to use this new repo instead its own qmp/aqmp.
> 
> 
> I'm afraid of doing this because I don't want to pollute the 'qemu.qmp' space with two packages that contain radically different things in it. It feels safer to fully switch over the QEMU source tree first, and THEN upload to PyPI. If I go out of order there, I worry that we will run into circumstances where various scripts/tools will use "the wrong qemu.qmp", and it will be frustrating for people without a lot of Python packaging experience to diagnose on their own.

Agree

> 
> The safest thing is just to wait for me to do all the cleanup churn I laid out above, but if I were to demo a "preview", doing it under the 'qemu.aqmp' name seems like the safest bet because I don't plan to use that name long-term.
> 

OK, that's right. I just imagined a "fast path", but it's not safe, you are right.


-- 
Best regards,
Vladimir

