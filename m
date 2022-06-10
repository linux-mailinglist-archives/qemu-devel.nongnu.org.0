Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72A0546707
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:04:54 +0200 (CEST)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzeJq-000210-1B
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Vincent.Whitchurch@axis.com>)
 id 1nza9p-0002gW-RL
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 04:38:19 -0400
Received: from smtp2.axis.com ([195.60.68.18]:32036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Vincent.Whitchurch@axis.com>)
 id 1nza9n-0003jC-6w
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 04:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1654850295;
 x=1686386295; h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OSEBaJXz7wOFwbGTm/avvkcClQb+UeUjPVtX0/t99wI=;
 b=Yrecwglac17x1IVJeTjqRFn908SHaV0feV4Qg8MYEBlxLn8olk7CMKac
 +iZCLNPkouYBEkNYFksXq5pj1sM4AWO7ZufvZFvHk4TOPjGdZimeKy0wv
 wESEE/bl114NSsgKH9SslVWiIx/yrHKFyNzxXHcaL6ypHn+cuGQCBtqmz
 fDbZ5PZEFPBsMmEV+5PAmtGo03/SX0H1koAsKlgvg6nh7A44lVA6gRJgP
 H0tKGECVHdq/VYl28a7+PMc2YMtfaec0bXFgKz8j6wP29J4VNPTAVCI7U
 TiY4EdkjmntaNtLlevMaVxT0fgzasi27ZF1spoSZVyB0miJdlMtlfMksN g==;
Date: Fri, 10 Jun 2022 10:37:51 +0200
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, <slp@redhat.com>, <mst@redhat.com>,
 <marcandre.lureau@redhat.com>, <stefanha@redhat.com>,
 <mathieu.poirier@linaro.org>, <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 05/15] hw/virtio: add boilerplate for vhost-user-gpio
 device
Message-ID: <20220610083747.GA29012@axis.com>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-6-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524154056.2896913-6-alex.bennee@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=195.60.68.18;
 envelope-from=Vincent.Whitchurch@axis.com; helo=smtp2.axis.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:55:09 -0400
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

On Tue, May 24, 2022 at 04:40:46PM +0100, Alex Bennée wrote:
> +static int vu_gpio_start(VirtIODevice *vdev)
> +{
> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> +    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
> +    int ret, i;
> +
> +    if (!k->set_guest_notifiers) {
> +        error_report("binding does not support guest notifiers");
> +        return -ENOSYS;
> +    }
> +
> +    ret = vhost_dev_enable_notifiers(&gpio->vhost_dev, vdev);
> +    if (ret < 0) {
> +        error_report("Error enabling host notifiers: %d", ret);
> +        return ret;
> +    }
> +
> +    ret = k->set_guest_notifiers(qbus->parent, gpio->vhost_dev.nvqs, true);
> +    if (ret < 0) {
> +        error_report("Error binding guest notifier: %d", ret);
> +        goto err_host_notifiers;
> +    }
> +
> +    /*
> +     * Before we start up we need to ensure we have the final feature
> +     * set needed for the vhost configuration.
> +     */
> +    vhost_ack_features(&gpio->vhost_dev, feature_bits, vdev->backend_features);

This is doing the feature handling differently from the other
vhost-user-* implementations, and it doesn't seem to work for me.
Negotiated features (I noticed it with VIRTIO_RING_F_EVENT_IDX) never
make it to VHOST_USER_SET_FEATURES.

If I change this code to match vhost-user-i2c and the other
implementations like in the patch below, it works.

The guest is Linux v5.18.  The backend uses libvhost-user and is the one
posted here (with a few fixes):

 https://lore.kernel.org/lkml/20220311162445.346685-3-vincent.whitchurch@axis.com/

8<-------
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 87e3976880..1dc7af6b03 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -73,7 +73,7 @@ static int vu_gpio_start(VirtIODevice *vdev)
      * Before we start up we need to ensure we have the final feature
      * set needed for the vhost configuration.
      */
-    vhost_ack_features(&gpio->vhost_dev, feature_bits, vdev->backend_features);
+    gpio->vhost_dev.acked_features = vdev->guest_features;
 
     ret = vhost_dev_start(&gpio->vhost_dev, vdev);
     if (ret < 0) {
@@ -156,9 +156,7 @@ static uint64_t vu_gpio_get_features(VirtIODevice *vdev, uint64_t features,
     virtio_add_feature(&features, VIRTIO_GPIO_F_IRQ);
     virtio_add_feature(&features, VIRTIO_F_VERSION_1);
 
-    vdev->backend_features = vhost_get_features(&gpio->vhost_dev, feature_bits,
-                                                features);
-    return vdev->backend_features;
+    return vhost_get_features(&gpio->vhost_dev, feature_bits, features);
 }
 
 static void vu_gpio_handle_output(VirtIODevice *vdev, VirtQueue *vq)
-- 
2.28.0


