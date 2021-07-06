Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB753BD77F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:14:10 +0200 (CEST)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ktt-0000iv-L0
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0ksl-0008Le-0u; Tue, 06 Jul 2021 09:12:59 -0400
Received: from mail-vi1eur05on2092.outbound.protection.outlook.com
 ([40.107.21.92]:39776 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0ksg-0005HG-2P; Tue, 06 Jul 2021 09:12:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Khsdtd2pXRM47+y06V31LvPceEs+a+Wnwl/I8OhT3aQUYuK9DZCaGJb49L04+t5fI3FL/0mgY006j2mOj7JYDIJfIdZH82Hyx8N9m/uStEBNhGdRC10n7S7JMYkEPcg/kv9Z4HLleytsLGt00QFfYZE3hPgHLN5q89nwp2Lh1lBfCRMk6OklLkK+CZLWU3XpKsfLcheCCBKx/kX/w9LnjJyDY1eoX1XwzBvz8tNAYhJ3hDYCYY9GdVxvp8EAkZ0p7z//ofA9bXY6F7twl0wHgjMLk3Yl3aSe4lFTTvCZCyUAftsU+IC02HcUzuCDyYP6SUboFaFpoedWtNLbUauYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y3QFAK1qliM3cP3vjHDUXjcW/zqQe2eizrmDTrrbsA=;
 b=DSb5CORnMwWYdaLXBcntoGI8cBrkdBrRK9IckOfmY+V3v1R4hKmsHFum80zZwNFwCS+JHcaP3a11aeR4X993ZT0uXNRvdvxcj98jPe1sFMdDwITh/gSGJohJtJrHJHwDsehfDhbPdion9v+s4cSXE38M3Epe3o40kAzWHUg6zrS6kfxHZptrh93hXM4t6J9R99MQXWbs/1h55mn78/rG7NRXTAbw93k9XqAzRxgk4MwF0HRAClSkOkJjaDzjG+f7FPOx3+Mpys/UTtkRQLmeIh1jVRjLDN93FKj5pkfc6XCg/f9Wnu3fXjCHC4dvVvqp4CYeENcu7GV7S/GLQjYlag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y3QFAK1qliM3cP3vjHDUXjcW/zqQe2eizrmDTrrbsA=;
 b=WLTyZAN8id0KZt7wfrv91b0yVH+wOkZocvepvtMZKeaWg+u1UXJEgVgZZJCFhU7u0RczRuuiaRunjSRQk1LgJDdM+Rv92FniYnxD+Duma/SdPAYWp9PH9ag3bKNH6VU82YXgMs/S9SdX2KXHCj7z8sn+HjvaN+cuO8ykBEc99xQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3766.eurprd08.prod.outlook.com (2603:10a6:20b:83::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 13:12:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 13:12:49 +0000
Subject: Re: [PATCH v5 1/6] qcow2: Fix dangling pointer after reopen for 'file'
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, berto@igalia.com, qemu-devel@nongnu.org
References: <20210706112340.223334-1-kwolf@redhat.com>
 <20210706112340.223334-2-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9b8d2ae9-d4fe-8643-b384-5de2e8bea5ce@virtuozzo.com>
Date: Tue, 6 Jul 2021 16:12:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706112340.223334-2-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0302CA0035.eurprd03.prod.outlook.com
 (2603:10a6:205:2::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM4PR0302CA0035.eurprd03.prod.outlook.com (2603:10a6:205:2::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 13:12:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0457711c-7686-4cf5-3eb4-08d9407fc0ec
X-MS-TrafficTypeDiagnostic: AM6PR08MB3766:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3766201176247BC54AE2EA6BC11B9@AM6PR08MB3766.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:197;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0z9HyZWM+VVs0shVzkK+d6Y5nqeU1ZKh3mR/0lYksgrBWgMF/8sH+QGkN1hJmKtrlKypVKq5bzIJc2ia80IUOpenE6Hxrvl/i6dZG8HudB4aPjgTLMUW6fPoo3xUzk2H5VThVrWOYJtdYoIlkLDoDaJE1qgB0u07HAIt+U9SiIs+7CgPhdAxf2b7EEAPf8ouRlsJgWADbPO24Oob+YFMpwFMccL50OezshJ86jCalLl7Yrs33U65Iktz6jKDwnICod9H5uyxQ4HPyvaAUqeMAuomue7x5XEk8KfePXFn5ToR9GdRakD1FyqBgTfLy4/8Ypizgz2+dk3YO/eWNfnp0Z4BTu5koi34+0o72lFhGZugcT6P7vhGHoa76mskb/LHAJPBxja4NZ18XZc+FgcCNz4t66mEvklRILO2nTHu1KK5CIRNSztFPHgGKQOWKWlKeZRO4opzpDOORMF7kHFZ6IE2bbbX8Uqo9itOqFCDS/Q5DISwU8afvvqmO6UmEKj9opNCDI0U0wbBLm8qtdIiLOgG3LDXDr0ipyfguoP+4JAe8JNJXaqolE+ujEZnvnnhOmiulOW9dw+S/sq5rFZ4z+9z2D1Yo5d3QHBYg9c1hlPssPT/agfvlpwFj9MtqW9fiR1tvTbxzk6XT5xt4bvST/QoJ61EH8nV1hqMJpfG9sHQZzwtse7/qdigGxBI1YvMNFOPCuAaxwSEYSv/3ofzFd+qYR3NJNp5ncD1j41M+6gkD9/s62FPWZ16IGXhkkBJLJXue+gCVR4WYasSVYqZGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(52116002)(26005)(478600001)(5660300002)(8676002)(31686004)(8936002)(38100700002)(38350700002)(16576012)(186003)(2616005)(6486002)(2906002)(86362001)(31696002)(66476007)(66946007)(4326008)(83380400001)(66556008)(956004)(36756003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVZ6d1d2dTNUK1lWMVNrUlJwcVU0TXAwRG56SkRQZ2k3dXhiMVhSdTVCdm5m?=
 =?utf-8?B?a0MwWGF6eDNTdTIyNUNTRndYZzBzRW0wVE5YWXNOdFZyVCtuUmtTbG5CRENi?=
 =?utf-8?B?T1Y3UTJLeFdQcXl5K2ZkcENFKzEvOUNnWVF1a3IzKy9ieSs0YkJDc1pSU0ZU?=
 =?utf-8?B?RHEvQWpmTFIyOHZScy9jZVRNNWo4TU9BcFRRTDFQYjdtTnFhMVQyVUE4Ynhj?=
 =?utf-8?B?dDhnRFo1NWJWMGlaRmRRTGFqTmttb0VueUViK0RQOUdLT1pRV3Irby81clN5?=
 =?utf-8?B?ZzlxcUl0alh0UUhPZTdKUm84MDdkK1FWTUw3ekJ4WlMwcnduUmxmSDVHa2cw?=
 =?utf-8?B?cEZQRjJiNkwzb09kb1c5d1dmek1ya3oxRXBWcGdoOWU1MWp5NThKMmt1OGE0?=
 =?utf-8?B?OXV5YVJKM2xnQThyaERTQXduRUNBdy9xQ0VHMVpyVkgwNjlYTmRoajlYcWNK?=
 =?utf-8?B?Z1FoQ2NYZXRFVFdCTkRNNzVMV2syZ1VXRjhNemhZaXk3K0dFUUdVbjV0Y1J1?=
 =?utf-8?B?R1ZaWlB1djdnN21xeDR3bkhVeXllWHhhZzhrWitCUS94bGJJZTV1YTdRaTdj?=
 =?utf-8?B?NHVocEEvVjF5TkRLby9vL0NMeENaWHpsS1FHQS9ZZmFtMXp3cmIzbmNFK1cx?=
 =?utf-8?B?RnhiRm1tcjYzaEJUeFpkL3dvVmdHVGQyMndsZFZ0Q1J4ZHhRL3EvaGpCYS95?=
 =?utf-8?B?UUdmSDBNYXEzcUpBbk9wNVpzK3VOdHl6TUVGL25qVWdKRFJQM1Vzc2FlcVdB?=
 =?utf-8?B?NU4wVDZCV09NZTVjdk5sTXRXcEFEeTErK3NkbGl5a09nYzRpMFp4dGVhcGFx?=
 =?utf-8?B?VmE2c2dhWk1iWFBXQk9DRXlGejhZOC9qdzNMMmNGS0QxQ2xWTmdzWk1TdUNq?=
 =?utf-8?B?U2I2Qkd6amZodFV6NE52Vkc2SXhubVVwdWM3YlJRbEl5UHFpY254TzcvWmtm?=
 =?utf-8?B?eGhXWlNlb2dVdkxtN08yZnRGV1NQalE1dWRMbEZIZHdNbWNMMGlDR3pNUXRF?=
 =?utf-8?B?STNDczFUejdjdWxXMktHTjF1a1o5bnZrbG03UTVBVkNPcE1Na3l5UHBtNFV4?=
 =?utf-8?B?R2ZIUG50S2trbUZoMVN5TjFXY3BtT3FuT1RpTTZJbThoRUxQVUR1emNNME9u?=
 =?utf-8?B?eXNGeGpydG05WGhrYitFNVFvWmxUUC82dm5xTDdjTVBhWTlEUjYrSTFsWnpD?=
 =?utf-8?B?amNMcFB0UE9GZ1lDWVoraUJMQy9hNDhIcjhNT1VGTldTTkF1ZXFmZHBSZkF1?=
 =?utf-8?B?L1FpcGprQnN6N29CWUJva3R4ZlFGZTFUUmNGWDFjSVhuT1EzRDdQZGFJaFFk?=
 =?utf-8?B?OWkwMnlUZmpGUkY5SkJReEM2QlMza3VmQmVqOGJvM0JFZUZIbXBZNjJmZ2pk?=
 =?utf-8?B?eFBBcjgwTEVsNWQxN3BWYXRTcGJ0Z29lMXlwY082aTAra3NGUEZMZVNoUVFV?=
 =?utf-8?B?aE1hei9VYUJqUHdSNDRmL2tzbTl0Yy9PdEEzSE94eTZLQ3U5UW9rcUhEcEQz?=
 =?utf-8?B?QndSVVRQZitqK04wTGhMWFZtam8zRDd4b3NUZDNhRVhHNWdFMUNsMVh1ZEJh?=
 =?utf-8?B?ZWdSY0w0Nkd1aFgzaklkd3FqVStVakp6MndyUDAwRmlEZmpNcE96bzVrWk53?=
 =?utf-8?B?WlVLZklVODV3aHZYMTFSNE00dHdrV2dCU2ZrMmU4a0JCdmpwc2tVbFczVmc5?=
 =?utf-8?B?Zy85dnJDR09EdVdCcFh5VWh4OUpXbzVvV0YyazYzdXN2WUJTVWN2bVI5eWQr?=
 =?utf-8?Q?mB6xi3ElJQcTVigx6PlnZFIZVDkQSSzXC8e0hNA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0457711c-7686-4cf5-3eb4-08d9407fc0ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 13:12:49.3239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdFs0kAXiouPpnclY4Wa494bibdQ5pd8BD7/DnDguy9Y4h2P/cLz/Wcho5dArXmvlbfjifwT2IaZhQG8YR81NxuYHjDmHFOAewdreadK93c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3766
Received-SPF: pass client-ip=40.107.21.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

06.07.2021 14:23, Kevin Wolf wrote:
> Without an external data file, s->data_file is a second pointer with the
> same value as bs->file. When changing bs->file to a different BdrvChild
> and freeing the old BdrvChild, s->data_file must also be updated,
> otherwise it points to freed memory and causes crashes.
> 
> This problem was caught by iotests case 245.
> 
> Fixes: df2b7086f169239ebad5d150efa29c9bb6d4f820
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Still, some ideas below:

> ---
>   block/qcow2.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/block/qcow2.c b/block/qcow2.c
> index ee4530cdbd..cb459ef6a6 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -962,6 +962,7 @@ static bool read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
>   }
>   
>   typedef struct Qcow2ReopenState {
> +    bool had_data_file;
>       Qcow2Cache *l2_table_cache;
>       Qcow2Cache *refcount_block_cache;
>       int l2_slice_size; /* Number of entries in a slice of the L2 table */
> @@ -1932,6 +1933,8 @@ static int qcow2_reopen_prepare(BDRVReopenState *state,
>       r = g_new0(Qcow2ReopenState, 1);
>       state->opaque = r;
>   
> +    r->had_data_file = has_data_file(state->bs);
> +

So, during reopen, at some moment s->data_file become invalid. So, we shouldn't rely on it..

Maybe we need

        s->data_file = NULL;

here..

>       ret = qcow2_update_options_prepare(state->bs, r, state->options,
>                                          state->flags, errp);
>       if (ret < 0) {
> @@ -1966,7 +1969,18 @@ fail:
>   
>   static void qcow2_reopen_commit(BDRVReopenState *state)
>   {
> +    BDRVQcow2State *s = state->bs->opaque;
> +    Qcow2ReopenState *r = state->opaque;
> +
>       qcow2_update_options_commit(state->bs, state->opaque);

Worth doing

        assert(r->had_data_file == has_data_file(state->bs));

here, to be double sure?

> +    if (!r->had_data_file && s->data_file != state->bs->file) {
> +        /*
> +         * If s->data_file is just a second pointer to bs->file (which is the
> +         * case without an external data file), it may need to be updated.
> +         */
> +        s->data_file = state->bs->file;
> +        assert(!has_data_file(state->bs));
> +    }
>       g_free(state->opaque);
>   }
>   
> 


-- 
Best regards,
Vladimir

