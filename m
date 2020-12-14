Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B682D97E0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 13:08:21 +0100 (CET)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1komeK-0007Ha-QC
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 07:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1komch-0006UD-CX; Mon, 14 Dec 2020 07:06:39 -0500
Received: from mail-eopbgr130127.outbound.protection.outlook.com
 ([40.107.13.127]:14293 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1komcb-0006JF-Iw; Mon, 14 Dec 2020 07:06:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvcDM52F53umCg28wvH7vV1tFpN6iGQpOTEfqQzcDPoYZ6TBKF+LUtJpl8d+uCE0/97BlqqKZU0euyGbWgNdDBfBzIZ90Hg1qbRWhpmy/UXOnAFyjpUwh6x5TQSCa6sjbdbwCrklKnagiSTa3QlJSmR9prvCOr05np/NffMGrBHVL1i8Kc8375lhrD2y0lhU0ZERM+Tjg5eGBPLBkAhdGdzkerl+cGmwWj/w9g5AcPwQZe/iZQqcgyJmXrHEvnnxiupEt0Qu27Yq1Uid6miBF7sovoptw8bYYsRNMyXZjyktKWVv3YJGg5t6OfQR+T33wfZh73S6hzu9HRTNd/lhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbDM8CamasSVFVd+qx5WaEpti08i+7bh3Gsavlt5XG8=;
 b=OFz2Yur5AduErBpmUJIL6ObMOpIUO2EMSzheBaiIrpjzBvfzI673Vwhr9vj7A69/lMYZUBKOl+KuFUK2+Tvn9Bg21Qtx4bLy5TK/OHqi1EdWFI1qk7PYGNUEvfz3UQoMdpfcBVeyqgec5sRj3htscqFVjdDk2AzMJddf6+7PXwy/dAUtaaQOFrWDbhk9aFvYu/e5iXGsKwoPc7oFUqb1Jj+n1qyKjljR0uIwqd4IzLg/RK463bVhR8CPCDBDu41S+wZaRCrpZKi5wauXI69tcjsfgo55K+GjBPEIbOhVw8iFyr8vz3y4GvFBxCbQVp9CSk5fn2zmKCRpcbF7OFzmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbDM8CamasSVFVd+qx5WaEpti08i+7bh3Gsavlt5XG8=;
 b=IrYkppZSJISb5Qfzuc56REEt2jbDKzZHpOPTasmoH7GNS7ysTaMQzKlLNqgUKRiTSl7WkuVWoG5nZAgzN4lpb+u+hkzhXCslD0hKql9Oc8/mZDdrIWEeLVx7UGgm8eISScJW5SZXFmDH5vIVDaENGy8Puf678/MzM2ip67hYKx0=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Mon, 14 Dec
 2020 11:51:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 11:51:28 +0000
Subject: Re: [PATCH v4 00/16] 64bit block-layer: part I
To: qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <25be8473-8528-86a5-dedc-dd7c72075ceb@virtuozzo.com>
Date: Mon, 14 Dec 2020 14:51:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0013.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR02CA0013.eurprd02.prod.outlook.com (2603:10a6:208:3e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 11:51:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2dde812-77df-4d28-3dad-08d8a0269782
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2098BD1F6FAEC0D81032DD9BC1C70@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QCuRPmDyfRDwCW/bk6nTHnV5Uqz29T/GpyAXBRmYBnbOovq0xvNiPuEJEtZ2hq8qtnpZ2ava7kp/d29WV0q1iaoGg6BivJXof7E/MRoRKC8mhOsu4kdGvkpVpOMumKdz0K15qPTJnCSu+1bmGLqrnuGz/wlbiQCQ6d1t+UxBMXiNP/6fbUurP4dEd95wwN+1qq4nxsmvN82mH3GowhGgQfqWGGmAX6Y37eMJ5qxHXr8jUCE8bdUF+tspFMnpLfaeUUGbjrQxmWxSBXF9JgTwi4Y3kdKSBmK96vy2Nu96C2yAKl8nV/6qvFIx550RP12dEmiqNmzsyP3X6pzz21zr3CP5NE/DotKlNjabHlZ7DQOn0hFhqk34d6t2bhc+CDRaUCZLHWemn6dIkGUXpbz4dfMWT8X5hX8fW+LRHjlyk7ClO2GelslzWSVC22/5OPcfQCZJHIrkcuNjINkEXmY8Q1lfRNwbXklb2pq//+0LaI/93yQMZ75Q9DmWxgsYEZFT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(39840400004)(136003)(16526019)(6486002)(6916009)(4326008)(31686004)(86362001)(8936002)(66946007)(4744005)(66556008)(52116002)(66476007)(83380400001)(107886003)(966005)(956004)(2616005)(36756003)(26005)(186003)(478600001)(5660300002)(2906002)(31696002)(316002)(16576012)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S1cwdXJwY04zM0swNTdPb1A1aklVMmJjN3dFOUQ3OG9VRUFaQm1UVFdINzZp?=
 =?utf-8?B?ZC9lMjZnNnRLNkZwQXZCWmNBWGRkb0FwWG1aSHQ2clNXRHhMM0FxTERxMzFw?=
 =?utf-8?B?di90SWk3c1lEWkl2VExUWGJhL1VKZTlTQWxoajc1T0RmMXZROXZhWGRDbzdN?=
 =?utf-8?B?anU2SDMwRTVCUWpQS2UwN3FpWnJwNlpBUklQMFppc1I1VXN5U1JZdFBwRkhB?=
 =?utf-8?B?UnBrY212MGY4UVhyVFQydTE2ald5ZmhwNmx0aGl4S1dwYUFaeE5TR0s0eitG?=
 =?utf-8?B?U0NPdWhqV3hUbG9lMVlvUkRVRWpNaG00c3l0eWZXOUVEV3RBTUZRbXo4b0x2?=
 =?utf-8?B?MGh1Y0cwTXBrcEtDUVBtRExzbmF4cG95RVhjVEEzMjRReEkzUEpMNDlDV3N5?=
 =?utf-8?B?bGZIT0c4SDdFME9LUk91aFlqNTd0OFZDaStkYjlUYU8rNzVvR0FJL1EyTzht?=
 =?utf-8?B?bXV2UlIrSUtxMWtZeEx1b2ZMQTgxWnRCTUpyckgxOEo4YUJLc0JwN1h3VWpK?=
 =?utf-8?B?NHAveG1KUmp6WDUyVTBIY3dvVEFneEtEOXJQQ0wrU1d6OFNCbjN5V0s5akhv?=
 =?utf-8?B?K3lra2VaZFhEdk9yVDZMVHo4UGZWTUh1OGZGREtXdE9IVFB6cVBhNzZ1NnlE?=
 =?utf-8?B?eUVaNlY5RzR0ZVRmOUtXejdMeE1HOExlekZ0eGRnVE9EUUNqSmRjNkZIdkNl?=
 =?utf-8?B?U05ibS8reUNCWlJQdHlrU0EyMGZ2dDdIM3Jla1F2L2FNQWVhVHhrdUtmSVN3?=
 =?utf-8?B?eVdIMFYwaDZ4VzhtT2dMbEphdmY2WDFZMy9CaVlzM2dkRXo5S1dta2k5VnpQ?=
 =?utf-8?B?bGpodXVpRmwwSnF6RHlDcTBuRGlyek1rZE1VOTFEZVR4bEk2eDFDMEhXZ3Bt?=
 =?utf-8?B?OEcwcTlkZFdFZ3J1WTZmRmRDM0tVUGFJREh0Tkh5UVdzK0pLNG1Sb094WElS?=
 =?utf-8?B?eEs1cjJHT2RxU09MMjRCZnhDcnJqcXdiZ2owSXErbkdicjBDYjFXN2FMbTFy?=
 =?utf-8?B?QUpHK1FTUlFQQ2k2S2NMNUkyMjVRSDQwNlhnUDJWOVh2ZnliYkFZYlYxbmo4?=
 =?utf-8?B?ZDdtMkxBLzliczBIUDlhS2ZoemNPbmxOUis1OThZVmhSNnVKekhCMC9yNXNi?=
 =?utf-8?B?d1RMODc1VGlJMzBNaHN5RW1oMmRVVXo4SVdVb056emRDRTloTDFSdUgwUGx3?=
 =?utf-8?B?M3NySFhwdjE5ZWQ2d1lYejNoUG1FRXh4Unk0K0xGMnptNWExOXVqb21CKzJO?=
 =?utf-8?B?MHMwVlpKZzdvRGlwRVA1dzZ6OTl5NUNRdXNxczFTRHBaUkdpQ3E3L01hRGtD?=
 =?utf-8?Q?KrE8It7XqVdYxeIj3dvWRtrtQJvWvfjO1D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 11:51:28.2587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dde812-77df-4d28-3dad-08d8a0269782
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUAsMEhxIyxsODFnVtP+A+L0rJ1FoT2YeITLgjaGlH7GTnEt4cXucRzwNXmdGvrdOth9h4dd8grYZYnrn9eXgm6CsRPuMfnrIVDJS7OEjzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2098
Received-SPF: pass client-ip=40.107.13.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.12.2020 21:39, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> We want 64bit write-zeroes, and for this, convert all io functions to
> 64bit.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> Please refer to initial cover-letter
>   https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg08723.html
> for more info.
> 
> v4: I found, that some more work is needed for block/block-backend, so
> decided to make partI, converting block/io
> 
> v4 is based on Kevin's block branch ([PULL 00/34] Block layer patches)
>     for BDRV_MAX_LENGTH
> 
> changes:
> 01-05: new
> 06: add Alberto's r-b
> 07: new
> 08-16: rebase, add new-style request check, improve commit-msg, drop r-bs
> 
> Based-on:<20201211170812.228643-1-kwolf@redhat.com>


Now based on master.

-- 
Best regards,
Vladimir

