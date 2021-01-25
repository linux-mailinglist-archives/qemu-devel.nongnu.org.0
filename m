Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD383024FB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:35:00 +0100 (CET)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4159-0002c3-4w
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4132-0001cU-P3; Mon, 25 Jan 2021 07:32:50 -0500
Received: from mail-eopbgr80135.outbound.protection.outlook.com
 ([40.107.8.135]:21379 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4130-0003WA-Kf; Mon, 25 Jan 2021 07:32:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLvXKPyVnMbOa7CnocQjtoEAPArYKzx3dMpVza26UwuyyYt34OgY061gnqHd9ngfIHj/Q7J9Rvce4Wu2VFZeZWGqITsOnhR8v1vkkhOgh6w6h9Fl+ijaNXsL0XrFo45gc4yVKLEQa9weQTi4ZbnWLsR1mrpc7AP5b8Il26uM7Q+VlqIgLyl5AgSSEdFZ9cXkdA/qebDDpQWGbekl74KDC/lNuIJjLwALPjqOnZqTzZGxdm5PkFY1jLaIEQpz83o8n7LXp6G4JqoNTR5zQ/wHXZCaOiYh3dIWRHW2xqtawBKPtLTmz3Kk7tl2hf3eMDM4enEiWGFgrLOdnb8O45+MmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GY0cHSkKi4SM3iiqMWxhqr61OuOjSPUqVw9Yas5Ot1w=;
 b=F+Y3qXzPJ5RqaKtoKOf2wdEqhIXNd4tl3/v3DcL6yrkDEvUHozvXz9GRHm1h/lQP+jNCsYgqQg7JxfJRanuI3UlQkPHcYuFmmdS9esE0ikHADmO+5BTi3Ic9733hUKNmfSXE7NSH+SzP6YnpcZ2VRylJvlsA8xRy9IoSl4eXxZlWLyZmOLWSiX77ZGgkihOyGw0WApdC6A9Z+wMd0eA3HzN2Cjxw60q9P8iMsS+HaX4KJTSrTqDtpHZuQQbc8Ht5dOXqrS7/E5COkasj53bGbhuuF0CC0J7U+WoeHUlWP816RIa6liLECIwap+0ocFWnSh9yelVGGTfZhL5BrN0mfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GY0cHSkKi4SM3iiqMWxhqr61OuOjSPUqVw9Yas5Ot1w=;
 b=vxzW2XbUak43iMqdbkZJIP4pWsQZ6YmHgIhV+1tRGhFmorSaA4xCIeYd2myNcL1UoHYpKr78xWACFZNixqrSpH6DwzMY+ObJVNpn7OsPXd5g09qAtuXXTlWuQvIG0VZzdvs0fEeYcKSLsfg0Pfpcirx30Al5ZYFDBHaUgyaIouY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5029.eurprd08.prod.outlook.com (2603:10a6:20b:e7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Mon, 25 Jan
 2021 12:32:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 12:32:43 +0000
Subject: Re: [PATCH v8 2/5] iotests: add testenv.py
To: qemu-block@nongnu.org
References: <20210123210428.27220-1-vsementsov@virtuozzo.com>
 <20210123210428.27220-3-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d219a99f-ca1c-6bb3-4723-fab27d96ce3c@virtuozzo.com>
Date: Mon, 25 Jan 2021 15:32:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210123210428.27220-3-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.113]
X-ClientProxiedBy: AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.113) by
 AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend
 Transport; Mon, 25 Jan 2021 12:32:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d333045f-fe53-4279-7c82-08d8c12d4ff5
X-MS-TrafficTypeDiagnostic: AM6PR08MB5029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5029882B89016AE4353777C3C1BD0@AM6PR08MB5029.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8M/Y8snXajZHYtEtWlbVhkX0rWeYjB9CYV+VqDJPR9k0vjvl5suzrXzKdnF1urcPG4VEIzx0PTjJiT9W/tNi4gIBnKxeEu2dPd8e1Zqs203gPSSTGT2Xb1i8bS5hH7RD1Q35ubAvHvEeNuYeDygVGXI4dJhlegQ0LkMgBfLZVsFiuYYvgluzrw5poF+eGHJL4b9B8tqQ6vdeg6JKjnWnmQQR8Zytm5gx2aAtQxAyPXS9JHEGzcmpQSNNevMuzLvf1VocnHpuuapSZmOXcplvinDrP0vsizWleTJiFm6qT8XIIA+99AVTn0FgXT2twPWp7WuvAGrfzLm0e6ZpcD75Yjz0N838rTcuYgm7uZehsL+nmBP8AVQ1XFyoX+tpCPkD7XiyAxEc2sfXzqoNBT7d5F73AuK8VxlSqFgkuzq/sK4g+3EuOUIshZ3hMbUIiJao8/jWdO00tdE1P7fxJGYEhGaSHZ+H3yQyqCWREyNwD6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39850400004)(2906002)(16576012)(316002)(6916009)(86362001)(6486002)(8936002)(66946007)(956004)(2616005)(16526019)(26005)(5660300002)(66476007)(186003)(31686004)(83380400001)(31696002)(52116002)(4326008)(36756003)(66556008)(478600001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVg4SVV1UkVyRU9oQTB2eHpwUEVMcEx3eC9ZM0swd0VnWlhIaTJRaWNaaVI2?=
 =?utf-8?B?STBoYTNvUDJhYXpNOTNIeVAvbWI3MFg0VmpXSWhYeUpMRXltS09UbU92WUha?=
 =?utf-8?B?MVE2cnNTVGFFOW1zbWhoUVlKVTBSWlhYZUxwVWFneU1QMm82UXd6YXZUcGxj?=
 =?utf-8?B?RnVoemZtdzRNQmlBMy85aTU3OWZMb3dXYTZabGNrMG5OWlFoTXFqY0JPZTZH?=
 =?utf-8?B?V3hkMjlHa0RVb0lHYXk0aVBGK1J3V3p3TCt3YzVON1BuK1NEamQwUnZINmZ0?=
 =?utf-8?B?M0NRNVFIQTJqcTEwV1Q5SnJDWjBXWkZqUmRkQmw4Y0VqeUZsTFUwUHV3Wm85?=
 =?utf-8?B?Nm15bE1VaWt4N085cFAvZldZL05MQUxud3lMRG8yRkNvQVJHSFBPeDdYSHha?=
 =?utf-8?B?amtkaUsyN0pNRDFxYk9zb2xXYVRkaksxOFNGbkNCUE9vbU5ZQmoxZ1BySXZq?=
 =?utf-8?B?MnFlWTNjMlJHY2tmdG9IUmIxU1N3eXpqSmNITXJET2tTUVZMeEsrVDRaN29q?=
 =?utf-8?B?Tnp2MDBPVmpNSEo1SDUwY21LYVlIRFd3aFdaSmtuT2poSzhqU0F2aUpoTkh2?=
 =?utf-8?B?TlFjUDF4dVZDcnAwKzdMekdrR3F0dVloamROc3hGRkhzcDNMZ2JIcjNMQlNa?=
 =?utf-8?B?T2NxRVdick4xSjJBbHlNL2JQWWFucVh5WGRFTGRpUkMyZmpqa2J0TWh6dVpx?=
 =?utf-8?B?TmRFU2htZDg5U1I3dG9LeXhtMGh5MlRVQ0lNVmxSV0RqQ3J6TG1uNjlMQUEw?=
 =?utf-8?B?NlZVVlBRSnlON2p2Q2Y1ZGlsa1ZtQjBzdk5kcDA3TUhhY2RVSFBHZHcwV3FM?=
 =?utf-8?B?bjMvdkxzTnZXRXlmUi9BcmRVZlp4M2dTQTdUY0k1a1paWWlwQ2RjamIwQ0Zl?=
 =?utf-8?B?SjNjdDNiWDRTOERrdzhSUmVIYzgwcFljTnp6SmNOL0YycVV4eENXbXhLMXhv?=
 =?utf-8?B?cWVaUm9VZHBMeVp1YXB4Um5KNHhXSG5SYjUwZjA2cW1XUStoOG5KdmRFQ015?=
 =?utf-8?B?UWZ0NE9CZ2JhbzdvOUNFaUtkUDhVYzk0MGJuMHVvL3NEdlBDaFQyc3kwMDRt?=
 =?utf-8?B?Q1RmR1h2UmsvdElNSE1tTnE1Tm1tOXhZRE5JQXVCSFNoc05HRUpBR1ZxOVhs?=
 =?utf-8?B?djVRcVN0RmhGS0xOa2RBcVh6cERNMGtQaFozVGxvQXR1M2NDZmljVjdkSnFR?=
 =?utf-8?B?QlM1NEdkcVpUNGtQOTFuSVJYRnJaWVpiNTJ0L1QvZDROMXhyZVE3dmozdDA2?=
 =?utf-8?B?YlhIM2FCSmVZVDZ1WXcxY1FLbXYvZjV1OTB5aS9kN29JSEdsbSs0Mm4ySnBM?=
 =?utf-8?B?YW5oVWJ4ZWJDZ3ozTE1FeUJTNUNwMVJVanQ4K2ZPTktjUUJmWXpwbklOMXda?=
 =?utf-8?B?eTl0R3BwRGVPdWpRdnhMMm1ZUFpwaXBuMGpmblNLakVJd1NKMVBsbm9Dck9B?=
 =?utf-8?Q?JLvNvTMd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d333045f-fe53-4279-7c82-08d8c12d4ff5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:32:43.3307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvjqQjJHNUOpJKC8uJB2VPbYzMdzDDhkVOrZzYx83MbrymwAmWXbHKfwpZI1ZYvkZa8y1Xzq4Jy5wODvA3MOS49QU0hBSYX9ErXbC1ci5Qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5029
Received-SPF: pass client-ip=40.107.8.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

24.01.2021 00:04, Vladimir Sementsov-Ogievskiy wrote:
> Add TestEnv class, which will handle test environment in a new python
> iotests running framework.
> 
> Don't add compat=1.1 for qcow2 IMGOPTS, as v3 is default anyway.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/testenv.py | 278 ++++++++++++++++++++++++++++++++++
>   1 file changed, 278 insertions(+)
>   create mode 100644 tests/qemu-iotests/testenv.py
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> new file mode 100644
> index 0000000000..348af593e9

[..]

> +    def init_binaries(self):
> +        """Init binary path variables:
> +             PYTHON (for bash tests)
> +             QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
> +             SOCKET_SCM_HELPER
> +        """
> +        self.python = sys.executable
> +
> +        def root(*names):
> +            return os.path.join(self.build_root, *names)
> +
> +        arch = os.uname().machine
> +        if 'ppc64' in arch:
> +            arch = 'ppc64'
> +
> +        self.qemu_prog = os.getenv('QEMU_PROG', root(f'qemu-system-{arch}'))
> +        if not os.path.exists(self.qemu_prog):
> +            pattern = root('qemu-system-*')
> +            progs = glob.glob(pattern)
> +            if not progs:
> +                sys.exit(f"Not found any Qemu binary by pattern '{pattern}'")
> +            if len(progs) > 1:
> +                progs_list = ', '.join(progs)
> +                sys.exit(f"Several non '{arch}' qemu binaries found: "
> +                         f"{progs_list}, please set QEMU_PROG environment "
> +                         "variable")
> +            self.qemu_prog = progs[0]


squash-in:

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 348af593e9..1633510caf 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -129,14 +129,14 @@ class TestEnv(AbstractContextManager['TestEnv']):
          if not os.path.exists(self.qemu_prog):
              pattern = root('qemu-system-*')
              progs = glob.glob(pattern)
-            if not progs:
-                sys.exit(f"Not found any Qemu binary by pattern '{pattern}'")
-            if len(progs) > 1:
-                progs_list = ', '.join(progs)
-                sys.exit(f"Several non '{arch}' qemu binaries found: "
-                         f"{progs_list}, please set QEMU_PROG environment "
-                         "variable")
-            self.qemu_prog = progs[0]
+            found = False
+            for p in progs:
+                if os.access(p, os.X_OK):
+                    self.qemu_prog = p
+                    found = True
+            if not found:
+                sys.exit("Not found any Qemu executable binary by pattern "
+                         f"'{pattern}'")


-- 
Best regards,
Vladimir

