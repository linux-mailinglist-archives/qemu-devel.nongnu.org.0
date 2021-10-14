Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590DA42DFEF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 19:08:54 +0200 (CEST)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb4Dt-0005dC-Fy
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 13:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mb4Ba-0004Uo-F3; Thu, 14 Oct 2021 13:06:30 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:13542 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mb4BX-0003MX-Gs; Thu, 14 Oct 2021 13:06:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlmTfA75rNpEwgZfDtiV5Be/cEKqZxs4P2NSA83pMx1yQfzlgPyxM2E0mFsadzbgu1SNpTVDmY1W7keoLz7Io8b9hoV8OprOD1AliFGVAid2hmz5UeuCzbF8YVeNE0CAf09NLCKBvqmL4z4kfSczxhAEe5RycXvWITptN8e1TLp1dK19t2AENz7nB2ruUE3K9TTWwE0f6zwze83wkuRToccv8NGqOyPtiiL+HhGsm8DU3gIbpWmjP9c8XJYssYnqq9xYn83pVQiv0R7RfcbTgOOetDhXpxMBxQXAMM25/kLil2qUvMp/iBWS06yJoa6CczcgH7Gs4SACwjj1VbqcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZWC0z3VV2MIF/tZUmGVyB3UvBkUbBuCigEJAzC38W4=;
 b=TDp2dBsoUv7vPfrCR425DtIB72KJHXMMIKcJPZxpASFkWIB0RTcKopuSJCsTeBf7qMqprt9XVBc+aEOU9egukYB0vsZGvyk9MXsTYK1hTT8mqovnuP5bhT4iK+XlVI8ekbxinh24nZSE9LhZYBicwtGW5Ai89sz5e93sG80GbLjKy4JTfvCEvY4ElXtSZErJFilQDsaC7HYwqAEtAueBuFa3V7XBGjuHaiYPRHDdoU1D4d1u5LPtgXkpBQJOMqoDBxcTXarySPX3hxN7lndJrih4rcA2ZAhojyrGpNo9A4q6d5capB2ai9d0fr+dqXX2FxOPnPcDhqEhnIYBOqjOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZWC0z3VV2MIF/tZUmGVyB3UvBkUbBuCigEJAzC38W4=;
 b=aK4zVTNVgsqCCpZCXEXYB4nRMc+aLCDT1Ens/QvOPFFwFtf74S+z12z3f27Y9FhhxtZFGe4VVtOBlceFZgTQ3k7Q/J9382+0mhO9qU69oo2c3/9KvpHLkTJGNkeLhP3IOzZ1udIpovgvMMtJayrEfoWhcHvGEp4oXt5ATaCOr+E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 17:06:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 17:06:16 +0000
Message-ID: <03050cee-603a-9199-9f24-59cfa6a7188f@virtuozzo.com>
Date: Thu, 14 Oct 2021 20:06:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 6/8] iotests/300: avoid abnormal shutdown race condition
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20211013215748.2154908-1-jsnow@redhat.com>
 <20211013215748.2154908-7-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211013215748.2154908-7-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.43) by
 FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 17:06:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40251a6a-037d-49f4-7a04-08d98f34ef7d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690DC8D47B9A57326EE461AC1B89@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fbwmyLuKSiv0tqaSuuafZdLKmWTTOdSwKhrHvvqpIxUtd/S3/c9MSu0hnawD0UyluWPyvQXysem2WDvMmLqBiWszLkUgSpIX50QeEd3bCYxMm/U9+BPihUlTdfVCBsabBMGRdUH8idFXfy6QMgH+5Aq1gkw0K/S+wp0c5/goT+cHCrIQVwB0UQJM9Xz9cpwjoj9QbjgkNiwdOOj5KnvUjykUXPGq3VDtQ09B2hjG0+L3uc8S5YHRRo1sTHn0aFM7CNFN8MmO+i4hjrIqwiGDp5iSxqtbes6ceG22gz0KWXQHfRFx6mT1CG+95YQ4Gls0Eh5c30Vd3glDFP6dRP9PIPV5tajUEDacDUcV0lvfKp7s+no20/B8/6KFhE30oJrYPi2Iqv3PSBo5UEwyeQUG2i0oQT4ivFIMRS50sJ4j+mv0U6GEKZpdCDBzaojv50VAhKlBv5mUISbN5tD61dopYShoEicRRgQSdRadSnArfWkkaSQjRTvcjM7ashun5AL3z3YL4Pk7WjJYxPMW1ZA3k99RPBhA9wReOqwn3EQBmhYaJ4bXRk9+ToyuW8u+gfSigozOymOsbFcK7LVwuGTtiHlmEhbeWts7G9Kpotq7ixme0+Uxox4h2yLxNit50zflue4eiykhXoyoWFI6adzBoGPYQaQW4ALrxT/lBbG0x5Rn8VCn2/kex0BYFj3dkWbYlzBQ8rql40V90mRrIe4//wArcIS9GN/7D7iyFZBMSLeeN3QNlmNmmvTXo8kh+VpTj15Ft2lbNAQ38sid4HWFjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52116002)(5660300002)(2906002)(66556008)(186003)(316002)(26005)(66476007)(16576012)(36756003)(4326008)(8936002)(6486002)(66946007)(83380400001)(54906003)(4744005)(8676002)(38350700002)(38100700002)(956004)(2616005)(31686004)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0tGQjdlK1dFN29FNTduVnZSOU5IUEE5aDVPaFpBTUs5UWhNNkdVNTRLeWpU?=
 =?utf-8?B?d0JPUmpCd0tTTnk5RmJQa1JoVXltMXBOTDlyRkNtVEQ3SFZ3TkgxZ290Y24z?=
 =?utf-8?B?NEFMNGpZZW04b3FrL0dRYlIxVURKVEVWVlFzNnM4alJXcE8yZ3p4TzNENEJU?=
 =?utf-8?B?KzlDbmVVS1JZRWRtR2VMb3gzRVpCWWpVN1R4eVlLallTcTBFS2tsWXh1MzNJ?=
 =?utf-8?B?RGJEOW5kenlHSXJXbnZNWVowZ0F5LzlFUmZUOVI2QkQvaXFFU1Qxd2ljNUxP?=
 =?utf-8?B?bURUSTlsKzhGb2FKOVZEeVdHRk5kcTloM0tTWUsyT29oZTdpWWZIRG5XdFYw?=
 =?utf-8?B?RDRISS9WMDN4dzI3VHJsRVp4cC9rb0pBdURXa2lWNEZSc1JjYUp4elArV2w4?=
 =?utf-8?B?STB4eWcxbktrV0pEbEEyUHBDRHNlalRYRlRnOEI0UnNTYm5ralJpb0xGWFBZ?=
 =?utf-8?B?dFdXQXFKeHZsMVF1NzkwVzl5RzVnV2cyQTFEUVBUd2hQZnkwR09wYTNkaHMz?=
 =?utf-8?B?ZU9zOW9VRk45WWsrZ2R6bXd5OUxGUUtzK1J5RlVna2syR3lZUHNBNkVJUGZ1?=
 =?utf-8?B?eFhzNVBnZjRXbEc0WUcxWHZzcDYydmZJamJpN2YwakMxRjZ4cXFaL2NzSHhl?=
 =?utf-8?B?L09lZy9sY0VVU2xVbk1pbWNNZ0pWTHlObVpUYTd5czVUQ2RKZ0JhT1FkTmdY?=
 =?utf-8?B?VFlQVmZBTTJ1TVJLK1JXcG82ay94azNDa3BFY3o5QkVKU3B1N3BmNFN5dy91?=
 =?utf-8?B?U20xRHNVSVo5K2YyeUpWK2w2UUpBU3JPUXlYSHo4WTVqTS9FR2k3algwMlNw?=
 =?utf-8?B?cEJ6UnM1dWdjcDllS0xqSFNNL0xGWGk4dDEzbFc0cnFWTjZtK0JVWFV1d2J5?=
 =?utf-8?B?RTBTSUdSY2h0SzVmUHJrYmRleXF4elR0TjhqRXZwVE9HeG45eWZONXoxNWxw?=
 =?utf-8?B?Q1NJcTZjcTNVTWxZT3pTZTYxZjl5KzdMeERlUk1wWmpSYkhKLy9OdVV3ZW8v?=
 =?utf-8?B?U2NieDlETlhUNzdZellpczNzWTZwS3hJc1NFcGZNenNiOXk5LzBVM0RiUjRS?=
 =?utf-8?B?Z1ZJZ20rSDZkTDZUNUJNUjhmc1hOeHpPdDR1WGFoZkVnUThJTzdHRXE0VkNF?=
 =?utf-8?B?azkycFlRVys1NTlQdFh5eHhScEFyVys3TzRldjVsS2laREE0b3lhT3RPWTFa?=
 =?utf-8?B?clpmK3MyVjFSY1hrZVZ6ZlVkdWhZTjRKZTgvUmN5bzlDR2hjbDlMYzdpaCtW?=
 =?utf-8?B?d3Rid0kyV0l6Szc2UjA1QVZDR0FXV2ZDTDZVNjM5UGp3T29PR2d4dFVMeUR6?=
 =?utf-8?B?bUxrY2ZyNGVRNEx4NW82a0JCL0hSSjJzU1lmamRqUFY5NkN3U1cxdlhETUtP?=
 =?utf-8?B?KzU2RE9uS1MrREV5VHljaXE4ZEZUZG5rZTdkWlhrR1BmZlVZNlR2UFQ2dU1q?=
 =?utf-8?B?aUo1Tk4xYXJlQy9FZzJua2htMjhxRE1CV2dVWExaeUZQVks3UmhXWnJRWDJp?=
 =?utf-8?B?SGgrV3ozNmNKS1Y0dFJqNzJJYmhYdW5tQVdPK2dCUjg4d1dFaDdLaG00Zm5k?=
 =?utf-8?B?cFRuOE1wVmIrL01HWlNtdlNYSTFyWWF1MnBvMjhqa1RsSWRmSWF0NVkwRGRG?=
 =?utf-8?B?ekovWDhKNVpPL2JUY0ZNU1cyQmZaa2p3dTBGMkpqRDJBTzBPK3dhcjF3Wm5p?=
 =?utf-8?B?UEhHMm5ZZTIyS1hybW55ZFRBNk8zVjVKZXA2bWRxSjNUMEVrU1BIbzJIV0JI?=
 =?utf-8?Q?O+yJY6FQGkGpBB7mHtd+zpdDAUtkq7dKwotED0K?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40251a6a-037d-49f4-7a04-08d98f34ef7d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 17:06:16.9710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgYTwMIFhbMexoMQrzMiPotRavFMrrKnpxYAhZIcSZ1wqMtCU6alBQbz1RnW9iCLXBMUkuNVi+CX/hbPrJNsMo3VbGR61be6NSj+tCn94g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.8.111;
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

14.10.2021 00:57, John Snow wrote:
> Wait for the destination VM to close itself instead of racing to shut it
> down first, which produces different error log messages from AQMP
> depending on precisely when we tried to shut it down.
> 
> (For example: We may try to issue 'quit' immediately prior to the target
> VM closing its QMP socket, which will cause an ECONNRESET error to be
> logged. Waiting for the VM to exit itself avoids the race on shutdown
> behavior.)
> 
> Reported-by: Hanna Reitz<hreitz@redhat.com>
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

