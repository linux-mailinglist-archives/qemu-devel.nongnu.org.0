Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A999348DDC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 11:20:52 +0100 (CET)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPN6g-0005sh-Ur
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 06:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPN3y-0004tG-Mj; Thu, 25 Mar 2021 06:18:02 -0400
Received: from mail-eopbgr70138.outbound.protection.outlook.com
 ([40.107.7.138]:40198 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPN3t-00062o-FT; Thu, 25 Mar 2021 06:18:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVm/7xZAiDqiYi+jfFEKbbiDNbmB7cfP6oTeg4GLkGh0PKjuaUDI9oT100cvF7ptLQRLZ3pakhjlaXIvy5fDIVhLb7Bf7upR/6gQxtaH0mev8klqARu7L7bHFaSydGARl2M1XFS0OwIuHmab+0e9eqqBVjSWs4ssBLClqtfOCiw4rNYikc1HnpTva7KvX11Ksbj4iNNL7BsuZXaqmHysvXFaG4XJ8ULd3mq3lUILYl3zy6ZYtGOxGgT7H9PolzTZpwupV/7vJdz/XLZhiG5iZTOVCS0IOvK44sbUMpHK0fH81aCfQvDaZEgQ/7jtRcEKvRcqYu0mtZXE+hqUMNJ0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRxuJAkc1gbI9GDbHT2WDAvzGEuiz2enSJlnyWlLnZs=;
 b=RA3bsBP5ASzUYOp4OL1Mj8ESzpubFka1tgJaryZQ74FP2pCl9cykn6QDHZ/WV36/35rp18DLEK2OwjssBZ2B1f7FFbOA87z50OUFEYgprTGG9XJLTM677EHDNeuNraD7eFTl9Vh+lykFynN2q5Y5m6VMq9i7AVigYtgsqf9vZ/nX6YxwoZJkbXpkIMIA/SpKgHfeiSGohySO1VwHBA/LhOgfkmIDeyq1e5nWm2rBY2snB6DQ8TbQPAMqOiBULTG7mFHNks0yWcYtd3wkyDpFA9Yfh2KsxjID+TDZk65watjeKaQGdxdV4PAaGurHlO/j+J9viyws7aReN1erdRh6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRxuJAkc1gbI9GDbHT2WDAvzGEuiz2enSJlnyWlLnZs=;
 b=sckC3ndzecCvyN3cVY/kH34WV1SQ6+uf+cei1IotXYnPF6dMwfZk7C5bsys8JhFnkInUV8EskOgExCcjMLkw4ypsETBrM5skNTEEEASNvqlYWoWu3kjZHN0xQlPdpsGDUOgHaq+gWkkrgemtWg8hc+RIMrnWzcwftOoLXuLo7gI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0802MB2464.eurprd08.prod.outlook.com (2603:10a6:800:ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 10:17:53 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 10:17:53 +0000
Subject: Re: [PULL 0/2] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
References: <20210324145202.430759-1-stefanha@redhat.com>
 <CAFEAcA_NeCGj0oaQ8GZhxJFLzqDoL+xi1vzL8rGKata8QbNv=Q@mail.gmail.com>
 <71259336-f5d5-90bb-83ef-3fe962bfae18@virtuozzo.com>
 <CAFEAcA9AGoggABhV8wduAaSce3v-+zED2_QFW7QgNgGOjDJV1g@mail.gmail.com>
 <YFxeRen934TdLvs0@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <43869a87-cf42-30b2-16ea-4effb913e01e@virtuozzo.com>
Date: Thu, 25 Mar 2021 13:17:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YFxeRen934TdLvs0@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR01CA0110.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::15) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR01CA0110.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Thu, 25 Mar 2021 10:17:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1f41fa5-9e25-40a9-d4bf-08d8ef77406e
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2464:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2464A2B383E3C959B307FA5DC1629@VI1PR0802MB2464.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oNdu0EirHPsC/lXOwy758kRdOMwRuXCONZsY0SVFDRoxChEO3AusENOZ8NHNCHGfVl2U5xQk1RiA8GmQZxCPhNTPsvEJa748rGnzz1HqZ58PoR35ZYZATOkcgxhzqbVSFei9SMJIvuVd6/ptD22zdbUpEFeizkQu37TuKklUiQzTguQmZ+HE25QSpO4Q5JhPWYDH4lVjVI09uOPW7TB/1ZfoLEypdqNcYx07PqRm0EOOCNds/WjwP6qnn7ucuY7gfhL6HYsofpOiB9X0QP5LBoujUytQoIVTDvFxeXIGmLcatAVtGIC+AOxjfQYLBcOgt0BOloUq6/QoTu/HCTtITBYcyTFbKexCxQqqY4CuBlKBr35RXlXsMPMP7NHB7nYgHMrnjrlb1WNiJ9P+6bhVkamp6liEutdpcd/CZcJjyZqtAZHsyQ5sL5Iro8reA6IGyMmc//9VD81vKzuc3lk0yxZTmmsp9H31cNv/eX2c7Ho3j7+SwDgmD2xAmOK0+Q8aHP3qUs+j/YaURNJ597/IBCg31+jeQIgjc3IwKldWVdiALEEWoWeM+L3iMJsSGv0/FeMC1hRhbzyLcohGMIzBfbEoiarjjHdum82syat19R8x+2dmEpX8VQGNgdzWBQMGINOMiweintNwqOhf7HZX9CV1giBxuCOmEP5S7V4jL2W7SnsqAiua6J8l3x5+kbxa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(66556008)(8676002)(66476007)(8936002)(4326008)(66946007)(956004)(86362001)(31696002)(5660300002)(36756003)(2616005)(316002)(16526019)(54906003)(7416002)(38100700001)(26005)(186003)(6486002)(52116002)(2906002)(83380400001)(110136005)(478600001)(16576012)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?PHCuXuU2bxjCbOahxvaw8DiM9r0E2toq0XlpDuAo+e6id6kqJ6No48N+?=
 =?Windows-1252?Q?Q5fPrCLRueK/CuF4mv8ziu3AtkQ5o7NOtiiJ7u+nFb52nT8KuQwluhwe?=
 =?Windows-1252?Q?ZJBTruZdiOqz6WVKslgAlduWjfao+xlY02Ys4GXqp59vkamUxVK9/MN5?=
 =?Windows-1252?Q?g1PBDvozjywmmU6eJBO37c9k71vkghlWorGHq3xUg3EiRiRIQRRSSMoz?=
 =?Windows-1252?Q?31XS0ZdmRm/xIfcaMF/SXFsFhEZCorHCMk4zpKgowQNXQTVEfvYV1Q7a?=
 =?Windows-1252?Q?fhOOKxcFIisTG+sM/vfFqtQwTQwemijVKkaWxg2CrLNefe+y6LO0Z07y?=
 =?Windows-1252?Q?8Aa0LRJlRup4gByoV0jwACfs3C/csvbxTfYEIasDMwCcOG6Wv3LiSpOO?=
 =?Windows-1252?Q?/YA19pJ9dm4jm37l+fSzMS1QmKk8RQHtTGh6Xso8tMD/F4mgVS5hM3d6?=
 =?Windows-1252?Q?3h6OQv3QqO2zfLOEpt+9WyktlLwTYtg40r9Zz5ssfSRz9jKjaWRTfKb+?=
 =?Windows-1252?Q?t+YRNwsBi0mRxiKlMwcewD/PgyYrh2N71HrkBoiiw79iKPuRIB+ulpf1?=
 =?Windows-1252?Q?phiWPZx9Lrmu7ejEIWKx93jPrB216NNjfr+lUMtKICG7o5Wh1FKhM4dF?=
 =?Windows-1252?Q?Uef3cLxMLRJvFUYsH3WLaw/JcW54mGM5/uONgT10Dg1GIAnrf9k3b2JK?=
 =?Windows-1252?Q?tkkIsfvq5nhuiX9deyxDUoKCWsrGz1M94roKc2c0zsd4W1GckUfc8n7n?=
 =?Windows-1252?Q?4JUmbg7+ArJefInTyTAeD/bZTAemDUv3Wr6/8SXn3xP/Jq7Tt3A3c3HG?=
 =?Windows-1252?Q?j3a3CoQPI7BlqCAWNzDALpvKgag7KDlvEy0JsiZ0JYSEBlTpx+PCUOpC?=
 =?Windows-1252?Q?75qs3Ig0BlZ77CmQBkYTSBij3nAmdT9EXtx/TK6EK9wLTzC5AR/OSFLv?=
 =?Windows-1252?Q?3DscIXrOY78XXNh2B9bPoblfeMw354463GD4FArXqnXbMyeA9G+8qMt9?=
 =?Windows-1252?Q?R+6nvjZo0rCDlTuaUAiUGSlRz0UmkjDd951MJRJMQyRuIlpbcX5GNiDU?=
 =?Windows-1252?Q?CpYU322Jh0Oo/RlIMRaRYlEC4SZyddsIZar9yp4of4JQr+uJK/uBXjN+?=
 =?Windows-1252?Q?DqlORYprpBD1FzUuEFyezXS0Vy1g3gFGzy78ONc+QcfPg8Hv4IhId8la?=
 =?Windows-1252?Q?M++c15+vkHsLvLKlqzNngz6I9Bv5VQNL90R4ubdFf2r0Is1cYyjPgS4o?=
 =?Windows-1252?Q?3DD+/LfHGxr+CjmQolhzc1kx0e5x22FAJNh1DJudhryUlxI6BGJqbrWF?=
 =?Windows-1252?Q?XFPYM50oDWhrRM2eltFArdTz6CSQiFA/M5+OpmtRdLzSH8+pUDKKgXxF?=
 =?Windows-1252?Q?q6RifGf7qfPxCevrhF9loF9MFXUmxEBG+NSNr7S3CdlUeqIgNaiVeNwi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f41fa5-9e25-40a9-d4bf-08d8ef77406e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 10:17:53.5232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJrG63KxZG17aDyJTh+C+KymqqC79SJ7cyinat9ajO4c4smm7LBcj9F0z9zLKGfF25vvBbjuRkfI8hHhXZ+nn+FsSfrqEnnVeGxfhAXU6j4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2464
Received-SPF: pass client-ip=40.107.7.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

25.03.2021 12:56, Stefan Hajnoczi wrote:
> On Wed, Mar 24, 2021 at 08:42:27PM +0000, Peter Maydell wrote:
>> On Wed, 24 Mar 2021 at 20:18, Vladimir Sementsov-Ogievskiy
>> <vsementsov@virtuozzo.com> wrote:
>>>
>>> 24.03.2021 21:05, Peter Maydell wrote:
>>>> On Wed, 24 Mar 2021 at 14:52, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>>>
>>>>> Vladimir Sementsov-Ogievskiy (2):
>>>>>     migration/block-dirty-bitmap: make incoming disabled bitmaps busy
>>>>>     migrate-bitmaps-postcopy-test: check that we can't remove in-flight
>>>>>       bitmaps
>>>>
>>>> This failed the 'qsd-jobs' iotest on s390x:
>>
>>> I can't believe it related. My commit modifies bitmap status during bitmaps migration on target vm. There is no kind of migration in qsd-jobs test.
>>
>> It's possible it's an intermittent, but it's not one I've seen
>> before. We still have lots of time this release cycle to figure
>> out the issue and get this fix in.
> 
> Vladimir: I'll get hold of an s390 machine and try to reproduce the
> failure. I should have some news by Monday.

Thanks! My path modifies migration/block-dirty-bitmap.c. qsd-jobs runs block-commit and block-stream jobs and don't start any kind of migration or snapshot or savevm, so it seems impossible that qsd-jobs runs the code touched by my patch..

> 
> Let's put the pull request on hold for now.
> 
> Stefan
> 


-- 
Best regards,
Vladimir

