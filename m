Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B16400CF5
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:47:04 +0200 (CEST)
Received: from localhost ([::1]:46172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcZ5-0007AE-6a
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMcTf-0000jI-Kc
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMcTM-0006F4-Fc
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630788067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f/zbCx2U2wXkKeVQqYZdA4XIetwzShEPzDeg4YhV/Qs=;
 b=FKOPV4oh+tGMUyWd07sn7hjUa1kEJaX5FzS9bpLnrk4Q7D6JH7Qn3lse0bZCsozAkgjnea
 LHQ6v4qXyGTIKrI5l07BDqnfxSorJ+HKAgfLH4trOCfUt9IUZ++0RiFphXKecIdVoXr0EO
 hXG0so5Il9SfldLixoDcf7Cit3Fjq+4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-j4_qPYL9OAycjLPgnx4VZQ-1; Sat, 04 Sep 2021 16:41:06 -0400
X-MC-Unique: j4_qPYL9OAycjLPgnx4VZQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 u2-20020aa7d982000000b003cda80fa659so194221eds.14
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f/zbCx2U2wXkKeVQqYZdA4XIetwzShEPzDeg4YhV/Qs=;
 b=gG66UGMX74dohW8tFXBQlTkLedYDpJTmB1/1LYjlgnyf9ojk8EYkoUGICb9FLtazXV
 2n5wAtWwjX3k8eDpoO9qFFywHQxAzLcXizT8NAimMl4Y4BPJqGJi3RqBnHHOBfBVvxpq
 eYTOuIsUKhOVQkHQRNqoFlYEwHiqgjWuuOH5jctm/jbKIgETdo4uObgRLrZSI1xbQmt8
 30pWUR0IPBYmauY+wULRXbjOzCylEM7ifqFLkrBk3YiN6x7FuHJZ0CjOUVXNMEnlI2Gv
 rTqz9mB/ieb7qzEHWsnvnF7JZPUnDSi/1Aqs4NfDZzkqR5Cfxhqan2bCiyeGiqrp2SgH
 LZFg==
X-Gm-Message-State: AOAM531Itw5muoDPfQLhvthJ8ej2LrOzDgmxSF4K5nxbR8rcY8+p2oFm
 deNk8J3DM9NPCmWSnPV0Lvkc+0IDKgGT2+GJpuP/F8EmY2rJmXk0SKDfquxxFzf2SPqeqqsKk/B
 PZqWfZPf3HaDWiiA=
X-Received: by 2002:a17:906:608e:: with SMTP id
 t14mr5722069ejj.441.1630788065445; 
 Sat, 04 Sep 2021 13:41:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0pdHsNFKoj3Uh1iuhtHA/lXB+srWx+AVe1ldkgjkfhUGZLHYoNAK8+DPL6djAtPLfmvknZA==
X-Received: by 2002:a17:906:608e:: with SMTP id
 t14mr5722053ejj.441.1630788065246; 
 Sat, 04 Sep 2021 13:41:05 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id r16sm1869132edt.15.2021.09.04.13.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:41:04 -0700 (PDT)
Date: Sat, 4 Sep 2021 16:41:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 12/21] vhost-vdpa: open device fd in
 net_init_vhost_vdpa()
Message-ID: <20210904164049-mutt-send-email-mst@kernel.org>
References: <20210903091031.47303-1-jasowang@redhat.com>
 <20210903091031.47303-13-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903091031.47303-13-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: lulu@redhat.com, qemu-devel@nongnu.org, gdawar@xilinx.com,
 eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 05:10:22PM +0800, Jason Wang wrote:
> This path switches to open device fd in net_init_vhost_vpda(). This is

patch?

> used to prepare for the multiqueue support.
> 
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  net/vhost-vdpa.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 912686457c..73d29a74ef 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -156,24 +156,19 @@ static NetClientInfo net_vhost_vdpa_info = {
>  };
>  
>  static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
> -                               const char *name, const char *vhostdev)
> +                               const char *name, int vdpa_device_fd)
>  {
>      NetClientState *nc = NULL;
>      VhostVDPAState *s;
> -    int vdpa_device_fd = -1;
>      int ret = 0;
>      assert(name);
>      nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
>      snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
>      s = DO_UPCAST(VhostVDPAState, nc, nc);
> -    vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
> -    if (vdpa_device_fd == -1) {
> -        return -errno;
> -    }
> +
>      s->vhost_vdpa.device_fd = vdpa_device_fd;
>      ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
>      if (ret) {
> -        qemu_close(vdpa_device_fd);
>          qemu_del_net_client(nc);
>      }
>      return ret;
> @@ -201,6 +196,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>                          NetClientState *peer, Error **errp)
>  {
>      const NetdevVhostVDPAOptions *opts;
> +    int vdpa_device_fd, ret;
>  
>      assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>      opts = &netdev->u.vhost_vdpa;
> @@ -209,5 +205,16 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>                            (char *)name, errp)) {
>          return -1;
>      }
> -    return net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, opts->vhostdev);
> +
> +    vdpa_device_fd = qemu_open_old(opts->vhostdev, O_RDWR);
> +    if (vdpa_device_fd == -1) {
> +        return -errno;
> +    }
> +
> +    ret = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
> +    if (ret) {
> +        qemu_close(vdpa_device_fd);
> +    }
> +
> +    return ret;
>  }
> -- 
> 2.25.1


