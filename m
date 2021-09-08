Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D940403F4C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 20:53:06 +0200 (CEST)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO2gz-0008BN-Dz
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 14:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mO2ef-0006Zk-UY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 14:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mO2eb-0007JS-QN
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 14:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631127036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wq+NGOvMsettwWRV1pPV+aPcNf5ML0ihGTn8ucVPRKU=;
 b=G9bD3PzlH+BYapNiZvPq8mbotANKTzapZ/l+p3aBZIoCtG6UTPJRrfPYymPNTKulTU/uiA
 Fd4uweJ2Z3FLqBGklIq/r+cFRWjjL3/ZrDEF2GjVgGU/th8FVUe5tE1mLqp7Osz10D7JDz
 ZHbkZRraGoZJGQybJBQYBiXUMV3IBHg=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-BvmwnkkUOV642_VICSujmQ-1; Wed, 08 Sep 2021 14:50:34 -0400
X-MC-Unique: BvmwnkkUOV642_VICSujmQ-1
Received: by mail-io1-f71.google.com with SMTP id
 s6-20020a5ec646000000b005b7f88ffdd3so2710995ioo.13
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 11:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wq+NGOvMsettwWRV1pPV+aPcNf5ML0ihGTn8ucVPRKU=;
 b=f0oKr1qLZ23mJFAcL0uX+xqOeOy0uav70t22KbdxtO3ClDICbQ19vR/Lvuie1l8LwU
 sJAIhI206TKWHZRWS38kAwXnYa7OgeOTazBhnGWSVOhRSSCMZg5pd0IsLyDRLsSRaOSj
 ZBzvbpME65U/KEn+NP34xWFHoTU06NCtLT5ZzEAIoDvUQUyjnbSwuIywGo3Oa+P/toRc
 szLaoVf7+Is6xSrCd2Jn8LbBRbzi1Zm237ouOOfRbLxo0/5o/DiTEG8MRFldIa36/HJS
 ivWSUekDcym/s4Vk2DWoK6peyjaVA4hcMeO+aIUJ1fGX5lk6Gr0jzdg8tPJjGcqmtUEv
 J25A==
X-Gm-Message-State: AOAM531St5U5a4Wxg0X5+aNx9ZaAzRmLSFhaDm0jMcZEaKY5Bm2C4ZZX
 Oh4Tw8+fXuY5mvQ7go5KAoWl2z+7si2w5emB3LYt0HGHhnmiF3MuDe8gk3Gp+U+mkf8TugSTZ6D
 j+nwswcUJFZ5kcUk=
X-Received: by 2002:a92:cda4:: with SMTP id g4mr993896ild.236.1631127033846;
 Wed, 08 Sep 2021 11:50:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz+PCGl0bpvxb65V6FiV1sXPCn0/TQ4YeewYJ+ChzY0UWCCTSXITejKjeawmRT8CI1eI17VA==
X-Received: by 2002:a92:cda4:: with SMTP id g4mr993881ild.236.1631127033603;
 Wed, 08 Sep 2021 11:50:33 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id o2sm1566920ilg.47.2021.09.08.11.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 11:50:32 -0700 (PDT)
Date: Wed, 8 Sep 2021 14:50:31 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] docs/devel: memory: Document MemoryRegionOps requirement
Message-ID: <YTkF99YYW8cwa77F@t490s>
References: <20210906122020.5793-1-bmeng.cn@gmail.com>
 <54817618-59b9-d6e6-f903-f7d6938c17ba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <54817618-59b9-d6e6-f903-f7d6938c17ba@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 03:01:54PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/6/21 2:20 PM, Bin Meng wrote:
> > It's been a requirement that at least one function pointer for read
> > and one for write are provided ever since the MemoryRegion APIs were
> > introduced in 2012.
> > 
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> > 
> >  docs/devel/memory.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> > index 5dc8a12682..7b589b21d2 100644
> > --- a/docs/devel/memory.rst
> > +++ b/docs/devel/memory.rst
> > @@ -344,6 +344,11 @@ based on the attributes used for the memory transaction, or need
> >  to be able to respond that the access should provoke a bus error
> >  rather than completing successfully; those devices can use the
> >  ->read_with_attrs() and ->write_with_attrs() callbacks instead.
> > +The requirement for a device's MemoryRegionOps is that at least
> > +one callback for read and one for write are provided. If both
> > +->read() and ->read_with_attrs() are provided, the plain ->read()
> > +version takes precedence over the with_attrs() version. So does
> > +the write callback.
> 
> What about also adding a runtime check?
> 
> -- >8 --
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4df..8ab602d3379 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1516,6 +1516,17 @@ MemTxResult
> memory_region_dispatch_write(MemoryRegion *mr,
>      }
>  }
> 
> +static void memory_region_set_ops(MemoryRegion *mr, const
> MemoryRegionOps *ops)
> +{
> +    if (ops) {
> +        assert(ops->valid.accepts || (ops->read || ops->read_with_attrs));
> +        assert(ops->valid.accepts || (ops->write ||
> ops->write_with_attrs));

Curious why accepts() matters.. Say, if there's only accepts() provided and it
returned true, then I think we still can't avoid the coredump when read/write?

I'm also curious what's the issue that Paolo mentioned here:

https://lore.kernel.org/qemu-devel/8da074de-7dff-6505-5180-720cf2f47c70@redhat.com/

I believe Paolo was referring to this series from Prasad:

https://lore.kernel.org/qemu-devel/20200811114133.672647-10-ppandit@redhat.com/

We may need to solve that issue then maybe we can consider revive Prasad's
patchset?

-- 
Peter Xu


