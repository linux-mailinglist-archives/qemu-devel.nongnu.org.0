Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6936DD3A8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 09:10:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm87Y-0002Zv-NU; Tue, 11 Apr 2023 03:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pm87X-0002ZX-7U
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pm87U-0000GF-KW
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681196926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mKVL0P97a2Ex71G2V5nN0kOi4VmfioIilnRQP2T3SO4=;
 b=Xp3JooGB7IlONDXnZtHPD6Wyjr9uuIB9Sj6G3s/yyy98awnl2DYjL53XcZgDppnuGttBhI
 m2A0/9c9TarSFeSr9E2ZsxQyis6x9cQzdTsmJYKbUGKYmm+CoxF80z93HyOrLWCRUwgCL6
 iSWrgqYhlK3qUUO6cetrV+7vb39l0aI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-phSq7eRnP0CsCQxkbQGXIg-1; Tue, 11 Apr 2023 03:08:45 -0400
X-MC-Unique: phSq7eRnP0CsCQxkbQGXIg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k29-20020a05600c1c9d00b003ee89ce8cc3so2163772wms.7
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 00:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681196924;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKVL0P97a2Ex71G2V5nN0kOi4VmfioIilnRQP2T3SO4=;
 b=GjwSdT8AlzltfeJ1/I6rz9I/8t9MtZtG28j47T2aWQHrB+BKKj1cdYmJe9f0OgCPGf
 tMDDIFdxxL+WcpTQfWOI6x1Izt0Iovw/K0j6nYHt6NOgXVxeRvopp3Hq24bVnxXfevkw
 MQjX/9gSYxQ6ssK41ONPYk03gWP/R3EQwS4WlfoxyvTz//q1O6CukqNU8WI5v7/ZsdOY
 rqpC0YNVG5voEgWSsTsnQRGGL0DgJm0sM5M4TyMV7G2RbdldXugQW0Nl07rLSJSRUBHm
 oIy14sk6PiYUPr0lHrA4g+ArKD0jMOEMmn76W1j/o31i/cTlEWD28ibjR/cOjYlkLBLp
 nunA==
X-Gm-Message-State: AAQBX9c0pO1cptpA3YkNfNP5RchNThG/y+VQjbVx0H8C/Ha0xHGB+XU9
 A8hCMNHJBeo41WIxwzE2+duHUxB0lXVPSg0PylzStwaJ27L447gmfFSl5bum9DK7U/NPMvofca6
 JuPAeiX83TEbls5I=
X-Received: by 2002:a7b:c4da:0:b0:3ee:19b4:a2e6 with SMTP id
 g26-20020a7bc4da000000b003ee19b4a2e6mr1240778wmk.19.1681196924047; 
 Tue, 11 Apr 2023 00:08:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350YROxWlsaN0dkvRYbexETJkDO0siHcl1gzb7s3pP5sA2MtLum7s7lsVPr03cm1FUQtvAcPgGA==
X-Received: by 2002:a7b:c4da:0:b0:3ee:19b4:a2e6 with SMTP id
 g26-20020a7bc4da000000b003ee19b4a2e6mr1240757wmk.19.1681196923564; 
 Tue, 11 Apr 2023 00:08:43 -0700 (PDT)
Received: from redhat.com ([2.52.10.80]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003edff838723sm16043078wmr.3.2023.04.11.00.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 00:08:43 -0700 (PDT)
Date: Tue, 11 Apr 2023 03:08:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-8.0] docs/cxl: Fix sentence
Message-ID: <20230411030721-mutt-send-email-mst@kernel.org>
References: <20230409201828.1159568-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409201828.1159568-1-sw@weilnetz.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Sun, Apr 09, 2023 at 10:18:28PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> If my change is okay I suggest to apply the patch for 8.0
> because it fixes documentation.
> 
> Regards,
> Stefan W.

It does but I don't think we should bother for 8.0. Nothing
bad will happen if we defer this, we need to focus on
kicking the release out of the door.

>  docs/system/devices/cxl.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
> index f25783a4ec..4c38223069 100644
> --- a/docs/system/devices/cxl.rst
> +++ b/docs/system/devices/cxl.rst
> @@ -111,7 +111,7 @@ Interfaces provided include:
>  
>  CXL Root Ports (CXL RP)
>  ~~~~~~~~~~~~~~~~~~~~~~~
> -A CXL Root Port servers te same purpose as a PCIe Root Port.
> +A CXL Root Port serves the same purpose as a PCIe Root Port.
>  There are a number of CXL specific Designated Vendor Specific
>  Extended Capabilities (DVSEC) in PCIe Configuration Space
>  and associated component register access via PCI bars.
> -- 
> 2.39.2


