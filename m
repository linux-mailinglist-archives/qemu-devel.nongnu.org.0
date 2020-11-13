Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F82B233F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 19:03:03 +0100 (CET)
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kddPa-0002fQ-BT
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 13:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kddNE-0001sX-Q2; Fri, 13 Nov 2020 13:00:36 -0500
Received: from mail-eopbgr60093.outbound.protection.outlook.com
 ([40.107.6.93]:30735 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kddNB-0001oQ-HX; Fri, 13 Nov 2020 13:00:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1GMzXyzJGmHlHx5SSs6K6SvZW5bysPk6e3U/4QqmMJlHOOBIqWBEF1x9PiHoFLB3RZv4wWo1QxXcqLFrXxDGjvE8w7fMRUa2Np2t3QnUdWAN+jrnt0H/TGGHk3YK+GtXlHLVgVYMxrftwlcn7QvVUa6SCmeYOeXwrzwkCzmoo08I+L9tGXWyd3FM+swDIOXR6/jpo2U+HpRffRit67/k5M8LQQ7gIfy7ys/kTTX1IteE6Y56qKUJbTTmaXZaQH+SOB44qelTkQO5OjKHN2LwbcFeuUGMXgd7BAKNE//T+N70uMcaeuNMKJ/hKE6cgoul9pBX/CpHwZtCuuUoXuSTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AYBG97ChuQaON4rRJW0e8Gl6/1PDA5aFvUMFKjBecA=;
 b=LmHsZS+6c/KFdQ9rNJUwTQjhYPzdAXt+3OWCghCzadQbKUepFbAmETqeLspr5p08epjKmydrqpbJCjSD+DXWJkl77eIZfGw5zBoEB/7/AnmqsbjIDX7fWGyynLtOCdDPK2iF0zBQODlYA00HG1wurP1DP4GFQEH1zkUIDHHKsmlE56dTXV+Luzq9zmVmeI7h37lQE1Q4BS4Dzss1UQeOVVSbS1CkUO4ecFDXMk5GgY4TD6P2xLlfKnJSDZx+hEhCTXU/YnvnEIz+IxoZl6E65AgqAUUBgj83iEP59Jk4GAuhBCTHPngD06MZSwo2BF5bJIpQhYj5eUewSFzQr4l0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AYBG97ChuQaON4rRJW0e8Gl6/1PDA5aFvUMFKjBecA=;
 b=R+jv394Ed6ALOG8/Gk/buLdJxhjHFXKplh0bhzCVDN/qA+Y2SHhxhtv6+pB1gK/x1xI7xEQMZdmalqKpnXKJ1Vh1jX29i/IqijQnQ1U1fal1e9NcobeBPGdbmPnmXmfXacuTr1whX1vugKtcbNS8DEQTu3X4vMHrri+h5B8U6ag=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2984.eurprd08.prod.outlook.com (2603:10a6:209:4e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Fri, 13 Nov
 2020 18:00:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 18:00:27 +0000
Subject: Re: [PATCH v7 21/21] scripts/simplebench: add bench_prealloc.py
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, kwolf@redhat.com, den@virtuozzo.com
References: <20201021145859.11201-1-vsementsov@virtuozzo.com>
 <20201021145859.11201-22-vsementsov@virtuozzo.com>
 <7ac2a1e3-19a3-5d84-49fc-369f8ac2b696@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6ecf486b-3faa-c940-5923-746f71a5cd29@virtuozzo.com>
Date: Fri, 13 Nov 2020 21:00:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
In-Reply-To: <7ac2a1e3-19a3-5d84-49fc-369f8ac2b696@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.71]
X-ClientProxiedBy: AM0PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:208:122::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.71) by
 AM0PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:208:122::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25 via Frontend
 Transport; Fri, 13 Nov 2020 18:00:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf6ecf76-c200-4627-e985-08d887fe005b
X-MS-TrafficTypeDiagnostic: AM6PR08MB2984:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB2984F115C18518F212A91ECDC1E60@AM6PR08MB2984.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IBMgLtCVRnJ3RcbiuL+B7kwiJiamW5SbXmUAMIH9EmH3RvRfpCfCYtuxUCUa/wezs5C904SZ85vmLVLqG7FULVXUnHiTTObqTJuK3gFhUywSUBzOgG99Tmw0sNWqVLPWo7dKetlxKaCdg0DDGWAo5CZp/sf8+aURm0CvgAwFUH967EWxXaOezKgCMkHtF+vp/ym+qzNaz6g9mx+sc8hNTv3POo9bL0GFkwYCVqGg68sn9gD+W9QW5Ttc4jJEO2Prq0z42nlkUsZaLGS9OwQu/HRf70iVFhrKuFdvzsTjLKp/3vk57nQARguQY0rttOfxa3lGPodf1667xURKUTc8I/jLXe7QsyAizBEx2YMcDasKItJIez0U8sXZl+G08lt3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(2616005)(186003)(66556008)(31696002)(316002)(478600001)(66946007)(6486002)(8936002)(66476007)(5660300002)(4744005)(16576012)(31686004)(8676002)(86362001)(52116002)(4326008)(36756003)(26005)(2906002)(107886003)(53546011)(956004)(16526019)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: CrofO9TJfLIgIMtpisWxlRSU381BJBYXOYYGp5bNZOGvOmweBtcoiBeTAARdz1W4YIUFzl8JWg8WrgKAILGZGiuc57bIiENY5jNFacyw08KKLXNrKzuEpMgEUIOEBgnODd17WIvN94UnIciQzwZ9ap1wsxeX2z6BFPBG6hFfqScdhhg74uDT0xYZmKeb3faY29bU2zWhiQU3Niei/cuYrBrddvpEUhOSKiLY5zX8biwhxCjQCURBaLL1CXNrZJWfydpSkGSztEd0fs9yb4g8Y0h2vcOAnkQOH8BAWO14l6DzfMcpkPs6fwL/NSFSokslymgry+MOe7ThxWAxxIKcjY+Y3A8uEsBcCfMbU8s75u2lkV7l3wI/kWOO9gdlO2mpn/frsg+zu1Q/oXxno06/9N1C5UiWK3hWgQQl3lQaHtjWyoqdg5YSjqN/JqDr9Nh1isbi9I6eAaPKRotqRNDKURLEGJ+lsv8horx6CsOMlEybHy4pBZwDzWpKpGEBx/tHRWST+CKg+rGK1GREcIUyppK4gmjg3IVS2uy85aNUkEfrMOkxLpZBLIQ68SY4ps8dc3/ghFrN/5o9zrstDE7IOCG3wXPMrlmUPG3Xs15JnCLaIQTFLZ9+VE3ko+1KAPBaPeQnxsClLUIEkWEwIT3QqQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6ecf76-c200-4627-e985-08d887fe005b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 18:00:27.2253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXqADqe296taRg17v0CLb7uaYKxFHvB2C+TnMaph4n7JtjL+BSgSzBdmxmm54qfNpKrg++UcwojgvMYhtde6llxvN8aeFM5XWcMyz9Ptaf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2984
Received-SPF: pass client-ip=40.107.6.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 13:00:28
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

13.11.2020 19:24, Max Reitz wrote:
> On 21.10.20 16:58, Vladimir Sementsov-Ogievskiy wrote:
>> Benchmark for new preallocate filter.
>>
>> Example usage:
>>      ./bench_prealloc.py ../../build/qemu-img \
>>          ssd-ext4:/path/to/mount/point \
>>          ssd-xfs:/path2 hdd-ext4:/path3 hdd-xfs:/path4
>>
>> The benchmark shows performance improvement (or degradation) when use
>> new preallocate filter with qcow2 image.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/simplebench/bench_prealloc.py | 132 ++++++++++++++++++++++++++
>>   1 file changed, 132 insertions(+)
>>   create mode 100755 scripts/simplebench/bench_prealloc.py
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 


Thanks for reviewing! Could you take this all through you tree?

-- 
Best regards,
Vladimir

