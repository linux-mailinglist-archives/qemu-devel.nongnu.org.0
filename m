Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B70B3FEBAB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:57:22 +0200 (CEST)
Received: from localhost ([::1]:58818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjTF-0001iu-9J
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLjPO-0007Ux-9c; Thu, 02 Sep 2021 05:53:22 -0400
Received: from mail-vi1eur05on2121.outbound.protection.outlook.com
 ([40.107.21.121]:28640 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLjPI-0002DO-Md; Thu, 02 Sep 2021 05:53:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRrHmckhXaBGWl4aQyUweUzdx8gxe5Mm/gEHlwnOK5Ya/6XBLVlWsSOcingtFzgnJcimWEu9DVioLZ5uKbMVTOGKec4J4Oz/IedegPDXHA2hwo37/qAX9JO6aLfuxhbsm6BF2+rEylM5ueaREbIowCR9KwYI33g+TVKZrpuBzJJkSTZ60AiCyWJYcBeCOr48004RorgBGMaczNK/XZ6dLbqZ5sSkWcE77Tq+I+8+tsPRBznshEoG2sxZ1/6VJWbQR1MnTZXhq2KOdor1SVuO2/V1hMPQpljEN8j+8hmizKLbZx0xAXyk9yIUK4dGjr9OP4/ZwMRX+tS1tckNXC3Q5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=V45IId4EvOrOpcCRQvB3CmbSLWBUP+7W3XPv4VriJrk=;
 b=diQr+FAn1VSDx/BK1hnA7sv7TG3iaWagWjiVH29UaDtZHZ/IR7vRGOaG5bvf+qjsFOnAY5AKuIYku2k4gwn5EJKUJTQj7/nRRvNMTdS2YXLH3YAyau368COyIwRDRMQoc9Y5rPqAs4uHNE0lWZ2xcoW6IbMGLChMq/AtEbV9nLZQ/7+/0QfyIvPpI0Syi3IYlbzJRR2A65x9QKbXcwEEGBFMIai3bOArsC8181VAl/DcqWhPdiCMVpE17q+G0ySYn/HnAZuo/osUpxwIYnZ5GQk5rLfgVfa37BF9NwzCr2y7MRM/NeApl5P31u3sZ4BoGktQMP0DiAlfj49hTlLcRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V45IId4EvOrOpcCRQvB3CmbSLWBUP+7W3XPv4VriJrk=;
 b=hnY2tY5678NsrUVVmyWf2awWTZ49t9BR3Q1ZSlJqitqERlYKgtPGK/GT4dk5uDWAza7s0jEdewnEPM7TGMymK7igVEDwEZENNlj188UcJ/GcqPy3imq/c5P8NkHYHZCYfl1lBn17KbL4Q98X0i7Qvl+igq1B9K3ofT7Y8oIxx+U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 09:53:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 09:53:12 +0000
Subject: Re: [PATCH v4 3/5] migrate-bitmaps-test: Fix pylint warnings
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210902094017.32902-1-hreitz@redhat.com>
 <20210902094017.32902-4-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <14fcbe06-01ed-4069-9aa0-568fb6057036@virtuozzo.com>
Date: Thu, 2 Sep 2021 12:53:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210902094017.32902-4-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR1P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Thu, 2 Sep 2021 09:53:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b2711e0-6515-442c-4d1a-08d96df77a6b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6805AD4FD1A114ADDF72E983C1CE9@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6HAlxlc6CKblracbH0N3kA/Yemgz4DGaNZ8/uBU2j/0cckz2T3arPSSyOXhD0VraDkVlzRZW4HhSwMwvhKxLjRWxtg/NeixLhv/12IKboxRsjZgRgnRi26fmd1hQlnuQAw9DXmgJtsKcegWg4ZaOv2oliTxPvPQPHRSdrZu0x+iKRvvl7fGplnY8+UPYoFZh4G19d27Sx0hHRddhKLdcqQxB9TazRmuHr0+iH2ejuEKxa/NuS9CwQgDYr0f4GHaRd1O8gVNCBAtlnUPNj1xPmRYAnkIhl1ZkTecyy/ie6Tx4hNcQu+DYgJYBFpueHEwISHj1AnZWZzhtXuu7mJA2bf92bQD3GeE6PtV19D1I1Y2Ay6+zu43ZW21yxZmlPMwZJNnPk1ApKAp0nYR3brtGVcVp1N0mMeR7gM3uHrR9mNLqI9mTEs3Y1RRoqS/u57WBzM+Tm99MoaOfMh2UPrg90smGcDHjnV1gk2U6EsbtmdKLZfpXg1D5XCWWwk9jzfumwqlUzmeqeUtJ58Lh9k+wwDHYUiQimo7Xow+ldVyZYpeY76aSxc3d2e+WtGpEEDbIB14tCTUcTUPJQxbmFWolbcIDgQhM64O1fw6xRdttHjg9WRdJjRR5sySFV22e1scUoKWyw9Ic3qNGnASnYLywarrJR4DmMNtRagpbnt9vHmkDBb+na3Y43fPBV56t++nES4RBFrXT2eYLV0VYPmhFNvurQMsEL14ZpegBB044oiOBuBD+m7bpODMc7VeCIo0o53O9yANsSwxSNl/OOoQ6hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(39850400004)(376002)(36756003)(26005)(8676002)(54906003)(38350700002)(38100700002)(956004)(16576012)(8936002)(186003)(83380400001)(6486002)(66556008)(66476007)(52116002)(66946007)(2616005)(478600001)(31696002)(2906002)(5660300002)(4326008)(86362001)(316002)(31686004)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXlOT05ubUJjc044VW1MenR3aGxpdXd1SjdXOEE0akR3YTQ5UTBXVWlEQWww?=
 =?utf-8?B?Z3UzTk9SbEZsc1pDV1R2Y1BjR25nbEh6UmhLL2xnMlExRy9mcmRnZHBJRVpm?=
 =?utf-8?B?N0V4SEtUWmVZd3hDdkFLZFY2Nm9yZjhXdytWMW4yOHU1dG92Qm13c25CYm1x?=
 =?utf-8?B?S1oveTVHWjRMVGFnV0tTVWlvMVlxT2t6andHN0JxWEllQlhlemxMa0VsMFAw?=
 =?utf-8?B?VENEZlVqWUZVRldMNWMvTThFYUh1eHJ2NGdJdjF0ZkFOUUhjSlN5L0lEZHBT?=
 =?utf-8?B?Q1orVEt5QnYyTk1CUmV0R0I4Y0NPNTg3TnF3QVZjQ1JJT0FSVUZMZW5WQWtk?=
 =?utf-8?B?cXRpNi9TMi9TM3d0WVVjQTRHeVZwVzVvbm5pWGtKWHU4bHcxUWU4K0FITVQ5?=
 =?utf-8?B?eVR6M2cxQmNWdFQwUEh0Vlk3dUFjUk42dGwvUG9qbXo1NGlwblVJWlJSOVFT?=
 =?utf-8?B?MjhwV2treHJ3WnVYL2ZROTluemhyWkthZ1p0OFlWRjZ1MWlrSU5LSm4xNFM1?=
 =?utf-8?B?VDRoUW4vYi9zVUg3WFR0eHFrQ2F6Q1VmWVlDajVtQVVWR2wwdkVXU0dDUkxH?=
 =?utf-8?B?K09pdVRLT0ZEL2pEM2h1R2thVCtLcjRoV2wxUDJHRGpDRjVhWHdJRmZaanpO?=
 =?utf-8?B?Z0JuRk9hTU9NNTFsVlVnRmN2REUyQVNmYnp1VGxsSFc4YWtkWWZUMWUzakR3?=
 =?utf-8?B?RzZNaFlGRy9sU1I1NHM1QnRxSlR2c0dCSVJZYUY0VDBrbTg2a1RjQkFzTHcy?=
 =?utf-8?B?bUFvRXVKc1piRjJNck1IT093MmhJTTZpMWpzZkl6SzdzMTQ0b0htaVBOOWZL?=
 =?utf-8?B?MlcwVXhzZ3d3aU1FUXdlb3hYMGVkbHdiWXhaemlMeFB2RHp6akVmMkZTNGhk?=
 =?utf-8?B?VUhLTzBoZ3d0b1JlaHNMZnpJMFBaMWpBVS9tK3FvNHpSUHpjQldpRGI1L1FZ?=
 =?utf-8?B?Z1g0N1c1TjZLUW5kUmNMeS8zSnFNcks1NlFJYUdET2ZEQU5aSmoxS0hrZHhW?=
 =?utf-8?B?Z1Z2dEY3NS94S2h2Y2QxOVFRSERXWWQ1ZG9QS2JTMGRsRGJGTW5RWHdmM2JL?=
 =?utf-8?B?Q084UDFuenBZNkN0bXY2YklWR0JjanhYTmNlczlncW9VVUEyMVhXaFBoUTV0?=
 =?utf-8?B?RmRKRHdaNUxzSUk2YmpNZWJRNHEwQ3pnTVBjNnlQNFkxa2ZFMXNxTmtXaURs?=
 =?utf-8?B?MExVNnVYczJWemVFSGl4VTFoZy9qVjRaOGcwOWptMU0rM0JQdFQ0VFRkR1No?=
 =?utf-8?B?cnZqbFdqdm1zRkdiZDUwMTRQVGFKTlBIck9HbUQ3ZXpTVnoxd3dORFJqekEw?=
 =?utf-8?B?eXhUdmkxMGVzbDlTTS9aTTBDVGJ5TXJKRWtCd2IvRndHQnZObUhJTmxHelhP?=
 =?utf-8?B?ejZ4dlBpSWpJUFFNSGhZdkxhcnpjVW1EMlNjL3pHS2JBRWJucDU0cWVlVHZV?=
 =?utf-8?B?VFFsdnNCcTZTZ3RKMW5qdVVzSHBnRWQ1cytrWXdYU2hiaCs0NjFuMmtIaTBB?=
 =?utf-8?B?U1dDL0NMa1IxSlFqTDgyK01WVWt0VkFsbTgzTXBtRG5tTlJOZVZpc2NtTERo?=
 =?utf-8?B?Y1pwUnhabjAweVBkaXZpRzRzaFZkZnhycjZoS0d1RzRIVTRydWZLUkVOZTFK?=
 =?utf-8?B?eWR2RkVnZnRDVVlKWmlURmVpVEVHTnl2SEFGWllpd1d6QUwxV2JzTk1ja1lE?=
 =?utf-8?B?Q0x6WGcxbFYvS3VlTHBuSlRBdVdHQVA5amNNVXpkRHlhQjZPYklpQ1krTnFS?=
 =?utf-8?Q?6ENw89FC9yMNGkkYw0cr4zt+9vz+yf6MG/9iEgy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2711e0-6515-442c-4d1a-08d96df77a6b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 09:53:12.8445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVsFdTsnHpUW7gyz4dIjdQDV1qXFRfaNNNpU4oXGDwGWuEe9NpDssBZBLG37KtgJFxBrK5IyNsOPvPu9L+pmSkN6Zu4giVX5soKFFXE1p9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.21.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

02.09.2021 12:40, Hanna Reitz wrote:
> There are a couple of things pylint takes issue with:
> - The "time" import is unused
> - The import order (iotests should come last)
> - get_bitmap_hash() doesn't use @self and so should be a function
> - Semicolons at the end of some lines
> - Parentheses after "if"
> - Some lines are too long (80 characters instead of 79)
> - inject_test_case()'s @name parameter shadows a top-level @name
>    variable
> - "lambda self: mc(self)" were equivalent to just "mc", but in
>    inject_test_case(), it is not equivalent, so add a comment and disable
>    the warning locally
> - Always put two empty lines after a function
> - f'exec: cat > /dev/null' does not need to be an f-string
> 
> Fix them.
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

