Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CE05B805D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 06:43:35 +0200 (CEST)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYKFK-0005eU-QT
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 00:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYKDO-0003eg-UM
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYKDL-0005sq-G9
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663130490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F8gowJOezM0T9W8msL2K3yAKpdjxGSxZ9nyNWJWtjnY=;
 b=X27iqESGXDiQi65K0360sfriYFdKn6b1PtWh3/DkuAJc7PiOxvFlwM+3XrCJfXxTLQqCqE
 +6/exXRnzvKL/bzXJpOsJYCXjVjQgZ/RWWSwMUazhCYZK6nuQtzpmuCWF68LqjH7M5cVCV
 UKf1/JpMINcac4ooZXJdh8456YNQhPA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-SKCQ-uk6NRKzdU_SSkcXWg-1; Wed, 14 Sep 2022 00:41:28 -0400
X-MC-Unique: SKCQ-uk6NRKzdU_SSkcXWg-1
Received: by mail-vk1-f197.google.com with SMTP id
 e196-20020a1f1ecd000000b003a27f3f8d05so1518836vke.21
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 21:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=F8gowJOezM0T9W8msL2K3yAKpdjxGSxZ9nyNWJWtjnY=;
 b=gkpIxg+vVlJ78SowQMQkrMFlu9c839oiIutfytJ6UeOsXkZrgjIFc37MBD+xbN9x8O
 Etky0+TVW8jxrTNp5qSkNNimu1l8TE2TQRoMFbuKv/i41k3Eo7G9vWZZvK4g6K8TMPf3
 XuNJw+0A+HT8tX11vTKMwpeLVXtk6SGNCKEPzuERQ5i0zXFfR8vigKPGUXW93qENTQF2
 +7cetA1oMCJJe57CmdmO0674Ckroj9/F0vKWZL3vlDBKckqzhVHdUZrevK8hyo6e7blT
 6LrztQYtBnAsFFRgolHAgzhuVxIwRqZr/vohNgg23BoZoBCrYV7zQfgg5WUVzKHUlori
 Y4DA==
X-Gm-Message-State: ACgBeo3b/NTthWZ8e7Xth8qjrYW+RH8znYxkkc236+VaFyV4P/BqPE3V
 aRgyRa26FPlGaxCQTbpolK0Yw6mJTBIZqN+gclJx2oR+dVlAgvaT3W0o2geXZrCEC/ivZpxMMl1
 OdTaY+lj7unPrvtMXaA7IcETb9ahJSdc=
X-Received: by 2002:a05:6102:a84:b0:357:c234:8041 with SMTP id
 n4-20020a0561020a8400b00357c2348041mr11020252vsg.25.1663130488208; 
 Tue, 13 Sep 2022 21:41:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6qg40b2r8RmEUJI1u0IbI+8BrFJ0oaCvK+hWYOPoxYAwhxkGFAbkRIy6ImBwZ+KrJWA3DsBwfmndqo641umj4=
X-Received: by 2002:a05:6102:a84:b0:357:c234:8041 with SMTP id
 n4-20020a0561020a8400b00357c2348041mr11020248vsg.25.1663130488005; Tue, 13
 Sep 2022 21:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220826160543.2120-1-dinghui@sangfor.com.cn>
 <CACGkMEtN3=6GAvYfjTstk_JFa+8nKGsWN5NzR+TRD4LfxyS9XA@mail.gmail.com>
 <5660954c-362c-289a-933e-97bd7c236b99@sangfor.com.cn>
In-Reply-To: <5660954c-362c-289a-933e-97bd7c236b99@sangfor.com.cn>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 14 Sep 2022 12:41:17 +0800
Message-ID: <CACGkMEtMYBjJuiXj-OMqPSFf52cyqdRrWv3k8P-op4w7s4hR=g@mail.gmail.com>
Subject: Re: [PATCH] e1000e: set RX desc status with DD flag in a separate
 operation
To: dinghui <dinghui@sangfor.com.cn>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, georgmueller@gmx.net
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 9, 2022 at 7:20 PM dinghui <dinghui@sangfor.com.cn> wrote:
>
> On 2022/9/9 10:40, Jason Wang wrote:
> > On Sat, Aug 27, 2022 at 12:06 AM Ding Hui <dinghui@sangfor.com.cn> wrote:
> >>
> >> Like commit 034d00d48581 ("e1000: set RX descriptor status in
> >> a separate operation"), there is also same issue in e1000e, which
> >> would cause lost packets or stop sending packets to VM with DPDK.
> >>
> >> Do similar fix in e1000e.
> >>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/402
> >> Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
> >> ---
> >>   hw/net/e1000e_core.c | 54 +++++++++++++++++++++++++++++++++++++++++++-
> >>   1 file changed, 53 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> >> index 208e3e0d79..b8038e4014 100644
> >> --- a/hw/net/e1000e_core.c
> >> +++ b/hw/net/e1000e_core.c
> >> @@ -1364,6 +1364,58 @@ struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
> >>       }
> >>   }
> >>
> >> +static inline void
> >> +e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
> >> +                             uint8_t *desc, dma_addr_t len)
> >> +{
> >> +    PCIDevice *dev = core->owner;
> >> +
> >> +    if (e1000e_rx_use_legacy_descriptor(core)) {
> >> +        struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
> >> +        size_t offset = offsetof(struct e1000_rx_desc, status);
> >> +        typeof(d->status) status = d->status;
> >> +
> >> +        d->status &= ~E1000_RXD_STAT_DD;
> >> +        pci_dma_write(dev, addr, desc, len);
> >> +
> >> +        if (status & E1000_RXD_STAT_DD) {
> >> +            d->status = status;
> >> +            pci_dma_write(dev, addr + offset, &status, sizeof(status));
> >> +        }
> >> +    } else {
> >> +        if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
> >> +            union e1000_rx_desc_packet_split *d =
> >> +                (union e1000_rx_desc_packet_split *) desc;
> >> +            size_t offset = offsetof(union e1000_rx_desc_packet_split,
> >> +                wb.middle.status_error);
> >> +            typeof(d->wb.middle.status_error) status =
> >> +                d->wb.middle.status_error;
> >
> > Any reason to use typeof here? Its type is known to be uint32_t?
> >
>
> My intention was using exact type same with struct member status_error,
> which is indeed uint32_t now. If the type of status_error in struct be
> changed in some case, we do not need to change everywhere.
>
> Maybe I worry too much, the struct is related to h/w spec, so it is
> unlikely be changed in the future.
>
> Should I send v2 to use uint32_t directly? I'm also OK with it.

Yes, please.

Thanks

>
> >> +
> >> +            d->wb.middle.status_error &= ~E1000_RXD_STAT_DD;
> >> +            pci_dma_write(dev, addr, desc, len);
> >> +
> >> +            if (status & E1000_RXD_STAT_DD) {
> >> +                d->wb.middle.status_error = status;
> >> +                pci_dma_write(dev, addr + offset, &status, sizeof(status));
> >> +            }
> >> +        } else {
> >> +            union e1000_rx_desc_extended *d =
> >> +                (union e1000_rx_desc_extended *) desc;
> >> +            size_t offset = offsetof(union e1000_rx_desc_extended,
> >> +                wb.upper.status_error);
> >> +            typeof(d->wb.upper.status_error) status = d->wb.upper.status_error;
> >
> > So did here.
> >
> > Thanks
> >
> >> +
> >> +            d->wb.upper.status_error &= ~E1000_RXD_STAT_DD;
> >> +            pci_dma_write(dev, addr, desc, len);
> >> +
> >> +            if (status & E1000_RXD_STAT_DD) {
> >> +                d->wb.upper.status_error = status;
> >> +                pci_dma_write(dev, addr + offset, &status, sizeof(status));
> >> +            }
> >> +        }
> >> +    }
> >> +}
> >> +
> >>   typedef struct e1000e_ba_state_st {
> >>       uint16_t written[MAX_PS_BUFFERS];
> >>       uint8_t cur_idx;
> >> @@ -1600,7 +1652,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
> >>
> >>           e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
> >>                              rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
> >> -        pci_dma_write(d, base, &desc, core->rx_desc_len);
> >> +        e1000e_pci_dma_write_rx_desc(core, base, desc, core->rx_desc_len);
> >>
> >>           e1000e_ring_advance(core, rxi,
> >>                               core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
> >> --
> >> 2.17.1
> >>
> >
> >
>
>
> --
> Thanks,
> - Ding Hui
>


