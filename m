Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB83F4718
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 11:05:21 +0200 (CEST)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5tQ-0001WJ-Bu
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 05:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mI5rZ-00082R-7v
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mI5rX-0002b3-On
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629709403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m7Sx0aO0FQ8vxxQPVykmxFxrYkgdqVu5oD44voq6uMQ=;
 b=Ig2e28PZzzB+x7tQY4zFUD/u9v//pubYsW+vRIaTPVHt5gIS68djrbmgfV5OrfGc1OYMrX
 IglzBBB3NLg4I/ncGW7P7/s7TFaydpM6jFzNpE8vjcV5ByCyJ8uEUiBat7rBd4i58Icj8V
 LkjtDoAmVmPrTunrGwWbIUUr7qdgMfE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-2zGjrqDsPXiH_Oxt3Px-Pg-1; Mon, 23 Aug 2021 05:03:21 -0400
X-MC-Unique: 2zGjrqDsPXiH_Oxt3Px-Pg-1
Received: by mail-ej1-f69.google.com with SMTP id
 o7-20020a170906288700b005bb05cb6e25so5433126ejd.23
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 02:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m7Sx0aO0FQ8vxxQPVykmxFxrYkgdqVu5oD44voq6uMQ=;
 b=mr5CNDSZBHnCmvwEb9vlQwWbGX/PDDhnS51dO84F+b9n25DC327s4URREt9zOr5rTM
 vCMSfzWAz7NfLc4p+fS1NMCiY3835u+Bjc8vTm0osmv9OJg0m1dK2qo2FKKqr+wP4NKc
 mDr4ZKvHG1KU0sDK2KvaNOxafscVRjzorrF+vgNFLbMKcSr+o8UHWVo0PwWwDffZ2XJ8
 XKcMCb0tJKAOyYJcj/06yKjlEuY8n5qOWUeVMdHjyYQGWg4GAqWoARp2ADC1WXvFqMgG
 UtMO0xo0MiCh99xd7iYS3gdI98FDKZAX2bI+rYXxntnjlMsMU8rdAUCzykxmQhpnXIgp
 TE2A==
X-Gm-Message-State: AOAM531dhBLN90/uRDKlQYbCDUquLOfX0y2/G+CUyLgDVVnHf67lvOO4
 XzUMYABjtCq5LlKSZ56m7w+DrCOSOHmXSmkyqJ8adILEVTesOfToDMt2rRodxE05jX3Zd55NZYx
 Qhf33ncb10PiCayo=
X-Received: by 2002:a05:6402:1cbc:: with SMTP id
 cz28mr15468333edb.370.1629709400710; 
 Mon, 23 Aug 2021 02:03:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHVOnrIeO5ZOejqZFZiZmiCXcGpfdlQB3OyvVj0k2XfZ28IxLRjIqSVVmGY8qcKlFSUTcxGQ==
X-Received: by 2002:a05:6402:1cbc:: with SMTP id
 cz28mr15468318edb.370.1629709400543; 
 Mon, 23 Aug 2021 02:03:20 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id z70sm8786137ede.76.2021.08.23.02.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 02:03:20 -0700 (PDT)
Date: Mon, 23 Aug 2021 11:03:18 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 3/3] docs/about: Add the missing release record in the
 subject
Message-ID: <20210823090318.6xwknr5g6c6keomp@gator.home>
References: <20210823030005.165668-1-wangyanan55@huawei.com>
 <20210823030005.165668-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210823030005.165668-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 libvir-list@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 11:00:05AM +0800, Yanan Wang wrote:
> Commit 29e0447551
> (docs/about/removed-features: Document removed CLI options from QEMU v3.1)
> has recorded some CLI options as replaced/removed from QEMU v3.1, but one
> of the subjects has missed the release record. Let's fix it.
> 
> Reported-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  docs/about/removed-features.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 1c926a8bc1..8feeead449 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -140,8 +140,8 @@ Use ``-rtc driftfix=slew`` instead.
>  
>  Replaced by ``-rtc base=date``.
>  
> -``-vnc ...,tls=...``, ``-vnc ...,x509=...`` & ``-vnc ...,x509verify=...``
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``-vnc ...,tls=...``, ``-vnc ...,x509=...`` & ``-vnc ...,x509verify=...`` (removed in 3.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
>  The "tls-creds" option should be used instead to point to a "tls-creds-x509"
>  object created using "-object".
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


