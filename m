Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751AB3194A5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:42:20 +0100 (CET)
Received: from localhost ([::1]:36652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIn4-0002V0-Vi
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAIjE-0007l5-Pz; Thu, 11 Feb 2021 15:38:21 -0500
Received: from mail-vi1eur05on2128.outbound.protection.outlook.com
 ([40.107.21.128]:58625 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAIjB-0006RC-OK; Thu, 11 Feb 2021 15:38:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMaCepfDM2jf1/bBJrd8NHGqMXjFp/pCI0tfoSHyqfWzXiOfwZ+h34ZcdZUkgMGPCrabckV8siosXPIoCsyEV6sjyWk+BdJefFg/SfOPQwL+4KP9swdV0PJfBQ7HaIle30f/ia02cLKMwZ4oT5DKq/rPMoh+VFhtXd2GIwdB4HKgLIXRRMAOe9OVA1G41YIjLNYTMKsu60YH+YznQhpAEjEiRw22rf6BZ0ejVu/bpTbAsVNSucUbYlh1dEbLDDdWEHDss+zoBkZ8XMo/uG8gd9bOV5FN4Jay7oOfl20OXbT1huYsR+g6IZg2ikf3zGo+rJ9CD3qUcx/FBH58wVVw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeXeUYNsdZV1+nIKb7a9xK8QLNGALgSOUfMPAevWjMc=;
 b=k4+hfHNbuSO2Lr0Oumc5NrBHu+3nC6EDCaDQvUf61OUVYdmCsMHGuVWHUGbipgpQCd/65S4xpAWF+9+BbeWgz9z9DBXSpIQ5XUW6CbVI7ucahv/8ASyLcgdr9aDkbMV32OB3JGzZcFQCyar/W1CDP29a9IUthQlKRehEQxnZwPTCn7X9PXb6z1W0q0G9oQvWBaTp6eQvABBKR/OYImP6RBpxKEE6vPVL7wnPKx1EV31aguOuJTGxMyRfbOADpZIj3LTdqQXYVevaRXIfaWSUdb/meWWZ8pRw36bQq76JgAzrM9sJqKvJEW9AMA3YgKfSjkAYMmkytW06kMZKRbE49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeXeUYNsdZV1+nIKb7a9xK8QLNGALgSOUfMPAevWjMc=;
 b=DbTi7DkHEwcLwwOQv+93vXmiexjDkLriLVfY7CrlTzDnokH3AlLBrpDbxT3rIr7sS55klLVt4H2B55UNLZ33jzoi29MH1yqcCb0zet/rtN5plb7n11v4bAvu4oCWVo3nMhdFCqpeE0h3BtM7H7buvBwwG4j6P1iUPcwg9v9hlbg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5495.eurprd08.prod.outlook.com (2603:10a6:20b:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 11 Feb
 2021 20:38:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Thu, 11 Feb 2021
 20:38:13 +0000
Subject: Re: [PATCH 2/2] file-posix: Cache next hole
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210211172242.146671-1-mreitz@redhat.com>
 <20210211172242.146671-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <feb0d8a5-28b9-852a-186b-618e82dd309a@virtuozzo.com>
Date: Thu, 11 Feb 2021 23:38:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210211172242.146671-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: AM0PR04CA0116.eurprd04.prod.outlook.com
 (2603:10a6:208:55::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 AM0PR04CA0116.eurprd04.prod.outlook.com (2603:10a6:208:55::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 20:38:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acbc199b-60d5-4888-febd-08d8ceccf3e8
X-MS-TrafficTypeDiagnostic: AM7PR08MB5495:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5495F02BCE9C6F45221A1687C18C9@AM7PR08MB5495.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ci/sy4T8/cWJFDM3hc15YkCxLPgUOCJM+AnL6JQdOQmYKj04/9+grt8JLlMLHHA/sqx1xWwObEvxGLLBOlM6H0ueAzi2ejXsIKr+keaHxFSqQ/xz0R4edeFztonniaNixg3Ubr7PFY7j2NJiROYCHD6P1y8tX1Xo6wD34aqAS+5CLW8UGMQGm4awNKDBKewMqmiyoar8UfZenyt56YGlVmm3m3PqNKaPCODzx0+8sqCc1F0cJCoWbCmdRqaDIWb20mHARytSDPtwUF2tXlH4XB53XPpaesyGYkL1PIKSWsJX/wvwPDp1WrrXoxk2wKvLP2gveBW+/pG8KDfz+iiyNuAnN+qQfD6XDv6pxIy9Kh1+wOBgKmFp0po3MhgaR/Ls3MN1kr3uEUEgOo1uCnlnWsque8c19pyi2nNmVlgJh4nxPx2pie7nSEd423c2B+IgzJVExbDXXgHoIWhhgjeIgO479mxw6nipjr8GHvWo5kpWzSOdSSDa8xEx39AN6LPrL4Ymkf1UUORdWO/h5/jqs8Cj22emCes16saN/4+CYLY4BoOS/QGD7zDRgFqVZlAmUQpunlZC72DYHESbuKEzMjYa6YMi/eHjhYe2b2A3McmbUb4jBVXZukQATx/kPqwIFDn6YO3V4jrHCE1phwtvYcNwP2L5GpIPZSDIWVp/bE4zw5mt7PnFYxqrz2QY9ucO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(396003)(366004)(136003)(31686004)(86362001)(66476007)(36756003)(52116002)(66556008)(66946007)(966005)(83380400001)(478600001)(31696002)(2906002)(2616005)(8936002)(16526019)(8676002)(16576012)(26005)(316002)(186003)(5660300002)(956004)(4326008)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZkpaT1kwalVxRkdKNUN6RE9IcUgwYjVVQjI1dkpWV0VFY0hxN1JLSGpsS3Jz?=
 =?utf-8?B?NkF4OElXVDNMbm9KZHhkZW1Kd3RsSTRScXowcFpqY283NFAvMW9XOTNIdHQ5?=
 =?utf-8?B?TUxKVjM3b3BtdjJtdVl2d1ZReFdzUjhMZGllM251d3RMNElyMDNUQzJkYXJv?=
 =?utf-8?B?VzZuUmhXS3Job2xMZjZZWTlnVHpieG1ZVS9mMUxWWHFTeW92dm1Jekwza1Yy?=
 =?utf-8?B?NFJXMkFmWnVRMU1XMGx3QWdZRFI4OFJrYXR1dHppRWt4Wll1anRkNGpiQmhM?=
 =?utf-8?B?RDMwdW1mYVA3aGsvMzBXVW9TWnZEUng1bVczNVFlcEsvUWd2cVhTMU1HSGtv?=
 =?utf-8?B?L1BBK201dVo1UklCYnlPWlcrb1hSRG1lNUxtTlp2eDFldG9DU2NxSmZMUFll?=
 =?utf-8?B?OGJMOUI3YjRramMvZmZOaGdCODRzUG01cmdhWjZRcGk2bjZ1RzFWcUJWamxI?=
 =?utf-8?B?aEpnN3liUlFxaVBnVHRtak1UZlZReVEyVnZZU1NSZzUvQktCZWlqYWhIVnJJ?=
 =?utf-8?B?Ny9LUlh1SkliOG41aWRESmxvSWg1OERERlhlNmthNVh6alExZWRSWUt3ZVlz?=
 =?utf-8?B?dnAxcDNTQTJnOVZBYTVDTUFRZDQ1K0pnbXo4YmJxakU1UlI2MjJRc0hKVTZq?=
 =?utf-8?B?RlU4RXpGK0JENTVIenJKRzR4c1Z2TCtaSmZscTdaY0V0SlV3UEZVWVl3VUFo?=
 =?utf-8?B?enhYTGRiQ0lhM0hTaFBoeVBPUFZUZUdJR09IT1Y4Rk96aGtVUEJkbCtKTytl?=
 =?utf-8?B?VlN0Z0RZRk8xeDFlei9zUjh2eFl3ci9yTHRHbkNkWnhCdnlCckg5SXk2WVlW?=
 =?utf-8?B?RThaVXFrRGFxSlF3bVNkZHVXZUVlMCt2K1pUNkVWYW54RERnYnNTeE53NVg4?=
 =?utf-8?B?S0VURWdDcnVtOG5HYWdxWXR2dnIzTis0eGVOZnUyU0RRelVSRFNlN09FOUpR?=
 =?utf-8?B?VUoveThrV1hNeUhxamdzQUNRTnNZd2dvZ05GWE0yS01xT1ZlNXdBLzFLY0dq?=
 =?utf-8?B?cnhIOVpSNTc0N2hWR1ljU2M3ckpJMTRzY2tXamJqN0owaWx6L1dtTnZ1ajhV?=
 =?utf-8?B?WFo5QzAwR0lDYzZNdXRuSnZMcHFLVkxHQkcwd2xIOXVJWHppQXhYamJpUmlR?=
 =?utf-8?B?dW5TaG1zOTAxVlpGLzhBdzB1Vy8xZHNEV3hrZU9rMG40Z3NUL0ZBS2czWlEz?=
 =?utf-8?B?ODFRWmQzNExKSkI0NzhqTUNBVlcwbFZhOEhPKzRQb29ENENaRTFpQnJvcE5L?=
 =?utf-8?B?V253L3Z0VGU4M2MxWUhyeFdwU1RHZzEvZUxzVXBJcURnTGRqaFVWTUV3OXlL?=
 =?utf-8?B?RFJsMGFoSVA1d1V6QWZxWndwdkdYOWtPejkzc1N5aWxlT3FnQ0JIazJFRmlF?=
 =?utf-8?B?aFdOYUplSFI1YjVYbVJRbUFjTlVybGJzNVVsaVltQjBwWUR5WldMTkhpRFc2?=
 =?utf-8?B?YnQ0M1krT01qaE5MQXRpSDZYRnhVM1VxWUpaMWpMNHFwalNiYmljbHIwdGxY?=
 =?utf-8?B?VWNGVzEzSWtJUzNrbGNIcEF1TE15SC9lVlFneUxNYVVySXc2eTFUbmNtZ3Fw?=
 =?utf-8?B?SVVySVBwSzdFM3g0Y3o3Y203bjBwcDRxT3VuYlRxdVo4OTlDTFl0a3MzOEtj?=
 =?utf-8?B?Y1djZ2N3djZ6TVk3VnBONTlpazBPZUF2d3FxdWQ4MjdUZUpBNU9JNkEzRDYr?=
 =?utf-8?B?YUxUS1JtMWJZN012ZE1oNkU5KytNcU9HN285ZUt4cHpoK0NyTWVkMEtPVWxB?=
 =?utf-8?Q?BnWMGNAoTNVwajsacrSciyEyfLg8ZiDecgvy70I?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acbc199b-60d5-4888-febd-08d8ceccf3e8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 20:38:13.5600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/6fBQ0eBdyLzZhaEp4vtGTiFfQrzgspqTptAB2r7Dum6har0uWQLJ9FMcprMkijvRANE8yhE7Nt5WBkj5439tk8iYOVjYWrG7OcxZdRrgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5495
Received-SPF: pass client-ip=40.107.21.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_NONE=-0.0001,
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

11.02.2021 20:22, Max Reitz wrote:
> We have repeatedly received reports that SEEK_HOLE and SEEK_DATA are
> slow on certain filesystems and/or under certain circumstances.  That is
> why we generally try to avoid it (which is why bdrv_co_block_status()
> has the @want_zero parameter, and which is why qcow2 has a metadata
> preallocation detection, so we do not fall through to the protocol layer
> to discover which blocks are zero, unless that is really necessary
> (i.e., for metadata-preallocated images)).
> 
> In addition to those measures, we can also try to speed up zero
> detection by letting file-posix cache some hole location information,
> namely where the next hole after the most recently queried offset is.
> This helps especially for images that are (nearly) fully allocated,
> which is coincidentally also the case where querying for zero
> information cannot gain us much.
> 
> Note that this of course only works so long as we have no concurrent
> writers to the image, which is the case when the WRITE capability is not
> shared.
> 
> Alternatively (or perhaps as an improvement in the future), we could let
> file-posix keep track of what it knows is zero and what it knows is
> non-zero with bitmaps, which would help images that actually have a
> significant number of holes (where this implementation here cannot do
> much).  But for such images, SEEK_HOLE/DATA are generally faster (they
> do not need to seek through the whole file), and the performance lost by
> querying the block status does not feel as bad because it is outweighed
> by the performance that can be saved by special-cases zeroed areas, so
> focussing on images that are (nearly) fully allocated is more important.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

I'll look at it tomorrow... Just wanted to note that something similar was proposed by Kevin some time ago:

<20190124141731.21509-1-kwolf@redhat.com>
https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06271.html

(o_0 two years ago.. time passes so fast)

-- 
Best regards,
Vladimir

