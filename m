Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D51D477B3A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 19:02:47 +0100 (CET)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxv5a-0002eV-F8
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 13:02:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxv2w-0000KK-Nq; Thu, 16 Dec 2021 13:00:02 -0500
Received: from mail-am6eur05on2115.outbound.protection.outlook.com
 ([40.107.22.115]:35872 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxv2u-0008BH-8A; Thu, 16 Dec 2021 13:00:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/mJp4XiXFuWIOh6JhJ1l4ebfR0I0UQU90p8DiAUwdCA9pcrFV84HSKnZ+oAKyc6K5Goz4TTJMgRgHTthIk0PfHbwli1whewc33+dDOXQ2rpWAIdJ56fAu9jDayps3vZ3+TrBYjOcSMCd0lJVyPwcYCsTOa9HhffY4z7dTKiV+CFNLiQ9dH/h06E9+7wYgkvwlhz7fq/xiCyQ9WD/4Ttxu3R0xRQBOwC9bA+qySUmSMct5M4LEzyCdOLJ1FSeiID/ZDfvoQLCNa2K1ODtpmxxfbZFI9FhiSDyNmWgf4TdKgJvEsgR3EsBddgzaBBQ0xs2r7Ol9pLeFjxh7eAH/HKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5K8pP2ZvHci/sDkku5kdIMft0gedERdMyygNfELTHU=;
 b=OjpX1pwWoPxvM0yhRGXWpJVQ0R42huTF4XcCmAD73AEQX9Oa1dIWMlfGsno5Qgl5QznKKKLoaRVVRFrgl3F15IRM5TzsdEk+vxLa1kisV06cEs7o3Qe2uBP8rp54Yb9WDKyPYqoqu5YldO3deN80q3o7C32aj1EfurhV43y3gOAJ6dPpO4I3mz630c9Y+3x5g+8mXWc7bmYK1v2NN1OzKOG6Vl7V3qTVc3bBAeysyfHt6hX1d3xBcGNJmOwOamvCQqIas0YohffCKV2Zx34SgjQ4SNpibdSOqKK3xvo6cUiVdmhzj04plPrGv7lxEhFk4Lfg5p86UdcoH2LWoaHX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5K8pP2ZvHci/sDkku5kdIMft0gedERdMyygNfELTHU=;
 b=nbbxYkxwgUndwQywmcUSNDss3DMK1F3Tlwx8MrG8WcF4FuByt4GV6Mh/2JtYNh774Af4agsgG7BK7HuCLCKoN5m6QK+/zY4F5kZxjqj9wr/U8MUfMPH84YZE2c/dXt+vom7rSF+kByIDNNOw6FXnd1JZFzSxyuZ4W1KwWTIQSs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5729.eurprd08.prod.outlook.com (2603:10a6:20b:1de::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 17:59:50 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 17:59:50 +0000
Message-ID: <ceb2f83d-17aa-e1ae-465f-470e27f52aef@virtuozzo.com>
Date: Thu, 16 Dec 2021 20:59:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 02/25] python/aqmp: handle asyncio.TimeoutError on
 execute()
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost
 <eduardo@habkost.net>, Daniel Berrange <berrange@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qemu-block <qemu-block@nongnu.org>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-3-jsnow@redhat.com>
 <d02c037f-6d6d-7ea8-4647-87dd9f5f014b@virtuozzo.com>
 <CAFn=p-bCgLKP=4-o9PORrwpjH+gTQRRhF_+6gCp_wb6AqqZqyg@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAFn=p-bCgLKP=4-o9PORrwpjH+gTQRRhF_+6gCp_wb6AqqZqyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 17:59:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cc25187-1cb3-49f4-9726-08d9c0bdda93
X-MS-TrafficTypeDiagnostic: AM8PR08MB5729:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB57295202E4683C6986130A99C1779@AM8PR08MB5729.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qFdleNLvk7Vj+avHq+B+jObhqSVuuKt6yx/LzF+Dscw8aaxWz1P23lWmypwIBoyS5K6DEw2dXExWU/hSCghswpFrUK/xTBTG905NTM6gyx6r3f1lr96R9V0PKr7F0hUDdOB/DSKYSqFO95AMKwEswmlFQ++IiqJ0y3YkIhdGf6dk6gIJ5j1NjiCiPb41UrHRfrwOPIzsjv7ZwUn9fPe6D+2Ob6SvNmaM7FxUHKizbwjr+IJ46QALQsXVSXAKaQ3MJyj1CAdyASgp9rjSoX2OWa3zu43a5D6rhlX8n98TRT+GDDEcg/uhqMUVGbTMLnjPnd1yjoVNmp/kbar81pPYPr98pRgoWY7BsRpy6JhV6DXQBzgxUPmLRQhpZqFwOGFHw62WOpgC0PvRSKLCC9jfbQHb7JWfg7UNUZpV3DrJ55hZIU8WdLJP7J5uSm2/7PPrSp9D12NKtALzl+jq3YlKBQfwDaJeqRViKagB9GZ11Pj9+3aoKJPa4s0ljIM2QMStRf55oLKSHfAKyzAXmfKUa4GH6onZ0JyvntIxjxf4Vo3wz6krJ7qlf75KXXMvKBb3Dun5jCyHoyqP1v+PTSxpVzRkTGiuB1Zmg5rujYPxUOdgsAJBrdPp7/T52B5O2H5pjTiRqhVNcg8rsDFCVQKl6qncZA6o2nduujo5VM2Ki6hfRHAS+tvXNQklOWjfIRnrWLCI8IDog2JgqP60dmHwFsu+ztQZcJe8kPO/7w3QbT0d/jVUd6jQqJ64tzTgCOM7BBOuopQcSjxR8HuOlM7TVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(5660300002)(52116002)(16576012)(38350700002)(186003)(508600001)(6916009)(31696002)(38100700002)(6486002)(7416002)(66946007)(26005)(2906002)(36756003)(83380400001)(86362001)(66476007)(4326008)(316002)(956004)(31686004)(54906003)(8676002)(2616005)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJCSUkwajNuRjJPa0RjUXV0S085aVhpbzlzOXM5c25EZ0JkSm5zOWxJdTY1?=
 =?utf-8?B?MTY1YUpibHpEcm5zeGdPSDRjcVh4OG1PRy8xRFErbGx5YzNWcEMrOUhmV0pr?=
 =?utf-8?B?UWxWVzFTNm5jVEJ1bVpSVVV6QzlFeWlNcEw3YlBBc3oxM3dGTmF5VEVGaHJI?=
 =?utf-8?B?ZnB6NEw2ajl1NXJDZ0x1bVFZb2NERmpObklnMzZYeWxGeWhkV3RIM2JBY2Ew?=
 =?utf-8?B?UmRMbFpNNHFnZUpsL3Z6cERIb1RpVU9ycVp5aXFVYWZRN2RqMlNBMTNoUitI?=
 =?utf-8?B?cTdvOGJQcTVwdlRrV3JuMmJ0cjY1MXpGdG9NU0k4WldxRk9SbnNrMy8va2Rz?=
 =?utf-8?B?NFVUSmUrUU02VDZqQmJiM2JKUFJoOHp5TFYwLzZQenpudkZGdjE3VVhST3NQ?=
 =?utf-8?B?eVlHNU1OeXhMSldqRUV1QmRJOGtYNW9WQzdVNE11OUM0a21PV2tESHF1ZDRo?=
 =?utf-8?B?TjVCamtMZXQzUFNpNU5hM2tFWVZjQXFqY2YyNkFCRkVXS2N3V01UaHhLOGVP?=
 =?utf-8?B?UHEzOGtId3drMzhqc2RwZE9tTW1hY3Q1eTRJQnhUOGNYRytlaWVKQ2c5SWFz?=
 =?utf-8?B?RnB2UXgvbjFKVkgxZnM5Yk13KzExWkRZcnE4aHZ0ZnNaU2loR3luSzl4K0Vj?=
 =?utf-8?B?ekhET3F3R0NvMGQrbENwM25pMkdXR0hGWWNyeW40OE5wV0xUZTkwVXNHeGdn?=
 =?utf-8?B?RitjNUdOS2pkejFkNHpjUXBmeVdQT0piaTdpV3JKTUhTaC8rR0xGSWpOUzFN?=
 =?utf-8?B?R1c4U0p4VDgzdUZ2bVVGNDEvS3hQOE9EVHE4NlM0c3ZMMjAzYUZPb1hTek9x?=
 =?utf-8?B?aFRYR3l4YWVjZ1B3d3ZKTnNqVit2VmYvSUVwcDFYQ2dWQjh1ZnM2bTMyNm44?=
 =?utf-8?B?cXNURmlOdU9yNW1KejEySDlZd3ZGejlKWkJoaERuME00QS9uTldhdHYrN2Jw?=
 =?utf-8?B?OTBRRkhPOEppSXNFTS95a2FpUDNKS1FHYWQ5WEZ4UjhMSmtvU0dvV1VvZUd6?=
 =?utf-8?B?Wms2cEVIa0dwVlpoYnNyMW9nUUcvWXNGbWpicFJWSTJKa2VNd2NuRG9FTHFC?=
 =?utf-8?B?TzZpZ3ozVGpLUDlZOCtGelYyam12Z3c0R2V3OUNjTTJxSVJEeVVVZ0dSSkF4?=
 =?utf-8?B?UDUxSzVJbG90Y2JQaURJNHZBUE1YOVpQcU04MHR0YzUyd2ZRV2VOZUdhTi9i?=
 =?utf-8?B?WFZPOVhWZXI0NHNOY1QxQ0w1eWRKVmdpeTF1eVdmY25xNmRDZGZuc09xRnZF?=
 =?utf-8?B?TFh5WDU2ZDRJaWMyMFRFcVZ5a1orVGtGY09IM1UxcDN4UE04QVB0ZU1DWTYy?=
 =?utf-8?B?bWJLYmZhR0htY0xqRFVJdDh5YzhTK3A0R1FheGlIb25YcG1OOXFzTFFjdHR0?=
 =?utf-8?B?Q3lTbzI1ZDNnUUNJczljYXlrcVh3LzRRQXU3Zy9NaDdiUVRvQnlOU29BbVNh?=
 =?utf-8?B?NWZkOUhpMWhsMW9aZzQ3ZUc5Z3Z5eHY1Z0FEZmQ5aDFMTXN2Y2t5QXJTNmhZ?=
 =?utf-8?B?Y2wrOExqTTBuNDdsR05FL2Q2eGE4NTNFcE5JcHl5TXVRM3FTM1l1ZlhRMFZG?=
 =?utf-8?B?b0MyZ3AvNWs4TkJCY2ZvMVZhWGxZN1V5MDlkL0RnbFFIbThpYjRObkFreGdB?=
 =?utf-8?B?U0tGcWRoSHBXak4yQ0RMUGtYa0xsZDhRZGxJUXFuYVhCdjdpUTB2aVdpdTI0?=
 =?utf-8?B?cXZ0ODdrRW8xS3I2YzI5bFhzZjVrdjE5dklHY2MxMjJ1Z2Jmem9KY0VjOGhn?=
 =?utf-8?B?Z2UwbVZwTDZDaUNKbWYyVGxTTSs1ZmtjTmxTalRlLzRpSTF0MnBxdGdQSnVi?=
 =?utf-8?B?REUyeGRhdG53cUtBVktibUVXeThMWGFXNUhENHk4K3hlUTNOSHdCM0I3czlK?=
 =?utf-8?B?TkxTKy9pUEY2aFd0cUZWLzBOckpEditOeU9tUnVZVGQwaGhxc2tXZ3c1RXU1?=
 =?utf-8?B?bUErNlZ2WCtTRDloZ2FFY0cyS1FoZlMxY2pVVEs3NnBCVCtVeStoOThMYWJ2?=
 =?utf-8?B?cldUOFFRaGFUMW4wYVpWRE05bElBSUdLcG00bGE0VUNqZmM4MlVISWwxeGFs?=
 =?utf-8?B?ODd4aDFaZGJOdW90TFZMUXBuWDA3MmtiUi8vaWNWRHIya1dpcWdzZkd2d0Z1?=
 =?utf-8?B?dGE1QnY5T2YzRnpaRzNteCtKZ2RCbDVrYm44cHdCMGx1dnlta1UxeEFVSFl6?=
 =?utf-8?B?THRaL2JpalNkZHRYd21ia1FLMWNOd1EzVkU1d2FKdmxpVm1aTk5vZDlpamlq?=
 =?utf-8?Q?XwwYol+7YIYbDLUgaHMOBdA85H2WMXe7daicbbs/lI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc25187-1cb3-49f4-9726-08d9c0bdda93
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 17:59:50.0522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5YWZPvjJQxLdevWn1wp/GnElSJuw1Yy9LZn1BUaMD0b/z4A4DMOzga9cil8kvqh+fb11RNSF8+9wuBN6unIqf7IvBj9VssycMtHo+TysAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5729
Received-SPF: pass client-ip=40.107.22.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

16.12.2021 20:22, John Snow wrote:
> 
> 
> On Thu, Dec 16, 2021 at 4:51 AM Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> 
>     15.12.2021 22:39, John Snow wrote:
>      > This exception can be injected into any await statement. If we are
>      > canceled via timeout, we want to clear the pending execution record on
>      > our way out.
> 
>     Hmm, but there are more await statements in the file, shouldn't we care about them too ?
> 
> 
> Did any catch your eye? Depending on where it fails, it may not need any additional cleanup. In this case, it's important to delete the _pending entry so that we don't leave stale entries behind.

No. I simply searched for "await" reading the first sentence of commit message. Now I better follow what you are doing.

> 
>      >
>      > Signed-off-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
>      > ---
>      >   python/qemu/aqmp/qmp_client.py | 8 ++++++--
>      >   1 file changed, 6 insertions(+), 2 deletions(-)
>      >
>      > diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
>      > index 8105e29fa8..6a985ffe30 100644
>      > --- a/python/qemu/aqmp/qmp_client.py
>      > +++ b/python/qemu/aqmp/qmp_client.py
>      > @@ -435,7 +435,11 @@ async def _issue(self, msg: Message) -> Union[None, str]:
>      >               msg_id = msg['id']
>      >
>      >           self._pending[msg_id] = asyncio.Queue(maxsize=1)
>      > -        await self._outgoing.put(msg)
>      > +        try:
>      > +            await self._outgoing.put(msg)
>      > +        except:
> 
>     Doesn't pylint and others complain about plain "except". Do we really need to catch any exception here? As far as I know that's not a good practice.
> 
> 
> pylint won't complain as long as you also ubiquitously re-raise the exception. It's only a bad practice to suppress all exceptions, but it's OK to define cleanup actions.
> 
>      > +            del self._pending[msg_id]
>      > +            raise
>      >
>      >           return msg_id
>      >
>      > @@ -452,9 +456,9 @@ async def _reply(self, msg_id: Union[str, None]) -> Message:
>      >               was lost, or some other problem.
>      >           """
>      >           queue = self._pending[msg_id]
>      > -        result = await queue.get()
>      >
>      >           try:
>      > +            result = await queue.get()
>      >               if isinstance(result, ExecInterruptedError):
>      >                   raise result
>      >               return result
>      >
> 
>     This one looks good, just include it into existing try-finally
> 
>     Hmm. _issue() and _reply() are used only in one place, as a pair. It looks like both "awaits" should be better under one try-finally block.
> 
> 
> They could. I split them for the sake of sub-classing if you wanted to perform additional actions on the outgoing/incoming arms of the execute() action. Specifically, I am accommodating the case that someone wants to subclass QMPClient and create methods where a QMP command is *sent* but is not *awaited*, i.e. _issue() is called without an immediate _reply(). This allows us the chance to create something like a PendingExecution object that could be awaited later on.
> 
> The simpler case, execute(), doesn't bother with separating those actions and just awaits the reply immediately.
> 
> 
>     For example, move "self._pending[msg_id] = asyncio.Queue(maxsize=1)" to _execute, and just do try-finally in _execute() around _issue and _reply. Or may be just merge the whole logic in _execute, it doesn't seem too much. What do you think?
> 


OK, that's all reasonable, thanks:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

