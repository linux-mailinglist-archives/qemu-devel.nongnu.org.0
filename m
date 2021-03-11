Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3367336D87
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:12:50 +0100 (CET)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKGR7-00056n-OC
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lKGOX-0004AE-D2
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:10:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lKGOV-0000Vs-OV
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615450206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xp4ISbv7X5rAt3azXsUHnFj2plMsYN6k/nB0TuV7tOs=;
 b=c8PMhPuui8NeifmKoysa1rosxG2oV9Yf0tQvYhrVa+mJYFVMZVR/6IjhMWBONbzBpsdFzK
 ci5/+w9rGOCjdXSDQC7ssKyz41EdIKNC9F9X4u/XZHcrzcqpgLMo+VIWHlzONhjqeE9Hv2
 fUG/eSoZrXHfKXVLz5iQpusBtkKcpqg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-VNT1SM9uO9--LeTp3oPLDw-1; Thu, 11 Mar 2021 03:10:05 -0500
X-MC-Unique: VNT1SM9uO9--LeTp3oPLDw-1
Received: by mail-wr1-f72.google.com with SMTP id e29so9156606wra.12
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 00:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Xp4ISbv7X5rAt3azXsUHnFj2plMsYN6k/nB0TuV7tOs=;
 b=Kc43c4sp3Qg9hrUyogkv78q0Or/Wa8TaLTXpp6UdX2yJmUPG3Qkdk7qn02WnHm1mRM
 wRgMvEzYG4qF+wvVGf4asorp6MVKUAqwjYZ6hEG4xVZir1EZbVDA4IMSEUQ2uIZ3qMYA
 3RXnjnsvGdqMfsfcR6xX2nX5Sibfbw8JpQS2oIditnhOLmXBY+Z2QUlS6y/VrrDxJd6v
 EG5dKsYdrI/8zcUt3qbvc2J0zCg7mr3xaxR4/OLFyh89ht8TvtKPzSdJTC8glh0JW5/W
 w9RlEMtKcnvhAp4A38qdeCHRyl+9LxUhgvppeHy/FPmNmHx/ETZ/3SjtPqSISeNOkXxf
 9+fw==
X-Gm-Message-State: AOAM532g4/nm8Lo+b+hl3WNJGwGZ5iKtFi/UVyr3CopIGY52iZxq9+UF
 u/Wta4Pfyn+9k7r42KWtXtYNDkU94Q5+stWEdS/b7hZfO4W2Txo66Z3NkwqMYLe7lRuxCVlnlEw
 V24FZQKe+3qCAHbk=
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr2146730wrf.4.1615450204027;
 Thu, 11 Mar 2021 00:10:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKVC+rDlPUt7XrDSjCwaS2DaP8DFCFJBupgHl7DUZQyj718CbtaiRzKqgvbNNeTUXB59cI3A==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr2146712wrf.4.1615450203840;
 Thu, 11 Mar 2021 00:10:03 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id v18sm2899489wrf.41.2021.03.11.00.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 00:10:03 -0800 (PST)
Date: Thu, 11 Mar 2021 09:10:01 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v6 1/7] net/eth: Use correct in6_address offset in
 _eth_get_rss_ex_dst_addr()
Message-ID: <20210311081001.fgfssff4f67lyujw@steredhat>
References: <20210310183123.1212612-1-philmd@redhat.com>
 <20210310183123.1212612-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310183123.1212612-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 07:31:17PM +0100, Philippe Mathieu-Daudé wrote:
>The in6_address comes after the ip6_ext_hdr_routing header,
>not after the ip6_ext_hdr one. Fix the offset.
>
>Cc: qemu-stable@nongnu.org
>Reported-by: Stefano Garzarella <sgarzare@redhat.com>
>Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by e1000e functionality")
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> net/eth.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


