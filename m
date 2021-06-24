Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C6D3B2C73
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:27:44 +0200 (CEST)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMaF-0003Dh-PK
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwMXq-0001Yo-DC; Thu, 24 Jun 2021 06:25:14 -0400
Received: from mail-eopbgr70128.outbound.protection.outlook.com
 ([40.107.7.128]:49826 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwMXn-0002yO-R9; Thu, 24 Jun 2021 06:25:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3VmLT+dBrKgUUOTkKxqZqLwJBqQMB+nf+RH8hoGhiw6QIcC/MColKQYbxp6axverJ3HL0jCDkmbI6xClXiViX6/tS5fHoUaJMZ9V0XFYvgRAop/IVgWomwkSLDwgh8OaikWeysnQ+OLOFJZtXPZzP84eYnsSBywd2CJ1GHXuyAGUUYovdHKjyx9aQ5xeMa2OZBSm66fpl5uuVQceYDjXAUim4OTitEJna1rlwyrCVdwiN0MlWABZUx39wpAJgpjyiy37RAwNZRjVbVtm3GAGv02sO5gAXslj/nbZ/zrAZRoXm5nz0+8BbwvACyVk3qtR/pPlp9HGnZFeSAscLPXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhqUztbliLriIita8yW+PF//Jg2CQLVqhw9cQt9PCak=;
 b=RefZzvU0LibZKxsXA2GP9TzugUGBMvHc449cAvQ9xq/LYJ7GXUrGzVPK6Q7e/mEJExTV+ErS5dxxnw9tdCWupm9W7qzKaw3EktEMJTDzFBkcvGtdD8ukTK9gMUrDwPfnI+eqJ93mD7OpDSgOvOLiUZo5vRRZuel6EXqGe/zoSx17BelYj7ardHuDkYIoPhFnQi40b/XHgZ+NaujZoV59c0iWg144DezbNH4D1IF2YUfE7KtOGfMzhshilQoOK9JFF2ClZBNDTsQptKCrCeio88wDJbqLuZJR0WoLCIMFNiPjQCg9W79oGDnnkC0uGhUr24m+N1rACdIG6Lj4Bd+2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhqUztbliLriIita8yW+PF//Jg2CQLVqhw9cQt9PCak=;
 b=VVoIIqZhJMXFpyo7vYl34i6bsY2R37dcYPonrPhAvxc6EJ22jJfOoTW2TxoSZP54oeSqzmmWxv1ejqbZoAHouWyLt3h79SemLjTkiBbOi3DU/4pGuqvDG/WECSbWywgF9uR29W7Z0EN1C+ZRXmFjov+nmWDRBvSnzMTcLRPbUgg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 10:25:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 10:25:07 +0000
Subject: Re: [PATCH v2 3/6] block: Clarify that @bytes is no limit on *pnum
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20210623150143.188184-1-mreitz@redhat.com>
 <20210623150143.188184-4-mreitz@redhat.com>
 <adfe02d6-4b40-86f1-fa6b-55cf00405036@virtuozzo.com>
 <3c4ae0ed-a7d7-b6c3-1785-f6e4a9efec7e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e6ed8b1d-9853-bfa2-15c2-ab75f9e31daf@virtuozzo.com>
Date: Thu, 24 Jun 2021 13:25:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3c4ae0ed-a7d7-b6c3-1785-f6e4a9efec7e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Thu, 24 Jun 2021 10:25:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d85d9484-ea68-44ec-4e4d-08d936fa56c2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691C7D88D2B3F8599D5ACA6C1079@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qw2X6urJXNeSka3nPya8q0uhBBwvI5iA9e6J7vLRCUvsdCvrrzK7mHOTHdm6U7+WR/MwpRhVHg2JzcOWoRQFmxONdw2QRf+aCMCEsqwaWcL3ZNf7+myBIKz9c6re2flXVba7CIaZVnQ+81NfVFWEIc12guWdxkmg5bEWcCR5AmvgGFpalkuoq/0qZBx0IiHhl/Yzc1j+E77YGoV6rEe1TMGAHOFLxc48P1sML0bRMQPwx7HtEgYFIDVwiJpPGW7bx0q0H91coW2EkUAw7rAa3kld0nawHi2+MB128HiRIsDonvIRTvHcc/c+OqMl8C1XAOtgwq5TIRJiZiVX63M16Lu5k8+qAyEkNOpCtSWprUw2vg3LlnH4HcnOI4iX7AOM8ImuexeLXQt/hwBjD+20vFAe47QHxl2nKX3F6I6H+wJ3tvhianmQyjiSjMGuha50CyO8gTx8ew2EPTs+I/6z6Ni5peq92xo1lwsZpTHhkObFzTVtROHrR8KI9bYdBnJu7vdW1pgVpxxk5nUfj0alizA4DUDCWYDeX8m6nUckSfX5DFhGm+7QNTsvHTiALLSoZwgVFmA6bIwqbU9MMegHd6atNj/gfA3hPznXCZb+LyJAzSkAxekP3aMNLrfRq4ZVbgeAV0qHEAys8YWoP7DVBDzxx3J74LyG2/IXpL47c7JOgNiVPaUTmKUSU+WFvESaPL8duK1v8a4BPp1oX22uSY4TQQXO1QHfp/6xrK9b674JT6HoV8JU2V9yEHthY1HFgQbU9QanhAO620dxz1q69g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(376002)(366004)(346002)(478600001)(2906002)(316002)(16576012)(54906003)(66476007)(8676002)(66946007)(52116002)(66556008)(5660300002)(31686004)(38100700002)(38350700002)(26005)(956004)(6486002)(16526019)(4326008)(8936002)(36756003)(86362001)(83380400001)(31696002)(186003)(2616005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDRJaFQ1b043SmJnWXQ5UFJqelQ4RkNhVWRQV0djbDBTaG8vVURoVW9Fazdx?=
 =?utf-8?B?L3dRcnFtR0kwbjNId1EwelJqT1B1S3UzaEFYUnRFVGV1MXlDbVIzdnBwRi93?=
 =?utf-8?B?UFVTdmxWdEpoU3lLaXMxajlDL09CY2gxL04vaStqVVlvdnR3cng1RTFXQS8x?=
 =?utf-8?B?clh1V3hRNGtwTHQrVkhXRlpaL2d6NFN6dGNoRUIvMEhSMnZOQlZlMG9KWEVW?=
 =?utf-8?B?QjJzVk5ob2tkZFZVUUtTbWdqZlYyTFZscWIwZ1E3d3IzQnRFc3ZqdDJPeTIy?=
 =?utf-8?B?aXVqbFFBUlNTTTNkRGRPR0ErdXJCQVBRcUhBL2RocHJlNEFhTG9RWmhDenBp?=
 =?utf-8?B?TUw5amZlNXg5bUg0MlEzWXZZbjJTK05FenRvU2xDY1VOa2tuUUUvSmt4b3NF?=
 =?utf-8?B?M09BcGFMNnM4djVzQ0J5eDNyN3VqYXlCRE9WMFYyNE9BT3VySE1YVTIwSW1a?=
 =?utf-8?B?UnY2emxEeU9nemtGakJqb3NidWg4Yk9LUk16YnZPcEZrOXZ5VUVnVTVUSG04?=
 =?utf-8?B?QlFXbjYzZUxnTjhRSlg0ZHNXOXJ6NThGbzdyWEJDT0dzdlpOalo1eDVkWStX?=
 =?utf-8?B?bTlLQXg5VS80TlRESjRoZC9yNDl3WWNOcUlrL3lsbGRWUUthTUtuNTVzT1No?=
 =?utf-8?B?dVdvTEJWNVJLRzJpL2FFeHU2L25ReWZYZ1BPMTlOUDR5NWJzQSt1Q3pBakJv?=
 =?utf-8?B?Ulg5VVF6K1MyMzlJdXRhdFIxVTl0Y0lsVHVoeWFzb1JtVUZxeVg3YVZJdW5h?=
 =?utf-8?B?VGRiamZ6blBxa1hDeDhJaXh4WXBtMnQzWXVsa0YyN0hWTHpHTS81bk8rOHdC?=
 =?utf-8?B?NjQ4SFc5S29TMmI1VTh2aEhnNG9wejl2YXFySmw0Mk1wak5GREl6cVZUZEJK?=
 =?utf-8?B?WGp0anFTSFpDNlgxdmFNNzdZRFMvK3BKZmlVWldNMWpxcmlucElNZU9Cb1lJ?=
 =?utf-8?B?RlA5anJQaFg5Ui8rOFN1OG9ybDFTUDlPRGlGR0tQNGdmWUIrdWlJLzYwVjVx?=
 =?utf-8?B?bkZmdlN3VnA0dXBGc2hNVk9FaXBTaUhFTFQ4dE9JcGl2a3MySEl2QnlldTBB?=
 =?utf-8?B?NUFhQUF1c2hwTUNrdmVrZFV1K3ZpendtZHpaWk5OL1ludXdtQmpXMDBlaXVE?=
 =?utf-8?B?dEhVaXgxaWpDa1p2ckJHNGxPcVd0OU1EOTRhZmgyMWxlcUk3clVQcE1GSEtr?=
 =?utf-8?B?UURiVTJseWQvd2M5T3JPaG02SFo3RGd1alY5cEJYZGNpUzZCSXVZNmFVbDM2?=
 =?utf-8?B?Q01URVZ0YW55MFoyVmVMWm9WYWFCVjdYamd2L1JBTk1IdnZxYzR1UjBWSUNZ?=
 =?utf-8?B?dGtRbjZuVStEb0pkaytmOTF2Zm1pNUZBdEtURDZpclM3MUo3c29zZjZyU0Fp?=
 =?utf-8?B?NWs2Y1NlUmhTLy9YNnR5NU5qem15OWtyQlBDUDdNNlVMV3k2Z0VHRnRGOVBV?=
 =?utf-8?B?b1J4cERLU2tQOVljeXBSN3JiODIvL3lnVVgyb3NDNU5sSkRwQWJLSS90V2du?=
 =?utf-8?B?aU8wVk5oaXRjT1NyUU5CSEZLWlI4cFduQm1tajAzQWhqbXpydjJEOXpIQzdW?=
 =?utf-8?B?dXFNSVhvblA0MG9QTm40ZWtTSzJMQ0xXdWxVN2VKMjdEczBlZVBaWS8zMlBS?=
 =?utf-8?B?Qy9nNDU0dnBKWEFtcThzRzlDaSszaXB1cGdKVlI2SVdGcVFWNnBaU0RoTG1E?=
 =?utf-8?B?c2tZNmZIR3d3eENBZ0I3QmduWjhlSUtMdTRuSzRRV1lWYTFzWWk3WWRiZnp4?=
 =?utf-8?Q?6BBEqsc1iWhIxj9BVVre9TJFiBLCIaGtzfd1LCO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85d9484-ea68-44ec-4e4d-08d936fa56c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 10:25:07.6587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+/tZH/3+W86hkw2yAayEbl2UfaU/nIZ7p+IVkNn/k3oivPt5Z0zaDOb3A+bk2ZBsQVW+lTJIZyc3WzodNG2ouPQjZ7wWvF+VONKwpA/Raw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.7.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

24.06.2021 13:16, Max Reitz wrote:
> On 24.06.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
>> 23.06.2021 18:01, Max Reitz wrote:
>>> .bdrv_co_block_status() implementations are free to return a *pnum that
>>> exceeds @bytes, because bdrv_co_block_status() in block/io.c will clamp
>>> *pnum as necessary.
>>>
>>> On the other hand, if drivers' implementations return values for *pnum
>>> that are as large as possible, our recently introduced block-status
>>> cache will become more effective.
>>>
>>> So, make a note in block_int.h that @bytes is no upper limit for *pnum.
>>>
>>> Suggested-by: Eric Blake <eblake@redhat.com>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   include/block/block_int.h | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/include/block/block_int.h b/include/block/block_int.h
>>> index fcb599dd1c..f85b96ed99 100644
>>> --- a/include/block/block_int.h
>>> +++ b/include/block/block_int.h
>>> @@ -347,6 +347,11 @@ struct BlockDriver {
>>>        * clamped to bdrv_getlength() and aligned to request_alignment,
>>>        * as well as non-NULL pnum, map, and file; in turn, the driver
>>>        * must return an error or set pnum to an aligned non-zero value.
>>> +     *
>>> +     * Note that @bytes is just a hint on how big of a region the
>>> +     * caller wants to inspect.  It is not a limit on *pnum.
>>> +     * Implementations are free to return larger values of *pnum if
>>> +     * doing so does not incur a performance penalty.
>>
>> Worth mention that the cache will benefit of it?
> 
> Oh, right, absolutely.  Like so:
> 
> "block/io.c's bdrv_co_block_status() will clamp *pnum before returning it to its caller, but it itself can still make use of the unclamped *pnum value.  Specifically, the block-status cache for protocol nodes will benefit from storing as large a region as possible."
> 

Sounds good. Do you mean this as an addition or substitution? If the latter, I'd keep "if doing so does not incur a performance penalty"



-- 
Best regards,
Vladimir

