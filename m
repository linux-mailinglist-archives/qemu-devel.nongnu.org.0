Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40835E748B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 09:06:59 +0200 (CEST)
Received: from localhost ([::1]:53928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obcm1-0001lh-8e
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 03:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obc3E-0001pc-Dp
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obc3C-0007ww-MK
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663914034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b2wzGNWwr9+vHVudFSl6pnFjFAZJ1lw+Zy83r++UOds=;
 b=LXMMVCXACuAxVK4PvUsrkJ/HLRdZnVzDIn4Xwc9AXb/0ddzhkNCe5ZNmmjaDmbFujJAmMW
 wqXwlBRlccyIODCKsyUauJoEdO6T7TXQUds+jq/APc9v/tkpIqhLXvt+zGrORJxbOTa2h0
 YNIiPuguajsz7yueJie5GPQr3E1ZrOM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-oLoJLqGdMxuhwIm3hCliVw-1; Fri, 23 Sep 2022 02:20:31 -0400
X-MC-Unique: oLoJLqGdMxuhwIm3hCliVw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w17-20020a056402269100b0045249bc17a9so8087104edd.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 23:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=b2wzGNWwr9+vHVudFSl6pnFjFAZJ1lw+Zy83r++UOds=;
 b=2Skcmer+PW+qkZkrwa12d9iSnVFRzpuW8wCHPbQ9UqOmLuFcjINkCRSz8UbdLjnmZa
 8LH5vdVPmZfoxXpKzbXXMO6XrcFCFEIN+F/TKT3OIIa7Xov5ETwZ9R54AbvpvVFj3r/l
 11RMfmx2UMxHLaQmSdLQS0T9nbWIQS4Try48qvHGkLb1H+C6BTzjhpWRVMerclhaxVmi
 SHHOapMdK2AKQAbfrA7xn2ZSWdFpIq+aJj8Pr9cLG2BimXrlE/nOgrzEMwJ0qdKNe7C2
 LzWCS0SCvsQ9NAQ+DeqXtKCknOipUTEOrSbeFkQOgm3rJZ54e1PlAGifLSLmM2dHtj9j
 UJHw==
X-Gm-Message-State: ACrzQf0lY//vtcNtWslQCOQv8wJfS6gGsCczaLT+VeWCdNsQd6GwnjOB
 Ok1DlYm4/CKv2sD+RhBv49raej5fZ32d4JsDCMqSf2R6EbFv0CBgFITxIlC8sM/j9Rf7np0BxM/
 CMEYTyb5YOzaAAaY=
X-Received: by 2002:a17:907:60c9:b0:77f:be6d:d870 with SMTP id
 hv9-20020a17090760c900b0077fbe6dd870mr5696660ejc.348.1663914030429; 
 Thu, 22 Sep 2022 23:20:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7hcSOqqlHynXnT3g3GaPe/2g2zjuBjS9NbG9EBnJur6JVLfvFXxtSuE+AtLJ1GmTCKNAEfXQ==
X-Received: by 2002:a17:907:60c9:b0:77f:be6d:d870 with SMTP id
 hv9-20020a17090760c900b0077fbe6dd870mr5696655ejc.348.1663914030253; 
 Thu, 22 Sep 2022 23:20:30 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 mc23-20020a170906eb5700b0077e6be40e4asm3601605ejb.175.2022.09.22.23.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 23:20:29 -0700 (PDT)
Date: Fri, 23 Sep 2022 02:20:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "houyl@yusur.tech" <houyl@yusur.tech>
Cc: jasowang <jasowang@redhat.com>,
 "raphael.norwitz" <raphael.norwitz@nutanix.com>,
 kwolf <kwolf@redhat.com>, hreitz <hreitz@redhat.com>,
 qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, zy <zy@yusur.tech>,
 "lulu@redhat.com" <lulu@redhat.com>,
 =?utf-8?B?6ZmI5rWp?= <chenh@yusur.tech>
Subject: Re: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa
 device's mac address automatically
Message-ID: <20220923021957-mutt-send-email-mst@kernel.org>
References: <20220921060026.392164-1-chenh@yusur.tech>
 <BL3PR02MB79380882D0B877C2D5A754FFEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>
 <CACGkMEttGsDrFo_U7AKHEof0HwVfHaRTeQSRE+QTiRPPtnU3hQ@mail.gmail.com>
 <2022092311532239888519@yusur.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2022092311532239888519@yusur.tech>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Sep 23, 2022 at 11:53:22AM +0800, houyl@yusur.tech wrote:
> On Thu, 22 Sep 2022 09:34:41 +0800 Jason Wang<jasowang@redhat.com>  wrote:
> 
> 
>     >On Thu, Sep 22, 2022 at 1:58 AM Raphael Norwitz
>     ><raphael.norwitz@nutanix.com> wrote:
>     >>
>     >> If I read your response on the other thread correctly, this change is
>     intended
>     >>
>     >> to prioritize the MAC address exposed by DPDK over the one provided by
>     the
>     >>
>     >> QEMU command line? Sounds reasonable in principle, but I would get
>     confirmation
>     >>
>     >> from vDPA/vhost-net maintainers.
>      
>     >I think the best way is to (and it seems easier)
>      
>     >1) have the management layer to make sure the mac came from cli
>     >matches the underlayer vDPA
> 
>      Agreed, that's no problem.
> 
>     >2) having a sanity check and fail the device initialization if they don't
>     match
> 
>     However, one MAC address for integrity check is from the cli, and the other
>     MAC address is from the vDPA device, 
>     How to get it?
> 
>     The current situation is if MAC came from cli don't match the underlayer
>     vDPA, the virtual machine can still start without any hints.
> 
>     Thanks
> 
> 

Let me ask then, why are you supplying the incorrect MAC on the cli?

-- 
MST


