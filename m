Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DDC31090C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:28:30 +0100 (CET)
Received: from localhost ([::1]:49456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yLl-000206-Ol
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7yIs-0008KH-RA; Fri, 05 Feb 2021 05:25:32 -0500
Received: from mail-eopbgr40091.outbound.protection.outlook.com
 ([40.107.4.91]:64354 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7yIm-0003uI-VC; Fri, 05 Feb 2021 05:25:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URGWzvV+zLwJAd86ZDL5bCzIlTTGO+QIdzTgQ/1+M4OxUvG2k6pBUpLRHgmY6ssGt7N5DWQujW6WR2LDJA4x3N7bl4Z/ey9dyoEmOQ0K7XamGlLOZ0T7MBt08TdbbdHuatN83BmJFuglykihiQmwyNdkAHYRRKtYd8VzhhIWTLlReoH4EQuQK1DJP2AKkeZxoQMjhpdWAg+DGV5Si6EQZ7BqiUBN+Iln8mD8VTpPaEkC3F+KQukytLNXN8hjx4ulNVehoaHN5i4GifK2K6wZ9oKzHdp6bwaMt1FC4GQKxXjcVfHmIK3d1orOTE6qahQQUT5mmoGJUyV+HgyjQpXVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heuS89cG+8Ka03+GDUdzmMvrlI2sTg17sGDbmuSUzco=;
 b=nrdYT570T4LO/6E+C35eSB4hVtmX0/JB8I0zt7Q8qYPIPeIEBrRwcwda0NvabZTKqHZNXo3f4yDNTnmqg5wJY8pGtJbWWb1uGyeKEBZ3uowypapELGLxSavaeP04TNPeBCDEcocx9WUUdoGU3x1m2pBxRUS5/WQOCE8gfvd/k+5SE8aLp7MH+3qAMyEz0HOU/lvpRqy/gTlcqs0tyQZ8Lsms+WJIaWU0/QCheXe+T41RNg4JHOSJDKKjvaXFW415Zmt0N7/Lc8jl7SPcns2lheUUyx/kX1fVGe4RjU2EcQ8q5tlV+2GD6fOrri4wKR4Hp1FNiaEq+DmFRxUH7lAvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heuS89cG+8Ka03+GDUdzmMvrlI2sTg17sGDbmuSUzco=;
 b=BXB3Qi3XCktcP6mYQ2SkkYbWdtlSfwR/Z11Mm5gnElQsuGOI6gZJKaanxv7YrFGQ28lwKaFp3fCpq6Cm8x+DOWeoZIbXSmG71wkxVdbNvHEdMJDnKeOBNoq9kqtCytIkRyL9RU26ts3L+wyf6h+4SPVThMZ/LNQZc8gOdSTaVl0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2100.eurprd08.prod.outlook.com (2603:10a6:203:50::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.28; Fri, 5 Feb
 2021 10:25:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 10:25:21 +0000
Subject: Re: [PATCH 2/3] utils: Deprecate hex-with-suffix sizes
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: rjones@redhat.com, berrange@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, tao3.xu@intel.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-3-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7d2c705b-8bac-5229-00e1-0c3d2f1a6f07@virtuozzo.com>
Date: Fri, 5 Feb 2021 13:25:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210204190708.1306296-3-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR01CA0092.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM0PR01CA0092.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Fri, 5 Feb 2021 10:25:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c17e27d-ee44-417b-b442-08d8c9c0576c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2100:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB210012051316A2A3B481D0F1C1B29@AM5PR0801MB2100.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l3QF5R/Dkac4g4KCjqajx0vNbcV5p92AJRGmVjTc97fEw8IyoWhTHHzM35Hc2wq3kcdaM4bxOVRbAIZHt/f26Bj0It1/Z0ZNXBSPXbDboRiph99Iu3LjVmDqTQ25M6K6k04R7MQTl/eY4+hbEPbNvqS34AWkm5BSvM7P11DyFfP4zc6IOl5Svx+xBr4Ya3ziJIOhqkYWSqa4dXIDZy6otm3vT1TtYhNP2+16AWtMdymsa/Rulgc8sc6BP0gLmJyFzG2Pc1aUD0oeRRkvMjodhI1akaeYbtB5oTRZbiz1YWCxdJkgXII3kwvc0ECsizC+WgMj5ObP9XSO75mZb1lZaayUnyRO6xm3eQeEGWikHZB50Nv16SVlrwwq5S2IVadGnQxlqJDFDsk6ILeEkxh7Cf6L/VxhBQjII6UYLOSAs7mAhIon2vAmEPnhXHeIhw/q53h57+twth4vg2COflRU0Y41YatD35wX1u857o42F1ck3YuEPC5kIFE8yugJDM8IQxOFV3yOjF83PEUXlmqBLvN7xAr6I3g1u4zV7LrwHLQ1uD8lnPwuH2+Wy69fB6611AE0fHwjHpMcWXYpnXRHAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(396003)(346002)(376002)(366004)(2616005)(86362001)(956004)(2906002)(6486002)(4326008)(52116002)(36756003)(5660300002)(26005)(16526019)(66946007)(83380400001)(8676002)(186003)(31696002)(31686004)(316002)(8936002)(16576012)(66556008)(66476007)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OEkybkhiTER1ZnBYczlSTm5vYzhWZ2dIWTNPNGpwa21rQ09XTkFSdVd0TGVi?=
 =?utf-8?B?cUl5ajR1OHo3bDNXVGxlcUEyQkdzbW1LdUVXakt1UDF3RktaN25DOVl4amFz?=
 =?utf-8?B?OStkb002NHJXREI0bkUwUlBzVU9xOWJ1VVMzeFBuSEwxZE5iazVHNHVSZ1ky?=
 =?utf-8?B?QXJEYXZSa2dzOGR2UFhTUGx5YW43SHdtcTgvbG5rWldhWlVOWTRmOS9oMVdE?=
 =?utf-8?B?SVRhUWMzUHcvNEgvbElZbDA0Qm43S3lvcWxBUzZKS2o2UHhtSWplZzFPMGVM?=
 =?utf-8?B?M2FoMnU4bXFLdEJEWGIvOUNUSG10U1hBUVBEMmYzTU13UkE4WW1qbTUxTVdI?=
 =?utf-8?B?cHVBRWduUm5iTkhiU1dlR2ZkaW9BWVNFbDBnYTFzRGg3UmZyM1dDRFBMdmVw?=
 =?utf-8?B?a2N6NlQvWDd4NXZCakptUXdjcTZpQXBtUmhCd2NGMncrSkltakNWZnVuakJy?=
 =?utf-8?B?K1BwbkJ4cm9LelBucGNMdzlZYmUxZ2c0VzErTjA2V01BU3AvWTF5R01ZT2Zm?=
 =?utf-8?B?ejR1MXBEcEFHTUc1VXdBR0FnZ1U5ODZIKzNzbzZqMHRyTVUxMXJpa3JOS3kv?=
 =?utf-8?B?M1c2Qm9WeS91b0NjeVNoS1RGY0NEM1RLckJLdWlNbGRqOElaZythaDBkdHRl?=
 =?utf-8?B?cUpiRjVRdWxIMHJJRUtYSHhlYUp3ckxzM0ZIV3A5UVE2T0kzMFh4Q3ZLK29y?=
 =?utf-8?B?VDVpaklHa1ZnTUxueXF2TWFjbXFaVUhteHozMlJJU2lsc2lIQ3M1UkpIa1FS?=
 =?utf-8?B?UjRkSHg1NlM4cjE1Yzh5OVZEOU00RWl2a2xhZVU5TFpGZ25qcUY3dmt0dzBB?=
 =?utf-8?B?NnYzKy8wR05QM3BtWmk5ZU10M05neSs2R3RTOENMQnRmRENwMFRPZG5CMG4r?=
 =?utf-8?B?WW8rVnJwcXQ5czhTaFk5Y3IxcEFVd1NBbytHdkE5T3Q0dGVGUEpzUHRBNjhh?=
 =?utf-8?B?eEZrelBlL093K0I0QkdVSEFTTVJDbndFL3JFWkxmT0hFc2ttaFNlZXQxQ08r?=
 =?utf-8?B?N3hocTlyeW5xOW41MXEvSVV2UkFDUUliM2dxWXNranFZWlRUd05saTB1VCtZ?=
 =?utf-8?B?Qk5XV3pIdXhveUJrT0dvWWFoVnhHZUhjeEVyY0Z5dTU0QkNPbkNTbVBGMjNJ?=
 =?utf-8?B?R09LbWVnTlZUenlOSlRkOU1rNHBsZEZ2MWdMaTBZT2NsVjF0MEJ1cVBsVExX?=
 =?utf-8?B?TGhxaVJVRXkxMmR5Y2dUb09CMmJKaTh2eVQ3NGJubnQwdTZNWTdKZVNJN0dK?=
 =?utf-8?B?angwZTg1c0daNFp0YWZiZlpOTXQ0OWlqTXJyOFV5NjlPZFh1M3hlNVhJUVRD?=
 =?utf-8?B?a3JtWE9NVzZ0UVJIMCtMeXdQMUJ0THBmQ3htMElXNDRYMFNJZ0xzRWQxS2kz?=
 =?utf-8?B?d1RmNFpPZlJlTHNmdC91QUVYSjZCZC81RjFta2pJVEFsUUlPdWxROTdyMSs3?=
 =?utf-8?B?K0w3RG5ycnJUWXR6K1RxVk9aaWdVMTgwbmhxc1A3TnJwV3MzSzNGeEJjTGhi?=
 =?utf-8?B?U1ZtbERiaGIreDU5cnlzR2RsVEFoRTJIVC9xM05jTTBOa3RUcTQrVVB3L1pq?=
 =?utf-8?B?TFJwK1NGeHBVc2ZxdE9POW9YUW4wZndFMkZKV01qQXY2UzdyTWdNcEw2QkdG?=
 =?utf-8?B?TlpGUTFhSU9EZ3BKZUhRZWV4d2I4Wmd3eklLV3UzeXNYMjFMRHBZNkNldVAw?=
 =?utf-8?B?ZUovSVlKbUtkOEhZN01VNlY0QitkZG8ya04raTdYSDBuVGN5L3lGdXVkekdH?=
 =?utf-8?Q?+pbfdM2NusmHY1ijF+CgXzjDLfmtkR2EyINFSdl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c17e27d-ee44-417b-b442-08d8c9c0576c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 10:25:21.1775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zfp+I5Qx+Q1zKQX8Flc5BY5tzR7cjkEXhUw90zSV9XKdrF1lDaSKBNyq488gkiE3XHky69wbnCPynJWaJnHJQkK0dg7khkJf2wYusRvQwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2100
Received-SPF: pass client-ip=40.107.4.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7,
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

04.02.2021 22:07, Eric Blake wrote:
> Supporting '0x20M' looks odd, particularly since we have an 'E' suffix

What about also deprecating 'E' suffix? (just my problem of reviewing previous patch)

> that is ambiguous between a hex digit and the extremely large exibyte
> suffix, as well as a 'B' suffix for bytes.  In practice, people using
> hex inputs are specifying values in bytes (and would have written
> 0x2000000, or possibly relied on default_suffix in the case of
> qemu_strtosz_MiB), and the use of scaling suffixes makes the most
> sense for inputs in decimal (where the user would write 32M).  But
> rather than outright dropping support for hex-with-suffix, let's
> follow our deprecation policy.  Sadly, since qemu_strtosz() does not
> have an Err** parameter, we pollute to stderr.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   docs/system/deprecated.rst | 8 ++++++++
>   util/cutils.c              | 6 +++++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 6ac757ed9fa7..c404c3926e6f 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -146,6 +146,14 @@ library enabled as a cryptography provider.
>   Neither the ``nettle`` library, or the built-in cryptography provider are
>   supported on FIPS enabled hosts.
> 
> +hexadecimal sizes with scaling multipliers (since 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Input parameters that take a size value should only use a size suffix
> +(such as 'k' or 'M') when the base is written in decimal, and not when
> +the value is hexadecimal.  That is, '0x20M' is deprecated, and should
> +be written either as '32M' or as '0x2000000'.
> +
>   QEMU Machine Protocol (QMP) commands
>   ------------------------------------
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index 0234763bd70b..75190565cbb5 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -264,7 +264,7 @@ static int do_strtosz(const char *nptr, const char **end,
>       int retval;
>       const char *endptr;
>       unsigned char c;
> -    bool mul_required = false;
> +    bool mul_required = false, hex = false;
>       uint64_t val;
>       int64_t mul;
>       double fraction = 0.0;
> @@ -309,6 +309,10 @@ static int do_strtosz(const char *nptr, const char **end,

you forget to set hex to true in corresponding if(){...}

>       c = *endptr;
>       mul = suffix_mul(c, unit);
>       if (mul > 0) {
> +        if (hex) {
> +            fprintf(stderr, "Using a multiplier suffix on hex numbers "
> +                    "is deprecated: %s\n", nptr);
> +        }
>           endptr++;
>       } else {
>           mul = suffix_mul(default_suffix, unit);

should we also deprecate hex where default_suffix is not 'B' ?


-- 
Best regards,
Vladimir

