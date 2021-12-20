Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2DD47B1A4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:52:52 +0100 (CET)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLu7-0005SV-2r
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:52:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1mzKNh-0000Kn-Ct; Mon, 20 Dec 2021 10:15:22 -0500
Received: from [2a01:111:f400:7e1b::724] (port=32608
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1mzKMy-0002ed-NQ; Mon, 20 Dec 2021 10:15:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+nWoYOhl/aHXdmvjXzwI+XypAFgQF+OsoSckpQ5Bal2nSsdI3blcGt4s6CyvbLk6aVLzPmOTAqmAygeaXbCvgFVypt1lSCO/frTIv2g7ibRH++WA1bHznDBKQdxJRS+TImvmhxKA60VqI2Jx+1auBefH/2RM8GLJqfLn++5ELPYvCDxgaN4bFVMC6YT7YVSMeu15xP8+xLmCYLWno62FuZv2+bNdokpbM+XYgEcniB/ngEeVYOSxDQymtJSDVIZwEFRqJKkGMLsNUYRE6FnNkofamYKPrXljwikwc6xslNzZ1rlChL6bJTvUFsQBrDc3M1i1fuR8gc4DT879n9VOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulPxr7/uCgV4FuRWdZ3afcWVrGKBKLW38DDL6j1ST0A=;
 b=VzoFGtFYvl1hP96bL4McBzzoDoCFFwbooZUvbEETnK+1Uwjal1WVnZjuoga+ik5e2S4cNUgv0DAOqIgQLhHD2Qo2lMH5FiyAY82dasbmT48EJlhpnTbqyC78xDi1nMiWLqG58Exur7jZjWNyjFR8/7Kg/QmvfxRSrxyoO64iTlKdeukNtQBsamntUMXui3ul4qQefZblUyhpPphccKj4OVBdBcXjVqJ1kCJR433orlRN6tQZATkgepJajH5NTuN/pmeKeVEWp8qHFIpueBLZS7bZOcnXrCBx/oKGNOPYHsvYtMp+QabFSBa2lr8W3jcyuSvgDFhQmdlbhBCYlXsICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulPxr7/uCgV4FuRWdZ3afcWVrGKBKLW38DDL6j1ST0A=;
 b=B1FGF+Pznb2Q6IRlidb/4aEG2M8Uip7tp0uZ4nla/BzzSVXu+cZEHHQY6bAspBEb9IqUhmMLdDgQPVr/W/vvLOFWuz8gXui3Dm2umFmh/Ms0qF2H7T0A1XyAOVJz37vSCvJXF0zR7UIM/b4Hn5FjcgFLV5lwyEDswDvC9ZPmhZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by DBBPR08MB4554.eurprd08.prod.outlook.com (2603:10a6:10:d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 11:46:59 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 11:46:59 +0000
Content-Type: multipart/alternative;
 boundary="------------135HcZfBesxlXjR0ONFlSeDs"
Message-ID: <327457f8-a9f5-bfaa-39f5-1d2f8458a6ee@virtuozzo.com>
Date: Mon, 20 Dec 2021 14:46:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 5/7] For qemu_io* functions support --image-opts
 argument, which conflicts with -f argument from qemu_io_args.
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
 <20211213153240.480103-6-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20211213153240.480103-6-vsementsov@virtuozzo.com>
X-ClientProxiedBy: AS9PR06CA0053.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::15) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba118ebc-97fe-4ad8-04ec-08d9c3ae6e8c
X-MS-TrafficTypeDiagnostic: DBBPR08MB4554:EE_
X-Microsoft-Antispam-PRVS: <DBBPR08MB4554BED5A939BDEF9AF48DC5867B9@DBBPR08MB4554.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vD1Y1yV2y5O1z+1L0uxtxfxgb4v9N3MRo8Sp3zDGfEUK5hYnIIF0F+eu90IHP9FxChpy6XoHqmfh73dCDakqlb9bf12C2pdNqSxg7eBhluZIlnU5WCiFTAEZmcSFNGCaKHnQxzl6N5NDAsuwU++0Exhogoyw2iFbOuQGxFndsq4FXIkkF2BlgzQ49tn8uK+czPr3F1U3npUcwLZGSYE0qEYV3zSeXt98VT08WT9xtLX/n7w2x8vpoU1Sfb2keRl0xQ0UxJUuRNuMtkIaU3Cr6tV63Ggdftmhsbd1xpZIaUX5li/YBbW1pMrhAVQln+5poayYQGW7PU0U7h9q1kZW7u5LC9WsByYRGr0eT57aCd3eEFBILBptc9IH3pL49Pt8hiZHh8odXy7kNsQebQrvwo7554sd0jqB3metJv4sI4zrltD3IfBuQj1K1FT4V1vFmmo3n9M5lmKtyx5rSdzIL0jGqnV4nhVRtvtQ1hWbKbH6wKG1rO4ryiS4pZFuuvRagpdyk6NZgCm8nCh9Shclm7JHsJZ9vGtHf9Hgw1IZPn2M9YmLeZpV/c6z0VKZB4t7Vav9rwC3nQ+RHeZgGvl3RibooaieQA+SCuARKvijZ/6xn1TrDi/knl/PycQyOLTe/dHw7OQb9HeHyfZpJlQ24jbr7RirZDkg7WUHMH4QPeam6+u00tqsIkHE+a+P7qRmLcakOHwjBQCjWQb6K/eLT467O+lCigPWu5yWYG2YM6myZTCNVwfYdDl7EBxsMa12leMuV3Kmkc347DDpyBm58A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(6512007)(86362001)(38100700002)(38350700002)(186003)(36756003)(6506007)(31686004)(66946007)(26005)(33964004)(5660300002)(66556008)(66476007)(2616005)(52116002)(2906002)(8676002)(508600001)(6486002)(4326008)(8936002)(53546011)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGxTOW4ySXBZV2tPUmZ6bi91Q0ZMaU9ObmNZekdsUEs1R00zY3BYdEp5cFFG?=
 =?utf-8?B?WG1FQis1bHhUeUFLTEErSy9pa2Z2NXZEelFOWEdvUUU2UFFBUVR4Y25lbW5o?=
 =?utf-8?B?amVWVzVad1k0RzRFbk1yZWN3MzJmK2NMUkRaZzViMzB0MFVUNmdZSjFoazdx?=
 =?utf-8?B?c0FmSnlpdjlnZisxbUZCdkhZQUpBZy9kdWFmVVpTNEM5dS9SR0dwTGVBcWl4?=
 =?utf-8?B?TmVUK2ZKNkV4cVB5SzhNdmVTNG5NcGErU1lHYjN3VzhNR0tZdURsRHpwODFV?=
 =?utf-8?B?RTB0SS8wYjlDd250a2x4ZWVQckJxdjkvOFhsR0lRNGV0bHlKdkFOUU9nb1NN?=
 =?utf-8?B?elJyZVBRaHNaR2Y3bFExTkxvZFh0b25Fam84VTY1dGE3T2dSS084cmJ0cXVS?=
 =?utf-8?B?RDhBajd1TXpZRkYwMVk2VTRlTGthYmUwcTgzUXJzN0F0SnN6MFcwTTFkNjJ4?=
 =?utf-8?B?OWdhNGdLMm9Lc2lucExvQm8vQ0lMQXI1ZUxLR3lIdkd3TmRsaWZXcTBWc3lv?=
 =?utf-8?B?OUdXUGJxUUhDcy9mTnM5UU05T0NTR1dHa1YwUmFnL2hTV1R5RDZta1dUK2Uv?=
 =?utf-8?B?MStuTnFDaTFjYm93aU1uc3lMRlU3MkJlWnZUanl1d3dOS0ZkSE9TbkJuODhK?=
 =?utf-8?B?ZzhXSVJuMk9rUmdYUC83bHZwYUVHck5RU2hjOUQ0WVNVcDUzWmVObjFOU0Fh?=
 =?utf-8?B?eHlad0ZQMi9qVENNNXhNV05YN1pnVFphNTJXYmdFeHErTFdNMC85cTQ1MTdm?=
 =?utf-8?B?SWRIWWwyazdldVh1clFPekV1bFZrRC9IeG8wRjB5R3p5Z1V1Y3o1ZlB6SC9D?=
 =?utf-8?B?RGdsc1ZBMWN3L2N4UTk2ZS9WYXpKN2F3eHlWeXlmeFltTXZ0UW81WmVrdzFq?=
 =?utf-8?B?UkI0YUhaUGVFbkZqSklYd2NPeStlcWxYVWFqQ2VGYTNIc0crQ2VxWmYxWWY4?=
 =?utf-8?B?NEs0OVVuUmdwVDk4WnhjbUcveTA0ZTNUTkZsZk9PWGRDVm5tbDE5THRWQ21P?=
 =?utf-8?B?aDdtdmhuSnFXY1BFb2pxYy9ZLytmY2FqbzE3TW1EQ1NvQWdrRnp4QWlKQThp?=
 =?utf-8?B?RTQ3SkViRk10ZzlhV2c4YzR2Vk05VDZSU1RsUHpYckVlSGlwMVpTeHZSM3VD?=
 =?utf-8?B?dnlrTFBESFBJTFdyUDZNVEFKcTF6NWpraldmMXVzU2duV3orUWhlaWVMVE1i?=
 =?utf-8?B?aFhjemJiRWxvQndHeCtYbk0yakVETHVJVXBYWElZUEl2ZmpqL2JvcUl4MUpZ?=
 =?utf-8?B?L295YzVuclhiNWNFWXpWK01DVmNydy9BVHZadWVRcGZSWFN5bFFkNDlaYlAz?=
 =?utf-8?B?emJqQllUcXVPWkFHL0lGSDZPaHovNmI4VllwOHJ3QnFwdHNGZFM4VndkbnpS?=
 =?utf-8?B?R3RWb2lDZzgyaVhNODNteFZGSUMvVk9XczNvbStRVGJNMDk1U2lzSngxUlVu?=
 =?utf-8?B?eUgvMGY5RCtPTHlTUUhBaWdneEk0dGYwV1dzSENXWDU4dS90ZG0wQWdiQURa?=
 =?utf-8?B?N1RFbStRS2ZHNnh3VnBIbnYzMk1jMDNqb1FVVzI0N21mL1dLN3U5dmVUYTlS?=
 =?utf-8?B?RXRLZDBoOGphc09UalBTc3czOTk3bnZzTndJS0M2YkUxaTlqcUV3SHgxREtx?=
 =?utf-8?B?cmJsbXVOaXRjZHllU2VqWG9FT282ZEs0SmFpdFV2RGtDZFVoRXdvei80WlJh?=
 =?utf-8?B?OHRDd0pUdkZpRklTcjNWRFNoeXVObG1RRm5WOWFVU1ExRVZVa0ZzdE9PVnpi?=
 =?utf-8?B?a0o4dFpqelI0VUpTb0FFSHc4T0FKOVlvcVhtckNReXVXSWQ5Zk5lUDJMaHFX?=
 =?utf-8?B?SVZML0VONll3SUhlN0l6RWZFYlVORDFReDZ3YzB3V2k4c1RsRUJWYzAweUdu?=
 =?utf-8?B?Q2hlV1QvVGtVYVhMTW9ZRnR0bW1DNVdXZzdVYm9mRlBwMjhZTHV0Z3RqZWpl?=
 =?utf-8?B?WUFpQW1jNTNNanNJSGRTU1hpYVpKb1BOa1F0c1RUQjNJd01CSExKUlY1T296?=
 =?utf-8?B?ZXozUm4zVEJuVmQyL3Y2eVQzUHdUVVp2WGFTZGt1aTQ2bkxXUnRKV3djUjBD?=
 =?utf-8?B?VURoaU5jbnl6WU5WMUtkc2Vzc1VheGhWd3pwb3hhZm1oeUp4WUxKL3l4OGQ3?=
 =?utf-8?B?QitHRDJya3hVWUtmOGNVaGlKa21YMWZPM1o2M1ZVeUs1L092eU5VUHVaaVJx?=
 =?utf-8?B?dlZWbUlxVlV1cVpSaW5OQmNoaUROSSt1dklvK0pldmlCU3AzSEhiUUFhZjBy?=
 =?utf-8?B?dUFuOFdOZm43R0tpdXNrcSttemt3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba118ebc-97fe-4ad8-04ec-08d9c3ae6e8c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 11:46:59.8510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjCk6KXBrPHjxP1avBCwi10uSyuUr1XDAFSNme9JxlyCH7gwVgxy2pflAn6mikkAhu3j39KH2YYhAv5KziQTdsi3bAwlymXDO2ToeJ1Z0/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4554
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::724
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::724;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------135HcZfBesxlXjR0ONFlSeDs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/13/21 18:32, Vladimir Sementsov-Ogievskiy wrote:

> For QemuIoInteractive use new wrapper as well, which allows relying on
> default format.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>



Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

--------------135HcZfBesxlXjR0ONFlSeDs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>On 12/13/21 18:32, Vladimir Sementsov-Ogievskiy wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20211213153240.480103-6-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">For QemuIoInteractive use new wrapper as well, which allows relying on
default format.

Signed-off-by: Vladimir Sementsov-Ogievskiy <a class="moz-txt-link-rfc2396E" href="mailto:vsementsov@virtuozzo.com">&lt;vsementsov@virtuozzo.com&gt;</a></pre>
    </blockquote>
    <p><br>
    </p>
    <p><br>
    </p>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a></pre>
  </body>
</html>
--------------135HcZfBesxlXjR0ONFlSeDs--

