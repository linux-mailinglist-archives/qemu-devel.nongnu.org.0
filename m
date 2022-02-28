Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65214C6C23
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:23:00 +0100 (CET)
Received: from localhost ([::1]:49020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOf3L-0004e5-L9
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nOf1S-0002r2-1r
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:21:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nOf1Q-0000WU-At
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646050857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LhNdDYYMfQASoZzfmi8AAbMkb8sW/vRRgbDoybJCU9A=;
 b=hSjZllc87lgCA9RmzjmFHIs2NXKSP5jDkXrDT9DBPozRECJiawaKRu89aA7XVOD+F5v7uK
 i4thSUdnKXj1SUsZ02Eh4ukaPQ+1v21Bfoa6KTX8dYb7VhO5U0D96IaxtRDfgxa7i2v1lU
 0EzEwwatgz4SfUwZjlQbXKH3lqoHYEc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-buSPdUYNPoyixU-8bmy8bw-1; Mon, 28 Feb 2022 07:20:56 -0500
X-MC-Unique: buSPdUYNPoyixU-8bmy8bw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg33-20020a05600c3ca100b00380dee8a62cso800650wmb.8
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 04:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LhNdDYYMfQASoZzfmi8AAbMkb8sW/vRRgbDoybJCU9A=;
 b=pFIjpjGq8t1P/ZDsqVZbANDYuhXLXyeZlIn8OVv0l6AytH+URWB1WkxdJFdHGjAEwe
 d1JMtFUhcGrGRKvF4iQkzN6rNOukmQFwr9oo8gIkcV13rN9fucvGHkF3OPqxPbipTZHK
 NiXa69zufjF+CGIAr2GgfwAC/Kezz+zXKRJWDlCeC1KvYQ1UH3Q0st/r5aUFG4MhZsYb
 mhY4TG9zMlwEgQBjlnGBpfNd7GWHCO75GHRdTYuW4Joc9Q5HkBlU94kGKApNg7OfQMtQ
 +J9xTE5oUUQdPBU7YRsngRmM5QLZXR+pm/H4Wh1yHwfkfNfUnBN2LXceq1MV9elejyRr
 Qpyw==
X-Gm-Message-State: AOAM533M9o2lCn60XAPQtYOlFoa8bx5zd3Pp6YTH6iTk/YWGvJ1/iJiU
 frE1bbp8Q0uh7AuyA9L7ZbTSy5FyVm7wfoL7J7zkIIDjjxg4dM0IU5yfR3NcjtxicdDapfUoSnF
 ikyXssong2s0+2Kg=
X-Received: by 2002:a5d:47c5:0:b0:1ef:f2e8:11fc with SMTP id
 o5-20020a5d47c5000000b001eff2e811fcmr1285430wrc.109.1646050855500; 
 Mon, 28 Feb 2022 04:20:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDlsFGGq8q5W7xRCfW/XFbF2ElRngsfiqbY3FL1ONdLrq25uOYoZKJQ/fGJ4xGJGvfreaWjg==
X-Received: by 2002:a5d:47c5:0:b0:1ef:f2e8:11fc with SMTP id
 o5-20020a5d47c5000000b001eff2e811fcmr1285420wrc.109.1646050855302; 
 Mon, 28 Feb 2022 04:20:55 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id
 f9-20020adffcc9000000b001e9e8163a46sm14799197wrs.54.2022.02.28.04.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 04:20:54 -0800 (PST)
Date: Mon, 28 Feb 2022 13:20:53 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: Report KVM's actual PSCI version to guest in
 dtb
Message-ID: <20220228122053.46hrghi5zhltbz6u@gator>
References: <20220224134655.1207865-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220224134655.1207865-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 01:46:54PM +0000, Peter Maydell wrote:
> When we're using KVM, the PSCI implementation is provided by the
> kernel, but QEMU has to tell the guest about it via the device tree.
> Currently we look at the KVM_CAP_ARM_PSCI_0_2 capability to determine
> if the kernel is providing at least PSCI 0.2, but if the kernel
> provides a newer version than that we will still only tell the guest
> it has PSCI 0.2.  (This is fairly harmless; it just means the guest
> won't use newer parts of the PSCI API.)
> 
> The kernel exposes the specific PSCI version it is implementing via
> the ONE_REG API; use this to report in the dtb that the PSCI
> implementation is 1.0-compatible if appropriate.  (The device tree
> binding currently only distinguishes "pre-0.2", "0.2-compatible" and
> "1.0-compatible".)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Based-on: 20220213035753.34577-1-akihiko.odaki@gmail.com
> ("[PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0")
> though note that to compile on arm hosts you'll need the
> bugfix to that patch from which I describe in a reply to it.
> 
>  target/arm/kvm-consts.h |  1 +
>  hw/arm/boot.c           |  5 ++---
>  target/arm/kvm64.c      | 12 ++++++++++++
>  3 files changed, 15 insertions(+), 3 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


