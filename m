Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F14934EE77
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:50:47 +0200 (CEST)
Received: from localhost ([::1]:46906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHZm-0003ad-AZ
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRHXB-0002Nl-B2; Tue, 30 Mar 2021 12:48:05 -0400
Received: from mail-eopbgr80139.outbound.protection.outlook.com
 ([40.107.8.139]:25622 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRHX9-0006yg-7h; Tue, 30 Mar 2021 12:48:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRLo0Hajt/icMiNe8pnjOFnlsnN+RfCDtWrhadBkTZFtRqiB63UnBon/RQ9MAGLzDW4jryvnwMKv3kz3nTf9qZkw7dAC3z1Jj8X0wjGKGBlSRda3DcXmS8WlddEtVXkSbBAWWKbI71w34TGAj83zfqzhxpodG6IaXa6iI9m155HPnH50efo0epMQ4r4fO7iRBV5LLV/CX6kxpl6HXrZOLmdcnvhOGstinenDVO7woRsLbIpZDQUpIfSzLzFCUbI46D1UhLaRNWsDX+CWWahJEUNcjxISqUYQdSok9s4rm1b3HWI67uBOzn6LPa0xl8lrFMdcMJvRcWAIQCTIcaRNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M/VVzCainz6UtxXjy3hKME+t6zNpCHKa8/jSJjpWxs=;
 b=gcfYEMJfd9rU3EFxZ1tT/93s/oQ/yO0mswbsVFOeEx3VP/53D9w6fg5FM94J7n1G1A3owavT6Fs/jsRabHSsY4kdWo72u6vN6ZTtaYfZjRwEsSL8APYh2fnoTbzcsvUxKReelgdrZmTRyJtVuI/dhYKWWTuixiVhfWRKs2fsPoKTjveoQVXoaI/HtpeiRo8VCcpEH7VizxhL0WXHwQSwFbBoo92lUN8oPV63CIgf5nKRYNJNh6I1NetY1UJm2RQRKZlbm1R+ywgJSyIgKIHogJbOfKx/rsuWoYc4R8F4a9MpECb4nXt5XkFKIWpDJpnRv1dtszIrvyDucakcNqWRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M/VVzCainz6UtxXjy3hKME+t6zNpCHKa8/jSJjpWxs=;
 b=X9IXVb+F47t1VFu0JokmtQNKkXq5z0EWVVFp9aJ1pp/5zlFi/AI/0oaz30eIVNgVmqRHD/XP8sJzRNwlv/ItIltjnxYlFqMTyATU+ox8mb0aZRNfV1UHyz8WI0xegyAgnrVlML7zxDfW5RTOn2aR69n5Djd7JSieKyfV8mlji3Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Tue, 30 Mar
 2021 16:48:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 16:48:00 +0000
Subject: Re: [PATCH 2/4] migrate-bitmaps-postcopy-test: Fix pylint warnings
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210329132632.68901-1-mreitz@redhat.com>
 <20210329132632.68901-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0f1f876b-e93c-4234-4c4c-3de19a3c577c@virtuozzo.com>
Date: Tue, 30 Mar 2021 19:47:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210329132632.68901-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM8P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM8P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 30 Mar 2021 16:47:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c159a383-d8ef-4a8b-0498-08d8f39b93e2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151E8161652816BD7791E2DC17D9@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0gung1HSuUPr2EF4PWibGsTrNKenpqaoay/NBlYEQPe25ZBx4IvOscjEh2j6FjnEhlvoTvy5UND6MnHPv44zoFtwqCnHsIH9S49u7f5L6LmH1O2JfnvrewMS+oC5mJW1GqEdVYx3T57Qa8dPVvHPTK9s4hMdnXlkac2Qzi6SINfVh9YxbNhAKwkJRuThSgMgfGazDfUkGjcbo2ckDOzLhW/y/VZNZNvaFnS+wPWKSGPcGsAyYve86FpkBfKz2XkdgRXBdMQlDJz3Hhfp/Y7o6NWW2nYcIo+zb9Xb4kSirZEd6hSVpagnrixkvhGnJRrlfOkuBJiI6G9r6ycoY06mW0mJcjs2P64vvrfQjNA7kAVdxI2zzJW7p4j9W62Oxsm3dd5wREaeGOcK4w5wBojLGf0dlgD1C34jb+RcrH1upbfaLQIzi6wE5rikSPW1CyJzq9EneBGXmu/hMAA76EUgTcHHa3IS8ScLz8pnpjLYntmyaDnePhAi4hzRYBLTjUM59OKyGI1hNoDLSBqGnNv5DxOLutxxO5B1prsRJ52aG6n9QyZzzNZ1YyRbx3CC1LU8/we3Rt2AesqPIGNobKKA/AmfgWe1Ky6R4baPKZkhfCEmZkJqAh14+/Oun5L/1+NxCec7Lmg81kS6xnR0SFZ4O3zqw0vf+r8T/IL1yq6ynDkDLWrPr6zF0pqqipRr8BPd3zSSOZkhQNe3VZ3UwuOYjRbEKjl917AMdk61U4S3+zA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39840400004)(66476007)(16526019)(16576012)(52116002)(316002)(38100700001)(66556008)(36756003)(66946007)(186003)(478600001)(2616005)(31696002)(6486002)(2906002)(31686004)(8936002)(86362001)(26005)(5660300002)(4326008)(956004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L3ZNcko4Y0xRUjRSenhzNWFwcUIrRDJKTmxxSG5ublYyU0ZJQUNpYlgyYVBi?=
 =?utf-8?B?ZGF6aUd0UlBGNXRKRXNrSTUwRm1XaUM0T1U5OHJJR1Z5YWgzODNWeWw4U0l3?=
 =?utf-8?B?SS9QakFZajRqeG5MM3Nra3NtQ1NTVUZwaTJ3TVk2NFhUbE5pL08xY3c3UVA3?=
 =?utf-8?B?WitVbVp3aUtUZElWVTdKTFdlSXBRMm5PVGloV2lCZUFaY0FVbWFKZUlITURx?=
 =?utf-8?B?SWRpRnkwZXprMlhQSkRsRGZtMElxQUxISFlXRGRkRTZGRy9nOWRHVG0xcUY1?=
 =?utf-8?B?UnM3ZzlhcjdMRmtveEVMdUZXMmkrRWNSVVkyRmRYQkp6cWVZM2dEK1RhUmZU?=
 =?utf-8?B?U2IvaWVndnZtZWtUcUsveVNKSm9UVUNWaTh1OGdrbXVVNkx5aFVWRmJCVjZy?=
 =?utf-8?B?MnNpT1pUWm9hNUcwSmJGekNOK3c1Vm5WMllmNE43YlVtZUs5ZnB3ODFMSmVy?=
 =?utf-8?B?RXYrRnFMbE13OHdZSmxYOUs4akp6NXB4VE4za2F0b2E4YXFuaWY3OERaWVZN?=
 =?utf-8?B?M2N4VjE3ZjR4Y0RMd1NDd0xON3YzZGpQQVZ0SHJqdnZ4UythcUx6V29MUHB4?=
 =?utf-8?B?T05jeWsxdjlIM3FCRVUrTGpOTUJiMTV1MEQxdGVoUDlkOTRyOWNvWWgxV3cr?=
 =?utf-8?B?bGE2TThVNTFJOTJOSG1HYkUvQjd6WmZYN1RhbzFibmVnR1oxYUpNWDlLNkhI?=
 =?utf-8?B?M0tST3hHNFNVVnhORUMydkdnRUlWZzBCeEhmY1V4ZWd3a3MvZ3hRRGNtWW9r?=
 =?utf-8?B?emlmLzBEN202bkR2THZFRVZqbzF0d0ZKMFd3NnEyR3VHRExuWmpSNEtPeC9h?=
 =?utf-8?B?YzZ0L3hTRm02a0loZVFiTnhzQVovSktpZzBkbkQxdHhwcVFBa0ZLVjZITFNl?=
 =?utf-8?B?L2c0bFFUaFFFTTByNkV3WjRHWCttSWxWcGVOdTg5S0w5Y0hNcllNMW92dllw?=
 =?utf-8?B?VzBZZzRNMCtEREx6K3ZQWndGS0paQVZ0c2JRaklLTkl0SjFhNlIxc0FCNHlC?=
 =?utf-8?B?MmxNaFRqSEN3TVk0Ty9Hd3NEaitQemFMbDg2Um4rVXV0NlEwejg4Q2g1cGQy?=
 =?utf-8?B?eHZNL2hYRFdVK1Q1aVBJc3ZiOUhTdHF0UFBBZk9OZ3I3Smh0MjhHa1hZYmJB?=
 =?utf-8?B?TU5KUzBSMGJyLzd3bW5KNmFQeTc4djFQUUY3Wk0rSmpwU0s4UFllUm93NEM3?=
 =?utf-8?B?WlRqU1BxQTNSeWpZN0daU0sxdE40dFdmN2xuYUR5NnQ2L3drcHlOelBIdEJx?=
 =?utf-8?B?VFdoNmNZc1liU2E5K01kdW01SXNQZ2piUzJiKzhxOFVZRnl3VUNiWXNFK1lm?=
 =?utf-8?B?Rjh0V00xWFZsT3c2aWZuMGZSODRaT0U0MmhUb3ltNXlZVmFnZ0xncVQ0QmdH?=
 =?utf-8?B?MTM0Y2VhWWR1SVhZQVF6OU5QZjZUUjJ4dWxZeVpQSlc1R25sS1MvdFZWUzFq?=
 =?utf-8?B?VzhnZHlvNFZNTFk5Q3RCbnJQWlNKcEJKdGMrQlNUaDZVekNrM2MzM21SRitI?=
 =?utf-8?B?MzhqcEtiNGI3NlVRNkxidXI0SlQ3OFhNZjBzS28xRkpiV1ZwNFk3WjlNbnJB?=
 =?utf-8?B?clpScVROV1RWV0NIR0piMytmNWp0U2ZxWGVNZWt1UEs0Zzk1eEoySEZoQVdN?=
 =?utf-8?B?S1JOVGd0K05Hd2R3amdSZWpta2hZTkJaMitLaXJLazRwb3ZCbit0d1BnajE4?=
 =?utf-8?B?aVhXeDRMcGFmcFduTFV4RVlxVEI0Z0wvMDQwUkJyL04vUWxSYnJQcjNRaWR2?=
 =?utf-8?Q?7cic10sekqkyKWBa0hj5FS/W02MQbYhgmr7sQCx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c159a383-d8ef-4a8b-0498-08d8f39b93e2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 16:48:00.0414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Jhepzl3f/Y20PeJa/1Yf+eZYpSsvMmzhwsTsxBuA6uO0L/9W5FyYQsURyIiWnh3KNpguIJPNY7dj+MdQOJlEcJf4kzxAgsiW7sK47unnrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.8.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

29.03.2021 16:26, Max Reitz wrote:
> pylint complains that discards1_sha256 and all_discards_sha256 are first
> set in non-__init__ methods.  Let's make it happy.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> index 584062b412..013e94fc39 100755
> --- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> +++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> @@ -76,6 +76,9 @@ def check_bitmaps(vm, count):
>   
>   
>   class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
> +    discards1_sha256 = None
> +    all_discards_sha256 = None
> +
>       def tearDown(self):
>           if debug:
>               self.vm_a_events += self.vm_a.get_qmp_events()
> 

I'd prefer not making them class-variables. I think initializing them in setUp should work (as a lot of other variables are initialized in setUp() and pylint doesn't complain). And better thing is return it together with event_resume from start_postcopy(), as actually it's a kind of result of the function.

-- 
Best regards,
Vladimir

