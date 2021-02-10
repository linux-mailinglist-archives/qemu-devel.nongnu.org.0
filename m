Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2863166D2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 13:34:51 +0100 (CET)
Received: from localhost ([::1]:38678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ohm-0005bP-TZ
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 07:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l9og7-00055f-Js
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:33:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l9og5-00045J-Au
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612960382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zvnMvTHYU+3ACeqRPJvjj6WsIYHc1RmKFT9IisE8YY=;
 b=KuEu5fwxoOM1vDJmDLighlUbON39gAePI5pTXEI6sroaTD/CN2wTu7gVF1Jfc+zEebCdyM
 G4ulvxzYO7CkLjLYtRrVD6OYD0TW0FzBUGo77S0gS/pzAySH8II66sLhKJa6poqvLsRZdk
 9gV1DQA76jskTDN+YpNLPegX9oL+Aow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-a6bjAcEiMEOoFQ4reepTuQ-1; Wed, 10 Feb 2021 07:32:58 -0500
X-MC-Unique: a6bjAcEiMEOoFQ4reepTuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02BA11934103;
 Wed, 10 Feb 2021 12:32:57 +0000 (UTC)
Received: from localhost (ovpn-114-196.rdu2.redhat.com [10.10.114.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5F7619C59;
 Wed, 10 Feb 2021 12:32:56 +0000 (UTC)
Date: Wed, 10 Feb 2021 07:32:55 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v16 01/23] cpu: Introduce TCGCpuOperations struct
Message-ID: <20210210123255.GA1420762@habkost.net>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-2-cfontana@suse.de>
 <20210210122151.bgxtonwy4lvtajj3@SPB-NB-133.local>
MIME-Version: 1.0
In-Reply-To: <20210210122151.bgxtonwy4lvtajj3@SPB-NB-133.local>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 03:21:51PM +0300, Roman Bolshakov wrote:
> On Thu, Feb 04, 2021 at 05:39:09PM +0100, Claudio Fontana wrote:
> > From: Eduardo Habkost <ehabkost@redhat.com>
> > 
> > The TCG-specific CPU methods will be moved to a separate struct,
> > to make it easier to move accel-specific code outside generic CPU
> > code in the future.  Start by moving tcg_initialize().
> > 
> > The new CPUClass.tcg_opts field may eventually become a pointer,
> > but keep it an embedded struct for now, to make code conversion
> > easier.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > 
> > [claudio: move TCGCpuOperations inside include/hw/core/cpu.h]
> > 
> > Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> > ---
[...]
> > diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> > index b3fd6643e8..d66f0351a9 100644
> > --- a/target/alpha/cpu.c
> > +++ b/target/alpha/cpu.c
> > @@ -231,7 +231,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
> >      dc->vmsd = &vmstate_alpha_cpu;
> >  #endif
> >      cc->disas_set_info = alpha_cpu_disas_set_info;
> > -    cc->tcg_initialize = alpha_translate_init;
> > +    cc->tcg_ops.initialize = alpha_translate_init;
> 
> Hi,
> 
> Would it be cleaner if the file had:
> 
> static
> TcgCpuOperations alpha_tcg_ops = {
>     .initialize = alpha_translate_init,
> };
> 
> CPUClass definition would be:
> struct CPUClass {
>   ...
>   TCGCpuOperations *tcg_ops;
>   ...
> }
> 
> And class init would be:
> 
> cc->tcg_ops = &alpha_tcg_ops;

That's exactly what's done by:

  Subject: [PATCH v16 15/23] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a pointer in CPUClass
  https://lore.kernel.org/qemu-devel/20210204163931.7358-16-cfontana@suse.de/

> 
> And you would grow arch_tcg_ops as you convert them?
> I'm sorry if I missed similar comment and it was already discussed.
> 
> Regards,
> Roman
> 

-- 
Eduardo


