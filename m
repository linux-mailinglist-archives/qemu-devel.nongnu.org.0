Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E5566355B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 00:35:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF1fr-0006V8-7n; Mon, 09 Jan 2023 18:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pF1fp-0006QI-Ao
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 18:35:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pF1fn-0005lN-KU
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 18:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673307323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uCQhuqCyYYrUwYidZOjnRFW4Stp0dkql6Y3/FGUFmkM=;
 b=eifz0V98wZjFoHIKZt/cOd7cMh8FjXNCD14ijfFm6XNhr5Ja3A3+IsyFWge5clVHheTWYN
 BV1kHpbT3fCs1dq/kE+PrTw3xNFLWxGiGDj0R4Q3/jC/1adRGXaj69o+BAHFxU5id/iGEt
 4Qny/cetFObW9SjCcuqxCzlwLFN7zNE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-KLLpLPO0M_2q4Cbxq7tf2g-1; Mon, 09 Jan 2023 18:35:22 -0500
X-MC-Unique: KLLpLPO0M_2q4Cbxq7tf2g-1
Received: by mail-qv1-f72.google.com with SMTP id
 i7-20020a056214020700b004ffce246a2bso6005463qvt.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 15:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCQhuqCyYYrUwYidZOjnRFW4Stp0dkql6Y3/FGUFmkM=;
 b=8K1kzqBFJF9rCSsNHf8GukhCf4oQTwb7+LtSWWkgjgs00M0sMyBENrMO8mDc4KIsFk
 4xo+89SWIvVHg4zhRaPZ6pH3qRXkGc/Ot9RDaHljLdHyWAkzmn+Bkyqa0ZxJ6fKSZMRU
 7DzlbSle7f7/xg8Qs42A49/ob+kRXhxHJVkx/792CDnxNzDB8jOdkddCLUfExtjWNa9O
 Jq9V0q9c9I5NH7eSQSGpiZ7orKo3CR/ryT4dNLx0mKGachA56I2CCMwwLbEG0HQP56fb
 1zABoOGGqQXkifYCkOfF7pdshOPBJbtQFNIywn1Ym4wZKqj1UFqqPpMnXurBhXMCMnuz
 E9Rg==
X-Gm-Message-State: AFqh2kq68sDLDwJvQjZJVmlAj1rj66dgNKNbcpoez+gPQKV69VEZm6M3
 8sqcjcNsAGei0PsjaunT/u0w5u4l4AT/Q+fac5D5mczuhG0mRwi7berfH1FledRZPDv0Ofu28Ro
 eWJfc0RJwyWQz6R8=
X-Received: by 2002:ac8:5e06:0:b0:3ab:5bb4:ae6d with SMTP id
 h6-20020ac85e06000000b003ab5bb4ae6dmr121013950qtx.43.1673307321688; 
 Mon, 09 Jan 2023 15:35:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsxRfx2SIl26nDoOzTKTEQ+9/jl7hcSlDyR1SFYdSQ4Zm7h7aG56hVi/f4qStCQE9iwRXD6Ow==
X-Received: by 2002:ac8:5e06:0:b0:3ab:5bb4:ae6d with SMTP id
 h6-20020ac85e06000000b003ab5bb4ae6dmr121013936qtx.43.1673307321427; 
 Mon, 09 Jan 2023 15:35:21 -0800 (PST)
Received: from redhat.com ([191.101.160.154]) by smtp.gmail.com with ESMTPSA id
 bp37-20020a05620a45a500b006e99290e83fsm6136992qkb.107.2023.01.09.15.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:35:20 -0800 (PST)
Date: Mon, 9 Jan 2023 18:35:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230109183413-mutt-send-email-mst@kernel.org>
References: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz.ref@aol.com>
 <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com>
 <20230109172738-mutt-send-email-mst@kernel.org>
 <8c2531a8-ce99-7593-99f8-222076fe6bd6@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c2531a8-ce99-7593-99f8-222076fe6bd6@aol.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Jan 09, 2023 at 06:28:44PM -0500, Chuck Zmudzinski wrote:
> On 1/9/23 5:33 PM, Michael S. Tsirkin wrote:
> > On Mon, Jan 09, 2023 at 04:55:42PM -0500, Chuck Zmudzinski wrote:
> >> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> >> as noted in docs/igd-assign.txt in the Qemu source code.
> >> 
> >> Currently, when the xl toolstack is used to configure a Xen HVM guest with
> >> Intel IGD passthrough to the guest with the Qemu upstream device model,
> >> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> >> a different slot. This problem often prevents the guest from booting.
> >> 
> >> The only available workaround is not good: Configure Xen HVM guests to use
> >> the old and no longer maintained Qemu traditional device model available
> >> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> >> 
> >> To implement this feature in the Qemu upstream device model for Xen HVM
> >> guests, introduce the following new functions, types, and macros:
> >> 
> >> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> >> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> >> * typedef XenPTQdevRealize function pointer
> >> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> >> * xen_igd_reserve_slot and xen_igd_clear_slot functions
> >> 
> >> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> >> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> >> the xl toolstack with the gfx_passthru option enabled, which sets the
> >> igd-passthru=on option to Qemu for the Xen HVM machine type.
> > 
> > I don't like how slot_reserved_mask is set initially then cleared on
> > device realize.
> > To me this looks like a fragile hack. I suggest one of the following
> > 1. adding a new mask
> > "slot-manual-mask" or some such blocking auto-allocation of a given
> > slot without blocking its use if address is specified on command line.
> > 2. adding a special property that overrides slot_reserved_mask
> > for a given device.
> > 
> > both need changes in pci core but look like something generally
> > useful.
> 
> I was hoping to not need to touch pci core but I understand it would be
> better for this patch to not affect machines that are manually configured
> on the command line.
> 
> However, keep in mind that this patch will only actually reserve the slot
> initially for xen hvm machines (machine type "xenfv") that also are configured
> with the qemu igd-passthru=on option which, AFAIK, only applies to machines
> witn accel=xen. It will not affect kvm users at all. So I don't think this patch
> will break many machines out there that manually specify the pci slots. The
> only machines it could affect are machines configured for igd-passthru on xen.
> This patch also does *not* reserve the slot initially for "xenfv" machines that
> are not configured with igd passthrough which I am sure is the vast majority
> of all the xen virtual machines out in the wild.

I'm just saying that adding a capability that is generally useful
as opposed to xen specific means less technical debt.

-- 
MST


