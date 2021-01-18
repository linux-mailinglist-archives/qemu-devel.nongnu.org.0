Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052C62FA828
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 19:00:45 +0100 (CET)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YpY-0005oO-2B
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 13:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1YSB-000205-OU; Mon, 18 Jan 2021 12:36:36 -0500
Received: from mail-am6eur05on2096.outbound.protection.outlook.com
 ([40.107.22.96]:10880 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1YS8-0006lX-Hd; Mon, 18 Jan 2021 12:36:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A14b2Hrv75Oc8I5koncuK3sKzFgcRX79IVvESMxRFrvtFZ0609q+u1mwcA4knIZjemHTNzEig+dtN4UPGS1dp1mDodjY2MGy8YMETXGpAkL50tv7VIPurT019kpceMGvD9Sg/gRW1ywMzm/G7bRmkSZ59kkLxeEg/d3GEhjDCBwfUBgu0qmF7HhuIiQv9mjTdI7fEqsokdrVqZK1aqMODfEMPkVFHtQfGKC/l8sszrsW4z+pmujWvr15RetEslwIHHuHqdmf2kbP6u75npksxUVFYa74BbOq6RND8VAmW4oOeCig0KEz40KdmJLQU0WWTRKhz/gmBVFkG1MhOI8dSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QK1ZZzGFFxdiYqBgfkLpiPsJjfZ2GYp561onn8TE/U=;
 b=S3nb58e0Sj6dGW4edYhCTgLm02cEwPkHLclnH+RAgjBkJzKtzNicdR1DmyCB93qIaDdL+sLAhumaMRQGRXUbgJkW80WBuy+KvaG2XkKqshntJIhv678l/m/EOIcSZaAd7YOz+YvBNDNFDkAbPAFiFEFlWqL5TQZvtUYEPslGoUmvKuqWaALrQQPiaLflm/NkjaTk/53VY89os6W4jDxgUaruYgGoWhcCa0dAcFuVii2UTGNPcgysNzxHIZCAqE/kwzWIOJQmByyIwLcLqN6l1EmE0ezLElrXZN3KRD1wVpvqQ0yZWqksy1eX1rGmeNNcRcMqCVOvzQk/GVn35ufTyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QK1ZZzGFFxdiYqBgfkLpiPsJjfZ2GYp561onn8TE/U=;
 b=tG+H4TnD6i1qSLeE/Y2HLE8b9hAiuCbTxq2pFJKXuaOlMt043Sav9SYGi0wFRkTWidcS8YMRsVio5UHWeF0tbdTklaOtFEtEU3csf8QH7xvFUHgEeTei0nnPVobDLNaeQislN9S12L8f9MRrJ3CG5KXGXDD/Va4c1/QAvvM//xU=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6357.eurprd08.prod.outlook.com (2603:10a6:20b:31b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 17:36:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 17:36:28 +0000
Subject: Re: [PATCH v2 06/36] block: BdrvChildClass: add
 .get_parent_aio_context handler
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-7-vsementsov@virtuozzo.com>
 <20210118151336.GG11555@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9b7e051b-3a8b-f7cd-dc55-ee24add46677@virtuozzo.com>
Date: Mon, 18 Jan 2021 20:36:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118151336.GG11555@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.76]
X-ClientProxiedBy: AM9P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.76) by
 AM9P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Mon, 18 Jan 2021 17:36:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a06dd5e-4288-4ed3-5151-08d8bbd795c1
X-MS-TrafficTypeDiagnostic: AS8PR08MB6357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6357B60409B7D894D2EA3FC5C1A40@AS8PR08MB6357.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUtsle6zABV11/jTaHgXvPO3zVbUBQDcZIg7ONOXBkJ9TfRKF51h8OR5thkVd4fL5Lsv+Bf9cpRzH1ewo1d12vRWXpiC+Ucc5EkRkRzsv0UDE9Pmob7qjWV5ssQgaJ4WI75rCFJyUO0haQulpQ6rgkj9idB+7hNf2FksIX5w+/1DQ1V8ROiNTGW+SKYjiGUfWc3rg7mfTMd8fh28uq6HPnk9koXDnxYpU5EsLSd1LKiSKHqkX84fMaN6uOmnyn4LwyipLyb1EdLznDt99ovTRmtM/KI7xfurVedUaJB5/79DS2PWL0azH6aJqLB/SHXps41o9ppEBYLXjjE5vVcauwKEhKMH5dB/V3sZ8muRp4Cdc1/G6609Lb9RQfRKnY+avo61Ff0E7FZEfl6Hmu60E+D4lumQiTs3Z7+BxA5JZyfcSRSGI+0GSrfQooI5A7A6rMx3FApA60QMZ93goLzRPvNsNrlMSp6pWoG9iq38LCC1UOBsKAEiYIgYAmCjh+ILmBZljyGPP8XxPWsQbRcxR1JjuB4l43IABemzX9fPpDDFMCOWbNAH74scPlaCxCXouil/S2oreyqesF3p1zYn6UaDqZgyjE5lqIw9z+Bblagx1pb9hGgyiUww3/FgM3s9Hy1b2heoi7hv/RXPglb8XA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39830400003)(16526019)(107886003)(186003)(26005)(478600001)(31696002)(2616005)(2906002)(956004)(86362001)(36756003)(4326008)(31686004)(6486002)(8676002)(6916009)(5660300002)(52116002)(8936002)(66946007)(66476007)(66556008)(316002)(16576012)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2RsUmtENVZJclNqS3JjeHJPcG5iQXkrNmhxL1poNTVRazJFQ2x2MGhTOHpm?=
 =?utf-8?B?WkR2a0NqeVZwbGxEcEI0ZmlUYktaRzREN2xKSjQzMjcrYnVoejZYbnhBWUVl?=
 =?utf-8?B?aGFNamhIQ24xL2YxajI3RHVLS2FzVUYwdHZIUkNyZExlZ3ppZmY2RlMzQzF2?=
 =?utf-8?B?QnZIWm54UWYvZW9DTTlUaUh3bmRiSGNjRHg4NHp2VC91VHNkMURNYlV1MXdu?=
 =?utf-8?B?Z2pkWUZrblVZZjU5d3lMN3VKMW5sNnJsM1hCTnNtUkNHZk9aUXcrbzRSWTVq?=
 =?utf-8?B?UmhEU2MyYzVsdWIvRXQwbXFUUk5qdEpuNzIrTm5iZEkxWGVqc0RyVVVoSXJD?=
 =?utf-8?B?ZFNIdDBlN3lPOHlWZEhjTmpiZmJJeitWK1RyTi9LQmdDNndzUjBSR21BYjA5?=
 =?utf-8?B?RC9IYW15bE91NnVZcHZDRTRISVpLeEFnNkcvZU5CN3VYV1ZpYlNIelNlQlo2?=
 =?utf-8?B?T3JSVHJyVHpwNk5hdk0vWmkwRC9qWG9PQk8yM2xpV21PUHFGbElrODJmVFl0?=
 =?utf-8?B?T1FhbGs1bXN1azNqdzY0Rmh6MzVUdFR3VnptN2xvNUw2QkcxNHRPM2NHZG96?=
 =?utf-8?B?Vko1T0FvQTB3aGk4MmwwejBRajN5U0dwalVsMk5IdHdNcHNqM29QYSs3OWFW?=
 =?utf-8?B?clpRWUdHN2xWaFZ5SHpTb1FiVzZ3ejVMR3JrTVhiRklZQVNCdjlQMUhZYWdZ?=
 =?utf-8?B?VHBFSU40QzBMVzZEa1dsdmxuWCtDVTNWTjVjZmcvNityMVpxSDVUZzEwcFpZ?=
 =?utf-8?B?Q3ZDNVJGZ05KdkRwTUR2UkNOTWFWcU05L2hCQ1FBamIzMkd4NWtRQzFSY3Ix?=
 =?utf-8?B?L2Rjek1HSFpmWnBmdlVMbTR4YllWZTRldTRlWUUyazR1blgwZ3NjWmxIWW5V?=
 =?utf-8?B?ZmxLTks2dld4N2dOVUtJWFJva25LZk1BSkZWdG5hNXA3WWNXUlpHMzE4eDVY?=
 =?utf-8?B?TTdOalpSdElOdjBmMXlOVnNydzZHdVRVSU1wajVoWXdZc3Z1Z0lwczdnKzdT?=
 =?utf-8?B?ZlV0U2w0NlNvWXluamNzZ0xUWXdGbzVMTDFmWGg4Q2hGT3l3MXd6UmJNcTFZ?=
 =?utf-8?B?bTltbllPdGxxOWJWWTNiN29va3R6MzdWUmh6eHVzbFp5NWR3Z05ZVnF6U0x5?=
 =?utf-8?B?NVp4ZEpyUUdhNC9BbGdwQ2JqMmx0T3cybFp6SFIxck9HelRxWWxWU1VJQU5L?=
 =?utf-8?B?Z0czd3d4ZWRuN21QN210eUU1MGZhMDZjaS95KzN4OS9NWXdxU2VHVmUwaWhN?=
 =?utf-8?B?b0NUWitadm04RlI0RTEweXBqeFhsTzZnRFVuOW9hOTZqcGJqN1dSQzU0MEov?=
 =?utf-8?Q?YmbA3yLizLfhLnrgHjgfIAH+DiJj4lw98A?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a06dd5e-4288-4ed3-5151-08d8bbd795c1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:36:28.0117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LqUcgw7HD1RmGnOHgGLugk9ayXTjyW8PzCDvTgmNqfaWuaeM7nF2Uaea3JAV7nsrae/2tc/yCmyTPSl71BjqLVvPPen/AaDZBD+Fk0Ganc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6357
Received-SPF: pass client-ip=40.107.22.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.01.2021 18:13, Kevin Wolf wrote:
> Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add new handler to get aio context and implement it in all child
>> classes. Add corresponding public interface to be used soon.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Hm, are you going to introduce cases where parent and child context
> don't match, or why is this a useful function?
> 
> Even if so, I feel it shouldn't be any of the child's business what
> AioContext the parent uses.
> 
> Well, maybe the rest of the series will answer this.
> 

It's for the following patch, to not pass parent (as opaque) with it's class, and with its ctx in separate. Just to simplify the interface of the function, we are going to work with a lot.

Hm. I'll take this opportunity to say, that the terminology that calls graph edge "BdrvChild" always leads to the mess between parents and children.. "child_class" is a class of parent.. list of parents is list of children... It all would be a lot simpler to understand if BdrvChild was BdrvEdge or something like this.

-- 
Best regards,
Vladimir

