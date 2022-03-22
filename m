Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438A84E4237
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:46:43 +0100 (CET)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWfmU-0000jI-Bw
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:46:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWfk9-0007SP-G9
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:44:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWfk5-0000nD-OT
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647960252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gi//c5j0cfaY/GT71WMDCAWrPXbmcrj2tp6Qg7h2vek=;
 b=LyuyqCO97rfLl+9wi4LBoX2Hgn8H/Cszhi/2848qlsk1ly4eByAK8nXHHKv7GWAb5xjtW7
 EywMjjzr3E+99J6dTukdkd7AQy49YcKZ+zI+wuz9AqZOJyf3cQmMirX4sgj6acNYnjuuRz
 r94reB5hPrkTv8sUAUgW4Pq0Td4MnRo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144--zRt2XTgPcaCrlDZpkVfIQ-1; Tue, 22 Mar 2022 10:44:09 -0400
X-MC-Unique: -zRt2XTgPcaCrlDZpkVfIQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c62-20020a1c3541000000b003815245c642so1435158wma.6
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gi//c5j0cfaY/GT71WMDCAWrPXbmcrj2tp6Qg7h2vek=;
 b=SCXts/+sUbjgw5UIz3RrgLXvtV6tbpCBX8HuAfbkYe9GxiDUzTZvhvT4ky+mh9aURH
 cvTbqf0t48F1p6CN8iOwb7rd2TAR8T40eV4TNselxHDPfvzvLkTVzTZafN6sbwfgLaTD
 +UK3U2oqaP/OspzJbtPtwJP1xsvRhSMOqDFMjobkAFgCTnaHYD8S7a7bKo/cSpvXwdEm
 WV8IBD82GKtILd8mib7zIarOLjJD1QZjH5IiJQxomPdoC4GQY3fe8+1otnGm6XsB0v8M
 XjWV0KPsbeFHl8znP9DCq8JRPIU1l/0fGRJtlBCxw4aJxaxt1YyoukKwjvvQaZL53ERz
 R8Ug==
X-Gm-Message-State: AOAM531wr+GqNV/xTGCGs7FBmeyd7osQo9/aKQGcihviaszVoEF7YjnQ
 ftfZmzV5eO1j/Aw4OpnJjH3vbF7HrncNCBXsEBfohpqGO6t7LA1I32DxsV8YB5klb/zuG6YmPcW
 Wmw73Ds0pJmPlH2U=
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id
 n17-20020a7bc5d1000000b0037fa8a39e17mr4073879wmk.109.1647960248123; 
 Tue, 22 Mar 2022 07:44:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrm275+u9bFYszjW/ze+MTOQyNNmry9YLOLd1XQeF0p7qbld/ITijVx+hPCf6sZ/F2PuXGtw==
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id
 n17-20020a7bc5d1000000b0037fa8a39e17mr4073864wmk.109.1647960247905; 
 Tue, 22 Mar 2022 07:44:07 -0700 (PDT)
Received: from redhat.com ([2.55.132.0]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0038cbcbcf994sm1083984wmq.36.2022.03.22.07.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 07:44:07 -0700 (PDT)
Date: Tue, 22 Mar 2022 10:44:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
 systems
Message-ID: <20220322104150-mutt-send-email-mst@kernel.org>
References: <20220321172006.3014516-1-raj.khem@gmail.com>
 <b24f3ca8-da88-3e3d-771b-74544b7b556b@linaro.org>
MIME-Version: 1.0
In-Reply-To: <b24f3ca8-da88-3e3d-771b-74544b7b556b@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zhang Yi <yi.z.zhang@linux.intel.com>, Khem Raj <raj.khem@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 07:05:05AM -0700, Richard Henderson wrote:
> On 3/21/22 10:20, Khem Raj wrote:
> > linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for architectures
> > which include asm-generic/mman.h and mips/powerpc are not including this
> > file in linux/mman.h, therefore these should be defined for such
> > architectures on Linux as well.
> 
> This is not precisely correct.
> 
> MAP_SHARED_VALIDATE is defined in <linux/mman.h> for all architectures.
> 
> MAP_SYNC is defined in <asm-generic/mman-common.h>, which is included by
> powerpc <asm/mman.h>.  But you are correct that this is missing for mips.

OK, sounds like the commit log should be tweaked and the patch reposted.
The patch itself looks ok to me

Acked-by: Michael S. Tsirkin <mst@redhat.com>

mips tree I guess?


> > @@ -10,14 +10,18 @@
> >    * later.  See the COPYING file in the top-level directory.
> >    */
> > +#include "qemu/osdep.h"
> >   #ifdef CONFIG_LINUX
> >   #include <linux/mman.h>
> > -#else  /* !CONFIG_LINUX */
> > +#endif  /* CONFIG_LINUX */
> > +
> > +#ifndef MAP_SYNC
> >   #define MAP_SYNC              0x0
> > +#endif /* MAP_SYNC */
> > +#ifndef MAP_SHARED_VALIDATE
> >   #define MAP_SHARED_VALIDATE   0x0
> > -#endif /* CONFIG_LINUX */
> > +#endif /* MAP_SHARED_VALIDATE */
> > -#include "qemu/osdep.h"
> 
> The patch is correct, just need to fix the description.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~


