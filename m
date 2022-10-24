Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A33B60ACBF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:13:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxzh-0003fg-IP; Mon, 24 Oct 2022 09:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omxzc-0003WE-GP
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omxza-0001OO-TL
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666619989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrrFE53fJCm04rJj6eXHEoA1aZUK769PFmuVUbRwm6Q=;
 b=hezmMvhk+b5IajA1eL1ju9fM3m22MQ85xjTjtE4Fygkjrbb8Bo+n6vo3qUSrYa2vrUHCiX
 rtTorOaH1qeccjAcSRWw2cZoyGDQ70BzFatbs2oGdLyqQYGhsntbhM0/prUgd4NmiII69r
 0PhxC08MATk0Q7z+JJg3JgGYm3PFpZI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-VrTanPPoO622A4C85wHeXg-1; Mon, 24 Oct 2022 09:59:47 -0400
X-MC-Unique: VrTanPPoO622A4C85wHeXg-1
Received: by mail-wr1-f69.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so3454946wrg.21
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jrrFE53fJCm04rJj6eXHEoA1aZUK769PFmuVUbRwm6Q=;
 b=6jdrT4Cr8v4QLKiKwdNFgypbFnXjOVcIGM6g+mGlSl2kz9G94E7RovuRhPJA7J7seR
 dU4JCYTwtY/W4IkPc6M2V9pQHJiE9q11weZxmTm2wo2JKwlMs4won3l51W8YfyGsqBaB
 QmE0onuvVToe6aaGg3OV1pGwY3n2HMERR64kzvx9hcsv4W8Ed1k0sDZqW+3nRE5gHQRk
 EHTBjgbTOeeUcKBPOYvkBOQzINMDw7uv/aEeFkzIP9HC7dZnYvKdSztGOwvj5UDS7NvR
 Vl73LfBUzp5OgG9CEEjE++kw4e/YidHK8NYxsyWIMk5A3hnEKLGdZTW7SZ7/nFo7GB1K
 4Z+A==
X-Gm-Message-State: ACrzQf1wQXitYEmr2yi/wcMKslEFRiB05mAiVbmza1Rh+JdqcRjR2Ot0
 VjG1I40rFgjA1hZxPH8gIa/FrjfwYYfv+pmenmdmvx2LKjYeGStuy6twU4OmLVh0ZZ25GHA8dHR
 tJbzAwhLdelkldXE=
X-Received: by 2002:a7b:c30a:0:b0:3c1:bf95:e17b with SMTP id
 k10-20020a7bc30a000000b003c1bf95e17bmr23413438wmj.31.1666619986817; 
 Mon, 24 Oct 2022 06:59:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4YShebeuuYOy2cn3flmhhtspwSB0G2kBdF7y4nZFdZgLjkQVSxSUilmhCegbDyHa1pQF8n3g==
X-Received: by 2002:a7b:c30a:0:b0:3c1:bf95:e17b with SMTP id
 k10-20020a7bc30a000000b003c1bf95e17bmr23413419wmj.31.1666619986546; 
 Mon, 24 Oct 2022 06:59:46 -0700 (PDT)
Received: from redhat.com ([2.54.160.13]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c468800b003c452678025sm8666598wmo.4.2022.10.24.06.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:59:45 -0700 (PDT)
Date: Mon, 24 Oct 2022 09:59:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lev Kujawski <lkujaw@mailbox.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 2/2] hw/ide/piix: Ignore writes of hardwired PCI
 command register bits
Message-ID: <20221024095844-mutt-send-email-mst@kernel.org>
References: <20221007095229-mutt-send-email-mst@kernel.org>
 <20221024094621.512806-1-lkujaw@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024094621.512806-1-lkujaw@mailbox.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 24, 2022 at 09:46:19AM +0000, Lev Kujawski wrote:
> > I guess this cna work but what I had in mind is much
> > simpler. Add an internal property (name starting with "x-")
> > enabling the buggy behaviour and set it in hw compat array.
> > If set - do not touch the wmask register.
> >
> > post load hooks are harder to reason about.
> 
> Thanks again for the review and clarification, please find attached an
> updated patch.  My only concern with the internal property approach is
> a potential proliferation of similar boolean values if someone else
> encounters an incompatibility.

Yes they do tend to proliferate. We might drop some down the road
after the affected machine type is dropped.

>  I have not conducted a thorough audit
> of all the PIIX 3/4 IDE registers for hardwired bits (only what I
> encountered testing proprietary firmware - PCICMD), and I do not have
> access to my PIIX 3 system at the moment.
> 
> Kind regards,
> Lev Kujawski
> 
> Lev Kujawski (2):
>   qpci_device_enable: Allow for command bits hardwired to 0
>   hw/ide/piix: Ignore writes of hardwired PCI command register bits
> 
>  hw/core/machine.c        |  5 ++++-
>  hw/ide/piix.c            | 24 ++++++++++++++++++++++++
>  include/hw/ide/pci.h     |  1 +
>  tests/qtest/ide-test.c   |  1 +
>  tests/qtest/libqos/pci.c | 13 +++++++------
>  tests/qtest/libqos/pci.h |  1 +
>  6 files changed, 38 insertions(+), 7 deletions(-)
> 
> -- 
> 2.34.1


