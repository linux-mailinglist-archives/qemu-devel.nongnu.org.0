Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A113A1B2B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:45:15 +0200 (CEST)
Received: from localhost ([::1]:40140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1KM-0001hn-MO
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lr1J0-0000nG-8u; Wed, 09 Jun 2021 12:43:50 -0400
Received: from mail-eopbgr30113.outbound.protection.outlook.com
 ([40.107.3.113]:62532 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lr1Ix-0000Uo-RU; Wed, 09 Jun 2021 12:43:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXGYkb/9vSReOXX2cLJXnTI8R/PpPaEgGV1fq/6p/co61VTRsPudIKRC8OOYCRevfoGPhbcY1cy3lN+xqVxVg0TzYB3iKP6DbPAji0CiVormtzSFgKwgQNYEkowRgVyZMQoEtHYLg7+IykF1hei1ug9qQKOacB/PlPHItOaj8bXlcI3GkyS24dVfwP5sfy26QmEPhfaybVTOthn6fQy5Nq2N8dS0u11aRBxU9hftEejcstGdmAwWJxNXnAOrBzhzomOG3KUSLC5jxj5LbEp63Yun4EDKw/2rOhAUJ/g0X137WfU6Ei8t/Ijl6g0ByvZygBIqBVag+Yk7XtOPIgqO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIlLF5PUCj5hXkEtY+F/4hLPOI98Q5hyu6kTPl2wT2A=;
 b=aje8kV66KJgkQhH5m7/DlcWxoF43LiQF3eCZpI+apz0wOKbL7GsH89lpiytx2p4c0wP0tqaOaSY6O4GEJ7tQwHqeDeDG6oSuUUdHQPu6lGzzqqs3fC8GesxKETjAEYHNuta+YRsJ2EcB3CUBb3RtHqlnHiJaiTP8VaBIrIPdFpx1SU59enGxewam0NNvJFLjGS9trxmQhrmUoju46Q2qvbn3wq54t/YAzaN7yISqbeSxR+fm3Tcb1cPItVWrQly0YFyQ21kRIQ8zGKZ09egcINcOvVHszjnFtEwLH0uZFFCjqG/LFN+yzmp+a8GF8XJ3hpQMuludLX8vhwDBrrCE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIlLF5PUCj5hXkEtY+F/4hLPOI98Q5hyu6kTPl2wT2A=;
 b=E+rvzKD8ckDprA30E/mNBDkhNOCYxXe4iZaoQSVd8BtpUt2pRNTSO+OHM7ZlDZrVriM1Py+uYcz/dM9NZLHLZQ0NKMacL7DvAKx0UrnoS3fQDJ7f6wUJp3W73bJWksWfo73x8NlfIfqSrV/K6l/LoAKstFcw40xazkyWsTkZTo4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6165.eurprd08.prod.outlook.com (2603:10a6:20b:29a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 16:43:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 16:43:44 +0000
Subject: Re: [PATCH] block: Move read-only check during truncation earlier
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210609163034.997943-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6cc83344-a0f2-5701-1e2d-5a8c7906b661@virtuozzo.com>
Date: Wed, 9 Jun 2021 19:43:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210609163034.997943-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P191CA0045.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P191CA0045.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 16:43:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f94a9d6-839c-4cdd-598c-08d92b65bec1
X-MS-TrafficTypeDiagnostic: AS8PR08MB6165:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6165558F6C7DCEDEFFA5AAEFC1369@AS8PR08MB6165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rzfVwvQ+fAoWAHbnenb5n22I+CN4yExKZW9BWjN5kLn9Y4GEpHGM5W/d1si6qwOoK3jSmNV5SdTlBefOLmvSuJ1TDqUFXBStUQHn/frd59qEYFafEJoT61VZfwLdfxfJQQfspIvLchWfNiqi56zfScK581PGEDqRUWdisKqKXV0awV3LHmCI03UlQXBMqEog81Z9/KT4z1X7pQ+RK6avUt+9VZkfePoqekMRJvyoI34C7diecfkctCQEya/EJpn0Y2qiTPGLKd+hDMzgIhRqWU7jOvUpC9e31ArlOounfn/ypglSuQdVDfdZdmmmRjDiNT15juQabPz6NGiayv/aViEfKQ+IsMAFlFi8vl8W1Q1WUCDPu3PiaR/p2ZN1fbpnrJIRrJRO1gHinK4cj4Qsb0Qy59cWUwOilnmTQOrOceOK8XIeQ2/8w2/UYkOHcqTr2Fib/M6ewW5P5dVRfay2vAtJ4nKXrQymF4VlceNLGfostNrmzkRkoxB3GpQ1vJHoP1F51MvFxjnrY95cJABRL1qq7HREZptuOdYhe1UbrNN3KilGQFSfVelSNdlxQ0AVtb/VFZL2wXKq+u4Aukr5G6XzIZtxmC63siLyP4USsVR+Rs1PwByel4LUwegHdc7gw1G9U4OMVUa4PZD2Drjf2yA6JudolIwWg+Q3zPOixfQcjMPev49KW+hcRFwEZbY+hLPhDiORRczc/8QdQ9OAXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(396003)(136003)(366004)(83380400001)(38350700002)(31696002)(4744005)(8936002)(38100700002)(4326008)(2616005)(956004)(478600001)(16576012)(66946007)(316002)(66476007)(86362001)(2906002)(8676002)(26005)(31686004)(186003)(16526019)(54906003)(36756003)(52116002)(6486002)(5660300002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzZ1a214UmNybFBqV2oxWWJ5akZZcmp6cTdLMW40dmFYZHRPYitQMUpDTTNa?=
 =?utf-8?B?eUVBc0MrTEZvTk0vYkxHRmY1Y01Wb2pNZW5YOUZwb2t0R1gwMENZcWZLdUEz?=
 =?utf-8?B?TXJ5Tjg1OXUvcnk2Y01LT1FJVTZMb01ua3UwR2JOVmxCNW5OQSswRTZWYUxU?=
 =?utf-8?B?WHBoQk9KdGV5S0xvL2NXbzVjdEFwQnlQVy9lc3ZpUncrdmJwYjFTOFJ5RG83?=
 =?utf-8?B?U2RqTkdoZWVvYUlSVnFhQUxxV3BVT0NnOVA3WVY0UC92SXpJcVpEcUlKKzlr?=
 =?utf-8?B?b2M0andzYzdPR2FRMW9VcnFCTlNuTTZ3UGdkSUhTR2xGWDR2UzNLQkJHNEZ1?=
 =?utf-8?B?clhReFVWVnRsU2ZPMWJ0NEhHN0xwaHlVajFCUW1WeGJQdFltT0lTdnNBQU5n?=
 =?utf-8?B?Z2hFVWhsTjU0N3N6bStiSnA4aDAzcVBRdnVkc0RNQVo4THA5L1JKd0JLUEEz?=
 =?utf-8?B?ejFoRDhIVWJYK3JyczhFbjlFZWVvNGhQY1FVMHJMZlpuUVhnS1UydjNDa2xQ?=
 =?utf-8?B?RWFrc3lVb3pYbndRS2tDZUpYbHROWTZVZ01KVEg3c3kvdlBENWVXdit4aTZX?=
 =?utf-8?B?OW8rcFRuSGRJVmtaOTc0OTZrZDJTMzBNcU5xQ3k1MXIraWNrWFBKOWJueXF5?=
 =?utf-8?B?WEx4b3pKblZ2WDdNQzNBRmowN1Q3VDVwVFBpVEdaQ0VEZmt5ZGNHREdIaS9N?=
 =?utf-8?B?Tjc0OWtpcUo4dm96ZGZJN1RJcEJmVzVLQ2ZlWjllUFFPYjlOUXYxTms1aWo1?=
 =?utf-8?B?NHRhdTZKa3ZiRk8xdzVZQnF5T0N4ZUp1ZWdFSEJnWm5jSy9BcllIK0VSa243?=
 =?utf-8?B?UzB0aHpmVnduU3MreStaQnVMNUpWakRZMHFOcHYvSXk3T2ZLc1ZLOHp1UVNp?=
 =?utf-8?B?TkRJR1NJZzRNVEdiZzk1djJWYkV1UVh1SnRJM3pGMEl0QWFJUSsvTEhuRjBF?=
 =?utf-8?B?OWt5WXAyYVNvb3ZYTmhacndNZ1BMVFV0VCs1bFZjOGlRdG8vNS9XV1gwVHlh?=
 =?utf-8?B?T3QrSk5CSzFZSjJKUVhiY1UvVExqQWxaVkdHNktjSFdwRXd6R0VjK0JEcnN6?=
 =?utf-8?B?QkNEQ1ZjWXhqWHdzQjZxeDlqOVFmb1ExYkVvNkhOUDRIS1ZqV2JwNHV6anJE?=
 =?utf-8?B?WXVvZHFPb29IU2tBMExZZFpWNVZyQ0pKYnVPcXFkMzY5U2k5MDZudDlPYmQx?=
 =?utf-8?B?NE12WUtZVERzdDc0dkJ0VjVSZXZtUFVadUNSQ1NZb1VVVlkzTC9TcVFxS1lK?=
 =?utf-8?B?ek9SdlZNdVFKb1VGMXB3aVVCUVE4bXFXQllrM3JtbnpkazYvUko1bVpkazZn?=
 =?utf-8?B?ODJwRlZadzEvK3VzVWZwMHJCdUdPQXgwb1poQVVzYzVac0ZMQkpCZjlWYXkx?=
 =?utf-8?B?dDhUSVFmdGZxTGl0SXN0eXkzUjFBWDJ1eWVMNDF4bGRhTzZTNUdoYnI5K1Ex?=
 =?utf-8?B?aHVVYTRUR2hFM0Y4NTkxWnBUTzY0NlAvR2srZ2NBYytNa21IOHN4cWtSdG40?=
 =?utf-8?B?bUh3aU9WS0x6K1dKOHdpbnIyN0dySUY2MkhZVXBSa3NHYmlMejk3d2k5VVZy?=
 =?utf-8?B?Z0ZCZjAxWXVOeDRTZmlvSHNrS3FOMWZsc1l6amFqalBvMW1GMWpheWZ0MWlN?=
 =?utf-8?B?QTN4VTZIUDEyL3VYNGkwdEdkdElJUU8vL3gvNVRybWcvQjh0eU1ucVk0aWNN?=
 =?utf-8?B?T0ZJUFFDUVJFZ2ZJMSsvY1JXTityVjU3M0R3QWVtc29UY2dMNm9qZzFid3JK?=
 =?utf-8?Q?oYGQ876OCkKrmTg51OYs1ejAQ+3C4JK8qFaY7Iy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f94a9d6-839c-4cdd-598c-08d92b65bec1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 16:43:44.3202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/FMtcq2H1j53MSLvW0aMfg/IiuNup+P0s9mmOUmUGSwbvhh0YhlrEUbH8Cegn2recNpM9z7yUPyPDVbXoxR2l4A9yFvXVngadZWLRyy+xM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6165
Received-SPF: pass client-ip=40.107.3.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

09.06.2021 19:30, Eric Blake wrote:
> No need to start a tracked request that will always fail.  The choice
> to check read-only after bdrv_inc_in_flight() predates 1bc5f09f2e
> (block: Use tracked request for truncate), but waiting for serializing
> requests can make the effect more noticeable.
> 
> Signed-off-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

