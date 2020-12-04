Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C252CF55A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:13:39 +0100 (CET)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHST-0000AR-RW
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1klF1u-0002V3-UR
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:38:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1klF1J-0003pt-J1
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:37:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607103433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HY0pD8wsZEZme4xpI6EBalOhrv3Z6QtPLu61qwZ59sY=;
 b=P0hA4J4ZtEo86WSnT/ZRqdgDuW1vRdkWbkS9iXP0Oh8fzwZSHVuQt/4zNR+CO2lNu3UvpQ
 QmY09/UmsEMN6ukGVIyobT9dRAkTcGgKWyLtlWhCTGasAxeSHmoIdBofNcbD0UYmHoRN/c
 mLR3B8N6DIVG0zkkPmrAixybdP86SQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-d5tJ24-gOm-CKzAu16tf5w-1; Fri, 04 Dec 2020 12:37:10 -0500
X-MC-Unique: d5tJ24-gOm-CKzAu16tf5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E7F4107ACE3;
 Fri,  4 Dec 2020 17:37:08 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86D2060861;
 Fri,  4 Dec 2020 17:37:04 +0000 (UTC)
Date: Fri, 4 Dec 2020 12:37:03 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC v7 15/22] cpu: Move tlb_fill to tcg_ops
Message-ID: <20201204173703.GQ3836@habkost.net>
References: <20201130023535.16689-1-cfontana@suse.de>
 <20201130023535.16689-16-cfontana@suse.de>
 <4c7fe436-7c2d-e55d-1139-8aa30e91965f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4c7fe436-7c2d-e55d-1139-8aa30e91965f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 06:14:07PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/30/20 3:35 AM, Claudio Fontana wrote:
> > From: Eduardo Habkost <ehabkost@redhat.com>
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  accel/tcg/cputlb.c              |  6 +++---
> >  accel/tcg/user-exec.c           |  6 +++---
> >  include/hw/core/cpu.h           |  9 ---------
> >  include/hw/core/tcg-cpu-ops.h   | 12 ++++++++++++
> >  target/alpha/cpu.c              |  2 +-
> >  target/arm/cpu.c                |  2 +-
> >  target/avr/cpu.c                |  2 +-
> >  target/cris/cpu.c               |  2 +-
> >  target/hppa/cpu.c               |  2 +-
> >  target/i386/tcg-cpu.c           |  2 +-
> >  target/lm32/cpu.c               |  2 +-
> >  target/m68k/cpu.c               |  2 +-
> >  target/microblaze/cpu.c         |  2 +-
> >  target/mips/cpu.c               |  2 +-
> >  target/moxie/cpu.c              |  2 +-
> >  target/nios2/cpu.c              |  2 +-
> >  target/openrisc/cpu.c           |  2 +-
> >  target/ppc/translate_init.c.inc |  2 +-
> >  target/riscv/cpu.c              |  2 +-
> >  target/rx/cpu.c                 |  2 +-
> >  target/s390x/cpu.c              |  2 +-
> >  target/sh4/cpu.c                |  2 +-
> >  target/sparc/cpu.c              |  2 +-
> >  target/tilegx/cpu.c             |  2 +-
> >  target/tricore/cpu.c            |  2 +-
> >  target/unicore32/cpu.c          |  2 +-
> >  target/xtensa/cpu.c             |  2 +-
> >  27 files changed, 41 insertions(+), 38 deletions(-)
> 
> With cc->tcg_ops.* guarded with #ifdef CONFIG_TCG:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks!

Are the #ifdefs a hard condition for your Reviewed-by?

Even if we agree #ifdef CONFIG_TCG is the way to go, I don't
think this should block a series that's a step in the right
direction.  It can be done in a separate patch.

(Unless the lack of #ifdef introduces regressions, of course)

-- 
Eduardo


