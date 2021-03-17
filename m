Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E007B33EED2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 11:51:46 +0100 (CET)
Received: from localhost ([::1]:33674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMTmB-0002kx-Ke
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 06:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1lMTlJ-00029g-Vg
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:50:49 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1lMTlI-0007Nv-EE
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:50:49 -0400
Received: by mail-il1-x133.google.com with SMTP id m6so1007080ilh.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SDPnz0WEpit1N0SOeZPaUTj9aywkLFVFGfcot0sZoBY=;
 b=IXbqLg1fhTAL+Bbwxh8IxFPUT+3Kk6Wc5lsdOgAosg+dilyeSoJ9ckfF5njPexTrPo
 9jBufYHZCWjy9Ik0e0AFPUec6w8sBnSeZ31wD1oByUgNJgy0l8piNSRDPizIyUA6+AQ3
 Z9K9imH/59Beo7YX0iyGaWx8l66TrUMs5WJ3BzOEWI5FbBzgCCPYHS7XAenQWJfX7kZY
 dq/rgrFgY4WFt3xvMS9n1l/ZsXBjFfOMi52cPqZ8UCgfatcM996GN/PMfS+Z3KN7lU9j
 1YZYLDHajDWLcB2MWymRpjt2MiLIzvSp6npSi5ivEVOhC0dp8Q1O6jYxtKocURQT1MBX
 bwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDPnz0WEpit1N0SOeZPaUTj9aywkLFVFGfcot0sZoBY=;
 b=qrtdR6rBksfx7jPEgSegTdcavCWTBDb5dTSs/QX6jsY3ufIVjMAr9YzQGhvI55CiBs
 4gOJSJWC07f18/41ePwMKqN1WL8MZ/TU4OKdRyTHMkr3Hn6smuT0lb9QBCNGmyW0Kf+6
 8yV81rbdhUFOLKFQephbWlVj7S862XMxuRgFIxpaIMvojZlmBbIPSuzAs6gsp62RQIF0
 DYrYp4CFUxRyt0XONZ6KCcyiar+onELQEiO+IWHvWx4Vunk04kSrseGDKLeYF8Vv6AAY
 dt06Cflw6UBZdg5C1GhXRjW1q0hHCaXTkKJuAshzxMftla6cxHWplHnaaTISxR+IgcqT
 gJAg==
X-Gm-Message-State: AOAM530Cy4ifSCQV0Zv1uv0PZHRE123+T0Ei/a0sSxQoDog9nRKjQFJx
 fzf70XE8waO/2VCAASxyOCMcbSD2v5SmyN/GVRQ=
X-Google-Smtp-Source: ABdhPJxFZtb7PkoWsDZM2y8B/ZkUYHb/HlSTON+yDMlNEN8gfDzy7jWNo4Ql+V6VPmwwjToKjr6zSoqrtM7stnu68TM=
X-Received: by 2002:a92:d8d1:: with SMTP id l17mr7249511ilo.85.1615978246333; 
 Wed, 17 Mar 2021 03:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210317024145.271212-1-wangliangzz@126.com>
In-Reply-To: <20210317024145.271212-1-wangliangzz@126.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 17 Mar 2021 11:50:35 +0100
Message-ID: <CAM9Jb+j=Wg0oK+sp6jNRdSb_5O=FQ-VgWr1CE7yqSsjSmLRuvg@mail.gmail.com>
Subject: Re: [PATCH] virtio-pmem: fix virtio_pmem_resp assign problem
To: wangliangzz@126.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pagupta@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Wang Liang <wangliangzz@inspur.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> ret in virtio_pmem_resp is a uint32_t variable, which should be assigned
> using virtio_stl_p.
>
> The kernel side driver does not guarantee virtio_pmem_resp to be initialized
> to zero in advance, So sometimes the flush operation will fail.
>
> Signed-off-by: Wang Liang <wangliangzz@inspur.com>
> ---
>  hw/virtio/virtio-pmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index a3e0688a89..d1aeb90a31 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -47,7 +47,7 @@ static int worker_cb(void *opaque)
>          err = 1;
>      }
>
> -    virtio_stw_p(req_data->vdev, &req_data->resp.ret, err);
> +    virtio_stl_p(req_data->vdev, &req_data->resp.ret, err);
>
>      return 0;
>  }

Thanks!
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

