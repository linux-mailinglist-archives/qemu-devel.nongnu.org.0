Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B38D31A34A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:07:17 +0100 (CET)
Received: from localhost ([::1]:48576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAbuV-0006Ea-RC
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAbsG-0005V4-Me
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:04:56 -0500
Received: from mail-bn7nam10on2136.outbound.protection.outlook.com
 ([40.107.92.136]:17248 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAbsE-000611-US
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:04:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2tO+AD4j69G/7Jio/49T6/OgHd6HHMLnTqWZGiOyizion7nSVqaxwKHLjeFgvEVnX/57grQeRZBZBNCxYJpF2koP5IkyTgjEl5AetKzEBQyhEi9JWNQmPYZ+sGH0/GjMpOxMun7L33MvJOqjPDQTI4rFRm17k/HD8cq348mEfHffbUG8IIDWwTQHgeUq4h8HBmJMyc3ZNWjNKUn4jVZqmKUDKmYOTTagWPvaRhL8dm9R8T3bkGmHI7/KCeP/Z6C1F/wIOc7BVtrdfMsyWAFmZNrBlSi0N3ZdeWEQxm1HCfjNEY96Ccl8FA5CvaDqnK9qjzQ3g7aEgbcFuNzHQP0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZwT47d6QBiJSn/cH8WNKy9doHboTje8ya7M0z0eZvY=;
 b=FEEvqSGofVk22XzqPFGmYwrn9E9+w4nkBWkonHmZnuVZMKzNHpQd3lLr/BgrE6gqlMVF60/16qWcOQP1uNLcjvLWRMJXwWKsolC88GkwvIThQAMbS6xdV6WrTuzMh3BXQdGg9EL4cHOpGnmiaXU1qalzg65W4kxhi55GCQYjOmj2vIdIRH3cB466sGHPBj22BTMGobxm1WCqKPEuO6Ku8pyVdKHShSP58HtnaiGKzHLaNdyEXhiQoiuEDtgZ0FybWPVBz7MiGnMTRZhQb7wF81QoRY8wy9U69yhA1LgQUrNsJAUxLjl0gRN7Yizn5DtH2KZglk8OTOCEpHqNMueSDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZwT47d6QBiJSn/cH8WNKy9doHboTje8ya7M0z0eZvY=;
 b=qxhVG9LiGsw2tpbO3j4vi1sm8ZmT37vsazpfephFWfPX+nsOH7IuX1AyDNRyeapTLCgjaiVrA8px9EAt9uyHjOtto5h+MFcM2dHAaItRoHH/XsKpqRTJwoyNvIdGXwqV9WG+jdVr5Qg0LNWNMvwgTDNgjBAzXpkWuIXxGat+Nsg=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4895.prod.exchangelabs.com (2603:10b6:805:c7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.29; Fri, 12 Feb 2021 17:04:50 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3825.034; Fri, 12 Feb 2021
 17:04:50 +0000
Date: Fri, 12 Feb 2021 12:04:27 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH  v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Message-ID: <YCa1G2Ecbi/piT02@strawberry.localdomain>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain>
 <877dndz6p7.fsf@linaro.org> <87y2ftxojg.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y2ftxojg.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL0PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:208:2d::39) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:208:2d::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Fri, 12 Feb 2021 17:04:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95a7180a-bd38-4097-1139-08d8cf784e78
X-MS-TrafficTypeDiagnostic: SN6PR01MB4895:
X-Microsoft-Antispam-PRVS: <SN6PR01MB4895801D35488EB5630808798A8B9@SN6PR01MB4895.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: roLxFMvFnehOYUdKdTtRps6A+flB1mEieTifqTvtZRsafXZQUutGn847sjjALdKPQsSfhM+0fD++qYSjsAq7dU84GP9ix4yD6Pd05g67gVnBHRNzyliRFc+0AnJXo4kGLAMwaNFkRVrHdYx1vT6vo/ALh/iQi3nKQx/OvuZXNvkI5j4fk9FkVT8NPskyUMeEg9VMNpNjUFUrjYhPGlBLG8Mjy41KLX+IqUH5DNZZi6f8eQ4zb4T5FcilhDuu1Km9XsnNCYJpAruo8T6cz//b7nXo7U7oXOIoEE7SvwTatohDl3P40mfiBL8P5DwJ0hA0hHuayU8GPPkpaVGIrKzkZambdu5Jgkm+ZdHk4Hg1hkaI7ngbQeeWdr/P1gGP9OWpIIAs/cDxC2xmwJUoA0q6WKRvg/MlK0qGICNU3RBECKRZRb2u43gsvhMKAzrorbExbBYlVNIGBZSD7gNyR8czhoCZ7TQ1iDhuVsPQ0gu1EBH9WDivitFAMltk8oKrMbEYVG+omSHCTNiZ2wSP7gZwN05yY/pYtsPvejDsy3gHpZGxnnbW9tJLQzGxgJw6MJgkfkhCkPWXWG1DBxukOIV1Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(366004)(34580700001)(52116002)(8676002)(4326008)(956004)(86362001)(83380400001)(478600001)(54906003)(66574015)(6506007)(66556008)(316002)(6666004)(186003)(16526019)(8936002)(66946007)(9686003)(66476007)(7696005)(6916009)(26005)(55016002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?82wNet0Ue+Mvu/hzpaPpl06njBJQPsdv1MCkHowHUZlBLfScKIsW1LfMXs?=
 =?iso-8859-1?Q?G/NsN78vWjlVC1ell36yK1yXekH39YB+/CgkpA48DwX1FyL2kcmvOUnxEG?=
 =?iso-8859-1?Q?LldI7FeAneVAzXBopAY2NxsKTmyc5XDUOkEJk0VTodzyxA838u5yyPiNO0?=
 =?iso-8859-1?Q?2jPprYohLETZ8MaHRnesWSt4ZE6VYKTf1JXR4DJykx7xq9yx3SJLxH/dfO?=
 =?iso-8859-1?Q?NdU4gH32zDYUb6xhFDRtznNzz4o4dOj+QzPCUJO2ChKQqfkRpQkbPzHABC?=
 =?iso-8859-1?Q?WaAEyG1SkSdeZB/6VE6AMH7nH2LcBMBuMg+1REQHDN24FU6s/olJ12mFo/?=
 =?iso-8859-1?Q?YnUyJubQlD0bUQXFdnzMBf7VGjQMB7ZL6PDQ0gyN3Mzgx44rzU/0lHV2Fm?=
 =?iso-8859-1?Q?ofAd2fFBIG8QYWp6JvBG5TOkEbFiRaOL9fFCIRqjN2iBomPkq2f9b5Dkv9?=
 =?iso-8859-1?Q?YM6i3a7U8xfXK6FUz6guZ0vZKYddz1pvYhzp8MrTmWAiALDInmLvkKM4UH?=
 =?iso-8859-1?Q?mvxyumT8vkr9jiUfysig5tgPKFl9KHyVwpL3DQgsMZDIGfR3KEk9J32Vng?=
 =?iso-8859-1?Q?rHErHJnvpTrpW80TibGQKyflhzL3m7bIaWIzzT0QVvkYiLa4IbVxs3KuVL?=
 =?iso-8859-1?Q?o8nvOAc78exOX31O4zTa1e+p+uY8WvWQJn6nTMDvsZh2Pm+ZjzEsFAmV0j?=
 =?iso-8859-1?Q?JF9VSfH8sCNpWV7FcUGhB1vlx+0bM3KPmfrhJa9qSp5BX8gtCTgvyjkUK1?=
 =?iso-8859-1?Q?ayrlTBODLkfYnZOrhduCF88MgnDjp7OzesWwJnaFPEpeLBNaeO/2gdK5gX?=
 =?iso-8859-1?Q?PBQMLHUjCJu5gv1Wxc+T3cRJ5atkIaF46cqbEKGNSgl09ZST6+ogzdEm/1?=
 =?iso-8859-1?Q?s5oJ6yK5ShlizOG/qeNXqSXQpGmPU2PTpN9jiscYfrsAXZaVd0D1EjHjB4?=
 =?iso-8859-1?Q?0IS4Efn/ywU/sdEmztQIpwmwSgeCb4sUKtMDcA66RBgoWNyfMnKS2yAsxc?=
 =?iso-8859-1?Q?35S4xOoVnvem3FiOPdJ0F0KkxW5GPetJgQGsAd6p2EAkD17fuwZ8e46RYW?=
 =?iso-8859-1?Q?4nQuKs+k9EbMlK2zLF5MaPX1BRRt6evXgLA4gZbKzFigMEceIeaQm5whp7?=
 =?iso-8859-1?Q?t7PukbzNsRXKrOpsZqYMqak+9EKoScol0sWUB+i16V2fwqmiI4g4T6UGuH?=
 =?iso-8859-1?Q?J0xBfaGWws5NejuNaMi9fjgZf4pVOyJC7HcvgqysS6Fn+C1/c08/XpeKw+?=
 =?iso-8859-1?Q?hAEEGQ4/QaHBThiJYqvHR90hJylTcygCS5ltfzyNXPIeMXw8+gAb+g48nK?=
 =?iso-8859-1?Q?gA9VsPnhfhE+9gSzqBd4Jvdp9+uiG7F2ybDfGmLyNDN066vt/LyOcp1LmR?=
 =?iso-8859-1?Q?UrC9NmzWee?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a7180a-bd38-4097-1139-08d8cf784e78
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 17:04:50.5454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSgus4Pi4RwWI718MpCm2gYRpQgD6TExCECH8blFA+mayg1QQkr3aLuoKHFZ8/X2eJOJr7Js7DoeNJzT77DdQbtweluJdHg30dySgSX4hds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4895
Received-SPF: pass client-ip=40.107.92.136;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

On Feb 12 16:00, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> >
> >> On Feb 10 22:10, Alex Bennée wrote:
> >>> When icount is enabled and we recompile an MMIO access we end up
> >>> double counting the instruction execution. To avoid this we introduce
> >>> the CF_NOINSTR cflag which disables instrumentation for the next TB.
> >>> As this is part of the hashed compile flags we will only execute the
> >>> generated TB while coming out of a cpu_io_recompile.
> >>
> >> Unfortunately this patch works a little too well!
> >>
> >> With this change, the memory access callbacks registered via
> >> `qemu_plugin_register_vcpu_mem_cb()` are never called for the
> >> re-translated instruction making the IO access, since we've disabled all
> >> instrumentation.
> >>
> >> Is it possible to selectively disable only instruction callbacks using
> >> this mechanism, while still allowing others that would not yet have been
> >> called for the re-translated instruction?
> >
> > Can you try the following fugly patch on top of this series:
> >
> <snip>
> > @@ -120,8 +128,13 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
> >                                        enum qemu_plugin_mem_rw rw,
> >                                        void *udata)
> >  {
> > -    plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> > -                                cb, flags, rw, udata);
> > +    if (insn->store_only && (rw & QEMU_PLUGIN_MEM_W)) {
> > +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> > +                                    cb, flags, QEMU_PLUGIN_MEM_W, udata);
> > +    } else {
> > +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> > +                                    cb, flags, rw, udata);
> > +    }
> >  }
> <snip>
> 
> Actually I'm wondering if I've got my sense the wrong way around. Should
> it be loads only:
> 
>   void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
>                                         qemu_plugin_vcpu_mem_cb_t cb,
>                                         enum qemu_plugin_cb_flags flags,
>                                         enum qemu_plugin_mem_rw rw,
>                                         void *udata)
>   {
>       if (insn->store_only && (rw & QEMU_PLUGIN_MEM_R)) {
>           plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
>                                       cb, flags, QEMU_PLUGIN_MEM_R, udata);
>       } else {
>           plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
>                                       cb, flags, rw, udata);
>       }
>   }
> 
> obviously I'd have to rename the variables :-/

This gets me only loads and no stores. I've modified it to be just:

void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
                                      qemu_plugin_vcpu_mem_cb_t cb,
                                      enum qemu_plugin_cb_flags flags,
                                      enum qemu_plugin_mem_rw rw,
                                      void *udata)
{
    plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
                                cb, flags, rw, udata);
}

And that appears to get me one memory callback both for loads and stores.

-Aaron

