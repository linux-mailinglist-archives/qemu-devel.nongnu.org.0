Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8891532378
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:49:58 +0200 (CEST)
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntOMd-0004bi-FM
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ntOFj-0000wH-OW
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ntOFg-0003X7-Oi
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653374563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZcCP2qAVtg+8ALVdH43HRFvkEtv7/fw48ULRdMeMgoY=;
 b=DG9VmeWp3ga4ZVi89VxjR+VeCIQJTnqWeTbRS9qO31vn3r6/nVkMfGbc3CbmWeJVHrOoG5
 ao03DXBAsNjz8kE+syMkqFRXTQL7EOASsi2PdmV2eAj6hG13tPsMuc+Pxlqp9VZovSDLxt
 L5L1rtt1tOADt1tei9oQI2dLnnln53Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-kmOAKuvwPsGRXcKAgKCm5g-1; Tue, 24 May 2022 02:42:38 -0400
X-MC-Unique: kmOAKuvwPsGRXcKAgKCm5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5492811E75;
 Tue, 24 May 2022 06:42:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92B1540D1B98;
 Tue, 24 May 2022 06:42:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1B6B81800393; Tue, 24 May 2022 08:42:36 +0200 (CEST)
Date: Tue, 24 May 2022 08:42:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 isaku.yamahata@intel.com,
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
Message-ID: <20220524064236.aptmlagzqgrexeka@sirius.home.kraxel.org>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-8-xiaoyao.li@intel.com>
 <20220523084817.ydle4f4acsoppbgr@sirius.home.kraxel.org>
 <20220523145944.GB3095181@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523145944.GB3095181@ls.amr.corp.intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> > > +#ifdef CONFIG_TDX
> > > +bool is_tdx_vm(void);
> > > +#else
> > > +#define is_tdx_vm() 0
> > 
> > Just add that to the tdx-stubs.c file you already created in one of the
> > previous patches and drop this #ifdef mess ;)
> 
> This is for consistency with SEV.  Anyway Either way is okay.

> From target/i386/sev.h
>   ...
>   #ifdef CONFIG_SEV
>   bool sev_enabled(void);
>   bool sev_es_enabled(void);
>   #else
>   #define sev_enabled() 0
>   #define sev_es_enabled() 0
>   #endif

Hmm, not sure why sev did it this way.  One possible reason is that the
compiler optimizer can see sev_enabled() evaluates to 0 and throw away
the dead code branches then.

So, yes, maybe it makes sense to stick to the #ifdef in this specific
case.

take care,
  Gerd


