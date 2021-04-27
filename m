Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47536C165
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:59:59 +0200 (CEST)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJZW-0006FB-GO
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbJY1-0004uw-Q4; Tue, 27 Apr 2021 04:58:25 -0400
Received: from mail-eopbgr60097.outbound.protection.outlook.com
 ([40.107.6.97]:12257 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbJXy-0002aG-6Z; Tue, 27 Apr 2021 04:58:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJIcpHsEiY92i5s+eKEwgNm1hbmD9Dthe3vuSazkuQkghjQzV/RGbEWZ3HYqKh4a+xoOOwjxxtyZ3otzInhhpwlOqKJFcaWkbFhMZcLnnR6y+eKBblGMh8Kzd4R5lP8odjM3fwdV1upfpRmh0Z/tzGgwJF2v+3m741wLxwlYmJnF7XoSutrKPGADiwvU8YdKcOFiOBMz6SbaBWDO7l6nBbsIQq8SZMlPKc+hk3NHdiwz3z0xtivUh/i1MZ+hfRgVKytXD5JiChiYao9na/dHumC8EfgRIWgDpNVEXhvNsPmF6ZBcdto6/zQE5EPk3/lMbo3gRRz71L1OcAzOkjExDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90YO8bLj+Bzz0ZoKAxOjdeY6QrrQr246E2NG+Z6yM+0=;
 b=HdB3g3zK7U0MF+f3Yn6U0P29pp5IdLf+oC+Z6Kr4l2iPuD01T0WXy/KhRix8+0rEPC36D5pbPlsZ4AdTQCyQZDRijYW0JLC4e72sf31bk+Z1h5ROhAjCDmIAetKPqahgxsfW1u573Yq31kbtPOB6J4Mqt/akR9I+kz8oVYaudWmnBhjqtfNWboGL1uURfhtXcQlsX+Icmj7SOU6hAih/0AywhpxOjj0PHDsRCTfhoesI7+oBjJgAzUPiFbUPVvZH2yA/4SOKW8CueM95jWDIbW/FFe9nCKatO93oCUjD3XIXIGAIJ9IDELN/YfCogCOyWxgsGPVHh3bjpAlzEU2sOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90YO8bLj+Bzz0ZoKAxOjdeY6QrrQr246E2NG+Z6yM+0=;
 b=TWHt9i4sRZ3brPnRpsGW+w8RXchfAszYytZpST6/YYGglegKMq0dgzJKnxN1Tr4zwPPb/Aswwh+eX2L91AXPFXUSzDaIfbgxYCPvJ9F3i9Mc1gPfUyJ5JHWRGdPrkphdwRx7iw/fuiP6JDL5X93CO/vyU/LL2IQ+cezh/hcP454=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4216.eurprd08.prod.outlook.com (2603:10a6:20b:89::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Tue, 27 Apr
 2021 08:58:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 08:58:16 +0000
Subject: Re: [PATCH v3 0/9] simplebench improvements
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, mreitz@redhat.com,
 John Snow <jsnow@redhat.com>
References: <20210323134734.72930-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <309b13ab-1f56-33bf-ffe5-ae7f866daa0c@virtuozzo.com>
Date: Tue, 27 Apr 2021 11:58:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210323134734.72930-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Tue, 27 Apr 2021 08:58:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2c087d5-cba9-4681-b5a6-08d9095a9874
X-MS-TrafficTypeDiagnostic: AM6PR08MB4216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4216D4E73B911D381E0FF296C1419@AM6PR08MB4216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljshKV6Eiu055NlDdrxVnWeKq0/b3VQONt8D12aIGrpitR/kqvRVYx51iT9hlkxrH41MCHBpOl5BMns2vPNXLc62e6RVaXKHyDgXXgymy8NgNTho9QNQCowF7v9jBaI0tXNdwdQy/7nvByY56ZOH75IP90XJ0+gDxDh1pm+0s0HT7abTIaugHz/HkVw0NqSlUlgdvba2LOFppcigVnXTkHFl6u9hu+HH2Ja8T/mK+iq/zZBq5og14SbJRbucYKN8zHNrQo1MD8U6ru8IzgsG12SIuEjcDrfH8/dVqnOzOZQLZM0w0dvNMhLE1WaHYqTkJgUaXGzLYrMhd5F4tE0lPN2KqdStbllJj/OW4y4B2Zc9KJwCN4FBCS14n6fJqMMjq75Wlgay2aKXBncjlj8Np1rnwtZZeCe9pGfXsMlUfRwpoJ6R6KFtVUH0vEYGh2I3MSogLfFTem6xkAegAFn1nCGsz/nF36d2dl66fWC7XTHjfX0Eund0P10G1rVdqq55TjfISV4HStt5KlRMTNbyYxtGabi7TJyQ8oN0lJH7MZo3Mzn8opArVWze1420VPTK6rxFiiV7QAjqut4JLd7sspbQFdV2j7CmU6hnD9dhetTOeI2ghcg/dVHVqRxhhfXjPGY5S3wI5OdRoetv4EV9lcNvldrhofdRHUxTSHQhkTD3M4SorEFuYePab5MAPXcBehMQYhQLrn/rIW6KBmxcPFc+6rAB7wJZ+SaFK8+OttzOKdWCFR2D2UXHGnv4GFfj17awnIGt5Izesa8Q0m+NmQY2DialocyA3bIvQMp67rk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39830400003)(396003)(136003)(2616005)(6916009)(956004)(316002)(66476007)(31686004)(66946007)(66556008)(16576012)(31696002)(83380400001)(6486002)(478600001)(186003)(2906002)(8676002)(4326008)(38100700002)(5660300002)(52116002)(8936002)(26005)(36756003)(38350700002)(966005)(16526019)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUNGcGFhYXBKVk42SDhXSTNtSDFOT3JhazlBbDAvR2pvRTdxbUNIWWdkQUVV?=
 =?utf-8?B?VVFWOU9USHZqTmNOb2pYamlKMkRSTXdLZE5zMWdtQVJlUUpyQUs1eGVrL1Z2?=
 =?utf-8?B?c1BKUkpGTnZCRTRFWDZTYm5wUWgwdGlLRnpGTTArQVI1UWtadjZLMW43YVNN?=
 =?utf-8?B?RHpaWnYzbzhuQ1hvUnRqRmpoTGJRR0x5T242K291RHJSNTMzbFRINEMrQ1Rs?=
 =?utf-8?B?REswQzQycUdxbmZkc1N5TDVnQlQxWi8vNXlkQ0tpbHpMbFp3UDV3VnFPYklo?=
 =?utf-8?B?WmZDYTMreGZSWHVjbzlMQTkveWxNSWxhbEs0WC9mY09pclpScWdaOUpzc0p4?=
 =?utf-8?B?VHVIOHhKdDFIK0QxYXB5QnhCRjQxdEpwSVZEZWljRFoxM0pKSmxrVGhtZUZz?=
 =?utf-8?B?RXRIZzljU3NQbE9qcDdhK3phSWY4MmFiZFZzencwc3FuME9iQk9lS2w5MHkr?=
 =?utf-8?B?cUYxUGlFNGpIYTE4ZHlxTHhvT3JqWXVPNVFQNENjVEx2b1VBVFRrK2dmUWVt?=
 =?utf-8?B?dURiMGoybkkxWHVteXdPbGZCTDFBYWFBTlowbkJvOHBWdnBMUDg5NExtNWNO?=
 =?utf-8?B?d2N3aVNRZHVCeXBTTzg0dVF1Tk5RNDVDdHN1Uit6MHBDVVVQc3dFSnArbVdS?=
 =?utf-8?B?VExSVWd3VFRMNHNRYTdhT2t1SlVpSFk4MklBYVc2dXpsVFk0VS9JNGc4TUto?=
 =?utf-8?B?U20ycmhvN1hXd1BhYjdQZlBsVlB6Vi9ubWtyL1h1dlRDcFl2QXpHNkFydVNO?=
 =?utf-8?B?OUhSMGI5TTlhOGc0WUVmMmdKQklZVUtDVzVwU0g4aEtoTXFPSXZWajcyTmJk?=
 =?utf-8?B?cjJvRC9aOCt0dTRRMGhzT3FjZjUwY0lpSWFINDBUdm1WMTJnbnlJeE9vdXhY?=
 =?utf-8?B?bG5VMGZmZ1JvaG4rV1ZPeDJUWjVpUmsralV1SSsvd2JzN09WclVOTmZUTjJD?=
 =?utf-8?B?R0IxSWlqaVZPT0wvOHVqSitpZUUyWGdUUFZMZXcrV0hZVDNpQlB6Q0R1eTlX?=
 =?utf-8?B?cEJxOHhaNE1tVmdvOGVWN2d2NnhmNXhOOHdJdFNxSm53aS9PeG1XdVYvNS9x?=
 =?utf-8?B?RDlTUHQ0UjFyeEdXQ24zL2NuY1NJeGhrWmE1THpFZ2RvMmMyY0l4VGpEektQ?=
 =?utf-8?B?cTJieHhFSUljdUlSYUttdXRUc1o0UzhrakJ6RWYwZG5zYkJzV21rVDNFeElL?=
 =?utf-8?B?eDJRbzhPMGQ0OUJuQWh5clljQk9zYVY4T3p1UmZPN1ZhTEI0dzRSUmNjZ1J0?=
 =?utf-8?B?TlRsdXgvOUtvMDJQUWpKTmxBYVI1WHdRSmpZMXFkUkhVSnBiYThYWk1SMmNn?=
 =?utf-8?B?SEVidlRUcHcvQVpBaXoyV3hzODFtT3NjOUZlK3JQdFNMVGkzb1ZUWmRrV29D?=
 =?utf-8?B?TS91c3BxVGtzejhYTm1Hc0d3RU1WWFpITmxGN2pCcnA1blVJMTV1OU1WNVhs?=
 =?utf-8?B?QzFHOGgyZjRWU1NydlJ1WVJRcEF6cE9sMU9zUFcyZXRCMXdRYnYwbDVheXZt?=
 =?utf-8?B?OVpBQ1JzNnR4ME54cndvMnJObSt1bmFxd3dVWFFtdzFFa2EycFczdXZRVTRH?=
 =?utf-8?B?VzZMTFFYamppb29wZ21Xc21KcDd0YlVtMng5LytxZHpEQzk1MzZGWXZ3ZjF5?=
 =?utf-8?B?NlM0TEtzTlB6ZWNaejJiR0JsSlB4WU0xOTlzaldkb3U5MDcvLzJmMFRNZTJR?=
 =?utf-8?B?V3VqSlVBcjcrKy95aFJSa0ljaTRzN3BqcVVsRklGYXg2VmJpTjVXLzdHKzQr?=
 =?utf-8?Q?XRl2uKdqVmYjdAP0B6QsUBNpNWCj9XfWtqpqXzC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c087d5-cba9-4681-b5a6-08d9095a9874
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 08:58:16.1990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYH6GmZcpcMPfuONU1Ycb28JQy3T4kuOaOPPupMq6JQvu0DgRJVsiBrdYGINmGkWdHm1KlmukTOwnMiDQuS2hmtlAGyn44HAHCFozDfSzMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4216
Received-SPF: pass client-ip=40.107.6.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

kindly ping.

I probably can pull it as is when 6.0 finally released and new development phase opened..

Still, John, if you have some time for it, could you look through the changes and may be give missed r-bs?

changes v2->v3:
  
  https://patchew.org/QEMU/20210304101738.20248-1-vsementsov@virtuozzo.com/diff/20210323134734.72930-1-vsementsov@virtuozzo.com/

23.03.2021 16:47, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Here are some improvements to simplebench lib, to support my
> "qcow2: compressed write cache" series.
> 
> v3:
> 01: use simpler logic
> 02,04-06: add John's r-b
> 07: use BooleanOptionalAction and
>      initial_run=args.initial_run
> 08: rewrite so that we have a new --drop-caches option
> 
> Vladimir Sementsov-Ogievskiy (9):
>    simplebench: bench_one(): add slow_limit argument
>    simplebench: bench_one(): support count=1
>    simplebench/bench-backup: add --compressed option
>    simplebench/bench-backup: add target-cache argument
>    simplebench/bench_block_job: handle error in BLOCK_JOB_COMPLETED
>    simplebench/bench-backup: support qcow2 source files
>    simplebench/bench-backup: add --count and --no-initial-run
>    simplebench/bench-backup: add --drop-caches argument
>    MAINTAINERS: update Benchmark util: add git tree
> 
>   MAINTAINERS                            |  1 +
>   scripts/simplebench/bench-backup.py    | 95 +++++++++++++++++++++-----
>   scripts/simplebench/bench_block_job.py | 42 +++++++++++-
>   scripts/simplebench/simplebench.py     | 28 +++++++-
>   4 files changed, 144 insertions(+), 22 deletions(-)
> 


-- 
Best regards,
Vladimir

