Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7064F63AE96
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 18:11:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhe3-000823-18; Mon, 28 Nov 2022 12:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozhdw-00080k-Rn
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 12:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozhdq-0001pd-OF
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 12:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669655399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EAHqeruph/nBQ38/PNaRHkJ4qz3volfoFVmnbgcOOfg=;
 b=MeU5AXetDw83vLQF1rQDyrRHDVvCod9UesdmFvty3AFAeBn+P/FHKqcaVvs+GQNVw6QmWa
 bwOLBu1EPlxePE1TdVNHx/5bXQEsF6/9l3xOGV/OL2kIWHr2q96QZGKDdJjcXyObriQCIc
 FiIq4G+WCe/Sm5iwOnCKU0FPFdYdJ/Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-TGh0sMDIMgiuD07Vj5PS0w-1; Mon, 28 Nov 2022 12:09:57 -0500
X-MC-Unique: TGh0sMDIMgiuD07Vj5PS0w-1
Received: by mail-wr1-f71.google.com with SMTP id
 k1-20020adfb341000000b0024215e0f486so933103wrd.21
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 09:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EAHqeruph/nBQ38/PNaRHkJ4qz3volfoFVmnbgcOOfg=;
 b=Bd8t2D1CyJzVpLKUZ+syyV6zXejF3eSad+egcQAz5XDWi8zRZrRFK1McnX/2+EeU4I
 bQKmo41EB1BNPXBXiV+CzDVAgtn2uh5w3AetmDTHmID70hupMsU3TnD11cXCwiXYRNMt
 qIsg9IRVYg8fnNHHXMyQ9v0Cs4nJAYKbc8xZ0wAA5cVilZWttmJyStp9XsDHdyuOEB5C
 h+3GiCLcmGt5Kyu3ga99WZFwsmts9l70iDgSR5DYnLAhbr/P5A+jAwBcp2AqJkyHKkZG
 DXQCeo7RhmpsahjGjDIk2Q7acgIHnu+HfTBF3F2zjc74dFeHGd1YKh52ggE3w2/u5vFm
 2NLA==
X-Gm-Message-State: ANoB5pnB7lLAolM4KrrEJDRBxkQa7x+2ErHjIyLTGdj3SYaoA+tF2Jd9
 i8lYNSQjWWJmDaELcGcJFrZUgW1p8WHYBS2AyCMg1KKCHuHISY6KayXoK/6lOlPtlJHV+BSkITl
 3hWxIjl87HDpjaJ4=
X-Received: by 2002:a05:6000:989:b0:236:91d0:1f with SMTP id
 by9-20020a056000098900b0023691d0001fmr24438823wrb.33.1669655396388; 
 Mon, 28 Nov 2022 09:09:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf52rHWsIaDWMENuiO/m7TkRd5jQE+eTLxpDdpg6/vf5V7+3ZVfM+FthZWxz+dW+PqheG4NPDg==
X-Received: by 2002:a05:6000:989:b0:236:91d0:1f with SMTP id
 by9-20020a056000098900b0023691d0001fmr24438795wrb.33.1669655396061; 
 Mon, 28 Nov 2022 09:09:56 -0800 (PST)
Received: from redhat.com ([2.52.149.178]) by smtp.gmail.com with ESMTPSA id
 h8-20020a1ccc08000000b003cf6c2f9513sm15760830wmb.2.2022.11.28.09.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:09:55 -0800 (PST)
Date: Mon, 28 Nov 2022 12:09:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, sgarzare@redhat.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCH  v3 2/7] include/hw: VM state takes precedence in
 virtio_device_should_start
Message-ID: <20221128120923-mutt-send-email-mst@kernel.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221128164105.1191058-3-alex.bennee@linaro.org>
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

On Mon, Nov 28, 2022 at 04:41:00PM +0000, Alex Bennée wrote:
> The VM status should always preempt the device status for these
> checks. This ensures the device is in the correct state when we
> suspend the VM prior to migrations. This restores the checks to the
> order they where in before the refactoring moved things around.
> 
> While we are at it lets improve our documentation of the various
> fields involved and document the two functions.
> 
> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> Fixes: 259d69c00b (hw/virtio: introduce virtio_device_should_start)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>


Doesn't this need to be like the last patch in the series?
Otherwise bisect will break on CI, right?

> ---
> v3
>   - rm extra line
>   - fix fn name in comment for virtio_device_started()
> ---
>  include/hw/virtio/virtio.h | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 0f612067f7..24561e933a 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -133,6 +133,13 @@ struct VirtIODevice
>      bool broken; /* device in invalid state, needs reset */
>      bool use_disabled_flag; /* allow use of 'disable' flag when needed */
>      bool disabled; /* device in temporarily disabled state */
> +    /**
> +     * @use_started: true if the @started flag should be used to check the
> +     * current state of the VirtIO device. Otherwise status bits
> +     * should be checked for a current status of the device.
> +     * @use_started is only set via QMP and defaults to true for all
> +     * modern machines (since 4.1).
> +     */
>      bool use_started;
>      bool started;
>      bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
> @@ -408,6 +415,16 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
>      return false;
>  }
>  
> +/**
> + * virtio_device_started() - check if device started
> + * @vdev - the VirtIO device
> + * @status - the devices status bits
> + *
> + * Check if the device is started. For most modern machines this is
> + * tracked via the @vdev->started field (to support migration),
> + * otherwise we check for the final negotiated status bit that
> + * indicates everything is ready.
> + */
>  static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
>  {
>      if (vdev->use_started) {
> @@ -428,15 +445,11 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
>   */
>  static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_t status)
>  {
> -    if (vdev->use_started) {
> -        return vdev->started;
> -    }
> -
>      if (!vdev->vm_running) {
>          return false;
>      }
>  
> -    return status & VIRTIO_CONFIG_S_DRIVER_OK;
> +    return virtio_device_started(vdev, status);
>  }
>  
>  static inline void virtio_set_started(VirtIODevice *vdev, bool started)
> -- 
> 2.34.1


