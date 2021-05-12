Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7AD37C5DE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:46:30 +0200 (CEST)
Received: from localhost ([::1]:55644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgr49-0006Bz-At
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgr1L-0004cw-KM
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:43:35 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgr1J-0007pn-Tl
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:43:35 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 a10-20020a05600c068ab029014dcda1971aso1622040wmn.3
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bAct5ytF+zPYWzPv9JyWyzFEKP3ZqK6D9/xqw75AoFA=;
 b=jxxqCfA2dPnpe2Pqc8jiuDZ3JY79TMefq0vhTpSBGohG9ll5qX00wfnkfeqZaYJCJ1
 FNbNYSW7OUWzaXPlBtrH42sb6QqbauYgdaMVynu24gl2oiFd3UCswcWh2idqaPz9chFG
 Eo5fvq+3iJHaSo6lDyN2s1cOxAHl+jateFzwf2n1xF+vgPpdgWiQaxnMnfFeTGCMn2s1
 +MJmc6jHINwgdZLTLfYUYiSq+sTe1luizU6b6/9EgkiBqB5sqRSs0IeDNKuRE+wc0D0L
 pWyZpLTBJhT2HxZX/qDXM1PZy2bIauPe0LoTVvwhy9rexc7krfk5brhqJ56jsZQR55CR
 CfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bAct5ytF+zPYWzPv9JyWyzFEKP3ZqK6D9/xqw75AoFA=;
 b=sKDvSzF9cKkymjSLzYZvL2MnRrpswTIlJKhYFCPzh7EPEDzZiof6rLM6Fl3yIw9NiP
 GVcClPU074nGw/KTZRTaEK+1PWnGiFtoeT0jcU9q6ixSodpkY61KAkLDDPfzXKwjuGua
 jNE+7NJdStv3dYGxgzaBBKr36Jylr0a/dxGuz05rxBlbYkT/qh9PYJ5er2af9iyFscGI
 6MROdkAdrNpV8MkeIg2T6H8trMJnzGE3BZDLLsUZBdaxSk5pxepSBrUd/uCNUco0vBLQ
 UnXuYLIXs24dCM8V7OKWJmGoZELcvGT4G9vG7lwryOAB63MRzlhrPuOkfsebsiOcLri/
 uuHw==
X-Gm-Message-State: AOAM530Vg3foduePkv/Fd8weE4Y2TnfUQSmIJQvirIeuna7CzGUuhzgw
 L1M64N9aGLPwRWVBm8efAulmhQ==
X-Google-Smtp-Source: ABdhPJymBdWpAOLfBZq9v2b+TjO4R+Lsh6RDjjls2gh4fiHOGddmGJcGuueMR8iKLv/OKmiMgOVgQA==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr12568422wmn.82.1620834211985; 
 Wed, 12 May 2021 08:43:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q12sm6305386wmj.7.2021.05.12.08.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 08:43:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E5201FF7E;
 Wed, 12 May 2021 16:43:30 +0100 (BST)
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>
Subject: Re: GICv3 for MTTCG
Date: Wed, 12 May 2021 16:26:58 +0100
In-reply-to: <1f157423cc544731beb743287a4be5cb@huawei.com>
Message-ID: <87h7j8ez4t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>, Cota@braap.org,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Chengen \(William, 
 FixNet\)" <chengen@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:

> Dear colleagues,
>
> I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 hos=
t.
> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:
>
> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8
>
> The version 3 of the Generic Interrupt Controller (GICv3) is not
> supported in QEMU for some reason unknown to me. It would allow to
> increase the limit of CPUs and accelerate the MTTCG performance on a
> multiple core hypervisor.

It is supported, you just need to select it.

> I have got an idea to implement the Interrupt Translation Service (ITS)
> for using by MTTCG for ARM architecture.

There is some work to support ITS under TCG already posted:

  Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
  Date: Thu, 29 Apr 2021 19:41:53 -0400
  Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>

please do review and test.

> Do you find that idea useful and feasible?
> If yes, how much time do you estimate for such a project to complete by
> one developer?
> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?

As far as MTTCG performance is concerned there is a degree of
diminishing returns to be expected as the synchronisation cost between
threads will eventually outweigh the gains of additional threads.

There are a number of parts that could improve this performance. The
first would be picking up the BQL reduction series from your FutureWei
colleges who worked on the problem when they were Linaro assignees:

  Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from cpu_handle_int=
errupt/exception path
  Date: Wed, 19 Aug 2020 14:28:49 -0400
  Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>

There was also a longer series moving towards per-CPU locks:

  Subject: [PATCH v10 00/73] per-CPU locks
  Date: Wed, 17 Jun 2020 17:01:18 -0400
  Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>

I believe the initial measurements showed that the BQL cost started to
edge up with GIC interactions. We did discuss approaches for this and I
think one idea was use non-BQL locking for the GIC. You would need to
revert:

  Subject: [PATCH-for-5.2] exec: Remove MemoryRegion::global_locking field
  Date: Thu,  6 Aug 2020 17:07:26 +0200
  Message-Id: <20200806150726.962-1-philmd@redhat.com>

and then implement a more fine tuned locking in the GIC emulation
itself. However I think the BQL and per-CPU locks are lower hanging
fruit to tackle first.

>
> Best regards,
> Andrey Shinkevich


--=20
Alex Benn=C3=A9e

