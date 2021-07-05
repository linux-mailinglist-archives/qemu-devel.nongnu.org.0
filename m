Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D8A3BBBEA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 13:04:01 +0200 (CEST)
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0MOO-0004OY-NQ
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 07:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0MMq-00031g-B6; Mon, 05 Jul 2021 07:02:24 -0400
Received: from mail-eopbgr80124.outbound.protection.outlook.com
 ([40.107.8.124]:9582 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0MMn-0003jI-Bi; Mon, 05 Jul 2021 07:02:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtHDgQ/oHfI4D9sVDVjtbTXjvCaDNdxjEXQfE5NWKWWjPyTrQN2h6CDmJeo7mP3gVa22LcX2ww0ke0FBNxbiDZs9ZQyvlGw80WwZGm37wXlND++DEQfDehaly7D2hWCHekBM2tSFrGvEZukmy3WagbHAH+cWw1QvqqUt47Ckw7fyjC0rURfaJfJmCRrqGgh3z3ay1DHqW8dJ77k10op55oVe9OE70e7rPLLaNxn56Zv+lu4roAJlffi7YmOivJpm9KXe9G7G+M+yRu7jDLRR92HHYb61fDZMQh8KVUU+4oKMfJ2Ic7Ie1v2jfgG/YCStezvbC8nASIFThgt2Nfns1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md94peL1Nh4KC3Ec4v65TYoZ3JMgsKABU/u8/L4xxD4=;
 b=HIyvE+Xiqx8Uvx0IeYhcpkgjuwpU/yrH/2yib20wlcOu3SbZQ2L3p52/BhSokOD2whnbIkE6tjjGk7+0E14Ti34lqru/l1NBi7f4Hc9mNjNRj57O9F2yGgZFCg01tt3Evli2APT2OuhEZE25X4KOrpb3fIz7EF3wYvZ9a9S8IcTx1Oy30hgdAOT8iQSMUWWq6j1U1/1wrZ/ljju8fuA/SuLTHSxFOfblAHKgCnt3ZoqjP1pIMQ92uktJt6V+fxiLqX2mPQyoF3XrVKGbsoEdSi1eRPagVg99vkRAcnQurvEItdydGJ0P42QuYPUAfUxHINQSgkDqSNy0MWomLtnN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md94peL1Nh4KC3Ec4v65TYoZ3JMgsKABU/u8/L4xxD4=;
 b=F9cJxBdk0x6mwycqi18nwGBSL+40eDuVJ9UWBRa2c9d/7GU/PFACUWJ/XMNw8wiifZa2saPgn9YKpn5X6a+SU8mrbMJzPAGkYedQKAKnpv/RTx+BTkiHW6buZsHT00FLuK2KDXUYJKDNK7M+InsCyCgMIxT0sdXSkV0rotJAUrs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5080.eurprd08.prod.outlook.com (2603:10a6:20b:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Mon, 5 Jul
 2021 11:02:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 11:02:16 +0000
Subject: Re: [PATCH 06/14] iotest 302: use img_info_log() helper
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-7-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <aaf6f9d2-1255-77ea-2d27-fd18f7030b9b@virtuozzo.com>
Date: Mon, 5 Jul 2021 14:02:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705091549.178335-7-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0222.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0222.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Mon, 5 Jul 2021 11:02:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 645228f2-c16b-47dc-328f-08d93fa459d8
X-MS-TrafficTypeDiagnostic: AM6PR08MB5080:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5080B7223C9EFDEE809E047CC11C9@AM6PR08MB5080.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pqp1KZDXXD5jnUC+rwMeWIolyNcmMWvhf28SFjuhtA1cMFsw989KLHiL7DlQNWQk4QwIfxUZKqzuTqgbIpuXIptkpVB3ReH7lp1r6CrAl8vVln5e2QfhEf3PWcstuG1FwrE/2k8LPVWYxIgMnDsunOhxBuKkx2gxnYxzjOFSYajHmG2NCcjBFojxN/ZzXGBUWvtg5OBcbm8w7ce9mjzqponXafR7OvvJLom0+uhL+akhONuMzF8kchlQ4BReebb0EEfro+3OaY8RjDQ+sawnZc9xLiWsAPi7xKMs9e1T+QJXsp2bg7nKswgHSmfOkocWJGXJhDWDsnwoe40DAMg6oHqBouF+OloLXx+Ur5qPU7UUFmMa0+AeWBO0jwPtET7LygeONFe97oGRlv7dlA5SfUU/xoDWPn8KsyEUWWUBwUzdiN+GORtT/q2T3EHnPYfaVJk45k4onz0zVzdtOZ4yoURa3NVeI4ynfjX/cEMR5Ah+cwqy98670gzegi5VpnbqwuMdu4RORC2/nqbFn0Vv0b+EyfxelVbMWVUBhXLkuaQohldVp2dx5+B4A12tWW4njzV/UE0BwMDUqHSvxU7hzB1UTN6CNSxaSEhpVUeWC2FL/Mt80h6RGNylCvgTg7yoM0wbR+h9bp5Q1YoaP0zD4A0e8yJ9/+LZiYcCgTzk6IidFNKrFzBqCRp/XzK9c0y2YYWiHR3RIT/S/lqG7cPY/kghqq+VbiOSCAtuvsARnh8mwi6HmDW6Mwe1U0gkYGkXHmDzu+vGzQnPsjzbGeTy4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(346002)(136003)(376002)(6916009)(66476007)(86362001)(38100700002)(38350700002)(66946007)(5660300002)(66556008)(52116002)(956004)(36756003)(186003)(31696002)(83380400001)(16526019)(2906002)(26005)(2616005)(16576012)(6486002)(8676002)(8936002)(31686004)(4326008)(478600001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHVRUGF5TWw3U3krSzI3ZDZ0akRBTTJ4YVR3dUx3eDlBT0JTZFVGSGpUVDNH?=
 =?utf-8?B?TlFGbUk5Uzlkd3pOYmVPcGJ0ZFh0czl0UEh2UWFhMTNWd2J6aDBrMUhQVHVj?=
 =?utf-8?B?RzM5Z1FkbjVDK3hOSm9Ed3JRVTA0TlVTU1pUQ1FzZTdaemVSbytHM002Wmdz?=
 =?utf-8?B?TzJEeWZsaWtjT1l1NndWTmxxd21wYWRCcFRpVG96YkduV0pOVm1obDJISVRT?=
 =?utf-8?B?MlZNSk1nUjZEUk5maENJVm9yUk4rbVdObUxjd2JQc09kNlpSQ0E3T2l1Tk5h?=
 =?utf-8?B?eURwMXViZWFtMm5wdUlOT3hEWFZ5dWJxbEhwa1hic056YjhmMWtWQmlEL1pk?=
 =?utf-8?B?dWF6SWZLUWlFNFgvZy9SN1k1Nk1ab0FldmJlUmlLYjZkSEJoZFU1cmJzelpZ?=
 =?utf-8?B?Ry83L1E5OCtYSmVGRU55UmN3VHkzWVAwd3JBQ25RWEtzMFczbVRhcnUxRnBs?=
 =?utf-8?B?eGFsZDc2bHVzM21tanZRSXFROGlTQ2YwYm5leXlST1VTSEsySnlFQlRiejJN?=
 =?utf-8?B?NytwZEVuZDNGWE9UMUVsZ1RtdUF0c09jTGNyOEQvUFZDQ0gvK0RxdzF2WHFn?=
 =?utf-8?B?azZvK3MwbkxVUERKREZid1BXOHprODhpcjVRVWZsbEFrYVBLSDEyUk56V1Qx?=
 =?utf-8?B?YkYzSUNYM0ZVb3RYaG9KNHBNWjBWd3VyUkx4N2pCekdHemNxZkpyVkNucUlN?=
 =?utf-8?B?RGhJN3JGc1JzT0NBci9kRzdKU0E5UGZ4TlU3aHo4akdXUnRIRnRyTkJ4SDc3?=
 =?utf-8?B?WUZkK1FYZCs2QWNDdHBwQ09nL0hWYWJTWldqQVdZd0ZXMldFRmdEWURoN0d2?=
 =?utf-8?B?NmV2b0pqdW4vSTNPWGVKWlAzRDJINEhvYzdvMFhHRkpVeFcyQm9Rd1VIc0Fn?=
 =?utf-8?B?bEU5dCtVYnorWklpbHI4VTczQ0RUZjRZT1FubmZJLzlYaTZVWCt6aVVsMTha?=
 =?utf-8?B?blVhMXBrYlhuOTNSZ3FMS24wVDQyMkloUk0rcGZHQU9GU1RuQlpDdW5rYTFh?=
 =?utf-8?B?a2trWFZqOTFBOE5TcUJVeXo3RlI1SFRNMmVqQkJBeWZUbmMwUldUbXI2SXRC?=
 =?utf-8?B?d3M2WVk0YnJZTlljcGRPQ0dPTGFIUTVDV2Y0OGhlWFBqeXoxNlhEcmFITTd0?=
 =?utf-8?B?bkMzUmUzY2ZrcUpVdmswWDBRRjdRdHpqcURJUG42d2NjekJTY0JmbmVmZ3Q3?=
 =?utf-8?B?YWJZZTN6L0xCbDhjdEJjL3hlTXNraFdRNnZFVU5rSGhPb2FFM29GS2pud21l?=
 =?utf-8?B?OWozNXFzMis3cjlaamoxaEw3UHFpZlVVbWNiSE1KRXJWTTFRdTNIVFdvYnhP?=
 =?utf-8?B?SG4wSGpmTG5oNit3clZTUE9lQVplZGt1dG9vZEZXTzk4M0lEejFPbDdUaC9M?=
 =?utf-8?B?UmxCY3BpcDF2b3VMdUFkMzlBbHh4ZmM1eGE1cVZBOGhkYmhScll2b0MwTXdu?=
 =?utf-8?B?bmt0YXNodnRHRkcvQmpFczNENjZqMkZqYWRHeS8wU2lFOG5lb3FKV1pReDM1?=
 =?utf-8?B?bHozWk13RUV5bVpQT3UzWmZlZ2FhMmF6enhnZFRaQ1N6SmJVRFhzc2luemYv?=
 =?utf-8?B?djBpZElwaTEwdzU0UU8wSDdCRXJMVHk0dmV6UnhraUZUVDkzR0dRK2tRalFo?=
 =?utf-8?B?S1BLai9XcHlmQ21ST0tkdkMzbkQwbmpjU2ExZEtFT3drb2ZtV1phK3hUYjly?=
 =?utf-8?B?ekowamU3blNFcldtZTd5dXkxMEhHcU1WMitvZEdmMFdoWjBVU0ZKMlNoeWlR?=
 =?utf-8?Q?WuwNA4if2GxtyadRwy9Th6QG8WnVxgznxxJYKXF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645228f2-c16b-47dc-328f-08d93fa459d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 11:02:16.7518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EJ3XvTMMk1YpCQze+ADv5wGC9xGEszGL9eEW/2ZDdrueflPXFNZXFEVJIO79pgu3bBqp8LeMsgn8ZiSvqik2ZoUK4iSdOTI2CFhsHdl+Qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5080
Received-SPF: pass client-ip=40.107.8.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

05.07.2021 12:15, Vladimir Sementsov-Ogievskiy wrote:
> Instead of qemu_img_log("info", ..) use generic helper img_info_log().
> 
> img_info_log() has smarter logic. For example it use filter_img_info()
> to filter output, which in turns filter a compression type. So it will
> help us in future when we implement a possibility to use zstd
> compression by default (with help of some runtime config file or maybe
> build option). For now to test you should recompile qemu with a small
> patch:
> 
>      --- a/block/qcow2.c
>      +++ b/block/qcow2.c
>      @@ -3540,6 +3540,11 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
>               }
>           }
> 
>      +    if (!qcow2_opts->has_compression_type && version >= 3) {
>      +        qcow2_opts->has_compression_type = true;
>      +        qcow2_opts->compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
>      +    }
>      +
>           if (qcow2_opts->has_compression_type &&
>               qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>

Wow, that was bad idea to insert patch into commit message even with indent: it breaks rpm build for me.

So, reword like this:

     build option). For now to test you should recompile qemu with a small
     addition into block/qcow2.c before
       "if (qcow2_opts->has_compression_type":
     
         if (!qcow2_opts->has_compression_type && version >= 3) {
             qcow2_opts->has_compression_type = true;
             qcow2_opts->compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
         }


-- 
Best regards,
Vladimir

