Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681523FDFD1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:25:42 +0200 (CEST)
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLT3V-0002Zd-GM
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mLSbW-0007w6-9M
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:56:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mLSbO-0001nf-6O
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630511797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBkkwmentReDbVTjhIzAtUVD/2+Ts5Ifp+CMyFV+YQg=;
 b=hBZRFLLs0N8xjHIPENuoPicVDSBWDHjuZFDtci1jvs/7yXDqsor3BjO2DXyVGFG2v7u0Mf
 ukkJpOIxHrDz/SbieosdTrp5uvntkLpVhnvse/G093Jn1jHMglu5EvWiLZjNzgZduKtFDz
 VdFBJztc2zimCmunFljfaOLyAqcBy18=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-C5VOTDAiPbiLNApTjx1u4w-1; Wed, 01 Sep 2021 11:56:36 -0400
X-MC-Unique: C5VOTDAiPbiLNApTjx1u4w-1
Received: by mail-ed1-f72.google.com with SMTP id
 x4-20020a50d9c4000000b003bed5199871so1505550edj.14
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cBkkwmentReDbVTjhIzAtUVD/2+Ts5Ifp+CMyFV+YQg=;
 b=tTSzBxQ6jmMrb6fQNcG3TcNSWWfAx3fkBbY5URApLPs84ceVlODkVd0Cfd9JvpN5HF
 l1yr4P5afp+rYEwe0TRP9pR0tVu86vNBv3kMGREgLeFYnjoPE/cZptyel6eoI7iRUjCd
 Jvx4pDN3RCMXGjrvnZBKlt3RNSWyO6os5uNlcJcOhRhLsyMv9YaMwTEhR7H05RLjojqF
 RPONyzL1L+ODmAQnuY8ZegLdzV5+RbKqQxRUmT4cK4i36JpaViSdvp987wMDwHk4Wglq
 U9uzXA9iiRfTs3FnKogo42aE+HlMYYDKknhRn634YxlMgwiWeldb39MUaiC3FSI7iVk2
 vyLA==
X-Gm-Message-State: AOAM5333NGsnW0HcwHRIGQMxI2+EYeISrwI/hb4bihole2uxRXIhn6BO
 tZBF2kszqhZi45QXhQk1PZPGNhwvlg3aFLwQr3vpsUU6sPaZC419K7NKnmdPse+ZQg9B4WEKuhv
 j/uI9G23ewHa+QTk=
X-Received: by 2002:a17:906:b18c:: with SMTP id
 w12mr135221ejy.534.1630511795246; 
 Wed, 01 Sep 2021 08:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+HR2rzcEt8KGie6IfO7o0KiA3u2suKYNgj6QRSogLA9EOOTE+BxGizfekYh4px0wftCpkPw==
X-Received: by 2002:a17:906:b18c:: with SMTP id
 w12mr135203ejy.534.1630511795067; 
 Wed, 01 Sep 2021 08:56:35 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id cn16sm33301edb.87.2021.09.01.08.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:56:34 -0700 (PDT)
Date: Wed, 1 Sep 2021 17:56:32 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/3] hw/virtio: Remove NULL check in
 virtio_free_region_cache()
Message-ID: <20210901155632.oxsgf3kpny2vzcbt@steredhat>
References: <20210826172658.2116840-1-philmd@redhat.com>
 <20210826172658.2116840-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210826172658.2116840-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 07:26:57PM +0200, Philippe Mathieu-Daudé wrote:
>virtio_free_region_cache() is called within call_rcu(),
>always with a non-NULL argument. Ensure new code keep it
>that way by replacing the NULL check by an assertion.
>Add a comment this function is called within call_rcu().
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> hw/virtio/virtio.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>index a5214bca612..3a1f6c520cb 100644
>--- a/hw/virtio/virtio.c
>+++ b/hw/virtio/virtio.c
>@@ -133,12 +133,10 @@ struct VirtQueue
>     QLIST_ENTRY(VirtQueue) node;
> };
>
>+/* Called within call_rcu().  */
> static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
> {
>-    if (!caches) {
>-        return;
>-    }
>-
>+    assert(caches != NULL);
>     address_space_cache_destroy(&caches->desc);
>     address_space_cache_destroy(&caches->avail);
>     address_space_cache_destroy(&caches->used);
>-- 
>2.31.1
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


