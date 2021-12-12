Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5424D471982
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 10:39:26 +0100 (CET)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwLKH-00048l-0t
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 04:39:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwLIT-0003C9-97
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 04:37:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwLIQ-0005Nu-Fg
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 04:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639301848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C5CcDN70LFB6pL7uVn3T1x/Gq7ktgEmbAV5uLU2VFGI=;
 b=D07ViDEtSXP/BV9SA5lHTzG3TmxX4tri7z6hnaqKKkrdXzS4HDew1lKnqk3H6VGFBm0lra
 TY0UqLsfZ3GQahAAKCYuVe+7nAZ4ooMQ7Dn9i0lQpZuseWW1hGz2F2fuK0pfrZVlU228Wg
 gYbaaVln/EQZNf/ytz/d9rPiZWN1CEk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-Av-1IbdpO--V3SO5Rlllbw-1; Sun, 12 Dec 2021 04:37:25 -0500
X-MC-Unique: Av-1IbdpO--V3SO5Rlllbw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so7938809wmj.7
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 01:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C5CcDN70LFB6pL7uVn3T1x/Gq7ktgEmbAV5uLU2VFGI=;
 b=W1UsfOKSi9sfJ8TEvJi3DF6oJX2DYUYrRl48dLdwMyNCcUGo1LhlYAfz5MVN5lRIMX
 b0WO4l3fKfUeEqJV69bCPvw/W6TfIZwTuxgjyjiW1dFWQ40d83Lk0tSF2EIKzAkPp+S3
 aX2i27y3B8y5CQpCdwz/a4UfdkC6wftOWRwg7Eh2zFJRFy9tqlPx8ZYiPHR2hfcWwp4t
 qAIzqunA6qsuNolgs6j680NOlnE/RrwdGSlRp+UqoWhUBatrwg0dqnSc9F7kFUfkKwt/
 Jsxu+Sx8pJUbALxaHV+kgmoxgV90iSLpX0RskBNWKDAyMDpOtfwJsbnN2hXFR9ml744s
 KQhA==
X-Gm-Message-State: AOAM532oWyJBR64apSSkPSJ/ZVYUpY4SdMW6Xc/+i3uYpvus4+klA9X0
 dTHa5WZgbT6gGOw9ctfFLo8x6GGvQSg5k9lYCEXYPqQWNaul34OOGETKKbRwiX4uwbEsdTlZTCk
 zSUmc/vvMSegutEY=
X-Received: by 2002:a5d:588b:: with SMTP id n11mr24819431wrf.344.1639301844701; 
 Sun, 12 Dec 2021 01:37:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2/9sMOYq648R5HOBtHhSF8lXi9dvRKbFnZh3DJLBo7FsxC5IG3wBcyriiPo5JB2y+ngOCtQ==
X-Received: by 2002:a5d:588b:: with SMTP id n11mr24819419wrf.344.1639301844468; 
 Sun, 12 Dec 2021 01:37:24 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:eefb:294:6ac8:eff6:22df])
 by smtp.gmail.com with ESMTPSA id l1sm7045633wrn.15.2021.12.12.01.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 01:37:23 -0800 (PST)
Date: Sun, 12 Dec 2021 04:37:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 5/8] standard-headers: Add virtio_video.h
Message-ID: <20211212043343-mutt-send-email-mst@kernel.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-6-peter.griffin@linaro.org>
 <20211210055537-mutt-send-email-mst@kernel.org>
 <20211210130946.GB382594@xps15-9570.lan>
MIME-Version: 1.0
In-Reply-To: <20211210130946.GB382594@xps15-9570.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 01:09:46PM +0000, Peter Griffin wrote:
> Hi Michael,
> 
> On Fri, 10 Dec 2021, Michael S. Tsirkin wrote:
> 
> > On Thu, Dec 09, 2021 at 02:55:58PM +0000, Peter Griffin wrote:
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  include/standard-headers/linux/virtio_video.h | 483 ++++++++++++++++++
> > >  1 file changed, 483 insertions(+)
> > >  create mode 100644 include/standard-headers/linux/virtio_video.h
> > 
> > We generally inherit these files from Linux.
> > Was the driver posted for inclusion in Linux?
> 
> Thanks for reviewing. Yes the Linux virtio-video frontend driver was posted
> sometime back on the linux-media ML [1].
> 
> One piece of pushback then was not supporting vicodec/FWHT and also no Qemu
> support [2] which is what this series is trying to address.
> 
> The virtio-video spec however is now at rfc v5. So my rough plan was now I have
> something working with Qemu and vicodec I can move both the frontend driver
> and the vhost-user-video to latest v5 spec.
> 
> I'm a bit unclear what the process is to get the virtio-video spec merged though.
> I think I read somewhere they expect a matching frontend driver implementation?
> 
> Thanks,
> 
> Peter.

No, just that it all looks on track to be merged, and got some acks from
Linux driver maintainers. This is because we don't have experts in
all fields on the TC, so input from linux maintainers is useful.

To get a change into spec the TC needs to vote
on it. The simplest way to do that is described here.

https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues


> [1] https://patchwork.kernel.org/project/linux-media/cover/20200218202753.652093-1-dmitry.sepp@opensynergy.com/
> [2] https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg02204.html


