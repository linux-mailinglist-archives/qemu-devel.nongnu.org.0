Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F4E6CFB5F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 08:16:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phlZx-0008UB-4S; Thu, 30 Mar 2023 02:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phlZv-0008T5-0B
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phlZt-0000kE-CV
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680156964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgBL2P0pmfRIqYs1ORRV1oa4lnksc1eO9OlVmL/lEe4=;
 b=aV3b2dPdLqPwxJW2QEq8xwbiqk/q/o6gs5uBaTdjWz3SKrHPEHgn7dTBwPW7VduzgPRSmR
 CUIFgDjjfVY1hddqa145tgktqK3z/JcuiKsiu5v6UE5sva6rHO7zjhfDn93AtrVF2ZnTSp
 pEUtVyl8HFA+Uv+REnnP+lJutTKLCNA=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-zjTj8KikOVa1BrNAbjndeQ-1; Thu, 30 Mar 2023 02:16:03 -0400
X-MC-Unique: zjTj8KikOVa1BrNAbjndeQ-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-17a03f26ff8so9339079fac.8
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 23:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680156963; x=1682748963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgBL2P0pmfRIqYs1ORRV1oa4lnksc1eO9OlVmL/lEe4=;
 b=8D3YNu915q1o0xJ2JSPUJUwLeXWqw5KLEwMSBjezoMEreLl5eeHFWKItXqQBMq+a2q
 Ott3Y8L4YtsK13Cgoapl7gUmFpb1eVIP8Z0IBvG2CfxFVILhxKdzgZIGzN3U1gWjXmAx
 hxVjkCEouzfkY2cuax1Mo+3vdk2/RK2V4cIHvsM3ooetnDojv25sZkde6bTKCCNZFSJs
 dUQAmW4i66xb44K3kFkQhHM/F9E/4eU75SeA6B0HlkScLF405OCpY6dQfmQEjP4fER6K
 PyAdr104R77jNOZlXUPGcWGXK+E5H6bg0DrIQ5L9SAeFZ74D+J17Jx7mPxaJlenB1/46
 un2Q==
X-Gm-Message-State: AO0yUKVtwC8DSEMHdcM5i++zKQm5dDcLgfnm/HVI7/RHgtKYQOPdyAms
 Bpmzc1roL9SWan2+6TsUZ+Df3Vu8MMGM90/564lnsMEBwXDlh6HPS8w2hWNEU3KtB7ZRUbf3cHv
 uwlYQyPcIFL028mXIbkXP7lueXaB2LmY=
X-Received: by 2002:aca:916:0:b0:383:fad3:d19 with SMTP id
 22-20020aca0916000000b00383fad30d19mr6567410oij.9.1680156962977; 
 Wed, 29 Mar 2023 23:16:02 -0700 (PDT)
X-Google-Smtp-Source: AK7set+/5R7HCa5W3CM4FAHM5JZiswAGUf5UXevfgtqYvgwnL50YFQ0fXizS6L9GqcP03056U9QUkjYLyNUvRP9iRT8=
X-Received: by 2002:aca:916:0:b0:383:fad3:d19 with SMTP id
 22-20020aca0916000000b00383fad30d19mr6567388oij.9.1680156962795; 
 Wed, 29 Mar 2023 23:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-5-eperezma@redhat.com>
In-Reply-To: <20230323195404.1247326-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 30 Mar 2023 14:15:51 +0800
Message-ID: <CACGkMEvGD2-zJs-JV_=hnkKZptyjYyOO-vSh35uAg1Lb8e8-4g@mail.gmail.com>
Subject: Re: [PATCH for 8.1 v2 4/6] vdpa: return errno in
 vhost_vdpa_get_vring_group error
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 24, 2023 at 3:54=E2=80=AFAM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
>
> We need to tell in the caller, as some errors are expected in a normal
> workflow.  In particular, parent drivers in recent kernels with
> VHOST_BACKEND_F_IOTLB_ASID may not support vring groups.  In that case,
> -ENOTSUP is returned.
>
> This is the case of vp_vdpa in Linux 6.2.
>
> Next patches in this series will use that information to know if it must
> abort or not.  Also, next patches return properly an errp instead of
> printing with error_report.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  net/vhost-vdpa.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 99904a0da7..4397c0d4b3 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -361,6 +361,14 @@ static NetClientInfo net_vhost_vdpa_info =3D {
>          .check_peer_type =3D vhost_vdpa_check_peer_type,
>  };
>
> +/**
> + * Get vring virtqueue group
> + *
> + * @device_fd  vdpa device fd
> + * @vq_index   Virtqueue index
> + *
> + * Return -errno in case of error, or vq group if success.
> + */
>  static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_ind=
ex)
>  {
>      struct vhost_vring_state state =3D {
> @@ -369,6 +377,7 @@ static int64_t vhost_vdpa_get_vring_group(int device_=
fd, unsigned vq_index)
>      int r =3D ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
>
>      if (unlikely(r < 0)) {
> +        r =3D -errno;
>          error_report("Cannot get VQ %u group: %s", vq_index,
>                       g_strerror(errno));
>          return r;
> --
> 2.31.1
>


