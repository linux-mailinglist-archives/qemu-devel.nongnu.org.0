Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4384A56D698
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 09:21:00 +0200 (CEST)
Received: from localhost ([::1]:52498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAnj0-0007gK-9Y
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 03:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oAngb-0006BU-29
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:18:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oAngY-0007Sc-HY
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657523905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iz3BRPUWt+eOfqHvVpr7vhJh/c0kin9KYHcKXOjbc5M=;
 b=RE0LD9hItCjiGvYkGOMM68E6Z2t8eAN8Ldn5uqDmPj755ULARzI8jqLCiYMm3FPfxxDveZ
 CYQRa0ESrsdmJgcc8B14Nu/JuL012JbfYepZsthJHF2DkuwUEXWSdpM3UHaKECyd1z//R6
 Sh3/gE3D9R6Zpr8fgHvqyf3FGsM7SoY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-CqoZ0UYjNziPFVFfqNwDvQ-1; Mon, 11 Jul 2022 03:18:24 -0400
X-MC-Unique: CqoZ0UYjNziPFVFfqNwDvQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 f10-20020a05620a408a00b006b267fdf71fso4675546qko.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 00:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iz3BRPUWt+eOfqHvVpr7vhJh/c0kin9KYHcKXOjbc5M=;
 b=OKYx3zG5841mG2b64PUfT3rvpcF0MQxVY9jtRj79Q2tGtX1tGOYS8f4qPG0s4Qs630
 nApKdG4rtEmGa++/HtijfNUpnQXcUwmzHyOll2MJJraXf9DE2YVjUeUGQr1lldFaVhk6
 xL/PF3SS2M8KAswbUFQ/c7367pzM5YUZkp47l5SbOHpxnZ7HzpU56Att+vfM6WJ8hgUx
 Q+7fsLs13iPWazSI6EKIESjCvjBmYVpRJZ1vJYV+/wSHW0AKEedQvxuTBQWJZZaKGJPD
 V51GU+uNe41/OjWNGfgQxGPvTga2SHdPWXH9f3mZBNmMS5B0DV4jYA2pxwEAtcV6UUpf
 jpIg==
X-Gm-Message-State: AJIora+Dqd5ANGrXeg9XRZV5rHKynldXZmvSEL2cwv8WMP93QlzkInTt
 YALO2IQnDVfVVM2FyrUPeyPfENj4nUnXZb58up1mWjI6YovQ6R1bstPlUTbIEI1GLTnVF45SvT1
 wKI7oZF2aMEV3T9xKqcfCLU/dxvDU1fQ=
X-Received: by 2002:ac8:5dd1:0:b0:31d:34db:e0d with SMTP id
 e17-20020ac85dd1000000b0031d34db0e0dmr13022812qtx.592.1657523903702; 
 Mon, 11 Jul 2022 00:18:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzzzHU4guebc0xDhRIduxBhO4QHL/piA+xGoR9NXCZML45uDRU5Ui8d1b6UHWBoiww5EYjCXkKl+O3WSGCsSo=
X-Received: by 2002:ac8:5dd1:0:b0:31d:34db:e0d with SMTP id
 e17-20020ac85dd1000000b0031d34db0e0dmr13022797qtx.592.1657523903515; Mon, 11
 Jul 2022 00:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220708105013.1899854-1-eperezma@redhat.com>
 <20220708105013.1899854-23-eperezma@redhat.com>
 <87h73r7oly.fsf@pond.sub.org>
In-Reply-To: <87h73r7oly.fsf@pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 11 Jul 2022 09:17:50 +0200
Message-ID: <CAJaqyWeEGqt4hvAwGKu9JhK6LTXzCOnQz61oRBc2MQkykcmCeg@mail.gmail.com>
Subject: Re: [PATCH 22/22] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Cindy Lu <lulu@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Parav Pandit <parav@mellanox.com>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Fri, Jul 8, 2022 at 2:53 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>
> > Finally offering the possibility to enable SVQ from the command line.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Please carry forward Acked-by and Reviewed-by you received for prior
> revisions unless you change something that invalidates them.  This
> ensures reviewers get credit, and also saves them time: if the tag is
> still there, nothing much changed, and no need to look at it again.
>

I'm sorry, I didn't carry forward because I was not sure if we agreed
on the previous behavior. Now that I understand better what you meant,
yes, it should have been carried. I'll make sure I put it in for the
next revisions.

Thanks!


