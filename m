Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A246953D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:48:04 +0100 (CET)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muCTT-0005mI-Ck
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:48:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muCRS-000547-L0; Mon, 06 Dec 2021 06:45:58 -0500
Received: from [2a01:111:f400:7e1b::731] (port=61516
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1muCRO-0008FS-4e; Mon, 06 Dec 2021 06:45:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+i0wbZaWHufdz4bLVd45KKU+ZP0knwguPL22YAPFKRBPN9jijubJvq87/ReU64CFFpiZYAJLj8eBq+W3/Pqp0eqaw8H8J0ZMtZgJwPwrfAbw5RevgB7sSzizbovx5Mb4TtAFpn8iOOMjZQfytl+oHtz7VhLMTbrH/z7Gb9DfAB274fOol8Yy+e6Rs2THLfZ5x67d/bD1SCWCEy507ob/AQSXB0dUpPu9g/Y0sHk8RR4AksWdPRJx4Jg3M4XX6NfdfsJ6t3IRT+MOo3LU/xhjpEPVfdQpxJWVLh+y+SyR6Hk7BWpD8E/vulkYBH+BNYh80qQJzRSHlr1e/0XQQzj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDsLTH92tKiqKEWwkSqwIfu1z3eqXy6Dn6Tt2TIEMng=;
 b=k1dsEzn4CNbe9+6FoWHSowyX4yxwE3xc5iBl1bOJNrF7jwQBuOO3lzes+g5KVVEboAyQg33P0jYwy9W0IY2xm1uNuvHCeImXWHpNCLf7SlP6ptfkSbwqYccWrILUtEi0+6X/hWqrvrX6q/tZP0O6KggAR9ZQGwcPgkx60GPFjRc4An8kg5ONjSVYvv1/JyATaizODJ5/C+Qn/K5PAvro6WKhQunmESbCnBg/RY9hSN7N9o0/eELN17pUFS5rdV2Yv8Lv8T3r9FacdKXcEOUOJ2XkxWEmUxvqDHm26+tcksbmcn46/rixggEpGwhrymTmWZgZJeqxRq5mbSgaJrddkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDsLTH92tKiqKEWwkSqwIfu1z3eqXy6Dn6Tt2TIEMng=;
 b=ni/S9ifEFARkXNeYX/8pQ6fFUSxKbdHQqFeLue8C+yPjjNwqZfJ9PKetKRW/EOcRiwUtkC3wQq+S5JIYpwKdn0VYKxX4woA+aYdaMwZRjYqzAx2z0FA4zLfpMjEFJx8jknCkDNhsijLMYnpV3etpJQ3Yn++2y50/b0M9qBosYuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB6401.eurprd08.prod.outlook.com (2603:10a6:20b:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 6 Dec
 2021 11:40:48 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 6 Dec 2021
 11:40:48 +0000
Message-ID: <f05c680a-73c3-b0d2-dbdf-c0bcf1ca3530@virtuozzo.com>
Date: Mon, 6 Dec 2021 14:40:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, nbd@other.debian.org
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, libguestfs@redhat.com,
 nsoffer@redhat.com
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211203231434.3900824-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0135.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::20) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.28.1] (31.173.87.183) by
 AS8PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:20b:127::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Mon, 6 Dec 2021 11:40:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16bd4197-5f0e-47bd-042c-08d9b8ad3f6e
X-MS-TrafficTypeDiagnostic: AM8PR08MB6401:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB6401F8B60B6984BAF93C1364C16D9@AM8PR08MB6401.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+nXkDJk3rnxVKdbF3Xqa/Lfo2DHW4GgU6N45XoAJu0OCHIqpy26o9DsDXrczxbUDP4QSxpyICRWYlEsrqbqjaWbGiZEbUaOl/qwpOBf+acGlIGEPI46jJPVfDV6U9KrfkPb6oWZjvC0FRZLY24NixJIPqG0XCqswilb7JEUO3Oxpze04w/NOBXDoPonmU7prfJFfrn2oszMUZnbw9TIm7NmM+BRuYcmUH3kizZ8hM6MiGvPT/tvCZBCuXtfVYdaW9OeofTs8KEL7j44zIRbMtpprrkhBX5UYWBFEMbhwTeE4GFQfsndaGgyjpVyfQnHaiH3wGRe3Zbca/pqIv5E37Kq031eDfz4uU5z04hLE97cJXg6Kqqh+jL1tiTVaSHYukRQocIGM9NxEsAoOmsSUKYHQJpHjixY+EsG9YqCmkJIjLFq0Fm28jxr1AAQu0XctbNdOhgBBCv2Avord+60rykPu0RwI5EoikcEForhBAZPlYqhon6C3aoM93ABilfofvE0hL5msQtG8Yl8PKLk11kVTVT9eUlgOS+ljUX8fCJ4gl2XC1aVUW03pAr7Hkru7nsby5m1gL1ztK2V8IdpMAhLxno+s2DiXoVnTbZrpKSXkmq4LcrMK9TrJJTmeul/VLKuOYE9dLPev2Vq6WuUJcklnokLwEFbGzbeHy899n9llxG42OLgySOWfEg42SydF3qFVwn9Rs7P63TYgwyRUh5O7nFDf2hjKVLw0q7WkVPGbUpPLkHkqVcmTtbUEGBhSJH4ZGMUAITeg0cjWohkYgn3fo5my2K0cvEmx2Dx3qFvsFiXIEumhQL83dAYp/1z4LtoWy+rQr8ErQqWmoXHeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(16576012)(966005)(508600001)(38350700002)(956004)(316002)(4326008)(8676002)(5660300002)(38100700002)(36756003)(26005)(186003)(2906002)(31686004)(2616005)(83380400001)(66476007)(66556008)(66946007)(31696002)(8936002)(86362001)(6486002)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFVsTXpGUDBQYmI1ekJuVnNLaTlYaW03dGNKYnhmSlkrY3hMSlc0YWdEVE9L?=
 =?utf-8?B?b0F2eWdKUlQ4UWxXTHpNOWNxeitucG1GeXh6Wk1ENVl1RWJ2QkNVeUlxcHox?=
 =?utf-8?B?a3lLYWJFZXFEMEl1akdwL1lITm52alJGWWRPblpzbUQ5QWJsRFIrYTJLdkg4?=
 =?utf-8?B?eXBBUS90djlONXgvSndtT1FhUHhJYmU0bmMwOTdaZjFJTE5wWm5rOGwwSk5O?=
 =?utf-8?B?a1RudlNXSUxNRXdlTmNueW03RWRLbEFaN2FTSUVRQysyKyswQklxRVhZZ0dv?=
 =?utf-8?B?MnVRN0YxWndIdzlPVzFoTitIZzZYYi9lNjh6U0pxdm0xak1oeS9Qa2M3eW5z?=
 =?utf-8?B?cW82RkhGaGFtcXdGK3FueW4zNEZ5eW9hN05nQmJ1enhkWVhPbFVtaFlLeFhy?=
 =?utf-8?B?V3lYOGRtMTRSeEFKSHpGNHFZSEZxenRYK3pvZkdzM0ZLWHc3WVFFYjZPL1Br?=
 =?utf-8?B?YVpudEdpb2hIcWxuRTN6ZTBpbERUa3ZDOGFMUllMZEMwNkNNZGFPMlVSVlRC?=
 =?utf-8?B?MUpmSXpCSnNwcllkZEtyT2Q1OXAvbjY5QmJIZW5QekN4c2ZNVmVCZm1oRWR1?=
 =?utf-8?B?RkY0czBmak1TNnYyL0tXSWpwN2pCMEtSUVY0d001N1huT2JWTzJGL0h5Tzg4?=
 =?utf-8?B?QkxsTnhoZDRtK1BlbEw3dTZPbTlnQVQ4SlZkT2REUEM5MnpBTk1jd3dtcndI?=
 =?utf-8?B?Q2VnZjBIWERRczR6VVFLaXR0VDN2NmxnYXNhZENucVhteUNWWjVoMnMrcGlm?=
 =?utf-8?B?dWlYbGx2aktXZk1FVGNDRER6YThhRzFsV0NJRXU0K2Y0eDlsSTNVS0JOWnJk?=
 =?utf-8?B?WE1PQmcrcEVhU1A3dWlyQXlSZUZNS0ErbFVYWDdhSVQ5bFFadkFTNEpTaUJZ?=
 =?utf-8?B?MHpwbXh0WjB4U2JOVDVBZEFvaVNLcE9WUkNFeVM0M2dpVWtDbWZUY1B4RUJB?=
 =?utf-8?B?WStib0EwcGwzKy9va0lDT1BiOGd4Ulh4UGx1VmhRc1ZWNkZTZ0RDTXhQdFVa?=
 =?utf-8?B?SThPSlgzVWVYKzIrdFFjVE9veVFvZG1GMkJtNWFHOUFLbFhtcmFaTE9QaXRo?=
 =?utf-8?B?S0xzYkhCNlN0UlpEL2ZoVWNLZ2dEb21SdnJROWFmMUV2eGkra2k1UXNtbDhN?=
 =?utf-8?B?MmFOS21vWithTlU0bU1pV09SVGQ2bjEwRnlsVnZyQ3dnakhWaTFybDIvbzZ3?=
 =?utf-8?B?YjJGeHBReEZFcEhpVW92eFEwSFhpVzI3anR1NExic3g1RDM4ZDJWaDBremww?=
 =?utf-8?B?d0RvYUVlQkl4bU94aE1hMVluUkZXTDgzSERER1E1TUg2Z3hhVENHdHM5ZXoy?=
 =?utf-8?B?QVBJbXY0TVZKV2lXcG9OOHlId0k4SHl4VEdMd25rbUVDRC9mSUNtS3BXRUZy?=
 =?utf-8?B?T0JYZi9BTnBFa3U4T2VVb0RYRUE1MHZZeTNEWDJiaHpBbU9KOEN2NDNvdDhK?=
 =?utf-8?B?VXd4NytxZFpkQTc3c3A5Q1gwL3ZyMU13djRFTXpLSExzNERRc25yNXZoVGpE?=
 =?utf-8?B?eXp3bXJuMGJPd1JDVzhzb2ZYSGIxME1paC83Zi83M3hxMUpQZ0xQS1BYaG5w?=
 =?utf-8?B?SWlTN0xYdlB1bVdlcXBXS3lOMk5NYWhTS0dhRDlmY1JSRUhBWDVwNHNqK3hi?=
 =?utf-8?B?RGROdGxEa2RoN21hWUMwQ2NUcXM2emdmZk1sVUptRjFUSWlnQlZKcDk4THE2?=
 =?utf-8?B?dTBSMU9yLzFrdkZZVlkrOWxRR1RML2U0UytBbWtld2Z3U2d1WnlOWlNFOXo1?=
 =?utf-8?B?Z1hPTVEvQVdHV0xtRHZXQ1QvVEZQUEVVSWZveDBZY0l3Z2NWWVlvOWQzdHVT?=
 =?utf-8?B?MEcvanVjZ0FBUU5SSW1IS3pGd3hLaEg5Mnl6b0J2OEZDaGJkak5odWVtS2pC?=
 =?utf-8?B?ZEp2Y3I1UnpyMzQxa3p6K0E5VGtvbDVmUk84UWtiWG1kd2xhMEcwZEszc1RF?=
 =?utf-8?B?ckFBK09UWHVWdGU4b2hOaHgweWJnbGJGbEp6ZVMwa0pSdWhhd1dKMGdpMmMv?=
 =?utf-8?B?R0hzZU1ZREtjY1RlZ1NONUdoZFo3UVRvQ0VSem1xRlJRanJ5d2I5aTFTWTBX?=
 =?utf-8?B?K1BaWmE1UW9ac1lQT0llRmNacEtkU1pDQVJObFNYZEdqRkhQM0hhV2sxQmRJ?=
 =?utf-8?B?L09Wa3FlYW5aZzY5VDdKZ0xWbVVtYXZrcTFoWkZBcU9SR3UyTWpPVGxRTDZ1?=
 =?utf-8?B?SERVR3dMMXlpVEUvWlkvNHlBK3YvcWxsT2RWRlptUHNhQW1HQUhrWGhZQWNt?=
 =?utf-8?B?Nyt5SHRxemQzaTlYV2s2VFhkbnV3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bd4197-5f0e-47bd-042c-08d9b8ad3f6e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 11:40:48.6018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0IZgRKoqJbwZx8A5thEurnBor0BMtXkcoeDnnuaTjCUuol4zY/CPWEyaOjrypv+bvV7bZHPaqnguFIhon9jpJU94X/f5ZMRper8dHuhNPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6401
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::731
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::731;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.076, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

04.12.2021 02:14, Eric Blake wrote:
> Add a new negotiation feature where the client and server agree to use
> larger packet headers on every packet sent during transmission phase.
> This has two purposes: first, it makes it possible to perform
> operations like trim, write zeroes, and block status on more than 2^32
> bytes in a single command; this in turn requires that some structured
> replies from the server also be extended to match.  The wording chosen
> here is careful to permit a server to use either flavor in its reply
> (that is, a request less than 32-bits can trigger an extended reply,
> and conversely a request larger than 32-bits can trigger a compact
> reply).
> 
> Second, when structured replies are active, clients have to deal with
> the difference between 16- and 20-byte headers of simple
> vs. structured replies, which impacts performance if the client must
> perform multiple syscalls to first read the magic before knowing how
> many additional bytes to read.  In extended header mode, all headers
> are the same width, so the client can read a full header before
> deciding whether the header describes a simple or structured reply.
> Similarly, by having extended mode use a power-of-2 sizing, it becomes
> easier to manipulate headers within a single cache line, even if it
> requires padding bytes sent over the wire.  However, note that this
> change only affects the headers; as data payloads can still be
> unaligned (for example, a client performing 1-byte reads or writes),
> we would need to negotiate yet another extension if we wanted to
> ensure that all NBD transmission packets started on an 8-byte boundary
> after option haggling has completed.
> 
> This spec addition was done in parallel with a proof of concept
> implementation in qemu (server and client) and libnbd (client), and I
> also have plans to implement it in nbdkit (server).
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Available at https://repo.or.cz/nbd/ericb.git/shortlog/refs/tags/exthdr-v1
> 
>   doc/proto.md | 218 +++++++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 177 insertions(+), 41 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 3a877a9..46560b6 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -295,6 +295,21 @@ reply is also problematic for error handling of the `NBD_CMD_READ`
>   request.  Therefore, structured replies can be used to create a
>   a context-free server stream; see below.
> 
> +The results of client negotiation also determine whether the client
> +and server will utilize only compact requests and replies, or whether
> +both sides will use only extended packets.  Compact messages are the
> +default, but inherently limit single transactions to a 32-bit window
> +starting at a 64-bit offset.  Extended messages make it possible to
> +perform 64-bit transactions (although typically only for commands that
> +do not include a data payload).  Furthermore, when structured replies
> +have been negotiated, compact messages require the client to perform
> +partial reads to determine which reply packet style (simple or
> +structured) is on the wire before knowing the length of the rest of
> +the reply, which can reduce client performance.  With extended
> +messages, all packet headers have a fixed length of 32 bytes, and
> +although this results in more traffic over the network due to padding,
> +the resulting layout is friendlier for performance.
> +
>   Replies need not be sent in the same order as requests (i.e., requests
>   may be handled by the server asynchronously), and structured reply
>   chunks from one request may be interleaved with reply messages from
> @@ -343,7 +358,9 @@ may be useful.
> 
>   #### Request message
> 
> -The request message, sent by the client, looks as follows:
> +The compact request message, sent by the client when extended
> +transactions are not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> +looks as follows:
> 
>   C: 32 bits, 0x25609513, magic (`NBD_REQUEST_MAGIC`)
>   C: 16 bits, command flags
> @@ -353,14 +370,26 @@ C: 64 bits, offset (unsigned)
>   C: 32 bits, length (unsigned)
>   C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)
> 
> +If negotiation agreed on extended transactions with
> +`NBD_OPT_EXTENDED_HEADERS`, the client instead uses extended requests:
> +
> +C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)
> +C: 16 bits, command flags
> +C: 16 bits, type
> +C: 64 bits, handle
> +C: 64 bits, offset (unsigned)
> +C: 64 bits, length (unsigned)
> +C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)
> +
>   #### Simple reply message
> 
>   The simple reply message MUST be sent by the server in response to all
>   requests if structured replies have not been negotiated using
> -`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
> -reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
> -but only if the reply has no data payload.  The message looks as
> -follows:
> +`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been
> +negotiated, a simple reply MAY be used as a reply to any request other
> +than `NBD_CMD_READ`, but only if the reply has no data payload.  If
> +extended headers were not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> +the message looks as follows:
> 
>   S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
>      `NBD_REPLY_MAGIC`)
> @@ -369,6 +398,16 @@ S: 64 bits, handle
>   S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
>       *error* is zero)
> 
> +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> +the message looks like:
> +
> +S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)
> +S: 32 bits, error (MAY be zero)
> +S: 64 bits, handle
> +S: 128 bits, padding (MUST be zero)
> +S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> +    *error* is zero)
> +

If we go this way, let's put payload length into padding: it will help to make the protocol context-independent and less error-prone.

Or, the otherway, may be just forbid the payload for simple-64bit ? What's the reason to allow 64bit requests without structured reply negotiation?

>   #### Structured reply chunk message
> 
>   Some of the major downsides of the default simple reply to
> @@ -410,7 +449,9 @@ considered successful only if it did not contain any error chunks,
>   although the client MAY be able to determine partial success based
>   on the chunks received.
> 
> -A structured reply chunk message looks as follows:
> +If extended headers were not negotiated using
> +`NBD_OPT_EXTENDED_HEADERS`, a structured reply chunk message looks as
> +follows:
> 
>   S: 32 bits, 0x668e33ef, magic (`NBD_STRUCTURED_REPLY_MAGIC`)
>   S: 16 bits, flags
> @@ -423,6 +464,17 @@ The use of *length* in the reply allows context-free division of
>   the overall server traffic into individual reply messages; the
>   *type* field describes how to further interpret the payload.
> 
> +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> +the message looks like:
> +
> +S: 32 bits, 0x6e8a278c, magic (`NBD_STRUCTURED_REPLY_EXT_MAGIC`)
> +S: 16 bits, flags
> +S: 16 bits, type
> +S: 64 bits, handle
> +S: 64 bits, length of payload (unsigned)

Maybe, 64bits is too much for payload. But who knows. And it's good that it's symmetric to 64bit length in request.

> +S: 64 bits, padding (MUST be zero)

Hmm. Extra 8 bytes to be power-of-2. Does 32 bytes really perform better than 24 bytes?

> +S: *length* bytes of payload data (if *length* is nonzero)

Hmm2: we probably may move "handle" to the start of payload. This way we can keep 16bytes header for simple reply and 16bytes header for structured. So structured are read in two shots: 1. the header, 2. handle + payload.. But that means deeper restructuring of the client code.. So seems not worth it.


> +
>   #### Terminating the transmission phase
> 
>   There are two methods of terminating the transmission phase:
> @@ -870,15 +922,19 @@ The procedure works as follows:
>     server supports.
>   - During transmission, a client can then indicate interest in metadata
>     for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
> -  where *offset* and *length* indicate the area of interest. The
> -  server MUST then respond with the requested information, for all
> +  where *offset* and *length* indicate the area of interest.
> +- The server MUST then respond with the requested information, for all
>     contexts which were selected during negotiation. For every metadata
> -  context, the server sends one set of extent chunks, where the sizes
> -  of the extents MUST be less than or equal to the length as specified
> -  in the request.

I'm not sure we can simply drop this requirement.. It seems like an incompatible change, isn't it? May be, we should allow any size of extent only for 64bit mode?

> Each extent comes with a *flags* field, the
> -  semantics of which are defined by the metadata context.
> -- A server MUST reply to `NBD_CMD_BLOCK_STATUS` with a structured
> -  reply of type `NBD_REPLY_TYPE_BLOCK_STATUS`.
> +  context, the server sends one set of extent chunks, using
> +  `NBD_REPLY_TYPE_BLOCK_STATUS` or `NBD_REPLY_TYPE_BLOCK_STATUS_EXT`
> +  (the latter is only possible if the client also negotiated
> +  `NBD_OPT_EXTENDED_HEADERS`).  Each extent comes with a *flags*
> +  field, the semantics of which are defined by the metadata context.
> +
> +The client's requested *size* is only a hint to the server, so the
> +summed size of extents in the server's reply may be shorter, or in
> +some cases longer, than the original request, and may even differ
> +between contexts when multiple metadata contexts were negotiated.
> 
>   A client MUST NOT use `NBD_CMD_BLOCK_STATUS` unless it selected a
>   nonzero number of metadata contexts during negotiation, and used the
> @@ -1179,10 +1235,10 @@ of the newstyle negotiation.
> 
>       When this command succeeds, the server MUST NOT preserve any
>       negotiation state (such as a request for
> -    `NBD_OPT_STRUCTURED_REPLY`, or metadata contexts from
> -    `NBD_OPT_SET_META_CONTEXT`) issued before this command.  A client
> -    SHOULD defer all stateful option requests until after it
> -    determines whether encryption is available.
> +    `NBD_OPT_STRUCTURED_REPLY` or `NBD_OPT_EXTENDED_HEADERS`, or
> +    metadata contexts from `NBD_OPT_SET_META_CONTEXT`) issued before
> +    this command.  A client SHOULD defer all stateful option requests
> +    until after it determines whether encryption is available.
> 
>       See the section on TLS above for further details.
> 
> @@ -1460,6 +1516,26 @@ of the newstyle negotiation.
>       option does not select any metadata context, provided the client
>       then does not attempt to issue `NBD_CMD_BLOCK_STATUS` commands.
> 
> +* `NBD_OPT_EXTENDED_HEADERS` (11)
> +
> +    The client wishes to use extended headers during the transmission
> +    phase.  The client MUST NOT send any additional data with the
> +    option, and the server SHOULD reject a request that includes data
> +    with `NBD_REP_ERR_INVALID`.
> +
> +    The server replies with the following, or with an error permitted
> +    elsewhere in this document:
> +
> +    - `NBD_REP_ACK`: Extended headers have been negotiated; the client
> +      MUST use the 32-byte extended request header, and the server
> +      MUST use the 32-byte extended reply header.
> +    - For backwards compatibility, clients SHOULD be prepared to also
> +      handle `NBD_REP_ERR_UNSUP`; in this case, only the compact
> +      transmission headers will be used.
> +
> +    If the client requests `NBD_OPT_STARTTLS` after this option, it
> +    MUST renegotiate extended headers.
> +
>   #### Option reply types
> 
>   These values are used in the "reply type" field, sent by the server
> @@ -1713,12 +1789,12 @@ unrecognized flags.
> 
>   #### Structured reply types
> 
> -These values are used in the "type" field of a structured reply.
> -Some chunk types can additionally be categorized by role, such as
> -*error chunks* or *content chunks*.  Each type determines how to
> -interpret the "length" bytes of payload.  If the client receives
> -an unknown or unexpected type, other than an *error chunk*, it
> -MUST initiate a hard disconnect.
> +These values are used in the "type" field of a structured reply.  Some
> +chunk types can additionally be categorized by role, such as *error
> +chunks*, *content chunks*, or *status chunks*.  Each type determines
> +how to interpret the "length" bytes of payload.  If the client
> +receives an unknown or unexpected type, other than an *error chunk*,
> +it MUST initiate a hard disconnect.

Just add "status chunks" to the list. Seems unrelated, better be in a separate patch.

> 
>   * `NBD_REPLY_TYPE_NONE` (0)
> 
> @@ -1761,13 +1837,34 @@ MUST initiate a hard disconnect.
>     64 bits: offset (unsigned)
>     32 bits: hole size (unsigned, MUST be nonzero)
> 
> +* `NBD_REPLY_TYPE_OFFSET_HOLE_EXT` (3)
> +
> +  This chunk type is in the content chunk category.  *length* MUST be
> +  exactly 16.  The semantics of this chunk mirror those of
> +  `NBD_REPLY_TYPE_OFFSET_HOLE`, other than the use of a larger *hole
> +  size* field.  This chunk type MUST NOT be used unless extended
> +  headers were negotiated with `NBD_OPT_EXTENDED_HEADERS`.

Why do you call all such things _EXT, not _64 ? _64 seems more informative.

> +
> +  The payload is structured as:
> +
> +  64 bits: offset (unsigned)
> +  64 bits: hole size (unsigned, MUST be nonzero)
> +
> +  Note that even when extended headers are in use, a server may
> +  enforce a maximum block size that is smaller than 32 bits, in which
> +  case no valid `NBD_CMD_READ` will have a *length* large enough to
s/nc/no/ ? But hard to read any way, as sounds very similar to "not valid", which breaks the meaning.

may be just "in which case valid NBD_CMD_READ will not have"

> +  require the use of this chunk type.  However, a client using
> +  extended headers MUST be prepared for the server to use either the
> +  compact or extended chunk type.
> +
>   * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)
> 
> -  *length* MUST be 4 + (a positive integer multiple of 8).  This reply
> -  represents a series of consecutive block descriptors where the sum
> -  of the length fields within the descriptors is subject to further
> -  constraints documented below. This chunk type MUST appear
> -  exactly once per metadata ID in a structured reply.
> +  This chunk type is in the status chunk category.  *length* MUST be
> +  4 + (a positive integer multiple of 8).  This reply represents a
> +  series of consecutive block descriptors where the sum of the length
> +  fields within the descriptors is subject to further constraints
> +  documented below.  Each negotiated metadata ID must have exactly one
> +  status chunk in the overall structured reply.

just rewording, no semantic changes, yes?

> 
>     The payload starts with:
> 
> @@ -1796,9 +1893,36 @@ MUST initiate a hard disconnect.
>     information to the client, if looking up the information would be
>     too resource-intensive for the server, so long as at least one
>     extent is returned. Servers should however be aware that most
> -  clients implementations will then simply ask for the next extent
> +  client implementations will then simply ask for the next extent
>     instead.

So you keep all restrictions about NBD_CMD_FLAG_REQ_ONE and about sum of lenghts of extents as is here..

> 
> +* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
> +
> +  This chunk type is in the status chunk category.  *length* MUST be
> +  4 + (a positive multiple of 16).  The semantics of this chunk mirror
> +  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
> +  larger *extent length* field, as well as added padding to ease
> +  alignment.

But what about restrictions on chunk lengths and cumulative chunk length?

> +  This chunk type MUST NOT be used unless extended headers
> +  were negotiated with `NBD_OPT_EXTENDED_HEADERS`.
> +
> +  The payload starts with:
> +
> +  32 bits, metadata context ID
> +
> +  and is followed by a list of one or more descriptors, each with this
> +  layout:
> +
> +  64 bits, length of the extent to which the status below
> +     applies (unsigned, MUST be nonzero)
> +  32 bits, status flags
> +  32 bits, padding (MUST be zero)
> +
> +  Note that even when extended headers are in use, the client MUST be
> +  prepared for the server to use either the compact or extended chunk
> +  type, regardless of whether the client's hinted length was more or
> +  less than 32 bits, but the server MUST use exactly one of the two
> +  chunk types per negotiated metacontext ID.

But we have anyway one chunk per ID in a reply.. Or you mean that the type of reply for the ID should be selected once for the whole session?

> +
>   All error chunk types have bit 15 set, and begin with the same
>   *error*, *message length*, and optional *message* fields as
>   `NBD_REPLY_TYPE_ERROR`.  If nonzero, *message length* indicates
> @@ -1812,7 +1936,10 @@ remaining structured fields at the end.
>     be at least 6.  This chunk represents that an error occurred,
>     and the client MAY NOT make any assumptions about partial
>     success. This type SHOULD NOT be used more than once in a
> -  structured reply.  Valid as a reply to any request.
> +  structured reply.  Valid as a reply to any request.  Note that
> +  *message length* MUST NOT exceed the 4096 bytes string length limit,
> +  and therefore there is no need for a counterpart extended-length
> +  error chunk type.
> 
>     The payload is structured as:
> 
> @@ -1867,7 +1994,8 @@ The following request types exist:
> 
>       If structured replies were not negotiated, then a read request
>       MUST always be answered by a simple reply, as documented above
> -    (using magic 0x67446698 `NBD_SIMPLE_REPLY_MAGIC`, and containing
> +    (using `NBD_SIMPLE_REPLY_MAGIC` or `NBD_SIMPLE_REPLY_EXT_MAGIC`
> +    according to whether extended headers are in use, and containing
>       length bytes of data according to the client's request).
> 
>       If an error occurs, the server SHOULD set the appropriate error code
> @@ -1883,7 +2011,8 @@ The following request types exist:
> 
>       If structured replies are negotiated, then a read request MUST
>       result in a structured reply with one or more chunks (each using
> -    magic 0x668e33ef `NBD_STRUCTURED_REPLY_MAGIC`), where the final
> +    `NBD_STRUCTURED_REPLY_MAGIC` or `NBD_STRUCTURED_REPLY_EXT_MAGIC`
> +    according to whether extended headers are in use), where the final
>       chunk has the flag `NBD_REPLY_FLAG_DONE`, and with the following
>       additional constraints.
> 
> @@ -1897,13 +2026,14 @@ The following request types exist:
>       chunks that describe data outside the offset and length of the
>       request, but MAY send the content chunks in any order (the client
>       MUST reassemble content chunks into the correct order), and MAY
> -    send additional content chunks even after reporting an error chunk.
> -    Note that a request for more than 2^32 - 8 bytes MUST be split
> -    into at least two chunks, so as not to overflow the length field
> -    of a reply while still allowing space for the offset of each
> -    chunk.  When no error is detected, the server MUST send enough
> -    data chunks to cover the entire region described by the offset and
> -    length of the client's request.
> +    send additional content chunks even after reporting an error
> +    chunk.  Note that if extended headers are not in use, a request
> +    for more than 2^32 - 8 bytes MUST be split into at least two
> +    chunks, so as not to overflow the length field of a reply while
> +    still allowing space for the offset of each chunk.  When no error
> +    is detected, the server MUST send enough data chunks to cover the
> +    entire region described by the offset and length of the client's
> +    request.
> 
>       To minimize traffic, the server MAY use a content or error chunk
>       as the final chunk by setting the `NBD_REPLY_FLAG_DONE` flag, but
> @@ -2136,13 +2266,19 @@ The following request types exist:
>       server returned at least one metadata context without an error.
>       This in turn requires the client to first negotiate structured
>       replies. For a successful return, the server MUST use a structured
> -    reply, containing exactly one chunk of type
> +    reply, containing exactly one status chunk of type
>       `NBD_REPLY_TYPE_BLOCK_STATUS` per selected context id, where the
>       status field of each descriptor is determined by the flags field
>       as defined by the metadata context.  The server MAY send chunks in
>       a different order than the context ids were assigned in reply to
>       `NBD_OPT_SET_META_CONTEXT`.
> 
> +    If extended headers were negotiated via
> +    `NBD_OPT_EXTENDED_HEADERS`, the server may use
> +    `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` instead of
> +    `NBD_REPLY_TYPE_BLOCK_STATUS` as the reply chunk for a metacontext
> +    id.
> +
>       The list of block status descriptors within the
>       `NBD_REPLY_TYPE_BLOCK_STATUS` chunk represent consecutive portions
>       of the file starting from specified *offset*.  If the client used
> 

Overall, seems good to me.

1. Could we move some fixes / rewordings to a preaparation patch?

2. I see you want also to overcome unpleasant restrictions we had around lengths / cumulative lengths of BLOCK_STATUS replies. I like the idea. But I think, it should be clarified that without 64bit extension negotiated all stay as is. And with 64bit extension negotiated, BLOCK_STATUS works in a slighter new way, so it may return what server wants, and original "length" is simply a hint. Or, at least that new behavior is only about NBD_REPLY_TYPE_BLOCK_STATUS_EXT.. Also, some clarifications may need around NBD_CMD_FLAG_REQ_ONE flag, what changes for it? You don't mention it at all in new version of BLOCK_STATUS reply.


-- 
Best regards,
Vladimir

