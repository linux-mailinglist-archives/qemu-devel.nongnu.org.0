Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B092F4ADF25
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:18:08 +0100 (CET)
Received: from localhost ([::1]:40088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHU7y-000478-Pb
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:18:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHRoc-0002Y4-B8
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:49:58 -0500
Received: from [2a00:1450:4864:20::429] (port=41516
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHRoZ-0002h1-DO
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:49:57 -0500
Received: by mail-wr1-x429.google.com with SMTP id k1so14670030wrd.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 06:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IToB7FF72FpFbtp48bb+feiKvDjynR+XlSAWSR+dvS8=;
 b=Z85YkcmtFn7er2h7P1pA8Cg5hCBVr4L8WZT3xOpqGc6mCUHOHVwbtT0pqPmlvUkiNl
 iqBFSzYn7+qxChPxns2EtgHiIWcE/E9GsRIpns/D6cV3ba4bJSKags3UWudNeq4TNr2+
 exgO7/cIdH1fvX9jVKUPZoTDBc4p08PTzEiF5tHTpOtjeF6BF4/RAD9xScU+pAG/oOC8
 GIwKkEG2D4YLozjAwlezYYlOeg70SWEKz35zbv2WTZJUi7he/BWrlpJVCrz7wsghVyhH
 droNeSVQKuqIVuCnXXvF1FWvnQkXvx4uISTJnRKKbgUNiJAzCbgOGHVJTlwPLCGJgB2/
 0o1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IToB7FF72FpFbtp48bb+feiKvDjynR+XlSAWSR+dvS8=;
 b=z2EvBvpyOzyChH2zntMSgibltgOJYfyHeGLwIbOyUBPpjmSLdElCeiIyent4pwsK3T
 hPXYoUNlbyOPFjX5j7zCFB6A9fEOBUmtLJVuSnm3flckYaklmNwgyMXtOBy/VsP7riWW
 BdOBMIgYg/Ez9f0ua6G/CSo1bY/qylY1qIJhoF9vZF+kTXH9FOkxAdvwt+lhGwiZzhy2
 73pYgtvUwPcol8OGFJSjufd0RMXpf5TVQ4y4a9NknpDMxlpokIx2+9c4xdziK5MCoDoJ
 R6Wr7fm0KoUW0wPckL43FsGpLPMMuZUihQhutiAPilm12w6NdsIKv6Q5FH8B8AVKH2TY
 Tsxw==
X-Gm-Message-State: AOAM532QaLnHFJVeg7ftZGwc3y7i7ZK3GBSZsB25nX+oY2v8PJPRH6CA
 csKZOd3R/D9pLVSCj6WHP4bl+Uni3e/7VFVzR7gCYg==
X-Google-Smtp-Source: ABdhPJyrwfjW7qg7YNvPDvzT4+ZDJ0uHJVTsdjFz89M0LUHxZgIM7B1+E48t6gXg1Esd7kiSLeEyPIjsGNGmB5vkwPo=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr3898766wry.319.1644331792565; 
 Tue, 08 Feb 2022 06:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20220126052410.36380-1-gshan@redhat.com>
 <20220126101447.5d4f01f9@redhat.com>
In-Reply-To: <20220126101447.5d4f01f9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 14:49:41 +0000
Message-ID: <CAFEAcA8FhFOka1d7Bpk5qckDGBmqsoYTZVJ0SBR_GRyCFb=fBg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: drjones@redhat.com, Gavin Shan <gshan@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Jan 2022 at 09:14, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Wed, 26 Jan 2022 13:24:10 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 141350bf21..b4a95522d3 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> >
> >  static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
> >  {
> > -    return idx % ms->numa_state->num_nodes;
> > +    return idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>
> I'd like for ARM folks to confirm whether above is correct
> (i.e. socket is NUMA node boundary and also if above topo vars
> could have odd values. Don't look at horribly complicated x86
> as example, but it showed that vendors could stash pretty much
> anything there, so we should consider it here as well and maybe
> forbid that in smp virt-arm parser)

Is there anybody on the CC list who can answer this definitively?
Certainly I have no idea about this virtual topology stuff --
from my point of view I just want VMs to be able to have
multiple CPUs and I don't know anything about how real hardware
might choose to do NUMA topology either now or in future...

Put another way: this patch isn't on my list to do anything with;
please ping me when a decision has been made about whether it should
be applied or not.

thanks
-- PMM

