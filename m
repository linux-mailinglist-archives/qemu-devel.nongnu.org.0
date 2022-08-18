Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720FD598CA8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 21:36:56 +0200 (CEST)
Received: from localhost ([::1]:49118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOlK3-0006ie-2d
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 15:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oOlI5-0003xo-Eh
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 15:34:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oOlI1-00007I-Qu
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 15:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660851288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t27VGD5bDfERJC+pXOu8wApRHc2zsJd/CGr71ZZBapU=;
 b=MofaNo60eN4//5f8yDOQwL3Px5aYB4/suQgLP7+V7dvGBDTGlaA6ut9IMQUYDkEc+ek2vA
 qN0lYmd+9H/kdxvdN43JWjNgfacorv13s88RjHCUbh2mwBE3gLpEea0Rq+kXDPWxxGfCDK
 lRAQevi2PXHrMWtZo+JoOiAUOfA6Rl8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-oLdHtarPOYeThrp7o-E_QA-1; Thu, 18 Aug 2022 15:34:47 -0400
X-MC-Unique: oLdHtarPOYeThrp7o-E_QA-1
Received: by mail-qt1-f198.google.com with SMTP id
 fv24-20020a05622a4a1800b003445e593889so1868727qtb.2
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 12:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=t27VGD5bDfERJC+pXOu8wApRHc2zsJd/CGr71ZZBapU=;
 b=qnzuKgL7qkRsiosktsEFbJ+NKgrQxtmfGNfblbgely6j+K8tN6xrKFRw+Bu7Ot0ljt
 xqS9MmOeHQfkNEZs8nq8JzVK9FVY8PoIrlzL1YqFdV860UcGQa+RfS3LLXDG2xFThMT0
 IEVYv8dOGsc/mFtJc9+OZEn/FasehVF3F2tsu1NL1e/7akC+t1aj/05KFHqWObaD3tWC
 FWogvUTgE+bNht3Pk+04oZHeidT99eRV0lpJ+C1x55KRDcuDUJ2MAGWEEgK37n9sYtYk
 5+dTrKaEbaMBomImu1i8brFuamyBvk0I+K7s9ZII9RpZJxRmLkNCH8pIbu+00HCM9N72
 kPVQ==
X-Gm-Message-State: ACgBeo1twXj5Oi3oVFtaeciadWY50Nqd89RqtLMlp8zCt/eY8gZxFRX5
 YGQiVTsRsH44U6Q5nPe86sdokkOvvQP3o93qcAWtKM5wVMG8aLQET7G0h2dwYW881gICDlE7Oys
 4+DQuOuR9Rryd/AA=
X-Received: by 2002:a05:622a:1009:b0:343:568f:fee4 with SMTP id
 d9-20020a05622a100900b00343568ffee4mr4229057qte.178.1660851286570; 
 Thu, 18 Aug 2022 12:34:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4rh0XfDF2nyUyvht8cKX6rp+fnTerdC2qC+Y809jfEDSiDwN9OY5lwp+zPLhZJ5ic8/HYtdQ==
X-Received: by 2002:a05:622a:1009:b0:343:568f:fee4 with SMTP id
 d9-20020a05622a100900b00343568ffee4mr4229045qte.178.1660851286340; 
 Thu, 18 Aug 2022 12:34:46 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ac8100f000000b003435f947d9fsm1478583qti.74.2022.08.18.12.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 12:34:45 -0700 (PDT)
Date: Thu, 18 Aug 2022 15:34:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] softmmu/memory: add missing begin/commit
 callback calls
Message-ID: <Yv6UVMMX/hHFkGoM@xz-m1.local>
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220816101250.1715523-2-eesposit@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Aug 16, 2022 at 06:12:49AM -0400, Emanuele Giuseppe Esposito wrote:
> kvm listeners now need ->commit callback in order to actually send
> the ioctl to the hypervisor. Therefore, add missing callers around
> address_space_set_flatview(), which in turn calls
> address_space_update_topology_pass() which calls ->region_* and
> ->log_* callbacks.
> 
> Using MEMORY_LISTENER_CALL_GLOBAL is a little bit an overkill,
> but it is harmless, considering that other listeners that are not
> invoked in address_space_update_topology_pass() won't do anything,
> since they won't have anything to commit.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  softmmu/memory.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7ba2048836..1afd3f9703 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1076,7 +1076,9 @@ static void address_space_update_topology(AddressSpace *as)
>      if (!g_hash_table_lookup(flat_views, physmr)) {
>          generate_memory_topology(physmr);
>      }
> +    MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
>      address_space_set_flatview(as);
> +    MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);

Should the pair be with MEMORY_LISTENER_CALL() rather than the global
version?  Since it's only updating one address space.

Besides the perf implication (walking per-as list should be faster than
walking global memory listener list?), I think it feels broken too since
we'll call begin() then commit() (with no region_add()/region_del()/..) for
all the listeners that are not registered against this AS.  IIUC it will
empty all regions with those listeners?

Thanks,

-- 
Peter Xu


