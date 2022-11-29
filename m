Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5C463B952
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 06:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozspw-0004Ip-Iv; Tue, 29 Nov 2022 00:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozspu-0004Ia-Px
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 00:07:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozspr-0002Ec-Pm
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 00:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669698428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Ac8R5tJ6b18bm3LUqw0ktdgxj91uYueVkp51ou414w=;
 b=VUQ5OvIjVy/M/Z6FkTcvpHkoVB5vRSXuUVzYpwiOxWA/RrwscpjOHetoDZxxUUFDXUbJvc
 frSJKD4V3BFx2yQ1ACPpBTHoLU3bv777SPvuJTDw+oJduPTeXbeL1pk5cbz7gNV7yRpyCP
 1jUZsdZ2/35r1krxNzM2SKljK7CjOSs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-DKrEAdB5PSaPuuLjkE1-OQ-1; Tue, 29 Nov 2022 00:07:06 -0500
X-MC-Unique: DKrEAdB5PSaPuuLjkE1-OQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so9611218wme.7
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 21:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Ac8R5tJ6b18bm3LUqw0ktdgxj91uYueVkp51ou414w=;
 b=OVfe+BwLKBKK69bgqkUxZglY55omDyErFFrWdpas0qAv+WoUioIt+kJcievfc/HUd4
 EKqMJUa3lxRZEhH1vcqBiaG+synzg8x77NTnYHX60KyITmyuOsRyDfRqb9dZPRTtnQhn
 XtvEIjT5Cu9g/3cVXcIbmE7HSvCjHyk2tnJQfsxh/HFKPzLFaWNae5tDIqA7RnwdcH3j
 6OYP0pskXUKEx3qx1VgscpYGvg3tlJ/f4waDmH3NDfd8fJf4j0d47lPgHlzQNKwMJgdn
 hE0wxnqlD1oi6Z/DFwGh1fj7a5YVT8UgSAy7nMgz6ILdcSs3l01Bm2ZUE7iDUAsQKwoU
 svtQ==
X-Gm-Message-State: ANoB5pmaU39Y4WneAEaRKLxtDUtcGOMbZw1RMShqGgvfe9sPQXj9Ec5s
 AFDGPE0eGCKE4JtepilO6vMOMad/q+wK8o3KWTh7VFgkVj5QmBdLbJwrKCAqXceURaGaxJap8zW
 5l4BlsZ187gjqDEk=
X-Received: by 2002:a7b:cbc3:0:b0:3cf:a83d:28d1 with SMTP id
 n3-20020a7bcbc3000000b003cfa83d28d1mr44321286wmi.57.1669698425764; 
 Mon, 28 Nov 2022 21:07:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6pbk3sMDKz8JQ2AxK7i0K0UcAE/9VYe/GUPxFf55GN16OrsysWZpCeyPr9PudBK8b9q+fv5g==
X-Received: by 2002:a7b:cbc3:0:b0:3cf:a83d:28d1 with SMTP id
 n3-20020a7bcbc3000000b003cfa83d28d1mr44321261wmi.57.1669698425462; 
 Mon, 28 Nov 2022 21:07:05 -0800 (PST)
Received: from redhat.com ([2.52.149.178]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm926488wmo.0.2022.11.28.21.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 21:07:04 -0800 (PST)
Date: Tue, 29 Nov 2022 00:07:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: add SPDX license identifiers
 for bios bits tests
Message-ID: <20221129000647-mutt-send-email-mst@kernel.org>
References: <20221125044138.962137-1-ani@anisinha.ca>
 <CAARzgwy=m4tN69cSn1msrZg1thkzL2ZfQ8_yOLw6Y77AzfFP-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwy=m4tN69cSn1msrZg1thkzL2ZfQ8_yOLw6Y77AzfFP-g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 29, 2022 at 08:02:15AM +0530, Ani Sinha wrote:
> 
> 
> On Fri, Nov 25, 2022 at 10:11 AM Ani Sinha <ani@anisinha.ca> wrote:
> 
>     Added the SPDX license identifiers for biosbits tests.
>     Also added a comment on each of the test scripts to indicate that they run
>     from within the biosbits environment and hence are not subjected to the
>     regular
>     maintenance activities for QEMU and is excluded from the dependency
>     management
>     challenges in the host testing environment.
> 
>     Cc: Daniel P. Berrangé <berrange@redhat.com>
>     Cc: Paolo Bonzini <pbonzini@redhat.com>
>     Cc: Maydell Peter <peter.maydell@linaro.org>
>     Cc: John Snow <jsnow@redhat.com>
>     Cc: Thomas Huth <thuth@redhat.com>
>     Cc: Alex Bennée <alex.bennee@linaro.org>
>     Cc: Igor Mammedov <imammedo@redhat.com>
>     Cc: Michael Tsirkin <mst@redhat.com>
>     Cc: Thomas Huth <thuth@redhat.com>
>     Cc: qemu-trivial@nongnu.org
>     Signed-off-by: Ani Sinha <ani@anisinha.ca>
> 
> 
> Is anyone going to queue this for 7.2 given it's quite trivial?

Don't see why we should bother.

> 
> 
>     ---
>      tests/avocado/acpi-bits/bits-tests/smbios.py2    | 4 ++++
>      tests/avocado/acpi-bits/bits-tests/testacpi.py2  | 4 ++++
>      tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++
>      3 files changed, 12 insertions(+)
> 
>     changelog:
>     changes from v1: fixed typo as suggested by Phil.
> 
>     diff --git a/tests/avocado/acpi-bits/bits-tests/smbios.py2 b/tests/avocado/
>     acpi-bits/bits-tests/smbios.py2
>     index 9667d0542c..fc623de072 100644
>     --- a/tests/avocado/acpi-bits/bits-tests/smbios.py2
>     +++ b/tests/avocado/acpi-bits/bits-tests/smbios.py2
>     @@ -1,6 +1,8 @@
>      # Copyright (c) 2015, Intel Corporation
>      # All rights reserved.
>      #
>     +# SPDX-License-Identifier: BSD-3-Clause
>     +#
>      # Redistribution and use in source and binary forms, with or without
>      # modification, are permitted provided that the following conditions are
>     met:
>      #
>     @@ -24,6 +26,8 @@
>      # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
>     THIS
>      # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> 
>     +# This script runs only from the biosbits VM.
>     +
>      """SMBIOS/DMI module."""
> 
>      import bits
>     diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/
>     avocado/acpi-bits/bits-tests/testacpi.py2
>     index dbc150076e..f818a9cce6 100644
>     --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
>     +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
>     @@ -1,6 +1,8 @@
>      # Copyright (c) 2015, Intel Corporation
>      # All rights reserved.
>      #
>     +# SPDX-License-Identifier: BSD-3-Clause
>     +#
>      # Redistribution and use in source and binary forms, with or without
>      # modification, are permitted provided that the following conditions are
>     met:
>      #
>     @@ -24,6 +26,8 @@
>      # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
>     THIS
>      # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> 
>     +# This script runs only from the biosbits VM.
>     +
>      """Tests for ACPI"""
> 
>      import acpi
>     diff --git a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2 b/tests/
>     avocado/acpi-bits/bits-tests/testcpuid.py2
>     index ac55d912e1..7adefbe355 100644
>     --- a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
>     +++ b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
>     @@ -1,6 +1,8 @@
>      # Copyright (c) 2012, Intel Corporation
>      # All rights reserved.
>      #
>     +# SPDX-License-Identifier: BSD-3-Clause
>     +#
>      # Redistribution and use in source and binary forms, with or without
>      # modification, are permitted provided that the following conditions are
>     met:
>      #
>     @@ -24,6 +26,8 @@
>      # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
>     THIS
>      # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> 
>     +# This script runs only from the biosbits VM.
>     +
>      """Tests and helpers for CPUID."""
> 
>      import bits
>     --
>     2.34.1
> 
> 


