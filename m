Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC7F36DFF2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:53:38 +0200 (CEST)
Received: from localhost ([::1]:37866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqFd-0008BK-KG
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbqCe-0005Xn-Nv; Wed, 28 Apr 2021 15:50:32 -0400
Received: from mail-he1eur02on0715.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::715]:63726
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbqCZ-0004k9-2S; Wed, 28 Apr 2021 15:50:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYkmEPUUXr3DgwoKqEylWU66TAnFS/Nd4gnOr0mT1ccxutYnBjzIHyo7JL9QvQgfQKb/GoBSUVV/iDT2RdR3n0Gk5Bdo7Ut73C7GVzN0QEmdPyFVZih2uT2staK6rLMlb1rnZYR+b3iV9rcHquwL+xvavUAhsyCJtVWF0uutWHj9/vppiQ1Kb5Pk1hwqW5TPc4UjoIp+slODSTROk8W6JN/V8m8tbL9u6N/PPIAN4L537l1THnI6lErcConKM2t4gtQQZV7O/nW8hmBG0mMBFQ6ifj2jJIlLewqdRmrVKszM/sfuQ8kFqSIpjhnVbECLa533fjgvUshsHTfWCsCu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpFk5hA5HjI1UWYPyKu2x60xNRGc3ah1t541hmfH6M4=;
 b=CeRtBJe0E6SvTo8V/IIleK0W8MZwGWwDHXhemm2UVDy/M/RkRBOivXXxc5UsZMKm2RadTuqxyIPGi1ja58BJczDmlEx/5wq1f88rT7wX1VqtXazBPG3E7qgNI7LFDW6IrsgrF1bM+hz//7zaJxwfznDQaynA5HyHkxYsgM+6Nqww/md/TfqgtvZdIVLZHQsHeMM1YnP9BtAnQ6W01MqqJja0EwUyLEUx8vvSy4QJMg9ewM3c+2UP/o7/4MAO0IBfpKhewmAlF28I3NVccODn2jhHkP8C057zTfv3kcLtTZYcY4+mlwjbl6pMKI0qlTjD90oUhT6e3JgZbo/Iz09D6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpFk5hA5HjI1UWYPyKu2x60xNRGc3ah1t541hmfH6M4=;
 b=jB3SDvXbwZhFUYdXV4Py3E6jrMRNcAe1erE1ciN7U7UE66IvzKiszVKAXzw8d01KOYNjG4BkvBctGY21U2/wWtnb6RmJDtd73822sTyZ/wREhO1ADTLxdDBVppjcKc/eu0L/o5WBRbwew2l0sXwEDdF9CpcLqnVpaCa9X34AdYg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6948.eurprd08.prod.outlook.com (2603:10a6:20b:347::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Wed, 28 Apr
 2021 19:50:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 19:50:23 +0000
Subject: Re: [PATCH v4 00/36] block: update graph permissions update
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, jsnow@redhat.com, mreitz@redhat.com
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
 <YImVYUQbIZC9T3Pz@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5dcd13aa-71cb-dccd-bdf2-20a024685aca@virtuozzo.com>
Date: Wed, 28 Apr 2021 22:50:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YImVYUQbIZC9T3Pz@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR0P264CA0272.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR0P264CA0272.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 19:50:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d6456cc-576e-414d-7b84-08d90a7edc7d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6948:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6948EA47FAAB86B28D2BF99FC1409@AS8PR08MB6948.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZhLJmm05CMapWEmjUKnQ9/naQEC5VtHovpOsU2xsG64ykYFK+46GWfdVCNtt7gh6NzUGONqtKSeIJhTXJe+PIjyQC/rVyvPoGoayIs2Py3+3RMIOZQCDCoABgqG7+L8zNkzVJ4eA6S7CGdqtmyzxfRNErU2/91U4dL2T3+l81S8SCPyO8N6CCRFssqp1vrqla5JzwX4k8GZfhyDTMTaOcO4kENsVVUF8YjcyBy2yJEpODtNTjJWMNisr8j0UNr7uaTSfBILvH/NEh0XcetfNdx63PRryIopUD8X4co6cgTfKS4AQMClqOOCInNCxOwH9oBaLbBfIf/57410podJS5QP9e2sS8IqFkdLQHqk1wfKNVcyG6bqxTv+kPmYa7w4RqhXL3u6cw+dntSmCQWadXi76eDYML4JkQ37zHDMJ/1T3S0HHC4jCGF2KNnDm2x7XM29yoBYCWKzrrXk8NAXEpslnqCLMw5GfA4GKZXm3t2F4nlUntrTDPNzidv8HXkCUlpgTXuaWpBVaJBSgXPc9yFCVFNKfvAZ+OAGPf4ctJm5jl9tqk4rwtp1lh7BNDh658okWY0eWXDhDSBGkIPzrFWU27e22gTd0ZWgRdBCClYKNmKZICP2HtaWCgg+ZIcXq5FYIeN81F8qfjv1bkT9hfTMozvQy1G+FOKvIyK1vXMcKP7OSFfDq6hQpNA5zBjICK4pXrBi9esEysZrrzO/IA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39840400004)(186003)(6916009)(15650500001)(26005)(478600001)(5660300002)(38100700002)(52116002)(16526019)(31686004)(66556008)(66476007)(86362001)(8676002)(316002)(16576012)(66946007)(8936002)(83380400001)(2616005)(36756003)(31696002)(956004)(4744005)(4326008)(6486002)(2906002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDNCN0YwTVVMeHYwN0lyWGRaUFV5ajdub0hTalVLdnBwUGhhWHNWbXU0aVFJ?=
 =?utf-8?B?ZENBMldOYit4Y3l6U0lkYUxEQklTVDdxLzdheFNBWGF4elB2bnNvQjBWSjNH?=
 =?utf-8?B?Szh5S2N4cVBBR3BzdHpJS2JZUENEOHZwVW5ocjZqQ1VGWEcxMS9qTlIwQ1Y5?=
 =?utf-8?B?S2VPbGJNT01lVEUxajNkWTVGdHVlZ0Q5bkw1eVE1NnA4QnpDN1RsM1FtVVl3?=
 =?utf-8?B?MWxDTStkRmZnTmhSQ1VFYWludG9UQkl0MGdocGlodzlDM25DS1dGWGVlci9k?=
 =?utf-8?B?S3dLQzQ0bXVmbXJraHMzQndlMnJOUE5SWWh5THBkYkwycW9EcHNwMG42RUt2?=
 =?utf-8?B?S01rTTRsVTg3dlpHUUx0d1B0K3l5MmJZNm5neUx2aFVNUnZKcmhuM1FXZFBq?=
 =?utf-8?B?emxwUFZlb3pVcmgyTmlTaWhsWTArWFhJNnV6TDFJL3RNVGxKcGoyUWVESGZC?=
 =?utf-8?B?TzVYT1hKemgzWXZTR2dtWFh1YThpbGpUaENoQ0IrN1hldk5jMXE0STVQblk1?=
 =?utf-8?B?cHRvUnBrSU13aDJVSHNEUGt3WThVTjRvMnYzaGJFa21TaU1hR29JRWhSNHVJ?=
 =?utf-8?B?SDZqR0sxYm5GVEFMM25wOGZMbkJxTnpkMmFhL2NpS3NROVNoVEMxUVMwbjQ2?=
 =?utf-8?B?a1FWd2JyQlpnRFZBMUJ1d1BFZlZCZjg5VHdjTWdTWVIzRG01ZHVQL1cxYkNp?=
 =?utf-8?B?RXNmd2t4V2ZkZjA3STJoUit4WTdweGRpZ1lWc1Bjcjh0NlNRcnNwcWNJSEhM?=
 =?utf-8?B?WGMvRWJTTWk4clFEaURTWVNHU1FxZXpEbXpvM1VXaE1RZnBxY1VVSjYvcm9B?=
 =?utf-8?B?Y2E4SkZwRTMyemQ0MUxxSGV5RHhzL3RvSHBvTnpLMGdBbkcxNDdzdkxycHVv?=
 =?utf-8?B?QmYyeXRIY01JR2lmZlBKWk5acy82a2NCOUhMckdyRXFMM0hPYW9nN1NLMkJM?=
 =?utf-8?B?bitSZWdqVys2L0hkUnA2M3lUc0xoemZlVnVReFFYN2c1WjdzbVRPRXhJNEk2?=
 =?utf-8?B?VFVSVnlUa0pjR3VPZUgvUVFWRWgvZ1hGUDM3SnBUZlpPZFVKTzJtdFpTODRV?=
 =?utf-8?B?V0g1RERPVnY2S2wwNTRtMEpxVGZpeHZ5UEpnMWplTHZkbHNBMCtxMGVSb0p5?=
 =?utf-8?B?YkJaN05TL294ZElaSXd3NHlIVGtxTkpySlRFVUd6Y1RDbDVpRTNaeVVDL0pq?=
 =?utf-8?B?RVU4SVdWY3BSZjlrWklFemx5RHNCZGdwZm95bitSNTZndUo1UDFPcVVBUkc0?=
 =?utf-8?B?NS9uMnYzN291b2h4OG52K3pnVHdCTm81cDVyczZXbStEVC9lK0JnYXBXRzdj?=
 =?utf-8?B?N0pVS1BVNFBzOHdsdlVWcVVxek9vb2xPSGpOZEw2Y3JVMmlUNlQ2N0dTM01k?=
 =?utf-8?B?Vmh3VTlXM3ZlK0lIRGJGQk5UOGxyVlRpNnoydFV4QldJQUpaNE9yOER6WTRD?=
 =?utf-8?B?bThYdUxxcTREeTBPV21uai9qRXpyNGtOYk9udnV1cjVPUXJPYXZ0Vm5pbHpj?=
 =?utf-8?B?c1BiNXBYWXFnWVQvcjl2NUpYWTN3NnpUWDBucStBR0tTT2lHb1F2R1ZjcUFV?=
 =?utf-8?B?ZkNGRHNnSGJ4a1E5WUpSRGE0OXVmNkd5T2JXVzFVWUNkbTUzK3VSL1c5Z0xS?=
 =?utf-8?B?WVdSVG5iUXhzb2E1Q2phTDRGWkFEWmFSMTNnbkE3RnJOSVdUSWhOWVdxejZt?=
 =?utf-8?B?T1hXZnlIaUErZGplNHVDRmZKa2Vmc290dGp0bWFvajNhdXd5bHNkRi9DS1BT?=
 =?utf-8?Q?QjHfVO/ztjqk+BitBGdOfpKQv0eh8Ul8VZot8zK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6456cc-576e-414d-7b84-08d90a7edc7d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 19:50:23.3478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFqIK6rUnBTyLJ6I8gfuQdiiE5iVdzY3Zpj31/lRfOFsp+tS4l4ti5uKqIEamFsRc4KOF7CpwTBokZuatSf7F+eFs24ZxA8Wsvkry7h5y+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6948
Received-SPF: pass client-ip=2a01:111:f400:fe05::715;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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

28.04.2021 20:03, Kevin Wolf wrote:
> Am 28.04.2021 um 17:17 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Hi all!
>>
>> And here is v4.
> 
> Thanks, applied to the block branch.

Thanks! And thanks a lot for reviewing!

> 
> Though the error message shown by the test in patch 18 does need some
> improvement on top. We should probably name both conflicting users and
> who blocks whom in a way that is neutral as to which user is the new
> one.

I'll look at it next week.

> 
> Also, curious that again patch 7 (and only patch 7) got From: mangled by
> the mailing list. Seems there is something in it that Mailman doesn't
> like?
> 

Very interesting.. Curly braces in subject maybe? But I think, that not a first time I use them..


-- 
Best regards,
Vladimir

