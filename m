Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD5613639
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:26:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTqo-0006k9-F4; Mon, 31 Oct 2022 08:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opTqk-0006iT-Qj
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opTqi-0000x8-Fa
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zfkK1KtSCue63LLMxZ4FtECuWKGnXXVP4gbD3G4cjL0=;
 b=OFx4cqAw1WszYJHlmmLCJFPOXdJRo/xVbu9y99AH8+Poi0r9/e1eiyLb5DXSZKaqJ6gor6
 QsO1Q15Ch+Xmg1aSef1upI7yOeWymOUWGRjDF2e0i44POTd7WUMzjRx0cYapxkajV52iBq
 YBOorJY2g/Jl16w0nPVudGzb/bcDnHE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-qHl8mDv4O5eTkkRnYG4rYQ-1; Mon, 31 Oct 2022 08:25:01 -0400
X-MC-Unique: qHl8mDv4O5eTkkRnYG4rYQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 e13-20020adf9bcd000000b00236b36cd8cbso1521411wrc.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zfkK1KtSCue63LLMxZ4FtECuWKGnXXVP4gbD3G4cjL0=;
 b=WX05bm54v5YsSL4fAtT5NnlbSa+8UNOx4j9pCQ3puXpT/mbEbxv3WofnzeWrrLX9cE
 fDAfc1jgiMui6Fq+Cmh/jM1f10aNdSTu8Aik1AxOK4gv9v4k+fPRhUcof6CvFgQC5jGI
 4dhz+9WdzEXOzZSY2oHuRQ2i/g3PZcRbOyUgeJJMTJmYZMrvrwFBH8qjUeLdebus8A7i
 Nh7UvreYF6xtN0yUjxjxXaRIn3I++UPpWZ7LIYw9UQU58WLbX5DAT0u3/7xBVOmdTFeJ
 6kn0fv94c0PKQgD3h6dpz4xAO/FFAFC6sjw5ec7eqT0C7cgGE1PxWXu/NpubChW/DCuj
 4FcA==
X-Gm-Message-State: ACrzQf2H8Mex2Jej4BH1vqKU0GJPqf4uFZHOhhnuqQV/WkNhlAwE2VR+
 cCWbyqwnv6qRe6H4OEt3zq03c17AlDKGmNK/DKKQkRXzlaBJsrUxu9kpt/AM8nPMHwMTjUlJcAJ
 fBDtDCvPDKDYyjGY=
X-Received: by 2002:a7b:c4cf:0:b0:3cf:497c:ae3a with SMTP id
 g15-20020a7bc4cf000000b003cf497cae3amr17788966wmk.177.1667219100560; 
 Mon, 31 Oct 2022 05:25:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69D8xIsVZcaWiRZms64488Fpw3/JfDO/S2qIuys1bMppxYZyg7F7QbMgvcGKp4qqtV88spaA==
X-Received: by 2002:a7b:c4cf:0:b0:3cf:497c:ae3a with SMTP id
 g15-20020a7bc4cf000000b003cf497cae3amr17788937wmk.177.1667219100283; 
 Mon, 31 Oct 2022 05:25:00 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003a2f2bb72d5sm8067013wmc.45.2022.10.31.05.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:24:59 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:24:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: Re: [PATCH v5 2/6] vdpa: Allocate SVQ unconditionally
Message-ID: <20221031082106-mutt-send-email-mst@kernel.org>
References: <20221011104154.1209338-1-eperezma@redhat.com>
 <20221011104154.1209338-3-eperezma@redhat.com>
 <20221031041821-mutt-send-email-mst@kernel.org>
 <CAJaqyWcaZ32agF0CKPUU89NHj0Di9Q5kFJDsWcUwCG2q0u_kEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWcaZ32agF0CKPUU89NHj0Di9Q5kFJDsWcUwCG2q0u_kEQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 12:56:06PM +0100, Eugenio Perez Martin wrote:
> On Mon, Oct 31, 2022 at 9:21 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Oct 11, 2022 at 12:41:50PM +0200, Eugenio Pérez wrote:
> > > SVQ may run or not in a device depending on runtime conditions (for
> > > example, if the device can move CVQ to its own group or not).
> > >
> > > Allocate the resources unconditionally, and decide later if to use them
> > > or not.
> > >
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> >
> > I applied this for now but I really dislike it that we are wasting
> > resources like this.
> >
> > Can I just drop this patch from the series? It looks like things
> > will just work anyway ...
> >
> 
> It will not work simply dropping this patch, because new code expects
> SVQ vrings to be already allocated. But that is doable with more work.
> 
> > I know, when one works on a feature it seems like everyone should
> > enable it - but the reality is qemu already works quite well for
> > most users and it is our resposibility to first do no harm.
> >
> 
> I agree, but then it is better to drop this series entirely for this
> merge window. I think it is justified to add it at the beginning of
> the next merge window, and to give more time for testing and adding
> more features actually.

Not sure what "then" means. You tell me - should I drop it?

> However, I think shadow CVQ should start by default as long as the
> device has the right set of both virtio and vdpa features. Otherwise,
> we need another cmdline parameter, something like x-cvq-svq, and the
> update of other layers like libvirt.
> 
> Thanks!

OK maybe that is not too bad.


> >
> > > ---
> > >  hw/virtio/vhost-vdpa.c | 33 +++++++++++++++------------------
> > >  1 file changed, 15 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index 7f0ff4df5b..d966966131 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -410,6 +410,21 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
> > >      int r;
> > >      bool ok;
> > >
> > > +    shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> > > +    for (unsigned n = 0; n < hdev->nvqs; ++n) {
> > > +        g_autoptr(VhostShadowVirtqueue) svq;
> > > +
> > > +        svq = vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> > > +                            v->shadow_vq_ops_opaque);
> > > +        if (unlikely(!svq)) {
> > > +            error_setg(errp, "Cannot create svq %u", n);
> > > +            return -1;
> > > +        }
> > > +        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
> > > +    }
> > > +
> > > +    v->shadow_vqs = g_steal_pointer(&shadow_vqs);
> > > +
> > >      if (!v->shadow_vqs_enabled) {
> > >          return 0;
> > >      }
> > > @@ -426,20 +441,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
> > >          return -1;
> > >      }
> > >
> > > -    shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> > > -    for (unsigned n = 0; n < hdev->nvqs; ++n) {
> > > -        g_autoptr(VhostShadowVirtqueue) svq;
> > > -
> > > -        svq = vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> > > -                            v->shadow_vq_ops_opaque);
> > > -        if (unlikely(!svq)) {
> > > -            error_setg(errp, "Cannot create svq %u", n);
> > > -            return -1;
> > > -        }
> > > -        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
> > > -    }
> > > -
> > > -    v->shadow_vqs = g_steal_pointer(&shadow_vqs);
> > >      return 0;
> > >  }
> > >
> > > @@ -580,10 +581,6 @@ static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
> > >      struct vhost_vdpa *v = dev->opaque;
> > >      size_t idx;
> > >
> > > -    if (!v->shadow_vqs) {
> > > -        return;
> > > -    }
> > > -
> > >      for (idx = 0; idx < v->shadow_vqs->len; ++idx) {
> > >          vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, idx));
> > >      }
> > > --
> > > 2.31.1
> >


