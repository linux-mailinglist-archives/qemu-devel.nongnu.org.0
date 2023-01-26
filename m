Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EDF67D6E0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 21:55:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9Gg-0000T9-LV; Thu, 26 Jan 2023 15:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL9Ge-0000Kj-ES
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:54:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL9Gc-0008TI-Jj
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674766481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a/vQO1Y30pqVF/EZGjKTOYdbH7Ilbfqhg8a4h5VPEDU=;
 b=KdP+7sO123h/dHP8jDEFgcVt8rk9OLac++NcjtEXCB+tYs4jXCosofabbY+HqZkMameCTs
 cO0dCI+2T+POvehmB6g38cJz7mJHRngCGoRkZ0tQRctL3pLmY4unuKil6hwQc0vZTMjuX3
 ZCTPkVlE6fO6jty9Q/eFV4XCkmiG4Q0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-7LFyYZk-Ot2uNpB_vBJhDA-1; Thu, 26 Jan 2023 15:54:39 -0500
X-MC-Unique: 7LFyYZk-Ot2uNpB_vBJhDA-1
Received: by mail-qt1-f199.google.com with SMTP id
 f14-20020ac86ece000000b003b816f57232so787745qtv.10
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 12:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a/vQO1Y30pqVF/EZGjKTOYdbH7Ilbfqhg8a4h5VPEDU=;
 b=ZP5KuVUjTrVmqHV3XXDrDC3lSIxegN9i/Cu1AwlXlj7OuarQASWvFHIF/TblSZO1Sd
 gNcp/mlC93TxUQxJk60QHrATAozFa9huYIa+PkJGikgTXpHEcqWiwdXk1Xy0ebk3iOIm
 WlZuAJpwPabAobz3kKylaJqJTGBkEKY+4LyFFo5IjYEaRGdew9/Vq3kz3NW4LVHtEmZz
 FJkfIkRoxuPlsoDIZc+gXBimKhoojnicviZvRMNoCqozO7Wga2l4Oa2nQzdNODeyJi6E
 qDCROJaIbb86hO1HtFOq7xkDSbbm7QGELOJVqj5NIM0ix6iAPyh7AHojRGaKBjigFTAw
 Er2g==
X-Gm-Message-State: AFqh2kpRDgKzPwEHaTsV12tXS8VUOYjaDY/QpVT44ljgA33Is0ssWMu6
 0lMioZT6uakT/XPZOguKo9Q5lfQ890jPXekUBhQzHDICql70KQjw0cziM5h4vhbOcWSVGWUB/jd
 gUUBrxZHNfpJgfbo=
X-Received: by 2002:a05:622a:4005:b0:3ae:63db:7c7b with SMTP id
 cf5-20020a05622a400500b003ae63db7c7bmr53161430qtb.2.1674766479495; 
 Thu, 26 Jan 2023 12:54:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtdSQdpoA6Q4+FSeKfLEFGJV0jNkTWatwpNa/mG6n9tGDNvnskNFr88dbW1K0JtdfTu85xIaA==
X-Received: by 2002:a05:622a:4005:b0:3ae:63db:7c7b with SMTP id
 cf5-20020a05622a400500b003ae63db7c7bmr53161411qtb.2.1674766479211; 
 Thu, 26 Jan 2023 12:54:39 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 8-20020a05620a078800b0070383f1b6f1sm1589603qka.31.2023.01.26.12.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 12:54:38 -0800 (PST)
Date: Thu, 26 Jan 2023 15:54:35 -0500
From: Peter Xu <peterx@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v5 1/4] memory: prevent dma-reentracy issues
Message-ID: <Y9Loi8fz+xO2gasd@x1n>
References: <20230126052558.572634-1-alxndr@bu.edu>
 <20230126052558.572634-2-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230126052558.572634-2-alxndr@bu.edu>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Thu, Jan 26, 2023 at 12:25:55AM -0500, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
> 
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
> 
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


