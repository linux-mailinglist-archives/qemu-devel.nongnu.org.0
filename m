Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F62391253
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 10:29:14 +0200 (CEST)
Received: from localhost ([::1]:42766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llouf-0001Ln-Qu
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 04:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llosX-0007Vh-TB; Wed, 26 May 2021 04:27:02 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:17179 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llosR-0008F6-S7; Wed, 26 May 2021 04:27:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAFy1m4DBf6rEaF6Mtdh2YS2f67CnjC+GpoaizPiwNbU2BHbCbmm3PRtMnE53iWSbEqiIQXScgB94bK3jH63AXK5QUtJGn+2I937WSAsVb9CTs4bPSpFT7XYpbbM5e9+LYTpcSv2EzEVpa+K0I+3PgFPvFBYwJTbKtfju8wgLZXI/bUU+BY+h3gBT/z8fgCDvw2QQpM+vP5PJ0TIwKmw1rfzm3Q5ybuA9coM4ZE4A0YWJddhOcWWMPCrIjh6A7LblfeEynqRuG1IxTQg8Mn1RGrYrsabuKSkL3VKIfVUVRLnZ8W/DHPGEUJC1Ha9Nvo72sAqTH0fnF9GHl4gig9JMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LLdu3yoV092CY8QhZj5yUO6gOokIHAYvVXIX993i+E=;
 b=Nj2EJ8KpWZjYLAYlbIIsC3IvY6znL7bhmvsTtnDYWY3Yi4mAVtvtbZO2Ulawx7G1xAYmMIbuakq24VOHMUh9SMcJzUo7HsFUpFyqDzeI9wLEowKLPcHqpW0XzIuBJWZa+BhwmWKLBxH4ddSiNmEFuXczM2P7kGHhvmtSJbL/cZpfIkhVmTpEzRWsAApDJmbjKwkHucCKeLNMsYk8x6CWTM1Ie59Iaf3nr43FDRYCmmYOxiSSntnV/KiYOMK1greSbQlPT5ddCvPMyygXpV+OgfNYDygoEpKb8e8ec5GXZoAxWTX09xpej9jXA+Avk1U5YGcwmWdb2YqDC9pou/7VVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LLdu3yoV092CY8QhZj5yUO6gOokIHAYvVXIX993i+E=;
 b=Pp0WHolYg6rzVvjWQJxq5f5dZ0TPqTXA3YPpzb1T7/b4FU40z0M2r9n71BL6QqUHg7N5/eJ70bKcyljIHEtHnkUCIwex0TO1swhxbCfiieFpzmi1OTZsA07gHTT/xQFm2BqXMhUE2Yb/LqjVuNg5n+YJy0rS9im4KTFnGj1vjJw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3157.eurprd08.prod.outlook.com (2603:10a6:209:48::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 08:26:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 08:26:51 +0000
Subject: Re: [PATCH v7 10/31] python: add qemu package installer
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
 <20210526002454.124728-11-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e81d650f-9c95-e103-2fea-adffbfce5548@virtuozzo.com>
Date: Wed, 26 May 2021 11:26:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210526002454.124728-11-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Wed, 26 May 2021 08:26:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98a7c635-4af7-4ac3-ab20-08d920200345
X-MS-TrafficTypeDiagnostic: AM6PR08MB3157:
X-Microsoft-Antispam-PRVS: <AM6PR08MB31574E1B8C4CC7205046879DC1249@AM6PR08MB3157.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mq4H6TdoCRfAge6O5s7bF61gwFY17QeR78gvzzzZ4rjUbwShnuI6fFFv7Yw083eS5jvm4weie/CaUJjJ52dSNEcGi0gcg0fWGRxdv3luMwRAjKdDdTtAKKpigIJiNa9rJp62ZpF3Zf2aIwYsnjA7r0Yq1K5kFZUBnibNJqtHqQmWm45zf4k9oDNBMLDLeRBWknYJvrja0tsi1r1ZsGOTUtPoDt3eC7oAKTdVnSDGwBgVieyLJNA/vyiDtqqcmYkXmNuOgVMc8lqA2XoNAudEwK8bPB8a0OL5M7/ulN2jIpliBVzhKk+zlnfx+CNBlr/y3conAOcTa2zfpHACmW8vrGVXmQQLq/ndJGMCy4kK+70chD5NgavyCHeAhFlDfiAq3yZZa3dEPi4UXHPyqsAAf7zFddggBThW6EzQi/QmA5sMAqNsf6K5wj6Sh6v6DgM/+a09MDHrkS1uT0iyqLO/k38YLPuPJo0cMT2vvxYimKBLoWsMHu0Erc9HRy7FvlET9V12BHUctu8sv/5OehG/29TIq4SrpC4Q81mO4vPXKBUM21WwgfsVPyDCJc85BbQdPpl5Yzh7/QTXq5KdIvtZ8rYTKEDsGWz14gEf4coKK9RQk5EeAJanM1IaQJmPScw7pY7KNIBgx+zgGJqMqOEeJb7Jz6vyuO46PX2y4w4xVBP+I6HPH9XbQLUsHmSdKcNsJdnpkoMZV8ltHD8peMI5HvPZKJRnoWlHeR11nkWy6m/ppK7UxDx4mgD5LHc/Zjrir/1el+CpMoStGgCd2bSDuyNrOwXmOsvHMLccvX/OxujlMV442VTmjNU3u2KPQ3NX/7O7+CBEZM4T4McK+yc+ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(136003)(396003)(346002)(36756003)(8936002)(86362001)(38100700002)(186003)(16526019)(956004)(966005)(16576012)(31686004)(478600001)(8676002)(316002)(2616005)(54906003)(52116002)(2906002)(5660300002)(31696002)(6486002)(38350700002)(66946007)(66556008)(4326008)(26005)(6666004)(83380400001)(7416002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YzN0cUVTVERhNE1uTEg1cVBjOG8vdktFOVo3RXVLRTRFRXYrbXd0Z3ZCYVdI?=
 =?utf-8?B?V3ZJcEJTWjgwM3U2eVlodHFjS2hJUEdnT29LWVZWckF4eVhkZzMyMnpBaFdD?=
 =?utf-8?B?ZFk5d3g5TVd1QTFYRi9Hdm9oL01IRDFqeWtqMnAxK2JNRGlwS2xZeXJKNzI5?=
 =?utf-8?B?MzZqNXdQSEtxclVoOC9WSUw5VG13dXRBdnR0clZwTTVSMllVNFN6bWdtMHlX?=
 =?utf-8?B?YkNDaURZQjZrM3lEQmRsd3RUUmF5TUNEOGl6Smhua0JtbURZa2Q3RkhVREV3?=
 =?utf-8?B?VjlXemZIUW1sUXNSNzFobHF5Z1hkeEp3WFY3QU5SWG91cjlidTREVXYwbytQ?=
 =?utf-8?B?YnVDZUdHZzE4dm5FNW1TWGQ4SUprZFoxZ1BUVHdPUGRDMGxPQ1lnMVZ1azZD?=
 =?utf-8?B?VFJBZ1BCTDlCM1JYRHZTZ3J6MXh4TkhtQkFsRkd4bjlJNzU2UFVlN2VaaXhI?=
 =?utf-8?B?RVBUNVREZE5jOVNNUDhLU01RcGpnbE44SFYwaUxVQ2I0cVlTbTRNNkF4YTFn?=
 =?utf-8?B?b2tkeU5zVlowcEdqV1hDSUVBWVVNcEszNzdXTkh0R2gvLzAxelBzWnJ5SUow?=
 =?utf-8?B?SkRvS1lBYlUwdDZvZkpiRkNBVlJFdFdXWUFqRG5GSFUvbVJFR0tkZndJLzNo?=
 =?utf-8?B?dmhMQXdKZnBYcmJyQ2dlRGRIWkF1cUJyanMrLzNxdVAva2lSb0FTUE9qMk40?=
 =?utf-8?B?M1J1RjlBOVpIVWkxTmZ4RjVMeWtHd1BRbUVXaVJQS3F4K21jOXdtMzdYY3k2?=
 =?utf-8?B?L2xmQml3SWJ6R3VEeS83YktFR0lhdjhaNWZsYWZhRm00WENPd3MyYjAxMjZ2?=
 =?utf-8?B?QTdudWJhQnpVeGNIYXBkVld2MlBhZ0xzSHEvQlRmYklyMmJRcjdOZkZnTjIv?=
 =?utf-8?B?MHNyZ04yUFZxVWhwdEEyK0pRRmFEWVRkMXh2NzhNZUNUSkFiYW1YdXVSVCsr?=
 =?utf-8?B?NkRIR3N1U29KVGdFdjVtSkdnQ1p1RTU3NVZoWHFSbXpidXM0N3hCR3crM3pR?=
 =?utf-8?B?dzFPREYveURQcW1jSlZLL09CRTUvT05iaUgrR3ltUjNuL0w0RHN6M3loT1E2?=
 =?utf-8?B?WHRvZ0NJWjFlaUp4QitPemdGei9DVzByMmFwVG13TnZLSll6Y0NVU1hzSEkr?=
 =?utf-8?B?THA3RjRFQ1ByTzRYaXJWOHc0azZOeDRSMGdlV0tXQlF1OFo5aHpLNFZMK1Iy?=
 =?utf-8?B?NzJ6TEF2Mm9tbDQ2UTljREpJVjUxUWh1dnNTOTlGZFJIRGVyVXd4YU1SRFJr?=
 =?utf-8?B?OVIxTXFMaXRxVkN0QXpEalpMZzFxRG9SanNvSVVobmNTWEQ3U3lnVWo5SEZH?=
 =?utf-8?B?WWhLcXNnSVpWdHN0WlNYU2Y5U0dMSE8rNTA2THRqd3E4SHI2TE1iczR5UzJs?=
 =?utf-8?B?K0F6Ulhic0xtVzRNWGc4eEMwRldZUFB0WXphcTNwRHVwZ3VUTEttRmt6NmRt?=
 =?utf-8?B?czdlQnJrUEZRQTRDZlZLdVBCVnpUR0l0MDkrYUI2TW1LZmJKWVdIZ2lNdWdw?=
 =?utf-8?B?ZG5aVmRsVDQzUmdpekVTVzRlTHBIV2FaTDZlZVN4UUVqeDhodHEyMUtQQi8r?=
 =?utf-8?B?M1NVRnBnRU9UOFM3OWJMWnZHSFpEMS9XYnpmQXFJU1loNEZXWXduSVBsMFVT?=
 =?utf-8?B?c0FuT2MrNm55MDI1a3hTZ21EVEx3eWlOTFNoL1QvN0QraHdBWHNOd0FDaTRF?=
 =?utf-8?B?YmJHTDNHN0liWFNFN014K3hzUzIzMklBdkt2U2ZjTXJDQW9sQnpmc3VwYzMw?=
 =?utf-8?Q?nGSIa0NZrF0CMkDOXw0S84XZWzKrvcZOPtq7rWR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a7c635-4af7-4ac3-ab20-08d920200345
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 08:26:51.6949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnAyusBImQ1D3fp+JdadObKN/15Ee+Zrxj/PiaGGJ9ZLBWZJKOI4Hci4C7MwKDq/NeIvoGqvSwdmVQPyb6UpjNTAaCaZOyL5DwxxXWZ5LPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3157
Received-SPF: pass client-ip=40.107.21.115;
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

26.05.2021 03:24, John Snow wrote:
> Add setup.cfg and setup.py, necessary for installing a package via
> pip. Add a ReST document (PACKAGE.rst) explaining the basics of what
> this package is for and who to contact for more information. This
> document will be used as the landing page for the package on PyPI.
> 
> List the subpackages we intend to package by name instead of using
> find_namespace because find_namespace will naively also packages tests,
> things it finds in the dist/ folder, etc. I could not figure out how to
> modify this behavior; adding allow/deny lists to setuptools kept
> changing the packaged hierarchy. This works, roll with it.
> 
> I am not yet using a pyproject.toml style package manifest, because
> "editable" installs are not defined (yet?) by PEP-517/518.
> 
> I consider editable installs crucial for development, though they have
> (apparently) always been somewhat poorly defined.
> 
> Pip now (19.2 and later) now supports editable installs for projects
> using pyproject.toml manifests, but might require the use of the
> --no-use-pep517 flag, which somewhat defeats the point. Full support for
> setup.py-less editable installs was not introduced until pip 21.1.1:
> https://github.com/pypa/pip/pull/9547/commits/7a95720e796a5e56481c1cc20b6ce6249c50f357
> 
> For now, while the dust settles, stick with the de-facto
> setup.py/setup.cfg combination supported by setuptools. It will be worth
> re-evaluating this point again in the future when our supported build
> platforms all ship a fairly modern pip.
> 
> Additional reading on this matter:
> 
> https://github.com/pypa/packaging-problems/issues/256
> https://github.com/pypa/pip/issues/6334
> https://github.com/pypa/pip/issues/6375
> https://github.com/pypa/pip/issues/6434
> https://github.com/pypa/pip/issues/6438
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/PACKAGE.rst | 33 +++++++++++++++++++++++++++++++++
>   python/setup.cfg   | 22 ++++++++++++++++++++++
>   python/setup.py    | 23 +++++++++++++++++++++++
>   3 files changed, 78 insertions(+)
>   create mode 100644 python/PACKAGE.rst
>   create mode 100644 python/setup.cfg
>   create mode 100755 python/setup.py
> 
> diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
> new file mode 100644
> index 00000000000..1bbfe1b58e2
> --- /dev/null
> +++ b/python/PACKAGE.rst
> @@ -0,0 +1,33 @@
> +QEMU Python Tooling
> +===================
> +
> +This package provides QEMU tooling used by the QEMU project to build,
> +configure, and test QEMU. It is not a fully-fledged SDK and it is subject
> +to change at any time.
> +
> +Usage
> +-----
> +
> +The ``qemu.qmp`` subpackage provides a library for communicating with
> +QMP servers. The ``qemu.machine`` subpackage offers rudimentary
> +facilities for launching and managing QEMU processes. Refer to each
> +package's documentation
> +(``>>> help(qemu.qmp)``, ``>>> help(qemu.machine)``)
> +for more information.
> +
> +Contributing
> +------------
> +
> +This package is maintained by John Snow <jsnow@redhat.com> as part of
> +the QEMU source tree. Contributions are welcome and follow the `QEMU
> +patch submission process
> +<https://wiki.qemu.org/Contribute/SubmitAPatch>`_, which involves
> +sending patches to the QEMU development mailing list.
> +
> +John maintains a `GitLab staging branch
> +<https://gitlab.com/jsnow/qemu/-/tree/python>`_, and there is an
> +official `GitLab mirror <https://gitlab.com/qemu-project/qemu>`_.
> +
> +Please report bugs on the `QEMU issue tracker
> +<https://gitlab.com/qemu-project/qemu/-/issues>`_ and tag ``@jsnow`` in
> +the report.
> diff --git a/python/setup.cfg b/python/setup.cfg
> new file mode 100644
> index 00000000000..3fa92a2e73f
> --- /dev/null
> +++ b/python/setup.cfg
> @@ -0,0 +1,22 @@
> +[metadata]
> +name = qemu
> +maintainer = QEMU Developer Team
> +maintainer_email = qemu-devel@nongnu.org
> +url = https://www.qemu.org/
> +download_url = https://www.qemu.org/download/
> +description = QEMU Python Build, Debug and SDK tooling.
> +long_description = file:PACKAGE.rst
> +long_description_content_type = text/x-rst
> +classifiers =
> +    Development Status :: 3 - Alpha
> +    License :: OSI Approved :: GNU General Public License v2 (GPLv2)
> +    Natural Language :: English
> +    Operating System :: OS Independent
> +    Programming Language :: Python :: 3 :: Only
> +
> +[options]
> +python_requires = >= 3.6
> +packages =
> +    qemu.qmp
> +    qemu.machine
> +    qemu.utils
> diff --git a/python/setup.py b/python/setup.py
> new file mode 100755
> index 00000000000..2014f81b757
> --- /dev/null
> +++ b/python/setup.py
> @@ -0,0 +1,23 @@
> +#!/usr/bin/env python3
> +"""
> +QEMU tooling installer script
> +Copyright (c) 2020-2021 John Snow for Red Hat, Inc.
> +"""
> +
> +import setuptools
> +import pkg_resources
> +
> +
> +def main():
> +    """
> +    QEMU tooling installer
> +    """
> +
> +    # https://medium.com/@daveshawley/safely-using-setup-cfg-for-metadata-1babbe54c108
> +    pkg_resources.require('setuptools>=39.2')
> +
> +    setuptools.setup()
> +
> +
> +if __name__ == '__main__':
> +    main()
> 

I can't be sure in the syntax and details, but nothing looks wrong to me:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

