Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194124428BD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:41:39 +0100 (CET)
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoQM-0003zv-84
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhoP4-0002Z7-8R
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhoP2-0000wy-3I
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635838815;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPu+TEWex7DM2XBPyMWNsPrFrpctl7ejYlHuF04HTQA=;
 b=L2vKuj03Z7X7FZRQ5vZfDV7Ap3r68moOKooTjNyV0d3dPAjnl2Vgou/7Fhjr77YCkgbUhz
 oIfbmvtSqjYjIFFXBD9sbpfAEMl9qlusEMRpaPuaWN2LmGnlwJr/vCClnsyxDWOo6j1LoE
 csFUXXyEkhXWfT80FcfVaSfOzihXg50=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-kd0HupqvPeOyq_r664Zg5A-1; Tue, 02 Nov 2021 03:40:14 -0400
X-MC-Unique: kd0HupqvPeOyq_r664Zg5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso704968wme.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 00:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rPu+TEWex7DM2XBPyMWNsPrFrpctl7ejYlHuF04HTQA=;
 b=3w3QLkQkogQhwGOBjgq+ed3NJ8M37DHPFrhNbzfNzZ/UvPHURzLkmoTO2vCldPQUZT
 7pfHIu5XWlGgfYmsD/IWvGgsKEBbyGCOOl6Vf29TXlT+3NK4Ee5fk0HodZUqAb7NNhX6
 7RDo2rZN6F3f3xz/DkurzPHPkOilxIi8iZalSxHkiw6uNWP0VPHBBWatQbMxnmeK4glM
 jOA8R5ZnwX5ovdt+cqRSO1c9hkkcbgZLl14r4eyiVT8BsuX925ZU6Lr1DZqFE/MtxT8q
 4wcLDNarW5QiRHjS2xfInqFDRgFCwHeTl/15KxZ3Qg9Gpd9TFPfLG72Z0ojOu4Z+Lfw7
 KiYA==
X-Gm-Message-State: AOAM5304Ej5sH11GVig4HtHoBH3DPuhmqQ+bKNSMNUZIdxKKiq+zm76H
 9vTL5uobo4hWbTPw19SdrO5pZMeGFAPreLYt4xxZdLohbvoXfKmree8s6FZRIgpq3ecBPctfmfA
 /8KyhZ8h4MOAMSzU=
X-Received: by 2002:a7b:c303:: with SMTP id k3mr5030188wmj.44.1635838813083;
 Tue, 02 Nov 2021 00:40:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDXjZ2/S+Zu4EmMWCEIeewzQXHCc0CYy7LGlLuQHKmQa056kHgEW9fPc0Xyhggtn8VOI4Tew==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr5030164wmj.44.1635838812943;
 Tue, 02 Nov 2021 00:40:12 -0700 (PDT)
Received: from localhost ([188.26.219.88])
 by smtp.gmail.com with ESMTPSA id u16sm1547759wmc.21.2021.11.02.00.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 00:40:12 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH v5 02/26] vhost: Fix last queue index of devices
 with no cvq
In-Reply-To: <20211029183525.1776416-3-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Fri, 29 Oct 2021 20:35:01 +0200")
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-3-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 08:40:11 +0100
Message-ID: <87mtmnngys.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eric Blake <eblake@redhat.com>, virtualization@lists.linux-foundation.org,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> The -1 assumes that all devices with no cvq have an spare vq allocated
> for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be the
> case, and the device may have a pair number of queues.
>
> To fix this, just resort to the lower even number of queues.
>
> Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the
> virtio device")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


