Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE563C2ABE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 23:11:28 +0200 (CEST)
Received: from localhost ([::1]:60372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xmR-0006ie-6z
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 17:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1xkP-0005mW-LT; Fri, 09 Jul 2021 17:09:21 -0400
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:28352 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1xkM-0001DP-Nf; Fri, 09 Jul 2021 17:09:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2NyntRbu53kuBpXygTS847cPTkJtSDzQsq21eRpL+A844AzjFWDrfBK7qNkXr1Eh2r1XfcgJisML7QBhN5pNRz0R52uyc3f47JIFQ1d1bWjGgv9UhWbxkViC70lMKRXv5/XyAKQK4ZZSrb+NaXnlViupJsFqfbfdRJ8Z/zv+T4lPh3mDAD2Zt6ECk4BYJZVNtE5hKW+FzWbtIFYOkT1VFBWAxd6B04OkcdxK2r8GsXNLoMalQ8Cg581B/Sr2FPSLPtVWXKmgTyb8lVEhpVKyDzV+19Sc3ut74m4KnUPX7C1YTbXH6J2PaZgWLG1c8M1JmW9u1QbwrRDpL+3DkBSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kICHWuA6Ou/4qZQhYTfe0GzTxS0NhwB8qTZ2Akl97IE=;
 b=TC45sPUUtxinhQxZmY2SFkCtBiD/6dTYPVIGviOEEauiZJYZR3nMksq9Cy4SVcRpHKsJKsxxqZ6OXcU2mmN4/MFKIkbRvQqF+4gvx04g+/oJyMCxdyjsBfNkKJlnQzJkFiPivGBpozUDTVOvqfACqiOETxmnS+8IPcaw2NW6oBtQZGzEzdR9ztAbMnstW96juvh2/aBQj0fl2CBXcRq8kCJPpduIxHUh5ckxGG71+P1q6GvUYaLeDcVv6O9J3l6ZSWEhOGCBmi13zlyHlWhZf6x+8D8Bstu9lNnUYDK8eLjh//g5Sj0hoUDbVbqx2roa3ECW8e4W35dUKOh2eh5OdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kICHWuA6Ou/4qZQhYTfe0GzTxS0NhwB8qTZ2Akl97IE=;
 b=j8gIpQzPzE5e2ajF21OhuImBMFzuAIicCgWP7CU0URbnMQRtmQr3IkGz7BNxAT2NPbaQn+4MimqWuteL9Uc7BYqysmPACOncrrhLDIEfijMTfxWfXPFLq8Xf/ctF6HRs2OyYzNclRJar4XmNGmWEV+zlqVrRkPJKhp4ouejFZ70=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Fri, 9 Jul
 2021 21:09:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 9 Jul 2021
 21:09:13 +0000
Subject: Re: [PATCH v2 1/3] iotests: Improve and rename test 291 to
 qemu-img-bitmap
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com, nsoffer@redhat.com,
 John Snow <jsnow@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210709153951.2801666-1-eblake@redhat.com>
 <20210709153951.2801666-2-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <aa82e3f8-ec56-cd71-872f-ae8ebbcdfcdd@virtuozzo.com>
Date: Sat, 10 Jul 2021 00:09:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210709153951.2801666-2-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0113.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0113.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 21:09:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 635caa77-bb45-48b1-d7f4-08d9431dcd59
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5336C4C676D4AA14CF67F5F0C1189@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kuzdt49TQ5+fVnWIU4gJz0K/N/Iruxe+QVK6iXwtw520ytHUJ7ZlgKQyz+9pQ+PTlrzAIffSaCXS4kTcDo1vLRRhkIRuhz/OZsumATMe/c+Y8UL5kYLb+3lFYex7saGqKwqOZ5zeyB8o4ou5/tI6EmbpCGvxmZGXnki+MHSYyTFDikS7fzQ3MsQ3Vu2unwzjKdhy0koEF8KE8HMgrb2MN6Mb11Vma+LxJYBTQDz+0PXfFE77c/nnrD76CbxRqwGQ7PcTc2PbI9/88xBOhpd6HeSd6l2lbfuc/+jII3B2Lbu2+0T1Q2c2Wp4dN3q6tum8x0O6kaILeS8AmVAbyQWxwz1zm4icTw1j7WZPQLBlApwel9TRcuDM/umu/JmvyuRDOzVpaMpPjwaMjQ4FvUHW7GG/0mtEM5vDaheIEUaQGuc9tWaYpfDuEpp/n6F17+BuXTosehCxk3YqWtbKxmRXYI34704b42V9MhOK9w3b316G2GH3AQb7SQOfJ/PiXx/zmAM2uQQQdb1OEXTcMlt+uKztz/F/lHysDUvuZcJbLo+6Kq4VBRTWHlHtTg4BxHjUPVKoP4v/NlZKl9G2GPVMrxPAKbfIExdLVTTiuoyNtqmfUdQmiqPpRPc8eaQhahMhy8Kr2g/h4w2SlOMZ1DK3PIpnxJPML8FRvPNFBpzSGak9AJ/EiWiRdL6m9IoaWOmNILT/8A78tdAOP1c8LdtFDP28XN0ymnajRFHhv6/kVN0KjDxmk+vc5fPz7K9d4FRD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(396003)(346002)(136003)(38350700002)(66476007)(36756003)(66946007)(66556008)(38100700002)(54906003)(8936002)(86362001)(2906002)(52116002)(4744005)(478600001)(4326008)(8676002)(83380400001)(16576012)(316002)(186003)(6486002)(5660300002)(26005)(2616005)(956004)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlhISUhFSHNMRVBuMk1sVGtaMWt2NHhCaEtVZkJkYzB3RUcrSlVIMGVRa0w3?=
 =?utf-8?B?dzhIejJwRzc5Ykd2SW9EZ09Vd0NuNytpM2JZbDJjYXo5eThqcnc0TEhIdHMw?=
 =?utf-8?B?ZkJ0ZWwwc0JQVkRLYnZmbHYxcHhyNmI0Q3ZsS0dWNnZMYzhRS0FNNGJjS3lz?=
 =?utf-8?B?UVpaWUVCZDg2SndHeUJNRzJTckg4MCswQVFwY0w3VlVuN21kSGN0dllDUnhO?=
 =?utf-8?B?VThnMjlXeWQvL0w4VExHZi9zZytkUmN3dThFeWFkc3VjUnorcFlZVWtuZVVq?=
 =?utf-8?B?Sk4yYlBjY2JqNFdqbjNFZlNvSENkdTExN3REWFBQNi9lV0oxM0ZzYS8xQitv?=
 =?utf-8?B?aHdWU240Tmtid3p5ZGVWZjdjSjNkdktZazNuclBQenZoSjlhTDZpQ1c2a0hz?=
 =?utf-8?B?WExMa2o4UTRQMzZUdTNvSjZCczRXU2ZMLzgwZGpCNXNsbXo1cTY3TTM3Vlhr?=
 =?utf-8?B?THJKcG9OTS91anNuNXVuNWV3cjN1TENhZDU0OXlndjR1Y0NkSFVNaUlOM0FT?=
 =?utf-8?B?bVFuVklkbXZKcjY4NGFVUWZob2xhWEg3YlFlck1SUElFVkdFaWMzZkZsbFZn?=
 =?utf-8?B?bHFlWG8rcEZiczBsVEFoSXFNek5uREJETmlnaGlZeTUyd09UaDFleHA4ZEgx?=
 =?utf-8?B?YjdSQ3VTa3VBdFZqVDBpUnhxWUsyS1RnRTBpVEJEQ3VWRkpKb21uQUtPSVpm?=
 =?utf-8?B?OTNhSVJVM0VyL3VwUnRJUjh6ZXZTdHA3cjRZMENSK0VicEhoazVWeFlyQW14?=
 =?utf-8?B?TFRDbXNtMW1NWkt5cXZEK1ZmRC81bUdLcWVqV0Z3T1pDYWFTVU9YalVjZitY?=
 =?utf-8?B?NzlFRjVFekxxU2ErZUsvcFpEa3NaNlhnOWUvWWFEUUpZcExwRFZhb3lvRVh0?=
 =?utf-8?B?bVB5SXhaakNXUktZUXUzeGtDa2hhZGNJdVR3dStaSTBITk9yRHlxMEwwNWQ4?=
 =?utf-8?B?NVRtd1pWakQ2SHUybTQ3a2Z4bS9wanowWnFZcnVGRWdYSGIwZ0lYV3NrTG9n?=
 =?utf-8?B?bDhVODBYeVVIWlZlWEt1SStaYlNCd2NiWXV6TnRTd1g5YUt1K2JOVGNQS1N2?=
 =?utf-8?B?THBibW9pNjY0N0g0ZFlwRG9zdVR4Y3BPQTdnd0k4dWdGR1ZlMUxuT2Z1aENP?=
 =?utf-8?B?TCtXcmc3ZmZ6eVoyT0dRck1hbTdhVk1kLzFQUXZ0eVlHVk1GOEkyMHByMm80?=
 =?utf-8?B?ak5nejBqU1hWeTFIY3dybnlRTFVwTURDRmhWWmJBUUo2Q1d6dVVmanlHTFlX?=
 =?utf-8?B?OGJDR0RRajV4SGU0S3FxeHJGTldSaTcxcmNuaXNxVGN1bUFqWmd6U3FzUHY3?=
 =?utf-8?B?QVpXd0FQcHpEV2tFaE1HcE5aUXV6Y3lXTWhkbjBEVlhxWWpRblp1QmdVcjc5?=
 =?utf-8?B?bnJ0REdrMkZJQ2VPbmJqKzJJaW1KOEJsbDZiZG9TL1FXTDcyT09aSG8vdnY4?=
 =?utf-8?B?N1ZrUm0rNkhVcFVjWmxYVm9aMjlqdTBIcDUxd2FHZkE2ZG9DREUwcFFaUitF?=
 =?utf-8?B?OEc5SkNhcUl1TnRIQm1rRjVjcUlZbGliZGtNUzRidG9kRGE0MDJiNXlLUUVl?=
 =?utf-8?B?QWhvYXlJdTZocTAzclRnWHhYVVp4Q0l3ZG1vYkpDR2MzaTkzbWRVRnp3b053?=
 =?utf-8?B?Ly9OVEpRWDUwVnQzSVBFSDdHS0k0ZWVsOWtOaHNCY2ZCWVdIaEh4ZmNsTkpB?=
 =?utf-8?B?ZWtlYjJSSjAzV0ZhVFJIa3R5UUxqRnRKVUd0a1ZYWnJRUVpxc2lxSWphQUF0?=
 =?utf-8?Q?fyc19Eb4GRkyK4SV+WWZ45c49asZnrxfJTusFuY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635caa77-bb45-48b1-d7f4-08d9431dcd59
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 21:09:12.9727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffAtwdooCv+r3r6E3I3G2apjLQ4u/HHOWlEhxhfrQOpRTPwrDLGF7PDNbwJjB2eoj4UrlxLQjK9Bmuwtis5ZKKs2/1L0VwDQDUd5PSK5LT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.22.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.07.2021 18:39, Eric Blake wrote:
> Enhance the test to demonstrate existing less-than-stellar behavior of
> qemu-img with a qcow2 image containing an inconsistent bitmap: we
> don't diagnose the problem until after copying the entire image (a
> potentially long time), and when we do diagnose the failure, we still
> end up leaving an empty bitmap in the destination.  This mess will be
> cleaned up in the next patch.
> 
> While at it, rename the test now that we support useful iotest names,
> and fix a missing newline in the error message thus exposed.
> 
> Signed-off-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

