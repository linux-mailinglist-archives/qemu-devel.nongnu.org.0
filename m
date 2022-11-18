Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0111C62FFB5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 23:05:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow9TA-00084a-2X; Fri, 18 Nov 2022 17:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1ow9T8-00083g-BU
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 17:04:18 -0500
Received: from mail-dm6nam11on2115.outbound.protection.outlook.com
 ([40.107.223.115] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1ow9T6-0007W7-Iv
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 17:04:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwXGWZfJ60fRm6gDZnb12z7Tg09V4i4VQukptwSQsHmDFcPGeWVFHZcPdBHvKyB+3dmfRmMIy+04N8COYiCutcCIuHeS9gJtUKpasVq4/NpZ+hyfrGHXnXO0hgrdo0mDR39qzrhEZ8hHdT9mBVGcR58XKx3PMiCczsOoepX69w7CkIYP1UXAUeOhnoDleRsSRqhq5Wfr8QnZa52rl8z3rV79cgQWVJBz+4aE1ccRc1RLlh9ivAo7iWKsmB7+pH70Hz630NJeVFrT7XD/KsKwW9JQCf1GZS5G9IBZqqGG0LDTjEzlDNYlTX+SN9wACpKOXUwwXgVlr2MZjeaHWmqzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBtcRlPvKh8urO2pCi2baEeWFnThnehvTeRIn5L8S90=;
 b=BP7LLKVrMbhmH9a/6/vxDzQv6+75kf5th5sTfMxi8M4Ca/aQoivDUSKuCJfK0Ua2TA5OS0FrJTIMzNwnbF+33Fab7DrccVzP7Snogzf/clCXjXvDszf18DxNbEe+5hdorM9OhFIry/8nglfTvvpzOrhfMsbS21MFwzAjWH88hACeNsYjATJlOD2I3jU6oo1kD4XcYEQVr9N1D+nWD7DAkJIGIHNT/Z2Bj2uMhu4zREocG6evndYk1ly9l2rC/ZflFt1ono4SLkTkqRfSLb2jUywResrtPOkWdyxU/AdqOH7U+6StgOg+sLW6lspmIIv8g0kjMUqRDUqWi0oj/IhN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBtcRlPvKh8urO2pCi2baEeWFnThnehvTeRIn5L8S90=;
 b=NmuHmtRihxwJSLe2YUGwncokjGb5LXXgGwKaK7IQ2VXmBVg64Id3CjUaS+9QUvVhqKbldrI6r1GRqirP5BuDSqNCaVOLV7g8w4jxXR0E8wj8XXThyDwfeyrHT944qD/N6EytncSubUmIyYEWqCG14Fw176sIydu91A+uWu3poFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA0PR01MB6409.prod.exchangelabs.com (2603:10b6:806:e3::9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12; Fri, 18 Nov 2022 21:59:09 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::24c2:adf2:5b97:f9a8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::24c2:adf2:5b97:f9a8%9]) with mapi id 15.20.5813.017; Fri, 18 Nov 2022
 21:59:09 +0000
Date: Fri, 18 Nov 2022 16:58:56 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Plugin Memory Callback Debugging
Message-ID: <Y3gAIEythPY+z0q0@strawberry.localdomain>
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878rkbalba.fsf@linaro.org>
X-ClientProxiedBy: CH2PR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:610:5b::15) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SA0PR01MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb0b7a0-f88f-4078-ad0e-08dac9b01e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMGcXz/14K+pwPnsxwzETYaMjieups4F0mC8OUeeKnhs5g//lI7ewcR8Dpc5sfqH4TvZE/NikJ3cbLqtnWSmDRMHhw9OyE+6wv05qfzvN35KRlovoAnn/Pc+MpQEltDPfmliE4sHpu2YVvdJammChFKjQix2oRk38oz7E6WEAlGsea9fJ+7dCVSlaDMBS4MRIVxHNUm3oVVeU/4yNQ7gmqyMu4QVydXP7R5SfOE50d0EW6FV62tvbgKbw86AVQ3BSTU2fAbnobPFzoF4gsUS4MPpROEPpC/ORLcDdewCxDqDGnM5520YYkp+Zr5B/z6LoH2aHdGhQA6pNQOMJbfasRjlo1s8hhdzwAGVs1qfU1WcdKHhHrBdXlz/BxNuuOerslBgYwvGRg9/k4IF4ZV+FZ/lREZLN03v4UtlAqS8HtQtl4bKovPMzgQu/AfIwcemrkVHCGvJPrv4mukWWlL0R+2KvDyKrW/ATYE6cVDGPgwXcM+o9KT7nnvOZo8//K/zexspMiVXjGLK6q0Xq3DEBPIz+tEhvXtI6kqJ2euUn6ZnJ/jIP9JRUaWfOfxe5i/OfzESAdEqbM7AHgTpv2U34F/muhZXDqrtZnYdSRn1R3Z3vuV4/ccfMXQstEiXjBSnP8Mjyl/0S9MrjpReBS5Nu3igpn6Ok/OJgzURy8iIv8ONc10978rHFv2HYlD+8EWdvnYgtQzvbdtIdiBlnx7iFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(84040400005)(451199015)(9686003)(6506007)(6512007)(66574015)(26005)(186003)(38100700002)(3480700007)(5660300002)(2906002)(478600001)(6486002)(54906003)(6916009)(8936002)(66476007)(316002)(41300700001)(6666004)(966005)(8676002)(66556008)(66946007)(83380400001)(4326008)(66899015)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0/cu9mapEbO+IC6/S6oj2LYsvQGaAMNkLAuueSzUqsuaR5E8SRZR33bp0O?=
 =?iso-8859-1?Q?HDPG/6LG9Ej0ADtqnaTPorVDK1PavVuBqjrRlRFg5D+zgR1Ktbf7Gw5kFo?=
 =?iso-8859-1?Q?TMYDMoHwsqIogDO/6a8CdnfmTfXE1x2ln3YMG6ptuGR7zpuUHRt2NVpJbY?=
 =?iso-8859-1?Q?pHqezMIZRETE5wA6lpuY3mQIUSQPBcFU19edqU2rJbZHs8hmQ4Ch01U8Kk?=
 =?iso-8859-1?Q?31vfJzYhz+3+RKXUqgOUYgNWEgxBMhiHTN4XNPzXNfDZYOES/vytIeO7yZ?=
 =?iso-8859-1?Q?R5QQ4SmLourSaBLPbOJUqEvlqqOLpQrwR4L6iu077lWr5Qp7bGc7iyVxQ1?=
 =?iso-8859-1?Q?yG0Sqrphexy1hm9MEMB642tZQgs3uWLm9HPJng06fZ5rB00Ai5RKVRbV+b?=
 =?iso-8859-1?Q?RzVCVhRrYfG1/q+EId4HJ/zeW9vWCXhttpkrdvojGZggEN1BZzdUs4+5z4?=
 =?iso-8859-1?Q?jFRdgKThycGNbEMH7w0ElVCGVExfS/RJtiLAjN+adDj9Lf4KCDLon+JWXc?=
 =?iso-8859-1?Q?y4EpiC5tvYv+uM37o9mz0b6a2UFI8IaUvoOUBbc+0W439U5ptmukaeTtaR?=
 =?iso-8859-1?Q?j//i2ZOnc4piDiXLX4xmDgkCw7BMRMJfXxigf3qnRbtA2XVXcHinIGE/MF?=
 =?iso-8859-1?Q?w23+Uhw49DHMcy6v/O8CIn/Z4atU9fz4oBD4CXi8GxK5RhmV1uewH6rY4l?=
 =?iso-8859-1?Q?Sk6FIn2wlSfu563/HnJUYifIXsREEzIiPwqn84rUVhbI5CxL8J7dDXYfR9?=
 =?iso-8859-1?Q?s115GL2wNi0un1M1zfOitHzAx5fQJs0L5QdOvNdO46mtHCeh8Gz8b/3+YM?=
 =?iso-8859-1?Q?BiihavdjmbH7JjzoyTj/g10bip1rQJ1qPJSCNW/qBNn5X05sOlHvvH9YRi?=
 =?iso-8859-1?Q?zdgAtt11EBhxoTO9XZAdFW4Xcc84xarbw3tTwC+elaBk/HeKgeJ6hoyldZ?=
 =?iso-8859-1?Q?VjhtBDl1I8ZKpkV+TFxY+oJGIXNMJV6EoHy+rVQHS4aA4ZNFWRlY6b0Qyt?=
 =?iso-8859-1?Q?Af0W1HBOK5dIcZCnRTDQVBP/ArcrDA6/Iyy8U4qNCakRvgtoHkb50YJPwj?=
 =?iso-8859-1?Q?0RHb4cOhIZkUDi3OBdfrvdz2ut+n38AzWhwy2/ipQtROse/VY7zVAw2KVg?=
 =?iso-8859-1?Q?k7xW1CxjHOa5fed+5ZE0PRNBQpU3nTR4kL8cnLzUmH/t1Wfqa4zGLt9oX7?=
 =?iso-8859-1?Q?fyt9eRsS7rxYW/YRMTrT1zZ84zRTN45wb+ovvbtoAYG7KAv6/S1GVmhp8E?=
 =?iso-8859-1?Q?a6rOd1nGXlIaLzhmLS+4g0K5KUIPYFGS9OvNqccPM7kTjBHFx79eLNhcql?=
 =?iso-8859-1?Q?ONLYyc/PvO+ksM4C07C2gSknr9eozIrxTci3MBBIwzjjD8D5ERelo+e7di?=
 =?iso-8859-1?Q?0zOuu7GwMxSHvDvt+c3TVhljT/ZwDrvyiQE1CC4DWCOgH8c48m6zI73xQL?=
 =?iso-8859-1?Q?w8WN7N7ZUqido/KA6D7NOcNSO7GZ980/Fl9mDp8kj1dHuEvXV3RIWciClY?=
 =?iso-8859-1?Q?AKzhEmTseERA3wV1zA+aLZCCx+MCeoWdCJ8KOsaUVbufHVMu4a8LtPJuY4?=
 =?iso-8859-1?Q?QnWQDv/nPZl7jtpIeDtCe3d3X7pFX2I6wn1MK1h0aC0eY3gNjNYSQ1B6iD?=
 =?iso-8859-1?Q?HmwTs5Zf4JaQxWW4wuf2xL72YN+zsI9dkYAVPBUziMAtnmBDrAM6HBVQps?=
 =?iso-8859-1?Q?un/rOYHE4gk8wNT7DIs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb0b7a0-f88f-4078-ad0e-08dac9b01e95
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 21:59:09.3399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKIEqXSAsusQ+xxifpG0ojdlzCmiy0a/h+S7qyDU+JvZS9/+UXKTpZWeU1mqUFGTg8JDQpKuNk7kyvr50Rc1Ww+1AF6KdA9yCd4SZOdLSIU98E9II/W76/JKGJ/DDi97
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6409
Received-SPF: pass client-ip=40.107.223.115;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Nov 15 22:36, Alex Bennée wrote:
> 
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
> > Hello,
> >
> > I have been wrestling with what might be a bug in the plugin memory
> > callbacks. The immediate error is that I hit the
> > `g_assert_not_reached()` in the 'default:' case in
> > qemu_plugin_vcpu_mem_cb, indicating the callback type was invalid. When
> > breaking on this assertion in gdb, the contents of cpu->plugin_mem_cbs
> > are obviously bogus (`len` was absurdly high, for example).  After doing
> > some further digging/instrumenting, I eventually found that
> > `free_dyn_cb_arr(void *p, ...)` is being called shortly before the
> > assertion is hit with `p` pointing to the same address as
> > `cpu->plugin_mem_cbs` will later hold at assertion-time. We are freeing
> > the memory still pointed to by `cpu->plugin_mem_cbs`.
> >
> > I believe the code *should* always reset `cpu->plugin_mem_cbs` to NULL at the
> > end of an instruction/TB's execution, so its not exactly clear to me how this
> > is occurring. However, I suspect it may be relevant that we are calling
> > `free_dyn_cb_arr()` because my plugin called `qemu_plugin_reset()`.
> 
> Hmm I'm going to have to remind myself about how this bit works.
> 
> >
> > I have additionally found that the below addition allows me to run successfully
> > without hitting the assert:
> >
> > diff --git a/plugins/core.c b/plugins/core.c
> > --- a/plugins/core.c
> > +++ b/plugins/core.c
> > @@ -427,9 +427,14 @@ static bool free_dyn_cb_arr(void *p, uint32_t h, void *userp)
> >
> >  void qemu_plugin_flush_cb(void)
> >  {
> > +    CPUState *cpu;
> >      qht_iter_remove(&plugin.dyn_cb_arr_ht, free_dyn_cb_arr, NULL);
> >      qht_reset(&plugin.dyn_cb_arr_ht);
> >
> > +    CPU_FOREACH(cpu) {
> > +        cpu->plugin_mem_cbs = NULL;
> > +    }
> > +
> 
> This is essentially qemu_plugin_disable_mem_helpers() but for all CPUs.
> I think we should be able to treat the CPUs separately.

I agree it's similar to qemu_plugin_disable_mem_helpers(), but for all
CPUs. Though a perhaps important distinction is that its occurring
unconditionally in conjunction with the event which flushes the TBs and
frees the callback arrays.

Isn't the code calling into qemu_plugin_flush_cb() already clearing TBs
for all CPUs? Can you help me understand why treating the CPUs
separately would be better?

> >      plugin_cb__simple(QEMU_PLUGIN_EV_FLUSH);
> >  }
> >
> > Unfortunately, the workload/setup I have encountered this bug with are
> > difficult to reproduce in a way suitable for sharing upstream (admittedly
> > potentially because I do not fully understand the conditions necessary to
> > trigger it). It is also deep into a run
> 
> How many full TB flushes have there been? You only see
> qemu_plugin_flush_cb when we flush whole translation buffer (which is
> something we do more often when plugins exit).

There have been maybe hundreds of TB flushes at this point (I, erm, use
qemu_plugin_reset() somewhat liberally in this plugin). I believe it is
the most recent such flush that is problematic - I observe the call to
free_dyn_cb_arr() mentioned above as a result of it.

> Does lowering tb-size make it easier to hit the failure mode?

Hrm, interesting, I have not tried that. I'll poke at that if the rr
debug doesn't pan out.

> > , and I haven't found a good way
> > to break in gdb immediately prior to it happening in order to inspect
> > it, without perturbing it enough such that it doesn't happen...
> 
> This is exactly the sort of thing rr is great for. Can you trigger it in
> that?
> 
>   https://rr-project.org/

I had not used rr before, thanks for the push to do so!

I have, so far, discovered the following timeline:
1. My plugin receives a instruction execution callback for a load
   instruction. At this time, cpu->plugin_mem_cbs points to the same
   memory which will later be freed
2. During the handling of this callback, my plugin calls qemu_plugin_reset()
3. Ostensibly something goes wrong here with the cleanup of
   cpu->plugin_mem_cbs??? 
4. Step 2 triggers the TBs to be flushed, which frees the memory pointed
   to by cpu->plugin_mem_cbs 

Since I have this nicely recorded now with rr, it ought to be easier to
poke at, though I admit I'm not entirely sure how to poke at the
generated code to see what's going wrong (i.e. why wouldn't the tb exit
stuff be clearing this pointer like normal?).

> > I welcome any feedback or insights on how to further nail down the
> > failure case and/or help in working towards an appropriate solution.

-Aaron

