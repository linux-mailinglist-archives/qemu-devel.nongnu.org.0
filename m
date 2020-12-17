Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FE2DDA1D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:34:16 +0100 (CET)
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzyZ-0005Vq-PG
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpzxH-0004z0-IG
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:32:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpzxF-0006oy-Ox
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608237172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WasJY6p5bbtA14+T71qD+eC1fB8cGZaSkgOET656qs8=;
 b=Strvlb0Fho+rxDu+nZruCiidVQQetn2bDLGAYc+2acDtHFsXzIF5Ie0rd4/YsMtSMTUjLw
 hoXJbCzu6az9EnLW7TseSNcumcYJEsxDkxy9vNg/Xo48TrHziDo2DAi/PbdSipuFCujZep
 sNYA1iDzboVN0f108tY8N8S3hQ5i5hA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-rSP6b1VwMP-LXwGW7jdybQ-1; Thu, 17 Dec 2020 15:32:49 -0500
X-MC-Unique: rSP6b1VwMP-LXwGW7jdybQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6864510054FF;
 Thu, 17 Dec 2020 20:32:48 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FB6F1B5B9;
 Thu, 17 Dec 2020 20:32:44 +0000 (UTC)
Date: Thu, 17 Dec 2020 15:32:42 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: dangers of current NEED_CPU_H, CONFIG_SOFTMMU, CONFIG_USER_ONLY
 (was: [PATCH v11 7/7] cpu: introduce cpu_accel_instance_init)
Message-ID: <20201217203242.GM3140057@habkost.net>
References: <20201211100908.19696-1-cfontana@suse.de>
 <20201211100908.19696-8-cfontana@suse.de>
 <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
 <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 08:15:38PM +0000, Peter Maydell wrote:
> On Thu, 17 Dec 2020 at 19:46, Claudio Fontana <cfontana@suse.de> wrote:
> >
> > Hi,
> >
> > I would like to highlight the current dangerous state of NEED_CPU_H / CONFIG_SOFTMMU / CONFIG_USER_ONLY.
> 
> > So our struct TcgCpuOperations in include/hw/core/cpu.h,
> > which contains after this series:
> >
> > #ifndef CONFIG_USER_ONLY
> >     /**
> >      * @do_transaction_failed: Callback for handling failed memory transactions
> >      * (ie bus faults or external aborts; not MMU faults)
> >      */
> >     void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
> >                                   unsigned size, MMUAccessType access_type,
> >                                   int mmu_idx, MemTxAttrs attrs,
> >                                   MemTxResult response, uintptr_t retaddr);
> >     /**
> >      * @do_unaligned_access: Callback for unaligned access handling
> >      */
> >     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> >                                 MMUAccessType access_type,
> >                                 int mmu_idx, uintptr_t retaddr);
> > #endif /* !CONFIG_USER_ONLY */
> 
> Yeah, don't try to ifdef out struct fields in common-compiled code...
> 
> > Note that include/hw/core/cpu.h already uses CONFIG_USER_ONLY in other parts of the header file, and we might have hidden problems as a result we (or at least I) don't know about,
> > because code is being compiled in for linux-user which explicitly should not be compiled there.
> 
> The other CONFIG_USER_ONLY checks in that file are only
> ifdeffing out prototypes for functions that exist only in
> the softmmu build, or providing do-nothing stubs for functions
> that are softmmu only. I think they're safe.
> 
> > There are multiple workarounds / fixes possible for my short term problem,
> > but would it not be a good idea to fix this problem at its root once and for all?
> 
> What's your proposal for fixing things ?
> 
> Incidentally, this should not be a problem for CONFIG_SOFTMMU,
> because that is listed in include/exec/poison.h so trying to
> use it in a common (not compiled-per-target) file will give you
> a compile error. (So in theory we could make CONFIG_USER_ONLY
> a poisoned identifier but that will require some work to
> adjust places where we currently use it in "safe" ways...)

The risk of introducing this kind of bug seem to outweigh the
benefits of existing safe usage.  Do we know how many of these
cases we have?

-- 
Eduardo


