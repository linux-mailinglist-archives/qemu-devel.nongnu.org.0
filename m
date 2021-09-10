Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06CC406F5B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 18:14:56 +0200 (CEST)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOjB1-0000a3-Dj
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 12:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOj7B-000534-Hr; Fri, 10 Sep 2021 12:10:58 -0400
Received: from mail-am6eur05on2128.outbound.protection.outlook.com
 ([40.107.22.128]:44897 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOj77-0004bE-9k; Fri, 10 Sep 2021 12:10:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ/NEyZwcI47FxZbGD/TAQSWRC/ouIeVtSk8Xc+wEU0d0OZ0PpsA9/YNu4OvR4BKFnmZKfm/G13paF2hSsQ+X5bqLK4mAkWZrYYIoxMpMY7imuMvWjBK76V4LrvkHlFFUv0wPDe/GsCU/LexLLx7j2M6zs02EsruaY+0oxZkIm7eul2rvdrSKA0g+qTGVJmu9DN+pS6++aq3WLsPHHnRBUHKXVCHnmStd4Kjfra12N+tLGCyjUVoXvLIxoba82iXV5DvP/z9nr1/dls7jIOeUGyNkJxqtte8Bw9vI0W3u8iG8dMdHUQ6Dq/tB+MY0GcsWnVoxU8pn2aQhJtcD0mTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=jAqSvn/YYIhdHydwTgTBUZvORWzCK0m7z/OEeh4kwww=;
 b=lmjdewmL+xWOAz+hCNM20zhb23XL4Rgc1wEhGsqdN4oZR0pH5CQhnihRbfUHloaTKzQzEzwkpqtkJ+oaLUXYWu8YLeiAY0ZWH+lCAwbJMIm28G3Swjxc1I6FYvm4eqhhPkknYkcJ5yabOwV1cMK8BGFh9zfDGis+FyPmI5vYR1vYTQCzHxPhqaZ8CKRRKcbVKm6oBI58MxAJXuGZ8WVrZ+VZ1dF0OYXHSADvy/0rzKpkfIA+RFF+YfgLv2hKwKo1VoOgf+bUEbkmrBBtXrewL8UY0MqEtJGV3GXMXJixEOJwyPRZuUCk1O9/lXvQialZFLGuqUhCppg9wRvB8CLzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAqSvn/YYIhdHydwTgTBUZvORWzCK0m7z/OEeh4kwww=;
 b=OqbGWTMKcxx2YlsNrNm+Et6yjeugv/0BwistgkH2Tq2z+QgVDHsXoX1pC+BY5Ule2Rpv+SoBwBrRoZakAbhD1B8iT01cfhDcb70VGZCKORDqeI1W6R2TmIibjzh+MWNbgQ9opo6T11MjkbuZvU/i3TwrKiKVZZGA3obq4U/rzqk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3030.eurprd08.prod.outlook.com (2603:10a6:209:46::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 16:10:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 16:10:49 +0000
Subject: Re: [PATCH 1/2] tests: add migrate-during-backup
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, jsnow@redhat.com
References: <20210910110100.31976-1-vsementsov@virtuozzo.com>
 <20210910110100.31976-2-vsementsov@virtuozzo.com>
 <8c7f8685-13f0-521c-8de1-97e47141bfe6@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a0596ca2-aa9f-e849-02fe-879640a782d2@virtuozzo.com>
Date: Fri, 10 Sep 2021 19:10:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8c7f8685-13f0-521c-8de1-97e47141bfe6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR3P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 16:10:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ceb8dba-b569-4900-3b52-08d974758dde
X-MS-TrafficTypeDiagnostic: AM6PR08MB3030:
X-Microsoft-Antispam-PRVS: <AM6PR08MB30306313BB6C7622692D8D32C1D69@AM6PR08MB3030.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O7xvifSMk+Nh2+Tk8ApQ/b+fuhzc9lYmNKZ4LA32ws9uyCR/7EtAIHHFQajtvRjuWHETmRHBupr1/O11G/AqxTQbIgFh7WAZtxSj6J7B3bR5jRfM6bS0JZgoLb8shIo9ocxJbvWpS0bF+uW2jCR9gs7yEIKIBVewdaIxmgt+aBLJYKRiN+UHCIy6afI9cEJIqETK+eTbXGVKJEVXtXIh15XDUEViV9baNIbqOWpp5tPmr8F4eCEEjWRqPMpy9wxBuC8pTO1W98TWDzrdNFFxIISsH62n4i+o2igIDp+oAaXzOr6DYJ1VO23PSZBuClWEdT032XtSpeq7hk3GMdCpISsIGt+408OvPoPmajAnTLZf+HUSEeks/F/TDvnozMhnF4vdiav2m3JlUAn527ZkUkl24HtH+cA/1plebXwb7BvWDYNO5hwohlNk8EPR0fbQwH5n0LKtr5OmcmezRk1XFVqLJVBn5usrxNs8E6wcqdUen+Fpf3hAQNkp75L4ilhvTk4yl+mP1cHyrXoNrp+MuNn44PXxoiXeuzO3C0A+m5euS3j3HDG21GG5X2dNpp/fLmbGzUNQpSM3k95eOfPWGco7gZNRNYQqtaVfOJtnXVyp9DED956RBrUoeobGmf8H45iLiu370F2kzbV4RE53wFkOjsbBMJGKpzsCJFkpqpMGNq8V5IdQGlau9kn0yVkSw2Exbuau+9Zahuuj4UNUpsl2of/Q45ErEJdMcMqqwGPiCPHgsMOUeFqROXYhwDF/jOMc5SnaX0HeqGt67OoemrN9QcJtfZrlTitUvE9/jFxHgW+kfrvFJ/bsF964QeSB2Z1yVKsAUXHnF7qik0NdibC2gCs+HWYsJKhOpblAijA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39850400004)(366004)(136003)(31686004)(2906002)(36756003)(38350700002)(316002)(16576012)(4326008)(38100700002)(86362001)(31696002)(66946007)(186003)(478600001)(66476007)(52116002)(66556008)(8676002)(5660300002)(956004)(53546011)(2616005)(83380400001)(8936002)(26005)(6486002)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzBKTjBiNWdiVExKT0dkVVJwRC9XUTNoU0pGaC9JeEFpbWhSclE3TTdhcmxL?=
 =?utf-8?B?cVVRSTJQQy9JbzRNVEdjMG5PNmUvaHJpNEhtWlBvZXViSnNybFQranY0YjdR?=
 =?utf-8?B?OVlyVkp0UmNac1FYUzB0YkUyQ3gvc2d5WGVvSzBLSlRWUDdoQngzTzkrcXlq?=
 =?utf-8?B?VVdsLzRuL3JLa1ZwdHBhTFJBRG14a0NjY1EzblYrVTJwVHpkdjhydnBIZlhJ?=
 =?utf-8?B?Q09TTDBYdmlySW5yS1pJellqNnlUWGs2am5ZOVI5TFpnYTJaTUx3S0I5M25X?=
 =?utf-8?B?T2hSc2R6ck1hbWxyVDE1UFZWWEIrYTNnT2hkK0R6eUdKbW1DQkErM1FjRlJU?=
 =?utf-8?B?NmVYa09RMG1CWFV0SXFkbDRKQkpudVZpaXFQQjZETWRrZDRYK0pqYlZTOHBr?=
 =?utf-8?B?b1ZKRkhCTkY0TmlvdnRrRDN6VkpYTmpuUEN1NlI4N005SjBNdE5DVHNFREZJ?=
 =?utf-8?B?Q05tTFdBSjFzdUtYR0l4UGF3TkRDWW8zUHpFcklGUk1zWXRka2FXUGpRSmh0?=
 =?utf-8?B?UTdRaVNPalZBN3VudzFySXVieDJQRDd6MG00SEU0STRJUEpkWmJvdm1ZZmhB?=
 =?utf-8?B?ZjUrZjgyb3VVdndyTTFMQlJ4dXNkNDBKd0MwRFVYeDN4ZFN5YWh4aXp5STZO?=
 =?utf-8?B?R3lCUFJ5VVRhTmNYRzRvNm9jVlJ2Nzl0REdMbUNGMkxDSURRenFFb3BKUXdU?=
 =?utf-8?B?eVBhTHNSWXAxWVdqa1k2ZDNsbGFiVHBHSnVWb2pQeG9Wc2thQUg1NkRkUTND?=
 =?utf-8?B?QlVGMmNNaTNNYlRtU3htSXRzSCtwUTdzOFg0TTdyak1ONVV5VDFqemJUZHk2?=
 =?utf-8?B?ZlJjNWcwWmQwK0J0dVpqZVYxQmNLZ0lUa04xalZuL25FcC9UUjE0NStLakh4?=
 =?utf-8?B?RlZZSE1CVnlGdnRPS2k5RnZNZzlBR2tvOWRSMUJ2WTNqSC9velN6MklTK0l4?=
 =?utf-8?B?NVpWV0hNUXk5K2kwNytKOUgwUk5LZTJWZkhIbFE1Um91NkpCWldhRnZpT0g5?=
 =?utf-8?B?NnhENFM3c0c5bE8wbHVIVGE5WHRGMlc0Ymg0WEk1V215VGN6WEtZTXJ0U1Q4?=
 =?utf-8?B?ZE5wemswTkNBN2FyRk52bEVXckNER1Y1dXZ5RGUyUEJCRkIrUlIrWDVQejM5?=
 =?utf-8?B?YU1Qb2cyMHpoYmMrVGFwMWo4TUh1YUUxcmFGZ3prb3BGQ2hDcDBGUElqMWtX?=
 =?utf-8?B?ZExVbmZ5QW40VXRxYWk4dUswaklDTkd0STVCRENFTGlhT0g0SFRxNHphQ3Ft?=
 =?utf-8?B?Ym14S25WNzZmQ0dtOExkMEFiSUo3WXVlQ2I4ejRxVUZZNzF4SkhDWk01Wnha?=
 =?utf-8?B?OE51RDJqZUdmTjcvdDhaWmdYWEZiaGg0NDN3ZUNJak8yakt6VE1YajVSdno4?=
 =?utf-8?B?SzQvNy9mbDl3VDNEYmhPbWc0U0NXTE1jRWo2M2hxMjA0WXNFNVZpNnNKUTFR?=
 =?utf-8?B?QUhkRUZ4SVMrNFJUdEtBTzJRSmpabmFxZnYycVYwSTBYZFg3ZGhLNkFoR0NC?=
 =?utf-8?B?Z0dqbUVKSzkwckdPVmptTzk4UmtvVUludUV1VlZpelJ1c1FtUzlwdllUZ29N?=
 =?utf-8?B?eHFGSDVQTzVsbjRNUVVxQ2QvMXJQVGt3NUxxUjIyYnFEWmkweGRlMGcrY0lU?=
 =?utf-8?B?NG9ucWJXWjJQbTZ1VGVvK1M4Ylc3emgzNzkwU1VLMEtPOSt6ckpmMEthTmNk?=
 =?utf-8?B?QkpoWHc0bHlZYzNFT3VZbVlBM3Jad2IrRlZ3Zm0wa2RWUFgxQnpBN1loa2Jj?=
 =?utf-8?Q?VmRlsw+yKjcndWhL9MjV18ICEhpUrTlF4kBIFnM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ceb8dba-b569-4900-3b52-08d974758dde
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 16:10:49.1415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5f2tfKBMlbMqSePPqh6keAf3L/E3N827JZHgPKetxZX8uSuHnBvtjkQIYqeiEndkIRWRUkzH2S27Vdst8YSe1vYpUfBr58KsW3Db1Yvctc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3030
Received-SPF: pass client-ip=40.107.22.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_NONE=-0.0001,
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

10.09.2021 17:18, Hanna Reitz wrote:
> On 10.09.21 13:00, Vladimir Sementsov-Ogievskiy wrote:
>> Add a simple test which tries to run migration during backup.
>> bdrv_inactivate_all() should fail. But due to bug (see next commit with
>> fix) it doesn't, nodes are inactivated and continued backup crashes
>> on assertion "assert(!(bs->open_flags & BDRV_O_INACTIVE));" in
>> bdrv_co_write_req_prepare().
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   .../qemu-iotests/tests/migrate-during-backup  | 87 +++++++++++++++++++
>>   .../tests/migrate-during-backup.out           |  5 ++
>>   2 files changed, 92 insertions(+)
>>   create mode 100755 tests/qemu-iotests/tests/migrate-during-backup
>>   create mode 100644 tests/qemu-iotests/tests/migrate-during-backup.out
>>
>> diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
>> new file mode 100755
>> index 0000000000..c3b7f1983d
>> --- /dev/null
>> +++ b/tests/qemu-iotests/tests/migrate-during-backup
>> @@ -0,0 +1,87 @@
>> +#!/usr/bin/env python3
>> +# group: migration disabled
>> +#
>> +# Copyright (c) 2021 Virtuozzo International GmbH
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> +#
>> +
>> +import os
>> +import iotests
>> +from iotests import qemu_img_create, qemu_io
>> +
>> +
>> +disk_a = os.path.join(iotests.test_dir, 'disk_a')
>> +disk_b = os.path.join(iotests.test_dir, 'disk_b')
>> +size = '1M'
>> +mig_file = os.path.join(iotests.test_dir, 'mig_file')
>> +mig_cmd = 'exec: cat > ' + mig_file
>> +
>> +
>> +class TestMigrateDuringBackup(iotests.QMPTestCase):
>> +    def tearDown(self):
>> +        self.vm.shutdown()
>> +        os.remove(disk_a)
>> +        os.remove(disk_b)
>> +        os.remove(mig_file)
>> +
>> +    def setUp(self):
>> +        qemu_img_create('-f', iotests.imgfmt, disk_a, size)
>> +        qemu_img_create('-f', iotests.imgfmt, disk_b, size)
>> +        qemu_io('-c', f'write 0 {size}', disk_a)
>> +
>> +        self.vm = iotests.VM().add_drive(disk_a)
>> +        self.vm.launch()
>> +        result = self.vm.qmp('blockdev-add', {
>> +            'node-name': 'target',
>> +            'driver': iotests.imgfmt,
>> +            'file': {
>> +                'driver': 'file',
>> +                'filename': disk_b
>> +            }
>> +        })
>> +        self.assert_qmp(result, 'return', {})
>> +
>> +    def test_migrate(self):
>> +        result = self.vm.qmp('blockdev-backup', device='drive0',
>> +                             target='target', sync='full',
>> +                             speed=1, x_perf={
>> +                                 'max-workers': 1,
>> +                                 'max-chunk': 64 * 1024
>> +                             })
>> +        self.assert_qmp(result, 'return', {})
>> +
>> +        result = self.vm.qmp('job-pause', id='drive0')
>> +        self.assert_qmp(result, 'return', {})
>> +
>> +        result = self.vm.qmp('migrate-set-capabilities',
>> +                             capabilities=[{'capability': 'events',
>> +                                            'state': True}])
>> +        self.assert_qmp(result, 'return', {})
>> +        result = self.vm.qmp('migrate', uri=mig_cmd)
>> +        self.assert_qmp(result, 'return', {})
>> +
>> +        self.vm.events_wait((('MIGRATION', {'data': {'status': 'completed'}}),
>> +                             ('MIGRATION', {'data': {'status': 'failed'}})))
> 
> So the migration failing is the result we expect here, right? Perhaps we should then have a loop that waits for MIGRATION events, and breaks on both status=completed and status=failed, but logs an error if the migration completes unexpectedly.
> 
> While I’ll give a
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> 
> either way, I’d like to know your opinion on this still.
> 

If migration finishes with "completed" backup will crash (current behavior).
So, if we just check that nothing crashes, we are OK with both completed and failed results.

If think more about that all...

Actually, nothing wrong if both migration and backup succeeded. It becomes possible if we don't inactivate backup target node. And actually we don't need that for migration.

On the other hand, in Qemu we are generaly OK with reading from inactivated node. But that's wrong: if I understand correctly, "inactive" means that file may be modified by external program (for example, by Qemu process on target for shared migration). In this perspective, we can't do migration during backup.

On one more hand, for non-shared migration it's absolutely possible to support migration during backup: you just need not stop source immediately after migration but wait for backup completion.


So, just to be more concrete, I can suggest to amend the following


diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
index c3b7f1983d..9bb7ebed3a 100755
--- a/tests/qemu-iotests/tests/migrate-during-backup
+++ b/tests/qemu-iotests/tests/migrate-during-backup
@@ -72,8 +72,13 @@ class TestMigrateDuringBackup(iotests.QMPTestCase):
          result = self.vm.qmp('migrate', uri=mig_cmd)
          self.assert_qmp(result, 'return', {})
  
-        self.vm.events_wait((('MIGRATION', {'data': {'status': 'completed'}}),
-                             ('MIGRATION', {'data': {'status': 'failed'}})))
+        e = self.vm.events_wait((('MIGRATION',
+                                  {'data': {'status': 'completed'}}),
+                                 ('MIGRATION',
+                                  {'data': {'status': 'failed'}})))
+
+        # Don't assert that e is 'failed' now: this way we'll miss
+        # possible crash when backup continues :)
  
          result = self.vm.qmp('block-job-set-speed', device='drive0',
                               speed=0)
@@ -81,6 +86,11 @@ class TestMigrateDuringBackup(iotests.QMPTestCase):
          result = self.vm.qmp('job-resume', id='drive0')
          self.assert_qmp(result, 'return', {})
  
+        # For future: if something changes so that both migration
+        # and backup pass, let's not miss that moment, as it may
+        # be a bug as well as an improvement.
+        self.assert_qmp(e, 'data/status', 'failed')
+
  
  if __name__ == '__main__':
      iotests.main(supported_fmts=['qcow2'],




-- 
Best regards,
Vladimir

