Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259BD47B0F0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:11:34 +0100 (CET)
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLG8-0004FJ-Ks
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:11:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1mzKNQ-0000Jo-5h; Mon, 20 Dec 2021 10:15:22 -0500
Received: from mail-eopbgr30135.outbound.protection.outlook.com
 ([40.107.3.135]:64422 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1mzKMv-0002Wb-Jp; Mon, 20 Dec 2021 10:14:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSpa1cHJof0JqVsF6Ce/tLzafjxlhB9F+alTljqBabwmnSjDHW84KGDdiHxqn2buzpaQRUO6Ee7sbggbWEnqIIddyTfQhwv60jrZ0FQCt07a/ErPh9VOB6GS6arzXsES01xfCylOo/lG7rO4djt0VwS/JuinfNs9uMb1Lg9irFn9/OE0HTJ+NqGpK8NMK1GP2fubsTw/sMdIHlK/3HZ/J3pT7SavUjCRyEdGBZNYZt09SO0nwglUQV/kCHeTOUx25FYn6Jz0E/tkWxiXWfcfEElGSQ/mgVebHFUKbR9wo+pgTpT5Y3LNF9W5jvxaVSHKSkLFBTdLXpRQ+Awytpi3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kznaMHuXd3HBFCH0TxE5NnxIjYHj9CiCuok+kqIDNo0=;
 b=M9idvki3VxuNjkQM5sKFU8l7CUBCvGknQbcXfeOZkw0Q1C6qj0fmiT1OHlRE8crs6Ul7AKfeh6oPSMn9PUX8Mry/C2IHEuei4PfWQ+oioOnuPhZAVC8FU67IgZpsecn0W25WdtwH3A+Ni4/Ysli4vUnlEDsBFXBoyJeYVOGpEZMQMKsz93gbImPFtC62GAJtwJyDt44ohSuBkGCyJtje96EAoxy2y7rY8dZ9rUeDyzqkEpQWWoG7zxO7MtjucrAdt4hCL7tjv28/HX2hRBVVVAmXuz5ipW3Y0wrGJNpVyL+noheSLha10djH9+1LMoRldn4UZ6kVfKg8ij+KM4VCPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kznaMHuXd3HBFCH0TxE5NnxIjYHj9CiCuok+kqIDNo0=;
 b=L9IrLcjfjgpjYdqqXTTrFCu5dUmsntTBH0uw0UwMCPSx5mS8hGtOpCZgeOtNCoAth+TyA1HAH4aO0o6JvenyXrreopCWLstsKJZGFs/U+OQlQtawdWegO3o6Q7e2E0JBsOQfHaivkyC5hY4kifVr6zMzeU16fNNes7nyYvhyNlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by DBBPR08MB4554.eurprd08.prod.outlook.com (2603:10a6:10:d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 11:47:43 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 11:47:43 +0000
Content-Type: multipart/alternative;
 boundary="------------RjuRrT0Jk67Lm79eH3dZsAo2"
Message-ID: <e3836d89-e2e4-1b02-a0f5-9b68790161a4@virtuozzo.com>
Date: Mon, 20 Dec 2021 14:47:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 6/7] Add qemu-io Popen constructor wrapper. To be used
 in the following new test commit.
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
 <20211213153240.480103-7-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20211213153240.480103-7-vsementsov@virtuozzo.com>
X-ClientProxiedBy: AS9PR06CA0215.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::22) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 935fc92c-e29d-4a37-21f3-08d9c3ae887e
X-MS-TrafficTypeDiagnostic: DBBPR08MB4554:EE_
X-Microsoft-Antispam-PRVS: <DBBPR08MB4554A27AED462F6CC3A54DFB867B9@DBBPR08MB4554.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/tOLFFP4HzgdeUGCZk+4lLWR0dJp5DAllG+d2yl4jfGL0iNVduNP3zzUva5v7iCW7Km3E99EG8GgcA4N7nqM9PW0mQilHIHKbyqq6mq7/6geIW1LtHIUWwM1lb0TmWfcNxju6hm77GVdeH0at5HfznU67xy9Vtt6wRhu6wOX3Bzdszt7ziGdAuUjyY1suh4j90zMo1eSJcrVxJyIYPW2g2zN71POsDpiIsZ+Zb+OKLdRNaHzdwusAWT6NFMqfhDpRJKx95A/Fo44OmPVSbuUv9VdAwQTXoohBdRMb92dF0UJTf/lvgDiQJgUk1GHOTIxdKH1eQN1MXbhf5UuxKg7kFKWP6GtbrAugqrETvcYknO6uuTlCNOLrlsr5w57USjT9trcLHjHfT/JARU6L5Kg1zx3gLbv1qeXTE2cnu+IdMmEsTLpEZI1VXnJVQz3PgC8AZWjyR3GkPE9jXAGQgg4a1g1mRlUxcetfxD43EAXopsoGqfPHsAhKGMCmu5LO5hYc+PSpRuTsMK79HylrfvXsDxPJLDAsnZ/CVKtaYyq2wGmvpLCCLKL1gJXsNKEMHy/rbRVui6aG/U6Fi0Don5Miki3Q+mhHeY1XBMIPsdz6yXC91htxv/R8wHYIkkv42XahYlfEZh8XAwEdP0JWLHFTnSYzOVf1hbyKsSZlnnpm191ViBTRabJyjowQRGW4Kl2+A7M9xBxmU/u5VF3VSAgNn5O1OVSU+h2APYRm4zI0SqNvCZ9ejP6uFmGnD9GvYzkhU2erJ9RcUDBcZiFDEVJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(6512007)(86362001)(38100700002)(38350700002)(186003)(36756003)(6506007)(31686004)(66946007)(26005)(33964004)(5660300002)(66556008)(66476007)(2616005)(52116002)(2906002)(8676002)(508600001)(6486002)(4326008)(8936002)(53546011)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnVXVEtFRExENG5PVE5RalkrM0tDYXNmdkRnOGlIcTh1WTFSUlpvdmpzVlFn?=
 =?utf-8?B?T2F4bnVmYWtsb3RBNGZ3cUtGZXFBc2tuMWZ1aDZ5VmJwUnRQc3czL3Iwd3Nu?=
 =?utf-8?B?RjEyUEdLUnVWUVZYelVDM1psQ2NvZXBlQVhTK2EyWU9oRU42eFowNW1ROVR1?=
 =?utf-8?B?Nmh3emYxVXVQdnNxdU8xY0FTc1AxVE4zQVovYmJhMUFWejZObzRpYWZ3TkFV?=
 =?utf-8?B?SCtJU2F4d1NYUW55Zi80b2RZOFNEL2F2aVBlNG1Udk1LeUpKZ00wSFhVRFFJ?=
 =?utf-8?B?Q1ZyUkgrMUhlb2R1Q1J6anllUXkrZTFmWWJuTEViWVZ3K3RnWENGdHdSS1Av?=
 =?utf-8?B?ZXl0RWxVL1RCemcxbmF1NGRMMTQ2NndreXhheVhFZUF6K0RvNjJITjVrZTg0?=
 =?utf-8?B?a3hkREIwWGI2UGs1dlJaSDBBaU0yQUJlZGFJcnBtc1RlSlduMld5VTB6NXhm?=
 =?utf-8?B?U0dsZFdhQVlXNWZNdEJISTVidGptcGZidUFJL1hHMUVyby9WRGF3dnMxdmw5?=
 =?utf-8?B?bnUrb3AydkVPZ3JBZGFXN3Ryc29iSnd4ZnZyWWlBaVV4VFNIQklNQW9DT0dD?=
 =?utf-8?B?NHlvQWFOMTladVJ0emJtZm1nYWJkcSs4bHB6MlZRYjRzUkdOTVNaQ0xkZ3E1?=
 =?utf-8?B?WHVTQTkweDUyY3FnUlRnNFdFRVluTU5ZdlJTVFMvTVNOSXNnMHB1YWJQemZq?=
 =?utf-8?B?Vmt1aUxhMUpERXd2ZG8rSlRHWEN3NCtPOWpROHZtc2d0NElBdW40L2thMHZZ?=
 =?utf-8?B?WHJSNUlFZEQ2OW12MlovU0IzTmFNNUFtZ3BqbElEdTVaWWxtMTZPbGJIZUVJ?=
 =?utf-8?B?MkpGdWs3ZXFyd2lHaUpVaG9iR05pT3NIazczc0xjVi9sNUpjZ001WUxpMFE3?=
 =?utf-8?B?ZGcyNkNkTzZwb3VLeEFmUGhjVmNJUHU0T2tiRDFzdEZpNkdzZGVnM2M1Mk82?=
 =?utf-8?B?eWhLVjFGVmJ4cHBIWG1Lb1hlcGI3ZGppeDVWY2ltd0hrSFd0eU5POXVheXhu?=
 =?utf-8?B?Sk9zcFd6T2wrYndtNE41KzlNbUYySGRRMlAzakVPOER5YVNoVERUMU1OdzI5?=
 =?utf-8?B?aFppL05ZVU92UExBbEdRQkpBOXdWZnczZzZqcnNPQTN6ZlZaK3RCUjlHZklU?=
 =?utf-8?B?MUdsNG9ScEZnNlhxMG10eUpxeHhwQVlhTFN6Wm02ZFMrTzBudnRWOUgyNWs1?=
 =?utf-8?B?b0ZCTGJ3OWVPQXVpQnpxd1M1RFVuR0xZSlRzYVNtbTJHN3NjdWpBeU1tc05K?=
 =?utf-8?B?czFwVHM0Z1Y0eXRaQllkc3o3QUJqQVdPZ0d1SEVacWZJd1FhZCtCYmwxRVdw?=
 =?utf-8?B?RUdlcTA1cmM1WHF0RmFXWmZBLzBFVXJzV2x0cEhqN1hiYUM0MmcrRjBCcEZG?=
 =?utf-8?B?OEFJM3RGdmhpR09ic0hvRUorcU1Rd3hTVktZWlR1UjF5QXpnenlvRjFHZzNB?=
 =?utf-8?B?MEpPbzY1S1VITDJ0Wkk1U2NUTzJVRG41ZGxUZXdpT08ycTJVSFNTZDVKb1ZG?=
 =?utf-8?B?RkFxSFRQVkxMTHBLc2ZDNjZyOERKN3BZaUNzeHRsZnQvSUFDWlhQMGhaTjZn?=
 =?utf-8?B?NHg1a0hyb0p4cG9aNW1mMWMzWXRKZ0M4cTEzZTJRZU9rRmFFZlJaUEdmOFI0?=
 =?utf-8?B?UW93NkVaR2t3RWYwN29VM21tdmRCamgrRzRCMnQ5aXJleFduRGUzOU82bzBE?=
 =?utf-8?B?WlBOZGFhZFhod3d5Yk1jc3lpalpwWVFyRXpRa2g3aTVXbVJRNXNnM0xkUmtF?=
 =?utf-8?B?c0huelM0VHpid0huejdIQ0ZKbGpRMHhTSXRITFhiWC9vRGpyZTVlUk1sK1BV?=
 =?utf-8?B?VFlYT2dDQWV2MlFXU0dpY2NpaFZnUVB5TnE3cVpSNCt3NU13WXJha0RYZkZF?=
 =?utf-8?B?cWJscGxPR0FENVBFa3R5MXM1dWZLMHJRRmxXRi92cUV0QlJkbGNqL2RSSEg4?=
 =?utf-8?B?UWR3UTdtNFJXV1FDc3NyZ2NKMlpibHFJUXpEemg5U3N2dHZUMmdManpYRk5N?=
 =?utf-8?B?R3JOS0IyWEsxWTgxbEx2S0dGS1FDWHRmQUNVRUs2b3E5YXlWTytMa3R1MmR3?=
 =?utf-8?B?dGFkOWdybVIyR2JEb0I5bG1qR1B6ckxsWUFTTEZrZzVuM2d5eGpHZFMreGhD?=
 =?utf-8?B?TGp0UVU0SDI5OXNsNlJDeHR2dTdLZ2tYSTg2dWhnbHcwSjh3SEdVRnU5U3dL?=
 =?utf-8?B?R3djNVRRNjRoelE3aUR1N0p1ZmY5VVgwbFZ3U09nd3RZU2ptWlBHNys3VmJx?=
 =?utf-8?B?TnF2akVLVVRnYXdwK29Ld0U5d3hRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935fc92c-e29d-4a37-21f3-08d9c3ae887e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 11:47:43.3298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcWzbVu3HvFGQxfBp4xUMp1SkkyQYam34tgMox96mX5Y27OhPyGLmJ5CvAitLr8AtSWE8yjodp07cKcnjiCotM1UAPb1Up0FWB0BfBvuKGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4554
Received-SPF: pass client-ip=40.107.3.135;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

--------------RjuRrT0Jk67Lm79eH3dZsAo2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/13/21 18:32, Vladimir Sementsov-Ogievskiy wrote:

> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>

Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

--------------RjuRrT0Jk67Lm79eH3dZsAo2
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
    <blockquote type="cite" cite="mid:20211213153240.480103-7-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Vladimir Sementsov-Ogievskiy <a class="moz-txt-link-rfc2396E" href="mailto:vsementsov@virtuozzo.com">&lt;vsementsov@virtuozzo.com&gt;</a>
</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a></pre>
  </body>
</html>
--------------RjuRrT0Jk67Lm79eH3dZsAo2--

