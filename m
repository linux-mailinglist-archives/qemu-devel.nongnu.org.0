Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D92CBAE4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:48:00 +0100 (CET)
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPfz-0005ZU-IW
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOmR-0008L1-JM
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:50:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOmK-00026x-80
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606902622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bPHqVyLPpdeRR3wBXW9lPWcc3Y8IhnDcw3lNYDFSKyA=;
 b=GgpEeKA0CvOP5AQqPBVY1GwKiV8S/gOBahEVU6dMX+DT31QRwZWlUEVidUAJNsH6Wfxdsa
 MIJiWfPf1P/+26OpFzTksXQtY3P7RVEWIBqAZ0Q3zxMiQY3dzuzOFYqPub+vW89joI40mY
 0Pn6PNnAnklE5wQ3P7yEajwLMVLUV3I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-HDlyipMjOlysClOK7M8n1g-1; Wed, 02 Dec 2020 04:50:21 -0500
X-MC-Unique: HDlyipMjOlysClOK7M8n1g-1
Received: by mail-wm1-f70.google.com with SMTP id l5so2637361wmi.4
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bPHqVyLPpdeRR3wBXW9lPWcc3Y8IhnDcw3lNYDFSKyA=;
 b=hbe4bs6+/C91XZdUBJePfBOzy1dTwAtwAgBJztabwruHlVCITRhcWdBSfu8yMRPXiW
 en5MZcFCDCXJfytvol51CtAj0N6dUEpGeyelGk/ZIYsu2xHI7cWP9NcR8lU5ra+e/jNI
 7G2YyYz0/aOKkesBAWqdnUhA7uIjpEJe90lQoRXAuga20cd73JpuDdlbeOo412OXciRm
 01iYq1d874QI6pMn7ZOVJ+zCH+/FaFEB4sNHUTeNvYAriyPRfHZKNDqfrT4lNMcUg1Cz
 yQLGiFPrxwSBjH/M6k7ik6XdPdkRUvzUY8d0f7+y6q/T74mM6/rVqH0va+7wZCEDKw7r
 hvtw==
X-Gm-Message-State: AOAM530Y0saweD2rm+QgztkAoFrwoy8NKlmaWLQe1Hjib2Mk4uTlpgvl
 jxV8V85biJQVojmbdyy6iXK/qvobGgbUzQiPwDbznG9PVNA07a0U/lun49XfQuejxofw96YBsEu
 7Dv4nKvyXMFdHFyc=
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr2369875wrw.42.1606902619852; 
 Wed, 02 Dec 2020 01:50:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5W+IoNwgLrN+fUMV5ludVf2m0XTEiTYM74DU3S/Tke3lYmIq8Bvb02xNEmouaACTOjkldWQ==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr2369850wrw.42.1606902619651; 
 Wed, 02 Dec 2020 01:50:19 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d3sm1375745wrr.2.2020.12.02.01.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 01:50:18 -0800 (PST)
Date: Wed, 2 Dec 2020 04:50:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH] virtio: reset device on bad guest index in virtio_load()
Message-ID: <20201202044937-mutt-send-email-mst@kernel.org>
References: <20201120185103.GA442386@sent>
MIME-Version: 1.0
In-Reply-To: <20201120185103.GA442386@sent>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 06:51:07PM +0000, John Levon wrote:
> 
> If we find a queue with an inconsistent guest index value, explicitly mark the
> device as needing a reset - and broken - via virtio_error().
> 
> There's at least one driver implementation - the virtio-win NetKVM driver - that
> is able to handle a VIRTIO_CONFIG_S_NEEDS_RESET notification and successfully
> restore the device to a working state. Other implementations do not correctly
> handle this, but as the VQ is not in a functional state anyway, this is still
> worth doing.
> 
> Signed-off-by: John Levon <john.levon@nutanix.com>

I tagged this for after the release. pls ping me after the release
to help make sure it does not get lost.

> ---
>  hw/virtio/virtio.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index ceb58fda6c..eff35fab7c 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3161,12 +3161,15 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
>              nheads = vring_avail_idx(&vdev->vq[i]) - vdev->vq[i].last_avail_idx;
>              /* Check it isn't doing strange things with descriptor numbers. */
>              if (nheads > vdev->vq[i].vring.num) {
> -                qemu_log_mask(LOG_GUEST_ERROR,
> -                              "VQ %d size 0x%x Guest index 0x%x "
> -                              "inconsistent with Host index 0x%x: delta 0x%x",
> -                              i, vdev->vq[i].vring.num,
> -                              vring_avail_idx(&vdev->vq[i]),
> -                              vdev->vq[i].last_avail_idx, nheads);
> +                virtio_error(vdev, "VQ %d size 0x%x Guest index 0x%x "
> +                             "inconsistent with Host index 0x%x: delta 0x%x",
> +                             i, vdev->vq[i].vring.num,
> +                             vring_avail_idx(&vdev->vq[i]),
> +                             vdev->vq[i].last_avail_idx, nheads);
> +                vdev->vq[i].used_idx = 0;
> +                vdev->vq[i].shadow_avail_idx = 0;
> +                vdev->vq[i].inuse = 0;
> +                continue;
>              }
>              vdev->vq[i].used_idx = vring_used_idx(&vdev->vq[i]);
>              vdev->vq[i].shadow_avail_idx = vring_avail_idx(&vdev->vq[i]);
> -- 
> 2.22.3
> 


