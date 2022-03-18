Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D234DD543
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 08:33:04 +0100 (CET)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV76c-000847-TD
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 03:33:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nV73n-0006ac-3Q
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 03:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nV73j-0002rV-0S
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 03:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647588601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IRR4eelOFukvdHWTEOpAdmSxrJnwQJUHQImDgZ8n6Bc=;
 b=HTsBr8g1/5cAY3tPGi4KXaIAjVDDfOB4xL/erU51U8qdL1ENJ9ZDuTjyFGqciBhExsVKzM
 ZIgsG6w6vO2y8Lv7tXLdtnBpLYBXKLzHboFpEKtPMo+PQQkZni2cuOF5HVKGgEg93QDzGD
 yVlVCqX+dmjUlpFT/H7BWnOmYSLR4mY=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567--At5rS87PManvdlHxlposg-1; Fri, 18 Mar 2022 03:29:57 -0400
X-MC-Unique: -At5rS87PManvdlHxlposg-1
Received: by mail-pg1-f200.google.com with SMTP id
 l6-20020a637006000000b003811a27370aso2980437pgc.2
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 00:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IRR4eelOFukvdHWTEOpAdmSxrJnwQJUHQImDgZ8n6Bc=;
 b=LDGlzMa44hZp+ZghFFng57B3LlVc+5XHXswXtPCXDdjagrxs2yWZHJo0+0vUqrf6Bx
 I2O4cE4HFKRCbUyy/dxZ02J9IiaxfbHk1465SWg4y2RE1WInrvewAPuv2uZbYovC/niU
 e+NXDCgeqo9qADkDkDFNpu5WB/E1LuPIHYnXWPdPHLJ736b6WTaseOrFl2pSTLb0tJCQ
 IbQEZraG3IyKhzJGMOlIX5ZLzJPx3J2iN04r4OFLYuIWVrpLm2wkS/RweO1zB5ZOi1AJ
 yLEwJPMt4C8iiOiBajb+B5N98+U4hVKkTjFZzeirv7uzsrxybOgI66sccEOyznJWlTpz
 2dnA==
X-Gm-Message-State: AOAM5339W5PbNlE7h7ntq4ytgYGbABv+WG70VN8SEKcLISzGNUrLdyg8
 tE0LIWu9hEuSelnJkJbPhBTbIBGEG87+L1GL6yubod858IQFm0vGWoerY+cIYFGBp+7FOc5kYT3
 dFLbPr4ty4Wee5Mk=
X-Received: by 2002:a05:6a00:b44:b0:4f7:1043:a72d with SMTP id
 p4-20020a056a000b4400b004f71043a72dmr8373048pfo.23.1647588596484; 
 Fri, 18 Mar 2022 00:29:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxclqPsG++cbVGvfb/0yv3KhKw3nmNyHuEqHochqzWcAUG44Yziuibh5BvwKaFTn9FBzRHQww==
X-Received: by 2002:a05:6a00:b44:b0:4f7:1043:a72d with SMTP id
 p4-20020a056a000b4400b004f71043a72dmr8373032pfo.23.1647588596190; 
 Fri, 18 Mar 2022 00:29:56 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.138])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f70d5e92basm8795272pfx.34.2022.03.18.00.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 00:29:55 -0700 (PDT)
Date: Fri, 18 Mar 2022 15:29:51 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/2] intel-iommu: update root_scalable before switching
 as during post_load
Message-ID: <YjQ07/8IX+u7HUNi@xz-m1.local>
References: <20220317080522.14621-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220317080522.14621-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 04:05:21PM +0800, Jason Wang wrote:
> We need check whether passthrough is enabled during
> vtd_switch_address_space() by checking the context entries. This
> requires the root_scalable to be set correctly otherwise we may try to
> check legacy rsvd bits instead of scalable ones.
> 
> Fixing this by updating root_scalable before switching the address
> spaces during post_load.
> 
> Fixes: fb43cf739e ("intel_iommu: scalable mode emulation")
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


