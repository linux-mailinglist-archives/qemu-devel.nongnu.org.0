Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7A730C587
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:28:27 +0100 (CET)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yXS-0002jO-Vo
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6yLs-0002wb-Cq; Tue, 02 Feb 2021 11:16:34 -0500
Received: from mail-eopbgr130127.outbound.protection.outlook.com
 ([40.107.13.127]:42339 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6yLT-0003Pj-5J; Tue, 02 Feb 2021 11:16:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MK9eYSxPwapMjwQn4wd5NtK3ive7eHUom/2+2hfqj/jzgLx+k6CCZ/ZpsI+FNVuqRqFBJxX4NcZYDnPG+VqlXxET4oT1fiIl1JdsD1I60IdO8vB8dxQfjPv/K3FL2Hz8363IpZW9kzfozkwyKTDCi31lIZiULak8COXcvigPbFuka1oQTAgrsIIpf6ttrKrpEl0bBnYKowG8b96yIHQU+LkVAtwXV8qjcZ06HfTFul5tj/Wy3ZvOfRDKYAMRohfeff5SBFquxEu0FRhn9XQLhiIR2WAsxH6Rke6HOzjY1QkEPJneDBqKEu9UF1nVfs9uXMzrTEBRS6koxEGqr24AKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLkz1rCVfpFdk63yhMZVXGjXgeCKV0txViANekqbk7Y=;
 b=KhkAVGNwO8Ed6+XnYcVKh0ZFqu4HuhZCWYjwOJaLO8vvF27fENU0BAtxSjl8RPgoUeVj4hzzrR3D+1REQQKLuFBNjHqGdqZQcqgVpo1Mv1jUL09it8xyp4nz1ACG1T1vdL0Aa3qk+LPZFR7xKPo+/BdVbNueEs63qrmc2d7WPa5E4USWKPG0rDEN9aQ8CW3oBN54437QHnYilxZXnSRVpRXhRA6BRh8ItlTDY9GTj9P/BKs1CH57wZ2ralXP0vlg3ZBCjfvQaM1UW/Ioh1zyvmP9g1gBaP5uJvE+lEEL5CyQHKAQsH44o3cu2eNAdT8lsAdGdZCfhc02vEGgXpEkHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLkz1rCVfpFdk63yhMZVXGjXgeCKV0txViANekqbk7Y=;
 b=D8s8CX6j0rQOGdH1ZVoh4xgCjLERuWxsmPAzgya9LNhMD+FJP1GroZrwvYiOnWof90r1BzYMqXcsOzPZ8GEd2IXVYD63EkSr/cu/F52ylAU3U8vP4GogI6svEAtGsaUIm4icAGNBHpjqxjUeYoessyoxe134+1JSZiks63nytkk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3573.eurprd08.prod.outlook.com (2603:10a6:20b:4b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 16:15:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 16:15:57 +0000
Subject: Re: [PATCH v9 6/6] iotests: rename and move 169 and 199 tests
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210125185056.129513-7-vsementsov@virtuozzo.com>
 <20210202155741.GN4168502@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1ffa6f18-1e87-a43e-6f28-354557c9732b@virtuozzo.com>
Date: Tue, 2 Feb 2021 19:15:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202155741.GN4168502@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM9P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM9P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.18 via Frontend Transport; Tue, 2 Feb 2021 16:15:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c201fb0-0ec0-4de0-01fc-08d8c795d2cf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35731A8F34B02582EDD86462C1B59@AM6PR08MB3573.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bRcQ9DQWSAOvjP5gouNnDdi7JnnIoRbiI8ZrXMlaO+s8QZCzLtSy5mIsl6HSC4m30L+eRZbl3tNwZyPFk3HsRj7kRPnRalPBrHB9P6pdODt2557wc5QqGsaWBmmcE6/cxDteUPquzocOuiBlY5yiWpPImFjOHAJ2UVmj1jsT+Oqte7mwVO1DrN6URE6VpI0DhhWk5QZQ2jxJdzjn8eGyhWUpvcSoG6o+z76GvcDptwwZ/lK6ZIDlM0hCy8Zi4WRtdkUAAYoxcWo+tPUf+uJ9/oEM9+NC/mCya3VNGgldnOj2JmbkYGRVjIIOa6cRrdRb9MnxwoOKfYqoc3XM1AhTN5nOf4zw3IGKCFVumaCRMZXSf1zeNS8NrK8QN6eTv2rVR35ZadO53HryOMO7JDmdSypseb5SrqcyNZo+OEIDrTJpv9UjU52UeV1kbtusVgrUbG3V5i4zfp4ZRqPYA5IyqszIbM3zZR20JHdUghKeJH1ls0E8qb7op6yqml2keRcN9zjvQLRpTVZQ7s2hDqXKUpquk2zu7H/inF1z7T7EmjUEcjj4isd9vsmv7f5LdT7RI4jfpUDcDIE38g5IcuSkNJgtg/wzLq1rieJOw0Da8mEy91VtTSwA8a8dUnj/3t4Euad/Y2MUFdUSwFnWUAHxWGl3gchpGVllF7NA+23qXj1jULQHNUISPfvE9L4SMpGv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(2906002)(16526019)(83380400001)(966005)(6486002)(5660300002)(956004)(4326008)(86362001)(6916009)(36756003)(66946007)(66556008)(31686004)(31696002)(66476007)(26005)(8676002)(186003)(2616005)(16576012)(478600001)(316002)(8936002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YllaL0xzNG9KazZ1MFM1NUtEVS8rSjc3R0pqNGlLNk54c2FjL3Y3MjJucUUw?=
 =?utf-8?B?VzFtSUViKzlFWXkzSEErbVFqVXl0S29yOWJpU0lxL0tDZU84RzVZSkgvUERn?=
 =?utf-8?B?R3lRdUFCb25zYnR5eHNEQmpERmllRUEwRFZiRjVCOGF5bms0NDEzTklPcEtB?=
 =?utf-8?B?bERlMjllTkFSN3lLTHlsSkkyRVR3OCtybXdNUkdrTjVHdVQ1dVFxbDlIRitQ?=
 =?utf-8?B?aW44QktoQzJhdk80c0tkY01rUXVIWDBNRXpENlpXb0lHc3lvd3JsSkVhODdW?=
 =?utf-8?B?bjVDb29welRTWnF5akloendxWmFFbktUcS9QQkpyUzJ4R2Rzb1dFMEJVL09s?=
 =?utf-8?B?SnJwMGxQRE1jcy9LQ2MzUk1valNNN2k5TVcrQU40TXJXUlExdEdmbWFNNjVy?=
 =?utf-8?B?TWhQVzE2bUxvRm1CQWVxdEtoNHlka0FEMzJ0N0lhckxoS2gzeE81RVhsUFRi?=
 =?utf-8?B?ejd6bjJWaENCWG10WWc3Q0UyaDg4dzhYTk5OV1VHR0lyRWRzZjc5NU1jVUR1?=
 =?utf-8?B?RVVucCtQVGc3Y3Jud3FwSlJPZXk5UE5hTkh4SlhvZXF6d2tYZ3c1RnFIYVlO?=
 =?utf-8?B?Y2ZSWUhMTzlGVW1PaG44UStDaVdaRFA3S0RjWlZqVG43am5ZZW43YnpzbU02?=
 =?utf-8?B?ZkJqalpyY2tqcUlxRzRjdWcyc3lCdGF0bXVLUkFFc0RxZmJvTHJBeHM4L3RS?=
 =?utf-8?B?OGRFekhSbmdMMEdTUHdiZE5wOTFxR3ZLenQrVXIrWWtJM2huVy9Ed3pBSlpC?=
 =?utf-8?B?NU1HSndGRW00M2IyWVJ5VHR5YndncUt3YWY0eDhvMElld3EwSkJkVXBzdGJZ?=
 =?utf-8?B?L0xSVW1wRHFQVzhqSWphWXU2aVlCOVh1cUlMbFJjbmNvR0FNMEhUdmlsTjRL?=
 =?utf-8?B?R1RGaUIyM0pONVVhVzNDbFdzSTl5bDR3Q0U3WFZYQllmdWtZRzdZZ01TS2pW?=
 =?utf-8?B?aGdFSG1LVkUyaVZHK1QrZmZ0cDZZcFp4LzhoNnQ0WkNLSFNkTEh2VWtyUHpp?=
 =?utf-8?B?akFTd2RpeVl5MVJmK1hvUkwzYUtKYmJwL05uZ2t6bDFjemJ6RENmQlV1Nngr?=
 =?utf-8?B?Y1RKd1h2NTdyZWdlWDNNb2JxREZaK1UvY1JxWUQyQkdZM2RIdFhjQk5JVXdV?=
 =?utf-8?B?RFVvVU5udklRR0ExK05Ic29HenZYSE5zQUJEVU9XTEZMWGxmT05BTUw3bTRY?=
 =?utf-8?B?ZVJEMkdFdzN1NUtKUkRJMldxZm9ZMEFFREsyMHdtdFNDbnRsN2xjR3cvS3Vt?=
 =?utf-8?B?UWRuUXVzTzlDM0dxWHJvc25EREdIcVhFWTJ3eUY1ckpaRzdZWXRianJzNGx3?=
 =?utf-8?B?aW1QakM0dnpFU2lxdEJEdjhORHJiaHUvNGwrODlzRVI5Tm5TZXVDSzlDaVc2?=
 =?utf-8?B?OGdINjArRUNaajFGRXBxN1pmeEo1WDlnczR3aWc2ZHIzQ1c3bEdFOHg4N2FM?=
 =?utf-8?B?a0ExVG1OUHZ0WDVkaE1pY0t3ZTdsOWVwTnl1YUxnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c201fb0-0ec0-4de0-01fc-08d8c795d2cf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 16:15:57.4846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AoRMTBhdvwn6FGEFZ1/wnpm3jN0T41mu0NwVPIxSIslOpZFDu55WRbajipoO9dePyQgviGuF+Vn++PlaP6FKQSKXDRV3Fu0rLRDecQOqpTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3573
Received-SPF: pass client-ip=40.107.13.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.02.2021 18:57, Daniel P. Berrangé wrote:
> On Mon, Jan 25, 2021 at 09:50:56PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Rename bitmaps migration tests and move them to tests subdirectory to
>> demonstrate new human-friendly test naming.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test}   | 0
>>   .../{199.out => tests/migrate-bitmaps-postcopy-test.out}          | 0
>>   tests/qemu-iotests/{169 => tests/migrate-bitmaps-test}            | 0
>>   tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out}    | 0
>>   4 files changed, 0 insertions(+), 0 deletions(-)
>>   rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (100%)
>>   rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
>>   rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (100%)
>>   rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)
>>
>> diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
>> similarity index 100%
>> rename from tests/qemu-iotests/199
>> rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
>> diff --git a/tests/qemu-iotests/199.out b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
>> similarity index 100%
>> rename from tests/qemu-iotests/199.out
>> rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
>> diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/tests/migrate-bitmaps-test
>> similarity index 100%
>> rename from tests/qemu-iotests/169
>> rename to tests/qemu-iotests/tests/migrate-bitmaps-test
>> diff --git a/tests/qemu-iotests/169.out b/tests/qemu-iotests/tests/migrate-bitmaps-test.out
>> similarity index 100%
>> rename from tests/qemu-iotests/169.out
>> rename to tests/qemu-iotests/tests/migrate-bitmaps-test.out
> 
> Thanks for making tihs happen. It is great that we now have this
> feature and I can stop chasing conflicts on rebases !

You are welcome :)

> 
> I converted my savevm series iotests to use the named test in the
> tests/ subdir, and hit a tiny issue that will affect any tests
> written in shell. They can't load config.common. I've included a
> possible fix for this problem here:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00627.html
> 
> 
> Regards,
> Daniel
> 


-- 
Best regards,
Vladimir

