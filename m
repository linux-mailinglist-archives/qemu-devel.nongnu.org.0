Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA5247C0DE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 14:39:04 +0100 (CET)
Received: from localhost ([::1]:59412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzfM7-00044s-RW
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 08:39:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzfJQ-0002i9-1w
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:36:16 -0500
Received: from mail-eopbgr70091.outbound.protection.outlook.com
 ([40.107.7.91]:29101 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzfJG-0001Ff-4f
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:36:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cN9j+7sc+hAMRkk/mHDTuYhdAERkdu6UhmgZfECkrPnMDsdeJRgj9oDNRZ8W6q6SAfXquVElWE//P6LtWzpxsrt6o/uQyLL42eexFjWIBRcWrp6sNzVkY1Tu8/hbZkRJ77MbyssV1upp3Nrq+ai0OnqLJGeDSqOFJfqZl+5NN4VSYkUvu1eTHS2AfSB7ZAZ+/Dm/GpLQkR4PH3seMBhbmdo2/rgY1mf0hgf0tatHrbh4jqemShpY8P8AUfglvm1XTyK4OCq/kbJcpHL72ZclYMdzjIFQKlnebxVtNFYmESbrsg1d+nGze/naQXWaB9Wvu8oE/uclcehurfI6RqNtMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1OArfTa+oZhNjjY0YjJPp2XBGdlFUh9El8ft0FR05Y=;
 b=UqKx6kZWYCINTmCTbWubqXxc+18pt4yVKDSTjbyEC0Pr1sdKAmxasOMFLgqoiid8TRlciPaPI68hQ5MNjDCnKvUzSNlFcf1mS7ZGPXVjhJGs7xr83HjyXySj7DOt6jOU1ZKLCCE0Ul2689mbvYRCq3MSBIXuyqAvJKIQ+5r22gkv9/IkuBmhpqs/LC6b3/sB8aZLMGyPNPSbdj569ywMjfTUxatr3W3WxrZvtBp0M9yFxMHIrx0FQ5PjLpot/BtYgkWyHQMpjC8NYH16Mca7Sq/XZU7+krI4rovb6t3V596h41s6R7IDsbsMqDCFUDOcJjGl47X3FSStcLRzSPQKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1OArfTa+oZhNjjY0YjJPp2XBGdlFUh9El8ft0FR05Y=;
 b=dy0OdrdDl10p1gT7alJKoxTpnRo8u9e7ln959OM4qyPKw101k3jw1OG9rSrBqm189uDkZnFTui3Hrg/suDR09/lr9u16t1qSmle+5gRrgRn7HPpqxXxq+fYgVH5LfYINLedCI5fwFmDN91M/OVMU6S7xLVCMOkvP4StKHTEeRqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB5531.eurprd08.prod.outlook.com (2603:10a6:10:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 13:35:57 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 13:35:57 +0000
Message-ID: <d9b5b69f-1329-724e-e867-e6c87486a14f@virtuozzo.com>
Date: Tue, 21 Dec 2021 16:35:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] qapi/ui: introduce change-vnc-listen
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
 <20211220154418.1554279-3-vsementsov@virtuozzo.com>
 <CAJ+F1C+v1d49KT9+4n3RiDXfjj+82k7wz3rO_5=LVJ_T5Kn3vg@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAJ+F1C+v1d49KT9+4n3RiDXfjj+82k7wz3rO_5=LVJ_T5Kn3vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0189.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::14) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcef1606-be5a-4225-8219-08d9c486d1ae
X-MS-TrafficTypeDiagnostic: DB8PR08MB5531:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB55319B2A82716924E7CB0DB1C17C9@DB8PR08MB5531.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IiW1nC8KkFiDEY1LnEMV84KiPGjSfs+UaxwiVu/Z4mgNR3IJswIKo1CZqx+OYqeg4vT3qTRqxb9SVzaAquLfRfFoNpM/lwhd2jj1SjyaoFhfweaAa2eoVV2IwrZUm7SSpJuFv4/uhlZKr/3yCCV8NH0vB0RO+g8TV4C8gdVw+0EczR3ktSHcf+Q7DZNEeJjvbB33NLiMvZtwgMoUhpmaFtzw8bIaReXHD53gngSzX7rblF9aekE26E4R5x4tv3BJA4D6dd789xYCiokQv8BLCiYOfbv6evkBKiOtWs1ohdfjEXCo12194rE3LuNEdn/gIIiABENYF1OVMKd7EBSmV1L/WtJVRE9XP3lSA2QU16wkGvugsNagySbT+xQGaYE3A4b+SsFtOfbX1B8mTO+/jSzy+VvNn7qHa/HeQNxktCaYczrCd72TWNwbxn7NZ6izWalDZZg09K+4bnnzgQncfqA3GpR88g2O/oP0Vssz/PsV5rsazfcuWSevSft0AYry/sUzYosuFlL1UFp7Gmy4Rrd/g6HaTSl4GLSN41loRb2yFUJHC+7noAf9lfp31u07vckh74owDUgkxov4+dC4Sz/D4oGcQ8Jg1AJbZy+6BX3xY2vLDOhap4TISjAljNLmet/EQdUkWKHDzDKA7A8fHY0JeXGzj/Q91AlYXktSI+Tw9hX8CO7g+8KL4JiyTUXvFx1m76DWlRo4qgL4omN4083dhTfbqY5zAYmfbju2IUZMdhn0B2JLojKpYt6g5AQ5CsxoJGKONTRzYsNUBHINvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(2906002)(6486002)(4326008)(54906003)(5660300002)(2616005)(508600001)(36756003)(31686004)(38100700002)(316002)(86362001)(6916009)(6506007)(26005)(8936002)(83380400001)(31696002)(186003)(66476007)(66556008)(52116002)(8676002)(4744005)(66946007)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2Z0SmVsN2ZSNFRlK2dkdVVoZTZaZVF6Ym9rNTJSZ3JNVlJQYkFWQkhkZEtM?=
 =?utf-8?B?cUdObzVBbXVBNWFER2ZJY3QrM3ZmbHA4ckxqUnRGZDdjYjhPZkU2VURTaTV0?=
 =?utf-8?B?M2ZFQUd2V00vL1dHSlUyY293c0tFZjY5cHUwM0FuMXpCSm1yd3d2dUswR24w?=
 =?utf-8?B?WkJ3TlNienVDZG05UEdGMGRnNVZNNDNOR0JIWDkvVWZSazc2NkNjdkw3S2kx?=
 =?utf-8?B?dnZvZUJCYUtUWi85U1UxcGFCLzJ2UU5YUjY4TklPU1JHZThlVjJreWI0cFQv?=
 =?utf-8?B?UWU2UVpyN2VveXk5Q0x6MWxoaHZlY05qVmk5QzdHTXU4UUpRWTNXcUNGY2U5?=
 =?utf-8?B?VGJYRjRCd3RPNzdnSjFpWkQ1ODgrN2l3RThsdjlZaWs4VVRwbXNjOHV3dDlt?=
 =?utf-8?B?SEhXL2lQRmk5M0dFYkdvcnFqN1FBOEIvRWhObjc0NkFHRXhocXdxaUttVStP?=
 =?utf-8?B?U05ueHRVaHZsUEZOR0dETmVZRGQ4elBaNTVmbWtYcXhhSzc4VjU5OHlSMFlm?=
 =?utf-8?B?cFZtMVFQUVAyc0J0aDFzbXBtVFRVVXQ2YktYVlEzalNqYmZOMzNuaVkwdjB1?=
 =?utf-8?B?WXhJZUd2TEFvYndIZ2xSZXVpLzVWQXBHd2RzZ0pDMlBMWTh0RXdjbWMwd3VQ?=
 =?utf-8?B?YUxyK1puSStjNC9MT09VRXFtNXhNcEkrVG1YODNaYWZxcTEzQ1ZMMktHbHIy?=
 =?utf-8?B?RG1Fa3NKNDNpZjJ1SFFrbm1pYmVPWGhMcUc5RGUwY1Z2Z254RWplb3NGK0RR?=
 =?utf-8?B?c1ZuQk9lVEthY2dlbzJnanhJNU1iYmtKM1FmM3hDNksyWGlJNGw2cDlhR3Vi?=
 =?utf-8?B?NGdjVzBrYXE4NWJUVGg4dUw0SXRsU1RFZEFscE1HSTg3NUJLMDYyVlVmUXp0?=
 =?utf-8?B?NXpqV0JZNXZVVG13RCtqNjdsczU0ZytIVGVpbjhLSE9oelphS3ZZTTc3YXdF?=
 =?utf-8?B?YVorcUtxRklsZW0wbDJFZmlwd1pVL2hrYnowZHB3VjRhb0xVeTN3OVVnVWNo?=
 =?utf-8?B?S3hkZUJoZ3hiaUVpdklVaG40Vjh0MDhyaDlZMytVYmVCUlRHS2pyMDIxemxy?=
 =?utf-8?B?dVZaNjdqUitaMWx4cDJ3cXM3MkNseG1SUGJ2SHZsWUFnbWE2U2Y0dEQ3WE9M?=
 =?utf-8?B?aEJ5bTQzZkd3alZEd2N0WjFMSjU0K2pxYTlUTlpjazRpSG5PR2g1OE4vdXRs?=
 =?utf-8?B?RXVISUZqZ2FHaGxnRnVrTCttVG4xNmdKZkFQdzh2cEY5SjlvZFpwcmxXa29V?=
 =?utf-8?B?MTQxTGFLT3oybUJXT0EzMU16ankvTWhlZ2M0UURlUGd0ekpjWkJ5M3o3REt2?=
 =?utf-8?B?NlBPT3BZeXNyczVnLzBxbVVSU2tyM0FVWmhYUjNvQXljV3FDSHAyaUU0MVZJ?=
 =?utf-8?B?YkNSUGltVGpZVTRla1ZJRkx5bUtLQjZyWlQ2OGRVWk8xZzdEaDhrTDhFdlhr?=
 =?utf-8?B?UDc0NE1uMVUrazZ2djBQMlhsZkZtSVkwbDZ0a05YWnF6d1VBeWg4b2ZSaytY?=
 =?utf-8?B?WHNZeUtRSEdHL2k5dU5OSDNRRUxERDF5L1FiMEhoNVliRXpXNHJ2SDJhaVFn?=
 =?utf-8?B?ZGV0M2xDcm5KNkNMU2pSNE1VVWNVdGZRd0hTbmpmajEvdy9uV1BYQ3ZSTkpV?=
 =?utf-8?B?cmp3ZXltY2Rhc2hXcWZncXg5TzZnL0NPdkJSRFFab2RMeGFmTTR0V2JVNjRK?=
 =?utf-8?B?aGh2QXFzQUU5NDV6cmhCbnM5TzBhaEMzWGZMN1Rpa01peGVWbzVUTjFLUlJZ?=
 =?utf-8?B?eGRuRE43ZG56My9maHJUbkI5MGZxbTZYMWdsWjh4TGZJODNHekZ5UlBVSzFY?=
 =?utf-8?B?eG5uSlhSalhXNzQ0UkZJWlRSSlZtK2VnUlozQlpQV2xxNVNuYjBLSUdubXZm?=
 =?utf-8?B?OWplVE9wN0hBTm9rQmF5ZFFqR1BLdUljUlduaitxN2ZrQzU1OFVERmFlWjU5?=
 =?utf-8?B?Z1dXZHlsaGpnbkxXaCs2VVgvR1B6cVhxVk1vdFBDQUMzZmZZU0Z0dm9WWkhY?=
 =?utf-8?B?MHZ3czVCUVNrZUxodzNLRWVOUncvSXdTSGNtSWhlRkdSSExPdC94czdzYzhT?=
 =?utf-8?B?aThNclMxc055RWMrZEo1NGFLWlJFVnVCNFl4dFpScWEwd3NSMzdiMDh0SVJU?=
 =?utf-8?B?UVpYRk9sZkZpcThCM1NNUFJkMTZSOTJPVUd6cVQrV3dXL1FFbytvYmRVeDFz?=
 =?utf-8?B?N0EyMGNLYThPSDdkOFFwY3JZUjF4ZllIUkFqekNwQ3I4dVhESTZpQ2xWdC9m?=
 =?utf-8?B?VFRzeGd4YTdDdUdaL0c1cmVuNVZnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcef1606-be5a-4225-8219-08d9c486d1ae
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 13:35:57.4683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjufir+cvODToeST/zoszSvCqUDATigG6BpYHp+2ACqCI1nV0Mizy81WqI2SYUupEgRxKVG+CFHTN9jEIf4Kj1O5R07bIusD8zjs0YeTFIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5531
Received-SPF: pass client-ip=40.107.7.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

21.12.2021 11:13, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Dec 20, 2021 at 10:24 PM Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> 
>     Add command that can change addresses where VNC server listens for new
>     connections. Prior to 6.0 this functionality was available through
>     'change' qmp command which was deleted.
> 
>     Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>>
> 
> 
> Looks good to me,
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com <mailto:marcandre.lureau@redhat.com>>
> 
> Could you write an avocado test for it? (tests/avocado/vnc.py)

Thanks a lot for reviewing! I will.


-- 
Best regards,
Vladimir

