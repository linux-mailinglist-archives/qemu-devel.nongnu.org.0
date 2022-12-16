Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C44764E7D7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 08:39:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p65It-00030Q-M5; Fri, 16 Dec 2022 02:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p65Iq-0002zr-MR
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 02:38:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p65Io-00082t-Un
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 02:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671176322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mNp8yJ7tUW4cxW8MpA5fjqxVImjW6Oxj3KXRFhDTwPw=;
 b=VqTVCS/79wr9Jolz3yGwHY5ni+ziVlEr+2Vkl0KJvui88KvkoKzzoc37GJu27Sa5F6CVU5
 Ar9qjj+wnoBbJuaVRKhpPzKcOKXWvlR+BnW+sco/IHNRcghD+j+lgkHN9zjy7cI6N6XN5g
 Ye9btG6D64vsfbchHHJB2VhLd36g428=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-298-4wCntElOOguSd9H5JOyURQ-1; Fri, 16 Dec 2022 02:38:40 -0500
X-MC-Unique: 4wCntElOOguSd9H5JOyURQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1447ffe6046so955007fac.3
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 23:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mNp8yJ7tUW4cxW8MpA5fjqxVImjW6Oxj3KXRFhDTwPw=;
 b=okAEDYywBJDdX2l9GFKnMn4X1ng+jtQidd2RK1ROsvlW3fJj3MKeslvETAR/WFPrhH
 YqRWoO8W5mmWj0vgizq+AzrFnNRaCEPnfX/zZ29wMEuHKWXPmraVH+zEUXHZWpX4sKen
 8KqD/Cg0aBW1ITd01EE85hILfga5J6Tiv0gvS+QzNdqNMLto2D2CGxoAOp8K9dTz9f9v
 BJVlPdaLcorrUtZISVFxzTXHSPdQ5R0ltZtAsj6qQexQ6kXl/UXjvsu7rvoUZR5YKmmt
 uHcjPf/lJuqkazVfynUd8ImcOho7t/hnqmoYyKYAGyPNS81IiOOx/R3TfCwYu4dDMi3D
 vYtg==
X-Gm-Message-State: ANoB5plImfSKh6zU8eZ0BGGxqZFbf2218OPZD7ePrQWTYVEfRiKE5yJi
 qPzQWDkE4gao/3YrpqLhBmPx2OCvrBklnQ/7Bk4DHXCEbNWNkz2ac2uzn8cKn5SHJn3C+ILwlmj
 oSay0b+n+wBFtNNe8oGigmGfl2t4vmnE=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr49202331otb.237.1671176320103; 
 Thu, 15 Dec 2022 23:38:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7TzHa8ZuXEdPufE1BnV8b7QP1/24LdAYSU3aFhjxiw6PIPyJ1B2tzlmpHMcTBkeXsitNCJhcGFuoLjbEbsP90=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr49202326otb.237.1671176319849; Thu, 15
 Dec 2022 23:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20220825092910.23922-1-f.ebner@proxmox.com>
 <f71d7c3e-fb0a-a425-6193-a4956015e2be@proxmox.com>
In-Reply-To: <f71d7c3e-fb0a-a425-6193-a4956015e2be@proxmox.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 16 Dec 2022 15:38:28 +0800
Message-ID: <CACGkMEt0F9OBL7kLqeL3OfpVLZuMEFX=UnvJ+S79mn7Axmnk-g@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, dmitry.fleytman@gmail.com, pj.pandit@yahoo.co.in
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Dec 14, 2022 at 5:43 PM Fiona Ebner <f.ebner@proxmox.com> wrote:
>
> Am 25.08.22 um 11:29 schrieb Fiona Ebner:
> > Currently, VMXNET3_MAX_MTU itself (being 9000) is not considered a
> > valid value for the MTU, but a guest running ESXi 7.0 might try to
> > set it and fail the assert [0].
> >
> > In the Linux kernel, dev->max_mtu itself is a valid value for the MTU
> > and for the vmxnet3 driver it's 9000, so a guest running Linux will
> > also fail the assert when trying to set an MTU of 9000.
> >
> > VMXNET3_MAX_MTU and s->mtu don't seem to be used in relation to buffer
> > allocations/accesses, so allowing the upper limit itself as a value
> > should be fine.
> >
> > [0]: https://forum.proxmox.com/threads/114011/
> >
> > Fixes: d05dcd94ae ("net: vmxnet3: validate configuration values during activate (CVE-2021-20203)")
> > Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> > ---
> >
> > Feel free to adapt the commit message as you see fit.
> >
> > v1 -> v2:
> >     * Add commit message with some rationale.
> >
> >  hw/net/vmxnet3.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> > index 0b7acf7f89..a2037583bf 100644
> > --- a/hw/net/vmxnet3.c
> > +++ b/hw/net/vmxnet3.c
> > @@ -1441,7 +1441,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
> >      vmxnet3_setup_rx_filtering(s);
> >      /* Cache fields from shared memory */
> >      s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
> > -    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
> > +    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu <= VMXNET3_MAX_MTU);
> >      VMW_CFPRN("MTU is %u", s->mtu);
> >
> >      s->max_rx_frags =
>
> Ping

I've queued this patch.

Thanks

>


