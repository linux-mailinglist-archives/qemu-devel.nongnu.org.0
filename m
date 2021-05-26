Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291FC391388
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:21:04 +0200 (CEST)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llpip-0005GN-7E
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llpgt-0002wO-RZ; Wed, 26 May 2021 05:19:03 -0400
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:21068 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llpgr-0005cq-VP; Wed, 26 May 2021 05:19:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYa1ycxP0KHNmnFS7N+DxSf2ObpngtIwCxbYhZK3HJGCgKBd8cMHirr2JpJLEj8BTtdd0ukLwuspnMrqMFd3dHMZKJ4aXis+H0lQPv3fEKWx9upQqMCJrL8s5wlvPS51YeluFW/bIyJUG1IpxgGcByGxpFXv0CvNQOkHHQrtGSjZlvRfKjJvJAUUP3djw7yvMkST1oTl2sWabL6jlHdA1p5JVsHYXVNfCshC2i91B1YnyoB9g4MqrTrB3wMYP+CB3skbzfEXxYm04QmnW04GpLscEJR+utQn4Pid5AZDjsnm3Im9TAGZ+nsKsZ5bCxAVV0r8B76hj2Z0ebo47OqIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRjlQGNLN98q9P5kJR9IAOyir6CfDjgCZZkzKv7SJfk=;
 b=aTYaPYl8gEeU42eXpad3V7GLpZ4A7N/rTQemeu/k3PfgSmQ47DZR/NVqTjXDKeTySHpzsGF8FiBxMX49PKYkBuUEckZi+xmsqM3qkfxdQMF8hfF6seXpSn3Zp8tuFGjtqyXiivilnb7V80BxlP7Oh4BT7ilaviUhiX2qLbIsrC0qc0wVaMo8FpOa58MTYQQNtUi7DXIGRX1Dq0vl/MCywBWTNwWXrnx+yRYKKJdiFiAwnROCGiIJYh4VeZ8UecVlrLXt6NNdiQa1wfM+rBScAe0/nnrPTqu7bO9uUct48KNuomoiSLL7jQIdQnSHMLuyh56sfzMMYpsmFRr8Mtug4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRjlQGNLN98q9P5kJR9IAOyir6CfDjgCZZkzKv7SJfk=;
 b=pa/Pf/tjDT+d8tjK14fB9ZTjOsNFA3KA9dRo9xbxUUNL2rRMQEkIaJhPZuC1Hde6b8FnxdzmD1vy4vi324fhXmvh9vM/ADbUWKdItJS8bKv6G5NbKKsAahpZJhuCq0Ed74PhxFMHyeDLfOHY/WifEBCjQEbxLegWhyFI1om3xFM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 09:18:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 09:18:57 +0000
Subject: Re: [PATCH v7 29/31] python: add .gitignore
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-30-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ec6b802f-c705-76ae-76a0-4d7b9fd9c093@virtuozzo.com>
Date: Wed, 26 May 2021 12:18:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210526002454.124728-30-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: AM8P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 AM8P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 09:18:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0075f0f8-cd40-41fb-c3a2-08d920274a18
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-Microsoft-Antispam-PRVS: <AS8PR08MB683946093D8324857D9FD461C1249@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Lq0ykqyrp/OBK92b4OlJlBbeulhPhbrFcl63ZwzGEVbJv0WseWF5OsiSmeLRpo76L3K6X7EIUaS1U0lYH6VUge1gmxWJ5IRfIGiEevMMVp1rg3AKZnPOTuCsAlh4GQyDSj2093CwoCh1lSq4INW7sBkP6nXBb6cYDILF5orG2bii7Zelai+4GDSBGpmellAMLmHc8dCwQVFml75bdY0o0Yy1aNZK+O80vSNHemTTRRXsceh7dvBvb2J9dpghGUWjJmEN8Zmxcf6hnJOFCtjfyxY9WfMR2ZNv8cNw5yzNIOflhNepQaROlfmfAtZMgcDRjgKWhN99KdoZaH7W8nX944GTVfKA0qVSReIwU7Uwepd62T28trrd7rnCDd7EdQRN55FHsGElI5k4DcpSo2U2mNFl0dSK4Va7Q14bDnYk0hPrYhNyDdQFdoXpBx/lYP5KKn4pB6MTuuqZ0rxl2uRzVYEMQEvscLzP7S2jIEbwKyoMP/4p7jJrvTQ0E+2KRawiZxtVcgru7DiaT1CsQ4Xb/CXxOL46NMH7yqPM9r2F3Qy8jN9E/l02ieXjJ1UFamBnWA0mst7xkVZWTJpG/WlZ2NBO87HrKQx9cG2AY+A5++oQsTj2MyPM+Am1xGdRujkrXfD4o2n+6YsFXehf81UgrUVqf+paANLP2rMQaprZPRXvRvcRZkPnT14/OT9GnLDaPXeRVNRRvKyWIfxd3xpB+PBmtIG3QqnkMKZ2sjqDGMMI8YNrEm3xi+a4//F49Al
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39840400004)(366004)(31686004)(66946007)(8676002)(66556008)(66476007)(4326008)(86362001)(52116002)(6486002)(956004)(186003)(16576012)(2616005)(478600001)(8936002)(316002)(54906003)(38350700002)(7416002)(5660300002)(31696002)(26005)(2906002)(38100700002)(16526019)(36756003)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVlqSTE1SkJvZEo0S0hzeGwzdUxzQmhoZHN1RGoxZ3F4WFBtWkFUWlkzcGE5?=
 =?utf-8?B?c1Ivd3B4SWpyYmJBM2l5UVFUK0pnUVBIeTlsYmZzUkhhVGU0b0xndzYxdWhz?=
 =?utf-8?B?RkRON2UwTW9NRG9Wd1hIemZQMDhmU2RZOVQrcS9YbjVQaTZ2S2RwcU9zS1J1?=
 =?utf-8?B?WUY0OG51b05naGdyK0Q2Y2h2VW1CWnk5RzgrOVJPSkFCWUQvODQweHNlMVdn?=
 =?utf-8?B?RlhzMk8vcGVidDhaR1NLYXZHSGlNaVhxdURQWEtQN2hJSkVBc0NTdGViTlRW?=
 =?utf-8?B?cXZ3NHpFbmdhdkhzeER5QmNlQkxzVVJjMUF5V0Z1eE4vVldKbU5HTlZpVUNE?=
 =?utf-8?B?RkIycGIwSFQ2OEJEd1oxeHB4T3JSVmVoamQvZ1NqY2FVTVhMNWNmcVgyS3Vz?=
 =?utf-8?B?dng0NlZHY3Bnb2dEQi9SZUhNUWJ4U0tKZXhTQmpsWHQ4bnBqajA2Ym94RUhw?=
 =?utf-8?B?WVRCYWYvUDJoa2oyZjd4cW50aGxSRyt2bSszcXI1OEE2ejhkWUc1N0lHU0t4?=
 =?utf-8?B?Z2pyMnpkcFdCR0ZMQ21YYldzRVRxZzEwMTcySE9YYlNxd1hMd0svVjBVQ2g5?=
 =?utf-8?B?M0ZoRlRsTU03dktza2hRcC9EUnZLZ3lFZTZUekc3ZWxTaVRobE0wbWxNMy9x?=
 =?utf-8?B?M0JWcHpHUWxxbkM0Zk5ndE1RM3N4NVdsdGhZT3NUMElMMWNMc29nc0hNL2hL?=
 =?utf-8?B?dGs4YzIxV3lCOVY5Z2tlZnVXSTREYkVFMjdZbnE4Wk5lNGNiMnN6Z0RNd3hs?=
 =?utf-8?B?cDJKWVJhWmRUakdhSWowOHFLelNSR1hQSmduVUZuYXF1MW80bi9BdVVrd2d4?=
 =?utf-8?B?b2thcWUvNlRXZHlubGFDZlpxd0FMMTA1OGxvcTQzTkJzKy83OERnTGRwSlRR?=
 =?utf-8?B?TU1pU0d1Qy9NRmlUOU8wd1poRzMwMFp6Y3FIaWpYME9oNWpSVHdvclpOV1Vn?=
 =?utf-8?B?OTI0WHV2ODBJYmIzUWxJT0E2Wjc1aVFoNkQrWHcya3Q1SFVuNnZxSU5qaWRW?=
 =?utf-8?B?N09pL056VXV0cEpkZm1BMXA4WThvaVl5V2xUSXpzekZhZTNIdDdSV3VSOG1w?=
 =?utf-8?B?d1JLVExCT1dNQnJqampGWWpjZTgwQlEzU1cwMTRkcmJJbElBT2VkZ2dWTk9N?=
 =?utf-8?B?OXZDdnNnaU51OGF6T3I5UXgvVHBjMkpGRDVDYnpRREw1c3AyMkdrQ05tL09M?=
 =?utf-8?B?ODV5S05NemJ5d0grK0JOdU56UEhTL0hmQTlPeUs4NUhpV01ZSUVrM0ZPeUpC?=
 =?utf-8?B?d2MvZFhXeDNGa2hPUGFYQndIK25zQ3FmaXJZbEtRdzVVOUs4dERFMjdyb3Jn?=
 =?utf-8?B?ZmpRUkJPai95QUpLVW5iZDI5bGY4c0R2WnB6U3hCWEVvTm5hV0d1Vkk4RlAv?=
 =?utf-8?B?dW80dUNwQ3J4bXY0Mm1iTXpud0xyYTV6clpyNUxqL3p1aGNkcjNuMmpQeFJ0?=
 =?utf-8?B?WFM4MUt5TlBuUW5hempGR0M0SUdhaFdSTlFyOXhtd08yYkNGWUZaLy9TR2JP?=
 =?utf-8?B?TG9OYUpVUnQ0eG9PZTcweno0cFJNbnBTc2t5M2Y3SFF0TzlCeHhmUkhITnh0?=
 =?utf-8?B?ckc3YjZDMHVkRkNWQWkyVHBidzFRM3VITEhZRGFtOC91bWhZR3RrS2xFaUFF?=
 =?utf-8?B?bzdwVUw1V2lNOUw4K1NrdEZsQndzNjl0WStlQVZ3VGE1UGd6Q3EwRUhQampJ?=
 =?utf-8?B?L3FwdW9rUCt1SmVKckhPVUpvcXFpaERxWW5VVG90SksxdXd0RE1aVmJmR2oy?=
 =?utf-8?Q?WzOlzsrohGeFAxU18yJRo10Sj2PwN7DJxb/xEsG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0075f0f8-cd40-41fb-c3a2-08d920274a18
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 09:18:57.0089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVhuihR0PzFgsRnGy6glhn6TKYUYZeuPviAB56DVW4BLLDOTZJZdj0KSLcgiQslZaqAqelzsDYJipQDC87Y0P/l3oBoCdGxC5+XGeNjtT5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

26.05.2021 03:24, John Snow wrote:
> Ignore *Python* build and package output (build, dist, qemu.egg-info);
> these files are not created as part of a QEMU build. They are created by
> running the commands 'python3 setup.py <sdist|bdist>' when preparing
> tarballs to upload to e.g. PyPI.
> 
> Ignore miscellaneous cached python confetti (mypy, pylint, et al)
> 
> Ignore .idea (pycharm) .vscode, and .venv (pipenv et al).
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/.gitignore | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 python/.gitignore
> 
> diff --git a/python/.gitignore b/python/.gitignore
> new file mode 100644
> index 00000000000..4ed144ceac3
> --- /dev/null
> +++ b/python/.gitignore
> @@ -0,0 +1,15 @@
> +# linter/tooling cache
> +.mypy_cache/
> +.cache/
> +
> +# python packaging
> +build/
> +dist/
> +qemu.egg-info/
> +
> +# editor config
> +.idea/
> +.vscode/
> +
> +# virtual environments (pipenv et al)
> +.venv/
> 

after make venv, I also have untracked pyproject.toml. It probably should be ignored too.

With it or not:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

