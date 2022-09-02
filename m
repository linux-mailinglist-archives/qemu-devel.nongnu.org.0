Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B645AA829
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 08:41:14 +0200 (CEST)
Received: from localhost ([::1]:44300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0Ma-0006jL-EN
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 02:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oU0Gn-0002W7-8p
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:35:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oU0Gj-0008Rs-T4
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yWS9iyryA8xlkFxtcc+dq5p3p67BtZeQdTh6Cr1MjxQ=;
 b=cr7EM+aXhZJnZC0+dhGSq+1rrN6pBSJYgvS/tjuvLn+yY1IJS31Aqsf0GTm4dfD9KRNCyu
 rKrn1HiCMi67gcyFJu2sNpsLWarTXbWP7hsAvI3QBlQG0EgscJv5lXLeA6i0AvoM0+wrCk
 K5enJYCFJ7fH/ERNuSbD0diorzdbBE0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-Ex8ES1TmM0Ko7dot1lhkvg-1; Fri, 02 Sep 2022 02:35:05 -0400
X-MC-Unique: Ex8ES1TmM0Ko7dot1lhkvg-1
Received: by mail-ej1-f69.google.com with SMTP id
 sb14-20020a1709076d8e00b0073d48a10e10so565823ejc.16
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 23:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=yWS9iyryA8xlkFxtcc+dq5p3p67BtZeQdTh6Cr1MjxQ=;
 b=jFpr3it1vPstfu8ZE2vCAdGMhB2eCvAPRSisQRdCSH/SVUmRpH0OoEKK88v6uBUMx/
 9tD0qksn5y1QQdxCJUjHqi1fadc9SuGKaMhugHHXvnbc49/2Q95Gwn/IJXlN+XeNWkf+
 rwZu4HyO6laum6kzquryGq0DxyI+z2COpOJ8lCA4mLm534drYsiBJ/AiFKgbOshKlpg2
 YGGA9p19VSGlgH582AOg2a7g+sjbKrVZGMj2FK4iIkx7URKwupkyIjcbLlt5+wICtZSf
 R+7bWJiAjmU1Ue9RYb5xF1yYO9w6caKGF979PldjqAi1CgvZl2jrkWeyIqGma9nIns67
 kNaQ==
X-Gm-Message-State: ACgBeo2qKFA0zGvSPvjqFryN8U9GDCiyW6fgK8XIowPk+6ZjuJD0/wy7
 KRMA0xVnFXMuk6Ne/egYrZANoojnkki5ahxLyaej20uiHogon/E913xVPYF8oVI36pLebrb1GUu
 1v11nwl+swHK/xY0=
X-Received: by 2002:a17:907:6091:b0:731:37fb:bd9 with SMTP id
 ht17-20020a170907609100b0073137fb0bd9mr25738481ejc.219.1662100504500; 
 Thu, 01 Sep 2022 23:35:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5AJH6A2uUVyWoNDSLQKHjWoU495ErlpPJhNeR17h6Wq/l0AmhjwX23XpZLKB+thgkQ1d2r1w==
X-Received: by 2002:a17:907:6091:b0:731:37fb:bd9 with SMTP id
 ht17-20020a170907609100b0073137fb0bd9mr25738464ejc.219.1662100504224; 
 Thu, 01 Sep 2022 23:35:04 -0700 (PDT)
Received: from redhat.com ([2.55.191.225]) by smtp.gmail.com with ESMTPSA id
 ds7-20020a0564021cc700b00445c0ab272fsm784424edb.29.2022.09.01.23.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 23:35:03 -0700 (PDT)
Date: Fri, 2 Sep 2022 02:35:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 0/2] expose host-phys-bits to guest
Message-ID: <20220902021628-mutt-send-email-mst@kernel.org>
References: <20220831125059.170032-1-kraxel@redhat.com>
 <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
 <20220901135810.6dicz4grhz7ye2u7@sirius.home.kraxel.org>
 <f7a56158-9920-e753-4d21-e1bcc3573e27@intel.com>
 <20220901161741.dadmguwv25sk4h6i@sirius.home.kraxel.org>
 <34be4132-53f4-8779-1ada-68aa554e0eac@intel.com>
 <20220902060720.xruqoxc2iuszkror@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902060720.xruqoxc2iuszkror@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Sep 02, 2022 at 08:07:20AM +0200, Gerd Hoffmann wrote:
> On Fri, Sep 02, 2022 at 08:10:00AM +0800, Xiaoyao Li wrote:
> > On 9/2/2022 12:17 AM, Gerd Hoffmann wrote:
> > > On Thu, Sep 01, 2022 at 10:36:19PM +0800, Xiaoyao Li wrote:
> > > > On 9/1/2022 9:58 PM, Gerd Hoffmann wrote:
> > > > 
> > > > > > Anyway, IMO, guest including guest firmware, should always consult from
> > > > > > CPUID leaf 0x80000008 for physical address length.
> > > > > 
> > > > > It simply can't for the reason outlined above.  Even if we fix qemu
> > > > > today that doesn't solve the problem for the firmware because we want
> > > > > backward compatibility with older qemu versions.  Thats why I want the
> > > > > extra bit which essentially says "CPUID leaf 0x80000008 actually works".
> > > > 
> > > > I don't understand how it backward compatible with older qemu version. Old
> > > > QEMU won't set the extra bit you introduced in this series, and all the
> > > > guest created with old QEMU will become untrusted on CPUID leaf 0x80000008 ?
> > > 
> > > Correct, on old qemu firmware will not trust CPUID leaf 0x80000008.
> > > That is not worse than the situation we have today, currently the
> > > firmware never trusts CPUID leaf 0x80000008.
> > > 
> > > So the patches will improves the situation for new qemu only, but I
> > > don't see a way around that.
> > > 
> > 
> > I see.
> > 
> > But IMHO, I don't think it's good that guest firmware workaround the issue
> > on its own. Instead, it's better to just trust CPUID leaf 0x80000008 and
> > fail if the given physical address length cannot be virtualized/supported.
> > 
> > It's just the bug of VMM to virtualize the physical address length. The
> > correction direction is to fix the bug not the workaround to hide the bug.
> 
> I'm starting to repeat myself. "just trust CPUID leaf 0x80000008"
> doesn't work because you simply can't with current qemu versions.
> 
> I don't like the dance with the new bit very much either, but I don't
> see a better way without massive fallout due to compatibility problems.
> I'm open to suggestions though.
> 
> take care,
>   Gerd


I feel there are three major sources of controversy here

0. the cover letter and subject don't do such a good job
   explaining that what we are doing is just telling guest
   CPUID is not broken. we are not exposing anything new
   and not exposing host capability to guest, for example,
   if cpuid phys address is smaller than host things also
   work fine.

1. really the naming.  We need to be more explicit that it's just a bugfix.

2. down the road we will want to switch the default when no PV. however,
   some hosts might still want conservative firmware for compatibility
   reasons, so I think we need a way to tell firmware
   "ignore phys address width in CPUID like you did in the past".
   let's add a flag for that?
   and if none are set firmware should print a warning, though I
   do not know how many people will see that. Maybe some ;)

along the lines of:

/*
 * Old KVM hosts often reported incorrect phys address width,
 * so firmware had to be very conservative in its use of physical
 * addresses. 
 * One of the two following flags should be set.
 * If none are set firmware is for now conservative, but that will
 * likely change in the future, hosts should not rely on that.
 */
/* 
/* KVM with non broken phys address width should set this flag
 * firmware will be allowed to use all phys address bits
 */
#define KVM_BUG_PHYS_ADDRESS_WIDTH_NONBROKEN 1
/*
 * Force firmware to be very conservative in its use of physical
 * addresses, ignoring phys address width in CPUID.
 * Helpful for migration between hosts with different capabilities.
 */
#define KVM_BUG_PHYS_ADDRESS_WIDTH_BROKEN 2

-- 
MST


