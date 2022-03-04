Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3D4CCFC1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 09:13:53 +0100 (CET)
Received: from localhost ([::1]:52316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ34R-0007QH-Eh
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 03:13:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ32s-0006hj-BJ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 03:12:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ32o-00015X-Qb
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 03:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646381529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fESpYZZsL3Pl6l5cjBNppieTTwwM1n7BLy9MlDUP6GM=;
 b=cmViGyBHmydEz/LOenMpQQJlbByPN/Y97Od3ghmdtkPa7HWFxqfo0vUPx9tSPOUF6uw6I2
 ooFUfF1lMiZeMt+6rQoib/6kfV79GJHpZzTPFHwKesPyLlBmrgLsDG354pml5/wBUv1Mim
 dEf09mqAbjufdLQWFadrpz4egLZUg1E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-Ag4A0GzqPxylyBOHUutyXQ-1; Fri, 04 Mar 2022 03:12:08 -0500
X-MC-Unique: Ag4A0GzqPxylyBOHUutyXQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c126-20020a1c3584000000b00380dee8a62cso340504wma.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 00:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fESpYZZsL3Pl6l5cjBNppieTTwwM1n7BLy9MlDUP6GM=;
 b=vRRZwlI9fIRfjpnkVOkct3VqRWt0aorVMDkIdRg1A71i9nD4Umz0LOwoixVNymelkO
 doDk5VyjhBj8bGxgx/RCEs0fHieXJF9XsQV5G68AIfrol7A/X03k7xwxHGaZ6UyIqQFE
 CHG6p/R7/INzVMXM0Nzn444c2vApQCphAnd4xD6edC+goH31AHBWTzgsRafNTGwfH+Pe
 Dlhl4avLjxWXcRa6GPx3EW26Lj2LvPiOTZ5Q5IN8ObQ00ag/LQEM/KGBwXUvLicYP10o
 32P2Qtwcm7feowZwlxUTvwwKb4YlYk5sBHQ5+m0UK4Ry5yIw0vvYsFAaA7zLr06eLSGP
 nY3Q==
X-Gm-Message-State: AOAM532VmYmnU2Xyo59Bcvx5JDruagRQFWwYKMpson9FjHJjYZwwaVtX
 q/7MQ0s+cE+DNS918GTrX+RET6NgVGQqPnKXTy3xvJGx+a+69FjrIpIxGrG1ZysKxlDQX2s5Q1U
 TakhEX4yDXSCYxCQ=
X-Received: by 2002:a5d:6c61:0:b0:1f0:436b:ebbe with SMTP id
 r1-20020a5d6c61000000b001f0436bebbemr7884278wrz.651.1646381527176; 
 Fri, 04 Mar 2022 00:12:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwauLiMmWLJEdbrV2/vIVMnoDWswhUN6FVeya6DCuFqmSMP60h5GZk39gIj9FQwAitRF5zO8g==
X-Received: by 2002:a5d:6c61:0:b0:1f0:436b:ebbe with SMTP id
 r1-20020a5d6c61000000b001f0436bebbemr7884266wrz.651.1646381526937; 
 Fri, 04 Mar 2022 00:12:06 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c228700b00389865c646dsm493026wmf.14.2022.03.04.00.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 00:12:06 -0800 (PST)
Date: Fri, 4 Mar 2022 03:12:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Message-ID: <20220304031142-mutt-send-email-mst@kernel.org>
References: <20220209124534.1206993-1-pasic@linux.ibm.com>
 <87leykt0k7.fsf@redhat.com>
 <20220209212750.25ddcebe.pasic@linux.ibm.com>
 <87fsort5a6.fsf@redhat.com>
 <20220210113258.1e90af05.pasic@linux.ibm.com>
 <877da3t1du.fsf@redhat.com>
 <20220210142929.668a1f3d.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220210142929.668a1f3d.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 02:29:29PM +0100, Halil Pasic wrote:
> On Thu, 10 Feb 2022 12:19:25 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> [..]
> > 
> > Nope, that's not my problem. We make sure that the bit is persistent, we
> > fail realization if the bit got removed by the callback when required,
> > and we fail feature validation if the driver removes the bit, which is
> > in a different code path. We should not talk about FEATURES_OK in this
> > code.
> 
> I agree. I changed my mind. Expanation follows...
> 
> > 
> > We force-add the bit, and then still might fail realization. The
> > important condition is the has_iommu one, not the checks later on. I
> > find it very confusing to talk about what a potential driver might do in
> > that context.
> > 
> 
> I assumed stuff like virtiofs+SE regressed with commit 04ceb61a40
> ("virtio: Fail if iommu_platform is requested, but unsupported") but I
> think, I was wrong. It didn't work before that, because we did not
> present ACCESS_PLATFORM to the guest. I operated under the assumption
> that virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM)
> does not impact the set of features offered to the driver by the device,
> but it does.
> 
> So we need both this patch and "[PATCH v5 1/1] virtio: fix the condition
> for iommu_platform not supported" to get virtiofs to work with SE/SEV/Secure VM.
> 
> I have to admit I only tested for the error message, and not with a full
> SE setup.
> 
> I agree my comment was inadequate. Can we use
> 
> /* make sure that the device did not drop a required IOMMU_PLATFORM */
> 
> I will think some more though. This is again about the dual nature
> of ACCESS_PLATFORM...

Were you going to post a new version of this patch?

> > What about moving the virtio_add_feature() after the if
> > (klass->get_dma_as) check, and adding a comment
> > 
> > /* we want to always force IOMMU_PLATFORM here */
> > 
> > [I'll withdraw from this discussion for now, I fear I might just add
> > confusion.]
> > 
> > 


