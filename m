Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B396832D4A6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:54:53 +0100 (CET)
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHoRI-00021f-Oh
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHoPf-0000SM-Kq
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:53:11 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHoPc-0007XA-VO
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:53:11 -0500
Received: by mail-wm1-x32e.google.com with SMTP id u125so9742971wmg.4
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 05:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=178lDzTU8Fg9PkZrtSkHmNqiMYCqT0yScQdGig+K3b4=;
 b=XQpVob8YdibhQvmKjddi1JL8PmnoSZ2MIG8L1I/01f6Xf33yrBXCSNvE+sf5sm9IkN
 kr2AXd7caFso9aFGA10T+m5Otjur/zhqGak5fmluxz/+Fk0ufffm89+3oSGNZ+bIJvAw
 wK+1isV+Z9Ng3VKwTOh5KTqC8vF55aUEZpjhubUJwyvCdbe45OHF/htWMtIzo8SdzVuB
 2quRij7qAxnql+1vVSTj8cTQfiio8FFlfOzvcMSU2CABgp8kPOeskn7LsAm34a++ayw+
 uWrIWu0KwC5WLLJ9NIqAcVibVqiDvs6LdGnKqWu4+lOwCi9iniOxA04ahfnSLiVQxwIP
 2xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=178lDzTU8Fg9PkZrtSkHmNqiMYCqT0yScQdGig+K3b4=;
 b=N/hwPY+5I+KwdzPJz++jM1NALyxSh51iERTly4yB4uPry9IDTqS9qoRmcmrlt7hRoY
 7ypbXFXwXnmJcDVHAALvODcHfiEYXn4poVnOQtjM6hFSNoGysPSuEcNPYRBSWoxV+9Ta
 o4VXGxlkKZiMhUpZA2vgHzuSKBaj03EvC84M3Z8JQEwN8U5XSilhRDasB4K4tukKwlao
 bup07J6mUELbbMhw/qAi/+///NpvDaZN5lW/XjXbJfr8gaX1JjMZed4ewCVuouhNftYF
 tvBEHPng4tZx7m/M+7fDlnbnkKAo/qN2o+wxVQrcdEWme9qYe85SA3wUTsQhMAW1SQP0
 WWYw==
X-Gm-Message-State: AOAM530YmQB7U0RmIfMUZB5bmO0qftd4CuC4RXSsJXm2QDOMDMnGMlAg
 r6fTE85TB197v2fIihfl2k85Cg==
X-Google-Smtp-Source: ABdhPJxrC79HqNeNXTFFgz4FhPkKsKOlbxMIeZqxAturAH0HKvFxlD+9Gdeum6zxTxpNMl4ufqegTg==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr4213070wmi.136.1614865986417; 
 Thu, 04 Mar 2021 05:53:06 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id t14sm38170567wru.64.2021.03.04.05.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 05:53:06 -0800 (PST)
Date: Thu, 4 Mar 2021 13:53:04 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
Message-ID: <20210304135304.GI1664@vanye>
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
 <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 18:06:46 +0000, Peter Maydell wrote:
> On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
> > It would be good if we could get 6.0 closer to SBSA compliance.
> 
> How far away are we at the moment ?
> 
> > Would it be worth the effort to make this controllable per cpu model?
> 
> I don't have a strong opinion on whether we should, but if we do then the
> right way to implement that would be to have the PMCR reset value
> as a reset_pmcr_el0 field in struct ARMCPU (like the existing reset_fpsid,
> reset_sctlr, etc) that gets set per-CPU to whatever the CPU's value for
> it is; and then instead of using a PMCR_NUM_COUNTERS value,
> extract the PMCR.N field when needed. The hardest part would be
> going through all the CPU TRMs to find out the correct reset value.

That makes sense.

I guess we could also phase the transition by using the default value
if zero?

Regards,

Leif

