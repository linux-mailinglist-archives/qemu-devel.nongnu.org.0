Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3460C4A8876
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:18:30 +0100 (CET)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFeoW-0008Kk-SN
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:18:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFekA-0006dy-Ot
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:13:58 -0500
Received: from [2a00:1450:4864:20::42e] (port=41689
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFejy-0004Xq-HA
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:13:50 -0500
Received: by mail-wr1-x42e.google.com with SMTP id j16so5926452wrd.8
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 08:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jHAQ6Tcl5nITN+zzsMb9Yfzy99jPOO6lzA2+4ntXVzY=;
 b=jfzSg0ovaq7QK3gnypyS/O0rRrZPG21JB3onJkAS6zry74aPjXnExS0M7p79i3T8P9
 yLL72tgHPss2DV4PB3vgnoeP5upYb0ArCJXizdLdxso6rnTMe1kOIXAtY9dRC1VXPNH1
 4bvqQfa7oA0N318vTReeVH2UovB6Fe4MP8xHqWY3wY8LMZwpeYr/uIDBmcIE2BnXZoTf
 Vthe1FIWV3rTIfzD6FwF58OzKl0xsmvUvEzKasf/ELGeDHK3DFXlT9k8b9YBbmccDlPm
 qaSk14yrP0cHV9LAhDAiMonC61kqnMSZgKUjiOxTEl/D9E0tU5PNzM9wccgwdeP658PJ
 dcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jHAQ6Tcl5nITN+zzsMb9Yfzy99jPOO6lzA2+4ntXVzY=;
 b=HdjqXbxUqymqZyDu7KnEAZTHCS1Wa87VUX05GT+atECsmM2oQGu0e9YQHcYt5BcoVW
 s63ljX4j44/WaOiFOPNaZKf4wDFteB7BPrlbsIcnzeZJNt+EoxVtv4Gt91dzYBul5kJd
 XQfYwtlt64niBcMSAvtf+Bx8n/mBeSqkZQTNwNx+Lz+LrQurSHmPtgbW5Xd2mc5ZlyKg
 jsD5Ft/qfzJ3uua1a1lXIl6mvrUZSZL2aPfoooDHYuqqSFDOlh8c2TKmAp2dSgQ9Zhvn
 8XASSblLeKd7bjpmGF5Bzp+pK2Bjyb/LX7IJlWc43oB1wajoD80q1t2i0nv0Sswo/MOB
 rHqw==
X-Gm-Message-State: AOAM531+uPPNtdlzEt2AFzmOgk88y7jupdQ0/csEjaM6R7KBx+VroTsY
 xkmTF/rsrqlJqN/zhM1sgHg3g2qRihATu4tUN7kddQ==
X-Google-Smtp-Source: ABdhPJwy+oc+lXZRYm398p40S0ERc6xiwcsyPclax0eDwzbRvk6DDrvFlgDC3qK8RkVek47C7Xkrhi/bWAJ0SUj6N48=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr30803106wrz.2.1643904815189; 
 Thu, 03 Feb 2022 08:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20220203155304.2648009-1-valentinghita@google.com>
In-Reply-To: <20220203155304.2648009-1-valentinghita@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 16:13:24 +0000
Message-ID: <CAFEAcA_51Hy4kiq0BmXQez=bXbEqUB9Xvthnb1ixyoyUKaPpLw@mail.gmail.com>
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
To: Valentin Ghita <valentinghita@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: qemu-arm@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 15:53, Valentin Ghita <valentinghita@google.com> wrote:
>
> The DEBUGEN bit is set by the debugger when it is connected to the
> core.  Software can use this bit to check if a debug session is active.
>
> Add a function in gdbstub to check if the debugger is attached to a CPU
> and use this information when the DHCSR register is read in armv7m_nvic.

The DHCSR.C_DEBUGEN bit is for the architected Halting Debug, where
an external debugger uses the debug access port to control and
debug the CPU. This is conceptually similar to QEMU's gdb debugstub,
but not the same thing.

QEMU doesn't implement Halting Debug (this is architecturally
permitted), and so making this bit RAZ/WI is correct for us.

thanks
-- PMM

