Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7B46C52AB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:39:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2QV-0002Wx-3n; Wed, 22 Mar 2023 13:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pf2QQ-0002Wg-1R
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pf2QO-0003mQ-Et
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679506739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zq+9E9Roc1/UuH6VmO8QzrMJmn659T4/ph0JCaaWqwY=;
 b=YaN6b4NqX3D9Mn48ShNWMsevjkICiHb6Y/5m5ariqFiznRUHc+S3Jto90mqmZ5BzK5RwyR
 0Q4CJDeLQ+CGunZGiWdlJwPoQhzamwIbgjJHPmVlN5VNMvKyJBPhszlJ6Pd9y5mFniH4Hv
 XmmYV8T8ms5yg9lonb9lIGWtMvqDBSY=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-mrQogYP-Os-a6tzxaPQ3tQ-1; Wed, 22 Mar 2023 13:38:58 -0400
X-MC-Unique: mrQogYP-Os-a6tzxaPQ3tQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 g187-20020a2520c4000000b00b74680a7904so451821ybg.15
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679506737;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zq+9E9Roc1/UuH6VmO8QzrMJmn659T4/ph0JCaaWqwY=;
 b=VhcDQu5PO6hLeXpRTCtHXA8uLH0FMLLmjil9wCHyHDvN+OIBiJfCrZr1xqBh9cNbUL
 igUFKZM9+9//3kiwuqWc8/GtWWYhoKoeZgqFEiuPKfDYThr6tsc2J6qo2W4ac4GjQ5ff
 A7QZATSA80MZ9lAp8/DCxmcFLNZb4cYxaw4xtQiEwEwrRLgnEGpmUkLPAYFgz413MkeF
 KdnXh46o/M2BO1ErdBdytCxHh8OduuoJ6nHTJtiTaoFyIND0cF1C+QH10QhdDFyjuQA/
 c5fCfCNMiAMhhTnx0lRe+TSut9I0m+JYm4nw7J+lietzHRUqsahSZZx3QGa6mDhavmc6
 TItg==
X-Gm-Message-State: AAQBX9fij4ltmUyTCXjMKcamzxGcOpDS4oawnAA904zt6zfSA6bQTXsw
 BCLL4u5DxNW5H7t/8zJJEsIHVCE9ESZnSITFNIwVtIwM3osJ+3yf3y5rH2qg+1435lGykMsW63c
 sQVhDtOeMOlk6CdbAXseZUd0H7qZDq1I=
X-Received: by 2002:a05:6902:1244:b0:b73:caa7:f05e with SMTP id
 t4-20020a056902124400b00b73caa7f05emr437664ybu.2.1679506737518; 
 Wed, 22 Mar 2023 10:38:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z4dh9OHnCJksLPKe7yuF8A2UZu5Wv+htFBt3ODh+VCsrqALaJ+lC8t0uASUJag8/lWAZ1kpbd5q4F4OtRUYeY=
X-Received: by 2002:a05:6902:1244:b0:b73:caa7:f05e with SMTP id
 t4-20020a056902124400b00b73caa7f05emr437647ybu.2.1679506737276; Wed, 22 Mar
 2023 10:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-5-eperezma@redhat.com>
 <20230322142634.imcnk7k6q5btze7v@sgarzare-redhat>
In-Reply-To: <20230322142634.imcnk7k6q5btze7v@sgarzare-redhat>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 22 Mar 2023 18:38:21 +0100
Message-ID: <CAJaqyWeE4_RgPp8bi0fN444BNzvAvxpCAYX2_OTKseD7iGp47g@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.1 4/6] vdpa: return errno in
 vhost_vdpa_get_vring_group error
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, alvaro.karsz@solid-run.com, 
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 si-wei.liu@oracle.com, longpeng2@huawei.com, Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Wed, Mar 22, 2023 at 3:26=E2=80=AFPM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Fri, Mar 17, 2023 at 03:55:40PM +0100, Eugenio P=C3=A9rez wrote:
> >We need to tell in the caller, as some errors are expected in a normal
> >workflow.  In particular, parent drivers in recent kernels with
> >VHOST_BACKEND_F_IOTLB_ASID may not support vring groups.  In that case,
> >-ENOTSUP is returned.
>
> So, should we also avoid the error_report if we expect a failure?
>

It's actually replaced by error_setg in next patches, but I think it
is worth commenting on the patch message for sure.

Thanks!


