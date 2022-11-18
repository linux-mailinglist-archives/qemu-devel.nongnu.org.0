Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C4062FCBD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 19:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow66i-0000IP-5q; Fri, 18 Nov 2022 13:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ow66d-0000Hu-Ta
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 13:28:51 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ow66b-0000o2-R8
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 13:28:51 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id s18so6584977ybe.10
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 10:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UTxtgzXzioWUfz1fAPkzT/KPkPL4pAkZMxDyph3D1Ys=;
 b=YHSPcKnBPV9qos0hh+I7vpn8uq8W0VSR6G/faoVGUkC0UD/U3jmmKcKjdffAkYd4k6
 fJueYjc2DDaMaqLsYY6iyc0XeB0iCjjbewwA2XzhnywTUWT0221pfo7MqA5CrqGDpjvB
 QsgheTFBsujDe63rcU/uPrSWcNGownSKlHE8qirbyTnKM9H/XAI4HzVphav9F24NIjXp
 oxP6CEWrkKwKjhCoZQJTJBoqi+N6qPuR2QvH/wz2/GZ/91Oss2IGEaTZ+PwArLTl6/sJ
 p3djssh+VuVjckkKuiJwnieOeS/ib7s2I3Pd97+Zslno7wfvvRD9LVP2WDOKSm7SlMRA
 NmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UTxtgzXzioWUfz1fAPkzT/KPkPL4pAkZMxDyph3D1Ys=;
 b=7NowS1P3qHscBaASuzzafBpnRSt+2w3N6ZG21CPCB/C0HYYapTmz23k7607tuQEqOn
 Vi+hyWs3OuIO94sPh0CHLzo4VmNUQqBp5y7g+RJrWO4tQastLjdUjlU6KdU5nBvMbJAE
 77GDNJfI/LS0gDF8mpMBsjFxI+QLXbgyKH+b8gxLtZkfptSif/VqjTZOsh1/6jqmoB61
 TOlZhBFGmpS8NIuWLA25uicNz/XEEp4M7urmSKC9cNnFpvHGNuauTmWtVUbPWOLa/h3z
 QqCXjJxUrqP8pyfuIIHeaj4bGONzTLsCeLIfkKAPVu+IPcE4meFkZaV0BtbP27ZGL2wi
 VxKA==
X-Gm-Message-State: ANoB5plZF5LKgn28ZXzZFs6rHjyrWqWcelLv/AIP6jmELN6MANdMsHZi
 YlsoZlkA3mzaDiuo1DJ1RVT7XTeW06AppfdIofM=
X-Google-Smtp-Source: AA0mqf5wVEFPKzxNe6Y0PHfe6JpgmFsiY2zusnDE7mj8uVr0Q6n16s8YUTEpnBCiSp4Y1CbgIz52yvi5iJ0SFD3symU=
X-Received: by 2002:a25:bcc4:0:b0:6e7:38f3:2bf7 with SMTP id
 l4-20020a25bcc4000000b006e738f32bf7mr7329867ybm.207.1668796128116; Fri, 18
 Nov 2022 10:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20221118144915.2009-1-longpeng2@huawei.com>
In-Reply-To: <20221118144915.2009-1-longpeng2@huawei.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 18 Nov 2022 13:28:36 -0500
Message-ID: <CAJSP0QXfm=j7dmtwn4juYQ9SmzJtfiUZ2EDbv0fStxTWwrUgDQ@mail.gmail.com>
Subject: Re: [PATCH] vhost: configure all host notifiers in a single MR
 transaction
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com, 
 sgarzare@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, 
 arei.gonglei@huawei.com, yechuan@huawei.com, huangzhichao@huawei.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 18 Nov 2022 at 09:51, Longpeng(Mike) via <qemu-devel@nongnu.org> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> This allows the vhost device to batch the setup of all its host notifiers.
> This significantly reduces the device starting time, e.g. the vhost-vDPA
> generic device [1] start time reduce from 376ms to 9.1ms for a VM with
> 64 vCPUs and 3 vDPA device(64vq per device).
>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg921541.html
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  hw/virtio/vhost.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

