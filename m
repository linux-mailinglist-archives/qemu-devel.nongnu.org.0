Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE92130CA45
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:45:08 +0100 (CET)
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70fj-0001df-Ro
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l70e4-0000z8-Lx; Tue, 02 Feb 2021 13:43:25 -0500
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:17408 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l70e1-0001sA-A7; Tue, 02 Feb 2021 13:43:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwItYpYjtXkveKfN05n4wRVAKqahTeuP5VLXihukUlt44SCH6/B+Jd8tw3Cw8k1icoj4LRlIlq/tTu7lR51l6Bkk/LBcCOMgFIf5lMW3Rb0ooG/XsBzGmr1716dcbwJYjSp0U8nTNiKyzi1MwQLA2TbyJnWi7xkwYu0UCzXGfoUQJvxCQFdmRuGQT7hVBhIib97zaFNC6qER3tLk2rIu+S493fVAUqpzg7azDCVwOoZSdlii2BiuWeMjF2zz4h1EzvX5e3annfS81UFWmDpZXpbj6dM5dprWTTbHFmJeoxkLl3iT8rvSQ/dFVEV7nFdeI7YTyuNMGp08F24V+BupDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH8yXMNxicx6zvk11xQKRkfRt1ATRC7xsaSQcVFPKxk=;
 b=Sb5xnvbOnfWWJQcD55iJ9n09XH1+/tMr3MnaynIu+Pjoj/01TDaNfvPDPuVRreoFxBVzEs0j3H2DPANOECEXLpVtnxI+msdey+UJDMFixefObAKEu/u9o6d4JscNEAxRCXTJK/8YhUYZgrgO3h6b/97JPwmq5KZZooSsX9QLYTyfKwidkKkzXBga7DDqAn6omoBwCPrXM+oiUWhhhJrZvPJpiUJIBpqMxz+XfUJoK7wTEson6zMtnxe4cbzuyK7TXwSt5N1DAXIrIM42P5h+JRdpZgjC7R8gCAkb4MJfboKmVCq+jDkPMwtV67RIWVkcDtpKemyuL5CzOHhPbkfq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH8yXMNxicx6zvk11xQKRkfRt1ATRC7xsaSQcVFPKxk=;
 b=KgxNXwCAqtua2wIzENBkl6c6Qy21+HvurimEFw+H5hZgckIIwTNATIArjmt1f2PZthBEhBmZjugtCzz2agrwu+All8snirVc933plLPzxJWcKxfI4VfXM95zPJ8LrNTXyaPbAEQP4jZB9R93tLvQOC2xO9knKcKKmt8aIRoHd5c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1971.eurprd08.prod.outlook.com (2603:10a6:203:45::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Tue, 2 Feb
 2021 18:43:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 18:43:17 +0000
Subject: Re: [PATCH v10 12/12] migration: introduce
 snapshot-{save,load,delete} QMP commands
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
References: <20210202154138.246464-1-berrange@redhat.com>
 <20210202154138.246464-13-berrange@redhat.com>
 <02126b54-f7eb-5ad7-b7f0-b66e60b26b50@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <13b1d60e-ac6a-20c1-47e4-94c8292812b3@virtuozzo.com>
Date: Tue, 2 Feb 2021 21:43:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <02126b54-f7eb-5ad7-b7f0-b66e60b26b50@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:208:be::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM0PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:208:be::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Tue, 2 Feb 2021 18:43:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95d2dbbc-0edf-4313-4fcc-08d8c7aa6763
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1971:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB197172CEEADECF3D7C5601E8C1B59@AM5PR0801MB1971.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qLIhW5ZPoFMYn/pv2Y+WXVwEJfZ7Hm9S6uhCdpkBBxHoI3sK42DYRYET6aqeuNPUTq6nFcFT5Wp7zCvM/eJPPTy5SA9JGqUzRgGWEqoBRXhxs9Kp8Pv7skqgJJsHr1re+9OgpBIGLPl2Ur1FtfWPo7Uf0u+GHeBMmZqJ4lUq8DZNmyeuQ7njwd9b2flEGCEVqqqOvuzOjoP41aMsMWgAfk6xw+9SCy7ySjjSy6OaBum77PUSlKSWv3UpvkrabRyiOUkmjHH5IYChGnU6v3ptJ9bKEDr3AkhsDbGb9H1rViUuSLTlwrdd+E7OpnJsjSWmgOwwtCeSADB/KrGK4PF7Ta+WP0E6UXpRFn/UuIhn8DkJ6o3rShdmrDhsOn5O3ShJVX8zSYTV10WUtyIaGQuemlJCKtto8+U73Fvs4kaE5hUAUdA41qRCyRQqBgx8wIUJ9FpxICsCLwzQv/hw/nkFXYo1Qu01Y1sztwjVPAzlH1hfCCUG5yJTCL6Tyxyn8ByolCaSck5ds23q9BuBFi0vtqRm4Vm3R7cjjVo95XPNvYC+LAsXFFazlsPNX7w+QivIxfzT5484GCKlmAKRWBLJMmb0XOuXeC9b0Tg3dX9ueU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(396003)(136003)(186003)(16526019)(8936002)(478600001)(31696002)(26005)(110136005)(2906002)(66476007)(53546011)(6486002)(956004)(16576012)(2616005)(5660300002)(4326008)(316002)(7416002)(54906003)(8676002)(83380400001)(66556008)(36756003)(52116002)(86362001)(66946007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QjgwZ1UzM2YxRHY0WmpuUVVSUWY5VmZkZGQ3NDc5akJQUm5aYm1INC9FNnBy?=
 =?utf-8?B?bEYvc0hxSXJNendva3FrbTNXVHpscTJNMlhESkoyVU5WQkJCMDBsNmVaeWcv?=
 =?utf-8?B?ZlJOY2d1a2VWaGxOeFVDTWMyRWZneUpwVlBCYzRFRG05NlhwdVF0b2wzUU1p?=
 =?utf-8?B?MWEwYk9EZUtZcFg5NEJGbXcrV01tL20vazhmZFdWYnEzMmRvUFlqZ0hyeEpC?=
 =?utf-8?B?bVF4ZjIrSlFRTThYTFEwaVIycW5qcnNXLzI0VE9TZ2RUZ0twLzlSRmFPZHM0?=
 =?utf-8?B?ZXhuK0lKRnJkRCtZZU82Y0ViTXdPT3Rkcmh6WHgyd0JjZUxkcnpmZUhhbmFw?=
 =?utf-8?B?UWJHd2tYTXBzRmF2QW9ZVmZKOEtxd2QzVGFQaEY1aWpWZ2V0V2lRbUYyckxz?=
 =?utf-8?B?SkgwT3JkYVgvdnJwazFRY2tySDFyL2t0dWE4aHI0dm1vYUpoNEdBOWJkZ3U0?=
 =?utf-8?B?Nm02bDVJMjlGZStWRmhNK0NDZjRZQ2V6U2dSVnB1OWJFUlNqNEJsVVNmSzJo?=
 =?utf-8?B?N1VjdFM2eHg3bDM3TnF6RjFsdHpSL1BlWUNkU1N5dGV6RGdsYTRwN29UdTRu?=
 =?utf-8?B?QVgyUVBraHd1aWpoM0hDRUZSWVFkaG5tbGYycGdJOWYvNWZ6TEFqd0pvc3dm?=
 =?utf-8?B?NFh0U3VYMXl4QW9GUGtaUjhhRk92OXZmL3pUdWUyb3oxcVU0YVV6T3NzcUxW?=
 =?utf-8?B?VytFYzNUNFEwKzRlNnU1OTBWQlhPSGozRURYQUl2dEV1MnR5MU9WRS9Ua2pp?=
 =?utf-8?B?clpFczdNU1BlT0JteE9MdElZaGpZdFVLRXdWa1dFZkhzejhyWW5ZSWR6MmRS?=
 =?utf-8?B?ZlRGWStoOFhpYzBmYnpISzBwOHRacFptanZhL0JXN2FqOEhXcmpYOWt6Tlc3?=
 =?utf-8?B?NUZ1aWx3WVRwZzFuY0d1dVBHaHVXYzFWLzFqYXZodkpiRDhDdS9xS0d4QWZ0?=
 =?utf-8?B?TkpwOEdRMDF0SkxyODJmWDdiRzRHb002T0MxbGNJblByT1VFTUtTWXRrSEF2?=
 =?utf-8?B?TVFBMHZMYVJ0RDRvd1VSRmZabXQxUEFIeFhNeEUxVjV6UzdneXQ5UHVLRytv?=
 =?utf-8?B?QjUvbEc4TmlNRkE0d1B0aEtaV3RsRU5iUVFEVWh2SjFjdU5BTWxnSXB3Mmlj?=
 =?utf-8?B?WERUTVM4blR6VitOMGZUR1lXazJ1aGQ3bTltaUJMYnJESFRpWVFZZVdJay9q?=
 =?utf-8?B?TmdlNGtNREJ2d3NvcHRJSjlvMjg4cmFQbDZkWGJJVHNKVm5BcmVydTVhR0da?=
 =?utf-8?B?Qit4Q2phMTZ2clVNUnNvLy85eU9BMXNITnVXbng1TFhIZDMvM2hHKzNZOG0r?=
 =?utf-8?B?UmZLbmNCTklNK3MrRDhCL3RibXQzakhjYkNRZ0Y3RTN5S3IvOGF6eFhJR0V5?=
 =?utf-8?B?SXlRanZ4MUVCVmVrd1pybXAzc2xWNzRnb2ZNYkxsZzV6cTRRR0RjTjNaYm5V?=
 =?utf-8?B?emwwM0syVEIyWjhXQm9HVjVjeWJvWHlzNk5IU2p3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d2dbbc-0edf-4313-4fcc-08d8c7aa6763
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 18:43:16.7547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9+ECzfBNzP0WEN0K4tReau7U1Hn/jTIkCzhMC6HsZkycWwJsHj2EIZyQHatoRLMOm/fPBOJqAA4dNmcDJ/R2EgLFkad5n0XFltVZbBF4mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1971
Received-SPF: pass client-ip=40.107.21.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.02.2021 21:14, Eric Blake wrote:
> On 2/2/21 9:41 AM, Daniel P. Berrangé wrote:
>> savevm, loadvm and delvm are some of the few HMP commands that have never
>> been converted to use QMP. The reasons for the lack of conversion are
>> that they blocked execution of the event thread, and the semantics
>> around choice of disks were ill-defined.
>>
> 
>> Note that the existing "query-named-block-nodes" can be used to query
>> what snapshots currently exist for block nodes.
>>
>> Acked-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   migration/savevm.c                            | 184 +++++++
>>   qapi/job.json                                 |   9 +-
>>   qapi/migration.json                           | 157 ++++++
>>   .../tests/internal-snapshots-qapi             | 386 +++++++++++++
>>   .../tests/internal-snapshots-qapi.out         | 520 ++++++++++++++++++
> 
> Not this patch's fault: I find the name tests/qemu-iotests/tests/name to
> be rather long and a bit repetitive; maybe we want to rename the
> directory structure to something simpler, like:
> 
> tests/iotests/name
> 
> (that is, move the named tests into a sibling directory of
> qemu-iotests/check, rather than a subdirectory).

Still, I think splitting test files from library (check, testenv, common.rc, etc) is a good thing.

I remember someone suggested to rename qemu-iotests to just io..

so we can have tests/io/tests/name

or may be, what about

tests/io/name

and

tests/io/lib/{check,testenv,common.rc,etc}

> And maybe rename
> qemu-iotests/check to something that requires less typing.  Oh, and
> while I'm asking for rainbows and ponies, being able to run check from
> the same directory where I run make, instead of having to change
> directories, would be nice.  But as I said, that's a wish list for a
> separate series.


I run check from any directory with my script:

# cat /work/scripts/check
#!/bin/bash

root=$(git rev-parse --show-toplevel) || exit

dir="$root/build/tests/qemu-iotests"
check="$dir/check"

test -f "$check" || { echo "Can't find '$check'. Is it a Qemu git?"; exit 1; }

cd "$dir"
./check $@


-- 
Best regards,
Vladimir

