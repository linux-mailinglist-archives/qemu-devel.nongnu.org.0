Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E46FB63A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 20:13:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw5Ks-0000vU-Ro; Mon, 08 May 2023 14:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pw5Km-0000uY-Eg
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pw5Kk-0002eR-PM
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683569496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rOVzPUBJ0Q+BKp+UL3hSIuQnYeoh2ItckY2JMbtMC00=;
 b=C9EdWzRIRV0d9d4dJ+EJcgDqcWMetfCgA8ZxvmwR2P+D6UfCv1z75Yc0GKHO1LJu689lOh
 MYkXZ1hQkPi02e9JR54aDZA6aWxS9WCpQlP2s2uQ4fFqUSqedcz7YHYSwFHRaiU9QqUfRk
 jPjJEg+duNwemobFpBi4htARv6UwKjA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-PE10vANhP9agVM-mtVlalA-1; Mon, 08 May 2023 14:11:34 -0400
X-MC-Unique: PE10vANhP9agVM-mtVlalA-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-61a66010dd7so23980236d6.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 11:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683569494; x=1686161494;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rOVzPUBJ0Q+BKp+UL3hSIuQnYeoh2ItckY2JMbtMC00=;
 b=UKpdX6I+K8A2ir5wLHoicPuASp8QfQtITQOlw6BtdObOh4uBuUM5CmB+6Y7XMRtUT2
 2fiV/5cf7W79yvt7utJVr2QnXMkyPNMb6XfCm1Bjp9K7K/muMr4x2JCU1EVv0Tpify8B
 wNLcfSzDVJNxfhEBNKSejGWnAYeGzrcG9frR1SYPFku+0ZUhshm2HBfmBZ/DsjooWU6w
 FN76TYJfkmMPiQ8D/bKbwqDTqbBgcsyFoj7WemwVXxrc2Gjygca9eR7XpvZhRVe+V9Z2
 wPI1k4O51m7d/TG5fArHbrOuwJ51qzpDAttcHDI5bUHaUXtshU84lf5xFO+uoYaLnxlo
 hfPQ==
X-Gm-Message-State: AC+VfDz3POCQJbG7svGZYGl0yOMqzZca+sSlWRIsFnsY1HeSCj0RPZgA
 b+5WpRZTrSSC9U6Dv4Maei6Dxb3EvNwR8pLUXWGajzWW47uDYqqkNl+L6dfeWoW8DreUHbhdO+g
 5WnPEd3dNcSXxf4A=
X-Received: by 2002:a05:6214:20e2:b0:61a:281b:9a5d with SMTP id
 2-20020a05621420e200b0061a281b9a5dmr13724636qvk.5.1683569494306; 
 Mon, 08 May 2023 11:11:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5teBtZhj3aQj66OlXwqgDuxvo+cuSzC/XDAv8zAScbWOY44nAAdl/Akgu3hXSdEZoSAlmW9g==
X-Received: by 2002:a05:6214:20e2:b0:61a:281b:9a5d with SMTP id
 2-20020a05621420e200b0061a281b9a5dmr13724611qvk.5.1683569494046; 
 Mon, 08 May 2023 11:11:34 -0700 (PDT)
Received: from redhat.com ([185.187.243.116]) by smtp.gmail.com with ESMTPSA id
 d14-20020a0cdb0e000000b0061b6d792ec2sm144536qvk.113.2023.05.08.11.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 11:11:33 -0700 (PDT)
Date: Mon, 8 May 2023 14:11:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Jason Wang <jasowang@redhat.com>, Lei Yang <leiyang@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
Message-ID: <20230508141103-mutt-send-email-mst@kernel.org>
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
 <CAJaqyWfzs00bi5qDHnyHVnf0vEK02hSiC15uJpGVi_eoRTmg7Q@mail.gmail.com>
 <20230508062210-mutt-send-email-mst@kernel.org>
 <CAJaqyWfVUJOPOpzibvW8iNtfizYzyCTQOxac-U86520pke3C4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWfVUJOPOpzibvW8iNtfizYzyCTQOxac-U86520pke3C4Q@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 08, 2023 at 07:31:35PM +0200, Eugenio Perez Martin wrote:
> On Mon, May 8, 2023 at 12:22 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, May 08, 2023 at 11:09:46AM +0200, Eugenio Perez Martin wrote:
> > > On Sat, May 6, 2023 at 4:25 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > >
> > > > On Thu,  4 May 2023 12:14:47 +0200, =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com> wrote:
> > > > > The commit 93a97dc5200a ("virtio-net: enable vq reset feature") enables
> > > > > unconditionally vq reset feature as long as the device is emulated.
> > > > > This makes impossible to actually disable the feature, and it causes
> > > > > migration problems from qemu version previous than 7.2.
> > > > >
> > > > > The entire final commit is unneeded as device system already enable or
> > > > > disable the feature properly.
> > > > >
> > > > > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > > > > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > > >
> > > > > ---
> > > > > Tested by checking feature bit at  /sys/devices/pci.../virtio0/features
> > > > > enabling and disabling queue_reset virtio-net feature and vhost=on/off
> > > > > on net device backend.
> > > >
> > > > Do you mean that this feature cannot be closed?
> > > >
> > > > I tried to close in the guest, it was successful.
> > > >
> > >
> > > I'm not sure what you mean with close. If the device dataplane is
> > > emulated in qemu (vhost=off), I'm not able to make the device not
> > > offer it.
> > >
> > > > In addition, in this case, could you try to repair the problem instead of
> > > > directly revert.
> > > >
> > >
> > > I'm not following this. The revert is not to always disable the feature.
> > >
> > > By default, the feature is enabled. If cmdline states queue_reset=on,
> > > the feature is enabled. That is true both before and after applying
> > > this patch.
> > >
> > > However, in qemu master, queue_reset=off keeps enabling this feature
> > > on the device. It happens that there is a commit explicitly doing
> > > that, so I'm reverting it.
> > >
> > > Let me know if that makes sense to you.
> > >
> > > Thanks!
> >
> >
> > question is this:
> >
> >     DEFINE_PROP_BIT64("queue_reset", _state, _field, \
> >                       VIRTIO_F_RING_RESET, true)
> >
> >
> >
> > don't we need compat for 7.2 and back for this property?
> >
> 
> I think that part is already covered by commit 69e1c14aa222 ("virtio:
> core: vq reset feature negotation support"). In that regard, maybe we
> can simplify the patch message simply stating that queue_reset=off
> does not work.
> 
> Thanks!

that compat for 7.1 and not 7.2 though? is that correct?


