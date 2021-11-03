Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A32444039
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 11:57:30 +0100 (CET)
Received: from localhost ([::1]:35722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miDxR-00057q-To
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 06:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miDw2-0004K4-LQ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miDvy-0000bw-Ty
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635936956;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z19T4Ouh8w167SXMBm/FCtbcA160Pmj9bJ1DJwTAqUk=;
 b=Wi44vI8OxUNaA2r4ZegfDzs2Krsj5sEYuA63kPc0nADWOXIFdJcQErAZPUFP4Fg92vuMwj
 iB4U7H0zemUPoRorHjhGUbzuojVssK6zSJefTc2K/dWIQ0hCLybxUmVopz+Y4zE+O/Bi2w
 /iTURo6NjTgoE7skRcm3lqhI/M46sUQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-GpxYGgdXMairjaG_uuzqZQ-1; Wed, 03 Nov 2021 06:55:55 -0400
X-MC-Unique: GpxYGgdXMairjaG_uuzqZQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so863810wmj.7
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 03:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z19T4Ouh8w167SXMBm/FCtbcA160Pmj9bJ1DJwTAqUk=;
 b=JTJgF3fyCyP22wMKgvPM+16VtNdNA79fQWWHky9STIiZbp3+zqdHcnLiCU1+bDeixh
 OobI0yVAxS6VQFSvKqZpElo37akrlkOEUUGN+DnAKSlxnkg7O6fafuId7WipwY86cGdw
 jaRdtkmQnGbf11Ym9i/smd+yrdetpulcVPwJw76pRR3CkO9EEKT7rxV/wyfysmQf/KfF
 hH25JZDHLbg2vjnCqa2KhCXim/IL8xc7MD4Bv5E8Aev9wJt65rzwIpp9k2BdY3R/cMcT
 0+nwwWYBB8cfHtFEZGHSn1jSNQqCiDMzr7y8fLZMtLk5TODg6rmez5PQPoEJFXhxi52F
 rTcA==
X-Gm-Message-State: AOAM530EyyHYX7vwoLoU5UlXSEySys+AX3iVRRibf11Zp4MDQwW/x6t+
 GBSm01ZjXUP9GCU2lbg1d/fAEVnn2lzDmAqoGh+ddpgYMIegiWykVTao3kjJOwbtTBJlfL4gLQ1
 mqn7QpC5oOK/ct0k=
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr10038519wrp.226.1635936954464; 
 Wed, 03 Nov 2021 03:55:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbmhNXXcTe7ory8csdXqOGOMTRafmvL93ohFboIbxuL2MSg653ax4LSy0MYtGWQ+0Q0VWdsg==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr10038504wrp.226.1635936954326; 
 Wed, 03 Nov 2021 03:55:54 -0700 (PDT)
Received: from localhost ([178.139.225.234])
 by smtp.gmail.com with ESMTPSA id o20sm1500100wmq.47.2021.11.03.03.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 03:55:53 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v3 2/2] vhost: Fix last vq queue index of devices with
 no cvq
In-Reply-To: <20211103100131.1983272-3-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Wed, 3 Nov 2021 11:01:31 +0100")
References: <20211103100131.1983272-1-eperezma@redhat.com>
 <20211103100131.1983272-3-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 03 Nov 2021 11:55:51 +0100
Message-ID: <87k0hp7bk8.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> The -1 assumes that last index counts all vhost device models as having
> two queues, but they count only the ones that models the data queues.
>
> Because of that, the right change in last_index is to actually add the
> cvq, not to remove the missing one.
>
> This is not a problem to vhost-net, but it is to vhost-vdpa, which
> device model trust to reach the last index to finish starting the
> device.
>
> Tested with vp_vdpa with host's vhost=3Don and vhost=3Doff, with ctrl_vq=
=3Don
> and ctrl_vq=3Doff.
>
> Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the
> virtio device")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


