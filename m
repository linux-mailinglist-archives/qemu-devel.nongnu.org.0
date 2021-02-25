Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2E2325483
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 18:26:34 +0100 (CET)
Received: from localhost ([::1]:45306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFKPJ-0006ZH-5B
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 12:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFKN6-0005id-7b; Thu, 25 Feb 2021 12:24:16 -0500
Received: from mail-eopbgr10098.outbound.protection.outlook.com
 ([40.107.1.98]:28801 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFKN2-0000Ca-W3; Thu, 25 Feb 2021 12:24:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqpaTrmxive8iBbbKBJJkJnXAu66s2feJqEMpcXeNpJ3cXfO3FH2kkmfVJn/ev2hJPOc0XelQ3jsAq8EiE6P/di7dk5kDsyC0s+cTZtX1dqvBT/vjzV8zFrN22b+SPuKL2X8sAQw9GoqhO/7ZYgZBbwPhLytt0JWJXynOIA5DycWc6DwdZK9//6kQfUeMYhpr+3T1TIKaYCSWNYe5UjYn3XGDx+qvx3EMi9wycFm7lTpfqE7gaSmvWBYVbJtLn38DOJgUTuP7JYuzv0t6eu+65tSKSIl0zXjTtl5C8kXPJEaHtpEOLfB1+YAp8sFLVKsD7sUBQ9vdlLIkCCz0ufQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnclBUGoXCweQ3vGRpu13IzlN8l8dG1r1aUgt7khp5U=;
 b=URWl3OujWppjhrV1DvOEK7//NbLHF0X8Yj2SweF4d0SuXlQtXVV9qT2LU1ra5hpxFiHBHxUiJ4nPpY1zkCn/O6wYEpk4XYe+CK1NJm8PhAlgUiZsRjNuQ5IbG6fP+gqqh3d7dC4YYzdARpgCfbfOHGyVBW3lvwjdV4NSnp4ymnGOUcS1RUnBojsB11UIYgO0VTN+P14MuC9QglsEdMvT5bQFsHZ+cz4794wHvO5KfHvsAQvstMkALiMqo1/ZPEyOb22xVaKwoQB0AdNd0jH9Cma1DYONS//o5W/WRZoeMUeWTUBdD9k9+mqtAzFTIahE1TfNkvdGZfI1LYekFhjDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnclBUGoXCweQ3vGRpu13IzlN8l8dG1r1aUgt7khp5U=;
 b=noX+rPYq1Lhie+H7XFspQPz3Vwr0sugleGzoAYCYzjSHtwOxK3hBxaDIig2YsbYMWXrpzJUXDnImcA8yWZWk4jrIE11Kn8eWPND3m5YtVMu4aMEis8s+ba3CX7O3Wuw+CPU3S8JofRAc66kw0v52UJrns8K4QJezomgU+UwptYg=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4407.eurprd08.prod.outlook.com (2603:10a6:20b:bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 17:24:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 17:24:08 +0000
Subject: Re: [PATCH v5 0/9] block: Add retry for werror=/rerror= mechanism
To: Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jiahui Cen <cenjiahui@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, zhang.zhanghailiang@huawei.com,
 fangying1@huawei.com
References: <20210205101315.13042-1-cenjiahui@huawei.com>
 <YDTNkWsYbj3u5ejF@stefanha-x1.localdomain>
 <92e02bd7-7f29-01b2-91e8-73c3fc689cba@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <98889aad-0ade-e8fd-080b-ca45b237d9d8@virtuozzo.com>
Date: Thu, 25 Feb 2021 20:24:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <92e02bd7-7f29-01b2-91e8-73c3fc689cba@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR0502CA0021.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR0502CA0021.eurprd05.prod.outlook.com (2603:10a6:3:e3::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Thu, 25 Feb 2021 17:24:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60494da0-e0dc-4787-f5cb-08d8d9b228aa
X-MS-TrafficTypeDiagnostic: AM6PR08MB4407:
X-Microsoft-Antispam-PRVS: <AM6PR08MB44073F9C502E64C585648CC7C19E9@AM6PR08MB4407.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IEw3K9iRXJHaSK+7N0k5j/fnRVMd/vTALe+UXvemw0HYrqCO+4vcptWmoHrwP2Hf4BCkwV3hQ4hPFFTiNZhAuoIKlbm7rBcykAt1RWYrp7ImtfmwRUgenPEEVsy3s+8rn2cvMKARWwakt75xfoyok8+u68TuOLa6u3LnPhhvDL7dqI5/wgf0TWPKE9lMzexLYoA7OLlZ6rVskJBz/1r+B8teR/D7Mf/HTZqGVhKjmLodbLBoEKDPGo+Se5Gf0B7U83vEhmirLUlJTC43Yx4HpWVoc+9BzhRNL8xbOcWVhpEArnlqi1Ld6cDIbGSejSXPiZlcnSD4FyjZOx4jfa4HrnqO7CCGjEVNtQgl20mm4COf15TidhVYVoTua+FpZOnE0maH5y9Hy3tqSwf5Rdc0Pxr0o4qWMEWC3VEWb0MgNWXonqvj44Zh8KF6SkMbe3L3NZcseZ+IfKYdrB6m1DFfhGtwy8jgGC9Q16HqAuWi1S/9Jkh08Aaq8enuN6Y0KoyS2r+/dbevgIwPuz/Gzyl8mpRYVRoOcUvuwM2XssL3oYmDHpfddvySB+XDvuUj55aK62vmsIomYLAcVqOBFU7l6KsSm25cSeOyMUh46LQIByc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(136003)(376002)(396003)(346002)(186003)(83380400001)(31686004)(478600001)(53546011)(36756003)(956004)(2616005)(6486002)(16526019)(4326008)(316002)(110136005)(16576012)(7416002)(26005)(8676002)(31696002)(2906002)(66946007)(8936002)(54906003)(86362001)(52116002)(66476007)(66556008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?LZM1DCfN5Q39EgO6y5dfprK7xTJSxbBfWRB4NmO/sPQvsYO4ZSLT3GKV?=
 =?Windows-1252?Q?BunE1Cp7QemL9wRVRR7+RfuIsgJ+X/hdXCYiZJTawaqT4VeHk3bgwqL+?=
 =?Windows-1252?Q?5uHUILW6Te+2WCIVuZEbcsio+eBVqR7/Q1Jpdeq1iVKrDinsS33ckiN2?=
 =?Windows-1252?Q?PW1ACnSX0E3IZmiHM7A7Yh4JSHdb9tk9YF18DZm+IifSBrFqWUhlwCB6?=
 =?Windows-1252?Q?cM8pI/InqvuA93Zqqsj4kgOfDz4cza93bXsMWUK4S3mZLxF0N7oSupl2?=
 =?Windows-1252?Q?030gM7lcwAv8hux9BTAd/JT09GgiSB8pm5rpMhcBy1nEB7oUcY/PzKEh?=
 =?Windows-1252?Q?tQY1mW2LaT9f0nA2nOv+Yco+Tfk8CEeToYBCMbnvvdNPaSB6YFEPZRED?=
 =?Windows-1252?Q?SbeODmi9xLYDPX26wxXyHsDFGAvuHMDZGligzfHdgB9Rv8bPKwf02wmW?=
 =?Windows-1252?Q?M0AB1+RMmog9qo+A5gIDI/YKMgU3zWAiZ0iV2gDDpQgsQYqnNLP22uN9?=
 =?Windows-1252?Q?RTOYegEwEVQqbUdDt2bLT5FB6aWAH5C1BaX7s4DPLUw0tZzGkVkRw3CD?=
 =?Windows-1252?Q?yE+5qXCz4YJDeFwRIlqldhyJpbez1EtBk6fieS+Tfd2VHomCeqMRrUfW?=
 =?Windows-1252?Q?9aAnGmAccojm9baWAoOU3AbcKD7mEr5+W9LapOBq9MVUw6A/Uh45yRL3?=
 =?Windows-1252?Q?/pG4vCIfX8cM6fXCm6WtO6B3qi9ZsfUFmKq+At8T+YjusjjoaX+z3Uth?=
 =?Windows-1252?Q?waDNpm9pGsJlbcM0BSWLq52eQvj/9LGHCrydYpMBe2u7ZysqQ1+VycmZ?=
 =?Windows-1252?Q?Sj+HDunxuF/95HWaz2tABvHrG7CBWW92va/wtCRLqBOAHA8xiqpPlFAK?=
 =?Windows-1252?Q?BQ09w2ZFbg8W0bDrbmgvaWcAOrF/xw7WyDj2bdN9BohIvWAAya6Y5Q8w?=
 =?Windows-1252?Q?P8a8mw5g1GJlgVBgxTE8jSssXm9H6T3tkpqQx0uITrGr9SukP23+PSyT?=
 =?Windows-1252?Q?HVV+D5dyd++Tkojj4TTuQH/ZH/Ofdc3CM4OXphn28eEgKymBuvQ1imFA?=
 =?Windows-1252?Q?YWW+hx8WQwNA4hdqqig1SCh1LzxV74Zqm38Y0eQs7Og2YxhLo/JD0h3b?=
 =?Windows-1252?Q?Bfe4+vIzzHbvtbb5kZTgBDMJx52H+sW94HxemKCy1+ulZpdT1bFz3F4m?=
 =?Windows-1252?Q?e9TLj5ezbEhd7aEDmqMnXt5brjX27BOfWX7MwO0gxgqvmWQndEF1eW3z?=
 =?Windows-1252?Q?ATd6Ib9usSw7ppr0KH86of+lL+92aTmnk0+VwfVDGiVAQGj5nEkajauU?=
 =?Windows-1252?Q?8OHY0XZX7RH8iQk4L+9H4lhLa3gyDoSKHROCd5GXWvqeGZp/GZdpYO0J?=
 =?Windows-1252?Q?8sZ0etBErCIJnccKkyDhAfRiAOrtFh5x6z2Q6T4wtC3oUwtJigDf/JKi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60494da0-e0dc-4787-f5cb-08d8d9b228aa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 17:24:08.4117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlBLVY2oFOy1o0dJWX/ZmBRGLOQ68phXX+SPKkAagmgRQUHV28oKiFlrIj+I81/hdK3XGi3PPmKqTiGLo6VIbP0xAauvOrrWbuIEq5rZsPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4407
Received-SPF: pass client-ip=40.107.1.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_NONE=-0.0001,
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

23.02.2021 16:41, Eric Blake wrote:
> On 2/23/21 3:40 AM, Stefan Hajnoczi wrote:
>> On Fri, Feb 05, 2021 at 06:13:06PM +0800, Jiahui Cen wrote:
>>> This patch series propose to extend the werror=/rerror= mechanism to add
>>> a 'retry' feature. It can automatically retry failed I/O requests on error
>>> without sending error back to guest, and guest can get back running smoothly
>>> when I/O is recovred.
>>
>> This patch series implements a retry followed by werror/rerror=report
>> after a timeout. This mechanism could be made more generic (and the code
>> could be simplified) by removing the new werror/rerror=retry action and
>> instead implementing the retry/timeout followed by *any* werror=/rerror=
>> policy chosen by the user.
>>
>> In other words, if the retry interval is non-zero, retry the request and
>> check for timeouts. When the timeout is reached, obey the
>> werror=/rerror= action.
>>
>> This is more flexible than hard-coding werror=retry to mean retry
>> timeout followed by werror=report.
>>
>> For example:
>>
>>    werror=stop,write-retry-interval=1000,write-retry-timeout=15000,
>>    rerror=report,read-retry-interval=1000,read-retry-timeout=15000
>>
>> Failed write requests will be retried once a second for 15 seconds.
>> If the timeout is reached the guest is stopped.
>>
>> Failed read requests will be retried once a second for 15 seconds. If
>> the timeout is reached the error is reported to the guest.
> 
> You may also want to look at what the NBD block device already
> implements for retries, and see if making retry generic to the block
> layer in general can do everything already possible in the NBD code, at
> which point the NBD code can be simplified.  Vladimir (added in cc) is
> the best point of contact there.
> 

Hi!

There are some specific things for retrying in NBD client code, that may not make sense for generic code:

We try to handle not some generic error but tcp connection problems. So

1. We NBD retries we wanted to retry only requests failed due to connection loss.
    So, if NBD server successfully reply with -EIO to client request, we don't retry and just report -EIO.
    Such things can be distinguished only inside NBD driver.

2. Timeout is specific too: we start timer when we detected the connection lost for the first time.
    During the specified time all current requests are waiting for reconnect, they'll be retried if
    connection established.
    On timeout all current requests (waiting for reconnect) will report failure, as well as all further
    requests will report failure immediately (until successful reconnect).

Still, of course, NBD driver is over-complicated by reconnect feature (especially with reconnect thread:) and
it would be cool to split some parts to be separate...


-- 
Best regards,
Vladimir

