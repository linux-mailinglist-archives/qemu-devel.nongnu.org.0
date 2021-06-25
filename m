Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C23B4405
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:06:17 +0200 (CEST)
Received: from localhost ([::1]:49926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlXE-0000OP-3l
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.mambu@pm.me>) id 1lwhyW-0000lS-IK
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:18:12 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:51903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.mambu@pm.me>) id 1lwhyT-00068R-KM
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:18:12 -0400
Date: Fri, 25 Jun 2021 09:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
 t=1624612685; bh=Q8TQW7Ao09ae469tZjaSIwtsNHDr9t4Xfds4VIz6moc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=NjqphAfFM7rv/6036zs3ACc2uYTL4fFEGDYs8mpSyOhoI8dpqmKW6dxP/rQP/K7Iz
 S+4zQ+xiTcLReeDP0LbZ8Hw7SSP2egj954Y5KwNb36YZUlVzg7CQXVqMT6zSn6kv6y
 37iMoGm3APTyVeA8tBHvsm3B5sfyyS0omWYq60mOrVbsDhzfmfP98VaxnssUyLRKqZ
 zWLBGO02allslxRZdXyGNYsLNUAYN0LE7AdjcMb+7+VzDhGuT/lMA1KWJDLqLqVTHK
 qzuVmCyRQEt7vUbUOD3scm+1KCyfWHooTfURLJcYQCX/lMMMvoUyoS3hyscuiTa0gO
 aYtEcWZAy5YRg==
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
From: Kevin Mambu <kevin.mambu@pm.me>
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>
Subject: Re: Difficulties to access guest memory in TCG plugins
Message-ID: <ue5FWr9Im37PzO94ccnHkiZJawfs6i4R8DdYdA5aVq_8BJHXDFLa4ojQpN1CIh5trBH4wiAZNTPzy1V98TQFX4FPh_Z7jngXuYNTaR_hSS4=@pm.me>
In-Reply-To: <87zgvfqc5y.fsf@linaro.org>
References: <o1Yk83q9b8fPEPYKowd-FS7TM3GAByNtQScLqBwokjniIxwBv-rLo3gQU5MAjLDZGJn9hOGiPudeSXvp3TS-QxouCtlVqHbsnGqXf8dKs_k=@protonmail.com>
 <6c51799c-6882-c459-0996-325c58de87fd@amsat.org> <87zgvfqc5y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.136; envelope-from=kevin.mambu@pm.me;
 helo=mail-40136.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Jun 2021 09:03:02 -0400
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
Reply-To: Kevin Mambu <kevin.mambu@pm.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for you answer.

> Out of interest what is your use-case for this? The project has very
>
> deliberately avoided adding such an API for writing memory for plugins
>
> to avoid people attempting to bypass the GPL by doing things in plugins.
>

In the scope of my Ph. D subject, I want to model a DMA-like mechanism for =
quick prototyping and evaluation, the plugin emulates an MMIO with Control/=
Status Registers. I am actually able to pass parameters to the Control/Stat=
us Registers through store instruction without any issue. Only the data tra=
nsfer between two guest memory regions fails at times.

> I'm not surprised. If you look at tlb_plugin_lookup you'll see the
>
> existing introspection code has to jump through some hoops to avoid race
>
> conditions that can cause updates to the internal TLB status. If we
>
> wanted to support reading values from memory that's probably doable -
>
> but for writing it would be hard to do in an idempotent way.
>

I understand, thank you for the clarification. As an alternative, I was thi=
nking about allocating memory in the plug-in for it to redirect guest memor=
y accesses into. This would certainly add significant overhead at execution=
 time, but at least race conditions would be consistently avoided. Could yo=
u, please, tell me your opinion on the matter ?

Thank you,

K=C3=A9vin Mambu
e:=C2=A0kevin.mambu@pm.me
m:=C2=A0+33 6 52 59 96 97
=C2=A0=C2=A0


