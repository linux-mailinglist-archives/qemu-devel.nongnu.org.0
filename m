Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A9B33453F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:37:39 +0100 (CET)
Received: from localhost ([::1]:44546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2mA-0001Ve-4l
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK2I1-00063w-NV
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK2Hz-0000MV-PF
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ML5jSqeUx3BWxfCj3mPJlKjZ8LD1vyh74i+dcmNlDmE=;
 b=Qckm/eRpcWXMXjqSHHUTxIxDBb0PRilWvcjd04cnsLqW3IIoreY/is8M0z9xLy34YP4GOE
 0b28vKqwaq5LEKUhjt4/bpsS61ULIrlrtHGAPn17N04u0KcVAd3JRT2ztIXP9bpQr9fjHj
 GUs4J+iyVKVUNhPCJf/J5on2GKc75eM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-P3in3dSJPuSoBGshYUCDHQ-1; Wed, 10 Mar 2021 12:06:25 -0500
X-MC-Unique: P3in3dSJPuSoBGshYUCDHQ-1
Received: by mail-qt1-f199.google.com with SMTP id l13so2121782qtu.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ML5jSqeUx3BWxfCj3mPJlKjZ8LD1vyh74i+dcmNlDmE=;
 b=FT4coNiZqyLyAcwRFrb11ugAgq082XGaPngSv3y7Ghx7ndqB/SzXmG7GbF0r39xQnG
 OSroM++zeOczh4jreWMtgdD9vbOVfdnnsXvewAVAssF84ZxeY3B99C4QFbT5c7mZ1HT9
 g1n8urx6XEkHswFKtkEg0yJb9V7I6APv+T4qhFYKNaVXEsEu+oP8xZsWlDTFN9n1JYQ2
 Bp0vlxQlcAfJ1ydwzU5WTfQon2CFPV5b6okkoY1dDC5KG21i/4hfTScaFNiWUbsZ2eqn
 Rm+33eo6GYjwDI0B9oywGy6fmkY5WF2/RcuLnfrWAixUhFXGPyCnrdufXDE9rAd8g+Pp
 B8QA==
X-Gm-Message-State: AOAM533LXkRngIEZTiCH1Ho3iEU0kAFMQvsB/dE0JzV/Q/mK6lOaAa/l
 hQBX2P+FkUmrTKvzW02pocHzuZYXkgCg9GMXaxA+Mqzwq3KN5l59tgAIUAh7iQUf2sbqa+pib9a
 C8jgw5pP5t/Mlm6U=
X-Received: by 2002:aed:3781:: with SMTP id j1mr1294157qtb.88.1615395984691;
 Wed, 10 Mar 2021 09:06:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnYsNV9Mw+vKnoXR3bfCvnG2ZJYKHvWTvG3+G+dgwp9sHkpUp0tW6XTDkUhwc+MoF5ReY4hg==
X-Received: by 2002:aed:3781:: with SMTP id j1mr1294127qtb.88.1615395984450;
 Wed, 10 Mar 2021 09:06:24 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id m3sm3533628qkk.15.2021.03.10.09.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:06:23 -0800 (PST)
Date: Wed, 10 Mar 2021 12:06:21 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/3] memory: Provide 'base address' argument to
 mtree_print_mr()
Message-ID: <20210310170621.GC6530@xz-x1>
References: <20210305235414.2358144-1-f4bug@amsat.org>
 <20210305235414.2358144-3-f4bug@amsat.org>
 <20210308234025.GP397383@xz-x1>
 <f3bda42d-759f-dbcd-04f0-45375e3eb9fd@amsat.org>
 <c524c45f-695e-fed5-bd24-f3d4deff4016@amsat.org>
MIME-Version: 1.0
In-Reply-To: <c524c45f-695e-fed5-bd24-f3d4deff4016@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Phil,

On Tue, Mar 09, 2021 at 10:54:18PM +0100, Philippe Mathieu-Daudé wrote:
> +Peter/Mark/Edgar for SoC modelling
> 
> On 3/9/21 10:39 AM, Philippe Mathieu-Daudé wrote:
> > Hi Peter,
> > 
> > On 3/9/21 12:40 AM, Peter Xu wrote:> On Sat, Mar 06, 2021 at 12:54:13AM
> > +0100, Philippe Mathieu-Daudé wrote:
> >>> @@ -3188,14 +3188,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
> >>>  
> >>>      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> >>>          qemu_printf("address-space: %s\n", as->name);
> >>> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
> >>> +        mtree_print_mr(as->root, 1, 0, as->root->addr,
> >>
> >> Root MR of any address space should have mr->addr==0, right?
> >>
> >> I'm slightly confused on what this patch wanted to do if so, since then "base"
> >> will always be zero..  Or am I wrong?
> > 
> > That is what I am expecting too... Maybe the problem is elsewhere
> > when I create the address space... The simpler way to
> > figure it out is add an assertion. I haven't figure out my
> > issue yet, I'll follow up later with a proof-of-concept series
> > which triggers the assertion.
> 
> To trigger I simply use:
> 
> mydevice_realize()
> {
>   memory_region_init(&mr, obj, name, size);
> 
>   address_space_init(&as, &mr, name);

Could I ask why you need to set this sysbus mmio region as root MR of as?
What's AS used for here?

Btw, normally I see these regions should be initialized with
memory_region_init_io(), since normally that MR will need a MemoryRegionOps
bound to it to trap MMIOs, iiuc.

Thanks,

>   // here we have as.root.addr = 0
> 
>   sysbus_init_mmio(sbd, &mr);
> }

-- 
Peter Xu


