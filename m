Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63F376102
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 09:12:52 +0200 (CEST)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leufK-0001qj-QD
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 03:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leueV-0001LR-8N; Fri, 07 May 2021 03:11:59 -0400
Received: from mail-eopbgr40090.outbound.protection.outlook.com
 ([40.107.4.90]:64799 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leueQ-0004lA-5V; Fri, 07 May 2021 03:11:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqCBF0SeoENBF059Wx3/LuZg4OPG+wSNxe3UsjGB9+udtxxD3U1akQ4zf/acQrW42nlsDtZEOipxUc8K04aW0+IW+ny8417Rdl3awfuw/sC7TT1eCWw+70DmSbVx2AFYR5vlIllz7RtNiAgR414zUNDbhXzujvI4yFH9CDBSUEF4JlDNbr7gaNZpaWjELoo06TAY7yLpPm4eOrxKSS5vozJxawmbtQSiU/UCDtFoVWhDHvgI74ltmcr4+OTjuK/B+5avq94K1MiOfgCjw9gFkYhjPXH3f3GskwZvY9zExG7JJMQvg+vIEL542aXvNBPxWt9RhM49lfHQsgiCaSQr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4HC+cBZOTbsFwH2kanAx6SGjWcJogk1cSpSR0GF1+w=;
 b=eNHMRWqGh07BJa3uDmoWuHyy5IBRkH81Z7Wvnp2Q/PFh8dB+uwH4ISgqlcQPV+4G8nUlWO2PQtpihsBH4s58C+KVFV8wB/z0mMwGF7qa1N9GF50Pe/NEskXoG/z5ZDzEr4frwUWGOEnnQQo7ygaYzXP3Zf0SpxhWL28Xv6XAtxix4/7TOHDxSLvkkRDiFhkO638ofgp3C4PIvmfI4zYYmurPP9ihLQZPo3YUES35nbo4lz+gFRREbSp/VCbLGov4yib08hZyTL//R1und8w7ovn0UR+uiSaZKxKZ+xM2uQ253yFOKC6Xrvup7xjc6kYzodH57juBNE28Xx1Kv8lY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4HC+cBZOTbsFwH2kanAx6SGjWcJogk1cSpSR0GF1+w=;
 b=iyg1XG+jpAJrMCUPW5FnU+J6+b9rtPUrZbEwQKmPE7o6hjC58MFCnDIBDk/j6y7WEoUPCnimMRHbRG9I/AOj2MiXEQ4c++ysAHD03l3YtZCLRKdWKZqRO4sLHD8LafX5gjOBYkrFz7i1BGV4hc6OCERZsKLVea2X7wrW68ceUIA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Fri, 7 May
 2021 07:11:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.029; Fri, 7 May 2021
 07:11:49 +0000
Subject: Re: [PATCH v4 2/6] block: Allow changing bs->file on reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
 <31ccb1061199ee11bf9879f6c60608a19b83263d.1616000692.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <eaa0b429-223a-dd84-9e14-ba37fb0ad03e@virtuozzo.com>
Date: Fri, 7 May 2021 10:11:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <31ccb1061199ee11bf9879f6c60608a19b83263d.1616000692.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: AM4PR0902CA0015.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 AM4PR0902CA0015.eurprd09.prod.outlook.com (2603:10a6:200:9b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 7 May 2021 07:11:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e170019-968d-455c-ac5d-08d9112761f8
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-Microsoft-Antispam-PRVS: <AM6PR08MB50772FCD74B2457BB311C3A4C1579@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjRAgrtPl96P/ODbKFbm8VFez4+yZlNaSVO78+hs0m4nSgDg4R0zUCFvd6G2U0+WBlHuRM9Vf8keo+oaIHKweddYkwAu7ln9FvmThzQFTKmFt8vG5+Qhv2AkL3vRa98hV9uSeDtcfiMvAS4GjchAGdqb1REbmiywkOuL5wWPCLV3hfkPFjaeTgKSkvOtz3CRYOiRGNCXL6L+15MK5dPACpaz2I7QsRaT5nMNRzc1jn27baTHCDmOaAoHaWnoRtj2CvVPrXvkVdl+SY+Sd88xf7x3Z3RjgH/jlgDwsDcobt6KR2rRbFq3uFeTYQWB1VOgXXN3HBq/9jE14Kl43LEaFNnaNveaeRZpIwQpNX7iXvWf7Yi8LSmkYGzDz02oSMzLMBtC3YWDFiBmGjbeNh/JDBIXjLRVEW1ucN3fbVbmF2a7YDZzf54ltAlGroTBco+my0r8HxlXydilv42eJVefg7ZWc3YIDS9IC03LZQRgws3aJvlqcqFYlLYXt91e9BHQqHBJwIyOfbCenk7irz1Ma9CG7GxhZqz1iphxg8yC8ijTMlUcoD07pnizi8N47gqg+fzdmUVlcPStjvbGzpmyGbi1Q/3XtdDhbZL9R3BPuiXURF9PplHic15aJwPAHIhtO4B4r+lzDet9/8wZPL5jGloLLiLYRsFRAornhJk983dXyUtDttR+VihWi+N4h4Dz2ap6U/6xMIB2SDaY7p0yTasaBei6C0ZZBkUw5IoXLvc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39830400003)(346002)(376002)(366004)(956004)(86362001)(26005)(478600001)(31696002)(2906002)(16526019)(8936002)(38100700002)(8676002)(38350700002)(54906003)(4326008)(52116002)(186003)(66946007)(5660300002)(36756003)(2616005)(83380400001)(16576012)(31686004)(66476007)(316002)(66556008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDFBWi9ETFVaNTJ2OGNrZWg0bDdWcFNuZTdBbmREeUFuMGNQK01iVk5DL0Ry?=
 =?utf-8?B?Z2NLMkVSZ0phcmJPVitLUmpOSmhUZHRQZ1pwYTNURW5MSFlZbWx6WnErWWQz?=
 =?utf-8?B?ZVQ5NWhQeWlhRTAwemRvOHdVSlRLUGFTUFhjOXdkejhXckRCOW51NWhPZHJB?=
 =?utf-8?B?R1h1U0dmNTFLRFNVQkdjVVFsM0hnbGxEL211YzhCODloaW1leGNtb3Boa3VC?=
 =?utf-8?B?N0Iwbm1WamgrZWxtY3Q5ekFIZ2RkMFFmblJYdFZ2N0dlaVB1OWhUeU00bFQ2?=
 =?utf-8?B?RXYyc3d4cURGbURvWDNxMHAwT1l5Vmx3UEFPT2QwdzMvbng4ZGRGMnVsVXlr?=
 =?utf-8?B?WC91ZU1vdlNIVVpkOHAwam1Rdmo0NkZtcFVyeWI2MW1HOXZxVW93UnFFM2xh?=
 =?utf-8?B?ay82dmpHT01YN0Q0cndpbWt3dkhaMkFqcFNGRVArTG44RmhrbVl5UTE3bld6?=
 =?utf-8?B?SlZPWU1heEtRSkdnSlZQQTFOcWFZZG9TZFprMDdkZjI4SFpQUXE1WW83WWla?=
 =?utf-8?B?eHUrNnhjZUFraU42dExBNW5JR1Rxc2QrM0NSb0hjL0oyTGFUSWwxZnlnc1Bz?=
 =?utf-8?B?QzJCd0g3VE9jRFVVSTVJa2pBcTVxNkUrTHhsNGNtbXpmSWFDb2VPQjY4YzNp?=
 =?utf-8?B?TjAvRFpiVXZJdThHYkdFbDc0YlpXT2pFTUhMOEY1OWxvMzJuS1ZqcUJXZVdC?=
 =?utf-8?B?eVNRUlNEb0dEcjR4cm9sc0Y3WVp4bjM3Mm11WWVsV0d4ZmZZRnZIS25pcUJX?=
 =?utf-8?B?Z2tzSzJlYU1sTHRHbTB5c3hhbnBEeXExck5KbkZJeGhVbW5pKzhLaXBXT1hk?=
 =?utf-8?B?ZXdJUkdlU0IwR25qNTR3MXYxclYzbjJKVm5VWDJOUENGVjBkV0ozNGJSMTB6?=
 =?utf-8?B?ZGZnV3oyVFI2b2xlaERwcFVGY1FBNURzWjExVE5pTG84YWtLSVhVZmNrUWZt?=
 =?utf-8?B?QWhvVXJRMExHZTJwMEpjeFAxSTIxWGFvamlJWjNweWI1MUV3cTBmSVpvUUt0?=
 =?utf-8?B?MTE2cXMzVE0zOXNCUjczZlVGbkMyOWlUUWVBNUI0WmxZUFlmQkJsN3BtdFk3?=
 =?utf-8?B?QTlaMWhHczR6V0NKbWFkempKZHM2QU1kbjRGR2x6TjJEaEl2TTIvYmRDTkRZ?=
 =?utf-8?B?TnFXa09TRDZwWVdibjJCZzNiSjhxNVVLNTNGay9ndmo3Q21DdmNhTUpDYmpt?=
 =?utf-8?B?cC9zbmhUVm14eWl1ajhiM2tPQndDeHl1ZXB1ZWJsazBkU1NFbkV5bkdsR2tD?=
 =?utf-8?B?R0tqL3VXd3U0d2JHOGthcU9DZXRxZHVuUlpPWnhodlFMYks5dUI1d0VFL3RP?=
 =?utf-8?B?REZmU2JwdFZ5YnV6TnZ0cjFKYUduTDhFSWdQMXdOemo3QUllVWFBbnBna2l1?=
 =?utf-8?B?T0lPNTNnWk1NcFFhdnQrRkc5RE5jTThwc3ZuVldtTWNBQkkrTVd0bGx6TTZR?=
 =?utf-8?B?NzJSMGo1Z3pmRE9QMWdFTVZaamdrK1kxbE54U3RDK2VneWEwWUFyVlBmZEZn?=
 =?utf-8?B?RU9QOWt3R1BmQ2RGeVR4c3kzdlhiZnhwNkx3bmh6TjkxYXpPb3dwWUdNaVhY?=
 =?utf-8?B?Z1dVbXhkaE8zOUo0R2RtbU93Z085REplYU9ZOUNUV0J0MktXV1BrY0JGdXpN?=
 =?utf-8?B?T3gzRWJPVmMrOVp3bklkMkdQZFZxK3JlWkUwVkJxcXMzaklYZ3dpV21FTVNt?=
 =?utf-8?B?WWxaSXZZMnNFQnRVZHJ1eU5sTVNrUVMvSGxBMlR2cnNDejQvSm5TeDFUWklT?=
 =?utf-8?Q?+v3yG4MwL6BcWKsf0A/EQNrwL+RKd+ORC+YYw+I?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e170019-968d-455c-ac5d-08d9112761f8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 07:11:49.6063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gk0n7yErs6tTFBr6p1IuFsWsfWd5EfzY9BwrBztk6+WxG7rKSTlo5svRzfDEnk+5tNQsZVwivWbHfT2IYqhzHBBlJzyspCKWtVxL3Q89doQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
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

17.03.2021 20:15, Alberto Garcia wrote:
> When the x-blockdev-reopen was added it allowed reconfiguring the
> graph by replacing backing files, but changing the 'file' option was
> forbidden. Because of this restriction some operations are not
> possible, notably inserting and removing block filters.


I now started to work on making backup-top filter public..

And I think, we'll need separate commands to insert/remove filters anyway.. As blockdev-reopen has the following problems:

1. It can't append filter above top node, connected to block-device. (but bdrv_append() can do it)

2. It can't simultaneously create new node and append it. This is important for backup-top filter, which unshares write even when has no writing parent. Now bdrv_append() works in a smart way for it: it first do both graph modification (add child to filter, and replace original node by filter) and then update graph permissions. So, we'll need a command which in one roll create filter node and inserts it where needed.

3. blockdev-reopen requires to specify all options (otherwise, they will be changed to default). So it requires passing a lot of information. But we don't need to touch any option of original bs parent to insert a filter between parent and bs. In other words, we don't want to reopen something. We want to insert filter.


===

Hmm, another mentioned use of blockdev-reopen was reopening some RO node to RW, to modify bitmaps.. And here again, blockdev-reopen is not very convenient:

1. Again, it requires to specify all options (at least, that was not default on node open).. And this only to change one property: read-only. Seems overcomplicated.

2. Bitmaps modifications are usually done in transactions. Adding a clean transaction support for small command that reopens only to RW, and back to RO on transaction finalization seems simpler, than for entire generic blockdev-reopen.


===

Hmm, interesting. x-blockdev-reopen says that not specified options are reset to default. x-blockdev-reopen works through bdrv_reopen_multiple, so I think bdrv_reopen_mutliple should reset options to default as well. Now look at bdrv_reopen_set_read_only(): it specifies only one option: "read-only". This means that all other options will be reset to default. But for sure, callers of bdrv_reopen_set_read_only() want only to change read-only status of node, not all other options. Do we have a bug here?

-- 
Best regards,
Vladimir

