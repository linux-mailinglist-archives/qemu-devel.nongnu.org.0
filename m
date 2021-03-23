Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9E13466AE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:49:43 +0100 (CET)
Received: from localhost ([::1]:36546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOl9y-00012W-5x
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOk9k-0003mL-2W; Tue, 23 Mar 2021 12:45:24 -0400
Received: from mail-db8eur05on2125.outbound.protection.outlook.com
 ([40.107.20.125]:59808 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOk9i-00072h-5k; Tue, 23 Mar 2021 12:45:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDlGHBpdc87iitgzX4lUdnTrc18qGflxpJr5ICjGTZ6y9T5cvJGqEu8DHaKOKGzVA94f6oPkUOxSyWFjX3aoojJSHsivwibY1KFoXgsyxBS7CiHsj3gPZKggx62FhwA6jWjCSIKXdJH8j7I78ThyjL45kQgnjwxkzS1Htqkb3OlWjsSA6px7NFVPTcvWXIRUGwsvETE4vyNnHGLtq/Kkgtm5LeP2fI572kehfwvHzdG1zp6X2wvZT98DCbsBo84kIl2fjJjKH13TKdnYjPOPWkA1wKmnPIP6ASyqXM4hRZOzoU7FubtW1lwC8rNZwvWLB73qYN+XzKMkN5c6U9HqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXGlL+D3qWzeId3b+NibvCFJndSP/S83RcWDzeQjJKw=;
 b=bV9ajDSWehQZKPAKn8RqLq9vCl6qaQbmJOdhERzzJZI2UZR+y9Xl54c6cblhShe56/l5kBUE7S7eIjt2GlA5HfCMYLFrrb1pi3/7SHsfLnYLGZMA9nr5bydhfRCVWlIwbnz/9WwtGMTSCuT0Rci0QEYzoevHXcyHVJoCWZfXPKbly88jK9rnELfsgeRCLb3+SzhYfLMOqclM1itfDQWZD7+RhpofWpEk6qZ1tUIJiQyXfd0cNE/Q4CQKHpu/8bgOKpDRks8wQh8cMB5VvxXgN1V1RUTo8UVXxOFqeoNRCpPt8IUuWL+tD/moh8LqgA7JdKZn7haUhApBQ1N0y6ph3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXGlL+D3qWzeId3b+NibvCFJndSP/S83RcWDzeQjJKw=;
 b=loSP2FPJeFU/W+KHSVOG6pj8cKevOLxUJlJquKd4DmHJvs3ayQ17COcucTnVTcR/5h8jq64UhSALkU51kA35b2dB4t2gE9dV3cGyvJG5/bQu4G3oNFbIkSRvS3GkKHX8ceXN3QRtlxOZnhJBC9Pt8q7zd6aCwJzBKOrSstRgVng=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4600.eurprd08.prod.outlook.com (2603:10a6:20b:84::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Tue, 23 Mar
 2021 16:45:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 16:45:18 +0000
Subject: Re: [PATCH 4/4] qemu-iotests: fix case of SOCK_DIR already in the
 environment
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-5-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2ca263ae-5774-2bf1-aa9b-251db97ffaf1@virtuozzo.com>
Date: Tue, 23 Mar 2021 19:45:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323130614.146399-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0055.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0055.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 16:45:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90b2ce62-1b29-47bb-a5ce-08d8ee1b0aa7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4600:
X-Microsoft-Antispam-PRVS: <AM6PR08MB46002B0D4787BF2D22322374C1649@AM6PR08MB4600.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WdUPAqgsCu5zD5e5wTBJHMgXHNARv/WBYSb3UtILNw/WUe5Mcl7VAAakyU4sOs5TlEDF0D+EqNNRgQfwQ/X0gbH00DSghCeLQqvDh9u/LXwxD6Jt4kxznD6VfnmlWT7I/Ydv3KwLr138oFnLXjx4dwIzSx/Z1QTUwiGJbD74jDvx9z4ix3t+qJ49Of8OGkQSIIiRyjTpJVBDux8UyqaIwIsQ0WoVZeGAizeYAb/D4f2428e6tVARdcNqWzoppQ3ZBs65KCeyR6O57eWsRcJXOB61GpUCzEgdfmjX/08uj+RRPg2AjiqvOawA7HMP023G/++3Nxh299r7cOwod0j5vQjE0DXIGQYdTIr4rVhNajDdXxDNO1rxlWwCzpg+mf22RTzd7FAf3utdNt3bfBa1z/s711TzL/zM/vw2rQkhWve8Kk/FzwZzJ31Dld1yKCQXuJuoER4WGdaiDI+5kmva+2XOM15jIvFU6FFotS/LKhFwli1M7AkR4jPERsEppbJnPdSpDqwcjnLs2OslR34m/LfaHSjMKTAXTJjiDxULI8TCcU78/u6pOT5e9ezu76U3iffUX1V7op41GQUopuFCdqIAktYbUPyi9ZWfzikjB9DwGVz5gr5WHJZg/ZD5SFdZrQdsBKWZ0egFI5v74SpVqczdlnHG0nFq2n3vWxNy8lDQPDZruKYrrt4kAd/aMsPyZWz3bQOKyD+HnE9MSfUvyAnbqkBexr4gTw24owgouFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(36756003)(186003)(8936002)(4744005)(5660300002)(478600001)(86362001)(38100700001)(16526019)(83380400001)(31696002)(2906002)(316002)(6486002)(956004)(66946007)(8676002)(66476007)(31686004)(16576012)(52116002)(26005)(4326008)(2616005)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OThVT1ZxTk85WFozMkU5QW4xczFLWC9HVUJEMUNLL1publk2TTNHbzFvV1JQ?=
 =?utf-8?B?aVdxeEIvV0J4QUNkNWcrRmRHYzBJTHhvMzV0SUNmSDZhWG5ON1lRYXNkaGk2?=
 =?utf-8?B?YTAzU3A3a1ZXTjVlRnNFZHllQlhKQXpJTkllalprRkV4N0FJaXVtZ1Z4WWND?=
 =?utf-8?B?TUZ3OE5OczgxL1VGSFFKMml4T0F1Tk1GaVovVlpHUVlrNjI0eUFGaW5iRXFr?=
 =?utf-8?B?VWVJb2NVWTZOWHVVbm1VTGpmWkNZTDFUV0pkK3IxeE4wZUtRS1l3UUZRWG9Q?=
 =?utf-8?B?Z3h6cUNTeDZ5RXlWSVpyTG9LN1FyWWNHeWdNempZOWNtKzhIRHl5QTRlWE9D?=
 =?utf-8?B?MjlqTHRaVjREeE5sV0dmQ1NadTl0bUhZdjFXWGkxbHVLcUdmQmx1VG4rMjhJ?=
 =?utf-8?B?ZkRneXdtNFZXdGg5SFcwR3VtZVgwdnlaTjVnVFJyNmlHdXNEZzY5VXJtallN?=
 =?utf-8?B?aDBRd1Z4bUlmditTWmRTVHJvYUY0ZXAveWY4S0VMamc0RjZacFR5dFRkWUZs?=
 =?utf-8?B?Y2pPaURDLzlXYmEwbmE5TXRrL3BZVjlOeTZIU2s2bzh2ZkNMOXVxUEJSWk5B?=
 =?utf-8?B?VGJ4cEcrMDFvWk5MbFZrYnY4TEZmT2VQWjltd2gwZVV2aC9jandJUHJUQlEy?=
 =?utf-8?B?UlZUeHcwZWhNS2dZQlJnOWVJQnhIWHA0cVBiaXZxWVRSTjRJb0VKNml6U2Qy?=
 =?utf-8?B?RDBlT1JlZWNvMXJKem1keTBBZHhFSmc1VUFFejl1SDdORlh3MXB0Mm5VSVZ6?=
 =?utf-8?B?Q01BWjJ3OTk4Q21GTXNtanVlREpCNlJyT2dyUlo5WGoyUytiditGYmNLaEpZ?=
 =?utf-8?B?anZCK04xZUVFM3I4U05UMkt0eE4wdlQxZ2c3V1RLaEplbFJTODd2Y2xEYnFa?=
 =?utf-8?B?MWlrc292OFpJL0llTW8vODl1NGJHYkk3cXVsaFlycWdVMzF6YzlaUUpJaHBo?=
 =?utf-8?B?UjljUFFTQ004YzVYNjY1YUoyMkNUSWJrRDJCNEtBRjZjTnlaUXY2RkE5WXVD?=
 =?utf-8?B?amdDMllRQVpkVnZjT1dyY2R4eEVYb2paVXdqbVFwdkF4UVUxZ3FmSHYxb0FW?=
 =?utf-8?B?eDBoUkpCN2wvYVdFckp1d3BCYXhMeUFSTmQyakU3ZFU4NklIM0ZBMnpYZXhC?=
 =?utf-8?B?alEyZEQ0UVNxYUV3NUFmejgwaDl6YjlLQmdsSEFRbzF4NHJIaUF6NjNTNlVT?=
 =?utf-8?B?Q25tVkp3aXZyUVJRSFhTdURxc1ZOdTUvMFJyTElCbDhrdXMyVWtiM2V1ckZJ?=
 =?utf-8?B?MnpTdk1DOE9PN2ZSSzEzOWVmZkZUQ1Vja0o3Mk9DRGF3WWo0Y2JWRHlha0FX?=
 =?utf-8?B?RVd6OUVGQUE4Q3hyT3Y4UTMweUZGTGJTYytzQ1Q3VDRWcHBXM3k0Zm9ka3Vu?=
 =?utf-8?B?Mm01a2RkYy9zU3VuT0IzWG5jcmZEckszMFJ5TDFocFhoQXJOeGMyb2FnNWp2?=
 =?utf-8?B?bUEycy84MlkrQ3hYZzlTZ1AvUHNjVmlQOW5sQWMxL3ZpMWxSTXJaeGgzc2th?=
 =?utf-8?B?bXRXbXZZQ2RjSHB3UWcwaUJVYmg3bVpHNkE2eWxOd1BJOEY0TEsyRUxCOXdI?=
 =?utf-8?B?U1JnYUtwUjB6ejNIVXlMOFdKQVlBVlNacUU1Y0JLMlJxMzdlOEc1ck85TlFI?=
 =?utf-8?B?cXRqMDFCMHpZYzhEcVFhZ3lWcnN6U1UzY3plV1E1N2EyZi9BSkpLQ2c0TkxX?=
 =?utf-8?B?R0NSKzl1TzcyM3RTYkJpbjhRUmVaNkxLZWJMQmhlY2pNNFQ1TmZtZXlWSFVa?=
 =?utf-8?Q?sv49h1JGY2tSCr3HrHjZ21UI79GTvIjs+HjdRk+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b2ce62-1b29-47bb-a5ce-08d8ee1b0aa7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 16:45:18.4376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pm3YC073DjgaY3VzOTQXJdJ/bRuTZduqH9fAnJH7swWGCT2W2QRS6eeFG74/JY4wcPVinGBLuJ6LunNbzwIVUms9M8dOQcWgId7DZ1lwf/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4600
Received-SPF: pass client-ip=40.107.20.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

23.03.2021 16:06, Paolo Bonzini wrote:
> Due to a typo, in this case the SOCK_DIR was not being created.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qemu-iotests/testenv.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 6767eeeb25..169268f61a 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -120,7 +120,7 @@ def init_directories(self) -> None:
>           try:
>               self.sock_dir = os.environ['SOCK_DIR']
>               self.tmp_sock_dir = False
> -            Path(self.test_dir).mkdir(parents=True, exist_ok=True)
> +            Path(self.sock_dir).mkdir(parents=True, exist_ok=True)
>           except KeyError:
>               self.sock_dir = tempfile.mkdtemp()
>               self.tmp_sock_dir = True
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

