Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F9D584E91
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 12:17:50 +0200 (CEST)
Received: from localhost ([::1]:51504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHN41-0004WH-1g
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 06:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oHMzu-0002Gw-Du
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 06:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oHMzq-0003XR-6G
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 06:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659089608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oCOGn0PLgBkch74DaKSgBLSLI+a4lw9zHbFJ16QnIEA=;
 b=a4VQUK3GXDEBWmvQinB7BJ5Sq2jJA1qL0wvK0MoN1OmBB6WMv5v9EWdTNxj5rQv8LbfFSw
 +xTXnDs3PXc3m3LSOt1hNUOc2EtP3vggVs1vWY+KCest8TtHt993JXTYoAdQcxxv9bPQif
 +Yq4p8zxNdbCkTQHhrsLNc7e4HiGVz8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-nXDx_jdANdq7cNMV1FHFGQ-1; Fri, 29 Jul 2022 06:13:27 -0400
X-MC-Unique: nXDx_jdANdq7cNMV1FHFGQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 f13-20020a0564021e8d00b00437a2acb543so2649019edf.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 03:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=oCOGn0PLgBkch74DaKSgBLSLI+a4lw9zHbFJ16QnIEA=;
 b=kPC2rrLHfBxacYJVohArfQglhPvPw+ZL+k2pKy1Y8w11cbLOAig5kkC+YRo1Puq4Es
 BCucqfNS2PJRIlH1jNDG4QOKpAFMVuhB58WaUW89asV5EV8qa1cX2pm7dFFBOd7uO+OT
 boUJdKewd4J3nWdj37e+p4jYazR45Gaty/GR6ewsxvbPVkqFO3LpCel5ItrFL2DsrpOs
 QsuIVoHNOUcOkQ4Fdswoe74WTYP9VAfGS4JkK9xH5p4VZZOAEp9IRsltjcbpEQ07AYd8
 TF//R0gDS8ykbynxkMgQDMuqF1zREMM8HlAgMOwRscCjRcJ3PTnt6uOoGZOB8j+PvnJd
 KRIw==
X-Gm-Message-State: AJIora8NClsqmXHe54ypqgojTLgF12TCx+2K/2dDeWIlAlmUdTnOOW7K
 PQT8hVf0J7SyRr4T91lWyqnP1ipvCajpj0U7k45JSvT6dQyZXPXXi22vInZK+WezKDL+iFXXwe7
 HLC5TiF5UXXv6ctY=
X-Received: by 2002:a17:906:cc13:b0:72b:31d5:a899 with SMTP id
 ml19-20020a170906cc1300b0072b31d5a899mr2314942ejb.184.1659089606276; 
 Fri, 29 Jul 2022 03:13:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tRPZiE1P2+3r61wfRzWvloBffJ3+WEERhtlC6uGup4FvLVU0r/YTBPRl8lUtHe6SWlwgoqwA==
X-Received: by 2002:a17:906:cc13:b0:72b:31d5:a899 with SMTP id
 ml19-20020a170906cc1300b0072b31d5a899mr2314926ejb.184.1659089606056; 
 Fri, 29 Jul 2022 03:13:26 -0700 (PDT)
Received: from redhat.com ([2.54.183.236]) by smtp.gmail.com with ESMTPSA id
 t6-20020a1709064f0600b0072a66960843sm1487614eju.51.2022.07.29.03.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 03:13:25 -0700 (PDT)
Date: Fri, 29 Jul 2022 06:13:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel@redhat.com>
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
Message-ID: <20220729061221-mutt-send-email-mst@kernel.org>
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
 <20220727112737-mutt-send-email-mst@kernel.org>
 <CACGkMEt768mxHkcfEBK3EgA3sk979gckuQ-tWz1edX2HzVo73g@mail.gmail.com>
 <cde2074c-67bc-373f-c218-d9deaf84e5f0@suse.de>
 <8a8475c7-c720-1aef-02bb-ca4cb3c1ff68@suse.de>
 <20220728093501-mutt-send-email-mst@kernel.org>
 <be4dc741-4153-1620-223f-852ff5aa34a7@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be4dc741-4153-1620-223f-852ff5aa34a7@suse.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Fri, Jul 29, 2022 at 11:46:05AM +0200, Claudio Fontana wrote:
> >> @@ -2025,7 +2031,6 @@ void virtio_reset(void *opaque)
> >>      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> >>      int i;
> >>  
> >> -    virtio_set_status(vdev, 0);
> >>      if (current_cpu) {
> >>          /* Guest initiated reset */
> >>          vdev->device_endian = virtio_current_cpu_endian();
> >> -- 
> >> 2.26.2
> > 
> > As you say this is incomplete ... bout could you share a bit more
> > of what issue does this address?
> > 
> 
> Hi, the problem I am trying to address is a segfault in OVS/dpdk that looks like this:

Sorry I was not clear. What I mean is, you don't yet know why does removing
virtio_set_status call here prevent the crash in ovs, do you?

-- 
MST


