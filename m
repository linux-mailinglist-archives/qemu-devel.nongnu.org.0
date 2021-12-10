Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D146FF44
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 12:00:16 +0100 (CET)
Received: from localhost ([::1]:40830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvddQ-0001SF-29
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 06:00:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mvdbv-0000nk-RI
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:58:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mvdbt-0002YL-L2
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639133921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=53dIXckbaJZrYGYZrX7UwXv//kt6AtUqttNtD9SWUP0=;
 b=hdaBgNLHClh5Cwk/erIG+lZmEeLDOHAeNolgZ4YJhgUAcz4jFAkfPKzbWXR9zALB13FgNu
 vk6scuQeV+dF9jh71au0usEac/RAkxbxhKPoKV9EQj10z6Q5ah3TDY+zUZ+n6KVOU0uXLY
 wT/cmBYZoEWF0NlvAo88MyUUkvx1iqg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-zb91KC9NOFeLuHVoYnFbsA-1; Fri, 10 Dec 2021 05:58:38 -0500
X-MC-Unique: zb91KC9NOFeLuHVoYnFbsA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so6477804wmd.9
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 02:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=53dIXckbaJZrYGYZrX7UwXv//kt6AtUqttNtD9SWUP0=;
 b=6s9nudXDQbAtX2oo4pXQ9nJMI3Ki1Qe3l81PN1OrAPHalnRCGLwdXGThbppsSTuvtn
 ZijUCC4wvjcatqZmKOUze2/nlI86DbM7hhP2HsFqVLBixgrJsrvI3j2Ztc2d2eOqD1Z8
 /ulv9twm29j+GdxdQfhYow66UheNgFNT8Z8ZJiC5q4MwcQDa3ORgoJSHKicQs99L9dF3
 2MmRgfl4Nj1r4TF57AKTX4uIGnkSoVF8cardeNeMvmOefRajjFIonVj0vfvOeaGhZKoT
 ADBK2C3cxHEUL/H09EjVNH4i33/F3PJYqCVyf3RyKv/Aop7qsB5pm2AMyzbZdoZp+dN2
 cFOg==
X-Gm-Message-State: AOAM533QZVLlrue5gii8o4RW5EO9g6nxrS/jj3rh8VapoTaXnPBjYuAc
 lGLZfEiY72xulThKSQxx0a7f+6orE5AWUqLtfKt0zRG3rjZ7RID5ATjX49CYPUZGxOpimw+wmGE
 4GAieGiOo1xwtaRg=
X-Received: by 2002:a05:600c:1d0e:: with SMTP id
 l14mr15247477wms.64.1639133917680; 
 Fri, 10 Dec 2021 02:58:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1Kgjq31zo64gShMSh/XKGT8wTzfz5h5SamV3ccJ99d9Dsb6kkKPRnuR5Cz8xCuUhd0kIk/Q==
X-Received: by 2002:a05:600c:1d0e:: with SMTP id
 l14mr15247449wms.64.1639133917464; 
 Fri, 10 Dec 2021 02:58:37 -0800 (PST)
Received: from redhat.com ([2.55.18.120])
 by smtp.gmail.com with ESMTPSA id s22sm2997944wmc.1.2021.12.10.02.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 02:58:36 -0800 (PST)
Date: Fri, 10 Dec 2021 05:58:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 6/8] virtio_video: Add Fast Walsh-Hadamard Transform format
Message-ID: <20211210055809-mutt-send-email-mst@kernel.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-7-peter.griffin@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211209145601.331477-7-peter.griffin@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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

On Thu, Dec 09, 2021 at 02:55:59PM +0000, Peter Griffin wrote:
> Linux vicodec (Virtual Codec) test driver in Linux implements
> FWHT. FWHT was designed to be fast and simple and to have
> characteristics of other video codecs and therefore face similar
> issues [1].
> 
> https://en.wikipedia.org/wiki/Fast_Walsh%E2%80%93Hadamard_transform
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  include/standard-headers/linux/virtio_video.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/standard-headers/linux/virtio_video.h b/include/standard-headers/linux/virtio_video.h
> index 16b5f642a9..3b517d50c4 100644
> --- a/include/standard-headers/linux/virtio_video.h
> +++ b/include/standard-headers/linux/virtio_video.h
> @@ -75,6 +75,7 @@ enum virtio_video_format {
>  	VIRTIO_VIDEO_FORMAT_HEVC, /* HEVC aka H.265*/
>  	VIRTIO_VIDEO_FORMAT_VP8, /* VP8 */
>  	VIRTIO_VIDEO_FORMAT_VP9, /* VP9 */
> +	VIRTIO_VIDEO_FORMAT_FWHT, /* FWHT used by vicodec */
>  	VIRTIO_VIDEO_FORMAT_CODED_MAX = VIRTIO_VIDEO_FORMAT_VP9,

Is last line still correct? Seems fragile ...
>  };
>  
> -- 
> 2.25.1


