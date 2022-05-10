Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C6B520DAD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 08:16:55 +0200 (CEST)
Received: from localhost ([::1]:53490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noJAz-0004Ek-Ov
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 02:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1noJ8z-0003R4-Q0
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:14:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1noJ8v-0004eP-GH
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652163282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5jRBla1+oImwySxxd4X76TBQC3k0qYQ90+WpQ6uBwvI=;
 b=dhLuH3U6jCt/tMM4AXoOA4UYRBfJAURTA22AxVRwijPKXP8nCRHV6OkTZ4AfpOtNqvW4Bh
 3gK+fecL+JgPNONmYWp2MWl/lbn8lQJ7IDoOCqb/TBxWj+Khq4r6LU4+C0C3ZsoF0V0xqW
 EVtGQlAQc+dRwRtYY8z4tCE0aJXubA8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-ryIDv9xvOUaHlkzhEDw1sg-1; Tue, 10 May 2022 02:14:40 -0400
X-MC-Unique: ryIDv9xvOUaHlkzhEDw1sg-1
Received: by mail-lj1-f197.google.com with SMTP id
 x4-20020a05651c104400b0024f253d777fso4813009ljm.16
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 23:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5jRBla1+oImwySxxd4X76TBQC3k0qYQ90+WpQ6uBwvI=;
 b=d2glY3pqWX5PF2dy2hwq4ZZF1GYm9s+rA3plmw4RLYM9hY6dV8AzhwmR50So6S//+e
 qXt+RS9R3q+i0J0TcLWGrDKoddyrHRQtBKB+v019CnG7GdBvHPQ+SyWvui7vj+bG8BIG
 0zZ818bJLlHS/D0br5BjuaKBS6gaqwRu6BIxg2xAUhwzCyIKYbUxF+cdtkprEBSNV833
 A/rmp4maGRct+qVdK+Zh8D4y5vaSq8pyJ9j+ZLusXM9wsAMoPrkGyev1oM4S5dqrqDk+
 fjWlOCgYioLKEQwZyHv8PwTviLVZqMDtjcD+toslM9tsVEaaDDHXsfCBHbzIf3Fh6DHp
 kNcA==
X-Gm-Message-State: AOAM5304CtVlUrPhzlwRB64m8UnYECS2FZWrMyDei9es97rfP1AwPBCD
 mQYvuyuAGOQeyQZwn4iG3GlBrOs8HvD7GKidy7tvionuMPENpH/Z5uYWd30ZKWtlCFlADkVqvFW
 icOeDk7Z2BzdTuFzza5isg6FcrSGX3QU=
X-Received: by 2002:ac2:4e14:0:b0:474:1f4d:9b86 with SMTP id
 e20-20020ac24e14000000b004741f4d9b86mr8641435lfr.257.1652163279013; 
 Mon, 09 May 2022 23:14:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRt1OIiOIL8qZMzubVkDdH1YpxWFqM2XgHcl8p5KngaGN29ke6RnFYvwOOiFYz45tkAn1m5LgVCBt9cTfy/a8=
X-Received: by 2002:ac2:4e14:0:b0:474:1f4d:9b86 with SMTP id
 e20-20020ac24e14000000b004741f4d9b86mr8641421lfr.257.1652163278771; Mon, 09
 May 2022 23:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
 <1651890498-24478-7-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1651890498-24478-7-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 10 May 2022 14:14:27 +0800
Message-ID: <CACGkMEtkyX9mP=rYJBNZLTfiy1fkASoKr32fV8bTBoCjFqWYnw@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] vhost-vdpa: change name and polarity for
 vhost_vdpa_one_time_request()
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>, 
 eperezma <eperezma@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eli Cohen <eli@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Sat, May 7, 2022 at 10:28 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> The name vhost_vdpa_one_time_request() was confusing. No
> matter whatever it returns, its typical occurrence had
> always been at requests that only need to be applied once.
> And the name didn't suggest what it actually checks for.
> Change it to vhost_vdpa_first_dev() with polarity flipped
> for better readibility of code. That way it is able to
> reflect what the check is really about.
>
> This call is applicable to request which performs operation
> only once, before queues are set up, and usually at the beginning
> of the caller function. Document the requirement for it in place.
>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost-vdpa.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 6e3dbd9..33dcaa1 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -366,11 +366,18 @@ static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
>                                      v->iova_range.last);
>  }
>
> -static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
> +/*
> + * The use of this function is for requests that only need to be
> + * applied once. Typically such request occurs at the beginning
> + * of operation, and before setting up queues. It should not be
> + * used for request that performs operation until all queues are
> + * set, which would need to check dev->vq_index_end instead.
> + */
> +static bool vhost_vdpa_first_dev(struct vhost_dev *dev)
>  {
>      struct vhost_vdpa *v = dev->opaque;
>
> -    return v->index != 0;
> +    return v->index == 0;
>  }
>
>  static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
> @@ -451,7 +458,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>
>      vhost_vdpa_get_iova_range(v);
>
> -    if (vhost_vdpa_one_time_request(dev)) {
> +    if (!vhost_vdpa_first_dev(dev)) {
>          return 0;
>      }
>
> @@ -594,7 +601,7 @@ static int vhost_vdpa_memslots_limit(struct vhost_dev *dev)
>  static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
>                                      struct vhost_memory *mem)
>  {
> -    if (vhost_vdpa_one_time_request(dev)) {
> +    if (!vhost_vdpa_first_dev(dev)) {
>          return 0;
>      }
>
> @@ -623,7 +630,7 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
>      struct vhost_vdpa *v = dev->opaque;
>      int ret;
>
> -    if (vhost_vdpa_one_time_request(dev)) {
> +    if (!vhost_vdpa_first_dev(dev)) {
>          return 0;
>      }
>
> @@ -665,7 +672,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>
>      features &= f;
>
> -    if (!vhost_vdpa_one_time_request(dev)) {
> +    if (vhost_vdpa_first_dev(dev)) {
>          r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>          if (r) {
>              return -EFAULT;
> @@ -1118,7 +1125,7 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
>                                       struct vhost_log *log)
>  {
>      struct vhost_vdpa *v = dev->opaque;
> -    if (v->shadow_vqs_enabled || vhost_vdpa_one_time_request(dev)) {
> +    if (v->shadow_vqs_enabled || !vhost_vdpa_first_dev(dev)) {
>          return 0;
>      }
>
> @@ -1240,7 +1247,7 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
>
>  static int vhost_vdpa_set_owner(struct vhost_dev *dev)
>  {
> -    if (vhost_vdpa_one_time_request(dev)) {
> +    if (!vhost_vdpa_first_dev(dev)) {
>          return 0;
>      }
>
> --
> 1.8.3.1
>


