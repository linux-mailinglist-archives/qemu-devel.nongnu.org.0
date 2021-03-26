Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD034AB55
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:21:04 +0100 (CET)
Received: from localhost ([::1]:39784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPoGj-0004YX-Jv
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lPoEH-0002qa-Oh
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:18:29 -0400
Received: from mail-he1eur04hn0239.outbound.protection.outlook.com
 ([52.100.18.239]:16239 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lPoEA-0007po-AE
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:18:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZE1kxi39rLNKqpPD/EsMbj5Ul2GsHvbabD3OKEqJGqP/HRqYlaZn30aaj3KXZG0jFj42PCxlkCVHb6PoVDPJjimsAPhGhoYGONNnbZB8IaJjAYEQiHFPKRf49Vu6+lac6XPOU64q2QhnzW/p+PNO9l9Wm0hTlvsNaEc/6urA9OjfJ+3InMPMUASdPeRxhMz9iFAb5O/txHHkhilJ+Xuazp0Wau9TplTKhvWiY5QMMRPcSXhxhjJiq3KY1iqVEROufWKo1bec6C5wjL/MIgnMMCLNpR3Gcy3ixU91PDjxtImWq0nLZ3yHhIWnF3vVE/g3GKUZk2ipIMWCb4RE4AmRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7vLP5DPXHQtWI1xZe2uAYboM1NPzHNMZANLgU+i1ZQ=;
 b=E1V7ljitEwsmAqbzXYgx+3rn0mohDjdz2qZiBYIH/YNQsMlkbeXFqfKihM4gtTs3HoCOhaegGCdpZBnbnW0AC/550X2YaVtu6qQxcEZ07KfOlE1KWiRP7iiRvN9lRy/jQ9eK+cxFJERR8o0UjKJVNhkSQK+h+gBbHwA/HBw10NjR2OxhtY3TS3LVXptjAhavSVTmH3qFHN7vjF1t+uMrPgGTjZoiyWP6XsWBtz3y67VfaNBICBEbrLWg2YjvWzAU0xwhswGYCQPYVzIDMa9/ieKajXaHlUYb555CIctCfX47RMkOiFXAwdsp8lS9+Hxm8VzycrkK4bAqIkmlpovWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7vLP5DPXHQtWI1xZe2uAYboM1NPzHNMZANLgU+i1ZQ=;
 b=WdHLl/6TMsq93DjuUMAuZ7vI5eQ6D1lT350DqFU05EuCq9Tu/baTIKKqA+wgZNu6VNZrvFCbZpFgarcpaZSs1obdWHBDWX95/J5zg6T1limjG69l6x1G3VFVczKLBuMxWeqNv7H0tuO+aq9i+IviF8BqJ2Iw9m0ZlDNUL4LFJog=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from PA4PR08MB5999.eurprd08.prod.outlook.com (2603:10a6:102:f2::17)
 by PR3PR08MB5626.eurprd08.prod.outlook.com (2603:10a6:102:81::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 26 Mar
 2021 15:18:11 +0000
Received: from PA4PR08MB5999.eurprd08.prod.outlook.com
 ([fe80::b47d:a1a6:cb8:7a05]) by PA4PR08MB5999.eurprd08.prod.outlook.com
 ([fe80::b47d:a1a6:cb8:7a05%7]) with mapi id 15.20.3977.030; Fri, 26 Mar 2021
 15:18:11 +0000
Date: Fri, 26 Mar 2021 18:18:08 +0300
From: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>
Subject: Re: [PATCH v2] qapi: introduce 'query-cpu-model-cpuid' action
Message-ID: <20210326151808.GC97643@dhcp-172-16-24-191.sw.ru>
References: <20210325165705.2342-1-valeriy.vdovin@virtuozzo.com>
 <c990804e-3180-5575-3a30-06fa6d3e7630@virtuozzo.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c990804e-3180-5575-3a30-06fa6d3e7630@virtuozzo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [185.231.240.5]
X-ClientProxiedBy: AM8P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::34) To PA4PR08MB5999.eurprd08.prod.outlook.com
 (2603:10a6:102:f2::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-172-16-24-191.sw.ru (185.231.240.5) by
 AM8P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Fri, 26 Mar 2021 15:18:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04892ecf-326d-4974-0d8b-08d8f06a5e5d
X-MS-TrafficTypeDiagnostic: PR3PR08MB5626:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PR3PR08MB5626E6F9D3AE7019598464F987619@PR3PR08MB5626.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:PA4PR08MB5999.eurprd08.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(16526019)(26005)(956004)(83380400001)(186003)(44832011)(107886003)(9686003)(30864003)(55016002)(1076003)(54906003)(6636002)(316002)(4326008)(38100700001)(36756003)(6506007)(5660300002)(33656002)(6862004)(478600001)(66946007)(66556008)(8676002)(2906002)(66476007)(86362001)(7696005)(52116002)(8936002)(30126003);
 DIR:OUT; SFP:1501; 
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gkBNA8i5qxoyu2wKbczPeG1F4wPxL9Uyy0ajPXfF11sUYQaEvkiz2g8UiLuG?=
 =?us-ascii?Q?gp83S8EE4wD6r908nrPvEMrhAA3LYCGgEiv8+QXenV8IQlofTNg1n+FhgJSb?=
 =?us-ascii?Q?OwnZF8RicdCQQpFc/XI4h2wPVeVPeEN2QVZi891fXstMR9UH6weL9JMbrGqy?=
 =?us-ascii?Q?iYd1WwhsyehV1KEdhNl1UblnUUbCR3B1Ka+WWIaJZVOC9gDRn3t/Z8itd/hu?=
 =?us-ascii?Q?Et/SLoz9pmo5y1eNYRl+W//Rda14b+9MkHVH6oWfCo7in9mVWf/tdAe3QM/j?=
 =?us-ascii?Q?29iavT6U1B8sRUe7moZjWDYv2EliPnd6x0sNtk7BBF6mmpixqDrbb+F/zAln?=
 =?us-ascii?Q?Vbynal/ENEPoc+1v4dylvQs90S0FGyzBVEDwpmCf7n1yVsLQubVev5tGNDZ0?=
 =?us-ascii?Q?yFll6iNXRfVcP7oxANgTpiAoEwCmFK6zoccQgQVZI0BTTAuSGtvImdh/8w8A?=
 =?us-ascii?Q?Q+mSOjHKRwosYzh3kppXxoDThyLW5QaLyO15u7+++P6HUXaaNvFAATX3j64+?=
 =?us-ascii?Q?RRChUDxvCl3yHkg4Gwdf9Dxpyaw/DbuBr6JHq4tiFzZUGuuE4HR8cwMj2OUl?=
 =?us-ascii?Q?gS0G5Kruciea6IxSUPWrqkbRW2PdkxbBHpX6/IpF8HhTIOSbNUdGQ4yo/lDE?=
 =?us-ascii?Q?/YqJzIWjIex6HPAa4j3Tbq3U2LD0138LEc3IHtHF27j7QXRTorDaBCdrvt6K?=
 =?us-ascii?Q?OrwPFOrwtbPPMfoiy1LkJZ/mO1qv1WQzZV5kRufNS1Vo+t0gZr5Pp5a4CP00?=
 =?us-ascii?Q?E7rRcgH8DpB3AD1r2u1HiQMIfRJK3X7757hpp8HWSy0RTPWXiQBEc8vrZrio?=
 =?us-ascii?Q?l5+/U4OKWJzgrjtPQUbLHPlw3U5Gv/lSEBGEPQCAyG9AwzXX8Kj65DNWdzoS?=
 =?us-ascii?Q?dGJSxc2xyS7GL/+N+mM94WlBExPW3ZP4CtAS80SfVVrDZheKkVQ+A/yY2fFo?=
 =?us-ascii?Q?/ypdRqZgSugz98HN1Dvr4fee4ekundcaLXTSOmGsRD0=3D?=
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?b0sSyvSyCjk5w5+Oh4fZl4TVgeu+X110BODgBMPLlWQNp805pVfAqpAk6Q5b?=
 =?us-ascii?Q?8EzIdWFiJ9WcnABaXdLCaFE7cri+ccoSxRvosjd+hzlUxbdDYkabSOr8hBZg?=
 =?us-ascii?Q?tK1aOOZIzjX8uCIk8S3SJrmyy+oHsdMY8N7+yDnb3q5+SP0szV8NP4aL8mDf?=
 =?us-ascii?Q?nFDZxB+qZldPqcgD8Fg1zs57n08CyeaxLsLC76Hyd+XQw0MYK1uhHHBt9wcP?=
 =?us-ascii?Q?OXozGjLbWtqLLeBzRFM2mi8InEctJb403W1lALfOuM/NWRzd11vk9AI5whFs?=
 =?us-ascii?Q?JEl6uJygQ5RU37wwBk6PAiSBHy5pNb1b2Vwq1/TVtLLwHDB/7BIx53sLUq3n?=
 =?us-ascii?Q?mj5IMQ3x+KASs1MC0WzAre/3QfTu8iQK+vZvs4yGv5TWil702CkEm9nr3sPy?=
 =?us-ascii?Q?zOH0J2pHBHLEeEe1qsGG0YyuN890kgBXfMbnHijD1o6ETa32fxcR02gxoaUk?=
 =?us-ascii?Q?ZQcxUU9j/VKTeTHjQnEL693N6IgBd1BC/CAcInjEM5Cj5UurND+MPT2NmpXX?=
 =?us-ascii?Q?eS7nSY5YCcD31NS1yzQVlr/P/C2Aqy32a8P4aTHYnEyCiLGOE6Hl3HPk1pnF?=
 =?us-ascii?Q?GmxS5KukfTczboLd7zRKWJ6yfT0XJ9928TwZ6krljudOSbkOgEp5z1cB5XWt?=
 =?us-ascii?Q?U2FyJSPZXssUaiKC8JV6iLAvCDAzdnoQXg1wpvSZj/Ky4nmr8ZzS6SzXd1ry?=
 =?us-ascii?Q?yErH8TGd5TpmTWLAEL7wJHnj/y071jzdIHbBK6VL0x+6SYTChBeb6ViTTbjL?=
 =?us-ascii?Q?xeY4pCQl9rLAX++06NVOIGoKsVv19Py+FNB6JlvBr7O3+/+nSmHBVnVnhFOG?=
 =?us-ascii?Q?QeIPJE9bbfyjH7JW5utKQd1KX9jmLMjbSbB5AwK7nNsauXqarIacE59TKqQG?=
 =?us-ascii?Q?vtel3ZkSBYWaIdTQwNQ50cvuE0iPBK7gTbF3moJc+aa7+9RUNe8i6abzzqbP?=
 =?us-ascii?Q?fCWBckviJr1CSc/RDRjFn++ObdcSoj/eFk6nIiBLaWdQdyyX1IybIdKppjsX?=
 =?us-ascii?Q?54FD6RN1VDkqxT3cJpuzpoMbf5pL3d2j455eR/5tANe4Ur9Mv7kmx3VBR+AR?=
 =?us-ascii?Q?ftdI5BKVcC1RjgjUkT9te/+xMayHkEKtwQ1O9plCfChoi8usKsnE8RW3sObM?=
 =?us-ascii?Q?pit64FxpFANZgSNW3NDpRPrBaGZqu9fyk3t3eD2hBYH6DK1p7oH62XcKcFla?=
 =?us-ascii?Q?xBvgQCv8qpGTxoGkp+Rtb8otJ1GeXl3DIiIAX279ebvCcwhVjbGm1B7h2YLU?=
 =?us-ascii?Q?S7E4l/i/uXdCOV7/afcJRCw773jvjRAGywqPNHbnP0kYKE6X2h8Hc1H2t4MH?=
 =?us-ascii?Q?9xAZ41AVZ2vpqprUzi/0/Kiv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04892ecf-326d-4974-0d8b-08d8f06a5e5d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB5999.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 15:18:11.4814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWf4G2ydymHon7oRWx0aD7X+Uaw3hptOyabmwBHSwkJTzfk3s61Je57X1QfitM7PSuu4aq2dGubdtJJ82hMMh97/bP41tvUtfCup1KRsgJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5626
Received-SPF: pass client-ip=52.100.18.239;
 envelope-from=Valeriy.Vdovin@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

On Fri, Mar 26, 2021 at 01:01:49PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 25.03.2021 19:57, Valeriy Vdovin wrote:
> >Introducing new qapi method 'query-cpu-model-cpuid'. This method can be used to
> >get virtualized cpu model info generated by QEMU during VM initialization in
> >the form of cpuid representation.
> >
> >Diving into more details about virtual cpu generation: QEMU first parses '-cpu'
> >command line option. From there it takes the name of the model as the basis for
> >feature set of the new virtual cpu. After that it uses trailing '-cpu' options,
> >that state if additional cpu features should be present on the virtual cpu or
> >excluded from it (tokens '+'/'-' or '=on'/'=off').
> >After that QEMU checks if the host's cpu can actually support the derived
> >feature set and applies host limitations to it.
> >After this initialization procedure, virtual cpu has it's model and
> >vendor names, and a working feature set and is ready for identification
> >instructions such as CPUID.
> >
> >Currently full output for this method is only supported for x86 cpus.
> >
> >To learn exactly how virtual cpu is presented to the guest machine via CPUID
> >instruction, new qapi method can be used. By calling 'query-cpu-model-cpuid'
> >method, one can get a full listing of all CPUID leafs with subleafs which are
> >supported by the initialized virtual cpu.
> >
> >Other than debug, the method is useful in cases when we would like to
> >utilize QEMU's virtual cpu initialization routines and put the retrieved
> >values into kernel CPUID overriding mechanics for more precise control
> >over how various processes perceive its underlying hardware with
> >container processes as a good example.
> >
> >Output format:
> >The core part of the returned JSON object can be described as a list of lists
> >with top level list contains leaf-level elements and the bottom level
> >containing subleafs, where 'leaf' is CPUID argument passed in EAX register and
> >'subleaf' is a value passed to CPUID in ECX register for some specific
> >leafs, that support that. Each most basic CPUID result is passed in a
> >maximum of 4 registers EAX, EBX, ECX and EDX, with most leafs not utilizing
> >all 4 registers at once.
> >Also note that 'subleaf' is a kind of extension, used by only a couple of
> >leafs, while most of the leafs don't have this. Nevertheless, the output
> >data structure presents ALL leafs as having at least a single 'subleaf'.
> >This is done for data structure uniformity, so that it could be
> >processed in a more straightforward manner, in this case no one suffers
> >from such simplification.
> >
> >Use example:
> >virsh qemu-monitor-command VM --pretty '{ "execute": "query-cpu-model-cpuid" }'
> >{
> >   "return": {
> >     "cpuid": {
> >       "leafs": [
> >         {
> >           "leaf": 0,
> >           "subleafs": [
> >             {
> >               "eax": 13,
> >               "edx": 1231384169,
> >               "ecx": 1818588270,
> >               "ebx": 1970169159,
> >               "subleaf": 0
> >             }
> >           ]
> >         },
> >         {
> >           "leaf": 1,
> >           "subleafs": [
> >             {
> >               "eax": 329443,
> >               "edx": 529267711,
> >               "ecx": 4160369187,
> >               "ebx": 133120,
> >               "subleaf": 0
> >             }
> >           ]
> >         },
> >         {
> >           "leaf": 2,
> >           "subleafs": [
> >             {
> >               "eax": 1,
> >               "edx": 2895997,
> >               "ecx": 0,
> >               "ebx": 0,
> >               "subleaf": 0
> >             }
> >           ]
> >         },
> >       ]
> >     },
> >     "vendor": "GenuineIntel",
> >     "class-name": "Skylake-Client-IBRS-x86_64-cpu",
> >     "model-id": "Intel Core Processor (Skylake, IBRS)"
> >   },
> >   "id": "libvirt-40"
> >}
> >
> >Signed-off-by: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
> >---
> >v2: - Removed leaf/subleaf iterators.
> >     - Modified cpu_x86_cpuid to return false in cases when count is
> >       greater than supported subleaves.
> >
> >  qapi/machine-target.json | 122 +++++++++++++++++++++++
> >  target/i386/cpu.h        |   2 +-
> >  target/i386/cpu.c        | 209 +++++++++++++++++++++++++++++++++++----
> >  3 files changed, 315 insertions(+), 18 deletions(-)
> >
> >diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> >index e7811654b7..c5b137aa5c 100644
> >--- a/qapi/machine-target.json
> >+++ b/qapi/machine-target.json
> >@@ -329,3 +329,125 @@
> >  ##
> >  { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
> >    'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> >+##
> >+
> >+
> >+# @CpuidSubleaf:
> >+#
> >+# CPUID leaf extension information, based on ECX value.
> >+#
> >+# CPUID x86 instruction has 'leaf' argument passed in EAX register. Leaf
> >+# argument identifies the type of information, the caller wants to retrieve in
> >+# single call to CPUID.
> >+# Some but not all leaves depend on the value passed in ECX register as an
> >+# additional argument to CPUID. This argument is present in cpuid documentation
> >+# as 'subleaf'.
> >+# If CPUID ignores the value in ECX, normally this means that leaf does not
> >+# have subleaves. Another way to see it is that each leaf has at least one
> >+# subleaf (one type of output).
> >+#
> >+# @subleaf: value passed to CPUID in ECX register. If CPUID leaf has only a
> >+#           single leaf, the value of ECX is ignored by CPU and should as well
> >+#           be ignored in this field.
> >+# @eax: value in eax after CPUID instruction
> >+# @ebx: value in ebx after CPUID instruction
> >+# @ecx: value in ecx after CPUID instruction
> >+# @edx: value in edx after CPUID instruction
> >+#
> >+# Since: 6.1
> >+##
> >+{ 'struct': 'CpuidSubleaf',
> >+  'data': { 'subleaf' : 'int',
> >+            'eax': 'int',
> >+            'ebx': 'int',
> >+            'ecx': 'int',
> >+            'edx': 'int'
> >+          }
> >+}
> >+
> >+##
> >+# @CpuidLeaf:
> >+#
> >+# A single CPUID leaf.
> >+#
> >+# CPUID instruction accepts 'leaf' argument passed in EAX register.
> >+# A 'leaf' is a single group of information about the CPU, that is returned
> >+# to the caller in EAX, EBX, ECX and EDX registers. A few of the leaves will
> >+# also have 'subleaves', the group of information would partially depend on the
> >+# value passed in the ECX register. If the leaf has subleaves, it will
> >+# only have more than one item in 'subleaves' array. If the leaf has no
> >+# subleaves, only one item will be present in the 'subleaves' list.
> >+#
> >+# @leaf: CPUID leaf or the value of EAX prior to CPUID execution.
> >+# @subleaves: array of subleaves.
> >+#
> >+# Since: 6.1
> >+##
> >+{ 'struct': 'CpuidLeaf',
> >+  'data': { 'leaf' : 'int',
> >+            'subleaves' : [ 'CpuidSubleaf' ] } }
> >+
> >+##
> >+# @CpuModelCpuid:
> >+#
> >+# Virtual CPU model.
> >+#
> >+# A CPU model consists of the name of a CPU definition, to which
> >+# delta changes are applied (e.g. features added/removed). Most magic values
> >+# that an architecture might require should be hidden behind the name.
> >+# However, if required, architectures can expose relevant properties.
> >+#
> >+# @leaves: array of all available cpuid leaves
> >+#
> >+# Since: 6.1
> >+##
> >+{ 'struct': 'CpuModelCpuid',
> >+  'data': {  'leaves' : [ 'CpuidLeaf' ] }
> >+}
> >+
> >+##
> >+# @CpuModelCpuidDescription:
> >+#
> >+# Virtual CPU model.
> >+#
> >+# This describes information generated by QEMU and used by it to respond CPUID
> >+# requests from guest along with some general information about the cpu model,
> >+# that might be useful for the caller of qapi requests.
> >+#
> >+# @class-name: class name of the CPU model in qemu object model
> >+# @model-id: CPU model name string that will be passed in CPUID, EAX=0
> >+# @vendor: CPU vendor name string that will be passed in CPUID, EAX=0
> >+# @cpuid: Full tree of CPUID leaves, that is generated by QEMU at virtual cpu
> >+#         initialization step by parsing "-cpu " option and creating the virtual cpu
> >+#         model. CpuModelCpuidDescription can be examined to predict QEMU's response to
> >+#         CPUID instructions from the guest.
> >+#
> >+# Since: 6.1
> >+##
> >+{ 'struct': 'CpuModelCpuidDescription',
> >+  'data': {  'class-name': 'str',
> >+             'model-id': 'str',
> >+             'vendor' : 'str',
> >+             'cpuid' : 'CpuModelCpuid'
> >+          }
> >+}
> >+
> >+##
> >+# @query-cpu-model-cpuid:
> >+#
> >+# Returns description of a virtual CPU model, created by QEMU after cpu
> >+# initialization routines. The resulting information is a reflection of a parsed
> >+# '-cpu' command line option, filtered by available host cpu features.
> >+#
> >+# Returns:  @CpuModelCpuidDescription
> >+#
> >+# Example:
> >+#
> >+# -> { "execute": "query-cpu-model-cpuid" }
> >+# <- { "return": 'CpuModelCpuidDescription' }
> >+#
> >+# Since: 6.1
> >+##
> >+{ 'command': 'query-cpu-model-cpuid',
> >+  'returns': 'CpuModelCpuidDescription',
> >+  'if': 'defined(TARGET_I386)' }
> >diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> >index 570f916878..19c1dfea60 100644
> >--- a/target/i386/cpu.h
> >+++ b/target/i386/cpu.h
> >@@ -1926,7 +1926,7 @@ int cpu_x86_signal_handler(int host_signum, void *pinfo,
> >                             void *puc);
> >  /* cpu.c */
> >-void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >+bool cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >                     uint32_t *eax, uint32_t *ebx,
> >                     uint32_t *ecx, uint32_t *edx);
> >  void cpu_clear_apic_feature(CPUX86State *env);
> >diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> >index 6b3e9467f1..9f3bc7d448 100644
> >--- a/target/i386/cpu.c
> >+++ b/target/i386/cpu.c
> >@@ -5148,6 +5148,161 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> >      return cpu_list;
> >  }
> >+/*
> >+ * struct cpuid_leaf_range - helper struct that describes valid range of
> >+ * cpuid leaves as returned by CPUID in response to EAX=0 or EAX=0x80000000,
> >+ * etc.
> >+ *
> >+ * The purpose of this struct is to deal with a sparse nature of leaf value
> >+ * space. Ther CPUID logic of returning the maximum leaf is not straightforward
> 
> s/Ther/The/
> 
> >+ * and requires inner knowledge of what cpuid extensions are available on a
> >+ * specific cpu. Also this logic is designed to be expandable across many years
> >+ * ahead. QEMU code would have to be updated as well. That's why there should
> >+ * be only one point where all cpuid leaf ranges logic will be modified.
> >+ *
> >+ * In practice this will be used to detect if any arbitrary cpuid leaf value
> >+ * is valid for a specific cpu model. For that one will call
> >+ * 'cpuid_get_cpuid_leaf_ranges' to get all valid ranges for a provided cpu
> >+ * model and then call 'cpu_leaf_in_range' to find out which of the ranges
> >+ * contains the leaf in question.
> >+ */
> >+#define CPUID_MAX_LEAF_RANGES 4
> >+
> >+struct cpuid_leaf_range {
> 
> As I said, you should use CamelCase and add a typedef to satisfy QEMU coding style (docs/devel/style.rst)
> 
> >+    uint32_t min;
> >+    uint32_t max;
> >+};
> >+
> >+struct cpuid_leaf_ranges {
> >+    struct cpuid_leaf_range ranges[CPUID_MAX_LEAF_RANGES];
> >+    int count;
> >+};
> >+
> >+static void cpuid_get_cpuid_leaf_ranges(CPUX86State *env,
> >+                                        struct cpuid_leaf_ranges *r)
> >+{
> >+    struct cpuid_leaf_range *rng;
> >+
> >+    r->count = 0;
> >+    rng = &r->ranges[r->count++];
> >+    rng->min = 0x00000000;
> >+    rng->max = env->cpuid_level;
> >+
> >+    rng = &r->ranges[r->count++];
> >+    rng->min = 0x40000000;
> >+    rng->max = 0x40000001;
> >+
> >+    if (env->cpuid_xlevel) {
> >+        rng = &r->ranges[r->count++];
> >+        rng->min = 0x80000000;
> >+        rng->max = env->cpuid_xlevel;
> >+    }
> >+
> >+    if (env->cpuid_xlevel2) {
> >+        rng = &r->ranges[r->count++];
> >+        rng->min = 0xC0000000;
> >+        rng->max = env->cpuid_xlevel2;
> >+    }
> >+}
> >+
> >+static inline bool cpuid_leaf_in_range(uint32_t leaf,
> >+                                       struct cpuid_leaf_range *r)
> >+{
> >+    return leaf >= r->min && leaf <= r->max;
> >+}
> >+
> >+static uint32_t cpuid_limit_from_leaf(CPUX86State *env, uint32_t leaf)
> >+{
> >+    struct cpuid_leaf_ranges ranges;
> >+    struct cpuid_leaf_range *current_range, *end_range;
> >+
> >+    cpuid_get_cpuid_leaf_ranges(env, &ranges);
> >+    current_range = &ranges.ranges[0];
> >+    end_range = current_range + ranges.count;
> >+    while (current_range != end_range) {
> >+        if (cpuid_leaf_in_range(leaf, current_range)) {
> >+            break;
> >+        }
> >+        current_range++;
> >+    }
> >+    if (current_range != end_range) {
> >+        return current_range->max;
> >+    }
> 
> use for loop, it would be shorter and needs less variables.
> 
> >+    return 0;
> >+}
> >+
> >+static void cpu_model_fill_cpuid(Object *cpu, CpuModelCpuidDescription *info,
> >+                                 Error **errp)
> >+{
> >+    struct cpuid_leaf_ranges ranges;
> >+    struct cpuid_leaf_range *range;
> >+    uint32_t eax, ebx, ecx, edx;
> >+    CpuidLeaf *leaf;
> >+    CpuidLeafList **leaf_tail;
> >+    CpuidSubleaf *subleaf;
> >+    CpuidSubleafList **subleaf_tail;
> >+    X86CPU *x86_cpu = X86_CPU(cpu);
> >+
> >+    int range_idx;
> >+    int leaf_idx, subleaf_idx;
> >+
> >+    info->cpuid = g_malloc0(sizeof(*info->cpuid));
> >+    leaf_tail = &info->cpuid->leaves;
> >+    info->model_id = object_property_get_str(cpu, "model-id", errp);
> >+    info->vendor = object_property_get_str(cpu, "vendor", errp);
> 
> you need g_strdup() for putting strings into qapi.
> 
> >+
> >+    cpuid_get_cpuid_leaf_ranges(&x86_cpu->env, &ranges);
> >+    for (range_idx = 0; range_idx < ranges.count; ++range_idx) {
> >+        range = &ranges.ranges[range_idx];
> >+        for (leaf_idx = range->min; leaf_idx <= range->max; ++leaf_idx) {
> >+            subleaf_idx = 0;
> >+            if (!cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax, &ebx,
> >+                           &ecx, &edx)) {
> 
> indentation broken
> 
> >+                continue;
> >+            }
> >+
> >+            leaf = g_malloc0(sizeof(*leaf));
> >+            leaf->leaf = leaf_idx;
> >+            subleaf_tail = &leaf->subleaves;
> >+            while (true) {
> >+                subleaf = g_malloc0(sizeof(*subleaf));
> >+                subleaf->subleaf = subleaf_idx;
> >+                subleaf->eax = eax;
> >+                subleaf->ebx = ebx;
> >+                subleaf->ecx = ecx;
> >+                subleaf->edx = edx;
> >+                QAPI_LIST_APPEND(subleaf_tail, subleaf);
> >+                subleaf_idx++;
> >+                if (!cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax,
> >+                                   &ebx, &ecx, &edx)) {
> >+                    break;
> >+                }
> >+            }
> 
> looks like do { } while (cpu_x86_cpuid(..)); I'd use do-while.. But it's OK as is.
> 
> 
> >+            QAPI_LIST_APPEND(leaf_tail, leaf);
> >+        }
> >+    }
> >+}
> >+
> >+CpuModelCpuidDescription *qmp_query_cpu_model_cpuid(Error **errp)
> >+{
> >+    MachineState *ms = MACHINE(qdev_get_machine());
> >+    const char *class_name;
> >+    CpuModelCpuidDescription *info;
> >+    SysEmuTarget target = qapi_enum_parse(&SysEmuTarget_lookup, TARGET_NAME,
> >+                                          -1, &error_abort);
> >+    Object *cpu = ms->possible_cpus->cpus[0].cpu;
> 
> Hmm, what is ms->possible_cpus->cpus[0]? For me (not knowing the subsytem) looks like you query one of the cpus, and user can't select which cpu he wants to query..
> 
> In other word, interface of the new command is strange if we have more than one possible cpu..
> 
> For exmaple qmp_query_cpus_fast to CPU_FOREACH.. Shouldn't we do something like this?
> 
> Or may be new cpuid information should be just added to qmp_qeury_cpus_fast command ?
> 
'possible_cpus' is an array of cpus, initialized from one and the same cpu_type
For x86 possible_cpus is allocated in function x86_possible_cpu_arch_ids with size taken from '-smp '
command line option, after that each element of the resulted array is initialized by the cpu_type. In turn,
cpu_type was initialized earlier from '-cpu ' command line in vl.c in line:
  current_machine->cpu_type = parse_cpu_option(cpu_option);

That being said, it seems safe to use any element of 'possible_cpus' array to access cpu_type-related information.
Of course only after cpus have been fully initialized.

One more thing to note: indeed there are some other QAPI methods like look very alike by their name, like
'query-cpu-model-expansion', which actually takes cpu type as an argument. But in case of this new QAPI method in discussion,
we really want to see what the virtual cpu looks like after it has been initialized with '-cpu ' command line option along 
with all additional and excluded features and host-cpu imposed limitations. In the way this patch is written, we get this 
for free by just providing cpu type in the command line without the need to duplicate complex code of cpu string parsing 
and further initialization and feature filtering.
 
> Hmm, or look at qmp_query_cpu_definitions.. it does g_slist_foreach()..
> 
qmp_query_cpu_definitions iterates over all the cpu BASE models that are
present in targets/i386/cpu.c file. This is a sort of database of
expandable database of BASE cpu types, which only surve as a basis for
further feature expansion / exclusion and some other filtering. If we
would go this way, then we would have to do the filtering code
ourselves.

> Also, we have implementation of qmp_query_cpu_* commands in different architectures.. Probably we'll need add some stubs for the new command as well.
> 
Currently I do not have a clear idea of how we could do this, because cpuid is very specific to x86. Other cpu architectures also have cpu 
identification means that could be close to x86 cpuid, but not as close to easily generalize this method. But I'm willing to hear out a
good advice on this topic.

> >+
> >+    class_name = object_class_get_name(object_get_class(cpu));
> >+    info = g_malloc0(sizeof(*info));
> >+    info->class_name = g_strdup(class_name);
> >+
> >+    if (target == SYS_EMU_TARGET_X86_64) {
> >+        cpu_model_fill_cpuid(cpu, info, errp);
> >+    }
> >+
> >+    return info;
> >+}
> >+
> >  static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
> >                                                     bool migratable_only)
> >  {
> >@@ -5591,14 +5746,14 @@ void cpu_clear_apic_feature(CPUX86State *env)
> >  #endif /* !CONFIG_USER_ONLY */
> >-void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >+bool cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> 
> please, add a comment above the function that would describe the interface, or at least document the new return value.
> 
> >                     uint32_t *eax, uint32_t *ebx,
> >                     uint32_t *ecx, uint32_t *edx)
> >  {
> >      X86CPU *cpu = env_archcpu(env);
> >      CPUState *cs = env_cpu(env);
> >      uint32_t die_offset;
> >-    uint32_t limit;
> >+    uint32_t limit, nr_subleaves = 1;
> 
> It was my idea.. I now think that it would be simpler to just do
> 
> bool valid = true; here. and set it to false in some places.
> 
> >      uint32_t signature[3];
> >      X86CPUTopoInfo topo_info;
> >@@ -5607,15 +5762,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >      topo_info.threads_per_core = cs->nr_threads;
> >      /* Calculate & apply limits for different index ranges */
> >-    if (index >= 0xC0000000) {
> >-        limit = env->cpuid_xlevel2;
> >-    } else if (index >= 0x80000000) {
> >-        limit = env->cpuid_xlevel;
> >-    } else if (index >= 0x40000000) {
> >-        limit = 0x40000001;
> >-    } else {
> >-        limit = env->cpuid_level;
> >-    }
> >+    limit = cpuid_limit_from_leaf(env, index);
> >      if (index > limit) {
> >          /* Intel documentation states that invalid EAX input will
> >@@ -5675,8 +5822,18 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >              if ((*eax & 31) && cs->nr_cores > 1) {
> >                  *eax |= (cs->nr_cores - 1) << 26;
> >              }
> >+            if (*eax || *ebx || *ecx || *edx) {
> >+                /*
> >+                 * host_cpuid has returned some valid info, that means count
> >+                 * is a valid agrument. Now we need to return true at function
> >+                 * exit by altering nr_subleaves to pass the return condition.
> >+                 * This is special for leaf 4.
> >+                 */
> >+                nr_subleaves = count + 1;
> >+            }
> >          } else {
> >              *eax = 0;
> >+            nr_subleaves = 3;
> >              switch (count) {
> >              case 0: /* L1 dcache info */
> >                  encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
> >@@ -5724,6 +5881,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          break;
> >      case 7:
> >          /* Structured Extended Feature Flags Enumeration Leaf */
> >+
> >+        /*
> >+         * env->cpuid_level_func7 returns the maximum subleaf index, whereas
> >+         * nr_subleaves - is the count, that's why + 1.
> >+         */
> >+        nr_subleaves = env->cpuid_level_func7 + 1;
> >          if (count == 0) {
> >              /* Maximum ECX value for sub-leaves */
> >              *eax = env->cpuid_level_func7;
> >@@ -5777,12 +5940,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          /* Extended Topology Enumeration Leaf */
> >          if (!cpu->enable_cpuid_0xb) {
> >                  *eax = *ebx = *ecx = *edx = 0;
> >-                break;
> >+                return false;
> >          }
> >          *ecx = count & 0xff;
> >          *edx = cpu->apic_id;
> >-
> >+        nr_subleaves = 2;
> >          switch (count) {
> >          case 0:
> >              *eax = apicid_core_offset(&topo_info);
> >@@ -5812,6 +5975,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          *ecx = count & 0xff;
> >          *edx = cpu->apic_id;
> >+        nr_subleaves = 3;
> >          switch (count) {
> >          case 0:
> >              *eax = apicid_core_offset(&topo_info);
> >@@ -5843,9 +6007,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          *ecx = 0;
> >          *edx = 0;
> >          if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
> >-            break;
> >+            return false;
> >          }
> >+        nr_subleaves = ARRAY_SIZE(x86_ext_save_areas);
> >          if (count == 0) {
> >              *ecx = xsave_area_size(x86_cpu_xsave_components(cpu));
> >              *eax = env->features[FEAT_XSAVE_COMP_LO];
> >@@ -5876,9 +6041,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          *edx = 0;
> >          if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) ||
> >              !kvm_enabled()) {
> >-            break;
> >+            return false;
> >          }
> >+        nr_subleaves = 2;
> >          if (count == 0) {
> >              *eax = INTEL_PT_MAX_SUBLEAF;
> >              *ebx = INTEL_PT_MINIMAL_EBX;
> >@@ -6031,6 +6197,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          *eax = 0;
> >          if (cpu->cache_info_passthrough) {
> >              host_cpuid(index, count, eax, ebx, ecx, edx);
> >+            /*
> >+             * Because we pass to the host we can only check how it fills
> >+             * output registers to check if count arg is valid.
> >+             */
> >+            if (!(*eax || *ebx || *ecx || *edx)) {
> >+                return false;
> >+            }
> >              break;
> >          }
> >          switch (count) {
> >@@ -6052,7 +6225,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >              break;
> >          default: /* end of info */
> >              *eax = *ebx = *ecx = *edx = 0;
> >-            break;
> >+            nr_subleaves = 3;
> >          }
> >          break;
> >      case 0x8000001E:
> >@@ -6063,6 +6236,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >              *ebx = 0;
> >              *ecx = 0;
> >              *edx = 0;
> >+            return false;
> >          }
> >          break;
> >      case 0xC0000000:
> >@@ -6101,8 +6275,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          *ebx = 0;
> >          *ecx = 0;
> >          *edx = 0;
> >-        break;
> >+        return false;
> >      }
> >+    return count < nr_subleaves ;
> >  }
> >  static void x86_cpu_reset(DeviceState *dev)
> >
> 
> 
> -- 
> Best regards,
> Vladimir

