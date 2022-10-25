Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061C260C67C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:33:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFKl-0002DP-D6; Tue, 25 Oct 2022 04:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1onE28-00024P-Gn
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1onE26-0007MX-A0
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666681649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K9yyWdl0ksGUjiX/WO67Noj7n2je4NdflJckapT6Yd8=;
 b=cLmSROtnTOImRq1//RR+xnqMAwm6IxAmpCQ8e3cCdf5hy6HpDUyx/TpQv5t72Cm8samkaR
 N0H0e7RSPYDHtZGEmdSVXJkatm2DmzC0JbrX/qPfp8O/qaDu6obSyqzwAviNR/GmUwqRvv
 coI/7aB8GA7dnFSCTpsNvGIAYPTjGVI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-vjA1xPlDOvOaAYLLRnJWLg-1; Tue, 25 Oct 2022 03:07:22 -0400
X-MC-Unique: vjA1xPlDOvOaAYLLRnJWLg-1
Received: by mail-pf1-f197.google.com with SMTP id
 e12-20020a62aa0c000000b0056c12c0aadeso1048381pff.21
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 00:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K9yyWdl0ksGUjiX/WO67Noj7n2je4NdflJckapT6Yd8=;
 b=RRNqio5P3C6CDWv1li6B3kAuoax1r3TIk5Fq9G/OF0UHF5KirHfb49/auLhzohtikA
 rkh30ML1cR9e/gXHzPoCnYMJqgtk4kUO6gWhSD9R3cI/NUoCQDHCfBgKOufIdTnGTmEc
 3PPVYEd0hvoW19KIeOntfGgtM8CvbFUAQFMygV+QOZhJMKc0DjDlamphaS4fxz03qg87
 FIFF2xOV4+32UJ1oyqBXgorSDkQbjUk6o9/ZpdSa6KQEunMamxzL/CUkBFXmGv2spDMN
 Zwcls0MhoXc6NBJUC/MEAcZTp8ZvV53JAve0BAEaOGg/7yvrXfwym9PYlJrf6CiTs3Mw
 1t6g==
X-Gm-Message-State: ACrzQf3SAXfHgHPQ1Pbdkn9vx1y4wxo8d7KiYH+ogi8B0mwdM63Sf4vH
 JH+webNYTRj7KltSq9kmGKOsOhfWZ/VDPszObJiuFZv68HfhZwaVH0zHYrhatkqTFfmercjGFI1
 Dv1FbkuR7SdkQQaN0fRCKXF/9KnlxosQ=
X-Received: by 2002:a17:90a:6845:b0:210:7ef5:ab99 with SMTP id
 e5-20020a17090a684500b002107ef5ab99mr34000346pjm.80.1666681641500; 
 Tue, 25 Oct 2022 00:07:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GmZavJZqO9l+i1cR+rus/xzU29SxwkexVN+UrEkl0Ot4e4WizW3aX28K3cjqNYB1tKEdOkgoT5NKhLgo7ppY=
X-Received: by 2002:a17:90a:6845:b0:210:7ef5:ab99 with SMTP id
 e5-20020a17090a684500b002107ef5ab99mr34000316pjm.80.1666681641240; Tue, 25
 Oct 2022 00:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221020155251.398735-3-eperezma@redhat.com>
 <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
 <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
 <20221021041453-mutt-send-email-mst@kernel.org>
 <CACGkMEvNoxKcFBpawaWgtq=YgCh4CXMDD9Y5DUgoZ1Qn-zOwpA@mail.gmail.com>
 <CAJaqyWfVEb8cp4c0m_LEjy-aMCmHMuMUao6zaCOFW3EzyuLF6Q@mail.gmail.com>
 <20221024100442-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221024100442-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 25 Oct 2022 09:06:44 +0200
Message-ID: <CAJaqyWf4LCmU_pu=6+PhC_TCj5SoFKfXZRvsRqwuiRqbh7SY8w@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost: toggle device callbacks using used event idx
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 24, 2022 at 4:06 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 24, 2022 at 04:00:37PM +0200, Eugenio Perez Martin wrote:
> > > > It's generally a waste that we don't use endian-ness annotations
> > > > the way linux does.
> > >
> > > Yes, it's worth doing something similar sometime.
> > >
> >
> > Maybe we could wrap them in some struct like virtio_le16 or virtio_16,
> > avoiding at least integer direct assignment? Wrappers like
> > cpu_to_virtio16 could return these structs and I think all compilers
> > should emit the same code as direct assignment.
> >
> > Thanks!
> >
>
> This will break bitwise operations such as | and &.
> Generally Linux has solved the problem and I don't think
> we should go look for another solution.
>

That's right, we would need to do it with functions like we do with
the Int128 type. The idea is the same, do not mix operations with
bitwise integers and cpu type ones.

But I totally agree a sparse tag or similar is way more clean and convenient.


>
> >
> >
> > > Thanks
> > >
> > > >
> > > >
> > > > > > Thanks
> > > > > >
> > > > > > > +    } else {
> > > > > > > +        svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    /* Make sure the event is enabled before the read of used_idx */
> > > > > > >      smp_mb();
> > > > > > >      return !vhost_svq_more_used(svq);
> > > > > > >  }
> > > > > > >
> > > > > > >  static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
> > > > > > >  {
> > > > > > > -    svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > +    /*
> > > > > > > +     * No need to disable notification in the event idx case, since used event
> > > > > > > +     * index is already an index too far away.
> > > > > > > +     */
> > > > > > > +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > > > > > > +        svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > +    }
> > > > > > >  }
> > > > > > >
> > > > > > >  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
> > > > > > > --
> > > > > > > 2.31.1
> > > > > > >
> > > > > >
> > > >
> > >
>


