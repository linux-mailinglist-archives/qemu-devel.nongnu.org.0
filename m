Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F86C2DA243
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 22:06:26 +0100 (CET)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kov33-0000GD-6z
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 16:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kov1o-0008BO-82
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:05:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kov1k-0003SP-Qw
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:05:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607979903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ThdpCuO8xx5Fo0ZSuk/Eg2TSG+vjC6AOpfne5BpeTKQ=;
 b=XLFwrvwe53XZHSObdv14homSeOH67kFhiLQjiayIaqMR1kigywv4SQYDO4LYuQcGvQt9Mw
 bDmABuFt28Uixu1Obwr69NpwPKQTyO4Gpf6b/fYjvfPIQ6xAe+2IuFVo2VI4LDJcZDQ4N8
 YZ+m7yndMZaNl+pBwcv3wgOaDRCkaVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-UOFIv4ECPUWF28piMceDQA-1; Mon, 14 Dec 2020 16:05:01 -0500
X-MC-Unique: UOFIv4ECPUWF28piMceDQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEAE31922021;
 Mon, 14 Dec 2020 21:04:58 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE41470484;
 Mon, 14 Dec 2020 21:04:54 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:04:53 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v11 18/25] cpu: Move synchronize_from_tb() to tcg_ops
Message-ID: <20201214210453.GQ1289986@habkost.net>
References: <78a7119d-1b4b-47dc-8f16-510708c9fcd4@linaro.org>
 <cca08e8d-9235-46da-3610-8acafbc2de14@suse.de>
 <15b884b7-94e4-1476-f883-e84379b2661e@linaro.org>
 <5d9457df-c7c6-dd61-bbd7-1563d29102f8@suse.de>
 <946cb717-d1f3-5b30-5622-0126437420d7@suse.de>
 <b7db8e36-f623-a090-a19a-644b02c3cd76@linaro.org>
 <6c117162-7b6d-14bc-9d6e-f5169d7d1e31@redhat.com>
 <2d76e092-14bf-f9dc-4703-811f7768f1a7@suse.de>
 <20201211200221.GE1289986@habkost.net>
 <8b6e3c41-f778-414d-e62c-8733ecb19dc7@suse.de>
MIME-Version: 1.0
In-Reply-To: <8b6e3c41-f778-414d-e62c-8733ecb19dc7@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 12, 2020 at 11:00:03AM +0100, Claudio Fontana wrote:
> On 12/11/20 9:02 PM, Eduardo Habkost wrote:
> > On Fri, Dec 11, 2020 at 07:51:54PM +0100, Claudio Fontana wrote:
> >> On 12/11/20 7:26 PM, Philippe Mathieu-Daudé wrote:
> >>> On 12/11/20 7:22 PM, Richard Henderson wrote:
> >>>> On 12/11/20 12:15 PM, Claudio Fontana wrote:
> >>>>> Should I return this file to the original state (without the extra #includes that pretend it to be a standalone header file,
> >>>>> and call it
> >>>>>
> >>>>> tcg-cpu-ops.h.inc
> >>>>>
> >>>>> ?
> >>>>
> >>>> If this header can work with qemu/typedefs.h, then no, because the circularity
> >>>> has been resolved.  Otherwise, yes.
> >>>
> >>> My editor got confused with TranslationBlock, which is why I asked
> >>> to include its declaration.
> >>>
> >>> Easier to forward-declare TranslationBlock in qemu/typedefs.h?
> >>>
> >>> Regards,
> >>>
> >>> Phil.
> >>>
> >>
> >> Hello Philippe,
> >>
> >> ok you propose to move the existing fwd declaration of TranslationBlock from cpu.h to qemu/typedefs.h .
> > 
> > It seems simpler to just add a
> > 
> >     typedef struct TranslationBlock TranslationBlock;
> > 
> > line to tcg-cpu-ops.h.
> > 
> > Or, an even simpler solution: just use `struct TranslationBlock`
> > instead of `TranslationBlock` in the declarations being moved to
> > tcg-cpu-ops.h.
> > 
> > We don't need to move declarations to typedefs.h anymore, because
> > now the compilers we support don't warn about typedef
> > redefinitions:
> > https://lore.kernel.org/qemu-devel/20200914134636.GZ1618070@habkost.net/
> > 
> > 
> >>
> >> And what about #include "exec/memattrs.h"?
> >>
> >> I assume you propose to put struct MemTxAttrs there as a fwd declaration too,
> > 
> > This can't be done, because MemTxAttrs can't be an incomplete
> > type in the code you are moving (the methods get a MemTxAttrs
> > value, not a pointer).
> 
> 
> 
> I'm confused now on what we are trying to do: if we want the
> file to be a "proper header" or just a TCG-ops-only convenience
> split of cpu.h.

Personally, I don't see the point of creating a new header if
it's not a proper header.

> 
> I thought that we were only solving a highlighting issue in some editor (Philippe),
> and I wonder if these changes in qemu/typedef.h help with that?
> 
> I tried adding both to qemu/typedef.h, and since cpu.h is the only user of the file, and it already includes memattrs.h, everything is fine.
> 
> But here maybe you are proposing to make it a regular header, and include this instead of just hw/core/cpu.h in the targets?
> 
> I am thinking whether it is the case to scrap this whole mess, make TCGCPUOps a pointer in CPUClass, and in the targets say for example:
> 
> #include "tcg-cpu-ops.h"
> 
> ...
> 
> +static struct TCGCPUOps cris_tcg_ops = {
> +    .initialize = cris_initialize_tcg,
> +};
> +
>  static void cris_cpu_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> @@ -284,7 +292,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_stop_before_watchpoint = true;
>  
>      cc->disas_set_info = cris_disas_set_info;
> -    cc->tcg_ops.initialize = cris_initialize_tcg;
> +    cc->tcg_ops = &cris_tcg_ops;
>  }
> 
> 
> What do you all think of this?

Making tcg_ops a pointer may make a lot of sense, but (as
mentioned in my reply to v12) I'm worried by the scope of this
series growing too much.

I suggest doing this refactor in smaller steps, to let us focus
in a single issue at a time.  Instead of splitting the struct and
creating a new header file in a single patch, you can first
create the new struct in the same header, and worry about moving
it to a separate header later (in the same series, or in another
series).

-- 
Eduardo


