Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897B65527B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 16:55:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8kNy-0003BP-OO; Fri, 23 Dec 2022 10:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p8kNt-0003BC-CJ
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:54:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p8kNm-0003pD-PZ
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671810888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QV57DFJfmWpV/GBAu8KLo+R4fDMx/4z8FEnVOOnStAU=;
 b=RJs8PN+e3OTK/5/UOk6+IgQTbP0hWloZi9YUf6BmddK7h+sAKPB6PX9y+D4KG2U7QjX2BO
 F+q122cGHBuW3HbiLXOW0x/H1rBWbQqqpNh8Vj+Qsa+ZxwZHlD15vcv/13YjoYPCbzudxJ
 0mEX48WAGqeXmuyqkUuYTkz6ny1nVck=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-292-SO9XykFuOfeNz2xD9WpESg-1; Fri, 23 Dec 2022 10:54:47 -0500
X-MC-Unique: SO9XykFuOfeNz2xD9WpESg-1
Received: by mail-qk1-f198.google.com with SMTP id
 br6-20020a05620a460600b007021e1a5c48so3380256qkb.6
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 07:54:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QV57DFJfmWpV/GBAu8KLo+R4fDMx/4z8FEnVOOnStAU=;
 b=47q8XM9OI7wZnORbUbVHyrNFDY0jfnFYXSMEJfPSFlsvOKT/aqbKvMf7e2ymZhceTJ
 Dt6XO90FBKFXYnQX+GgkSMfYq60ZYG8dukrBaS2gu4jIGWTXLsmhKelSDDem91KCp+OK
 bxTtHWBx2FdvoxgWx3Y3UZpajgcWLVtLqK/4LNi3WELxn2E/4HCAT55SMhrsfLUj+sVR
 ouqQ5/rV8UjZWOHHoL/StqO8SUNlBaIVVF3+Z09wwNuX2Z1tFI1xNu1xWuAIPdekDhFK
 q2IJiHlzf5xY6TpIZbERt1lvr4OEmcvtbtV3tMRUVK5j2VzDTByLXlVXkFF4RzchW/Om
 01Gw==
X-Gm-Message-State: AFqh2koXX0jEGlSV9lpaz+2ouBbuuLutfTfs7OEJiXH/xJstLcrmAKw2
 nizOfXbo7EPbouwR1pywk+fY/r13JeqkME5v/w0Mtqm4eW5xOYABNuuQdPMQcfTNb3e3gluwE1x
 S3kpFgwD6gga5fIQ=
X-Received: by 2002:ac8:7409:0:b0:3a9:6b35:e7aa with SMTP id
 p9-20020ac87409000000b003a96b35e7aamr12358103qtq.51.1671810886779; 
 Fri, 23 Dec 2022 07:54:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsQzt7Ss3MsEZbLaOYSV04ZM/L73EAF4rhxVReydCvJKoi0Gk6YgGMCR9HIsmE9mZg9FbpmOw==
X-Received: by 2002:ac8:7409:0:b0:3a9:6b35:e7aa with SMTP id
 p9-20020ac87409000000b003a96b35e7aamr12358079qtq.51.1671810886544; 
 Fri, 23 Dec 2022 07:54:46 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 c25-20020a05620a269900b006fca1691425sm2508647qkp.63.2022.12.23.07.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 07:54:45 -0800 (PST)
Date: Fri, 23 Dec 2022 10:54:44 -0500
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Chuang Xu <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, quintela@redhat.com, david@redhat.com,
 philmd@linaro.org, zhouyibo@bytedance.com
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
Message-ID: <Y6XPRD4fSucgWZfT@x1n>
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
 <05c4cb9e-0f41-c60f-6a68-cf5050ad7a02@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <05c4cb9e-0f41-c60f-6a68-cf5050ad7a02@redhat.com>
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

Hi, Paolo,

On Fri, Dec 23, 2022 at 04:47:57PM +0100, Paolo Bonzini wrote:
> On 12/23/22 15:23, Chuang Xu wrote:
> >   static inline FlatView *address_space_to_flatview(AddressSpace *as)
> >   {
> > +    /*
> > +     * Before using any flatview, sanity check we're not during a memory
> > +     * region transaction or the map can be invalid.  Note that this can
> > +     * also be called during commit phase of memory transaction, but that
> > +     * should also only happen when the depth decreases to 0 first.
> > +     */
> > +    assert(memory_region_transaction_get_depth() == 0 || rcu_read_locked());
> >       return qatomic_rcu_read(&as->current_map);
> >   }
> 
> This is not valid because the transaction could happen in *another* thread.
> In that case memory_region_transaction_depth() will be > 0, but RCU is
> needed.

Do you mean the code is wrong, or the comment?  Note that the code has
checked rcu_read_locked() where introduced in patch 1, but maybe something
else was missed?

Thanks,

-- 
Peter Xu


