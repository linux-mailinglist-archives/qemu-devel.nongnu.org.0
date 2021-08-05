Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ABF3E1115
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:17:45 +0200 (CEST)
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBZVY-0007KF-KS
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBZUC-0005C8-89
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBZUA-000387-QP
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628154978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QuDf2erxaDdR+Mg8jscWARo27h01YBhigvUJYhTrc6Y=;
 b=HuIP5vbcig4dYbh/GL1eR/crr7EktieWSAV5fntuG28d7eQ6jmVKPbMTlSPlzXGBy9Ujuh
 CLc5N6P3IvyKIaojPNZ0hvCoh7m0xMsbLDz34ab2pNyGR35Mx+5mm2ngouIEKP0pqzM/B2
 UF7h8qrtdwyJvFFNWFmJec/biPN8xHU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592--RISyqjWN9aAU6JWxRk4AA-1; Thu, 05 Aug 2021 05:16:17 -0400
X-MC-Unique: -RISyqjWN9aAU6JWxRk4AA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m37-20020a05600c3b25b02902b5a02478adso1182159wms.0
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 02:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuDf2erxaDdR+Mg8jscWARo27h01YBhigvUJYhTrc6Y=;
 b=OueKpPwGi0l5euq6OsAB4U1ZpbezdaKg6ic4BUC/BXjtJWhfv7tRx4yO7M7uDgoEVz
 Ey2B2tsUx8EU/eyjjUymV4PXozGLx+AqvRdM43d+y2sFz2BYOXgkw5zvmW15aluD8jse
 4ncLY2fsZP7GYX4v2dfADR2EswR5eLfScPEkEvHjhXRKLDDYiRxRKgbq7056dySUoH+1
 qgt6qU2YECed3F7vW7gsgo75BVQtjlFYWq9MHFhW9PM7cqMi4H5R+EJ4IWiBBV9i+5sZ
 gT0Vm/8PkXXDoSzTdLchYiWx1ehqa73riXVAX76KEKp8UttPKl605qMebobo0cQ2tKWh
 lm+A==
X-Gm-Message-State: AOAM532GQXBz+gLdB5Pc6wuj7+GQgAXACvJcFB9PNqWJB5Jw8dVISrEC
 gFISkqdjYqU+gsAkHYr/7SGnnDOuJAfdVEv2EtHWlUu6JU4LyjWAp0ZA8IrqH2uY5DOU6WJmUNo
 Zy10QM3KkTSsG+/k=
X-Received: by 2002:a5d:4386:: with SMTP id i6mr4012449wrq.249.1628154975841; 
 Thu, 05 Aug 2021 02:16:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdvY3XYDwP3sZpn+vEcgFLex6bRxfAXS9a4F7BqHYF8pxIkI2Q6pxFJD6XqBuE5fRQEzYDDw==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr4012420wrq.249.1628154975633; 
 Thu, 05 Aug 2021 02:16:15 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id g5sm8261927wmh.31.2021.08.05.02.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:16:15 -0700 (PDT)
Date: Thu, 5 Aug 2021 11:16:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] MAINTAINERS: Added myself as a reviewer for acpi/smbios
 subsystem
Message-ID: <20210805111614.64edf049@redhat.com>
In-Reply-To: <20210730175514.40147-1-ani@anisinha.ca>
References: <20210730175514.40147-1-ani@anisinha.ca>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 mst@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Jul 2021 23:25:14 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> I have developed an interest in this space and hopefully can lend some
> helping hand to Igor and Michael in reviewing simpler patches.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4256ad1adb..1c90ea4e6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1739,6 +1739,7 @@ F: docs/specs/*pci*
>  ACPI/SMBIOS
>  M: Michael S. Tsirkin <mst@redhat.com>
>  M: Igor Mammedov <imammedo@redhat.com>
> +R: Ani Sinha <ani@anisinha.ca>
>  S: Supported
>  F: include/hw/acpi/*
>  F: include/hw/firmware/smbios.h


