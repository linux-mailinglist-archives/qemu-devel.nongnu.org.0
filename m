Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB54C4D0C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:58:23 +0100 (CET)
Received: from localhost ([::1]:50566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNerF-0006wW-Oa
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:58:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeUN-0005ES-MZ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:34:43 -0500
Received: from [2a00:1450:4864:20::62c] (port=42624
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeUL-0008Jj-JD
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:34:43 -0500
Received: by mail-ej1-x62c.google.com with SMTP id hw13so12202087ejc.9
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PJAWRYVlt5SSdx0S4DevBuXxm9MTUjJ2mDJX+aerh4s=;
 b=pCI8GtYjlGcuGXPXOhNy2144eiCkDYDWYVmTUsLM038WaMimPW2Ch5vzL0tpaEbvuN
 asp86Hz4yPY65ug4eiaArGm35nX9ldrHWm0fCdNbgBOVNIGIgL4rCyQQllH+aaFj05La
 Uccmq2DZEtxaZ4z3LtJiV4FKdFfM8OI8zkrR2i6pgWx23Amrsfcv38Y1DO7hgRcQaEDM
 qjZD7w/fxsqn9mOIDU9HSGB9m7L9B3M/TpY1fy0HB1fOWJATUnCaxlSrtslY28No6tCx
 oHmiccq4l+Qf7t16y8H3RbmWqC5g3VoJtiEwILIkuCPJiMpJVNO71ARsLpYk4pu+Uw+R
 jTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:subject
 :date:message-id:mime-version:content-transfer-encoding;
 bh=PJAWRYVlt5SSdx0S4DevBuXxm9MTUjJ2mDJX+aerh4s=;
 b=yHNefMxv2gBZZEcLK/Q3zM80EJNuH35M4PXvtVekx4m9LMqI45THI1Hkdhtmaiq/vR
 lD1+4Q80e3S+CuW9s57OHpCL/YyKTEv47sZiAbO2ZYXEjMyK1r0Q0lhvMeNRRw5RfomQ
 aEeS3KYe0D6bjIJA24ANFl+XuLJbnJdXCEHdlHxlbxYCsV3K/cEKQFvIZITn7BZQugMl
 1bS+chwh6Z5iH62+qm9RraRMeClBepBpuHErJNXyV2qp7O4U5xqpEiV9uWLxNBNN47sI
 IiODbD2nWUHsZ/aQf/qOCuj0p3Sdcxp+sA5PaKBuESajfdqV3r35A3hJ71/igAoQaRp6
 Lx1A==
X-Gm-Message-State: AOAM5323c4fb2ApFQOe262N2PHtTN1JnolYk+FvbeeXIEpwyMX4fA7ZU
 meH7acNJx98Gmh+enJgr/x/k5g==
X-Google-Smtp-Source: ABdhPJw8/F8wMO5G3H1+LD9gm6uXKk9SPFkd643sn1i56KS9UsTDfJ/BRrhuWdCwPFJSxg+m0/xlxg==
X-Received: by 2002:a17:907:1183:b0:6cf:ce2f:51c1 with SMTP id
 uz3-20020a170907118300b006cfce2f51c1mr6896914ejb.209.1645810479662; 
 Fri, 25 Feb 2022 09:34:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a1709067d5200b006cb0ba8db9esm1287669ejp.14.2022.02.25.09.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:34:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 23F4E1FFB7;
 Fri, 25 Feb 2022 17:34:37 +0000 (GMT)
References: <87ee3q3mos.fsf@linaro.org>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael S. Tsirkin <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: What is the correct way to handle the VirtIO config space in
 vhost-user?
Subject: What is the correct way to handle the VirtIO config space in
 vhost-user?
Date: Fri, 25 Feb 2022 17:32:43 +0000
Message-ID: <87a6ee3l5e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


[Apologies to CC list for repost due to fat fingering the mailing list addr=
ess]

Hi Michael,

I was updating my vhost-user-rpmb implementation when I realised it
wasn't handling config space access properly. However when I went to
implement it I realised there seems to be two ways of doing this. For
example in vhost-user-gpu we have:

  static void
  vhost_user_gpu_get_config(VirtIODevice *vdev, uint8_t *config_data)
  {
      VhostUserGPU *g =3D VHOST_USER_GPU(vdev);
      VirtIOGPUBase *b =3D VIRTIO_GPU_BASE(vdev);
      struct virtio_gpu_config *vgconfig =3D
          (struct virtio_gpu_config *)config_data;
      Error *local_err =3D NULL;
      int ret;

      memset(config_data, 0, sizeof(struct virtio_gpu_config));

      ret =3D vhost_dev_get_config(&g->vhost->dev,
                                 config_data, sizeof(struct virtio_gpu_conf=
ig),
                                 &local_err);
      if (ret) {
          error_report_err(local_err);
          return;
      }

      /* those fields are managed by qemu */
      vgconfig->num_scanouts =3D b->virtio_config.num_scanouts;
      vgconfig->events_read =3D b->virtio_config.events_read;
      vgconfig->events_clear =3D b->virtio_config.events_clear;
  }

which is setup with .get_config and .set_config functions that poke the
appropriate vhost communication. However to do this needs an instance
init to create a vhost just so it can jump the g->vhost->dev indirection:

  static void
  vhost_user_gpu_instance_init(Object *obj)
  {
      VhostUserGPU *g =3D VHOST_USER_GPU(obj);

      g->vhost =3D VHOST_USER_BACKEND(object_new(TYPE_VHOST_USER_BACKEND));
      object_property_add_alias(obj, "chardev",
                                OBJECT(g->vhost), "chardev");
  }

(aside: this continues my QOM confusion about when things should be in a
class or instance init, up until this point I hadn't needed it in my
stub).

However when grepping around I found some vhost-user devices do it
differently, for example vhost-user-blk has:

  static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
  {
      int ret;
      struct virtio_blk_config blkcfg;
      VHostUserBlk *s =3D VHOST_USER_BLK(dev->vdev);
      Error *local_err =3D NULL;

      ret =3D vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
                                 sizeof(struct virtio_blk_config),
                                 &local_err);
      if (ret < 0) {
          error_report_err(local_err);
          return ret;
      }

      /* valid for resize only */
      if (blkcfg.capacity !=3D s->blkcfg.capacity) {
          s->blkcfg.capacity =3D blkcfg.capacity;
          memcpy(dev->vdev->config, &s->blkcfg, sizeof(struct virtio_blk_co=
nfig));
          virtio_notify_config(dev->vdev);
      }

      return 0;
  }

Although this seems to miss the ability to "set" a config - although
that seems confusing anyway, surely the guest only ever reads the config
space?

So my question is which approach is the correct one? Is one a legacy
approach or is it "depends on what you are doing"?

Ultimately I guess this points to the need for a bit more API
documentation to make it clear when certain methods should be used.

--=20
Alex Benn=C3=A9e

