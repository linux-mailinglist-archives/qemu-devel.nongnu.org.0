Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD34809BD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 14:38:56 +0100 (CET)
Received: from localhost ([::1]:44328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Cgo-00027X-VG
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 08:38:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2Ceg-0001PJ-9W
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 08:36:42 -0500
Received: from mail-eopbgr60092.outbound.protection.outlook.com
 ([40.107.6.92]:51630 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2Ced-0002cG-6o
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 08:36:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltNkTYVx+BeHx0yT3q3VKDPyFBLHPTCFG5yG/gXW9IodUelR6SW4epVspTQRuhVhFSJx2Qfv/2JVDrULEIdORlR9i/7K/QZaGK1ZSXaM1gKXJIqfcST739cdWmMiLN/qhKlwBmOxbtEx+ytQrEJb+CHm/tLbArvjlzW3H6jPc1G4swRO7cdR7pJx46Xuolt4iBMZvDADILxcnRWQioPSGnH+cTPXO3GMtIh/b15n76fROfIARbh+ypHaT0MFzzmgGUwtilSCJUtEQ7qTyKuFiSlu+KqSn8kkkpbtffDc/h7KrHhX1C7M28Hh+p2qX/a6qJExvR5dznXlzL+HsX9pZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+dZAfs3qSanY0x0avAho1rEYawbgAVYpv84cWhNaag=;
 b=a3edfRvCq+GRwk9V0007C0UnB20k/9rk4CD1/qU2WtXTr9clw3dP4qiU8D7KEO0jsB2hUOH69dsfJ0o1iGva6S2Luuajpm5Q+hAHPoaYJX7+wlgFn5nRHNQHg5JfUFRZf1nxjDZ1Wk934Z2vX27a+TzB4mch9Uqr2BPgKJ1xAbZ5iWXV/jy864uYwD/udlJIzMnqjdjq9C403l/Tzg/f0gVxjc1H5dk9w/XfQl8J0fRrGbjYJgm9uckY7ocfxbn85AJPPzzOnHJic9TMdl4YL823F8IU7ZbG+7Ru2Q7qyQfdhx9QLKZCsHfsOxfaMnp/1BNdsuq0Dt9am+mWFTHPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+dZAfs3qSanY0x0avAho1rEYawbgAVYpv84cWhNaag=;
 b=BOlfgz0bVG+8p/GCSHHsA3UCyTQjs6zkGWRblEr7NkY5U8Wml8qBEnwe6m/wqzjGMZNYUXmSObNBAUCCLduGL9b7iFew4lrXetQ0G7gytIIyYOeViDdpjC6SGRrqa8a006vX8pmJxiNcgWkXDVaS6T/GjrebloYUaQ0DkXMTrtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5300.eurprd08.prod.outlook.com (2603:10a6:208:18e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 13:36:35 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 13:36:35 +0000
Message-ID: <1de322d5-5729-08a7-81a2-812f99186ef0@virtuozzo.com>
Date: Tue, 28 Dec 2021 16:36:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/6] migration: Test for ram capabilities
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, den@virtuozzo.com
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-7-nikita.lapshin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211224111148.345438-7-nikita.lapshin@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1ef9cb5-ea0b-4f3a-12eb-08d9ca071165
X-MS-TrafficTypeDiagnostic: AM0PR08MB5300:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB530078486C4042CA90E5CE67C1439@AM0PR08MB5300.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: baAmxvfBthXvGQEqjOkw2ICxXGdDmsZpWw/K2c2McYphiw6ijXUX2vHU9tXTaNcoQWpjiJZm1h4t8Rk7/MYlKUCJ5BvYie1ZRtL6lBTDpRuSCIC1yLX2QM159ujGTF2mmyBoUGUCrhjFe3L1LfSjOXBhDRLTdCxWU7aRX0nbBjneKTl44hfgEzkRFRgOumOhS2Ov1yqiVhRsfudWnoH2H7UbJL/HrVwhsYS2lcysFnoHGevz/nLxLcuZ4wuRmr9RkLFf1maoQka4mLfJir0CI0QV9xo5LOaUuT2ysJAKKvZQsmTIYLjNsQWEW/j+ibqqO2FG3NE+tbDq2VxFOdVZvIl3L06zL34djRs/8sIf8J8yNRYxQc7lFne0lZ2maAOOQIJ04Q9oyA+wtIKctHHkNcXDIqaiS2uYSrM4hjs/serZenQ9kOGrsD2AVZra2CcOGSb0M7UquaEz62qD1VANWX7YGwQt+CpcAcpwfvcTZ1tyiNpNEExkUX+lY7YyNUArrGd8voppzDM09XiIlQR7pi6g5mibK3taedt1A/ycN3o8fVEEorlTln8Ak6wUWHAIiGZblyVJyJSx5AkSEo7aEy0AJOgi2nYmOE0XDW3YpKtrHDOrRDyZZrBuwHPn+2ifq+5EkGqZF+5I5XQC0aZXo/1egUkno9mXUiKTqYGf5CocSMiCD5J6d4gKbfv1Mah1b4UgecP+7I1WlKA2t6cU92lFL+NuMoCoeKtIeyb8JshrF8eGPluHgIXgO4hSCTvz8PRjWVD7c5nu7Hu9ara+7EUpBeO69Q0EIJ/2fuKxAlg7C4kYnVvG9xSQJ8C+QxuoCPYMcELfig3Bk5h93drsefmp9IjSvcrgIpZI0uIyaSOEkW0Jzj9eMeMhVJVHgZzS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(8936002)(107886003)(8676002)(66946007)(2616005)(66556008)(6486002)(52116002)(186003)(316002)(4326008)(31686004)(31696002)(38100700002)(508600001)(66476007)(38350700002)(5660300002)(2906002)(6512007)(6506007)(26005)(86362001)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFBNVC95WlJIWDByellqMmJqZExMVnVZNktOcnBidFN1NVpxOEF3aVd6eHps?=
 =?utf-8?B?MUI4L0hyY1BRYlFxMnpvSVY4THBWWlF0MzdUZnFiM1NDMElWRmEwbHVRaFg3?=
 =?utf-8?B?cG1wRjFLUWZTT3NTVW5XU3ZuK2dmQVB5UjZTSXFkaG1IOHFzcGozNXJQa2wz?=
 =?utf-8?B?Z0F6eWtqNklhbjY5VmVaZFNGWlFvNUlhbUYxRkF2cmdLQkc0eW1DUDZ6eUhv?=
 =?utf-8?B?M2Y2ZS9JMkd2M3NXalNKaU9lWkYvZDUwMWFIbDdxRDVRa1lxS0tMMVVMVFVT?=
 =?utf-8?B?WUE2YXdMZWRMQVRRdklMYU5lZlU2UDRkMktOeEFmMXdUQndFSG1MTC80MW9B?=
 =?utf-8?B?aHIzd0JJeDRPS3dpNWlUaFQrTE9MVDJPSHFaMWNzT1RBelpkbmk1YXBua1RF?=
 =?utf-8?B?NVQrR3hYRlo2Y2V3cit5aGhZZkEvY1pTclVLNUNKdm1Wa01SYWhLakx1WS90?=
 =?utf-8?B?ZGk5cWJGcnFkVE5ybi9SSzJZMkxOUk9YSzdiQnVZd2ZSNHVOUmt5eWZMaW9O?=
 =?utf-8?B?b0NTV2dKQloxZnY2Ymw4Mm5idlVIRUhDWkNpQkZRRWxSb0tqM1VqNzZHMXBO?=
 =?utf-8?B?ZkNpR0pHTitaZmR6ckptTUhIYU5lY3kyM1JRTC8wRjFObjdyYzJNbjF3a0R2?=
 =?utf-8?B?dkwyMnVCV25YSHlqVVVjV0E4aXBvVmc3ZVhoSGlWVWdHbUYySGZoRWpyOUFn?=
 =?utf-8?B?QUx2SzhiOFByK24xWm82Z2tzUXZlV0dBNFlWN2pvS3hHZE9odXNKMDF2b2tE?=
 =?utf-8?B?WEY0VHkwRFpEU0liTVRnanZkcThoV2o1YUpzWUhLcUQ5cDhJbkhjamRiUFN0?=
 =?utf-8?B?TThtL3FxU05MWm9WZFNlZHZ0UUZEVjdvSzdJR1J1ekJkM3VQV1RWQkMzUkhi?=
 =?utf-8?B?Y2Jxampad05RaDA2cnNlQWpxTndlL29ZZGg0TDd0YTJSUEZaQzB1SGFJRW5D?=
 =?utf-8?B?ZzlPcXl4QzQvVDBvVTgydTgvRkxtNTNOSDM5VXkydjRIMHVoOTdrSmdud1Fy?=
 =?utf-8?B?MDJZV2xRdTZzSTFjQ1ZEQTJNdFRxLzZjcTlrNE5ORTdiZ1NTZXoxYWpDUTgr?=
 =?utf-8?B?a2pRcXgzNU9rb1Z6cFUrZEZvd0pON3o2eVptRjcxdVk1QlJUZm1tQW53TzJF?=
 =?utf-8?B?TjdhNFM1SFNCSHRwNXppM1c5T284MkhBVkl3WXNHajRIcGN1VlFVNFJYZFY0?=
 =?utf-8?B?VmVSUDNjdUh5YVFHc2IxKzFkVHgxckpMUDFpY3pXbStJR1FnazkxSVo3dVFn?=
 =?utf-8?B?d2Nib2VURWU3cU1mYjB0THQ2dkZRbGc3QjlDb0lodCtwdDY1WkZ1bndDb282?=
 =?utf-8?B?MDRCa05Zdld2STRrVU9BQ3FpL1hra216Tm9EZ0tvL2VDaUYzNEsySVFzanQ2?=
 =?utf-8?B?U1kxOUFENlcreW1iY3dyYkRvbWR2WEFDNCtwUEo3cy9zS2FuSWdFWnRmNlp6?=
 =?utf-8?B?ZmZQRStmTkkwV3dLVXZEcGRQMG1VejF5cVJRQ2dWeFNucFFnaHhicE02RGdO?=
 =?utf-8?B?TWo1em4yUjVHOU9oZ0xYOHBjZ2xEVlVmVmdWMm8wV0FnNHNzRFVDU2RtN0Fp?=
 =?utf-8?B?UHVzRm5HSnk3ZmZPWlByMTlZQkdWclJlbUJMMy9iSlplZEJDSUc4OW95QlZH?=
 =?utf-8?B?Z2xIa1lKU1dySTJrTDZzM09OMHNuc20yTGVGTnEzY1FSRUEyMXdydzUwekMx?=
 =?utf-8?B?SklUYnVWTXhCQjZxaXAxSDMwUlcvZzNwaWZBTkRSVFFPRnFJdWVIRmRNRkt1?=
 =?utf-8?B?Vk1uRkt6SjhKdzBaZis2VGJsNFRhTTV6Yk1ORGZTWkFKRkFjODgvblVSYzNi?=
 =?utf-8?B?bWh5VGxxMXJEbkRCTnVxZHRJZzFISnFoanlZd05wQUhxWitqZmw3bko1WGox?=
 =?utf-8?B?R1JMRVVmL0JKTk8rekQxd1hTbU43dGp5Uzk5YWhHUUhmbEZUYWJtMUhvNnNW?=
 =?utf-8?B?R1lUdFg0clV0Z1FXUXcvencwTmswd0l5L2pzSVBmZTBJaEdoMFpQbWdmY005?=
 =?utf-8?B?WDU5bWtzT1IzSDdXOXJOejdlWjlQQlNEZy9mN3lTK1dnWEk5WHNqRlBkRHMz?=
 =?utf-8?B?cDdKKzlObzAzTyt6S2Z5UVFxcWErc1BCTzJEV1QzQndSdWJBQ2gwRWJCV24w?=
 =?utf-8?B?UnB0QVlQbnFNd0NWSDFTTWxSaGxiM2orRTJjcElRUjA3STFidEU4eHgzNldt?=
 =?utf-8?B?ek5QWjBZcnBjUWVEbTZpaWRBcWtmTXlBN05SWEJyZkJvaGllRmdRbFMvQTRX?=
 =?utf-8?Q?a3qvWTBnX/jbzEwC/MWmCv29Tl0nA1iiErYJxCRdoc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ef9cb5-ea0b-4f3a-12eb-08d9ca071165
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 13:36:35.6303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lF0FAgGsHp6r4I/BV/5PfTkiKoJHRxZJeb8fvjRfUPFFiLUPjKRhEgR+o54h0uHTEaPbMOyMjYhtzSeL3SQaKd15w12Tf3okGRFYuRzayqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5300
Received-SPF: pass client-ip=40.107.6.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

24.12.2021 14:11, Nikita Lapshin wrote:
> Use scripts/analyze-migration.py to split migration stream into
> sections and analyze its output.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
> ---
>   .../tests/migrate-ram-capabilities-test       | 96 +++++++++++++++++++
>   .../tests/migrate-ram-capabilities-test.out   |  5 +

Most probably we have to move it ti tests/avocado

(look at tests/avocado/migration.py for example).

>   2 files changed, 101 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/migrate-ram-capabilities-test
>   create mode 100644 tests/qemu-iotests/tests/migrate-ram-capabilities-test.out
> 
> diff --git a/tests/qemu-iotests/tests/migrate-ram-capabilities-test b/tests/qemu-iotests/tests/migrate-ram-capabilities-test
> new file mode 100755
> index 0000000000..917f888340
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/migrate-ram-capabilities-test
> @@ -0,0 +1,96 @@
> +#!/usr/bin/env python3
> +# group: rw migration
> +#
> +# Tests for 'no-ram' and 'ram-only' capabilities
> +#
> +# Copyright (c) 2021 Virtuozzo International GmbH.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +import os
> +import json
> +import subprocess
> +import iotests
> +
> +img = os.path.join(iotests.test_dir, 'disk.img')
> +
> +class TestRamCapabilities(iotests.QMPTestCase):
> +    def setUp(self):
> +        iotests.qemu_img('create', '-f', iotests.imgfmt, img, '10M')
> +        self.vm = iotests.VM()
> +        self.vm.launch()
> +        self.vm.qmp('migrate-set-capabilities', capabilities=[
> +            {
> +                'capability': 'events',
> +                'state': True
> +            }
> +        ])
> +
> +    def tearDown(self):
> +        self.vm.shutdown()
> +        os.remove(img)
> +
> +    def check_ram_only(self, output):
> +        str_json = output.decode()
> +        json_obj = json.loads(str_json)
> +
> +        success = False
> +        for key in json_obj:
> +            self.assertTrue("ram" in key)
> +            success = True
> +        self.assertTrue(success)

without explicit loop and extra variable:

   self.assertTrue(json_obj)  # not empty
   self.assertTrue(all("ram" in key for key in json_obj))

> +
> +    def run_migration(self, capability, tmp_stream):
> +        self.vm.qmp('migrate-set-capabilities', capabilities=[
> +            {
> +                'capability': capability,
> +                'state': True
> +            }
> +        ])
> +
> +        self.vm.qmp('migrate', uri='exec:cat>' + tmp_stream)
> +
> +        while True:
> +            event = self.vm.event_wait('MIGRATION')
> +
> +            if event['data']['status'] == 'completed':
> +                break
> +
> +
> +    def test_no_ram(self):
> +        with iotests.FilePath('tmp_stream') as tmp_stream:

Hmm, you use same construction and same file-path for both tests. Let's instead just set the path variable at top (like you do for img) and remove it in tearDown().

> +            self.run_migration('no-ram', tmp_stream)

and you will not need the second argument of run_migration()

> +            output = subprocess.run(
> +                ['../../../scripts/analyze-migration.py', '-f', tmp_stream],
> +                stdout=subprocess.PIPE,
> +                stderr=subprocess.STDOUT,
> +                check=False).stdout
> +
> +            self.assertFalse('ram' in output.decode())
> +
> +    def test_ram_only(self):
> +        with iotests.FilePath('tmp_stream') as tmp_stream:
> +            self.run_migration('ram-only', tmp_stream)
> +            output = subprocess.run(
> +                ['../../../scripts/analyze-migration.py', '-f', tmp_stream,
> +                    '--ram-only'],
> +                stdout=subprocess.PIPE,
> +                stderr=subprocess.STDOUT,
> +                check=False).stdout
> +
> +            self.check_ram_only(output)
> +
> +if __name__ == '__main__':
> +    iotests.main(supported_protocols=['file'])
> diff --git a/tests/qemu-iotests/tests/migrate-ram-capabilities-test.out b/tests/qemu-iotests/tests/migrate-ram-capabilities-test.out
> new file mode 100644
> index 0000000000..fbc63e62f8
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/migrate-ram-capabilities-test.out
> @@ -0,0 +1,5 @@
> +..
> +----------------------------------------------------------------------
> +Ran 2 tests
> +
> +OK
> 


-- 
Best regards,
Vladimir

