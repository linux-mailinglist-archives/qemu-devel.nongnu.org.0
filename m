Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B504B2BA9D5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 13:08:13 +0100 (CET)
Received: from localhost ([::1]:50174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg5D2-00018M-Ah
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 07:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg5Bx-0000gK-7V
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:07:05 -0500
Received: from mail-eopbgr20106.outbound.protection.outlook.com
 ([40.107.2.106]:46937 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg5Bv-0004Wx-Th
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:07:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxxIsBTMZbf5g0f+sILyYv2Wi3bzRIld38PGDg3pE86xTWYesMUiWkYn5QY6HmCtVa2gSZ+LE8jcCNGTup0qHqY4Iys7hMEnPZnkHKYysRcl+NxsOrVebvzqhwi2y+QqMEqptq2FyIGGc0TrS7AuXWVG5ifbBrFxdA20gbqqf0Grx5VPl/sIsr0swtxZ4mViipyeWBL2dP79u6c/Uwe88GLbfvFDzg1kLPcjWoU2FYe1d9iBZccSJdZID98BgndNaSrSeWs6UPJXL07JBDSOBN26eF8wgBl4028T3OlLj5AZcRZBpie2Ch86qvMrtrkKSIJ9rr6Jl/nYXKnhxNSRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duORiquK024DJsah2dvydTXhQZ4pLWXckN6L2JV8DUg=;
 b=aVfHA3C8wUyalpYGknbSdx5k1L3FGa2YFp+hzvRhE6twmi8vaVn2C7DTRhp9O86xVZXPF9REY09vAOn6uujnOKv3Di5a+5Dt7qQjFx4af8XGBa0F4/azLaA4RDbVtg0P5EaPVPvER2KHUQ5a4JtdukvDwr+7Y6InoaydJcK46FtuU1STF+/Zdv+bmkHR8KDLlbhZuAJt4mg6IVyyKzzB2f+tezBaH8cabdEj5sdu/eNc1KNZpa4i/tl0Q7BRXalI/BaCw/4URsYmiL09Ie+gXbyXanNGQRx1faRKyN1/L4Ns3FHsMK7UkSncR/Ha/h1EgZaqVe323nbUFen3BNdhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duORiquK024DJsah2dvydTXhQZ4pLWXckN6L2JV8DUg=;
 b=jw6LHkl7jYqiXmWvcC9YNHEnMBm2YU80jMVkU5t4fjqlyriFsDwhkCqpIpoPRa2XmLi/HNUS20YYXX73RC0NAxNkPV08xV1fQTEm0yLddw6T/S8f4M+8al8O/xASFuvsXSSB6QZEKSEMoj2JRGV46wnQn8DjAvzBL3+60pahT1k=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB2638.eurprd08.prod.outlook.com
 (2603:10a6:802:1f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Fri, 20 Nov
 2020 12:06:58 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 12:06:58 +0000
Subject: Re: [PATCH v3 7/7] introduce simple linear scan rate limiting
 mechanism
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-8-andrey.gruzdev@virtuozzo.com>
 <20201119200250.GH6538@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <3f245bae-654f-5a5f-d243-f3f577639678@virtuozzo.com>
Date: Fri, 20 Nov 2020 15:06:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201119200250.GH6538@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM8P190CA0003.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::8) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM8P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 12:06:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbf9e729-5d88-472c-ebf2-08d88d4cc7f4
X-MS-TrafficTypeDiagnostic: VI1PR08MB2638:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB26389C59750E09E5F57E20AB9FFF0@VI1PR08MB2638.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Meyo07QiAGl4ZzyL35841/yRvptm+9qCF7YwvuR4YbR6fa311IiU2UxTgLFXDKd1S2s5h+h7qyUpxTamxlpi69uhB/8jdVTw+zhHp5AXRLKR8gkjE4JEDpYu7TsYg2uEqcxta8cJyYapJelJABU8MSdwQcA12jbRmcW2jzYsWQ0OramEDK+ZB3z1dFd6JcGPUt0rxlcJ62Yu3TBoe93Hb9aXuKfSc2DfOgcVR19LA5g9QASNFM8iRklahYj1vIOITd+wktxL9BA2tqkma3U6mGuWfFCHuuHB4pCJdJ6HD1fk01vw9tjMcKth0XXd5VogYnQEWEDrpisegse51AK20boiGyGysLv3iJJe2Ao81KgFqWCAI/jgdHPMK9H2q0jn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39830400003)(366004)(346002)(396003)(16576012)(956004)(5660300002)(16526019)(31686004)(66556008)(26005)(6486002)(31696002)(6916009)(66946007)(53546011)(316002)(66476007)(478600001)(54906003)(44832011)(8936002)(2906002)(52116002)(83380400001)(36756003)(2616005)(186003)(86362001)(8676002)(4326008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: JkcTQkRd0kIooUdVvHUirldlZlFjk/etQPwDyN6vhFPKGQGW+rYO8yZBrEG4ZkS8HAi/PRkqXpu0nk5EtnQ8CGcBnKZP3Pcm/1HJ2sxYks1TQrzbLgfLI70oz9WenhEK6sfA9xpI94vVEDXcgTqo0PBlbM2ppcs5f44FUoHd+Qix5oc/mLK5a3x+npl8TmgsvMkn28+beFy4uBeiLEdCoE4L044nqtUtWPeqbwLOtxpmadrQjzPy25fjEARf54Hn9MUTc8/aU3/Gznpi56RvwG4I0KbfYxD6ZwIoZ3ceMOxkDXdPAq8DXgBCPG3xJjPe/ngPbR14K00HIxHA5TDw+dPVotWEpNJqESwiUBwuJpag8Pb1k8w2sHrGckzFB59OIOkTSJ37IGoU5/qzeE0wm3fRecAE7hE0xvQn390lXlAuvwChnw7nBMmjzEWV35XPXXW1RlxI/jM+1m8MTcPYf9zmWmcoJkf34LSTc2PMS/yEF/85boawXc7aY1mmA15kkBq+1xK+a7av/1MjA8oGoWXYYpKIx8CQyjX2VjI7+ZhyL352QxAj9ZaxULwM46gmtsCBH3PFsLJ3r5ZQ73vZ1//Ua6S6qK0HQwgDsU8bnDjMeVZX7KZnHrLI+EL/E3fq96WjOH2qiWt9odfoKdn39H86tiCHGJVhM0vg3c9NZf9HCPCPZbz3wlEtSlPhKprw5XIIm+V4iSHqYbtPJAZSqrQBhSkFCzybYlHjrMp4HEWwcKPRM5lCPyu1Os0w65nr6YTiYxe+IA9qwNVotx0Tn0lN4opbbYbUQX6mhjczwvfkecbeOeHOSKR1hRTl5vR2RvDKOQJZr0K3s4UXgLHZj+RW/GPgcYQ9unBpoDq6pS98mgZqsUnRKwSGPOgbh5lQeE5a4sih5NzhtZLnRwoe7A==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf9e729-5d88-472c-ebf2-08d88d4cc7f4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 12:06:58.6362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRdJPQKo2j4A3jCvB2jr3ZNEtbunnSN5Mx5Qcmo9cTv4h4quIenXTZl6wkNjKb72mHeaLsA8lYobtYN9/FQLSKkU6poOWaczv6X8h3SQXY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2638
Received-SPF: pass client-ip=40.107.2.106;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

On 19.11.2020 23:02, Peter Xu wrote:
> On Thu, Nov 19, 2020 at 03:59:40PM +0300, Andrey Gruzdev wrote:
>> Since reading UFFD events and saving paged data are performed
>> from the same thread, write fault latencies are sensitive to
>> migration stream stalls. Limiting total page saving rate is a
>> method to reduce amount of noticiable fault resolution latencies.
>>
>> Migration bandwidth limiting is achieved via noticing cases of
>> out-of-threshold write fault latencies and temporarily disabling
>> (strictly speaking, severely throttling) saving non-faulting pages.
> 
> Just curious: have you measured aver/max latency of wr-protected page requests,
> or better, even its distribution?
> 
> I believe it should also be relevant to where the snapshot is stored, say, the
> backend disk of your tests.  Is that a file on some fs?
> 
> I would expect the latency should be still good if e.g. the throughput of the
> backend file system is decent even without a patch like this, but I might have
> missed something..
> 
> In all cases, it would be very nice if this patch can have the histogram or
> aver or max latency measured and compared before/after this patch applied.
> 
> Thanks,
> 
So far I have no objective latency measurements, that really 
interesting. For testing I commonly used SATA HDD, not too fresh one, 
1.5TB Seagate 7200.11 series, specially not to have large hardware cache 
or flash buffer. And yes, backend is a file on ext4.

I tried mostly with 'migrate exec:streamdump_utility', a very simple 
tool which writes stream to a file. It even doesn't use AIO - so reads 
from STDIN and file writes don't overlap. Made so intentionally to 
reduce throughput and give some random high-latency writes.

I think snapshotting performance may be severely degraded by I/O 
happening in parallel on the same storage media, that's the problem we 
need to consider.

And yes, to take latency histogram before/after the patch is nice idea!
Also I need to make stream dumping tool with AIO, to test with full 
storage throughput.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

