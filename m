Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC0E68E31D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:48:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPVoY-0006vS-SF; Tue, 07 Feb 2023 16:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPVoK-0006mZ-1m
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:47:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPVoH-0008E4-7m
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675806448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rXAaNytzF3w8rxH3o+eZhFu00IxOwPu3evjbxvrAPd0=;
 b=K1ipeugetYgJrrMaQQnjCBEEBkjHITk21srSzpAj1mgTOVmd5DVLRbQrJS3BpVXtW0irjh
 qNK8aSyKtQl2LziIOVfpXwjk6Mx4Mh40CIpHhv9muB2woVYI6k0bNav70Swu38I05I+hOU
 0OT33uFj6J1UT9s/sa2079Rc9YGxac0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134--fc2euLkO8K8qu6-a4Lmew-1; Tue, 07 Feb 2023 16:47:27 -0500
X-MC-Unique: -fc2euLkO8K8qu6-a4Lmew-1
Received: by mail-qk1-f198.google.com with SMTP id
 a198-20020ae9e8cf000000b007259083a3c8so10702966qkg.7
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 13:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXAaNytzF3w8rxH3o+eZhFu00IxOwPu3evjbxvrAPd0=;
 b=fShRf8Iu61TenT70dcGrKkRaI1ELPO54WXh90XAHvVebmUD1qa5vetvmOQ1rJiTATK
 fX7u/qeGmY96SNNXbNAfzsGbSNN324dKo7+m7BS8ngUI0atMGVwhxr3D2SYB9JTfbVqF
 j0135BeTjRk/MdHzBPDdDxsFq8dCFxdQ6BOXUKsJMm3ehr6mLjTqne26MnKENLL6Vs3L
 TAE7Wosrfn+DDGkg9AohxsENTHHHtfupx+sYC/GszC3OYjvD0bZpVeNNSP8Xo2Xh2s7x
 7XOyqdpkbPchDa38vL1OAfgE7z+LXYtfq1A8XJhivXmxr8R39m51b66Elc/cECaSWjQa
 Pg1g==
X-Gm-Message-State: AO0yUKXjNrL+rU7SRR3k0iYKBVgB4Kk+m4gNst3yc9IoF5+v5BybYHJf
 HfGwKueSOhPRsJgOLHapBqp0XJFKvJPoZIaf0LmP0md6JaGtg2A4Z2cwkuwYAluTyFmFEfezSd+
 j82FhppfU6jx/Wlk=
X-Received: by 2002:ac8:5fd2:0:b0:3b8:6d5a:3457 with SMTP id
 k18-20020ac85fd2000000b003b86d5a3457mr10199342qta.6.1675806446774; 
 Tue, 07 Feb 2023 13:47:26 -0800 (PST)
X-Google-Smtp-Source: AK7set8LcCTXANgoU+OUwgJdU9ieu641rUM2P2NyxS+QxmQ2XGENkHX29quNFgyKO1RxzcCbUl0BEg==
X-Received: by 2002:ac8:5fd2:0:b0:3b8:6d5a:3457 with SMTP id
 k18-20020ac85fd2000000b003b86d5a3457mr10199315qta.6.1675806446482; 
 Tue, 07 Feb 2023 13:47:26 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 k1-20020a05620a414100b007112aa42c4fsm10431778qko.135.2023.02.07.13.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 13:47:25 -0800 (PST)
Date: Tue, 7 Feb 2023 16:47:24 -0500
From: Peter Xu <peterx@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH V2] memory: flat section iterator
Message-ID: <Y+LG7Ge3iSKho/oF@x1n>
References: <1675796609-235681-1-git-send-email-steven.sistare@oracle.com>
 <Y+KwNN9v81aLKct2@x1n>
 <d2cf4bae-1a45-d2ae-8f47-f4ce56cf21dd@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d2cf4bae-1a45-d2ae-8f47-f4ce56cf21dd@oracle.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 07, 2023 at 04:28:49PM -0500, Steven Sistare wrote:
> On 2/7/2023 3:10 PM, Peter Xu wrote:
> > On Tue, Feb 07, 2023 at 11:03:29AM -0800, Steve Sistare wrote:
> >> Add an iterator over the sections of a flattened address space.
> >> This will be needed by cpr to issue vfio ioctl's on the same memory
> >> ranges that are already programmed.
> > 
> > Should this better be proposed with the context of using it?  Or I don't
> > know how to justify this new interface is needed.
> > 
> > For example, any explanations on why memory region listeners cannot work?
> 
> For context, the new interfaces is used in the patch
>   "vfio-pci: recover from unmap-all-vaddr failure"
> in the original live update series:
>   https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
> 
> More succinctly, the memory region listeners already ran, and the vfio 
> callbacks created vfio memory regions.  Now we want to perform live update,
> and are in steady state, so no listeners are being called.  We need the
> flat section iterator to reproduce the same addresses and extents that were
> produced by the listeners, to make a state change on each distinct vfio
> memory region.

Okay it makes sense, thanks.

I think it'll be the same as one memory_listener_register() followed by an
unregister with region_add() hooked only, but maybe we should avoid
fiddling with the global list of listeners when possible.

If you plan to keep posting it separately, would you add some information
into the commit message?  With that enhanced, please feel free to add:

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


