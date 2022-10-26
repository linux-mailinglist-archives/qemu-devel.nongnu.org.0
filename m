Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E595860E405
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 17:03:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onhtY-0005ri-W9; Wed, 26 Oct 2022 11:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onhtV-0004xL-I6
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 11:00:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onhtT-000888-7W
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 11:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666796434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rwz47dLM88EZ92LdhddzcbVRnJPvWxFFALr1Yikwm5s=;
 b=KZbpDtIGmlcRlj6k2ok/xywdG7Ob1qEzw+qhzS2riQzVwmrP/EtgzGu/Ui4RFxg14JvZm/
 PBVgQCF3Ls+zqU95mNdjBH+3azU+hBcNFf4YlDIcQop1Hx2iA84S4pjtIOTE9kCxT7W9np
 g05MQ6D0MOm7Z5ERuUxSO1FnqWSA2T4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-v3LdofGkPRmEUftZsSo1aQ-1; Wed, 26 Oct 2022 11:00:32 -0400
X-MC-Unique: v3LdofGkPRmEUftZsSo1aQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so375265wmg.0
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 08:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rwz47dLM88EZ92LdhddzcbVRnJPvWxFFALr1Yikwm5s=;
 b=AkU9VMkmRQKssodJIbARqXr6ojWZRxBoHQGq+Dq0dpjSGkQ+KcpDEWIAkL4EhGc3Yz
 D/r+jnEY4hnidNdAiMoFZs3QLokWcjesmqqvFvCzfCYP+DvNP6OK6tmt+silAlK6vUDU
 HBWCMuZt+NzbConBZF/E41TLgTlRmBsN0qvY67xj8N128Y648SVfZPIdcZsEZExzNJ/f
 oIQWgmh/Wr95qmGmi+iKYHuaO3h+YsC+uk4QmPHWlqid3A8w4W6id7NCXmbocO9jP4k+
 8WSgzQ7onHZTuLwNSH9qT2jzu/E19R4tDdXaAH6baPwWctkzgXMuE7sO5pY5kvdA7KO3
 nTCw==
X-Gm-Message-State: ACrzQf3y6azkAnHzTF4xPNwIWFHnVVRI7nIsLUgUt5BJeZ7nzfg394sn
 staKxd7e4kjDHJmApYLkJ/stfkVLIPMMJgOysQxEU1V4wE49aPGQR+kTYp9nKWpmHVxRHfbRgpm
 rtcAcX3YEkD7C408=
X-Received: by 2002:adf:e907:0:b0:236:5d8d:5525 with SMTP id
 f7-20020adfe907000000b002365d8d5525mr16616620wrm.431.1666796431022; 
 Wed, 26 Oct 2022 08:00:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4qCdkCeUncmGK1NINmRBzQjE+OyTsrY0yUrb4l4ED6QMv852+/NW91bHZiuL0rgMezd0zoOA==
X-Received: by 2002:adf:e907:0:b0:236:5d8d:5525 with SMTP id
 f7-20020adfe907000000b002365d8d5525mr16616602wrm.431.1666796430738; 
 Wed, 26 Oct 2022 08:00:30 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 m10-20020adfe0ca000000b00236627c078esm5483285wri.110.2022.10.26.08.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:00:30 -0700 (PDT)
Date: Wed, 26 Oct 2022 11:00:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 tugy@chinatelecom.cn, baiyw2@chinatelecom.cn,
 dengpc12@chinatelecom.cn, liuym16@chinatelecom.cn,
 yangchg@chinatelecom.cn, yuanmh12@chinatelecom.cn,
 zhoupx@chinatelecom.cn, lic121@chinatelecom.cn
Subject: Re: [PATCH 0/2] Fix the virito features negotiation flaw
Message-ID: <20221026105516-mutt-send-email-mst@kernel.org>
References: <20220926063641.25038-1-huangy81@chinatelecom.cn>
 <fddba10c-5b3e-c166-d464-8c7cc2ac7ffc@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fddba10c-5b3e-c166-d464-8c7cc2ac7ffc@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

I guess I'll apply this. Can you fix a typo in subject though?
Would also be nice if we had a test for this behaviour.


On Wed, Oct 05, 2022 at 04:17:30PM +0800, Hyman Huang wrote:
> Ping,
>    Hi, Michael and Jason, how does this patchset feel think? :)
>    Sorry if i made noise.
> 
> Yong
> 
> 在 2022/9/26 14:36, huangy81@chinatelecom.cn 写道:
> > From: "Hyman Huang(黄勇)" <huangy81@chinatelecom.cn>
> > 
> > This patchset aim to fix the unexpected negotiation features for
> > vhost-user netdev interface.
> > 
> > Steps to reproduce the issue:
> > Prepare a vm (CentOS 8 in my work scenario) with vhost-user
> > backend interface and configure qemu as server mode. So dpdk
> > would connect qemu's unix socket periodically.
> > 
> > 1. start vm in background and restart openvswitch service
> >     concurrently and repeatedly in the process of vm start.
> > 
> > 2. check if negotiated virtio features of port is "0x40000000" at
> >     dpdk side by executing:
> >     ovs-vsctl list interface | grep features | grep {port_socket_path}
> > 3. if features equals "0x40000000", go to the vm and check if sending
> >     arp package works, executing:
> >     arping {IP_ADDR}
> >     if vm interface is configured to boot with dhcp protocol, it
> >     would get no ip.
> > 
> > After doing above steps, we'll find the arping not work, the ovs on
> > host side has forwarded unexpected arp packages, which be added 0x0000
> > in the head of ethenet frame.  Though qemu report some error when
> > read/write cmd of vhost protocol during the process of vm start,
> > like the following:
> > 
> > "Failed to set msg fds"
> > "vhost VQ 0 ring restore failed: -22: Invalid argument (22)"
> > 
> > The vm does not stop or report more suggestive error message, it
> > seems that everthing is ok.
> > 
> > The root cause is that dpdk port negotiated nothing but only one
> > VHOST_USER_F_PROTOCOL_FEATURES feature with vhost-user interface at
> > qemu side, which is an unexpected behavior. qemu only load the
> > VHOST_USER_F_PROTOCOL_FEATURES when VHOST_USER_SET_FEATURES and loss
> > the guest features configured by front-end virtio driver using the
> > VIRTIO_PCI_COMMON_GF addr, which is stored in acked_features field
> > of struct vhost_dev.
> > 
> > To explain how the acked_features disappear, we may need to know the
> > lifecyle of acked_features in vhost_dev during feature negotiation.
> > 
> > 1. qemu init acked_features field of struct vhost_dev in vhost_net_init()
> >     by calling vhost_net_ack_features(), the init value fetched from
> >     acked_features field of struct NetVhostUserState, which is the backup
> >     role after vhost stopping or unix socket closed.
> >     In the first time, the acked_features of struct NetVhostUserState is 0
> >     so the init value of vhost_dev's acked_features also 0.
> > 
> > 2. when guest virtio driver set features, qemu accept the features and
> >     call virtio_set_features to store the features as acked_features in
> >     vhost_dev.
> > 
> > 3. when unix socket closed or vhost_dev device doesn't work and be
> >     stopped unexpectedly, qemu will call chr_closed_bh or vhost_user_stop,
> >     which will copy acked_features from vhost_dev to NetVhostUserState and
> >     cleanup the vhost_dev. Since virtio driver not allowed to set features
> >     once status of virtio device changes to VIRTIO_CONFIG_S_FEATURE_OK,
> >     qemu need to backup it in case of loss.
> > 4. once unix socket return to normal and get connected, qemu will
> >     call vhost_user_start to restore the vhost_dev and fetch the
> >     acked_features stored in NetVhostUserState previously.
> > 
> > The above flow works fine in the normal scenarios, but it doesn't cover
> > the scenario that openvswitch service restart in the same time of
> > virtio features negotiation.
> > 
> > Let's analyze such scenario:
> >         qemu                                 dpdk
> > 
> >     vhost_net_init()
> >           |                      systemctl stop openvswitch.service
> >     virtio_set_features()                     |
> >           |                      systemctl start openvswitch.service
> >     virtio_set_status()
> > 
> > Ovs stop service before guset setting virtio features, chr_closed_bh()
> > be called and fetch acked_features in vhost_dev, if may store the
> > incomplete features to NetVhostUserState since it doesn't include
> > guest features, eg "0x40000000".
> > 
> > Guest set virtio features with another features, eg "0x7060a782",
> > this value will store in acked_features of vhost_dev, which is the
> > right and up-to-date features.
> > 
> > After ovs service show up, qemu unix socket get connected and call
> > vhost_user_start(), which will restore acked_features of vhost_dev
> > using NetVhostUserState and "0x40000000" be loaded, which is obsolete.
> > 
> > Guest set virtio device status and therefore qemu call
> > virtio_net_vhost_status finally, checking if vhost-net device has
> > started, start it if not, consequently the obsolete acked_features
> > "0x40000000" be negotiated after calling vhost_dev_set_features().
> > 
> > So the key point of solving this issue making the acked_features
> > in NetVhostUserState up-to-date, these patchset provide this
> > solution.
> > 
> > [PATCH 1/2]: Abstract the existing code of saving acked_features
> >               into vhost_user_save_acked_features so the next
> >               patch seems clean.
> > 
> > [PATCH 2/2]: Save the acked_features to NetVhostUserState once
> >               Guest virtio driver configured. This step makes
> >               acked_features in NetVhostUserState up-to-date.
> > 
> > Please review, any comments and suggestions are welcome.
> > 
> > Best regard.
> > 
> > Yong
> > 
> > Hyman Huang (2):
> >    vhost-user: Refactor vhost acked features saving
> >    vhost-net: Fix the virito features negotiation flaw
> > 
> >   hw/net/vhost_net.c       |  9 +++++++++
> >   hw/net/virtio-net.c      |  5 +++++
> >   include/net/vhost-user.h |  2 ++
> >   include/net/vhost_net.h  |  2 ++
> >   net/vhost-user.c         | 35 +++++++++++++++++++----------------
> >   5 files changed, 37 insertions(+), 16 deletions(-)
> > 
> 
> -- 
> Best regard
> 
> Hyman Huang(黄勇)


