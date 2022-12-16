Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE78B64EDFD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:33:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Chf-0006V3-IZ; Fri, 16 Dec 2022 10:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p6Chd-0006Ua-QU
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:32:49 -0500
Received: from mail-db8eur05on2072c.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::72c]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p6Chb-00036R-6K
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:32:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTJ0eY4uuo6FrzeM8mS5taqupuI4U8wthdanVuZRPPxaAvMe+nyPi1uJpe44eQdwygWaM0/OEPV/1UWgv7clemYLE/XO3mIwDsS5gHQVH3I/C7D5NF6F+/g7mZPrUvmQSunynzs5QT3gEKG6xItbWgwribXf9RioZsDz1KawrFqbSu/NvjIf3WYUs/0ZNh7hpUfQIUO+HfDhmCshYiMKjDW4KmPiPhtnOk5dATIz4Ayd4GVaOYI3LSHVF1UhBx3HOZm/71Fsdc4GvbpdTgbd2pSQjCMF4BTm1paQaTCdOjl+zizSW+tSzBOTbY65pbYWLR/U+Vf36NVKz7IifYxKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evqm/+sbj4c08vLWKwTk53PwUIJ2L7kry6xDtDPSfiA=;
 b=LTloEt9MlnORDIm3xOCNbsBHBKmDT+NSt2nx58MWLhvxP1afug+4ZOf7MUjlxLnpZSPeJi8TJHuIZXukwp5gT8qUUjLC5CuNG0RN48TKEqTLhAyTNeMlTJ9FX/mMSAdlnW7FHe4mkITl7KWlTDARnpdkU7E/pYQwjlMzxDbt7hO5Er2rzIKzPrZtOHjMzZFlfsRIBj3wj6UO5TTibZW11u8SXAi+j2zjmdb1ZNzYb/S2IfNIj/KnxSX24SbGgY7gSol9claFI2ll3CD2pQNeY2ri1Z2ycHttLy1KwcLmrM/1pTk37BTf6x3PGVpUjxaPXDqbHIzTsNE/k5rnTeexYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evqm/+sbj4c08vLWKwTk53PwUIJ2L7kry6xDtDPSfiA=;
 b=KzZ31jnhl0gNve8p1mj6NDDd6qbh22gqq9e+HB6+jvvF6P1ogv6Q+/rd3GLjt6gsX0QUnFiVBHKzjjD6ASlXAFp5sdilsyp5qjHQ5ynKTAAoJ+wDPYcnaEv/cmpW8FH0MGpS0aTk0xugrrcVyBcW0w+JQtkDWlTWJKxLZQSJQCEDZKl99LUX7elWXmf/DZY3Il9gKRggNH3h7nFGZoo9YqFskfBG1xcQbSGcoNsaGBmjHY+Kiq6bS7AgtHnciyWjE32HmWCOmP5CwNX8yYI71QP15RbyMkO8jpKxrSgeqm7gfJb8WZC+3VVCUVRvhAdneys7coTM5tbtiqcg37Ci/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com (2603:10a6:205:e::33)
 by AS4PR08MB7455.eurprd08.prod.outlook.com (2603:10a6:20b:4e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.5; Fri, 16 Dec
 2022 15:27:38 +0000
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::d342:b36a:8ff5:8156]) by AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::d342:b36a:8ff5:8156%3]) with mapi id 15.20.5944.005; Fri, 16 Dec 2022
 15:27:38 +0000
Message-ID: <6730d84c-5b2b-d902-9f17-16ef33708544@virtuozzo.com>
Date: Fri, 16 Dec 2022 17:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/2] qga: improve "syslog" domain logging
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, marcandre.lureau@gmail.com,
 Stefan Weil <sw@weilnetz.de>
References: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
 <a0d15083-c257-6170-a3c7-2baf1ec58a9a@virtuozzo.com>
 <CAPMcbCoEfeZW0YQRN1To6zdGEP4g4GV3PBS9EDGqs_dYFNTF4g@mail.gmail.com>
 <CAPMcbCp0Q9v5vfPXLyHoacQqcXrYLKb=jWmT4mX9krr02CkQaA@mail.gmail.com>
From: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
In-Reply-To: <CAPMcbCp0Q9v5vfPXLyHoacQqcXrYLKb=jWmT4mX9krr02CkQaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To AM4PR08MB2932.eurprd08.prod.outlook.com
 (2603:10a6:205:e::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PR08MB2932:EE_|AS4PR08MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 31802972-f63e-49e8-8b30-08dadf7a1080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FBeUvdsFFyGOmcq7ztOViO6s03g5qeX5WPnT500Vj+qKmBqb5PUewa0rEu6WyYL+29Z9GCQWYSp2CsPlOGNbdwDBOtmCs6RdRBxdQD9CfvWFVSjuyCoLl+HhvHiQCSeJl31Ye20iQcHepxiKrQVJwrspjYO+aTkhd2r/usQtbumqWmnRtcm0FQvsVlhkgdYQSZa2IIfwrEdS/XwTGTl1bzjaGclbAh2H03FxrOullQb6vA7MfJsHGvDsYyLSgi5bxoU/2Y1ndUEaXCJEAKqXFsciRPIDRdWpuV3jR6buPBSUOwKi9pB/CkD+jFzcjyHlBv8L9ZJg5iTYdvb/mx6ie+VasnhwfP1drIzbYUQkNAPpt1v06V1qIRutC6CdBoF7BEgePAAHqSPJeoIG4ZxRtrE+7p0HcD/cIA7UdpGhC1gg+b9ppUinuIA5Nc6d73Kn/purHAOF+p75Pgd8GC5Qr3A22zkIW3WmUUAuy+/T+dxfMjPCwuDyEiNkaPCz+05mmpMD+pWDXIemx50P+6UtEDbDSB4BY/DRzCEFYmn0DcsY2A0FYd37/7qUU8EA8Ce2HftlvSV8ILAa5/4rWPnr/aTOCxxZFrk3+6nt89VFyPKoP2O99M4nBJaHLfYIFLAAAZD9rS7tF7vwJPlDImdVeJ6ip/rUMmkHuC02m8xMONXKiJ3rYt+oRLGmCgy5IIo4tbfa1un0vjiWWWt4UG3NCD80E9mOuPYQdeerDSEZzoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR08MB2932.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(451199015)(41300700001)(8676002)(83380400001)(8936002)(44832011)(4744005)(5660300002)(66556008)(66476007)(4326008)(38100700002)(66946007)(2616005)(86362001)(31696002)(31686004)(478600001)(6512007)(53546011)(6916009)(316002)(186003)(2906002)(6486002)(36756003)(6506007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UitqMG0zS0lLdUlwV25yS1dleWwzMmwyNGpUeXpHVHB1YXhoSjAyYms3MERM?=
 =?utf-8?B?WVFWeWFkdVhwRndNeVdleFRLNXdsSGR4RE00MWh4dGJjYUVNSXJvRVgraVdK?=
 =?utf-8?B?V1BWaUd5SXFvbnlRZ3BuS1F5aXFwRFdnTFNuaGhnRUZNN2JnQkZkY0sxUS9U?=
 =?utf-8?B?NXYxS1RNb1pqcWloRnIyZXpQbnF4TmRxMjJUVTFrb0dCTGVnZkdPa095N3FH?=
 =?utf-8?B?Nk9hdzJMdHlsUEhMc2lQdnFXNlh4eHFqMmhXMXp6YW5ITWJZZHp2c2N5Q2NT?=
 =?utf-8?B?NUFWS1kvMXg1dWxLRGYrR3NaeXhpbFhaQlhZd3ZYWC95YjBIZWNuRm0wZk94?=
 =?utf-8?B?RXZHWlo3amNPR01QajZ4YjZkdFBPVTBjcndzdkxJNWdPdG9TKythS3g0L2Fn?=
 =?utf-8?B?Rjh5cHRFVjhhZHZibFovWUpBVWMvMXEycTJ1MG9IRXdDWFU1N01FckdMT2xO?=
 =?utf-8?B?M0h1UmthdmdVRGxvUUhlU2tXSGphTEdKdFk5TlJWbXRvdGp2L3lDZHVBMk1x?=
 =?utf-8?B?ZThwSjdPRmdqWXZmZUZSSWd1c0xKMXc3cjlmWEIveHRrN1k1UFNNdmVkMWNO?=
 =?utf-8?B?MTRLY0tQWDI4NWtZMVVVUU1wdDJ2Szh6YWpIU2s1OGZoM3RCd2M4QnNuODVP?=
 =?utf-8?B?aEpzenlUczNyTnZJdHFWZGtsWWFmRXoxclllT21PcHZnQXNab2VEcS9tNVlh?=
 =?utf-8?B?NGZNN1FlbjlHMS8xYVpVQ2RjZ3ZaRWxUMEI0dHZwTzBLNzNyeWhFWXNyWUlv?=
 =?utf-8?B?T1BhUmNWdzQ1MEg0eUlJcWl6NTUvd0NZT015eCsxZzhGTnJmZ0dxSXFEWjBq?=
 =?utf-8?B?SkJSUzhCZkswcEZvYU1mNk4zU2owWHA5aVIyOFl4VjRZZTVzL0RWN2I5WUtO?=
 =?utf-8?B?Y3cvZ1FmVWdzYVNjOUF1ZjV1MEhGWVlLTVAwdjByYVdnNGtKOGJyWGUxZmtY?=
 =?utf-8?B?eDJVOG12SHZOeUNlSzBVeHhxemMvOWp0azZ4QVNqM01oVm8vUldjRTk3U3BO?=
 =?utf-8?B?T1pSS09Xd25ibmpZSEVaQ2N6dmg0UGkrWjBZUlZ1N0xVYjFySFNrRlJiVGlm?=
 =?utf-8?B?ZGhVV3VXcFJjalV4aEpqR3Zwc05JR0RtVEU4QThnaDVDeFdLRTNoUGtzYzVE?=
 =?utf-8?B?VzljTHNWK1dFQm8zSHJ5Ullhc3V5dzQ0dnh0WEhhZ0JxYW5wUTF3bm5JMmJ2?=
 =?utf-8?B?R1hZSFc1Q0o3VFVYNU9YZGdsTEFTR0grZjE0b3lBUlJBRHpSWnZQdnZlZHNK?=
 =?utf-8?B?c0FxRkprWUwzRndrOS9XMEIwWDVUTG53b2s5SFduZGloaGNSb1U4RTlXSGtz?=
 =?utf-8?B?NTdSMnRIQktBRldaY0xqaEhvRW93OG4vVGh1QURoUFk4VG5QVTBzdUIwbGVX?=
 =?utf-8?B?M2pnK2NSMXdJcVdUMTJlZmJ1TlJELzlyeUxKMWFWOXg2QmJTSUNVNXFLVU44?=
 =?utf-8?B?VnI2cGxhWXZDQ2ZkdjV4NVk4YXkzbHFBU25kTVUrNFJ6UVNndW9aelZ3emJp?=
 =?utf-8?B?eUU5V2Z6Q2hMQUlMd0JBQlFKanhXTC9WZ2Y4My9xWkphSFpKdEMwUVBsaytE?=
 =?utf-8?B?SmJveDJyUTNNcWc3NjRUSGRHS3JoaFB2WkdQNGhBMHBFemlYN0FJZ2RTM0Vu?=
 =?utf-8?B?WXJ0NXp5NDZzRkpRMWhHNjk1dTI0SU5wT3RIUWhDUjRRbGFNVjJ0ditCcWM2?=
 =?utf-8?B?VU9nNW90KzdnME9rVUtqclltb2tRMmQxY2RTamlGSjg4TkQxbkdWR0h3QWtD?=
 =?utf-8?B?SkthVWl5azc3dXNCNzUya01xNDdNcWNjTmdvcEozNGJiU3FpcVkwSFNDczVJ?=
 =?utf-8?B?SExtd2FBaGtkRjI5RDBvWHhaQlZvZXRSMzFkTWJYSUNFaExvQkcxNEJ1RlQ3?=
 =?utf-8?B?RDJXalBVcEhHUHNIeW5kRkVTUjRLS3dpZmtML04rVWdZRmFwcnVNYVZPZ2xS?=
 =?utf-8?B?akQ1NGJwSVExMTVXRkk4ekhsL3JuTGNwNmZVVjJTb0VSZU8xVlp2U3VRTEFl?=
 =?utf-8?B?MjFrYmdra0dPc0Zpby93SDZ4OXdqUnQ0VHdUY1BGNTl0cVlaTzQ5Z0hqQ1RW?=
 =?utf-8?B?aDJ2TXo0Y0kvWWsvM2p4TEpSL1JOZ0dsZU5PRFY4UE9NR3VvQUlkM3R2S3lu?=
 =?utf-8?B?aEN0NEM3cmsvd0ZicGdiUlJuNXJpaEdLbHFOeHlWUExQR2YzZk5vNXFqQ1Fp?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31802972-f63e-49e8-8b30-08dadf7a1080
X-MS-Exchange-CrossTenant-AuthSource: AM4PR08MB2932.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 15:27:38.3616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyod3rlqc3mby79d7V8tN60+RHmeN3x1lN85KwBkmBSwB6vkWnSfBbzYy/cc81inGraWxLt0A0wY9Acfuog5xJYi4YVehGA2zuVwcn/riHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7455
Received-SPF: pass client-ip=2a01:111:f400:7e1a::72c;
 envelope-from=andrey.drobyshev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 12:01, Konstantin Kostiuk wrote:
> Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com
> <mailto:kkostiuk@redhat.com>>
> Tested-by: Konstantin Kostiuk <kkostiuk@redhat.com
> <mailto:kkostiuk@redhat.com>>
> 
> 
> Hi Andrey,
> Do you expect Event Viewer to be empty by default in the current
> implementation?
> Currently, all logs that we write in the guest agent do not have
> "syslog" domain
> so we will have logs only in file.
> 
> [...]

Do they not really?  For instance, I see quite a few such calls in the
implementation of guest commands:

# grep 'slog(' qga/commands-win32.c | wc -l
21

They just need to be triggered.  For instance, if I build QGA with these
patches applied, run it in a VM make a fsfreeze call:

# virsh domfsfreeze win2k16-qga-win
Froze 2 filesystem(s)

then I see the message "guest-fsfreeze called" in the event log.

