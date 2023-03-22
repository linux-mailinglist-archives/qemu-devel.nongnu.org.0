Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ADE6C533C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 19:05:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2pK-0004rC-8j; Wed, 22 Mar 2023 14:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pf2pH-0004r4-Qx
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pf2pG-00044y-7b
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679508281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gx64yB28qTUb7Ixl3MZpk/yGuUxk1Fm/Eaq5vdYNwh8=;
 b=SyGHNuDQVd/K4YWF0Wy64iKcFfYeeXJ1oRyNG7FCK/OGGyFQL8lc8N2xsv0e2yw3fLZnS9
 YuIu795pvCqR7J9kQW/72wmn7CNdblyxXSjOP9KP4bNQS0Mu1F1jMl1J+/yQPKzocxOAm7
 bmz1Ubt17WOtISlox3JTF7m6fo1lEWQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-61TYgfmnMQCaX0LWsFfHkA-1; Wed, 22 Mar 2023 14:04:40 -0400
X-MC-Unique: 61TYgfmnMQCaX0LWsFfHkA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-5425c04765dso194100767b3.0
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 11:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679508279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gx64yB28qTUb7Ixl3MZpk/yGuUxk1Fm/Eaq5vdYNwh8=;
 b=6l/1z95HslHROA/YcNyVYVhRR1z+XP0IZ8OdynmEqIvxny/nGIZVyiz2tGZJjx7K4p
 hxim6OTltTQZELnNxw8f8JU5za4toKFu6HY4wX/+Y9CaKMQcY78OgLlhxZyQ2gnsEnz+
 zVlw6CCXlLZIes5EOYL9MwydsfiVtBKhpQcSP4+e2QJwi69Yz/4nGTMkUMmJgGVKsQUH
 Mtsx87395tqgEfrXiEtwtmNDrBu6+gev8V24+5PniTX+eOL4IDG7el6tKSEopFWc2T9X
 +96+OzLAtUm3KeLwD48EpUYXQC9RDdiOhYYCvbkffBPjaP5Xtq1B8RY6jKoTO7XyCsgm
 KBKw==
X-Gm-Message-State: AAQBX9ehYdjuKJbAujRwPEnBDomT6GrZk0RgGQatMIYmmGKeF76FLHww
 FNoemXUPvNQ7YFOJHrX4SsGuJiJamrFfrj1Yx4GP/afYBEFeWCCYEvaBrlRtCu7s1JloGgZe0GZ
 bgGMSuRJKJOVII8U17PofiKEhXPtd/zg=
X-Received: by 2002:a05:6902:1023:b0:b3b:a48c:b23e with SMTP id
 x3-20020a056902102300b00b3ba48cb23emr254577ybt.2.1679508279561; 
 Wed, 22 Mar 2023 11:04:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZWJfFel1A5K4QpFJI6cYiZlJWwefs4S5PO0iHx7ttIWDbbHB5SfZzo3xw40h8YFjw+kuCVQhie6DtImerZarU=
X-Received: by 2002:a05:6902:1023:b0:b3b:a48c:b23e with SMTP id
 x3-20020a056902102300b00b3ba48cb23emr254566ybt.2.1679508279357; Wed, 22 Mar
 2023 11:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-6-eperezma@redhat.com>
 <20230322142712.egnc6rlmeclwmchg@sgarzare-redhat>
In-Reply-To: <20230322142712.egnc6rlmeclwmchg@sgarzare-redhat>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 22 Mar 2023 19:04:03 +0100
Message-ID: <CAJaqyWdaXCO5VDSQ_wda9rCFH0VHcTMEuq4RP2b-LLGFty7m7g@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.1 5/6] vdpa: move CVQ isolation check to
 net_init_vhost_vdpa
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, alvaro.karsz@solid-run.com, 
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 si-wei.liu@oracle.com, longpeng2@huawei.com, Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Wed, Mar 22, 2023 at 3:27=E2=80=AFPM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Fri, Mar 17, 2023 at 03:55:41PM +0100, Eugenio P=C3=A9rez wrote:
> >Evaluating it at start time instead of initialization time may make the
> >guest capable of dynamically adding or removing migration blockers.
> >
> >Also, moving to initialization reduces the number of ioctls in the
> >migration, reducing failure possibilities.
> >
> >Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >---
> > net/vhost-vdpa.c | 200 +++++++++++++++++++++++++++++++++++++----------
> > 1 file changed, 157 insertions(+), 43 deletions(-)
> >
> >diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >index 4397c0d4b3..818a24fb0e 100644
> >--- a/net/vhost-vdpa.c
> >+++ b/net/vhost-vdpa.c
> >@@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
> >
> >     /* The device always have SVQ enabled */
> >     bool always_svq;
> >+
> >+    /* The device can isolate CVQ in its own ASID if MQ is negotiated *=
/
> >+    bool cvq_isolated_mq;
> >+
> >+    /* The device can isolate CVQ in its own ASID if MQ is not negotiat=
ed */
> >+    bool cvq_isolated;
> >+
>
> I am not familiar with how CVQ works, so my question might be trivial
> ;-) but why do we need to have 2 variables depending on F_MQ?
>

You're right, it is not specified anywhere in the series.

Vring ASID / group management is based on vq indexes. CVQ is always
the last queue, but its position depends on MQ. If it is not acked,
cvq will always be queue #2. if it is acked, it will be
net_config->max_virtqueue_pairs*2.

Previously this was done at device start, so we always know if mq has
been acked or not. But now we are moving to initialization, so we need
to probe both configurations.

Is that clearer now? I'll add to the patch description for sure.

Thanks!


