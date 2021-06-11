Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C33A47E0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 19:27:11 +0200 (CEST)
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkw2-0000aF-Nm
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 13:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrksD-0006EX-Gc; Fri, 11 Jun 2021 13:23:13 -0400
Received: from mail-eopbgr80131.outbound.protection.outlook.com
 ([40.107.8.131]:62072 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrks9-0005WL-TD; Fri, 11 Jun 2021 13:23:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdGo8yN3GSnnvU10tZPsuKU/7onR4CYEpYL05aqgOv3wgcYsnPcenBA4OzIVWr040MzwHXb6z9YjSRGFpcwCUk/Ii1HJ8o9+DcTocgWxeWiqs6iPjViMMSXTx6c+pEVMfIFQZ3f5xmfRVFc5C/We/3J7JUIaLJydCL79ILttfDL0a/9S6YBhyxQvgrCmqhWfUdgQG5zckwHHBXEKi5v9Qf+MGDI7HJj68rOciMtBtgefdDA8ooNI7NK7dYfaj2v1gkCxzT97PIBz8h07DtWtjvIjZpjd9gMAL+DoxPrPNAQ4yyZ55fZ9IjtXR3b2J+lWbd8es788fjk8d13Dk4mLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sqo6P5MP+HgkpaTIU/YW6lCO3NWqnpFSlYlag6Ue4bo=;
 b=NK0f6j47+/k6gNlJNFRuX7ThD30SbY63nIc7BbitVZv/tHZR1Yw7NZzY4ALOKRZuR4J6cmWLpqWD3bCvamSJYf8gbkRHgQ+pk7Lrj/taMctdysOxgjnrusjCMQxiZX3nXlTzjKetKqmltAfkrRZI4TV08bQWisopp3v6SlPmMCyPAzZaPASrdkwJCs4ErRCysS7Lf+nO0F2hXSagoWbctGb2xDNxETpQ5TgYjJ045YPsRzMhTXwMGgpMCtx4lxAsAZwN1DohPYFe/J+TZflypQ3VkXNI9SyKPJLzunSUU7qnuCciy/A/LH8Fo/jYpiPFkSHD9zxjPhtdIwPdPACydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sqo6P5MP+HgkpaTIU/YW6lCO3NWqnpFSlYlag6Ue4bo=;
 b=Wh2OciETT6iwoFLM1IHi5J38+YIDOzfXdHR01gfk6EUSgI0MOnRpX578U83o++7wGhZBR/jL3yy08TD1a7cq2PA6/sUX3OMGoJvMpI1bgQfkXvY9u8Y1hb/PG74swx6o1ukpkSf/RURftC/sOtJIilS1m5/9HyL+BaeF4+T5PSA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2036.eurprd08.prod.outlook.com (2603:10a6:203:42::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 17:23:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 17:23:05 +0000
Subject: Re: [PATCH v4 00/32] block/nbd: rework client connection
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210611155521.thowpxwrjf6wqq3b@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a726c62d-5969-44d4-b213-2a01ea5deaac@virtuozzo.com>
Date: Fri, 11 Jun 2021 20:23:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210611155521.thowpxwrjf6wqq3b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 17:23:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30896aa6-c430-48b4-f9cd-08d92cfd9298
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2036:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2036F016813306B90510B47FC1349@AM5PR0801MB2036.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NonCt6k9b7yirq1UH533LCUV1qcq6Ei5It4H6+1thyag2tTT/X69wpRFxmmyxnxKyMlULji/HnqoLNGI93K+oLkv2/exVdy4yohb3ck47JLsbTbRcWMRTe/YWYXQQFJAf7a2CPx2xAYCIcnRLxLC+UsVApovUBtywOTj1Iw6Q00IWAqDVnl38TNoBEk2zbU4Ttql1Msnvqvgz76kAWWmUpdp6g8oJGPoyMtdP4ah+maxpMZIPut7+ya5dfy8OjuD8qTTQI6f4Zpv62kqOkNDmKHqFsIHmjmAMOg/3Wyz1b4OZ7gpwxoY1E7/bhTs/RdDOW6wa/4Tky9HBPanXyAp/HpFoKIVfHMy0roDe2A6ySSSmyBkv9Q2S109h2ijn2FX6ts/fB4Msk4PAnWldtIVZK60hg099KxkMa2EshHKZyKbyImY4q4T+qWlPSQ7/g4kgRw2K0MaJnV2vH8xyXuJT3Xsi7GaslKZN/AnEBlnib8nNTWkZWtSdEz/F+0/jHyt8+cDkLq9sT5xqTtz6YZ/7604GgMao7NuHi84l2pQwNIoCH7iE2kGTJ+I+9fXRfkCc4G46hquR+HfwdUoIwhEmFG4Bw+HqJhikM1Qhho4ZNu7ZhlCN5OKuZ9lhLBsEM0HkQILhecmXLpvhioiM0oZ8dNzBMn27q9OV/7cqUfWzNCylUPOMBSrJVeOsT+IVekZrKYG+3VBbrYvIVsiNYBww4o+y+iJjvHV1yj6ZTqUNa4iOJd+pRfJGoWQYYy+BlHqZOZW024q8zN/85kdTnBOyC1yQ3CK4QFPL0fsq6x+MVjbdHWQPp7ASC9SwSB1n5P1l4SqKzQkCRXp+I3czR15OA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(366004)(346002)(396003)(2906002)(8676002)(31686004)(956004)(52116002)(5660300002)(8936002)(2616005)(38100700002)(38350700002)(966005)(4326008)(6916009)(66946007)(86362001)(66476007)(16526019)(36756003)(26005)(66556008)(186003)(316002)(6486002)(16576012)(4744005)(31696002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGEvUUVBdytTSXZSUWNMdTdSTERjaEpGVTF3U2plTklmWlp4S1dzUlBDb0Nn?=
 =?utf-8?B?cTdXSncxRHRDY1loalE0Y1VmZ09OeFNYWXJEOXNYV3U4bnYzMGJwTWZETFFI?=
 =?utf-8?B?cVNycFhWbzJkNUZSc3lnOEx4TGZXa3o4Y21MMWE2Y25YYWFGMTByKzdSaUYv?=
 =?utf-8?B?azZzemdUYUovN1gxcEpmNEZka0d6STJwaEpHK0VQeVJEenNhNlA1Mk94OEQ0?=
 =?utf-8?B?MzJnbEVWcXhPU2RBTnZqYjVKZlpoNCs1TTJYNXQ5bTdwM0FxbHJLa29tc2Y4?=
 =?utf-8?B?c2t3OTdZSU5JdmpLZTNkTzR6VHhlcExIWWZhcGxEbXY3ZWhIWC8yVTREOHNW?=
 =?utf-8?B?Q3RpZTgvOHFPdjJ4MDFlamFGdnEzWHp2MStoS2IvcU1KeGorOHpiQUgyajhs?=
 =?utf-8?B?ZFhueDFGMm5VdHRwcHV0aDNNS0VDMWNITEpOTEpSaWs3YklmdzZMeTdDRHFt?=
 =?utf-8?B?MHRkODJtR1o3U09uRXk0VWtudENyaSttWnJmeGVIMVFNNmZTejgwZ2Y2QS81?=
 =?utf-8?B?QVZ1ekZtZDdCNFdLTGtSbXVGa2pMSG9UdCsrWFhzNXJUTlM4aEIyTGFUb05J?=
 =?utf-8?B?TlhMRzBoeFRVejNuaVFDTUdEeXJyY0d3YVNKbWd2ZUJPb1FDT0Mxb0s1aGFD?=
 =?utf-8?B?ajFVdGtBYXZTbXppVU1rUFY5WWNKTWM1bVF2ZEVLeExPWEZnZVNDS1RnVi9X?=
 =?utf-8?B?RXZZOEY2OFpEMlRqSXhKRjRkSk15Wm5aS2RlenkxL3FQVjBOaWg1VWVoWW14?=
 =?utf-8?B?WU04TnQ2ZXoyd2ZTNXkxNmNUQzJZdFQwRElRZWlpRHptbHRkeW03R29ENC9q?=
 =?utf-8?B?U2ZPZHcyU2tJUzlROGtOOWdreVZnRWVRdmMxZFJVNlZ0WjN6QVh2TklBYUFR?=
 =?utf-8?B?K2JUSE9qeUxkWml0Tk1oSzYzZFV1T3IzTlRDQW45NGVwemRyTWo1bHJqTkgz?=
 =?utf-8?B?NUhWdG14ejJ2U051ZWFIeVhZMkJEZFdJUEdjeXZJNGJZbmh2SlpEQ3QvRFhQ?=
 =?utf-8?B?WkZkMVphczRzVUduOUV0L1pKYlZ2YjhES0huZGdlOHdpN1RaRXNCcmpoUjBJ?=
 =?utf-8?B?cnY0Ym85aFlacmVqVTJKcFd6cFp6SjFLOUx6akx6OERFekxCdXZ3djJSTVB4?=
 =?utf-8?B?eWJlTDFtSXNCam5wK2lHQnlyVUVHNTZOR1U3WmhXU3VhTkVUMVkyL0hwSk40?=
 =?utf-8?B?OHR0ZHFZZGIxOERKV0Y2R0RKVDYrdjRZaVV1Ull6OUhCTHdtQm13TVNLM3Bu?=
 =?utf-8?B?UkVhZlM0WWVsRGdEVXlVSnFoQ2dyQ3JSNWhUa1huaExGR0E3bVppL3ZiYTJ4?=
 =?utf-8?B?cWNHSkttN2dSbktyaHhVNnA4YUxWaC8ybDYzMEZHUVFRU0M0M2h1ZWhNKzFs?=
 =?utf-8?B?L1poUHJhb1U0czFWNFByOVlaQkEyMXM1YloyT0R4RFdRbDQ4YmxGWCttdGtt?=
 =?utf-8?B?Y3FMKzM5YXVKZXlldUlNTmJrcVV2MWpkdkNneTgzV3RwRXZPN1JWWmxoZHlV?=
 =?utf-8?B?TUR3U3hYWXpadHc1TFRqUEJ1VkpxdVF1aHVLVWh0UGNWYjNUeVZ0c280R2w4?=
 =?utf-8?B?RWVDaldrOVFhV1Fxb3NtemZPeFNyTEtjOVdwYWt3RTJsb0hPWTNZcG9QV1lG?=
 =?utf-8?B?emF3ajFBNnFQWGxSWFA3Vi8zRTB3TDZWOEY1OTZaSUpBUkQrZ2drSkZrZ2RE?=
 =?utf-8?B?MzdpSGZDcG1TWkg2OGx1MmJIMmxCSm1OWnNWdExjNldtWWxyY1dkU3VER3VP?=
 =?utf-8?Q?f2osWN6O+ffgfDSZQD3MZ99ClM9XIoWTrOFfpm3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30896aa6-c430-48b4-f9cd-08d92cfd9298
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 17:23:04.8339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuxeqMPflME0YgXRoZGJ8tvjmC/MyRRmFbiofl1w+YAVNVOEgzn7qJmnFsuwnDwiG5day9cvUvXeHxmWgrhDIkEn7eqYyihe9gVXitmRZso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2036
Received-SPF: pass client-ip=40.107.8.131;
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

11.06.2021 18:55, Eric Blake wrote:
> On Thu, Jun 10, 2021 at 01:07:30PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> v4:
>>
>> Now based on new Paolo's patch:
>> Based-on: <20210609122234.544153-1-pbonzini@redhat.com>
>>
>> Also, I've dropped patch 33 for now, it's too much for this series.
>> I'll resend it later on top of this.
>>
>> The series is also available at tag up-nbd-client-connection-v4 in
>> git https://src.openvz.org/scm/~vsementsov/qemu.git
> 
> I think everything has R-b now, so I'll queue this through my NBD tree
> including folding in the grammar tweaks where I spotted them.
> 

Thanks a lot!

-- 
Best regards,
Vladimir

