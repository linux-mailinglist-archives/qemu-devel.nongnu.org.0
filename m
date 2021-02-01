Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BD30AC87
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:24:13 +0100 (CET)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bzo-0000Wv-TS
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6bwo-00074z-8G; Mon, 01 Feb 2021 11:21:08 -0500
Received: from mail-vi1eur05on2105.outbound.protection.outlook.com
 ([40.107.21.105]:4321 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6bwh-0005rx-LJ; Mon, 01 Feb 2021 11:21:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxVpgmgy5s/21LBHAkHQefhEzTKr2Wyf2/LnRwix6yhZ01RDcYcq8XQ0oI1XFgaM+3eiw7H0jtjbH9jjxDV/Gh7x0An3+ZpskWk3TlyJvB+KnFnWWpIczEb32TOKqZ0mdKm6I7A2bYUmMaWRVE2DEBJN2qektr4JaO5pSdJEfxRP1XRo0pTjfTlyJFzvfuRbcGIupVXL3mU3iByZzZHkDac4N4TKDJT2j2jj7LOJhdmPVv8pjlzBnUHRGOsup7UNkIVq9Or//aPMvkP1F9mEEffoEYXa0mb2dcR4Iwh4lPq4owQ+v/217PJo5/M96K1QtABC1XUYxPz75nZ4mfmcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JIdJm2Y784wu5yyoFcRTxlOWlzhzJNng176XqX9ryk=;
 b=moKkUTfjz1wx6PbhVX4/x+I5fm/Toye80hHiD7fHAwlj8ruZxGAoubcTVV0j1rXaCTpoccY/VoQ/Dt6HaRiSQEmQTLFhi1qmY7za1uSZUH8lfKSXgj1e9UCS4gJ9WseN9nIP0F+QNTk648wl2XlhhwaSAagufulufCFCU5KNM4ZX15CS2Bo8XgGxbid83LkiyCYDmb47P47RqsRvfdRu90m7ySDz08ZoObFHJcoZ1bRP5o9E4XErlxLCbsxPfouoNG904RxKGB0LSmyGIOwTp1yvySucHITnZpFTetR1eGGdtXeBrg46fY0BW3wYs8FyEOA5iaHuDNZblVu/AGFrLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JIdJm2Y784wu5yyoFcRTxlOWlzhzJNng176XqX9ryk=;
 b=WGaDu492JlDcqnmJsPlFimbEScXbTyhCTdsJ3JEPt1eYDV6ariGl4WFaWIQ5Mh2qpBqfXJEhrRqIdf6KuszHGhcZJxwfRzxg5CoR9z6SVJhq+IoMqnw/KnbeCSTZhlCuGOD5b4BWBfnPdTqwRHAgg7k0Xebyqf7K0vYapKB+Ito=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5384.eurprd08.prod.outlook.com (2603:10a6:20b:10c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Mon, 1 Feb
 2021 16:20:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 1 Feb 2021
 16:20:55 +0000
Subject: Re: [PATCH] MAINTAINERS: suggest myself as co-maintainer for Block
 Jobs
To: Kevin Wolf <kwolf@redhat.com>
References: <20210128144144.27617-1-vsementsov@virtuozzo.com>
 <878s8d85dz.fsf@dusky.pond.sub.org>
 <2651677f-aa5e-1937-0fb6-767c080fccdc@redhat.com>
 <094df33d-f944-7a68-c0b4-a7c509287a6b@virtuozzo.com>
 <20210201145056.GD13157@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <304b3b7c-a58e-901d-7f52-b6efb1c1fbfe@virtuozzo.com>
Date: Mon, 1 Feb 2021 19:20:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210201145056.GD13157@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.160]
X-ClientProxiedBy: AM4PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:200:89::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.160) by
 AM4PR0202CA0010.eurprd02.prod.outlook.com (2603:10a6:200:89::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Mon, 1 Feb 2021 16:20:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a9c8e8e-7830-47eb-0003-08d8c6cd5a10
X-MS-TrafficTypeDiagnostic: AM7PR08MB5384:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5384ADE7BFD23720C96E1233C1B69@AM7PR08MB5384.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kFxRWjh3R9zFZsstiMkPr+alQiiitoJY41jJoIbSdSnCMFcRBzm6uSEAFuDw/GMAqJT00MdNss9BlRYLruClZDrcYyEvGU8VLcL87NRi10R893HfoszEzZrHwXgEi0TZ4Jy8eQb506HVsQkhD6IadinYaoRlLeXBsrNVj9sR6OttZEpohmE7i+EH4aaJ/jiK0c89ytz9ees8Cl6dOM7ehet6E0mOyK/jF1uLPwhI1nVed58mPhI1WXlHHleQjv/I5LNY/FrWw29f14OIuOxCbRpz58JFkoJ0OCpfo9AHRh8/O1L29xT+4D7XmSV34vC8q9AVw3ZsqS2opTPj+Q2BA4EUYznComeY65mOt7/bv2KSRlMKVhjbIJ0x0VcBfwSQSCzZBon/gpJ9WKKuOXX/7/zK9ostbQ63NdxXmH6/43SKq/ETJnHjjvMnvsNed3C0FsEOUeEQw4ShDcdpZvyuklynmarZKhMxqQx2x2YUmMi6ObZfsebo2rnzfMwpv1EDH4iYG3bNFgdg4DN7iELswCETJMCETqNFHVZKwklhAKrAsd4hMns8PAxo2qBD+e8Z+en1g+kKR8rCBl97+rzhEEdJtupmYEApUJrJWsy/arL/dZvgIL8CSppEonXOnzZg13ULt5wTON6gDb3C2UNDBYclIuo9uAeVNFULeq0HyMK3flBVfRd2dcuVCC4vPajl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(498600001)(83380400001)(53546011)(6486002)(16526019)(186003)(4326008)(66556008)(6916009)(966005)(5660300002)(8676002)(26005)(31686004)(16576012)(54906003)(8936002)(66946007)(66476007)(956004)(36756003)(86362001)(2616005)(31696002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUdSNkhhalNVZG9MbXpKRWlDYlAvOEFEZWtPeVROdkMrWWhFUG4yYXdwbEcr?=
 =?utf-8?B?RVR3SUZRcUhGMlZWcWxlQktHcXNOcXpqREdVazlKRzlCSTYxYWQvQnZSNEJp?=
 =?utf-8?B?cG9DcWlHZWxjekVsMUN5cEkrVlZ1R2tKWUZvaHpoQnRmeXEyQ052VXdFRWVL?=
 =?utf-8?B?RVM4RVZnS05paTM2THErbzVHSFRFWGtHeHhod2lWeENlU1JYeDhHdHY2MjFI?=
 =?utf-8?B?Y1FWaG13citiMW13dm91cU5xTk16TjhNTEJZcTJNSnBvVlY2b3BNR3ozNlZs?=
 =?utf-8?B?b28vckZabnJ4REdjVlcxeXk0eFBpS3FHTDVGdUtPdHp5MCtGWk4zM1dTRkcz?=
 =?utf-8?B?VUFTSFJXMWdOem43SlpQT1BKb2N6QnJDV1Z6a1VWb0tSM3pZazB4MkhEN3BW?=
 =?utf-8?B?MUU2WDFjZ29XZXJFVjI3UG9vcUVRTlpTa3lQTkVOUGFkV2pQY0E5VHVxQnVO?=
 =?utf-8?B?NDJsdzRZU1o5YkVtQnpJbkQ3L3FmUnZGcmVRdmdWUVhWRzViQlhnY3NwcTZY?=
 =?utf-8?B?blFCbHNUNFY4WDFES3dJbEtiS1dFZnhHSEIxY0hjMzJIc1d0cm05c3NMeENM?=
 =?utf-8?B?c0NJQWVYSnRNOXRES1h0STJ0eGtPMVpzdWlTNEo1UEUxV0swVDk1blZkaE1o?=
 =?utf-8?B?R1NzQUZCTSt2RXZHeFZLS3JxTjRHUGFoQTZZdEoxVjFCckRpSGR0Ujduc3Np?=
 =?utf-8?B?cnFJcUVaNnVqSmtuSlVZV0tNQlhpb3pPRXhNMlA4aEp3NWJrK21mR0hIK3Mw?=
 =?utf-8?B?azh6dkNoR3VJRGhDTkUwbHVPZ1J4TUlaSld5bzVGOWwyZWJkcG1xSzJwU21U?=
 =?utf-8?B?K1JYbVowMnNBcGthYkRXWmhjUUd2elVBdUJGcjkyTlRveTA2ZVJPT0szZUtR?=
 =?utf-8?B?ZjI0dmZlQ3M5ZU90a29HRDVNanI4Q2VlaGRaZSt2S0t2eVVSc2NVMndpbGpC?=
 =?utf-8?B?My9zdTRjb0tVNkxvNVo1c1d1eW45ZWNQR21zeko0L3czT3dhbmpyUWxWMzdi?=
 =?utf-8?B?bVRNMGhCcG5FakpaZVk1ZUoycWJNSWFwb3ZLV0VGMldtZnFXQlNUMHB1ZWlI?=
 =?utf-8?B?MkJoczh0RS9wZCt2SWl3QTVSM2U0YURQL1NRcm0vdHRyRTRDUFFFYXRmU0tK?=
 =?utf-8?B?Q2ptamVWbk12ZlZCNk44ZDN1T2JWMHBqZHkya3VZZTJteXZuaWdyYi9mSlBv?=
 =?utf-8?B?eXB0SERPc1RvemFTZ3JLSVplK25WL2NCN1E3b1ZPam8wTWNlSVNrZFpLcjYx?=
 =?utf-8?B?NEowdEt6aUhITnA2TStrMzRhMHN2VFRoR1Rvb3QyQjVUSFhmZlVVL1prKzVQ?=
 =?utf-8?B?UEo2c2U1UjBZVjFDMmFGMWFmM0Q2NE1NdlBwWWRkeU02Tm1iZVNrRUpSdkNt?=
 =?utf-8?B?S05XN2ZPQTZMS25SNlZ3VHg1YUd1UDh1ZjU4cXRzaGRLenlQWUlqaGhvbEhK?=
 =?utf-8?Q?4X24NQR1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9c8e8e-7830-47eb-0003-08d8c6cd5a10
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 16:20:55.5524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEKdcTZs1mh4l5wGZU0wtfme7M8otaY6tc/YlU9vEwZbQ/Lpwn5rn+EsR6eCer0+HBifvgG2E/uSeXIzLfuAIWxvER/xYXSQubVMcurfcbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5384
Received-SPF: pass client-ip=40.107.21.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: mreitz@redhat.com, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.02.2021 17:50, Kevin Wolf wrote:
> Am 01.02.2021 um 12:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 28.01.2021 18:28, John Snow wrote:
>>> On 1/28/21 10:09 AM, Markus Armbruster wrote:
>>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>>
>>>>> I'm developing Qemu backup for several years, and finally new backup
>>>>> architecture, including block-copy generic engine and backup-top filter
>>>>> landed upstream, great thanks to reviewers and especially to
>>>>> Max Reitz!
>>>>>
>>>>> I also have plans of moving other block-jobs onto block-copy, so that
>>>>> we finally have one generic block copying path, fast and well-formed.
>>>>>
>>>>> So, now I suggest to bring all parts of backup architecture into
>>>>> "Block Jobs" subsystem (actually, aio_task is shared with qcow2 and
>>>>> qemu-co-shared-resource can be reused somewhere else, but I'd keep an
>>>>> eye on them in context of block-jobs) and add myself as co-maintainer.
>>>>>
>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>
>>>> With pleasure:
>>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>>>
>>>
>>> Absolutely! Glad to see it.
>>>
>>> Reviewed-by: John Snow <jsnow@redhat.com>
>>>
>>
>> [..]
>>
>>> Great!
>>>
>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>
>> Thanks!
>>
>> Could someone pull it?
> 
> I've put it in my block branch (with s/suggest myself/Add Vladimir/ in
> the subject line), but I don't know when I'll send the next pull
> request. If someone else sends one first, feel free to include it with:
> 
> Acked-by: Kevin Wolf <kwolf@redhat.com>
> 
>> I don't have any signed PGP key for now, to send pull requests :\
>> Interesting, could I get one while sitting in Moscow?
> 
> If you're planning to send pull requests, should a git tree of yours be
> added to the MAINTAINERS sections, too?
> 

I didn't add it because of signed key absence. As it turned out, Denis Lunev (my boss) already has a signed key, so it's not a problem.

I think it's appropriate to add

T: git https://src.openvz.org/scm/~vsementsov/qemu.git jobs


-- 
Best regards,
Vladimir

