Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62976536D7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 20:13:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p84V3-0006EM-4l; Wed, 21 Dec 2022 14:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p84V0-0006EC-Hl
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 14:11:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p84Uy-0007i9-KN
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 14:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671649887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cEHsqGTXrdhxFzohH/hp1wF2YEq1tR3zNZ9G+QjfAts=;
 b=a6KlzGy0sI0IQJ5c0CQtqbqKyyTZN4u9iotQqdHZ+l6Jc6/svsmi6pGqum69HEYT7rt9KK
 CwVzfRqMqdcNyz7DWOAdhMT9b+o1IjlSmXUlcOq402lZ/fdx+IxehTCyBMdTd0+PE1tNLF
 LchKtAt3IW3pwBbkEwsu16KRJO2YWbc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-J_6iIa5qPBCnkBtaLdVzpg-1; Wed, 21 Dec 2022 14:11:25 -0500
X-MC-Unique: J_6iIa5qPBCnkBtaLdVzpg-1
Received: by mail-ej1-f72.google.com with SMTP id
 gb10-20020a170907960a00b007c192c5482eso11122640ejc.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 11:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEHsqGTXrdhxFzohH/hp1wF2YEq1tR3zNZ9G+QjfAts=;
 b=X2e9dHI9yvzHHY8fYfaRPI02nefoHtR1nRUSRxxmd7QYfP5+dk+SOp8nEWle7xIPKD
 7cKQ2svdIr+T9tXT3r1lvaxUodJWn+p0GKE+GrsXZzjHRasL1KFN+JjX01S0+UhAcN5G
 dhbHeHriBvSl3hR+4IQodC7kRyDjHK4UuwiW7OKHtIf0pwWYs43t+FmGrB1khyeEvhPT
 UUxYgT27St8/Eh7QWGlifINMl0EuHrdGjOb6uz4pUwP24FdOICkC/AoBPSogKFHQ+N0+
 jD8oSH31FYON744PcEY42UcsagCrbL+8WdeZf4f1pXGOxIQxCNDJ0NKUNQ5IC8i4pjAm
 ncCA==
X-Gm-Message-State: AFqh2koH0qMFYRON4LX0Gc8X/Dhd/AEmOT06S6C2/gqzTsalTwgN+bLN
 4Y/vHIroO5DpojrioyIHEegkvo8rULcf1VD07WuFi6vhpqDWnHgY/3yWqeHBMRY2bZ2HpFNH5Xk
 HnlPtWDWug3ZW55M=
X-Received: by 2002:a17:906:eb8f:b0:7ae:7e6:3a87 with SMTP id
 mh15-20020a170906eb8f00b007ae07e63a87mr2119118ejb.41.1671649884271; 
 Wed, 21 Dec 2022 11:11:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu0w7dzjIqANHWBhZkQb4x3MQJLeK4xpX6llnApMzeIMMuzI6bW8ULsfYzqx0iUGhGKR8yC2A==
X-Received: by 2002:a17:906:eb8f:b0:7ae:7e6:3a87 with SMTP id
 mh15-20020a170906eb8f00b007ae07e63a87mr2119091ejb.41.1671649883900; 
 Wed, 21 Dec 2022 11:11:23 -0800 (PST)
Received: from redhat.com ([2.55.175.215]) by smtp.gmail.com with ESMTPSA id
 u18-20020a1709061db200b0083f91a32131sm856890ejh.0.2022.12.21.11.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 11:11:23 -0800 (PST)
Date: Wed, 21 Dec 2022 14:11:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 0/7] Clean up dependencies of ACPI controllers
Message-ID: <20221221141110-mutt-send-email-mst@kernel.org>
References: <20221216130355.41667-1-shentey@gmail.com>
 <1D3E3781-4A9C-41DE-BC98-06C44894A5D0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1D3E3781-4A9C-41DE-BC98-06C44894A5D0@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Dec 21, 2022 at 05:56:56PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 16. Dezember 2022 13:03:48 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >This small series establishes consistency between ICH9, PIIX4 and VT82C686 ACPI
> >
> >controllers to select ACPI, ACPI_SMBUS and APM since they are provided by the
> >
> >device models.
> >
> >
> >
> >Due to the PIIX4 PM cleanup PEGASOS2's dependency can be reduced to just ACPI,
> >
> >eliminating 9 dependencies from the softmmu-ppc build.
> >
> 
> Ping
> 
> Looks like all patches are reviewed, i.e. ready to be queued.
> 
> Best regards,
> Bernhard


Sure, next pull.

> >
> >
> >v2:
> >
> >- Turn "depends on ACPI" into "select ACPI" (Phil)
> >
> >- Remove "select ACPI" from PEGASOS2 (Phil)
> >
> >- Move already reviewed patches to bottom
> >
> >- Split some patches into "add missing dependencies" and "remove redundant
> >
> >  dependencies" for ease of review
> >
> >
> >
> >Bernhard Beschow (7):
> >
> >  hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9
> >
> >  hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9
> >
> >  hw/acpi/Kconfig: Do not needlessly build TYPE_PIIX4_PM in non-PC/Malta
> >
> >    machines
> >
> >  hw/acpi/Kconfig: Add missing dependencies to ACPI_PIIX4
> >
> >  hw/isa/Kconfig: Add missing dependency to VT82C686
> >
> >  i386, mips: Resolve redundant ACPI and APM dependencies
> >
> >  hw/ppc/Kconfig: Remove unused dependencies from PEGASOS2
> >
> >
> >
> > configs/devices/mips-softmmu/common.mak | 3 ---
> >
> > hw/acpi/Kconfig                         | 9 ++++++---
> >
> > hw/acpi/meson.build                     | 2 +-
> >
> > hw/i2c/meson.build                      | 2 +-
> >
> > hw/i386/Kconfig                         | 3 +--
> >
> > hw/isa/Kconfig                          | 4 ++--
> >
> > hw/ppc/Kconfig                          | 2 --
> >
> > 7 files changed, 11 insertions(+), 14 deletions(-)
> >
> >
> >
> >-- >
> >2.39.0
> >
> >
> >


