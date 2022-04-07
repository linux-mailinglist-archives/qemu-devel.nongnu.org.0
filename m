Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E814F79F5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 10:39:29 +0200 (CEST)
Received: from localhost ([::1]:37348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncNfs-0002Sl-6f
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 04:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ncNbe-00082B-1K
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:35:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ncNbc-0005N9-0h
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649320503;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C23xqBGLoTXvOnZOcLG+J84veL2C4cagnkMohQoW6IA=;
 b=c6QT5NQOmyBuu4SvoV8fhQnIwnuQCcnmcxid+oB3CuuNShTAVCp3iNDWtt2vwlzIFQRnDT
 XHEmo1olBUP2oCefhtE+/E2KDNNXFuUoKi3QNg8+l85NiZWUfpiA0W9dILQ4QPjIqgSx2H
 7UFqx9sYI+azG9AR6lbdKCNxKN5Uhpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-BouIjcVZMOO81tbMoeuH1Q-1; Thu, 07 Apr 2022 04:35:02 -0400
X-MC-Unique: BouIjcVZMOO81tbMoeuH1Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 m3-20020a05600c3b0300b0038e74402cb6so2635000wms.8
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 01:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=C23xqBGLoTXvOnZOcLG+J84veL2C4cagnkMohQoW6IA=;
 b=P3wlcmMIZCAgUoZWx/GExfOsv1msff+evGHlgv5tuB5lOQmJ5amGT2Trmy4h+LpaAe
 tAH4EQQ+TWODgrVn22RGK9FBHcJCGYaA/rWQdvLCj3/KL2pikZl43UCsJK3wrHhJpotC
 CgSmBdAgv414LyhlAu/UIYk4EHegaRFrPh5gdDWIUfIusidFUwoO1TMF/UxETtLbkmi1
 Sk3AFq6uBlgU3lq/269nVbHxrKwmN3sYqorDDSxqNPD4c8x5PVEYzH1HhHojNHt7+df2
 f0O4vaz6l53IaFmtAC2LckH+grDQy+5mwqGWrluLnrJ3302E92outYFrJ7XXY/JOH1HM
 1rHg==
X-Gm-Message-State: AOAM530Ba93wSGURmcYFq2i2a3xCzNvz6sF+UsHs4AAKX4NPxhZca5Wd
 aVwg2gZGaPyl5lj3H01q32hMPox2zMTz7/zaaWb1tid39nMhTW+JXBHD7SU2wk+p4LIoqeOA+LU
 BIkok4qkD+gxjqB8=
X-Received: by 2002:a05:6000:156e:b0:206:1206:b8c0 with SMTP id
 14-20020a056000156e00b002061206b8c0mr9821402wrz.648.1649320500906; 
 Thu, 07 Apr 2022 01:35:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg7A2nwXiHn7Bc1pBCBbjhrXTAUO6p+lB6ijIB6X4LZTUmEZyZl/NyENT9LEt2gtdwz31HuA==
X-Received: by 2002:a05:6000:156e:b0:206:1206:b8c0 with SMTP id
 14-20020a056000156e00b002061206b8c0mr9821382wrz.648.1649320500672; 
 Thu, 07 Apr 2022 01:35:00 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adfb781000000b002060d4a8bd9sm11637489wre.17.2022.04.07.01.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 01:35:00 -0700 (PDT)
Subject: Re: [RFC PATCH] tests/qtest: properly initialise the vring used idx
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220406173356.1891500-1-alex.bennee@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <bc4f9d81-768b-dd51-90fa-1940b7f6d295@redhat.com>
Date: Thu, 7 Apr 2022 10:34:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220406173356.1891500-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 4/6/22 7:33 PM, Alex Bennée wrote:
> Eric noticed while attempting to enable the vhost-user-blk-test for
> Aarch64 that that things didn't work unless he put in a dummy
> guest_malloc() at the start of the test. Without it
> qvirtio_wait_used_elem() would assert when it reads a junk value for
> idx resulting in:
>
>   qvirtqueue_get_buf: idx:2401 last_idx:0
>   qvirtqueue_get_buf: 0x7ffcb6d3fe74, (nil)
>   qvirtio_wait_used_elem: 3000000/0
>   ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used_elem: assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
>   Bail out! ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used_elem: assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
>
> What was actually happening is the guest_malloc() effectively pushed
> the allocation of the vring into the next page which just happened to
> have clear memory. After much tedious tracing of the code I could see
Many thanks for the tedious investigation!
> that qvring_init() does attempt initialise a bunch of the vring
> structures but skips the vring->used.idx value. It is probably not
> wise to assume guest memory is zeroed anyway. Once the ring is
> properly initialised the hack is no longer needed to get things
> working.
>
> Thanks-to: John Snow <jsnow@redhat.com> for helping debug
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/qtest/libqos/virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/qtest/libqos/virtio.c b/tests/qtest/libqos/virtio.c
> index 6fe7bf9555..fba9186659 100644
> --- a/tests/qtest/libqos/virtio.c
> +++ b/tests/qtest/libqos/virtio.c
> @@ -260,6 +260,8 @@ void qvring_init(QTestState *qts, const QGuestAllocator *alloc, QVirtQueue *vq,
>  
>      /* vq->used->flags */
>      qvirtio_writew(vq->vdev, qts, vq->used, 0);
> +    /* vq->used->idx */
> +    qvirtio_writew(vq->vdev, qts, vq->used + 2, 0);
>      /* vq->used->avail_event */
>      qvirtio_writew(vq->vdev, qts, vq->used + 2 +
>                     sizeof(struct vring_used_elem) * vq->size, 0);
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Eric


