Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE7343C08
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 09:47:47 +0100 (CET)
Received: from localhost ([::1]:52736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOGDy-0004WE-Kd
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 04:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOGBN-0003XI-2w
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:45:12 -0400
Received: from mail-eopbgr00098.outbound.protection.outlook.com
 ([40.107.0.98]:56094 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOGBI-0004B9-L3
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:45:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIzOL9NoLJ538yhczLxb4tHZo9j1n2SJgY2NazSY7K3ybo2L7wxjI61vE+n4qZ7FOU9K7y28Ic8Xnq5zWwYSVnGaHnsK6XieuXoO/dwKnDfzisSqKA8f2RlcM6RmsLxolg/aMqwnztRndulBlkDpLv7zSTEqpJ+PxmSTZ5xekVmhuG6m102+DwZa2RO7Nu1sNn2NL2xPaVR2YIx8xYmgvSDHPJ6/p6m7Dm0panLNTRsO6gSbw8TSysvrVXmWMzT8MuXF8W7P754Wk8o92EP/5SByL0u6l4Vs5lZUTV0XkYZk4X3Aw9RJxuymXFlwgKLnv8p3Pf4ZUIUPDZ3wSSJbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vu+xwdYB+fkIPm6SbEJ9vmfs7HTLG6dn1Rh17cbYVJo=;
 b=CA8KrEuzfxrHfs2hmrbFEwac2vd+5MkxKmwsOlnWxi9bBcLcWlF4QvX64++L3/iaCGSPi6EVV3YWNCIP6vg+LuJAyo60lV9d/c6JfGAhH+mq7ce2d+sHlY04AZYnO3YkVBelPzhhDGEeGVSsrIv/hmFyNeZw2aYVAqaRgv0AMI14fRqayOdhPyKNwwbAn62o04PsbJK7/G2W8vnQkaKxoDJyQfm4tAyhh92T8+zuCeNMfoBKBxUxws/C0CLbhXEnFPrsTJ2cmPUiwiqe8m2ymCNWb33N9SkZoMm+Bf3Lh0qWmSeOYiBrut/e2ZmpvXVuYsyg3ADavrw2/ALJVnNODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vu+xwdYB+fkIPm6SbEJ9vmfs7HTLG6dn1Rh17cbYVJo=;
 b=o4q/6TbKOBciZ7tGnJLmiwlAsDgl+pl4bc/QRNRdxFPgICNTEjoB0jSEHbnbog3kQl7owya/VjR23lHgfcDsc3kHINinnNLx377l7JbI4WtEoTBm2lDfK12Fay7NJcuPkZt2SgjVT9Kr1JdXf4AKOQK3HcOa8q8GGQbsYSHc1nM=
Authentication-Results: kiv.zcu.cz; dkim=none (message not signed)
 header.d=none;kiv.zcu.cz; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB4493.eurprd08.prod.outlook.com (2603:10a6:803:ff::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:29:53 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 08:29:53 +0000
Subject: Re: [PATCH 0/2] block/raw: implemented persistent dirty bitmap and
 ability to dump bitmap content via qapi
To: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>,
 qemu-devel@nongnu.org
Cc: lmatejka@kiv.zcu.cz
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <09609aa8-5e79-1389-f9d6-b7b8ab745866@virtuozzo.com>
Date: Mon, 22 Mar 2021 11:29:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210320093235.461485-1-pj@patrikjanousek.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM9P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::25) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM9P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.22 via Frontend Transport; Mon, 22 Mar 2021 08:29:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 092b1a56-dded-4401-7891-08d8ed0ca9c1
X-MS-TrafficTypeDiagnostic: VI1PR08MB4493:
X-Microsoft-Antispam-PRVS: <VI1PR08MB4493E97621E6852DA2BB9C15C1659@VI1PR08MB4493.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBr1gp8qs4BE2bQBsm+1laIfBarhCffwksCTuGcBfwtLsy1s4e/BraY9TvCUbXP6erQyGLHcCEtK64yeKLsFQQw14qt8MP0ZfcP3CkkdZ2mw1l8T55ZtfSLte7SC8E+/arrtG+Cl/gPw60kORhurINqFX/yVB3+mWB3lqXfTovFvGUkPZ+2OUim5v1HADE3A5KHEX+fr0QFNFbQsjpKfpPHw+aPhU1R87JL3AK98YX313k6b9rbSn86YgMwESbuaNV0whx8doX6DTYchf3WsPFJ3XM+epAjG4wdusq6P+dMU4MeCU/+t8AonNvZ6fkA07sCDM7PV0XecmN7WtiuaORHlsSn+MK58NwOYfVZksBz+zhr4Inhkj/jF7Ukxh79EUVPzO1/VPfr/QK+a2d+CoWXFR6TFqgCCs0seR7DTTnEeOLWe/tKt6bzvNqs5atEGgB31fCww1aJ6VQ3kxh0apcJkNTh3ETCp6btk7mHOim7aQ/20Ke/hW+BYEhjnztsclMTYlYzw4u2TNnuur7ALYO81Q2Nb9CNJTBE8/bl3pgZdvpgAA4lZ1ADnxOD5ZQ94TjVrF4Ul9ZCLvv6dwZA6Bb1nnAKKsw2ZCStnvrOk0/SRRFwv9CQzkpnr74MP9jR31cempZHLPz7sNxAJqEH+5bf1cG7j8OdTtqpzZ1dnSoEIU4uBtFIdhubKCpGcO4q01POGs7B348XOl+kGsBLyEpFYevO5a014D5tyszspoIK6gJJJ8cxsa7EgBsVgu5/P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(346002)(136003)(396003)(2616005)(16526019)(186003)(31686004)(8676002)(478600001)(66556008)(66476007)(66946007)(86362001)(316002)(31696002)(8936002)(4326008)(956004)(6486002)(66574015)(16576012)(5660300002)(36756003)(83380400001)(38100700001)(2906002)(52116002)(26005)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzlZV2FqbHNDYUdVKzE5WTJ6b0NhUk16aUloU1pvSW11ekFscHdzZnJXRkZh?=
 =?utf-8?B?Ky8vS0J0eUIzb3ZBNTY4N1gzT0pHbTJNZ1BrZE0vYnpNVHZVQnk5VXJ1MndZ?=
 =?utf-8?B?amQxMjFSOWNGT0I1V2hxQzVVbkpmaWU0b3JXVHkxY3NFZHNzNWkwbitJZWwx?=
 =?utf-8?B?cGVmc1BPc3pJVXN3RFVHM2dIVWd0SDFZcHVvYWZ4aFB2eXdyUU5Ld29JQUNu?=
 =?utf-8?B?bU8rYzI2UkZ2TGdPdFNXWXZsWjN3ckRQaUN1UzR0M1pqU1VybEpDazY5WXJR?=
 =?utf-8?B?ek41NXVOU29XYkFPNHF6RlVhcUtyakd5WWNnUHU5UlRwRmFWZzEvRGJrVklX?=
 =?utf-8?B?ZzFCWThUSmdpMXdGb1dXRlZCUnNkRjJaV1pDbWZ1Z1NoSmUxVldYOHB3cUxl?=
 =?utf-8?B?S1RMbWwreVczSjZUNGNHTzZBbGZBaFR3UWw4VVRSYVQ4MDBlc2NkRW1sbkRN?=
 =?utf-8?B?SFRyTDN3NlVnVlpEWTBQTW1BWlhubGE4UVBOcjc3WWFNb1FQWnQ2Z3JxUHU3?=
 =?utf-8?B?ckhiMUFTdGNPOVZzZTVHcDlaK3Y1VWlrYXFhLzJZbUVVZEhDeUNUQzhTdnlm?=
 =?utf-8?B?TVowQ3lzZ0liZFcyRlY5QlNiSlBLdWxsTWxlR25xWTZzVEtXbGQ2dGY1UktS?=
 =?utf-8?B?TXRoZ1VWWTl3M3NDOFhiTmRNSldXZzFEamx6TjBHcUVQMWpSUElRaEp4MW5G?=
 =?utf-8?B?S1pmSGhFS3RzSGY4Q3lRZCtTMWVJQXFQWjJFQXZzL2hydnVXbWhuRENyM092?=
 =?utf-8?B?M2NDdStRdHNPQVh2SDFIdkQ0bDhSWDJBRytWUlJldmNoL05QZWJXb2QxcWRs?=
 =?utf-8?B?SGRCeEpORFRQUkIzbjZlY3Qwd2dHRG02OUdqYm85RDN3UVE1VndxdC9KbGhs?=
 =?utf-8?B?TVd0TU5MSTdIbkFUQ25pckxkMnJqY2FYQSsramgxQ0dBWDd1MTVXSVRzNjJV?=
 =?utf-8?B?ZzlVV2JzdysxS3hoRzY1amJQcmJLZzlmM1grOUFsdG5Ja0IrZjcwNmpLamRM?=
 =?utf-8?B?YzVGSkRBaE9qbXgrbjdzaVI2Y01sZjh2VE5uem14aXBPQjdsMDBZTGN5WDk2?=
 =?utf-8?B?S1NIUHhhdHllVHpZdWFNbGl0OGdrYUJaYUQ5L3cvKzBNSGxHN2dDelZRVS9K?=
 =?utf-8?B?dkh4VFBIM1lUSU9EcGUwVlIrMzVzaU5vcDBFWVR3emxQa3B1SHRybmdsa2RY?=
 =?utf-8?B?WFV4RnAyZ3MvdEdlU0FYb0tTK1pjTFQySERBZ1RNOTc0WElFcWViUTJmN2Ft?=
 =?utf-8?B?bmVIUnYrTzFBbldETnlXRlFaNWd1R2xzck1qZ3NheVN3Rll1K2s4MCtNR1I1?=
 =?utf-8?B?cmhTakxNMDRMUVpScDhUVS9rUzd3ZDM3Wklhdm40UVk5NHg0MnMwN0w2Z21V?=
 =?utf-8?B?MUV4Q3ZHdHZSTGdXRkRQMGY4R21DUThXSCtRcm5kQlJ0bXNjanhKWmF6VlZV?=
 =?utf-8?B?SDNwNnE1YWNuOTRxNFlOYmhRZ2hOZmcxT1JvQWE4TlVJd2dTU1RwbWpqMzFR?=
 =?utf-8?B?cVZiMDBvYm8ybkRUME4ya05IN1VIeElEeW91QVN3V0FQeUNUMVcrYkJIbkl5?=
 =?utf-8?B?elRNdTNmV3VHendPcEI0bXUvV1lNTG1DNy9BL3k5OUVqdEMwWE1CRk9MRmtD?=
 =?utf-8?B?b0UyQWVYekR1QnRmcVRyWDFTTzl2b2NDWHJJOXNGVnRwU2N6YU5ETTlSRGxs?=
 =?utf-8?B?dVhkb1dERGtuWWxLclcwOTNnMENvZHhqVGdHTGIzMUlQYWJ1MUZTVWZMakYx?=
 =?utf-8?Q?Pl+r0i0s+9R4TX7U2Fmrspe7F3qm3Oxg8N75w1i?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092b1a56-dded-4401-7891-08d8ed0ca9c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:29:52.9317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfP+qstAPPGsnaPvkzDfXKhNmznUvHvrP59GpdNVHFI6E92h7J+hNkQUPZDYybxsiUCxFHjbnfyc0TTdjZ7U4dYq8jmDFosvxLIIND0ULyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4493
Received-SPF: pass client-ip=40.107.0.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Hi Patrik!

20.03.2021 12:32, Patrik Janoušek wrote:
> Currently, QEMU doesn't support persistent dirty bitmaps for raw format

That's right, we don't have such feature now.

> and also dirty bitmaps are for internal use only, and cannot be accessed
> using third-party applications.

And that's is not. Bitmaps are accessible through bitmap QMP API

   block-dirty-bitmap-{add,remove,clear,merge}

And to retrieve the context of dirty bitmap you can export it through NBD protocol (see bitmaps argument in nbd specific options of block-export-add command)

> These facts are very limiting
> in case someone would like to develop their own backup tool becaouse
> without access to the dirty bitmap it would be possible to implement
> only full backups.

We do have external incremental backups, based on Qemu bitmap API. But it depends of course on qcow2 persistent bitmaps feature.

> And without persistent dirty bitmaps, it wouldn't
> be possible to keep track of changed data after QEMU is restarted. And
> this is exactly what I do as a part of my bachelor thesis. I've
> developed a tool that is able to create incremental backups of drives
> in raw format that are LVM volumes (ability to create snapshot is
> required).
> 
> Please keep in mind that this is my first submission to such a large
> project and also the first time when I send patch over the email.
> So I hope I did it correctly.
> 
> Patrik Janoušek (2):
>    block/raw: added support of persistent dirty bitmaps
>    qapi: implementation of the block-dirty-bitmap-dump command
> 
>   block/meson.build               |   1 +
>   block/monitor/bitmap-qmp-cmds.c |  61 ++++++++
>   block/raw-format-bitmap.c       | 163 ++++++++++++++++++++
>   block/raw-format.c              | 256 ++++++++++++++++++++++++++++++--
>   block/raw-format.h              |  50 +++++++
>   qapi/block-core.json            |  64 +++++++-
>   6 files changed, 583 insertions(+), 12 deletions(-)
>   create mode 100644 block/raw-format-bitmap.c
>   create mode 100644 block/raw-format.h
> 


-- 
Best regards,
Vladimir

