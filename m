Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B74B373616
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:12:31 +0200 (CEST)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCdy-0002f5-Bm
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCby-0001Yl-1W; Wed, 05 May 2021 04:10:26 -0400
Received: from mail-eopbgr40090.outbound.protection.outlook.com
 ([40.107.4.90]:55598 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCbu-0004sJ-HY; Wed, 05 May 2021 04:10:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MU9upBkOQd/0C8i+4H64/b1KL8IMIpFDL/yHKz9+fgKiV9gOJvFxaObPx8/y+i1lRYbCj80sMEfgkWzDU14UDe+BjO+JraiuczOcRcvXQHLHWsvGH+zCvMNqJeSH+/A8Mj1IlENl0ti3MT+ayHI4vKFv6PiuHoFHFwAGl31SmnkkHAmwYdwd/33N3IEhyQbntG4aTB1mUEkr49cjb4bXtFUN6UpeuLUmqVHNviUzAC6jtWjqFZPtXFFMAWFucQUD0r2TA3d1becvAAssq15OXRWTwTffwsmci/V98exhvmgbKQCRQqdqY6+BkGgw+/ZtL/W8u/i74QWeD1mgZeSCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y76/LzSVWG/jhuL9xYfLK5OiRbkXT4rrTDVXoJAS3w=;
 b=lnjwBqGM9K7jiF715fhHgAM33u23C7Gqktfr0q3zssLo3lwooZGga1kaiiQk8urJhfIzmRr3etSilNIPhoAHB5o3yrBQ1Njlx8X/sA6phDcTQOi5CgxCQ9nJKkkntqxGeXgM0/p7AQYrhhFaZhgcCBIuEomkTeiRbgzYzYTpC+BmwSNBGfhVMmmxlbaelnUQ0GR1ncWwfO7lMpx96FGUoWpWOCzPcyl/jcQdQljj1z1G0DtobqCcScCsf2K9dZ2ZAIH/POjh+LGjvfcVyX59S3po/XHHUvx6dawioVTA+kFf9RBVaxFTVvyIBxfCHAPXcNbaoY7EF/AzuRzUwCvXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y76/LzSVWG/jhuL9xYfLK5OiRbkXT4rrTDVXoJAS3w=;
 b=gC81kfXtKcKZ0PRfYL8oRENQXFTGTADt7cnlcJDaLF8dB/yvYTHr3QIk0BayLoWqo6JV9rk72KIk8E8hh4doFNr0Q5UswzLJiAaVcQ2YQBmIjmKKDoy/JF6KBXTjR845lis/4DWzX38KBLmSKJivbEoDjl5R93wxaEB6yhRnDOc=
Authentication-Results: gluster.org; dkim=none (message not signed)
 header.d=none;gluster.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 5 May
 2021 08:10:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 08:10:19 +0000
Subject: Re: [PATCH v5 00/11] 64bit block-layer: part II
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, sw@weilnetz.de,
 fam@euphon.net, ronniesahlberg@gmail.com, pl@kamp.de, berto@igalia.com,
 dillaman@redhat.com, namei.unix@gmail.com, integration@gluster.org
References: <162020201176.26740.1388132003306753260@d887ba82c771>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <01580bd3-cc2e-f00d-9dfd-eb0e94ade5b1@virtuozzo.com>
Date: Wed, 5 May 2021 11:10:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <162020201176.26740.1388132003306753260@d887ba82c771>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: PR0P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 PR0P264CA0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 5 May 2021 08:10:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e08cac7-73ed-4cda-dc15-08d90f9d392d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3158F8826C28CB4554C2DCBEC1599@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EfagGrMtUAT3EjemnOoSUyqbuZZU9My/WkR1+RhL3paD0iriRQzxiEgBEruLD+YCeMjrTYKTFxv7OHZQDcgchLinFGjik/v7FewnmLvbRrwak/DgCaJr8w/lsz9qMFsQXNGxiZiJupiQx6/q+ID1E2xR8D4Ns7StKpPXXF3NhtOzuPgJPGUx5O8FGvcLcOP2Ne1A8d50qdEue2y1Tehju3g0U9m7TbFgynJTFjq9PW0LLOCad2NrjIDbNnkOggAWCwPbQMA5EiNdwvnlq8R6fZelNZGNj5uaGB+NIkqOMFZ0xdDWuCGedUUAHSDAHHdXdTi6ETF+RXKtJQw/Gln7PVDKFR5OqWNv///Do7EfuVIVOSr9ZtgOi6GFk8aZbVyjkXmviBVxem/Rs+c5TMnnX1J2/1BegvXGKyNbz8nwTSLokzm3x4DjAzEfm82Z1XCc6YVHShZUkdYo214yi0xAXGt0TMwcMt3R40KybRWFGeXTNIetqhIa0upuaKnmrWB6EataoHTIdsstqTdhPbLIadHKGO/uYC2S3AtnQzUhlIOrO2+xBcfpw5CEIfwngTkeMQne3EA7JHHIWcd1t0f/CWdVszsk5Qc0PPy5H8BfT3mUBvBa/pYxl/i5pb57l32B/vJgovG4MtJyoim4ldoNvQkyMi7WozYrzMo9mFFyckUzxWyNA+v2ol11LvZDEXVOZZtFhdpH9Vgs3Y+gC6PQdEVPsqH6FhCFNBlLzsOstQ1BaoBTACj4pmh5oZg/nWnBYqzQRr769qvfDLs2JFNkQ0LBgjTIsBsVWJgNuM4NfWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39840400004)(346002)(366004)(66946007)(16576012)(2906002)(8936002)(31696002)(956004)(316002)(66556008)(478600001)(38350700002)(5660300002)(52116002)(31686004)(966005)(26005)(38100700002)(6916009)(7416002)(86362001)(16526019)(8676002)(36756003)(4326008)(186003)(6486002)(66476007)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OTZyVGFVT3hwL1JtaGdsMjB4dFl3R1Y4dmpSUFFvcnVvOFRhR3V4c09OdU1s?=
 =?utf-8?B?a2NwdXhuNXlEendUZ0NhNHRHRlpqbEV0RTIzMFcvdngzZ0U1dUFRdGJWbUNU?=
 =?utf-8?B?Z0FXbEFzU2tRb3ljV2tqWmRvcmhwdjNPOHdxK1VXWTd2amRsSkd5RlRBV3di?=
 =?utf-8?B?V1BISTFaUWlJT3p0K1FZYW1qSEFJUENCQkhScGZ0WEtSNERYWkxubjdtZU95?=
 =?utf-8?B?WkVoOWdrc2xUV2E0SjBhamhQT1lLZXk5aGp5UGlPaTJKSXNKaTB3K2ozZFlm?=
 =?utf-8?B?cEJtbU9iVEJTQWlENlhiQlBTVWgzNGVUOXNSNGtaRGhQMitpUkE0UE1xVFdn?=
 =?utf-8?B?bjZyQUw2bkFMVTJqZHUvbjNsa01FeXNZS2NIQVBuWTBVa3lzNFUzOEl5anNi?=
 =?utf-8?B?bDhVV1VyMHRZZDVCT2RTb3VpZ0FGN1liTnF5SHgvMHpQdk43SktTK3lROXhC?=
 =?utf-8?B?ZnhjMk9XTWRXMzRrcXdWc2ZLWWNzZ291bDVMeSt1UE1takxQQTNsZHFvQ2Nt?=
 =?utf-8?B?ZGJMZk9oUXZiM3lBVXpSV29ORUpyOXZqNzJwVnBJWm9WVDZmNnZxN0VHMjEx?=
 =?utf-8?B?U0lBTFFVaVd1Nk4yQmt5R2VxRk9hTW13M2ZUWjk5bm5DTytEcUUrclNBdllZ?=
 =?utf-8?B?cU52MnJTVjdzZFZuR0xTK1JWdlM0cmV4WlA3SzdMQWhSUWV3WTJlTC81Yncz?=
 =?utf-8?B?R3RobHAxU0luQWtia1lBY0FvQXJHN2I1VS9rck9qKzVaL0tPM2Iya293MlQz?=
 =?utf-8?B?TGpoM0Z1UTVPTGtBaCtGNU1mSnp1OG1pTklKMCt4L2pMQjd0cVlxTnNqa1Ax?=
 =?utf-8?B?RTcxdlRlSmw1R3k5U2J4bzM1MnQvQ3FNQTF1RisvKzg3RVcvTHplNnpCNUhW?=
 =?utf-8?B?dFlCblJWRjlzN0JOdDhnaWhPcERvOW1uTVVFYkJRNVE5Q0FEbHRDb1dodE5k?=
 =?utf-8?B?b0o2ekx1T3dEeHEzR3c2UU5wWDBPOXJ2WnJzYlN2REdHbXpKZlN3Qkx4ODhq?=
 =?utf-8?B?YzNyUWIyTlNMbmRRSWVMWkgxWEcwOVVRSzdpalgydElKVXZ3Y2VhNFVCOXlu?=
 =?utf-8?B?S011QXBBTlNXR3BRZEJvMGdacGQvMThqcjdKZ203Qnk1Q2MvamRzb0N4OTlN?=
 =?utf-8?B?QVIzUEFRNWRmK3dsYytjanlVQlBDY21yL3hkR2RiNHB4VmYzS1E1d3EyM0ZR?=
 =?utf-8?B?R2dkQ2JIK2hiaGpueHFHQU4xcWxySVpvYmZzYmNJTkU3Z3ZvRk01T0FmeTRR?=
 =?utf-8?B?UDRZSG1GcGxpNTJoTnJYbEVYQzdoUUFDK3hsZmo5VHFxWm1udldhMVBKQlhm?=
 =?utf-8?B?OXoweVZyWHdmeXFsWTg0V1ZIMkRkbE5VTGFDQmUvVWVab2l5WEl2QXFISW5H?=
 =?utf-8?B?SCtad2dHSjc1Ukh4NE1INHUvd0tDSUY0aGRTdGlVSUF3RDdESmdodnB3Tkdn?=
 =?utf-8?B?TGF6OFlFZVdHQ3YzaFlPbENBSTBxSmFUejZVeURsWWZhVnk1YnNkczJaUUZo?=
 =?utf-8?B?bmo0Q1lDMVdoaXE0VklWZ0J1cTFuZi83Yml2dE0rWStKTVEwS1dSTFlaMlU1?=
 =?utf-8?B?UmsvcXNuT2Vkc1czSC9pbWw5QVZBWHM4RVlrQ2k3eEswWnVMKzEzSlZUNGZI?=
 =?utf-8?B?bUdlSGVyTkJrTjhYZEo4aWJuVnBmTnh6bnFKZldyNW1lU09Ca3EzVk5SMlJQ?=
 =?utf-8?B?YTF4ZGJ5TDZqVWRSNGc2NklEQ2JNMXBRSTlqZlQ4Ulcrcnc4dXgvcExKY3B0?=
 =?utf-8?Q?yGQ8UMVreIwHX/GO5yEKratp/emvUHk32AtamkR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e08cac7-73ed-4cda-dc15-08d90f9d392d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 08:10:19.4628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRuvvLfhZKc/wXw4GBpWqpxkAuBuQGjk1wW6vURjfPMyW0pQXlWC5FcJDE6IwXTd5QBkGXi/OrRUBFEPvH+C4Ta6Gw/59UjU/Qs52GX98BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3158
Received-SPF: pass client-ip=40.107.4.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

05.05.2021 11:06, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210505075001.45041-1-vsementsov@virtuozzo.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20210505075001.45041-1-vsementsov@virtuozzo.com
> Subject: [PATCH v5 00/11] 64bit block-layer: part II
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
>  From https://github.com/patchew-project/qemu
>   - [tag update]      patchew/20210505045824.33880-1-liq3ea@163.com -> patchew/20210505045824.33880-1-liq3ea@163.com
>   * [new tag]         patchew/20210505075001.45041-1-vsementsov@virtuozzo.com -> patchew/20210505075001.45041-1-vsementsov@virtuozzo.com
> Switched to a new branch 'test'
> 3700aaf block/io: allow 64bit discard requests
> 54ba548 block: use int64_t instead of int in driver discard handlers
> 7a3aaa5 block: make BlockLimits::max_pdiscard 64bit
> f80faf7 block/io: allow 64bit write-zeroes requests
> 4cc3310 block: use int64_t instead of int in driver write_zeroes handlers
> 136dd63 block: make BlockLimits::max_pwrite_zeroes 64bit
> 03a7c45 block: use int64_t instead of uint64_t in copy_range driver handlers
> 496fe8b block: use int64_t instead of uint64_t in driver write handlers
> eefb31d block: use int64_t instead of uint64_t in driver read handlers
> fb7a119 qcow2: check request on vmstate save/load path
> 23ba0f4 block/io: bring request check to bdrv_co_(read, write)v_vmstate
> 
> === OUTPUT BEGIN ===
> 1/11 Checking commit 23ba0f4a09c1 (block/io: bring request check to bdrv_co_(read, write)v_vmstate)
> ERROR: Author email address is mangled by the mailing list
> #2:
> Author: Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>
> 
> total: 1 errors, 0 warnings, 42 lines checked
> 
> Patch 1/11 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.

So, s/{}/()/ doesn't help.

> 
> 2/11 Checking commit fb7a119cd9aa (qcow2: check request on vmstate save/load path)
> 3/11 Checking commit eefb31d480b4 (block: use int64_t instead of uint64_t in driver read handlers)
> 4/11 Checking commit 496fe8b2e7ce (block: use int64_t instead of uint64_t in driver write handlers)
> 5/11 Checking commit 03a7c4534a58 (block: use int64_t instead of uint64_t in copy_range driver handlers)
> 6/11 Checking commit 136dd63cc723 (block: make BlockLimits::max_pwrite_zeroes 64bit)
> 7/11 Checking commit 4cc3310d243e (block: use int64_t instead of int in driver write_zeroes handlers)
> 8/11 Checking commit f80faf73a84a (block/io: allow 64bit write-zeroes requests)
> 9/11 Checking commit 7a3aaa587314 (block: make BlockLimits::max_pdiscard 64bit)
> 10/11 Checking commit 54ba54860b4a (block: use int64_t instead of int in driver discard handlers)
> 11/11 Checking commit 3700aafec1ff (block/io: allow 64bit discard requests)
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> The full log is available at
> http://patchew.org/logs/20210505075001.45041-1-vsementsov@virtuozzo.com/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 


-- 
Best regards,
Vladimir

