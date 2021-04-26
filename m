Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79836B2EB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:18:57 +0200 (CEST)
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb0CW-00083G-Gi
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lb08t-00078x-Lk; Mon, 26 Apr 2021 08:15:13 -0400
Received: from mail-eopbgr40117.outbound.protection.outlook.com
 ([40.107.4.117]:37557 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lb08o-0005rA-Rp; Mon, 26 Apr 2021 08:15:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uuhppm/l3hlR4m9+OgjBUGPe2Thk283jVcpYm1wLDurOphsCnV052XPT8/yEhaAnK6NWuYGEqA8nlppNQ0WvW4E/q+1nnzs2XW5sML4qq6CRizfVlKQuEp/gGT+arwwn0EPUwjpaTtWiECA7ddU1KHOIKsyQGx89eGZOfAx49TIzDE1eH0L5dfs51GXZKj1njmWejG4WgSbYHd/oRijLcO/yDQwPVcRXAHSzVs0Mp6uc/5LlkmJ9zF6EGNJ7PONNL4MxHuE2hfjlCdgEGxegzpwzNkBxl90qx6NXL2WpfRivMjKayCCRIOeW9wwJiWbWbLCMbNjN4rcU5RZFCXSHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4U09bqhBxdXLJLJ3LmQjceIQQ5FZpDTWeFAmHWJfWR4=;
 b=IUB5v8hZnrrV9tCejDrp9AkjDcEbBt9e7AVF8JbcSeG77wfphyWn+SETjAd16H3fahl30OeukaqXbhRbnoLaVFkZ1lcaw4J24Qq+wDbHfPwqjDG8K/Xqkj9r1f0QKw3ZNZz8cRrz9wEYsYvMH4AbxHRYH+U1oz6d3qZmVXNLFEnWN3O02rtM+KWD7QhBykTRWXsDqAUjCZGXR+vv45zh9InDA3N/+ZTTnxW7MzD9MpEcRT8rqdEG9ke5nalR4TJJn5dttlWpoAzkY8ClhSiFwo1O558JCUKG8VDW0UFng4H0mMuWUGdDy6+jcC2f5ahskWo+mY7vP9Rfa3c5xsFbYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4U09bqhBxdXLJLJ3LmQjceIQQ5FZpDTWeFAmHWJfWR4=;
 b=wj9QUJ1bxn70GHZMG6UaTAUHBIEEZvmYQjh11USB4H0TgV7VQtKL3o3MFhDsMAlZye3ABRCHmpIDigH99OBmOEH/1gz6kThNjtihsJ6bW6EWcz6WC4dkL/a2y1EPcGJl85tj+++kY3pPby07hoL/DIT3nk6V0QyRM7Ncfe8jmWg=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 12:15:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 12:15:03 +0000
Subject: Re: [PATCH v6 00/12] qcow2: fix parallel rewrite and discard
 (lockless)
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2514921e-e423-6def-dfdc-93df9d80e41a@virtuozzo.com>
Date: Mon, 26 Apr 2021 15:15:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.16 via Frontend Transport; Mon, 26 Apr 2021 12:15:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10cadd51-327f-4022-979f-08d908acebd4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4536F0048AC579389DF21945C1429@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hkocSudKW8joYSEOCLDN4jmiF8KNb/r1zPu7ZP3c2J2xFSpuhVp6tD8WK7DP2zLJYmw4UJdqgLSfBGhVHuhOlAf5Vr5nPsrJNjpEgR+lYAsXK+wXlkIikDQp39jHWF7l9pfBEnkSC62mso5uoqW0NmuX9iU5VQTBilN5r1wOpq7qmx9tBKdhmkf0QJziSxSnEhO3ejpBv349hs4nlqFv2V251lZ67NPgWtGoEXKKkC7FhumeVe7870G/bVtX7Yc3KkTne6hYI51tVeXQN6f6bTVLupTFaKqRpuMpNLc5DjdZtyc13f2kN7NQ9NaKvvelENk9Yad3S9h4qFMNKiFCH0ZKVVcPiisaRZ3YALo5wCC83Txp2Gtz0chkS3nfZKiXa54imQ65ChuE0uENdl1haAfxahMdLK929u5mvjUkANKYVcCro23VYUzhvTBnnVvwq1KcdUdgpk/Ul6WoK3qrSdukRPO1HLUgk2kvhF4FOsvuFrdU/EVAdRuJwCoSV1yf6mhYit+6m9i+ZiVnF+GDRYXazXV2LRTkEBz7RpGkgjM6ElXWvZcM4uUxZ3KshPTOi2HSTzQP18hYwTu8XC60VOjvojVQemZOnNA28i/jXHy4gy76VixKG5D/48kLHP3MLw6uhZTs2IPZ1reu9GxEIrXrbaWQIXBG4hZIrvl57GPiWmqS/xb/UEFGL7XBqA0ZQlH5oZAfnf+F37IW8luGpc2GF+5qk5Ywob1xAoi1e7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(39840400004)(136003)(16576012)(478600001)(31686004)(66476007)(66556008)(38100700002)(186003)(66946007)(38350700002)(52116002)(5660300002)(2906002)(16526019)(316002)(4744005)(107886003)(86362001)(2616005)(36756003)(31696002)(83380400001)(956004)(8936002)(6486002)(4326008)(8676002)(26005)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RW1kVFBES0JGdWRyZWNuMndtVmVtdmpWY1V0dzNRZnAyNjYvMXA2MENXY0kr?=
 =?utf-8?B?YkYvQUU5bFkwNnQ5L21hSGRuY3pXdTdkYjZ5NWNzZTNSNVVna0xicUU3MlRu?=
 =?utf-8?B?U3g0a1lKeUxrK2lNc0F6TUlhRDNpNmUxWGJiRHhUM3V5cjNxMnpmdXlDd1hM?=
 =?utf-8?B?MDBuTUFVanUxWlpmRU1wUklOUEw5czNWSjBkODViN0NoUjdhWXpSUWxOR2dL?=
 =?utf-8?B?MVFWUUNDVFk2TmYzSHl2ckV4cExIRWQzREl4S1ArUXFpQWVCUmZUNklmcEpj?=
 =?utf-8?B?akMvV05UZEhFTUQ4K0pkUU1LckxuT3RPem1LL0VzVFp2Zng0cW5qSHdTTGIz?=
 =?utf-8?B?WGNYUHhnZWJ6NHhhQkEwOU1VL1E0Nnc5Wm1RQlNZWDdLRGZVaCt6WkxSb3ZF?=
 =?utf-8?B?Zlc0cmNHSGZHVVNKZjZPN09vVU1lUmI4YXdlWkNadTlYeE1KSVVWRGZDNjJs?=
 =?utf-8?B?L2JOVUIwOXFPSWtUZVdyL0diMmRDQXJVZm02YytBbHRlN0thZkJmMlVrWitz?=
 =?utf-8?B?bCtHcGJmcXVaeWFuQ2tXWmU3VzFPYm5sUjdmRFhnalZVRlFZNVd3a045cmpU?=
 =?utf-8?B?L0RBZnd0R3VlSzc5VWRuRTNDQldLak9QcDFBKytkdW9LbXpmU3JncmhKdm8x?=
 =?utf-8?B?RnYxLzliU2o5ZllHbkZtKzgxZWxwV0t6Zzk5d0hBOEZSUmJHSFk4UVNNZjdT?=
 =?utf-8?B?NVF6ckhKRTJack5PdFNxaDdhbTZMKy9uT1JNT3M4ZWRCQ1VBKzVVc3RiZkx4?=
 =?utf-8?B?YVBOT09wUXFvKzlFUERJK0NETzAzS3FxMGFLQ3NWaWdiVUQwZjNuWjdTVHpu?=
 =?utf-8?B?eFYwUy9PZ2RETzBHUEZYbmpDWklZZHQ4a0htdXA4S0dPT2pVMUFhcGpzQ0xl?=
 =?utf-8?B?US9oVUQyYkNNMG05bzVIR1ROUENoa1k1YXFmbjZyazgwaUhWTTh3c1dSWisr?=
 =?utf-8?B?TUEwN3JQT1gxLytPeGZzTjFlRHZLMDJTWnRhcHBCOUR3c1VJWWlaSzdFVlhK?=
 =?utf-8?B?ZWdySHJEbkUxZmJQZkZvbzBjc0duTHJlTEw4blhpWVdRZFFmRklyU21GVzhh?=
 =?utf-8?B?ZnZSWGNCa0xyMWpIbnVHOWIzcHRucmRxVUx6ZkFmaXVEMFpPQ0N5bFNqcW44?=
 =?utf-8?B?OGtIdW5qZ0tST0U2M05oOWpuZFpmdDgyNjhuUGI4bEF3aTBqUkUwQTNLam5t?=
 =?utf-8?B?cFhoVHk2YnljZzBIWDJuaDFYRmVSanBkeXN5UmJjMFdXczd4Rkl3dmFHNFR2?=
 =?utf-8?B?UTM1OS82Z2lnRWlzalcwS0FoaFhmNmZIQzk5bU5UUnRBdjhYc1R2RkhBMjF1?=
 =?utf-8?B?eXNyeHg0b2V6cXIxd0tXYS82SGJ6MmlxMk54MEllQ1BTbUkzZ2VOV05VdzFK?=
 =?utf-8?B?RXg2WlhYYkJzN3ROV0xBcDR0WXMzTnNpbjB3bk9HbDM4Y1VUWUFGRDhlTTNO?=
 =?utf-8?B?VDluZ3MwZjZVYWFOUCtQZCt3MWZKd0kwc3JVWFljK3FMeVpkM1lPZVhxOURs?=
 =?utf-8?B?TEh0RDJCYmdVMmFuS2p1bktMeUNJL3ZyeFpzMzU3Vk8rbFdjZEpGNkpoNjhR?=
 =?utf-8?B?dVBXNGN4ZFZuOURVOUhGdnJWNFB3WUNsbmNMV1dnSTE2U3RXQm9LeE5QT0lT?=
 =?utf-8?B?dlQ3TFQyYWVqODZjOTl3UEtjUmYxaGlmZXA3cHVmNmNiSXM1c3ZtRjluU2VH?=
 =?utf-8?B?K3NBOUxsYUNubFIzeGYyQnF5V0tOT2tDbWFEdE1oSzF0Z1MvK25oTlk5V1Qv?=
 =?utf-8?Q?uix0Sif9MUY341uqTBXQJuw6L7Bnp7/57QRJqX+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cadd51-327f-4022-979f-08d908acebd4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 12:15:03.5607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VuyI50+MYB6oYvYbVBn1EqmmBTFOUlZisZvbITX8uUtYaSLwf63aUEBkHpOugdVezbJXMIhVmHMkGfvVSiRGnt9Euotsp34xkkkHTKIoa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.4.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

22.04.2021 19:30, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> It's an alternative lock-less solution to
>    [PATCH v4 0/3] qcow2: fix parallel rewrite and discard (rw-lock)
> 
> In v6 a lot of things are rewritten.
> 
> What is changed:
> 
> 1. rename the feature to host_range_refcnt, move it to separate file
> 2. better naming for everything (I hope)
> 3. cover reads, not only writes
> 4. do "ref" in qcow2_get_host_offset(), qcow2_alloc_host_offset(),
>      qcow2_alloc_compressed_cluster_offset().
>     and callers do "unref" appropriately.
> 


About performance. With these series we do extra allocations and hash-map operations.. Still testing by

./build/qemu-img bench -c 1000000 -s 4K --image-opts driver=null-co,size=5G

and

./build/qemu-img bench -c 1000000 -s 4K -w --image-opts driver=null-co,size=5G

I see difference less than 1%.


-- 
Best regards,
Vladimir

