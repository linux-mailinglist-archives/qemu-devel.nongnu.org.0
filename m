Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C23BC80D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:43:30 +0200 (CEST)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gfw-0005hJ-D8
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gS3-0003LZ-JM
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:29:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gS0-0003C9-Hu
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625560143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+0GjnQW0atJpiccjtty/mD1ayY63S41qsJkiRQTbx8=;
 b=YJt5lrKUaz4+R1Cr0IYqYbOkUmfiOA72S4yBqIS5CiS89Oy78WdZWy/SkoTyqH/S4eJ2Dl
 GyXIHC+J7PG31dgSDCMZjcmanVwcB+92PfGIUCXBYjiUye2jf+/9Tk3luY0EzU2sAdU/KM
 xWIJo3NZUEHxXf1NZaD4lARyKRhmwE4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-iC6zzgRIPQCefqdam-gHmg-1; Tue, 06 Jul 2021 04:29:02 -0400
X-MC-Unique: iC6zzgRIPQCefqdam-gHmg-1
Received: by mail-lj1-f198.google.com with SMTP id
 q13-20020a2e914d0000b02901752c889bcdso8421477ljg.20
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 01:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P+0GjnQW0atJpiccjtty/mD1ayY63S41qsJkiRQTbx8=;
 b=IsmYUJIK5FLvvbJS22pHAmsIPbT3V13OJEAyLxwCcD7QEHMLWzT3HKje9869yg/cM0
 0bFWa8RfxgdCtzvUSJKbTV3R+PAnToUnstP7vN9e1V16zMU45HOG0rg8hfN3mbmcj4LT
 EAX2QEWFeu5N1+6i763LnCy+CnVnUdiWBYY+45ddHB9b5wt5uuKWizPiaHpge6wPyR40
 pGjsCvPZKVFcMEAXjMzjOfuR1e38QZ+2tTrQH/9+z3cjpMxVnhcqgaSvvDgZ0pcy7Av2
 ze5ZOM7NdCN/HYVpHrMPYJIB9WAr+x6SHcLae1J3IX8+epWaSmD6IWGo5Qy/RmQYKDbh
 kSgw==
X-Gm-Message-State: AOAM531e8g/rWMxwqX93ba1+Bsj3cqaYJOjgbDfDm/7ohgpbhffFCS/r
 jbEXPnwDxAcdPVxj7xGc9WfD8BGt3j+LiFiCqsvXZ8z2FjpcaVx5wxbIQcGY4iDAabs35f7jGwX
 yy08a/sypi7hRmYYRnWan6RvtwijvnKM=
X-Received: by 2002:a2e:a233:: with SMTP id i19mr14479588ljm.261.1625560141301; 
 Tue, 06 Jul 2021 01:29:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybTsvQGKkWfdrzpCDnyGqqLHr1EQNxZy58Jm9DB8ULGi+4OAUFcT1BYnjWzvMExE3xVg/y+/yPH1kIP8aBL6w=
X-Received: by 2002:a2e:a233:: with SMTP id i19mr14479572ljm.261.1625560141053; 
 Tue, 06 Jul 2021 01:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-8-jasowang@redhat.com>
 <20210623150312.7g43l5qjwacxhw43@steredhat>
 <208edb63-a0d1-6d6b-e451-b17cb24708ed@redhat.com>
 <12f1b265-3dd0-9c9e-cfbe-e004e08ec7f1@redhat.com>
 <20210706082703.julcfywtatytczbo@steredhat>
In-Reply-To: <20210706082703.julcfywtatytczbo@steredhat>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 6 Jul 2021 16:28:50 +0800
Message-ID: <CACGkMEuTEatgLSKXVysghtcJq3NHiZnP=GmU=sAwNoY99hYUpw@mail.gmail.com>
Subject: Re: [PATCH 07/18] vhost-vdpa: tweak the error label in
 vhost_vdpa_add()
To: Stefano Garzarella <sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, eperezma <eperezma@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 6, 2021 at 4:27 PM Stefano Garzarella <sgarzare@redhat.com> wro=
te:
>
> On Tue, Jul 06, 2021 at 04:10:22PM +0800, Jason Wang wrote:
> >
> >=E5=9C=A8 2021/7/6 =E4=B8=8B=E5=8D=884:03, Jason Wang =E5=86=99=E9=81=93=
:
> >>
> >>=E5=9C=A8 2021/6/23 =E4=B8=8B=E5=8D=8811:03, Stefano Garzarella =E5=86=
=99=E9=81=93:
> >>>On Mon, Jun 21, 2021 at 12:16:39PM +0800, Jason Wang wrote:
> >>>>Introduce new error label to avoid the unnecessary checking of net
> >>>>pointer.
> >>>>
> >>>>Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
> >>>>Signed-off-by: Jason Wang <jasowang@redhat.com>
> >>>>---
> >>>>net/vhost-vdpa.c | 13 ++++++-------
> >>>>1 file changed, 6 insertions(+), 7 deletions(-)
> >>>>
> >>>>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>>index 21f09c546f..0da7bc347a 100644
> >>>>--- a/net/vhost-vdpa.c
> >>>>+++ b/net/vhost-vdpa.c
> >>>>@@ -100,19 +100,18 @@ static int vhost_vdpa_add(NetClientState
> >>>>*ncs, void *be)
> >>>>    net =3D vhost_net_init(&options);
> >>>>    if (!net) {
> >>>>        error_report("failed to init vhost_net for queue");
> >>>>-        goto err;
> >>>>+        goto err_init;
> >>>>    }
> >>>>    s->vhost_net =3D net;
> >>>>    ret =3D vhost_vdpa_net_check_device_id(net);
> >>>>    if (ret) {
> >>>>-        goto err;
> >>>>+        goto err_check;
> >>>>    }
> >>>>    return 0;
> >>>>-err:
> >>>>-    if (net) {
> >>>>-        vhost_net_cleanup(net);
> >>>>-        g_free(net);
> >>>>-    }
> >>>>+err_check:
> >>>>+    vhost_net_cleanup(net);
> >>>>+    g_free(net);
> >>>
> >>>Should we set s->vhost_net to NULL to avoid use after free?
> >>>
> >>>Then we should also remove the `assert(s->vhost_net)` in
> >>>net_vhost_vdpa_init() since we can fail.
> >>
> >>
> >>Right, will do this in a separate patch.
> >
> >
> >I just forget the job has been done in the next patch :)
>
> I saw it later too ;-)
>
> >
> >So we are fine here.
>
> Yep for the assert(), but what about setting s->vhost_net to NULL?
> Or just move the s->vhost_net assignment just before the `return 0`.

We can do, I've posted V2. If it has comment, I will do that in V3.
Otherwise I will send a separate patch for this.

Thanks

>
> Thanks,
> Stefano
>


