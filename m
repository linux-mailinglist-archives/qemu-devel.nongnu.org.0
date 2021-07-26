Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A73D5770
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 12:26:00 +0200 (CEST)
Received: from localhost ([::1]:39904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7xo7-0003Ed-Gf
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 06:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7xma-0001xF-O5; Mon, 26 Jul 2021 06:24:25 -0400
Received: from mail-am6eur05on2113.outbound.protection.outlook.com
 ([40.107.22.113]:39232 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7xmZ-0002Ig-7G; Mon, 26 Jul 2021 06:24:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gj4gt+T0kKYjYKt8gJc4WRpuJefvsNbJz9FtQQIS1HzqLpbKjjp9UDwAtnsVR1V2bf66B+Npvz2QNDAvSwxfZkgcdNXJqbmsIxlY+gfJIkYcgaAOoCAHOwVh+2edGMzTaaR5V1XzoVq7WoA8OYdPefUtf7kLBPyBPVh+4bHyt9lPYVR9kzGDEmiSyFD2yBdEWzYzrqHRlIMxeeyY47zGkk4ez50piZhSCFhBpl36BYjswPl4fl9VSFStlKhhKo6HqGZ9y46quphVYxIjHPVawwJgHkfJ4KvNkxxfCkI5XzdBcEchjkkHnrV6LeOAd1qtQ5K0PFjzOdWDSfjUHqx25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtd5//cZXXC3FKBsVlcVEpNDxBW9Xgr5ldf5V1u9IZ4=;
 b=OTDpyu2fhRV9gAuVhGourY07skKmM0HjPC7CwVzeqD19Fzaxe9v7FuJbjJ7Ard/sVPbVJR6f6t3EvVkjLiy2xabM750pQ8VzuxhU9nZBeDC+AIkskC2aS+qgZEVJ2HRnh2OBF3tNvCxXqsiJjDn1MCMA6ysg6iUPoJrJ66oGU6MumqUbixqrO0RQmJ/3Fwwf1IGBjngiMB3bP3xWVDO2S4BSM9V2ZY9W8N/mEzunZ1zw7vR7mjOc9pgps5Hlhbj81UoK5YJinhcDjzd3wa40RSzb1yWr4GqSaKEVL2kbB1YDYT0uz9ai59UKMXcM18+Gk/TO5wa9QkoAb7BttY4yMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtd5//cZXXC3FKBsVlcVEpNDxBW9Xgr5ldf5V1u9IZ4=;
 b=Qeh5l36sJCbUw4svNiZvHgB9LF5JdqVVw1y+442TtQvlyhdpByEK9Gir0SHDP0sahPaK4L0hV3VH7OHfqSj+gXA+7qEr9WcXiF69YLQix2sOe4ioQDzUK7COQyLcJ0AmsATwAOU2bTGQ/wF3CAFztIA41EcXaf2kKHGPN60B4Q0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6102.eurprd08.prod.outlook.com (2603:10a6:20b:23d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 10:24:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 10:24:19 +0000
Subject: Re: [PATCH for-6.1? 1/6] mirror: Keep s->synced on error
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210722122627.29605-1-mreitz@redhat.com>
 <20210722122627.29605-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ec9b9767-9701-cd49-75c3-25f49089e3c0@virtuozzo.com>
Date: Mon, 26 Jul 2021 13:24:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210722122627.29605-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0044.eurprd05.prod.outlook.com
 (2603:10a6:200:68::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 AM4PR0501CA0044.eurprd05.prod.outlook.com (2603:10a6:200:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Mon, 26 Jul 2021 10:24:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07d2d5ae-811d-40da-31e1-08d9501f873e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6102:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61023FA63C61CCC0763B3111C1E89@AS8PR08MB6102.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tYS0w1bO/SFWg0swyDfBLSM6g6kmlVhlS1iFPWxQ0KSnSS017ynLUAlFOz4kNV/iFZutgCV0XVR23gcNndCZg1JCXmSWWBiZxhsxAEYS4HyTL4umQErelX3R4XfgPoMklsnrMKZ59dq4VyaEBul+8FBKvBfZiTttkp1JM95HjlGLV6Ow41fmhDZPB5a3J+hKuHZsID3xyAvxyU2E465pXJhV5o1JP+lZXCNDS6eEvWR8pqKjIV6NQ0nZXksjWl4I/YS7/TMr1QVxVBFPTbzdOY1mIMU4LFykp7eB7xrLpLdQYR3Gd1NeC5+/gNX1QIj0KEgOp7O11z1Oe7/ZnoDgNyX5wME8I/bw3HNifh2R9hSKZO7jTJeWquPVdr0bkDvxlchyDOmkr3HwiS8vDmLiMWMXGQI2onJdt+pXsCgvdGCjqzy0qi+6WFK7aez9RGnsFjTqka8kOEWVCCufKq5SfTK5rW5Z/E0gRXwLeXKjeI12Ypd1+kAYGPuyKTu487h6O+2QIUjfjC7TlORayqDYoOLcXTqfsVJ8hSXdctcjRTTJW7JnU3iMV/RQIf8bIe8Reaw9Cwr55UMG64+8090/zznlgUkS5Nv+vysf+SNOf1LCZ7phI1MCxRrt3UoiIO0fudxhGw6WmXCrO358QDM5cNRZwBqSX5Ag27sbwVHS0kNt7bzsxh/Jnv8H/UD93l6wsH2Z1kXpD56TzywoFfMUY7jQBs73KOjlwfAP8C1kZrkxcOlU6vOa4Erv99dyIR3Y765g3izUicpcLBOtf6B6qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39830400003)(366004)(36756003)(186003)(86362001)(31686004)(8676002)(5660300002)(8936002)(31696002)(38350700002)(38100700002)(4326008)(26005)(478600001)(6486002)(2906002)(66556008)(66476007)(66946007)(4744005)(52116002)(2616005)(956004)(54906003)(16576012)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJnQ3Exd3UxL0l2My96cTJBT3JhTGVwc0o4dFlIVTBnd21FcUMzYm5wL0U2?=
 =?utf-8?B?eWFHc3d4NjVuS1RJSDJCSUY1UGNXclBsczh2T0c3MktOWjl5V0FzUnRndVZj?=
 =?utf-8?B?bExUWkpzUldkS3BmYStFSTI3L1kvQ2s3S2ZPZDV0eU03ZlU3cUhSTzkxMmJX?=
 =?utf-8?B?YWlLQU5uTWJZdkgvUlIwSjlXRFA1UVZMNlNlMFlkQ2phTkh3VUovTUUrQVcv?=
 =?utf-8?B?VTQ2OWdIOTgrc0tEQmNBbU5HSGF0K0lTU1NOQm9XNzRtdGl6N2xaTFkzbExU?=
 =?utf-8?B?YzFRcnA4Y05ISStMRWFxbnk0MUhRRjQrelVVRmVDYzVsbEJ2UDZBcWpiMkFX?=
 =?utf-8?B?OHFkZ2RqaWdiRmI4ODdPV0ZNdEdYdUlxT2lFeFpLU0hibEFuYVo2eFRBeE9u?=
 =?utf-8?B?dVcyM2dEd0tRN0ZFOXR4eXVHZDBKSWhTTmhBWWpsc253QUlOR24yWHZWeG9W?=
 =?utf-8?B?aThmOEY4NXl2UGMzeUJ5dWU3TmpXRFRRNjVlQXM5UFZqVXRmZU0rZ1lpYTcx?=
 =?utf-8?B?VUFSOENBQkN5MUZ2OUtKajltYzBIWU9FSFdYZXh3cTNaU1dUaEl4SE41bURZ?=
 =?utf-8?B?ZjdrT3BoS2Vtc0NzR0dCb2o4cGtYcEtBZ1I5UTh2Ujk0c1VlRUt5UG5lcDdj?=
 =?utf-8?B?bHFlQ2pkYk1qU2JtWlpxZXRWUnlIcXhlb24vL0FUQmpwNE1VWFRPYmt4ZHhw?=
 =?utf-8?B?U21QQkJTeDZLTTRUUWVFZWQ1WEpOVXlMVSsybUN5SXk2OVJubkNqTmsxZE1a?=
 =?utf-8?B?OVE3N0dwYms5V21NUzZzK0NOVENBTFlLQzFtTUdab2gvNlpsYVhEVlQvbmh6?=
 =?utf-8?B?MG5EUHRSeFBHRmE2VWVDWnkvbjhpMHB1RUpPTE92OHlzTXhNK3RFeHQ4d1FI?=
 =?utf-8?B?QWJMcGVPQnV4d3UwSnRWWWdpTGZ4WUprTHRQc3dXQmpDTlJUL2VoaEFoKzgx?=
 =?utf-8?B?ZjZ5alZSd21zL3pvOEFJQk83djgyN3phRzNad2RBbHZPbVVBMzY5YUZLdlBO?=
 =?utf-8?B?YjNEL1pCRnBsWnladndORm0yMG1RYkVRVGVZS3dMNUcvNG5FQlBBYTBWbm5W?=
 =?utf-8?B?Z3REMUNHaUNiTXF4ZDJCQ0tSZm1xclp6enRPbjFrY2k0ZVQ2VWlMMHlKYmhH?=
 =?utf-8?B?aVg4YTNFMUcrTVhQamFwNmR0eEFEY1BFTjFpMmZpdmpYUVJGR2FYNVpPODJ3?=
 =?utf-8?B?VUpqN3g4R1g5SEc0Q3VkeW5KMmp3MDB4bGVSSjkwZzF1YjNqcytoVGtOb3VU?=
 =?utf-8?B?RGFyUHBRUWVrUjVLRHpUY3Z3WmVEQndwRVNsQS81bkVyYTMxYlVPL290RlJG?=
 =?utf-8?B?WDBwa3MxRFI0eFBTOWpKT3YyTWJ1UDRaUHZrdFVyb2VmaGkwaS9NU0s3SDNH?=
 =?utf-8?B?R1lmQkxESHBNQUt4azMwQXZZazNyMlN5cTRwb3k4QnBGUzJrdDh2THVBQmlN?=
 =?utf-8?B?c1grRktEeGw1UTRseEN3RlhVeHJRSzlVUjJPNXpKOFVzWG5FUC9xcGpmZzly?=
 =?utf-8?B?d3V6N3RMdTFpRDJsNWZXRFNoOWxjTnQrR3F4WlJqVjFoNTNkRHVuZlBKOHBJ?=
 =?utf-8?B?cmhKcnN1UVM3Vzd3Rkw0ZDUzZjBabSt3My9CWFVhanFmaU5XV25QVlFhZzFn?=
 =?utf-8?B?NDF5aW54dkRJK1l1bEJVNVNGSHhDSWluSHRKS0cwcm13dUpqVkUrTXNndDRj?=
 =?utf-8?B?V3VOSU5zVHJ3eWVtZCtUNmowSDY0eHFrQXJCRkcvdnFDTms2VFZ4eXNrRnIx?=
 =?utf-8?Q?cFOorVRCvbb9DYgS4scH8vdcUmahwhBmmPB8/WI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d2d5ae-811d-40da-31e1-08d9501f873e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 10:24:19.3800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+jaITcV9dVNSpkSl0qnU5B2oHK0ysQ0mRt9WM+WRVrDPm3aD1pBuGJR/KarYEw7t7ULcFQc5dd2Cxy1SQW0ohUDJPJzboIxytbR9/xciHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6102
Received-SPF: pass client-ip=40.107.22.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_NONE=-0.0001,
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

22.07.2021 15:26, Max Reitz wrote:
> An error does not take us out of the READY phase, which is what
> s->synced signifies.  It does of course mean that source and target are
> no longer in sync, but that is what s->actively_sync is for -- s->synced
> never meant that source and target are in sync, only that they were at
> some point (and at that point we transitioned into the READY phase).
> 
> The tangible problem is that we transition to READY once we are in sync
> and s->synced is false.  By resetting s->synced here, we will transition
> from READY to READY once the error is resolved (if the job keeps
> running), and that transition is not allowed.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

