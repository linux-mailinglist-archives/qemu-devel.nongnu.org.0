Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC357CF02
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:32:20 +0200 (CEST)
Received: from localhost ([::1]:46208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEY9y-0007Mq-Qt
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oEY7s-0005Kf-Ek
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oEY7p-0002KW-2p
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658417403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3fJ8+a/ZB0VQUhqCq5h/W2sVLmR/suq3GVBw8vJMoSU=;
 b=Gkou1qGT64S5b0ec4QCQJAgiJk8FUVGesYPg0+CF7B/y7rZiDDQSYN0DDT1yLqAxGKcIlc
 kWLv1/Qr8H1iXYTK8cCjleBUNfmTGQEaQ5Sud2Sq+n7vfQSVMdM+6C2sIyI1qMVMMn2yKA
 brI1q+w9P+2SKF36JauIyC8oBkRiDSs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-yDlB7Uk_NwG3EVqThHGrLg-1; Thu, 21 Jul 2022 11:30:01 -0400
X-MC-Unique: yDlB7Uk_NwG3EVqThHGrLg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p2-20020a05600c1d8200b003a3262d9c51so2946698wms.6
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 08:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3fJ8+a/ZB0VQUhqCq5h/W2sVLmR/suq3GVBw8vJMoSU=;
 b=DjLWqJMvFrVRz829gnqhuAQkplzjrSHNnpU+nEt2e5MBcs8Ez/PkVjXQ4xwuYZUkrw
 mJNSOy2zT7HENZHa1codwoAYPPBnQ18Gllqfyt0IbJISMR8mAgVgESLLuvhdOTO57qbG
 wqF+lMWzDBeOEi5fs4ZUcHFDzYPSWQq0pae5GmdW2Fyz3e042oX5sDTU3CQvDjV2+Hde
 OWpPeNdPKTwkiKakWR2ATL2pxnQdYkHWU3cpCdYkaaHNTSqF0rq3moJ2Uu3cf41xIxb7
 cSqwoHTcJDRFXN59CZRH6Dg3mgLcPk5P7cumDZ25r+DaY8JmoOPx2T3bwKoM7XRI/wAU
 Zthw==
X-Gm-Message-State: AJIora+Rc5UNtkSryYhYk5FlILywgiLpqiEeBNlPdA9bN9t3E1mnNYci
 I8kW4ednwQWnAQBlpg+HseA3pZ4qKbjM2gc5h6l6syM+10sxgxlJzADWdi5I/DO+LL5vTJ5g33D
 Da0mTuzMBpi5N6y4=
X-Received: by 2002:a7b:c04d:0:b0:3a2:f89d:5707 with SMTP id
 u13-20020a7bc04d000000b003a2f89d5707mr8974326wmc.1.1658417398396; 
 Thu, 21 Jul 2022 08:29:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5vvhXMHWEryZ5Wy5ANuYitr0fQhhLs3PZGfOBGMwsvyDLe7bstZRdkVE3r4f/T3mEr3Thdg==
X-Received: by 2002:a7b:c04d:0:b0:3a2:f89d:5707 with SMTP id
 u13-20020a7bc04d000000b003a2f89d5707mr8974304wmc.1.1658417398106; 
 Thu, 21 Jul 2022 08:29:58 -0700 (PDT)
Received: from redhat.com ([2.55.25.63]) by smtp.gmail.com with ESMTPSA id
 t3-20020a1c4603000000b003a2d87aea57sm6067164wma.10.2022.07.21.08.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:29:57 -0700 (PDT)
Date: Thu, 21 Jul 2022 11:29:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 0/4] Refactor x86_load_linux and pass RNG seed via
 setup_data entry
Message-ID: <20220721112637-mutt-send-email-mst@kernel.org>
References: <20220721122937.729959-1-pbonzini@redhat.com>
 <20220721105005-mutt-send-email-mst@kernel.org>
 <Ytlso2QIe5oU8toG@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ytlso2QIe5oU8toG@zx2c4.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Jul 21, 2022 at 05:11:31PM +0200, Jason A. Donenfeld wrote:
> Hi Michael,
> 
> On Thu, Jul 21, 2022 at 10:52:32AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Jul 21, 2022 at 02:29:33PM +0200, Paolo Bonzini wrote:
> > > As mentioned in the reviews of Jason's patches, the fw_cfg data, or at
> > > least its structure including the size, is part of the guest ABI and
> > > must match across two sides of migration.
> > > 
> > > It would be possible to handle this with some duplicated code between
> > > the rng seed and DTB handling, but the conditionals to handle the linked
> > > list would be ugly.  Unfortunately the code of x86_load_linux has no
> > > data structures available, it's all of a jumble of local variables.
> > > Hence the first two and largest patches in this series, which remove all
> > > non-Linux code from the function and move the local variables to a struct
> > > as necessary.  The function was long overdue for some cleanup anyway.
> > > 
> > > With this in place, adding the seed setup_data entry is just a
> > > couple lines of code, plus the scaffolding for a new machine property
> > > "linuxboot-seed".  The property supports on/off/auto values, where "auto"
> > > disables/enables depending on the kernel support for setup data (which was
> > > added in 2.6.26); "on" currently fails when starting with an old kernel,
> > > and probably it should also fail when starting a PVH or multiboot kernel.
> > > 
> > > Paolo
> > 
> > I like the refactoring
> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > To avoid creating extra work for Jason and confusing
> > attribution, maybe apply Jason's patch then your refactoring
> > on top?
> 
> Yes, I think it'd make sense to apply:
> https://lore.kernel.org/qemu-devel/20220721125636.446842-1-Jason@zx2c4.com/
> as-is, without any changes, since that handles your migration concerns.
>
> And then after, if you want to refactor things in general, apply that on
> top.
> 
> As I mentioned before, we really don't need nor want a user-facing
> option for this.

Yes I think we don't want to support such an option.
We have a general rule of prefixing properties with "x-" for this
these are considered unstable and we are often adding them for
internal purposes.

> What I do in that v7 there is sufficient and fine.
> 
> Michael - do you want to take that v7 into your tree?
> 
> Jason

Can be my tree or Paolo's but I'll wait for him to respond, I like consensus.

-- 
MST


