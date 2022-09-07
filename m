Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82AC5B0A34
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 18:36:04 +0200 (CEST)
Received: from localhost ([::1]:59248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVy1z-0007yH-9u
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 12:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVxqC-0002sm-Ib; Wed, 07 Sep 2022 12:23:57 -0400
Received: from mail-eopbgr20095.outbound.protection.outlook.com
 ([40.107.2.95]:60741 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVxq9-0000hZ-Ng; Wed, 07 Sep 2022 12:23:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0LGERXXdFbU06v6S3IjwA9UJLfE4BCxQM8UUK58MXfcIsEk/wG8Ag9y7YaNu+FAU173xu7NadiO/K0rLqfm9ISeIFfwepaR3CFm+kR/tZAtgdAQfqvlG/FrpNDte7r0xDkMozWFMgoRP1BV3b1OALYzMygOv+3b0kIdT9/goIDXf9NN6GPvLHJR1rmEzmdIJIyoOgzcsWLsNuk+JCBI4hffBslKAJYhhKaqI5wz1j7vmXM04t3Ougi4mrc47vgbBuERdsYdexLP+CQzdu7L+S1wIfmsK9+ba0vlUvUy/92YZJZfmk1gvwykmEHagZul+ijEd8adQU9YBkcwymlp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHasdFkNyO8VJJmvGid8/Wci2RdpFxdG0jEhaMGzXkg=;
 b=hKDrBWLtloHgRpuAaljB0gmrUXquWXXsAf6eixjBsM+K/FjSP1PyENK6sfGz78obCzXx8122bB6SG5nRzgX3NNZYRHkmv+q41S7EW7YFT4FZ4ulAnCtNIQBedH8ZBvB7W8tJgRLS9jBSzdMPEuoxFNgfl06UJXXvsTf/PJKkINhEZvkuEpDMUZYZsc7gxiN/iHNwk3tIuA/RLhwiItXETtgB9uXz2aJLR8HIGrPRJyg+Jq8qBATNWsZywP8e9I/L/5kAWfCnCAOlBy0QCfvLeTOITc9zDo+9JltFLZzgR0a+qgkQpSkn97IHdWUIhusExC+ojdiHjl2bg84K35puiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHasdFkNyO8VJJmvGid8/Wci2RdpFxdG0jEhaMGzXkg=;
 b=d68WjZOk1GuyZgu3w7i7RQVBHSVBckrz/MuOrl/9tFSfGK9my6DLRoduvhvz/JIfvbYEgxYtUTCT1ho/066ItQiM3msYTcI/fRqdmXKmSjgJ/5EnHF/fiqs92KvhNFKJJtzDvFcQzJzOAB73f0PlTP5nug6JZFK9B0gFDvaUFJfEA4pEWmG4/MLrByR97ShARJjl38S+6CSWwaQHcw1azu8JYNbXciYZh6qHnAXAAUY0/aSGu7LB6Cz5GqStnoE3ZB4C5N3Z8r9Sv9/g5WpCXJWN0fgZ0dRSCgMd7DnSFMp5rZWQwPr9VVloe6eeObf8YXy91nqYIzbBqBu1TQgyPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by GV1PR08MB8378.eurprd08.prod.outlook.com (2603:10a6:150:a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Wed, 7 Sep
 2022 16:23:44 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 16:23:44 +0000
Message-ID: <02354f58-9de5-3c63-a1ee-fe3859bfd441@virtuozzo.com>
Date: Wed, 7 Sep 2022 18:23:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] parallels: Add duplication check, repair at open, fix
 bugs
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:803:104::20) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbb487b8-a455-41e3-b670-08da90ed55b3
X-MS-TrafficTypeDiagnostic: GV1PR08MB8378:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IIxd8edSsjVbxCx3+bDL6LceSTyypKqf3xtciFP+JUhEycX6C5LGhRX3cObKoBpub4ik2tt6yikUb0INi+N7JF9+XZsSiQtl+JUFS0qmp7KJsaBVokSxEggb5WDyctDNs+9GQDgUxmSOdNMeBNZFsb0IX+eDrZDhPnmXweKnjn2jlvUV5MPJEzdtvbkluzJXyLu1ArEQuFBvk5xY7Eh9//+ngeJUs31Uh5LEUsn7teKbfNaT/bl7h3E+tauuEPmUTjhNJeQ1LweS6tUCayTHPgct940JFe6UlJzTqzJUZkXMfE7rznZAQgUfI/UjzXnuwQmYd/E3ZK20dnVOu3/t/SYmwzEcu44v2hSbqtMtJwct8/yVgPXxW2Tu40krSOsx6KPl2IytW825Gmle2nbPpPWSfxxA3k/S59sHbfutbxK6b33l7nUI5iQAwuw7Xq9wec/4q343wK0lQ/oDDrK3dvw4KVMqnfSNm73/pEvCKBvjQ8k2e6U96ONAl2nJOtHNviqZWBAnwYFXAthSy9EM59nLtJIiND06x5Q7OouhP3AiHERERMyTt5DxppzSdgslmup6McJoP6O5BHdJ2KnieWSVnLAHQi0y9Rrkjny+Xj5nVg75MosLTBrG6AxCdqhNTjsvYgt+i5/d2W3DI2er99lHrZtpDN1axT6P66DobgqZdH657JIuW7UXxo2XGNsAm91fB2nsKWR4hNHDaybRY8dm6ABcgWgOsZymJQOV1nLuzn9TuPKFCt5v32fJom/eP/VDxjdDs+5wYMr4swcTg4vkZI7shGE3CRWPQVCclbSyaxNU9V/Sx5+8E9fLwROSpjg2tJqEmt9SPiGQ5dpbI5lPXpkpzauHqUbCVeaMmx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39850400004)(366004)(136003)(376002)(66946007)(66556008)(316002)(966005)(6486002)(2906002)(478600001)(66476007)(36756003)(31686004)(86362001)(31696002)(38350700002)(38100700002)(4326008)(41300700001)(53546011)(26005)(6506007)(6512007)(52116002)(186003)(8676002)(5660300002)(2616005)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUllN3hKamE5ejhCbldVOXN2cjVraDg5US9yWjBzMitpSjlmTGpiTWtmdFJq?=
 =?utf-8?B?aThWUkZJdnlESGxJL3JSSWZ3ZWlYeVQyRHpZQmtzZ25TdjNCdWM0NWdiM3JU?=
 =?utf-8?B?Tit2U0JnQjVCRUNZMjhGVm5DQ1JyQmI5UmcvQzZVMWNBdVZhc1B3UXNjN21r?=
 =?utf-8?B?SnM5azVMc3hiZmplYTYzc25icStDMFFpZ2ZsWk5qRlRVdHBDYzFieGkzbWF5?=
 =?utf-8?B?ZnVqQnlwVDZjMnRnNUFsakxQZlZXUnJldHVtTVEzcy9WamtJL2NZamVHS2RM?=
 =?utf-8?B?VEFTb2ZDTnBPTTViSmNTQzRIbS90ZURjOFpQUGs5RkltMk4yazQ0Z3lEbTMy?=
 =?utf-8?B?MFIzK1lwS2NEMkM3U015dXg1MEJTeG9QV3M5VEhwejU0NmZmMU1SZE11S2Nn?=
 =?utf-8?B?MGRKS244Sm0vcVZ3ZEpaR21TUnBIOWJFRjA3aFNhMjRLWWdsbTUveDhXQm9q?=
 =?utf-8?B?RSt4dzFTQkZSQ1ZrU2dHNUVjMEIvaFBHZ1o0b0pSME9ZWWhaSy82UEtqaFhT?=
 =?utf-8?B?cEU3REFheXZ6MmlRMjBqWGdtZGptZDFZOFRoeVhjNVc0WHp2di96Sng0d2Vs?=
 =?utf-8?B?MXdFaWgxeHJBdTlmVVBSWGkrOWc1cWtpYzIyL2p2YlpEUDFDOFkwbmtDRUor?=
 =?utf-8?B?bEhzUXlZSnd4Tzlad21qTjUvUHI1M0M3bmhDVVhNeUtZSmZQUUFXTUZEVjc1?=
 =?utf-8?B?cWRDSjg0bzF4LzdHZks1T0QxM1UzaUd2OVhkc1hTMXY2YjZoblpyVXM2VStm?=
 =?utf-8?B?Zzd4enpiT1FJRS9uT3c0WlZKZkFCTTJ4VEM5R3g2UjE3MDNhUS9yQ2NRKzVQ?=
 =?utf-8?B?SHUwdnp3Z0s2RStHQ0ZCTGJRTGlKS3Y1cDQ1RjZhUy9FT2VoSlZqRXVPbjFJ?=
 =?utf-8?B?b3ZreW9pbUlGN2xpUENubUE4TEdkMFRVZDY3eGpvdGpNdk9iaGZDZm9JRWhu?=
 =?utf-8?B?L3ZtTjZlTzhNYWROYnY1YUVjUUxYRkE1RENUY3V5RjVwWjV6Z0E4cVNzSWFy?=
 =?utf-8?B?QUVJdFd1d0RURUtkaDJSTlgrUEFDOERFdW5mekdGdXNGY2h3bmdIY1BmNEFC?=
 =?utf-8?B?MXFTdTVTNGVIMFlqaTlDclo3NmVrd3Z5YTBZT0lXTHNZRSswdXJkd0p0dmdw?=
 =?utf-8?B?Y0NGWTQyVVBvRHFGYzNGZVZ6ekc5TVhuK2hha2tPVTNOSTQzUlp3QnhzbGdj?=
 =?utf-8?B?RjJDQ3ozdHlaNGNUUXZSNERlNWhFdDhqN2g4QjJERlB3eHorbmxFRDhYNUE1?=
 =?utf-8?B?V1VMVUgrR1JicWdNT0h5dzRRWWNFeXdDYmVDTnNYTUxDTmRlTDUzVlRiSjNF?=
 =?utf-8?B?Zk1OeHJYUXVxNVo3Q0R0OTgvc0JENTAyUGlLRlp5eWdlQ0ZWbWRIbFRocjAw?=
 =?utf-8?B?bVZSSWpFRHkzOG80eFovc3V5U3hQV0E3bFYvcnc1dFIydFpiL21hM1JrY3ph?=
 =?utf-8?B?cmlIRkQxbXNsWDNzMENvZ2I4RU0zdkEvMHdVOHczdGRKeGMyQTRNY2cxcUxs?=
 =?utf-8?B?Qzk5K2hyNU9zMTRJaHFuZFg5dWhNOHQxZThTdFFGMUdjdXh2ZnM2QmxSSklt?=
 =?utf-8?B?SzhIZGh5MGZkbnZ0dkhRWWd6V2dSMnFTSjR0ODVMbDhGS2NKVHdVOEdZVHh6?=
 =?utf-8?B?V0hvdHFqT1djZXpKN2NqVEwwU3BqQktuampVV3RrVVFNaW9YZW9TUFdWTkpx?=
 =?utf-8?B?NWVQQ0hQblNWWnppbmxCUlV5T2psSlFSVXdSeENjREd4bUtuQTVHMlJySGEx?=
 =?utf-8?B?cTUwZlZiMGExcUVXTzFSazV1Z2VMUkV0d2kzRTN5VzhFQm81cHJpeThqNnJt?=
 =?utf-8?B?Vm1keVdnUXRiZjJrRkJLZ2pMWGRrYWtRT1k0azljRVVYdU96U1g4bUJaV09C?=
 =?utf-8?B?bVJ1ckVub2VhTGNXUythZ2Jla3NGYk1ScHE4VHYvTkVWMWFaMTZtZitWTDdm?=
 =?utf-8?B?MnpnK3E4ZUZFMmsrTW55b2owcE5RT0ozL3RKWDBIZlA3QzFwWi9KSTV4ZjNC?=
 =?utf-8?B?WU4xL3c3bUs4QTA3ZjVIVDRNdDladmNmNmgwM1ZRdWhYcHNpV3drLzBvb2Rx?=
 =?utf-8?B?aGJaemkzU3duR29waDVVQU9PN2ZmYWMzVnNJTExwYnZSRGRmMWRCR1ZiT0pu?=
 =?utf-8?Q?ppllgEqsfAB81vmBazv/NFXBp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb487b8-a455-41e3-b670-08da90ed55b3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 16:23:44.7086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHiEDRuJq7xR7M6C0U4pc5AVvO2Q64E+x1aLZZA7GUiJW0WMu7puiLW20DlgrzMEo9+aSQPjV5azhz0wBsBe+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8378
Received-SPF: pass client-ip=40.107.2.95; envelope-from=den@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/22 10:52, Alexander Ivanov wrote:
> This patchset is based on
> git: https://src.openvz.org/~den/qemu.git parallels
>
> Fix incorrect data end calculation in parallels_open().
>
> Add parallels_handle_leak() and highest_offset() helpers.
>
> Add checking and repairing duplicate offsets in BAT.
>
> Deduplicate highest offset calculation.
>
> Replace fprintf() by qemu_log().
>
> Add check and repair to parallels_open().
>
>
> Alexander Ivanov (6):
>    parallels: Incorrect data end calculation in parallels_open()
>    parallels: Create parallels_handle_leak() to truncate excess clusters
>    parallels: Add checking and repairing duplicate offsets in BAT
>    parallels: Use highest_offset() helper in leak check
>    parallels: Replace fprintf by qemu_log
>    parallels: Image repairing in parallels_open()
>
>   block/parallels.c | 297 +++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 241 insertions(+), 56 deletions(-)
>
common note - please fix formatting in the patch descriptions.
74 characters on a line, empty line between paragraphs.

Den

