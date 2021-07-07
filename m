Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6747B3BEA68
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:09:18 +0200 (CEST)
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19Ar-0005xs-CU
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195E-0000yJ-BV
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195B-0006dS-AY
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zmpRm6Bp0OUCMLI+CGNHcboqes++B9pawrnMEvKwPBY=;
 b=Nw62eRnsN0mLCZykNTkb1GYCGCKNCzg4Ug+TugzanTkws4q7x+ealT/0zCg2Q9wSbeQ9TM
 znrBGgb0BOXlTaXqm10xGlYtXfwZdcFwNoI/lEf9W1p04d5jEW7skm/ZYHZdymL1tuVtcs
 rDERTU+AFkM+vZYjcdqur7ARv48Hg2o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-g4Akphf7P6uGbxxXZ9ceOA-1; Wed, 07 Jul 2021 11:03:22 -0400
X-MC-Unique: g4Akphf7P6uGbxxXZ9ceOA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j2-20020a0560001242b029012c82df4dbbso861202wrx.23
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zmpRm6Bp0OUCMLI+CGNHcboqes++B9pawrnMEvKwPBY=;
 b=mIGQ3MYpt8KOPaboDsxdUdpSQISc19sGAFeBISGreIzutDdZanyunIZKQGcYF/Ia+p
 7LqtlkEIzUoRPKESNA8f37AMyeYrBYu86IIyjQ9DqvZDy13cQJjRjCa2eGjEnKlDletj
 73dK1/DYLJS1TaCT62Birr/7X3L4DK6BpHvhlekIHHXMmmiQ7atNfkfHv43HHMuSpCEs
 pyks7HEZwWGPMJS3jmJFpllZWY9RO72VU9Af/228SwyBYGr2AS/IeV0Jx0yDhBXw9yQ/
 rKLk1DcUaPokaWykPIsJoZVP9CDBU+RUfbZhR9snFBvSHLS3CnkNdTMA6PKpi90/O1Wl
 Cgog==
X-Gm-Message-State: AOAM533/Dt2FEogWVNViMtZP8fkjVxiprXpYwKpTEOqS4uD6Fq/Rg0zi
 2Eseu9ZLdiMZ4jUpkyGMRxaHHzps+AZr/2xpOZ/iqcMqBYKcd+lXO4nNX05uJGSo9Bykq01l16C
 F+DePeaB0Rymsth6FlM1ValZbamLhovAeIbByHylVFgq1a3MWUBWtUtKgEoF8
X-Received: by 2002:a5d:4a4c:: with SMTP id v12mr2915963wrs.256.1625670200804; 
 Wed, 07 Jul 2021 08:03:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBstri0nh/6cyE1UkYCO4YBAfNeSuFiIVeyC9EWIVZ0R84BSzAIl+cxB7pMxhUJ2bEOG/Lpw==
X-Received: by 2002:a5d:4a4c:: with SMTP id v12mr2915924wrs.256.1625670200612; 
 Wed, 07 Jul 2021 08:03:20 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id e8sm20813490wrq.10.2021.07.07.08.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:20 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] migration: failover: reset partially_hotplugged
Message-ID: <20210707150157.52328-8-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

When the card is plugged back, reset the partially_hotplugged flag to false

Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1787194
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20210629152937.619193-1-lvivier@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index bd7958b9f0..16d20cdee5 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3234,6 +3234,7 @@ static bool failover_replug_primary(VirtIONet *n, DeviceState *dev,
         }
         hotplug_handler_plug(hotplug_ctrl, dev, &err);
     }
+    pdev->partially_hotplugged = false;
 
 out:
     error_propagate(errp, err);
-- 
MST


