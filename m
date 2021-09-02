Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59223FEBCA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:00:31 +0200 (CEST)
Received: from localhost ([::1]:33002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjWI-0003Oh-PV
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLjU6-0002fM-Jv; Thu, 02 Sep 2021 05:58:14 -0400
Received: from mail-eopbgr60093.outbound.protection.outlook.com
 ([40.107.6.93]:63874 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLjU4-0006EQ-Vg; Thu, 02 Sep 2021 05:58:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwV6IlGc8W9t6vZHf2D1eAUd1kbxK/UjvQL8/BDDHS0mBSco1b8/S9/7H1g8/uu9nZ9FeT6qTJscmYvTOy0NFQeO9oQEENBYFYThV/nWYaCWqZQ/0WXi5f48+FvUawh4j6rxCM9tQuBkL2xVmSrQZ/euyncgytrsWaTHlpxn3K9lX7lMmC3DPsftcKNkKjnyrLhIe8FjqWVtCKOVvbHmR0OgKhsaZZ0E1sV1sjd8tWROZ2yUzUtzb9NhahOyoLEHGJdVvERM/+FFtOFXovuOrfuh3X2TtbKX+eUzqrvhQUlc7j4vQsA9ER0EM7sREmMS9YMI1ty/mw7ZrrKmJb6/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7NvWlKNeR/YDu77Nlp4xKrN1Ysszq4kOEUkkrSIQgw=;
 b=T3HOsryVFtERK8yHDzAp8JCbFlfUwWtaKg+jTYjdeDlV+LlVn+ugCve7VdCBj2RpTXfcEghHc2Pq9zu+HH44CBZ6P+ip+CxQ9XAVGFPAjrrktkeN425Q8XNRaQlSWoylBdqqao3UDeNMdICgL46pEXQkkO54QLFw0c+RtLJqFhjNbEPqMKUpFu5QIHv9ql4LJ+LutqVI15nn2kQg8z82kj6yy19gIq/Tva9yvBl3AuyzFi5DRtdku1hqjY5WYxt2FV4ZW0o/bZ9l9z+rkfJH9++Oc6VXbSQ1EqoRVW3vLDPj1FMCK+OZ5yV4mH8Q/eJVOO1oOLYIEc/bmb/CsVC3Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7NvWlKNeR/YDu77Nlp4xKrN1Ysszq4kOEUkkrSIQgw=;
 b=TMRBw/wX+qJRKNim47HpD0o+Gyktbvqv+rWI5TUEirUHV2GaJuFknYq18WNIrSqdNL7FWJkhvHIMdlBdG9dpmkg9LzoUousevNtbBgiH/UKNkkrINfmiuTDY9BFCG3ZZreZhcNaSpod9M7ESfeypD7WZODYIOgmMGBpg5eKmPMU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4279.eurprd08.prod.outlook.com (2603:10a6:20b:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 09:58:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 09:58:09 +0000
Subject: Re: [PATCH v4 4/5] mirror-top-perms: Fix AbnormalShutdown path
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210902094017.32902-1-hreitz@redhat.com>
 <20210902094017.32902-5-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ab23a119-1315-09b7-aeec-8d9039fdbd92@virtuozzo.com>
Date: Thu, 2 Sep 2021 12:58:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210902094017.32902-5-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0070.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR10CA0070.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 09:58:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82e6efb2-547a-4fbf-9d1b-08d96df82aa3
X-MS-TrafficTypeDiagnostic: AM6PR08MB4279:
X-Microsoft-Antispam-PRVS: <AM6PR08MB42796DD02A4B4BF2B8F9285AC1CE9@AM6PR08MB4279.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IDrVwy1jU+/IbckrsMjy2L2URwzt3G1Aw2ffV82c6UBQrQqUkVMdtYIvCvRNq9QDQIUZRf5sjpd/smQZoFkp60PYpeXSBH9OBkFxnN0qIWwgUvplAeYJFv8NoaO0LpQHK0I4o88GGJ4YogXC06Bt1O8XbVcFx4EvowlMQkgtxPC6i2f3uirGTEtX7zuHXqXdHU/SEf+fr8LDkwZPL0ZIwsoM1uowRhsQLqPmp9uyB4MBCuCdv7uMTaz+cb4DdgoDo1Ao/65/5N1wvwtr8Q/kfGOUlbqFBgH90jeN5OQZE5n2za81rGFljPz8fpTtQIRbjrZG6lZKHWJGtSbDLYzZpbVf84Tt4WtNIdJ9C5Fv2bB99nBvisNYqPxMtRTlC4QrBTABPUs8SgY8vLD3BfMhJ5SPKRvTyZY0MYyFhrWrxs/xhF4X2ICoa5nWqC882/dUKyOs3zM2AqI932BZFsm/TGoTERsNI9SevldnubsVmlScKKyaRRNmLKKXw0Wl508oDx7jwUBSF5kN7e0cNafg9FNlOH7V8Ox3F5tTBw0PTuV5zVYKbAKH/JwDYV3YycWvppqyRXvXA+HftT6hXvENs0Xm6MXuG8HOjBuV6yHwY9PqKGenFn2V1N6pnaURJqDAhPVLv5kn7dpSFyw3Jn8N6d7lOtX0hRRAd3pWls0DsXOlKZszHFaSDaUiGTQocqlSUHcQ5ObVyvyphh98Rby/Uq0GfHb/EU+mLHNJm0FWqIty0yfJpFCeavttZdxvz7HgucfCfUh4be46xcNakSw71w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(396003)(376002)(366004)(136003)(31696002)(5660300002)(38350700002)(8936002)(6486002)(38100700002)(86362001)(36756003)(4326008)(478600001)(54906003)(2616005)(956004)(16576012)(2906002)(66946007)(83380400001)(8676002)(186003)(316002)(31686004)(26005)(66556008)(66476007)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eS9VREF0U3lSR2JZeFY2NmhpWWxmLzFxbFIxRHdweDJBbWI5dEdkYzFXUVlv?=
 =?utf-8?B?eUtnbm55RHBOZndjc1ZPR1Q2dHl4WHNFeG5YUHhrNllDNFVTU1Vxd1FEWFFu?=
 =?utf-8?B?Tk9yVzRtRFlhZDJlalQrdFdkdXhHMEVFNmhhR0ZqRWxsT0dzcVNHUkYrbmpt?=
 =?utf-8?B?NFU1R09BemZBa0JldmsvWjduWUZqSmpWZ2psbk1aRlBVK1M1Y2UzbUhFcHk1?=
 =?utf-8?B?YWVWY1ZYN3FaeGN4Yjh1ODA5bExpN1BMajVaUzZsUHJLTXNmb1llamRtckN4?=
 =?utf-8?B?ZjFZYnBqTktpS1ZlY2lRWUNlTms3cTJWeEFPZmhCUm5JTGtSUDRjTDFzTFBr?=
 =?utf-8?B?eDJCT1ZrcWdxWkxLa0VDUWhpUndSNUdQNkRRWVhiTWVleGM1d0I1VXhBTk94?=
 =?utf-8?B?b3BVdVduRlJiZWtuY2pjUVdsRTR0R2p6NlhYNDhvZkRHck9idmdVZlpsTkVN?=
 =?utf-8?B?bFUraXBqTlE0UzFPb24wZE5wV2JzdkVGMkFhZHVhQTFhTW5NZDl6VTg3ekpm?=
 =?utf-8?B?bjArbUxMY0crUEtXMkg2RGRFdlQ0cUhIaFJRbUxTVUlhUzRFQkVFaW53Y0lQ?=
 =?utf-8?B?RXRYNGtlNGFyT081UGJXaTg0ZHk1RThUTzRxb0Q5eFFkMCtuWWtLQ2U4RWRa?=
 =?utf-8?B?RDBmS1hTN0JUdDRLTDBaKytQREZsUHdHVWxjQnJTdjVUR0FleTVHdHJCMVk5?=
 =?utf-8?B?akk3WkN3cXgxZ1F3bUlpZjhzSDltTk0wMDBqb0Q4cWNYNFhaT3RCZ1BzU0xQ?=
 =?utf-8?B?T21NM3RWZm9HWGd0REZhVjRkbGJxbVpKRnhuUU0rZzlPaGtVZXp5TGpnNWdT?=
 =?utf-8?B?N0pXbXBWbk9vY1pQYnNncE0vWnNNRzBYdlRsMWg1N2RrcVpnV0gvdUNEZ3Vl?=
 =?utf-8?B?NUU2ZDRwYzA0RmJramtZOHlWMitUbDlrdnJmaG50czRaUE9ZaHBZVVgwV0pj?=
 =?utf-8?B?MzNaZUlLS2VWY0FrWkFKN1JKQm43c3JFSzBFVS9meWdJNEd2b29FRmprMGFa?=
 =?utf-8?B?Q3JzRTJmeTcvcU11YTRvYkh3U2lJUUJQWTdsK0pWWWFsRVhOSHFoQTlVQkRI?=
 =?utf-8?B?NUUrTzZ2MGo2Y001dXBLK2lGeE1iYUU0Z2l6ZGlMTCsrQ0loWmhPUjdKOE1P?=
 =?utf-8?B?Ly9HMWtTSlI5ZUc5c1hNRDVuWDZoU1pzYnBVZG41NmQxd1haY2IxemU5eWxz?=
 =?utf-8?B?ODdhalNsUXNDMHdBVldUQ0V3Zy9LYk0ySHJEaWsyMFBiUFVBVVAwQkNzdzcw?=
 =?utf-8?B?ckZ5K1VNQ2M5UEREZW92K085V0VUc3lDZE5VYkVwRnJsbGZDTEdmN1V6ejZx?=
 =?utf-8?B?dHNTaDc4MGVtaS9oVThtbHR6a1pLZzJqVHRXOWZaYTBVZ2U0YjBpU1YzVERD?=
 =?utf-8?B?YnZ2NkhMZjU1c2dZL01zdDIrLzdiSUlXM0ZERkhLdWNscERkSXYwQjh1c0Y0?=
 =?utf-8?B?LzJGVVVFMHhtNWt1TjdsK3FLam5IaExZNGtrQVowazcxamlLWWZSQ0NxZ0Ev?=
 =?utf-8?B?d3ZzSEwxM1h0dzFEYVZ0RXVuNXpGTjJYRVJTUVRxb2V3MzBpbEJ1SGtPRGQ2?=
 =?utf-8?B?bUpWanFUdmt2T2dJZnFubVo5dFNjd2krdm5zUUVSVzdVeGRSS0ZONG1IWTUx?=
 =?utf-8?B?NjBPaktBL25WZVBtQmpraFdqTlVMWkRuanZKdlBaRTZheWE4SjlOaFIxVkRq?=
 =?utf-8?B?eVZwWHJYdlF2OTM2bkYxZEdGVVBnMzlrZzY1RllQYVF3VFlHMUw1dkg1U21u?=
 =?utf-8?Q?FbE6Ty1aMlRT/Mu0Dh/dn5kS+k0TlZnm0QU0uiD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e6efb2-547a-4fbf-9d1b-08d96df82aa3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 09:58:09.5031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6hr0+DmeUmvzc+JGeiJIaE36fKiPh5ysl21b5bDg574qua2Zt6btjFVLPALOBW9ndsJHEQPKN3vgkP/FLBaliSI97lpksZslgQy7O14NEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4279
Received-SPF: pass client-ip=40.107.6.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

02.09.2021 12:40, Hanna Reitz wrote:
> The AbnormalShutdown exception class is not in qemu.machine, but in
> qemu.machine.machine.  (qemu.machine.AbnormalShutdown was enough for
> Python to find it in order to run this test, but pylint complains about
> it.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/tests/mirror-top-perms | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
> index 451a0666f8..2fc8dd66e0 100755
> --- a/tests/qemu-iotests/tests/mirror-top-perms
> +++ b/tests/qemu-iotests/tests/mirror-top-perms
> @@ -47,7 +47,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
>       def tearDown(self):
>           try:
>               self.vm.shutdown()
> -        except qemu.machine.AbnormalShutdown:
> +        except qemu.machine.machine.AbnormalShutdown:
>               pass
>   
>           if self.vm_b is not None:
> 

Hmm, interesting.. May be that bad that module has same name as subpackage?

Anyway, I don't care too much. Interesting how Python find it o_O.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

