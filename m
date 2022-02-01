Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24A04A6051
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:42:57 +0100 (CET)
Received: from localhost ([::1]:39576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvIz-0006MC-3i
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:42:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEuJ1-0001Zs-CU; Tue, 01 Feb 2022 09:38:55 -0500
Received: from mail-eopbgr70100.outbound.protection.outlook.com
 ([40.107.7.100]:55071 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEuIw-00011U-8j; Tue, 01 Feb 2022 09:38:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkqKip+Hce5lvOqI60CXTHi/3D1M2y2jlmPKn0NYnowDMKBInhgy9bFXTYlUlJIQiP3jNGW2lSnOhKwwoYOPKOKDpquC+J3JDREL/FSd45wvsCsyL7D8NXKeuBmnECio2+SYHCUEp9DwTGQfgMsx476OBgwpYoknrxpk7fXOFja5MfH8FG2gpLHvdDq3s/cllqVW7kgMhTdDyRfXGLWX4NMJYZkrkUDm6zgp/QCoKT7uGRCKvUgmA7jlL+m0z2gLFrQmpK8qVHs3A8iOTyF5qk9S+T++s2T/r3UE+lfVvCcJnJrY+kO6jik2rtOk0oUPWwPJdZKPKHRQK1C/6bklwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugJ4que079HFntZfPTrafMC9bSrPRvQAbPhPiCBZfpo=;
 b=B6pkzlhBI9JukBLr5i9TEZDAZ+2uk8vwDlLB4aA+RM+svyVnGTWrHowgWuT5/nXNrUFDoVNS8YOH0fpa4aV0qaTKgfp6DH8jTdh1Dllbw/Ffx05EsUUfuxA6+ERNwub+n7dXoTzcyBCV8bYR29Jac2kRXl+ts2D2Cgx7icPeZvPzJFyqlrYrvZFCh+cRkHsQL62VZcXOeME+gvK0f2wQ2NAFn4PYIa+kiVcBWIBNgCnf2aJqRHusK2e+nTi4O1h1bDu+yOyCxzuYngZo6sgYy4oD9sGDN8e9rsjFPU7rHneTjlqWzSCwInuffwZr+Yajb3JR3UpFv/heGvkrY8L6WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugJ4que079HFntZfPTrafMC9bSrPRvQAbPhPiCBZfpo=;
 b=naPzoPfT/mEzTC/4uW+FkzNaAs0Z6bGloxp5DTW7eqZjwpnsl+yTSnfGNzlC5W6yU4uELII401XwcN81Ru1hLQ16xvwijAGZsz9VZS183dtPqLhv4ZV9wcalkZf+eltLa0S3dzSyFpqXl0YrUUK3jvCEulGnlYcEUGDDsr/KurI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PA4PR08MB5933.eurprd08.prod.outlook.com (2603:10a6:102:f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 13:49:19 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 13:49:19 +0000
Message-ID: <cf26fa98-28a6-26fa-8f32-8d86a4f22e2b@virtuozzo.com>
Date: Tue, 1 Feb 2022 16:49:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] qemu-img: Unify [-b [-F]] documentation
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
References: <20220131135908.32393-1-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220131135908.32393-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec80bd96-967b-4e2f-0c69-08d9e589a4e0
X-MS-TrafficTypeDiagnostic: PA4PR08MB5933:EE_
X-Microsoft-Antispam-PRVS: <PA4PR08MB5933132B3222FF9C559281C7C1269@PA4PR08MB5933.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8NdM0ntGBxSTfeHrr8iU3ZtREVh+jea4Au1uMPPfuoS11y9XXG29aqy0PNup62KBe2mZdnuJneldDLXlaaT328i+UpAQBHueBpCZFhFsdZEZ5jswSMHjk06EOMvjSi3b4v/tdnt+ZAgqUQ0PyA7PTijt143q32FLIixyCTO7xQmpWJTXH0CM/UAbx9yrKg/j0IrjjU8M2qj7+vNEAN5khQGTEGdQslKC1TzSH85Y7uUqx0vIZFX1l8hJja62dxs+48l7oGq6vp7gGpEY5yl+wpsdFbca69B80dTK7i6fsjBZRVwywE1U/ONgD5GqGE5B7SAVqeOosZtsfRjFkEjjH1oFZn6kSfbZDyuWQAz+fbWrscBwJ/HSyGtTGSTwZH1NGjxADZy+8uZ16P/SWvb3jTpT8y7E61ISGkXBGwfxR/MR0ct2ET9l2riwkBxtTfWkrjRCMQu6AwaOM9rw6kbK7Vz5NMH4fkzMfXqBKS4NEiq0lSExYt7PeowjFHSC4KEVGyyfC0OpmHx6cEtwdBUQbzpoSLiR/JZi46wrNn7xNRWoCuyDOJiSC3B4tX3D0j/C+B//1kLhbtemhph6NLfLDY9GmBPeFOBaPvGbS3PzW5rnHdI/GjYlWrwKSiMnveGTDTn3gAHOsWp9oB8xSDGGGZi5/EKZDEYXat/cWfUw9apxukhCDJVPdhQyjncw5sSXJrgQ40VxQiIDkfkFqSq94V+5n9TTcW8DKQ1rgwHQrVUZ7COZE8NdwWwUdZrj0OYs1JUYly/FP/vjLxpC+NHrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(31686004)(83380400001)(5660300002)(36756003)(66556008)(316002)(66476007)(66946007)(8676002)(54906003)(86362001)(8936002)(6486002)(52116002)(26005)(186003)(2616005)(6666004)(508600001)(31696002)(38100700002)(38350700002)(2906002)(6506007)(6512007)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZnd3E4dEVaVS9WZjByTXFDRVhsNUJLWDBESk5BaHNVYjVsMlNpN1dVS3RT?=
 =?utf-8?B?Yys3dzRqZ2lGTWNPZ1BEaTd5cTBNNzUwaU96NkFJcHhINVRCU0h5Ykdaem5p?=
 =?utf-8?B?UWVRcGhVNDhscGd0TjVMRjF5UzVNRUJ2Ym9KSDNZeHJzQzl5Z2Fvc1UvaWRq?=
 =?utf-8?B?cnI2L2ZyN0piL1F1NWJ0eWhxcVNDWVdiSDF5NG54VlhaLzZBVjNja1VZdWQw?=
 =?utf-8?B?SnF0T3dWYXNNSmptdFF0QzdVcnczVVhpTE1waWE1L3JPdjVXRE5pbUN1U1cr?=
 =?utf-8?B?eGZOVVJVN2xuVkR0MFhzUnRjVGNMMVU3Q216cmtBQThVcWVEblk2aTExQXFN?=
 =?utf-8?B?YjVJNEJoUFZ1N2lWQ3BMVDIvWGVrcTZGODhRMkRpV0sxcjlRVllzTStUN1Iz?=
 =?utf-8?B?RGtlSzdKUjdjR2dCc3N0MysrSVNJOXc0WHdsK25kMEY0RHRjQWFyZEZwQkZL?=
 =?utf-8?B?cXpHb3Z0ZEgwbnFmUkhFNDB0TWtRNHFYdSsreWU3RmlWYVlENnJsNjB5OVlZ?=
 =?utf-8?B?UU5wL2kwczh5SlU2TVpOVDdVYU9ZSnlqdG9QTTFVeERRUXBSSGlOYWhBYVox?=
 =?utf-8?B?NXhYY1JCZjc2WmxiNnpibWJ2VEFTWjdZcTg5TEJmYjhSNFBlN09DODlnRjlr?=
 =?utf-8?B?SENJV1Y2QkIwR3pMc0ZYSHVJN1NNNUk0aW9ZU2c2WW45UmRZMTJSbjBuWWxD?=
 =?utf-8?B?eDdzazROOTFteWx4QXdNWktuc0xxVGlvblNHeDR6TUd4U3hyd2lEWDNvQlBq?=
 =?utf-8?B?cGFBbWN6WTdmNXhDOHZ1c2lyMXpuRE5hd1U2Q0FxRHVCS0lWOHJuVjl2QWt2?=
 =?utf-8?B?V2hjRlBpR3RSYjd2eGRNOHpheEE2QnlHcERSUnlZZXZ5MElNUDZnUzBrRGEx?=
 =?utf-8?B?eEIvODlhT1FaVWg1YVpoN0ZNdDM1ak93eC9veGgxak5wOHA2RVJiSTFhNCtj?=
 =?utf-8?B?NzcwSE5aS2d3QjJicW9ScEdHRVM1TzVhYzFpQXh0c0x4UE1UaS9VVFN4TFls?=
 =?utf-8?B?VzMyQnRiSHUzaUFVZTM5VFVjL21EMUZlQUozL3JoaXZ5SmVlcUZzd3RKZVNS?=
 =?utf-8?B?bnoySDh6a3c0QkRSMldHNW8xYWRMOVovVDh4TWFFSnE1SDJzOXRNendRWXBI?=
 =?utf-8?B?bHdMbjV2TUl1WlFVVEJMc040WE42eDY0YWRVY3I2RVVVY0hyWUpoR25DcFdk?=
 =?utf-8?B?eG9mcyt2VGV4aTl6Z0ExeGVNWDI2QVdnL0pFbkVZNkxSWFJPeDJVUkQ2VmJF?=
 =?utf-8?B?U1ljRVVpSkg0elJrM2ljTUtCWGc4UFdqTEwxSFZ4SlJ4b05QZGRab2NQcjg0?=
 =?utf-8?B?RTcyL2pFNklYUVRpQmNLcEV4S1E4clhPSG9QSnZtS3ZVcldWRGN4bFN3RVZB?=
 =?utf-8?B?NE9lQUZYa2Eyb1NsU2phSXdEYjAyL2MyWkZDb214ZlovOGIwRk9mcTdma2lw?=
 =?utf-8?B?RUp6TEZwRFpMK2VkMUg4R21YaWhuTkxxZEk0ZHR6NGNGS2lBYyt1N2F3MHZa?=
 =?utf-8?B?a3ozaGJCTld2RWVSa2ZBa0hDeThCM2d4OHRTeEU4Qlp6K1BQM1RjL0NBNkhu?=
 =?utf-8?B?K1YwMlhnNUN5S2N5eTcyMEVkSC9YMTZrQUhtQktjaWRpbUxud25DekU4d0la?=
 =?utf-8?B?YzA1bFlVV2JUMUxIVU1tazU4ZW1FWE9VTEdLanpGaEsrUVZxTm13em56MjFO?=
 =?utf-8?B?SVhGU3pDbWFzNUhwQTcraWM1QzEwZ0o0UUlmUjNjOU5Wd21kbWtIUFB1Rmhu?=
 =?utf-8?B?UFV3UEp0K2VTMVFZdks2aUdsQlJpeW9mV212aWEyS3BVdjgxSGYvNUVHUjky?=
 =?utf-8?B?SVUwL25WT0F1VTA0enNGdnE5Nk1VeFBMM1BOM0tobUtlQVFWOEExcDFQcXZI?=
 =?utf-8?B?NVdPV2RNMmZWdG4zOHJCQVVxSkFYQ1JnQ1o2TFR2cG5KcWNTZnFYdFBCUlZG?=
 =?utf-8?B?V2M0SEpKWDI5VFVzYVo3M2tMbjhBNS9xS1VoVks5bTMwYkZBT1BxMUpQUDlz?=
 =?utf-8?B?WHJyWCtLVUJDbjJFcmN1ZDN1UzVhRmdPeXBLTko5b2w1RFI2MCtrNXgyeWRm?=
 =?utf-8?B?TnJWT1BaaG43dG90WmgzZzFKZVFiY2hWeU1kQVNLQmVlc3ROaHlnd1RIYk85?=
 =?utf-8?B?SzJZOGNOOXFkWVI4Sml5Rm5vc0dMK3ZlU1lXTDd0eGhHbWt4WUJlQ3pnbUsw?=
 =?utf-8?B?YU5KaFI2eWJqTURzdzBQa0J6UjRoZGhSV1ZZeEUzWjZNL3YrUjcycms4aW9n?=
 =?utf-8?B?VmM2SGN1R1ZzbTIzN3Rrczdkbk5nPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec80bd96-967b-4e2f-0c69-08d9e589a4e0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 13:49:19.1730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arxsxZ4C1LtIIN19iguCOJ+trxKoC8Uu+cUKDmQ7AYnvpjHqfIfmQs7zoGVO8gRHbw+YZYFm2du0UTmBakfau4iivylA0G9+oXtqLeUWh7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5933
Received-SPF: pass client-ip=40.107.7.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

31.01.2022 16:59, Hanna Reitz wrote:
> qemu-img convert documents the backing file and backing format options
> as follows:
>      [-B backing_file [-F backing_fmt]]
> whereas qemu-img create has this:
>      [-b backing_file] [-F backing_fmt]
> 
> That is, for convert, we document that -F cannot be given without -B,
> while for create, way say that they are independent.
> 
> Indeed, it is technically possible to give -F without -b, because it is
> left to the block driver to decide whether this is an error or not, so
> sometimes it is:
> 
> $ qemu-img create -f qed -F qed test.qed 64M
> Formatting 'test.qed', fmt=qed size=67108864 backing_fmt=qed [...]
> 
> And sometimes it is not:
> 
> $ qemu-img create -f qcow2 -F qcow2 test.qcow2 64M
> Formatting 'test.qcow2', fmt=qcow2 cluster_size=65536 [...]
> qemu-img: test.qcow2: Backing format cannot be used without backing file
> 
> Generally, it does not make much sense, though, and users should only
> give -F with -b, so document it that way, as we have already done for
> qemu-img convert (commit 1899bf47375ad40555dcdff12ba49b4b8b82df38).
> 
> Reported-by: Tingting Mao<timao@redhat.com>
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

