Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC244F57BA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:19:05 +0200 (CEST)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc0sa-0000Ys-47
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc0nw-0006An-MS
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc0ns-0006Us-W9
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649232850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vmi19srH7f+vOB/vWgSaCp2E0PkDgld0ypaPkePPInY=;
 b=jN6DaL5el+UHbvHoY05Ucrri9YBs4480/2J2HjntFPvtEfolRSPM3eNxKQt0naScDuqELd
 qK0+Ils4V6iOudrhPqh/gZgsdhJYrjZhEXlW/7C9g0IjgRlt0ys1+oH82V4J8kZXEITbSJ
 cMUeze4Aj7Ut3Qfo3kffjEf0oRVJA6g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-_DZAw-eIPc21vw9tRQDNGA-1; Wed, 06 Apr 2022 04:14:10 -0400
X-MC-Unique: _DZAw-eIPc21vw9tRQDNGA-1
Received: by mail-wr1-f72.google.com with SMTP id
 o26-20020adf8b9a000000b0020617a99c43so229075wra.16
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 01:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Vmi19srH7f+vOB/vWgSaCp2E0PkDgld0ypaPkePPInY=;
 b=zLOHod2ioSFzmfzXXzutdnnYWB6/LW9Fpl33Nj5xjEYOaRNO6lvO4J0XVS0Dka+t/+
 ZzWzkQwutgaPQMZWc1ZoZuaKxN9Aco45HUM2VJE/BjW0fzlVtals4OAl5YHYzeePpxZb
 5yVHtIto7W9kidRppkey7vnSPAhuO4BpkJrZe5XCyNePPsqBtv3KhEtUax61e/uu/bip
 SZbY7MH4nIJvGXTJPYKQbtWTRw9Cu11xQdbWZU+P9EGJPOO7o3WaZPHUnA41lDKnqHUb
 0OQbUnWrjkqlPfUQ+G+j4dG2aqgucYJZCVuDmF5AQNL6y4N6g/T100wRVIMu1BEitw8m
 DQhw==
X-Gm-Message-State: AOAM533UeaQwZrqgeNcEAvGeXG3DQnM5nNMf9cwp62aNGLWC5CbkJ96v
 9LNqLwAf+PpzSIFv8/Vp/MSnJ4h54BfT/3iCs2R65YtBMGt9lG0jchZJqyGMQcOiz+CPw6ysHSn
 0y7qy5caqmuZ6IRI=
X-Received: by 2002:a5d:4a0f:0:b0:1ed:d377:288a with SMTP id
 m15-20020a5d4a0f000000b001edd377288amr5443896wrq.3.1649232848836; 
 Wed, 06 Apr 2022 01:14:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK/9a66+Z8Vkg8YlJtbRtYQFH1rnWaWpHVjAF6rAKoK64xF6QQBAspIv0QIcDJHj8AaQwCiQ==
X-Received: by 2002:a5d:4a0f:0:b0:1ed:d377:288a with SMTP id
 m15-20020a5d4a0f000000b001edd377288amr5443870wrq.3.1649232848631; 
 Wed, 06 Apr 2022 01:14:08 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p8-20020a5d59a8000000b00204178688d3sm15980576wrr.100.2022.04.06.01.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 01:14:08 -0700 (PDT)
Date: Wed, 6 Apr 2022 09:14:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <Yk1LzkeISZYKxjnN@work-vm>
References: <20220405190658.65187-1-dgilbert@redhat.com>
 <20220405171152-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220405171152-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, alex.williamson@redhat.com, leobras@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Tue, Apr 05, 2022 at 08:06:58PM +0100, Dr. David Alan Gilbert (git) wrote:
> 
> The patch is fine but pls repost as text not as
> application/octet-stream.

Let me try and figure out how; this is the same git send-email
I've used for years; it's our corporate mail setup that's screwing the
header up.

Dave

> Thanks!
> 
> -- 
> MST
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


