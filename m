Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7562A3B7358
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:38:52 +0200 (CEST)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDww-0001CG-VY
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1lyDt6-0003qK-RR
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:34:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1lyDt4-00016r-Qw
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:34:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id a13so25842270wrf.10
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=i3rfntZFKGvcYCHR6/QyjjQUvxdr34mR6pV+MnonEg0=;
 b=Y87dxg0LH0HkUiPFiVuwsAXIYYr31eV5ERzaGluSKBfg5rH9cuRXYlc15iSlcgbgxA
 hO1U663X/jzJs2NPHZCz3rmVFgsy4NngxSuV9JCEgyd93yGNeGsErIEOc4NQXErelkRV
 sWQPfu1ydNbkL8Boi9yduRTccYtui9rpqnhJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=i3rfntZFKGvcYCHR6/QyjjQUvxdr34mR6pV+MnonEg0=;
 b=gRfTm9aoQg6U9fTdZt9x0A+yDZ1iqFBobyfaKsUZsB5k8pUsa7B0i6hFOmFuVUWjGa
 C84en2rZm+OZJuHG8Jjku/OB6qPCTkJrgWS/D8eQYTbj/4Z5GdlMDHjWBblUyK56x8Ez
 D/OineuqA5e1RPbgCTEVFGLtcg8Hrdq6zeJKzyMXu6eaTtewTvkVr9mKLRyNTQ3kvzHE
 WC7RCe4cP2UuEngfDTn8ndblsmE36UF+TPJFrLd8dxHjmZabxoiVALwbZSVYImmT/Mlr
 ThV7iojg2PAtbhD8/P0+ziqoLLmnCDRVwMadN5nZnt+EOnqgc8WvZ13c5DwZhdJQzLS4
 IfqQ==
X-Gm-Message-State: AOAM530MgJg+mcYDV5IDX0w/OsasA9eBL16g0PVgJaWaQ8yp87WfIwgT
 wqax6XN3zrBGPu3a5QlhCrIJfg1r9CaqIA==
X-Google-Smtp-Source: ABdhPJwXBRJXHuptpbtuw3CV1YJ+CT7e+8imFDOzd+1R8daGm7rEvIqi+ld7elRd1YTF09fvIiyyjQ==
X-Received: by 2002:a5d:5012:: with SMTP id e18mr34585354wrt.286.1624973687561; 
 Tue, 29 Jun 2021 06:34:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e4cd:1977:5709:51f0?
 ([2001:8b0:aba:5f3c:e4cd:1977:5709:51f0])
 by smtp.gmail.com with ESMTPSA id j11sm16589204wms.6.2021.06.29.06.34.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 06:34:47 -0700 (PDT)
Message-ID: <709a88a0f24ed8fd5399a2be88fb9d57ceb0a25a.camel@linuxfoundation.org>
Subject: Re: VMs hanging with rcu stall problems
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Tue, 29 Jun 2021 14:34:46 +0100
In-Reply-To: <89f4220fd2b973ebfed4bf4be0afbdefc44a9d4d.camel@linuxfoundation.org>
References: <89f4220fd2b973ebfed4bf4be0afbdefc44a9d4d.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wr1-x430.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-06-03 at 11:02 +0100, Richard Purdie wrote:
> We're seeing intermittent rcu stalls in qemu system mode emulation which is 
> causing CI issues for us (Yocto Project). We're struggling to understand
> the cause and have tried several things to mitigate without much success. 
> The stalls are odd in that the log messages look incomplete. An example
> from last night:

To answer my own question, the issue is a kernel bug in RCU stall handling.
The fix:

https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?h=rcu/next&id=c583bcb8f5ed

and patch which introduced the problem:

https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?h=rcu/next&id=c583bcb8f5ed

Cheers,

Richard


