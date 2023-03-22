Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CCD6C57B8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 21:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf59N-00019Y-26; Wed, 22 Mar 2023 16:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf59L-00019H-2K; Wed, 22 Mar 2023 16:33:35 -0400
Received: from mail-dm3nam02on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::70e]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf59J-0007ZH-0P; Wed, 22 Mar 2023 16:33:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODatvEXEHmhzJS4++tH/E8gz9FfPWWpRCy6u0CTEPVEz8HO/Klt1oCA9pKLGD3ujWhadMTJnKAgBFiHcAh378OX9IT6649dhGGr1EY7ScBw85l9mrT1/DEnvczZvS3mtlrPn2fWj+wrPyGmoyrSSWnFla0SJD+BbDX1bxzT1Jxm3o9R1rPSXR9AHhno9n5vrEQFz8ROAGZWGXP3gTAmml9Zwcsd8eaF5qOhIzZwg4zHCU3xWNU2sJhCNwJI7hwqvV9jtpGr8cv+VhcFSt9O6YFW3Zh/klZnz2PMKojIn84ZH/xlX/tgABoxTwNlfv3l2cLBYkboibARZYfM0B3tfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWVX/X2Pnv3Mby6dKBNDDSP7kWiPb9m+tpxmGj4z7lo=;
 b=ciuuthTjCva4R33VGBe5/iTL3/d7OXE6u+4LB4HVs7tAl0yi5mh0VgBSBUIgCKjK6UdhVwbQz5mp0QcM0LSdaQZgO5/1/NkSKUFJqVJAo4owrzCV9PFOoAIivRCu0Jizv4utZwa87mVpv5yOEql2EzOWByup195gjyQJcZNtV1Zh+lGCZ72mObyRUzIYmXGc6CpmzSdMzMWAaLIYE9oUZHOjipZOUa4ISqLTr8pgE8cwgxUAw9C4AUOOl9FfslNG1rh/xrijKTZho4EUg1w7z4wHz9OjkJ7cScMyEj1Zn01Qo8O/OsbfsV55HHAHycwv0PYIgoWnaKOydF5+wOtDdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWVX/X2Pnv3Mby6dKBNDDSP7kWiPb9m+tpxmGj4z7lo=;
 b=thV80z0NQtlTtpHpQwAM6O7AKqSklsXj8j+j87Io1/F38/b5+XqTPULSb6aB8WIz7Bxk43B7H58s5yAe0VyfMhtYc9qKQiqkypOnt+ERGBJ7gvDC65teKAjOxBfTSgi4kfvIBQA3O8aCPqF3xlPcwjGlMWzNtsbSNCxzDwc8Mhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 MN2PR01MB5469.prod.exchangelabs.com (2603:10b6:208:114::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 20:33:24 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:33:24 +0000
Date: Wed, 22 Mar 2023 16:33:04 -0400
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Vincent Dehors <vincent.dehors@smile.fr>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 6/7] target/arm: Implement v8.3 FPAC and FPACCOMBINE
Message-ID: <ZBtmAEYfI8T8Y/zT@strawberry.localdomain>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-7-aaron@os.amperecomputing.com>
 <989f380e-9d70-a377-9f56-6d42935459c2@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <989f380e-9d70-a377-9f56-6d42935459c2@linaro.org>
X-ClientProxiedBy: CH2PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:610:50::36) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|MN2PR01MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecfb6c4-2a3f-47e7-4d5d-08db2b14af3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7YCC0HA4JpVxuQl5DfybF/P/X53x4um1WO8CJmXPcnhT+xdcewm1kNui77zpzWkMEh2nDEZ/SLy1BhYS59LbGBTGFUNiBLRcgvorwL5WvDZsdDJi/7W7/FLWUS7yko63dJqnwPy6OWV0qdX+79cq5336I+UNEuJaSQYT4xCwNiqAn3/q0fbfeKsLWrNp8lqkTi+1F21Q56rIHoibrtwxWYs/86vXx5Dp5ED/yVRJuO3w7RjX27y67Y9y9lVWxPIERT2iZyFEoLidKs9yZ4q4FQEtDNc3d4emgjf80YKA+KVvq64I0vaxu6RAcgIda2/vtaw1B0j4DIDsQyJBAyI0Rah0kMJ42QaaQQInHGAZRbyBcIwTyUJohw+VEexK792MKR7KPUviVB2wpN/oTtktcZq9Y7qJoWhMI3xkbd5dekGPTAxn0NGzYUE0B7MJa3kWflRwPE/tKyOe0RgOn9MXCEQI6/sL8TAqwq6/ZR7snD+TdmawyNlYNMXo1+izuhaA9EWV7IXWCiiaCh7yYL8LdNegam+S5+vlqojelqlwUGba3QCOPpCMc+PRH+kHjCH2n/wRY3lJiEg24OfPPjO13hDDDnBNpvT1s1uxa0lQgP+hPiwNTyIHGbNbcRd2XDo3OSCbYmzyYUnkmkrV+o/+uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(451199018)(8936002)(41300700001)(5660300002)(4744005)(86362001)(38100700002)(2906002)(9686003)(186003)(478600001)(6512007)(6666004)(26005)(6506007)(53546011)(66946007)(316002)(66476007)(6916009)(66556008)(6486002)(8676002)(54906003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AXWua17sSqltFwSMdKNxta3MARSZ3o+u4pLOUg7XNTYGDBi2TI1VFnvsEhn0?=
 =?us-ascii?Q?pKlSl4F5VLDQz3gZrq9sAVCS2k4AKP+zlblzt92TxWOosa3dVFGi9L20Z7zB?=
 =?us-ascii?Q?ak/OE6/NUdLCkCz6O8jok9GWvWMsGYaVnNNHRbBxADjWYupzloi8a8wpDMj7?=
 =?us-ascii?Q?0EMnDuby3Ijd2eJz+fo6axm2eJDUsJexb+NjCN6xYaQSCtxhqHVYToX31nql?=
 =?us-ascii?Q?8lLKKeOZHF96HI7T60CzTVXlyVlFwsQOcRo1sf4xbeh1rXzJgT0DeAiK8Dpy?=
 =?us-ascii?Q?rvN549ULV7XEudpTnDSS47rVSEalPFuXHp3yzIxefIvqv8kiBcuP4zSAfTNz?=
 =?us-ascii?Q?/QXTzAFYrhxiSzsiDp3n99VlXRdmqEUmO7pAesgafXn2khVcQK8gjlu93YYF?=
 =?us-ascii?Q?ueLPnwxFvYH4NlnXaLpOVS+5FJ6wq2WCDEqS+QCa2yY0Cn2mHwsedYgF/aOL?=
 =?us-ascii?Q?DcixGRwYaTw4GrgtRgHBOIb7NqZbcz28RJqku4w+96Bk/uJ6L0o68CqhV/0p?=
 =?us-ascii?Q?GMyDzSje1KNJa0cP7F2h10xwuKfli+7yF85EaLq08GLJvnj1uIwXY2nBEX5r?=
 =?us-ascii?Q?wT+RA+yxKG04qCQZaovDiLyd8JG+XUBBep/NpmadT3jbRy1OXqQUKLoJlp66?=
 =?us-ascii?Q?i3XFLYhcrX/MFr8hhbPPMmCKrAyo2+8vNzJA9GvSZpnm/EqAgZp5Oa1iZX9k?=
 =?us-ascii?Q?qk0YxjVuHXbnO+89SOxJHhNRu2Qr9+ZqtWFYpAyQg1KCWoMhIsAV1m5IWSNz?=
 =?us-ascii?Q?vGlDuhDz6HqjWZhEO9QRlUv0wJIthPCxuHSJEk11xBuuW5+8nPqZXHguIJCQ?=
 =?us-ascii?Q?6g8iJrvWy80fgLuRIs9CZI8TMSllUmOLrxYRf6PqD1duMPCbWluTrNSCTIG3?=
 =?us-ascii?Q?tQZsz3uUublD6ifMcENuLxzmVJzwPtDVJTjZDnRO1c8UldnbxnQBIthDusqD?=
 =?us-ascii?Q?SowLRFsjLkBuBCZDf47Sx2dmE1MXed/yFwM9sinp+jkaiUeSOt8Ql2cxPmey?=
 =?us-ascii?Q?W3XhGejBoRK02DgTOcPcaPYrSy/IT8K42bXtUKJwHRwI3zFhtrlQgDEf6v3Z?=
 =?us-ascii?Q?W8NXlgmnbpsrofk1h1K35dJU5s/Q4aKxAUenbtD2K6zp3dUYBYG3IuM8spiw?=
 =?us-ascii?Q?wkyiqzZdHhajAAefLjfrXP19lRJhDZGfb1TFyQbPUJvMPyfJsfp7AEu/AENI?=
 =?us-ascii?Q?LTZmo5raKK6f1TiZrr+2i0u+Tv9r05LbafGhbk7ZSVMXYjYK/0Y0zYl3Q9ED?=
 =?us-ascii?Q?MG3AQqcRwze6RENye92Omnl9lyJQUNO5pvpfDlZ/XhJKRyQSrvhf/YK+CToR?=
 =?us-ascii?Q?64gj7Wj72jpHxBsxO0zLKt2nkmjULSRqKiyruJzXEY7qxHdvnJ4nMcaCvMo3?=
 =?us-ascii?Q?8KlZX180nh8+ygr6Z1fRvTbmxDE0dCl11SRdzPwy4iYN42JcOjjVX4fAOVS5?=
 =?us-ascii?Q?9xfR58vl/Bp9LzDIxJ6kB5pAYpBqWY19Ab2KINJ0e4Y7Q0+Oc6YYyjOv7ApE?=
 =?us-ascii?Q?n5cVfJIVy7hyvskmQRQuJsq0zmYnQGObJRhR5lRC2wv2f4LOXZ8jWK9HvOxZ?=
 =?us-ascii?Q?SMPzLjrAe9gzmPCVTRhQAhExXc0SuUibl10AAXiAmIP0JotrntUbUG36Y17D?=
 =?us-ascii?Q?u615/wJU7SLr4iUO2P8TjeQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecfb6c4-2a3f-47e7-4d5d-08db2b14af3a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:33:24.4187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6tcueOnrgvMIamlvFXEXh0qsamukC1S/IuVFW9FkdW3He5hXT3MGWQkd3TJ9jNCuLo0RBR+D3IZwj/KbvdAKj1oX73IW7sk7PyVXQXnCi54t2OkjRMF2cYozWVpFzid
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5469
Received-SPF: pass client-ip=2a01:111:f400:7e83::70e;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Feb 22 11:37, Richard Henderson wrote:
> On 2/22/23 09:35, Aaron Lindsay wrote:
> > @@ -406,6 +421,16 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
> >           uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
> >               ~MAKE_64BIT_MASK(55, 1);
> >           result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);
> > +        if (cpu_isar_feature(aa64_fpac_combine, env_archcpu(env)) ||
> > +                (cpu_isar_feature(aa64_fpac, env_archcpu(env)) &&
> > +                 !is_combined)) {
> 
> Indentation is off.

I pulled `env_archcpu(env)` out of this if-statement in my latest
patchset in addition to the indentation, but am not confident I have
done what you intended. The QEMU Coding Style guide doesn't seem to
address longer statements like this in its section on indentation, so I
attempted to follow other examples in the code, but I'll take further
direction here.

-Aaron

