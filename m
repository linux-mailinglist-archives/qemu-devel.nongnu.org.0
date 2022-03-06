Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE34CEAF9
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 12:21:48 +0100 (CET)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQoxP-00046q-H8
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 06:21:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQovE-0002d2-Ef
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:19:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQovB-00012i-9l
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646565567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CduO+3gxLOWm8JKrF0A94f5pzyPfp1d52y539D4bG2U=;
 b=Ju7W0Ej01eKzmNsN7yTkxaCkr4qyx3/zfZDYhJ1CIirn1/9nu+aHGswz9Vdsq1ymzmltut
 qsLl5JRra82QeT2iUyrnJm7eI/J+1dLWIOx/pgyxg0TI4mgzuIFKj6gwE03r/98WrVkAU2
 BCsgkhILQ5q3s1NbJCIkfSxLRZRMmEY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-cQOIkLN8O4GCbwDnPr_bxQ-1; Sun, 06 Mar 2022 06:19:26 -0500
X-MC-Unique: cQOIkLN8O4GCbwDnPr_bxQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 20-20020a05600c231400b00389886f6b23so2950131wmo.6
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 03:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CduO+3gxLOWm8JKrF0A94f5pzyPfp1d52y539D4bG2U=;
 b=UjFr7d8M19h0zsyCKFM+Iwxq59Y3LosSQeDuwjOrroS3LeskanB5rrOrvJnbWul9Ko
 nAh3f+DLf7/b+Af7V05m59v1F0DVLrYZHsRuOLvM9UoELndBxJ7HCWRokUtAZAziujA7
 NK1w83pyEg4eR0UdOy4sQ8ScD5dAMvFK3RVEtZ25aMWQqAX6FfdLiTC3psDJQakSEPNl
 w+tGaYFXqhKCGgDJ7XsajLqgUD6hEuYEbHOwQZ3TIXmErKH07iDDaB8ZwGQEwuYF67kD
 II1SPRqwyJBXiOmE6hKuZI2K4VGlestQ7TeGgl21eo8eum075YF/iK15yYK8op6a9WfO
 NzMQ==
X-Gm-Message-State: AOAM533zRMcOIHLeBPsCsFe6eNNxcrAV3FSkmPDANg6L8cGt+ESX/5GU
 VJiDHXMBxN0Ihiy+nkZeKC2YJidF2SsYzR5Gvj1pTiXt6tW9uox8KdXeBo96KMlZpfbrucrmbDR
 6h5yyH6TLZH9IZBU=
X-Received: by 2002:adf:f70f:0:b0:1f1:dfb1:ab68 with SMTP id
 r15-20020adff70f000000b001f1dfb1ab68mr4613066wrp.439.1646565565033; 
 Sun, 06 Mar 2022 03:19:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZxVBPqg/Mhodh007LvhJJi7wrGiH+U0e8q+QQtXbkJzR1KOzlR+59wfg7YPufxmDsKiSwbg==
X-Received: by 2002:adf:f70f:0:b0:1f1:dfb1:ab68 with SMTP id
 r15-20020adff70f000000b001f1dfb1ab68mr4613046wrp.439.1646565564713; 
 Sun, 06 Mar 2022 03:19:24 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 s17-20020adfbc11000000b001f023d197b8sm8758829wrg.68.2022.03.06.03.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:19:24 -0800 (PST)
Date: Sun, 6 Mar 2022 06:19:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v6 1/4] tests/acpi: i386: allow FACP acpi table changes
Message-ID: <20220306061833-mutt-send-email-mst@kernel.org>
References: <20220304150722.2069132-1-ani@anisinha.ca>
 <20220304150722.2069132-2-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20220304150722.2069132-2-ani@anisinha.ca>
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 08:37:19PM +0530, Ani Sinha wrote:
> From: Liav Albani <liavalb@gmail.com>
> 
> The FACP table is going to be changed for x86/q35 machines. To be sure
> the following changes are not breaking any QEMU test this change follows
> step 2 from the bios-tables-test.c guide on changes that affect ACPI
> tables.
> 
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> Acked-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..7570e39369 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,5 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/FACP",
> +"tests/data/acpi/q35/FACP.nosmm",
> +"tests/data/acpi/q35/FACP.slic",
> +"tests/data/acpi/q35/FACP.xapic",

For me make check fails with the changes in patch 2.
what about the rest of q35 FACP tables?

> -- 
> 2.25.1


