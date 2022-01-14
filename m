Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0DC48EFB8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:17:06 +0100 (CET)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8R8L-0000kP-6Y
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:17:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n8Qzf-00078z-2e
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:08:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n8Qzd-0000RB-IH
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642183685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PKmBa5wLGhwaMLWeL2D75DNgZV3IlEndv1DtQvRkcmc=;
 b=SxtkW4sPujLtRcfM54vKxtFAEzOm8KxKm4Rtmf7NLXmagquCOSKiPEAmbbmwXH3CeixYJH
 mHj9NMZEFaW+oP1LYNk4N2CGyTEF+zII0bbXP2wxAdSeHMloW20TQSCHlKcchZ4u9OAnbw
 kONjo/D9Zv1eRPJjuZQlmDtRHjEDCgc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-l64Pg5_xNIGgw0inKG5zbA-1; Fri, 14 Jan 2022 13:08:03 -0500
X-MC-Unique: l64Pg5_xNIGgw0inKG5zbA-1
Received: by mail-wm1-f70.google.com with SMTP id
 c188-20020a1c35c5000000b00346a2160ea8so2628997wma.9
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 10:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PKmBa5wLGhwaMLWeL2D75DNgZV3IlEndv1DtQvRkcmc=;
 b=I3YklnwcHSapLrvZBBl958e6pBK1AneOXKlvdp8gmNsJaSkHni25tW2TfpX7wYTkB9
 v8+2VyZ8m8zngTHl7FLy/DaGW9ytYC5JxLfwqnHZZvnmzeqpYd1Hy6cvtZRWD0eHVoGi
 FvaruAB1qav48ZgdvxLclqcz0eEPE/pt6Tp3zmawVIh1ChlGrACXwwnKtP5N1B4JNHxW
 tZYPFhgqLQFBpOULIiIjd+Dncmn14sDj9u/s/Rl5sfoIjukGBVoKXo1N0Tg51oOMxcwd
 FeAkhkf/8ybiO2jckddSnKbt/4lynF2KEI74K7qL3dRZTW7UNPcXBsyUeZTJyM15oofB
 oGeg==
X-Gm-Message-State: AOAM533ngmTIkGvG4buzp+J52NWQriYSkKlE4aN5VUK2yNaCGqj4LpxI
 nXnbU3wR0zQdPn0SVDpUVudS4BlXafoMmpuyIWxo7xxvx20FhM0w31UrXf/8KyT7LreK2VGneJN
 hlJYmt2jZmQywGX0=
X-Received: by 2002:adf:d1ed:: with SMTP id g13mr2847180wrd.719.1642183682428; 
 Fri, 14 Jan 2022 10:08:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1eWig6KKgnSCux1ffZgqalawaZ5P35jHEOQeltJIDMMLfnH1WQM/5OiBRxatMsd4XL1hzRg==
X-Received: by 2002:adf:d1ed:: with SMTP id g13mr2847169wrd.719.1642183682206; 
 Fri, 14 Jan 2022 10:08:02 -0800 (PST)
Received: from redhat.com ([2.55.154.210])
 by smtp.gmail.com with ESMTPSA id u16sm5997785wrn.24.2022.01.14.10.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:08:01 -0800 (PST)
Date: Fri, 14 Jan 2022 13:07:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220114130741-mutt-send-email-mst@kernel.org>
References: <20220113165131.1057714-1-pasic@linux.ibm.com>
 <20220113115617-mutt-send-email-mst@kernel.org>
 <20220113205452.4443ee4e.pasic@linux.ibm.com>
 <20220114170556.3859488d.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220114170556.3859488d.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 05:05:56PM +0100, Halil Pasic wrote:
> On Thu, 13 Jan 2022 20:54:52 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > > > This is the very reason for which commit 7ef7e6e3b ("vhost: correctly
> > > > turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
> > > > form the vhost device that does not need it, because on the vhost
> > > > interface it only means "I/O address translation is needed".
> > > > 
> > > > This patch takes inspiration from 7ef7e6e3b ("vhost: correctly turn on
> > > > VIRTIO_F_IOMMU_PLATFORM"),    
> > > 
> > > Strange, I could not find this commit. Did you mean f7ef7e6e3b?
> > >   
> > 
> > Right! Copy-paste error.
> > 
> > 
> 
> Should I spin a v2 to correct this?
> 
> 
> Sorry for the hunk below. I wanted to post the  whole patch in question,
> then deleted it, but left some leftovers. Another copy-paste error. Grrr

Yes pls.

> >  
> >  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
> > @@ -765,6 +772,9 @@ static int vhost_dev_set_features(struct vhost_dev *dev,
> >      if (enable_log) {
> >          features |= 0x1ULL << VHOST_F_LOG_ALL;
> >      }
> > +    if (!vhost_dev_has_iommu(dev)) {
> > +        features &= ~(0x1ULL << VIRTIO_F_IOMMU_PLATFORM);
> > +    }
> >      r = dev->vhost_ops->vhost_set_features(dev, features);
> >      if (r < 0) {
> >          VHOST_OPS_DEBUG("vhost_set_features failed");
> > 
> > > > and uses the same condition for detecting the


