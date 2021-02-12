Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578531A0A1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:32:48 +0100 (CET)
Received: from localhost ([::1]:48398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZV1-00049d-01
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAZTx-0003eb-FR
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:31:41 -0500
Received: from mail-eopbgr750114.outbound.protection.outlook.com
 ([40.107.75.114]:51390 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAZTv-0006K0-Ic
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:31:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDxJr8n5JpyAkv3WuYS6U/lDycOb/PzK6NgPfzJaACLuI7HupKluMz40Wf3QimHLfuoUGekHi68gJL6OV56O5VmvsN9XflYdftR7fw8DeYqdjz6cF71uate94gWzKrc3mlAygv6PQuVPw5zrtDS8tBdW33D1t2f5ySE1rLOaCe3bGuEDPDebM86vcYCOOmPok2+EeK8EkJBDA7aoEymrbS8awvzCMU/wsTHGWbIxJXkUgfofrYLf8DDH3Yaki8UGiDhZfWqzZIWSppZFC6nrRbUQiXr+yeS87PrDpCWPO6jcadlbTw8oNHWRdHh69eI2F/OVqX/2KPOJD66p2EZ0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jHvzWmURoyOxIYpc9ypodO6FCoyieiV28puJMkVhLw=;
 b=npoHpHL3zE7K0BLw8xBQrHtuKqTVL2YoVWBFSuQyI8IuLrJSa6gSerqEDWvDPTYzNx1pd9876bEoSRC1tIQbRluEkmLHxwuS5M5Oa+2MSzkSex4OisqniLCusRyk07mcx+L+3TexXBQG0sL7WU/7UWr1Jx5hqkhlIDRX/XayxU/Wv0SWGTlJnL1vUgIp3s0VY3GBCmqDWq26lmIacbGtzEQ9t0c0u2CTn99hrMSmHa+9N7Mf39VCzZP4RQh6oTdFR9m/19SGzB/pn0g9HoeYjLPgNmsu17Vk3nLCjVECsr7acR+CCyr58gPA5FwuVh/g5Nm7QqglhfTyMBxmovq9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jHvzWmURoyOxIYpc9ypodO6FCoyieiV28puJMkVhLw=;
 b=pXCvTHcb8Ti5SXRXtSf4I/t1c5hovX2jOcK7LQY1Uydo1H+zCtiPjUHCaeNAg031fKmccUDx4PYWUSk4SPrcKr/XtM/cJmKGp0G70hl5Juu23O9slNLutPV4CqPdM8hBMSn2pmtUBwjywXPT39OG/2URjMmBNY+Z4Icjd+RSGZ8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB5214.prod.exchangelabs.com (2603:10b6:805:b8::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27; Fri, 12 Feb 2021 14:31:35 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3825.034; Fri, 12 Feb 2021
 14:31:35 +0000
Date: Fri, 12 Feb 2021 09:31:12 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH  v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Message-ID: <YCaRMAPlhBLbDIDZ@strawberry.localdomain>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain>
 <87a6s9v7ia.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a6s9v7ia.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:208:160::30) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR13CA0017.namprd13.prod.outlook.com (2603:10b6:208:160::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend
 Transport; Fri, 12 Feb 2021 14:31:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b833a7c-e9e4-48cf-ff1d-08d8cf62e623
X-MS-TrafficTypeDiagnostic: SN6PR01MB5214:
X-Microsoft-Antispam-PRVS: <SN6PR01MB52146384BED9C0548FA876A78A8B9@SN6PR01MB5214.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwiZwQtHtHFJuCtDJlqvbI9XXnoXbHl7cmLshyQznzub8pJEwyro00ytB+Kto2rch1HfEmK5OdQ3HkLbwQvqJrDVBrjBm9LW1NisqnXc6/DuaUQ1oFuqN0E0DDlNQ/CQUI6O5/hfL+H24dttJ0pMl430kikTnd4HtJJ2ow4ouBVUDZMMM725XgB3CG6/rRNkmg4WGjFSq7VfLjGhJomvZryuXFyqzTkdY8oiX/AAgAAnrd3KVNIHwJOnh4dmA+WpRwuwCGgwAqj9Y8SwTZ/Qmf/VkouXCzi0MM2ZotKcO0+D0n41SM5e8ca4w5kn4B5xjacMB9BMX9Ll48MhRI4Y0j+XF564JMYORyTkcYmSgKCtF9UmcdGA1KY975s36/voibR9ez3wbo80IybS8Y5OhNmy0WpZ+L5wsT0DSQ/+j/lRIm3zj1LPCZ1uMoKcdbuzusBs/j/YNJ/FynD4b+DAMVciGhuXEduLmDju/2meua1aJ6OM9bRxvZRNWbmXnHTjPHW0a04IfdwSB6qk8UUR8kRXuywpXy8hNzJExJaMnfYGs1xhvS85JsnNYUUYRNKtBY4L5zWUmVKjcNWUkgaSVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(316002)(83380400001)(478600001)(9686003)(55016002)(54906003)(34580700001)(66556008)(5660300002)(66574015)(956004)(52116002)(4326008)(26005)(6506007)(66946007)(86362001)(7696005)(66476007)(8936002)(16526019)(6916009)(2906002)(8676002)(6666004)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?Jj++DW2uQEA38xymevj0s9VFh5LbN8v2yBe2sN87s01njXUoktJ3FGrNP6?=
 =?iso-8859-1?Q?NvCCsNX31bq+kP+vc1OTLRWxDnaZ0IiiG62IpnjZTA/pZVe3cdP4OSNodR?=
 =?iso-8859-1?Q?+en2fAkZN3PdtvlfHWbtL9limLms2rHgyIY/4ad+poHVYa0iC6mfgLC38e?=
 =?iso-8859-1?Q?3wMkJhwuI3HjbCjEOOPyaTHT7awGHoJYXvn1pspPgJeiqV3G4BtdhJgaqb?=
 =?iso-8859-1?Q?Tq5TuIABng1x+y9xh3+R+nhDqep9YuGkLmF3ICIZVRoNhgwhybzZiSRf6K?=
 =?iso-8859-1?Q?sr+iHskva6w710j3wWQL3wLffIyy1C8hvfJ7q64WxWxwF7t2Sxfuv+YIGo?=
 =?iso-8859-1?Q?zC5aDHpUiGnhPlp4tCb5W5GI35jR9ExRK8U0tij5WxXGjI6+/0r5aZ31LX?=
 =?iso-8859-1?Q?gZtBRKHdnlJlWbjc12Uxq2ljuhvK9DkrK78EkFnmGkaJk2evHCtm4b+RtE?=
 =?iso-8859-1?Q?rzvOAL/fDrqQt0fGUP6z2b9nIBzwBqvnh0xf48EsOpjWqIzsnNDZQBfTcr?=
 =?iso-8859-1?Q?8i+YEU5pBsda1uSs3ngbn12EemrAUsZtd0M8xy4FuV1VlTxeDWIey1po9R?=
 =?iso-8859-1?Q?egApgXez1kmC0z7qNKn+waI6IEZyNl3B4cf6/yRSlgP+T95gwCyE+ywgmQ?=
 =?iso-8859-1?Q?7rMwgX9FJrD3zBgRhl6rTKU4Ua00dV9sH9Vc6D+JoR+szKLg8KZl63yO3C?=
 =?iso-8859-1?Q?ZW/cPpWra333FRHqWfOaxIH9OIYgUdKqm3BlSzQe//bzxwaHQqcALjEUXM?=
 =?iso-8859-1?Q?ZaZ1o07UA3v82Ls5bWiaEbR5nQZgQmnPS4dAHLtU4AxUP7Neclcn7pDhRS?=
 =?iso-8859-1?Q?aXlUPUQ8ESeSrT24vdiKex8DK3CfH028jNzeJ1y6G/n0VL1JstnMIDOfx9?=
 =?iso-8859-1?Q?jVY7TsSq0HOlGWG9mBrPzUod+xzmEpQw/ZLRjlpiemcgcSDVhHbtQacT1N?=
 =?iso-8859-1?Q?Fb5Ym8aNbl5HXk0ikzWIGnptD4m60+r1JT2Js2JAX8HbQZPzOTChBYt7aN?=
 =?iso-8859-1?Q?K8Jzlilz9wzHtv6ZjGzX3AdRQM3yp49K35748kTm7aA6+dMB7XUcOfTHVB?=
 =?iso-8859-1?Q?2YDxaMh+mvu5cT/4CI/wG92hPnTooQy3gwhwaqbjS6hzQzkZ6i8F8ml8H/?=
 =?iso-8859-1?Q?s2+A0csjjWRfMNuGzYmIIRH6xDRDUcjmxbf27rZqIyX3vVkitl2ldnfe3k?=
 =?iso-8859-1?Q?rk1LCleeJBusLmWJF4zWx6kh/1AU4QmpqmgEb634ZM5JGpCwdkeGGpl5zG?=
 =?iso-8859-1?Q?ksTe6Am/a1/Y+I8v+EiMXxuhzL46sj1mWJkyCe6P2Fuug9Hva49xDxFNLm?=
 =?iso-8859-1?Q?iONHMGofyF5gRJEJ7vuP9BkS0S2wBs1tHw6ntw+7D/0u3Cy4GVO8vdDVr8?=
 =?iso-8859-1?Q?/LCudouVTg?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b833a7c-e9e4-48cf-ff1d-08d8cf62e623
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 14:31:35.4724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUTjyL/PKHn/nHTbHqQZg150v5xK9QfgvJmsTAXQLcdP7jni9J1EeLAz982edGVHhwXMVE1whsCvoyqn6DkYbIVkHJWqiG8lZmq+UQ/iObY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB5214
Received-SPF: pass client-ip=40.107.75.114;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Feb 12 11:22, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > On Feb 10 22:10, Alex Bennée wrote:
> >> When icount is enabled and we recompile an MMIO access we end up
> >> double counting the instruction execution. To avoid this we introduce
> >> the CF_NOINSTR cflag which disables instrumentation for the next TB.
> >> As this is part of the hashed compile flags we will only execute the
> >> generated TB while coming out of a cpu_io_recompile.
> >
> > Unfortunately this patch works a little too well!
> >
> > With this change, the memory access callbacks registered via
> > `qemu_plugin_register_vcpu_mem_cb()` are never called for the
> > re-translated instruction making the IO access, since we've disabled all
> > instrumentation.
> 
> Hmm well we correctly don't instrument stores (as we have already
> executed the plugin for them) - but of course the load instrumentation
> is after the fact so we are now missing them.

I do not believe I am seeing memory callbacks for stores, either. Are
you saying I definitely should be?

My original observation was that the callbacks for store instructions to
IO followed the same pattern as loads:

1) Initial instruction callback (presumably as part of larger block)
2) Second instruction callback (presumably as part of single-instruction block)
3) Memory callback (presumably as part of single-instruction block)

After applying v2 of your patchset I now see only 1), even for stores.

> > Is it possible to selectively disable only instruction callbacks using
> > this mechanism, while still allowing others that would not yet have been
> > called for the re-translated instruction?
> 
> Hmmm let me see if I can finesse the CF_NOINSTR logic to allow
> plugin_gen_insn_end() without the rest? It probably needs a better name
> for the flag as well. 

Funny, the first time reading through this patch I was unsure for a
second whether "CF_NOINSTR" stood for "NO INSTRuction callbacks" or "NO
INSTRumentation"!

-Aaron

