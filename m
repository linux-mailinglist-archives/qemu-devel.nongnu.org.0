Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0030049F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:55:23 +0100 (CET)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wuI-0000LO-4m
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2wsP-0007l5-GH; Fri, 22 Jan 2021 08:53:25 -0500
Received: from mail-eopbgr10102.outbound.protection.outlook.com
 ([40.107.1.102]:28055 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2wsM-0006ue-QL; Fri, 22 Jan 2021 08:53:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dkxw6dxeklui4BNf6czgpKXWhR4jYkCdLQniSFJSSHslx/jqsLtzzcgZVzMHMAiwWgTlWpqvEQlDQlpii0BqWDlxiErVHzo6F7ug5bFiiLyDSqZ3fuvIWO3gnspTjJt9e+HqsMH/jZS/fSb47SZXzWf9OrC9ehotMx76fiUJsS+u3dfuTJ1k7F01NAO54YlM79eyzqRFSeWzihkO4N3gdr5BL9aHRO0KiTS0V5PethJ2WbSaFl8xCztuptvGKmHuqe7N+RenNhPwXo+urGRXJFbEuTTthegwDVaLeXpfS9HrFWavjiaC/hb3hZ+FRxkvz3qVcPdRdtf+G64LTYctKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/LkAwxucYESOVnf6T0gqhUMV1d0tzWt8VRDdR0u/CU=;
 b=HOC/LnlyE+wrGrVMOhF2kNFXgXGt2YCsqVhlt/uKdYQ75VkxPG77SC2sJojKfdQiHKiSGmTU+OxIHXlSi4A4xHHonOfZcCCmHQhlWHG92obA9huI7mx+F1NgfSEvmqVcbkpNZrXgY/AnhdtqFlrFVrREDwHG0L8yfYVxg19HqpcLYGZ8NwVAYfHD44WgXZkPqU/NG8Rb2lANLNQfyEQkt1fLcelouxFbhVVrIOB0nFGpLvJFUUfyMG+soExZ4BYe5JFFeuVVvUA64xJY0mGFfvRWVwEbNHrDQdLm7PZ+7Kr6u8Vb+iGGApUn1aBCCXg3chlyGfzhchvQbF1fjXLT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/LkAwxucYESOVnf6T0gqhUMV1d0tzWt8VRDdR0u/CU=;
 b=sDtjFBC2JPZUk9XMtzKZwMmp0knRriWmTxCqByAV9Oy+C7BbEETJ4VLwBSyinhtLF7zKNVar7A4nhq1mduuntwDSPhjvWa5a9pHbI/xZFY0ywXWQbDIsMCcvOd6aG5GOGIMAKK/eVM1p1n0+ktmmqCGRXZ63wek0UjqnFaSuLJ8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB2015.eurprd08.prod.outlook.com (2603:10a6:800:8b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 22 Jan
 2021 13:53:16 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 13:53:16 +0000
Subject: Re: [PATCH v7 10/11] iotests: rewrite check into python
To: qemu-block@nongnu.org
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-11-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7de3cb33-5912-4794-b981-45d7db1e00e7@virtuozzo.com>
Date: Fri, 22 Jan 2021 16:53:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210116134424.82867-11-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR10CA0019.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::29) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR10CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Fri, 22 Jan 2021 13:53:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99019521-dfc7-4031-577c-08d8bedd113f
X-MS-TrafficTypeDiagnostic: VI1PR0801MB2015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB20155699956C48D8719DFBE6C1A00@VI1PR0801MB2015.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PFIxG7tx9yX90Bn0UVTAIPLVW0J8E+t3AOqSYdFBPdXyqSTZB9U58/HPrICKeBp/niv5bf03wyvwUESt/6xw2DfFJnmxSuU5sPQF9nYiyEh5VQTjmxZjNh4IcFBQN/qJWRnKm6qnewsOgujKThPsZ6PRyLM0zHoStD9AWZiftHTdZEPGt+J3BQKyewyMgzx3YkHpebHjtAiXAFpZ00KRpzhMPIiEDdKu4s3bdbix38jvYHsDzrCLmm1nOZPY19n4OwoHFopzmaLwI4obY0FUGnSM3jWwmIvYmwq1C+VSi6K/RAqfQHfuqOr5HtEYJrZccayyOBu7gA5LgTkLl0EqMfmeL/REqqh7fLwQrTpDhi36lwVK/tFjDEf1KG3UNb19v+wiLYOj2SYEMhqCLqQe+L0RbZxVEaCdRqWbv5SrgA1uCZbtdAZemsPB0hr5z6DxTSFw/irdeXfA6zM3eNW9EnFUItNdI3N5HUVNNXcbUHs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39850400004)(136003)(376002)(396003)(956004)(2616005)(26005)(16526019)(4326008)(31696002)(8676002)(478600001)(8936002)(6486002)(6916009)(66946007)(52116002)(5660300002)(2906002)(66476007)(16576012)(66556008)(316002)(31686004)(186003)(36756003)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ODlNZWlQaGpIUHpYb003TE10NVEzNWZvcDQwY3dqNy90Z08vcG5RcHdHWWkz?=
 =?utf-8?B?bDU4ZFByem84dW5EdWRvL3UvNWt3TTFFc0tBSVJMVXcveWdkNkVZZlFoSWkv?=
 =?utf-8?B?TkU4MEcxK09pdXBDdjdINnJHbXE3U05yTDJ3VVE5eVdkMlBCUnU3dTR6UEVZ?=
 =?utf-8?B?elVnQmJHa2tVOW9ObytOQ21GeWdTeUpmeno1dkNxc255UXE2ZDNUODRxdHVV?=
 =?utf-8?B?ejNRL01xT3VRY0pwNGJ2WVU3SGxCcjZ4Z1hFdmRLaUJtQndvdDEvRitaNmVW?=
 =?utf-8?B?aVI1S21yN2txN3B6L2hpTkdDeWJkTk1yZXFIQzRSeXdYbFJMWWZ6SEk4Uy9k?=
 =?utf-8?B?c1RDTUhrdklQWWFsMHBCOFRoaC93aGdYNXMwcUs4bWhjRGNYWUsyQ0o3M0s3?=
 =?utf-8?B?YlI5YTVPT3RKQXlRVmk4WVVDU1pWcCtjcWpuYnZCT1piTkV6V1dpZkZsRTdo?=
 =?utf-8?B?M2JDaFRZMWpFK3JraDNkTUdwWHppQTRSVnN3SVlkMHVHVmV5S2gvSjlSalcr?=
 =?utf-8?B?YVg5TVh3VHFublBWaFRHVDBETjZHNDI5OUMrRzFIb0lxVzZQUTZtcW5SQmp4?=
 =?utf-8?B?ckg0NVdtTUZHREY1em1mMWtvVkRNdkxodDFhWWUrVUdFWll6ak1RQUxZZTlK?=
 =?utf-8?B?d3FwbmFGK0FyRHV3K01jVE8wSTUrRXJyRzFNM1lwM1hBRkI0ZDByZkV5cFZo?=
 =?utf-8?B?VGhIVjFkUXJoeGxtakNaa2V3a28zR3VIMlhVcFVMWCtMN1daZFlBVTNXYWdv?=
 =?utf-8?B?UXVkb0huWnRUdnV6UmptZE9jd0NIeksrV3RiUFNraWtBY3U3WVRRT2Y4S09u?=
 =?utf-8?B?NFpQSEhYYVhRNlZKMTJ3bXNqa0RSUHA5R2VPMTkrRVBXaytyTVY1T1VvUUky?=
 =?utf-8?B?NHF1Si90UjFrTWx6M2FzQ0I2dU5YZlk0SWJYR2RkWm54STBRbmJuL3Q5NktG?=
 =?utf-8?B?NmFyRVNNQzlkaFd0T3V1SDAxUzJZMVo0Q0F5dEhldVEyNHFtL05rcnBtVDMv?=
 =?utf-8?B?dWZBZ0dabWgxQTU2TWdWcm92ekFNU2Z4b2tSQ2lhQklVL2RQRzd0Rk5oYmRS?=
 =?utf-8?B?NWNDR3AyUXNNNFZDMGwwQmdpSmVUajA4Y0JNb04vdU01WC9SK0VNM0NnOHA2?=
 =?utf-8?B?cVVGdzFKZHdUSjFMTmZrellVN3dtMkNHT0xmcVJHNVBzMkxvSHcvNUtFT3hu?=
 =?utf-8?B?R3JZVjdEekVVa2w2V0RxWHBLL2lkVnovcFVBL3RuWFBTVmE1aGVnQlo5WGtP?=
 =?utf-8?B?bldCeEVqYXdhcWlta29UQ1BwUEZOcFAxSjlWTEwzNlhzR3lhUjVYRGJEZTNr?=
 =?utf-8?B?SCtKMThKZ2xuY2hyT1Z3YVBQbm9wc1M2WVRKZUVFeldzek1FOStWN0tjSFl0?=
 =?utf-8?B?aUxpeXRqcGx0K2lnMTFMV2FVdzZaWnRqRFdzUkJzMjhoQ1Q2ODZBMHR0QmNB?=
 =?utf-8?B?RVZRNkZwQitPQi9wLzl5UGgwaWxkWUlRbEVtb2lnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99019521-dfc7-4031-577c-08d8bedd113f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 13:53:16.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2FiERERYceFRM6GOYwS3ULr01wcC3ddDDBqaIalIoGKrWLEhzpyGviIr8hjKriImBceKLAcuu08BOVkqF02iSsG2BUR/Nbd9sFhJ6bnIDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2015
Received-SPF: pass client-ip=40.107.1.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_NONE=-0.0001,
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

16.01.2021 16:44, Vladimir Sementsov-Ogievskiy wrote:
> Just use classes introduced in previous three commits. Behavior
> difference is described in these three commits.
> 
> Drop group file, as it becomes unused.
> 
> Drop common.env: now check is in python, and for tests we use same
> python interpreter that runs the check itself. Use build environment
> PYTHON in check-block instead, to keep "make check" use the same
> python.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>


squash-in to support group.local:

@@ -117,6 +117,13 @@ if __name__ == '__main__':
      groups = args.groups.split(',') if args.groups else None
      x_groups = args.exlude_groups.split(',') if args.exclude_groups else None
  
+    group_local = os.path.join(env.source_iotests, 'group.local')
+    if os.path.isfile(group_local):
+        try:
+            testfinder.add_group_file(group_local)
+        except ValueError as e:
+            sys.exit(f"Filed to parse group file '{group_local}': {e}")
+
      try:
          tests = testfinder.find_tests(groups=groups, exclude_groups=x_groups,
                                        tests=args.tests,



-- 
Best regards,
Vladimir

