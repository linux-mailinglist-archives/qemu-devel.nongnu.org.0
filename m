Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EB9531179
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:02:06 +0200 (CEST)
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9ZN-0001X8-4q
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nt9XC-0008IO-G3
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:59:50 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nt9X9-0007Jh-Cv
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:59:50 -0400
Received: by mail-pg1-x52c.google.com with SMTP id j21so13700379pga.13
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DFcYVXODv/uBzvDJHDbZg+Ml/E4lGZcMHzTQgnzw4EM=;
 b=NwQWARYR4RZn2CAjQsYJadNYKaVW7MzIoN/nMg9jqwZlNBfbREqbdLtvZDoDO4Z2kK
 frsixTGjYcfMSjEKLZrD2vdypr6UgcYPwluAhmygBe7J0iPQPRRpsxKMuCD2XDLMU5Fw
 YKIk0kZtQaTotXXV0gEALpq61WUPMlRJ9s9udlSDwkyZ0fPDfCadLx/guzuApI5THQjy
 kVJps1ZbRB1fgjk14rCp7iryt8xav4rO6OQDBi5GVJiXZ7FLYPXd4kEvJAx6VhVSOrDz
 v/7LuT/Ze0wUPUT03WLrgJzZdIC9iRn6D+edqU24cB0Z510B9DqpPeLekOs55zxrqupz
 JLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DFcYVXODv/uBzvDJHDbZg+Ml/E4lGZcMHzTQgnzw4EM=;
 b=sHDoFNLmFn6fCFJZ5qWnQ+dy8rgZi3AJX4Pnhlw+qwrkagPIq6XKJ1SkYZl90nSHrA
 i7yylrJHFPyQOoOudHk7YIQ8hKyixK6k8QovzrWOFMVRWLhC75V8fipzA9ZidJ8mOMfQ
 UU/yecQoAGCU38iTmgX+tvmuW35tYi9Se0zRjZH4TPYTrWpztJADJCer/4/cPD4jiVVg
 zqqywSE1fRVX8lSbFKMrKdMElniaU8nSVC5+lo29TNCFDPnfBBcrO85GrcT5LbJ6fh7n
 94y1CpWJabLJXj15fyDmFlzR74NGMNO4QgxOj6ARz6ulsVvgDjs20Vzb0xB2xNjkvy+B
 yhQA==
X-Gm-Message-State: AOAM531GY3U8j6FLN/xxD0ojufRO7xh/d4wpQMug/8XfJS70E65p47Ln
 6VgdbdGPr5XI9YWZytuT/eI=
X-Google-Smtp-Source: ABdhPJzQGTfhJi9vv+DQqQOwi2a4+S5UgWmHwyMRqF95siRlqXEmNb/p7WKMlsk/F/iLSiOqPhXFmQ==
X-Received: by 2002:a63:fc1d:0:b0:3fa:218e:1329 with SMTP id
 j29-20020a63fc1d000000b003fa218e1329mr7403816pgi.268.1653317986095; 
 Mon, 23 May 2022 07:59:46 -0700 (PDT)
Received: from localhost ([192.55.54.48]) by smtp.gmail.com with ESMTPSA id
 h11-20020a170902f2cb00b0015f33717794sm5211722plc.42.2022.05.23.07.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 07:59:45 -0700 (PDT)
Date: Mon, 23 May 2022 07:59:44 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 07/36] i386/tdx: Introduce is_tdx_vm() helper and
 cache tdx_guest object
Message-ID: <20220523145944.GB3095181@ls.amr.corp.intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-8-xiaoyao.li@intel.com>
 <20220523084817.ydle4f4acsoppbgr@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220523084817.ydle4f4acsoppbgr@sirius.home.kraxel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 23, 2022 at 10:48:17AM +0200,
Gerd Hoffmann <kraxel@redhat.com> wrote:

> > diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
> > index c8a23d95258d..4036ca2f3f99 100644
> > --- a/target/i386/kvm/tdx.h
> > +++ b/target/i386/kvm/tdx.h
> > @@ -1,6 +1,10 @@
> >  #ifndef QEMU_I386_TDX_H
> >  #define QEMU_I386_TDX_H
> >  
> > +#ifndef CONFIG_USER_ONLY
> > +#include CONFIG_DEVICES /* CONFIG_TDX */
> > +#endif
> > +
> >  #include "exec/confidential-guest-support.h"
> >  
> >  #define TYPE_TDX_GUEST "tdx-guest"
> > @@ -16,6 +20,12 @@ typedef struct TdxGuest {
> >      uint64_t attributes;    /* TD attributes */
> >  } TdxGuest;
> >  
> > +#ifdef CONFIG_TDX
> > +bool is_tdx_vm(void);
> > +#else
> > +#define is_tdx_vm() 0
> 
> Just add that to the tdx-stubs.c file you already created in one of the
> previous patches and drop this #ifdef mess ;)

This is for consistency with SEV.  Anyway Either way is okay.

From target/i386/sev.h
  ...
  #ifdef CONFIG_SEV
  bool sev_enabled(void);
  bool sev_es_enabled(void);
  #else
  #define sev_enabled() 0
  #define sev_es_enabled() 0
  #endif

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

