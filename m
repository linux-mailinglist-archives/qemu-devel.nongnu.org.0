Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB860319468
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:26:53 +0100 (CET)
Received: from localhost ([::1]:39750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIY8-0007PE-Js
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAIHN-0001gC-Vj
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:09:35 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAIHI-0002zh-SE
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:09:33 -0500
Received: by mail-wm1-x32b.google.com with SMTP id u16so2974318wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PQh9gIVfDj8WX+hoHgwWigzM3XEIIUKkUVYVGHGT9QQ=;
 b=twy5GFlAIq2VXyJabsCfMN2QtgYCx568BaPHlGDV1Gnmcei2dAzx/tzzVPKDI/kDjb
 EfIbQtyhVb1Qm6QNyHJaN+zDGeMEr2QtiXT5rUCL/f/Rqw45vZbt/CRcbpxoMF3JVNAC
 csAgAVSj2IV2p/DalKaEDGRq8Uz/XMGpaURba4q07NWlQxeJY94CmnwfnsCKZSQk3aOk
 TjQnElZPn6DTbPDd/Jsfd0HmoifK3QQGrcllji0ieUYgFX81zmz1tUZX7Px28sf1eqwi
 YrGpy60BmDz2we3sCixvUrQH8EQU5B5BdhsFejC6EAsAcTUVoGaOMb/ZmkrZXQZuKsNl
 +Mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PQh9gIVfDj8WX+hoHgwWigzM3XEIIUKkUVYVGHGT9QQ=;
 b=O2qKcJVxds/DpME4kGRWh+jbtv4/n7El4AzpYwEAnhNwUOBoXcorcvPzGd2rSuKgij
 SpTys7210i2r3U7Y6gYoRnosjdMr8LG8EC487YMtFnsQsHWDdsPVqB2Ll4rNMkuhA2id
 GHRrxC80yY0b3ODtqoamaBiJlJ1vw6yp+1/LRR15KHEsI4HfgIS4yFywbqhm8yeb0y9P
 2dUZUqsUNskkquBsmbMt+ihW/FUS1Ub8lbfrfgxAEKwV9CwVlMOoBMuzBveiKFvxMWW7
 +qaUdPOag/O8kDJkUPuXlpToMc1hYnexg7+Mv0iAHSKvjUN8FGRGtH5mTiBrYBdsPzwN
 Ygrg==
X-Gm-Message-State: AOAM532JtLxOidbsjMC/RCYAXyQzWDys6QhOspa2AWhurSQaCcuRfmx2
 OrguH94pJFo50J1ZuQT/u/eiag==
X-Google-Smtp-Source: ABdhPJyg8LDH0fGhDIV+ftmMeCLfU/p4LdThTCRgWQcvmtD3KSbblc3thTs1pWBvbwJbOy+qF1Qwxw==
X-Received: by 2002:a1c:7f4a:: with SMTP id a71mr6733183wmd.92.1613074162136; 
 Thu, 11 Feb 2021 12:09:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 143sm11359593wmb.47.2021.02.11.12.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 12:09:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5B691FF7E;
 Thu, 11 Feb 2021 20:09:19 +0000 (GMT)
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-18-alex.bennee@linaro.org>
 <67c46489-08b7-fce5-91c9-8416f9164456@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 17/21] accel/tcg: cache single instruction TB on
 pending replay exception
Date: Thu, 11 Feb 2021 20:00:40 +0000
In-reply-to: <67c46489-08b7-fce5-91c9-8416f9164456@linaro.org>
Message-ID: <87h7mis6xc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/10/21 2:10 PM, Alex Benn=C3=A9e wrote:
>> Again there is no reason to jump through the nocache hoops to execute
>> a single instruction block. We do have to add an additional wrinkle to
>> the cpu_handle_interrupt case to ensure we let through a TB where we
>> have specifically disabled icount for the block.
>
> Can you say more about this?  Because...
>
>>      if (unlikely(qatomic_read(&cpu->exit_request))
>>          || (icount_enabled()
>> +            && (cpu->cflags_next_tb =3D=3D -1 || cpu->cflags_next_tb & =
CF_USE_ICOUNT)
>>              && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra =
=3D=3D 0)) {
>
> ... this does not appear to match.  You're checking that icount has been
> explicitly *enabled*?

If icount has been enabled and we are using the default cflags or
enabled and we have the explicit CF_ICOUNT. The replay exception leg
explicitly disables icount because otherwise we'd never actually execute
the block because we have a budget of 0 cycles left. Previously we ran
that block at the exception handling point - now we fall through and
have to make sure we don't trigger an IRQ.

> Or am I reading the logic backward and only if icount is
> enabled will we take EXCP_INTERRUPT?

Or I guess we have an exit_request which hasn't been handled yet but
there is no EXCP_ pending.

>
>
> r~


--=20
Alex Benn=C3=A9e

