Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1843695F4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:20:02 +0200 (CEST)
Received: from localhost ([::1]:45900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxb7-0003F5-4Z
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZxYW-0002OG-Pn; Fri, 23 Apr 2021 11:17:24 -0400
Received: from mail-db8eur05on2132.outbound.protection.outlook.com
 ([40.107.20.132]:16988 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZxYS-0003rm-Ga; Fri, 23 Apr 2021 11:17:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VijQEnaGyIYZXyvhlA7/kl9z/HF03sqdBvJgKkpXfp9xco2tmS9GTjOxYr5i0nQoOCinpm7EYib8MjvgR/3LUg7viB0GtNqV/YkWz/eVeYAqKEaIDtLxV6h9OlQ1Q+afiVtXB0qISVcV1+wnur0ROkmwoTWlGyrwvWcxgT8QQ5gcllyO1CUtclvE0fjhBNd77Y4mkFv1X5Eld1PevsigBHzrTTCQijjOgmycdeopZMOUBU1dA28qvq+ZpffyWfcX1am+0xQWlux3OTR0w2dHnKOWEeBaZRtC9gAiedEiV6adzWeQgKDpKvU6E/zrZcoYykEXwzENjPFkIa2N8/TBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+y1VLbYIE/iNf/IBsmb+G8jxD9CVgLdKgV5YLwKsOnY=;
 b=fv2JTopBxp70RicjzUVWLyq+Y6PnvvKQesEi3WgQ98LBMt2Hb4iZkN5KvJ89ZYEk2fpkI4yBYpzVFmb+D963Lx7a2GqURFlq+I0y8ndgKxXc119+2SLOTkYqr5TfSEC7vctUbPmKha6VldnEqGkjEP2wU1FOEw6XzjO5jBc3w93apscmRtw9jJrtIsUypWdhbVA7UAtp4PNMpBnfbHpiq0o7O29PwIuzuIzZs31QaoljCs5ZhAYQ3noSx35Y3Zi+F6j/uim48nn8mQt2QJD+g2fci98cF5HjFiBttfeiRtbZk3EvJRk2lgpKP4J7BpxwWsgxoS138wewq1H4TMdYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+y1VLbYIE/iNf/IBsmb+G8jxD9CVgLdKgV5YLwKsOnY=;
 b=SNN8GRDnXWuiKjcVaMjge2PZEH3p4Odk87qbLb2c+bgzo15VpjPvx6twqkSKMKXe3uScoY9+3mKrIxJK7y1t3FkzEOS+p+TGBgKHvd7lI8+zwBfnQ3+WCNvosSaYzl6uV4aud82wGzomexYK+VeGFCuDO9S562gOtuVn0qIs5cQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3445.eurprd08.prod.outlook.com (2603:10a6:20b:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 23 Apr
 2021 15:17:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 15:17:11 +0000
Subject: Re: [PATCH v2 2/2] qemu-img convert: Unshare write permission for
 source
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20210422164344.283389-1-kwolf@redhat.com>
 <20210422164344.283389-3-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a5b14ddc-59de-a942-a8b6-90e6481f85e3@virtuozzo.com>
Date: Fri, 23 Apr 2021 18:17:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210422164344.283389-3-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 15:17:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86f763e8-2c8b-48d6-93b2-08d9066ade06
X-MS-TrafficTypeDiagnostic: AM6PR08MB3445:
X-Microsoft-Antispam-PRVS: <AM6PR08MB34455E072ABBD50483BF18F6C1459@AM6PR08MB3445.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6sHyw530IIvvATpiPtmK7m7f/biNmX6Zp1hBaZDHJKAO3ZAjkkDfL2GnGVDJTSR3YCxenvaW+A6nqw+yIYbV60a6NmM0QQ5PwN39BeSRZ87loGy1/MPnsKR4wkxhl2iBjGvZRCR5cwTOphC7JC+Sw3RoZyJ/TrKM5zWplUJvXs8X0a5gsp47G49uYG0wsLp2YL6NKSzNvNrOOAJtujfLlKXMjMf9OyOl0kq2NEOvNzEQuVESSzjg/yHsQUDagsu+FXxmo6IDEafoh780soESXSKpBqg1dMTx/4kNBCIPRWdrz99T7LPAqQ4TTAZhc9fv4xodOVrezC9oaIYtNO9fLJarQ4XmucESoB7yqXMWN0ZnobTSnc8uuEfGurONZfU/orLLWbyNehDueBgVGHECXuQ/JDF6396iExyWkjDZMTPQU0hgMz4O1Z157b0Hb5BWFg3aTvN1Q5WQ1YUL5w+baohnNijveOWwELF27j4VF9C1iuPEJTtA2FJN7l4LDKvD1LcQ5YGVfIl/bhxHMHQWR8FLFxzvVaTP81XYR5cRv8PuxC13ij9Cs142AMFKbzZ9Vc45BYVNu+D1xbiGyIBqIjH7N+J0VguT/1BA2Gh2On3d8rE/7cl3nAehq1oSOWu14iM+sNHCV24Lud3O3A47fqx7Gkqfu6GQkI71VgVUh/H41+INHPXcF7Ai3Wuula5B729iGfBU7pdqz1eCRcTGNYEGp53xstkI5p49J4JnQNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(39840400004)(136003)(38100700002)(5660300002)(66556008)(4326008)(956004)(86362001)(478600001)(38350700002)(66946007)(8676002)(31696002)(52116002)(8936002)(66476007)(2616005)(83380400001)(2906002)(31686004)(16526019)(26005)(16576012)(6486002)(186003)(316002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2JMNXZQVmw5L2V5YkM3ZXRCSXNMdzBPWGVJd3VvQzRFMDBJTXpaQ2wxWFpi?=
 =?utf-8?B?RWFsTXR2OUxaT2MrWnc4VU8wS2gyT1dheHN3bnlQTkxzNDJNKzFhZTdBUjYz?=
 =?utf-8?B?V3hZMVhaUG1YVXJGNFFaQXBJcVVuZUVFcmdlZHpsODBUSm1VaEhCNGdtTXRI?=
 =?utf-8?B?WEM0MC9SbU1kN1U2eXZNMXkvRE83NXdYZnhYTGtmQXdBU0F5bzlGT0paVjBj?=
 =?utf-8?B?cFBUcS80bTF1RVJ1cWIwYmYyVzVwV3VoUEtPUXh2a2R1ODVKTHladVlramFi?=
 =?utf-8?B?TURkM044UnY0M2dPZ3h2MFB4M0l6MzFNZlpUYmU3U3I0WFlCYjBqZmxwYk1N?=
 =?utf-8?B?eUh1ZmxwbGxleUFETXNIYUtHc2crL1I3KzJDclJWa3dzRUx3ZnR1QkZINkdM?=
 =?utf-8?B?UmwxUjlqT3o1MFZDWDZuVG5DUXBaN3RnMG5HWFNvMGhLeGdQU0RrYi9CWnQr?=
 =?utf-8?B?WkJkaTNjUVZacHpkM051QWQ5Z1QxZ0c0UlVVVW9NVk9yL2FtczB4NlFsNHJB?=
 =?utf-8?B?QmR3RWZSS3R3ZHFFb1ZCOTk3SERoT3hUMXNmN2FuTFlOL3BSR0dUSXY3Uy8r?=
 =?utf-8?B?STdpUDhjMnM1ZG9xeTdDTmhHTDV4RnI1dDRiT09tNmY3cnl4V2tVMTlxbmYw?=
 =?utf-8?B?ZC9VRnJRcXRJVWxra1JSSCt2S1RUOCtNdlhUU1R3TG1ITmU4ZmV4MlhPYmph?=
 =?utf-8?B?dEtKazcwQVl0dUN6aHh3Mi9TOUxaT2dwVWZtRko4N3JxVHZ0eTNBc1lhaGdX?=
 =?utf-8?B?Yk5WTFZvTlgwWjRkanI2aW9kUEcwRTBCbE1QZUdwVTcwQzZIeGNMekt6MVh1?=
 =?utf-8?B?QUtzcENPUnVlczE2aW9UZkZvK08rdHdpOHhIelVIdEM2Y3EzZDFocmRsb1Nz?=
 =?utf-8?B?UWNoWGxzb1FLaDZjdThveGlpNTl6eTJsMDRlV1VBaVArSEswSFZUVWIrc0dx?=
 =?utf-8?B?MTJvc005bW1HZi9BK04yUUpLZlIrbUUxNTFxOElKN0hjSXhzL21YU1MySUZy?=
 =?utf-8?B?V1NaTjdGMjhRME8rZkZvSnUxc2pSWkhsODhiVTFSZDJodFZ3dmQxY1h1KzdW?=
 =?utf-8?B?SWgyUkJzNjlmSTkxOThsb1J5dzdzL0kxVy9IRGtwWkNqZW85UFpNMnpWZ2tL?=
 =?utf-8?B?cFNtS0NMZDRhVGRXckhrcDdzbVN4UDVIOExndHFoam40ZnJrT3dyVmM0WFdS?=
 =?utf-8?B?eHFscE43Y2FkclRMcVBXZWV1MlJrVlplamdkV0tubHk0c3EwM2wrTi9hYmg4?=
 =?utf-8?B?anF3N2UrcWI2NGJuRG1KRmt0MDBlaENublU4RS96N0dyakJyb0hWU2lhMlgz?=
 =?utf-8?B?UTM2ZjBWc2dOb2xqVURlRGdaaFNFdXVpWTBheTZXQ28wSXJ6cXI0R3ByNHEz?=
 =?utf-8?B?K2ZwbWh6eVN0eERCQ1N2cXljYTg0b0JaUmNjbHc2UUVveTBOMk1ma2ducmFK?=
 =?utf-8?B?Uzd3b0lXYnJ0YmVuRFdwTWFaMHBlQzlQUDhSeERhQnNsM0ZkS25QalBGWjRC?=
 =?utf-8?B?YnRiRURNMnIveGUxSEZzVk16TUc2WUpwVHVsT21TOXVSeGsxRWJ1bWY4Z3lu?=
 =?utf-8?B?bG1nb0xEaFhQdDlUSkZTY0tCUEZxTFEzVGRwMFpmeVhHaXhuMWprUUZkMnhM?=
 =?utf-8?B?WENRSjc0eVlEZzNPTVc5K0tWcDlZTFB0QUJwWUl1YkxmMHo1Y0g1ODVDZ0Nh?=
 =?utf-8?B?TmdRdGxzSkdQSUtBS1NMTGJheGJnbUdwWnl5aTJLZnlpY1QwZjNnR3hmVEJn?=
 =?utf-8?Q?rbEW9Q6W0Ohdjk+VWvavB1wwkYdmiKIUQtz68HR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f763e8-2c8b-48d6-93b2-08d9066ade06
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 15:17:11.1859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTvvVNS6KCGtMUJmrZ20kkPA/090MeaqoZ36ru3um5aqmGKjKWd4Xi4EplzLc+AnmVVmVPAIMkwNBllPJGQ1aygjnbxlC7PneBT9X43DANo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3445
Received-SPF: pass client-ip=40.107.20.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

22.04.2021 19:43, Kevin Wolf wrote:
> For a successful conversion of an image, we must make sure that its
> content doesn't change during the conversion.
> 
> A special case of this is using the same image file both as the source
> and as the destination. If both input and output format are raw, the
> operation would just be useless work, with other formats it is a sure
> way to destroy the image. This will now fail because the image file
> can't be opened a second time for the output when opening it for the
> input has already acquired file locks to unshare BLK_PERM_WRITE.
> 
> Nevertheless, if there is some reason in a special case why it is
> actually okay to allow writes to the image while it is being converted,
> -U can still be used to force sharing all permissions.
> 
> Note that for most image formats, BLK_PERM_WRITE would already be
> unshared by the format driver, so this only really makes a difference
> for raw source images (but any output format).
> 
> Reported-by: Xueqiang Wei <xuwei@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   qemu-img.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-img.c b/qemu-img.c
> index babb5573ab..a5993682aa 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2146,7 +2146,7 @@ static void set_rate_limit(BlockBackend *blk, int64_t rate_limit)
>   
>   static int img_convert(int argc, char **argv)
>   {
> -    int c, bs_i, flags, src_flags = 0;
> +    int c, bs_i, flags, src_flags = BDRV_O_NO_SHARE;
>       const char *fmt = NULL, *out_fmt = NULL, *cache = "unsafe",
>                  *src_cache = BDRV_DEFAULT_CACHE, *out_baseimg = NULL,
>                  *out_filename, *out_baseimg_param, *snapshot_name = NULL;
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

