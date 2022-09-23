Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF675E8598
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 00:10:33 +0200 (CEST)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obqsT-0001Xp-31
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 18:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obqm0-0007jE-Q2
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 18:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obqlx-0001Vl-DS
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 18:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663970628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wrwbenxX2DAiwSdC5uoXGCVWUtN43yJHBYHLAF7d1Zw=;
 b=hBB5w7GI0+JrOAcw4fwJnSzx/pk8W/d6Wvc6DBFClwyoekVokm19bIsLM8DjFpawsZO1zi
 8z0rlcCREa2DgI47TXa0C3rCm041cXla2Nh9FYNFycd/XFFMmCoJwhI5GAVT8Emm9JgXkB
 KEq22jhVz7wPVM0+LTUxCZ7V85gI2bM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-r5FTGKcHMDKiu2XMfJGpGw-1; Fri, 23 Sep 2022 18:03:46 -0400
X-MC-Unique: r5FTGKcHMDKiu2XMfJGpGw-1
Received: by mail-qk1-f199.google.com with SMTP id
 bi3-20020a05620a318300b006cf2d389cdaso966088qkb.8
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 15:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=wrwbenxX2DAiwSdC5uoXGCVWUtN43yJHBYHLAF7d1Zw=;
 b=MnZ6KP7kLiWxu9SxYnC1HXj2ZnIK54DqQiiJEbt7hcDxBfCq0Z7DOlSEyIA4xaacWq
 wkSD69Sd8/NTjXW2X9EUqOB9m2rOhlxmxOpJ7XLJNMs9uedF5WHRhOugtajd7M8YgpcP
 anAmObK/NllASneOafeHAgBd2BJdD5eeiNPnWodFS3ckc2/3YnlPHKt0QmKkAK93vLrW
 Rrgc02VyaHMpxjt6+meIWekN4SiDnyA0LrR7213iwk/O9P8fuWq6qFPeJAGFPXORlOUE
 MyuEFtnjoTeEJ8/XMevwev4jhSQj4Canfer2UoE5py1IZn/7CLE0tkxPh/kHZdZCeN3I
 U/dg==
X-Gm-Message-State: ACrzQf2g+pENXNz5FGlF2oO5euAlL4k4cnHx4Ke5Ti0HJ2SNFsJow8wB
 r7nRsEJiQcrc4pmCp5rrD6pvZ5hvgfT0tkVuL8C6X17hNPQ46vmUdhP361eDpkzC6uQ7Wst/Mc0
 X9EiHFYyyo4jr39Q=
X-Received: by 2002:a37:9a51:0:b0:6cf:427b:c180 with SMTP id
 c78-20020a379a51000000b006cf427bc180mr6967141qke.767.1663970626480; 
 Fri, 23 Sep 2022 15:03:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4VO7ikKfaa5MJlgqd6EhxzHxOfeq6TWAGeafKwTwUj+N2zy3X8JjxCOc1tf7273EksZzpE2g==
X-Received: by 2002:a37:9a51:0:b0:6cf:427b:c180 with SMTP id
 c78-20020a379a51000000b006cf427bc180mr6967129qke.767.1663970626279; 
 Fri, 23 Sep 2022 15:03:46 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 bv12-20020a05622a0a0c00b0035d0daff6fasm5125593qtb.91.2022.09.23.15.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 15:03:45 -0700 (PDT)
Date: Fri, 23 Sep 2022 18:03:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Message-ID: <Yy4tQAeOUd49DpX6@x1n>
References: <20220921161227.57259-1-peterx@redhat.com>
 <20220922154617.57d1a1fb@redhat.com> <YyyP4b2uKghi1EHL@xz-m1.local>
 <20220923102034.6579b66c@redhat.com>
 <20220923104159.39576159@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220923104159.39576159@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 23, 2022 at 10:41:59AM +0200, Igor Mammedov wrote:
> It's worth putting history excavation with explanation what is broken and why
> compat stuff is being ignored in the patch.

Makes sense, I'll amend the commit message and repost.  Thanks,

-- 
Peter Xu


