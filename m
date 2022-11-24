Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A829637B4F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 15:19:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyD35-0001Ck-2E; Thu, 24 Nov 2022 09:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oyD2W-00018I-In
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 09:17:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oyD2U-0008D0-VU
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 09:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669299437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5T/8rimIyiWFdF9+/URV/GWVqhmE1eLWCSBZgvq2rY=;
 b=eEyF9o8jApRfTyalwOEZA2qthfWPH2JPBDQzxIk9/afaDtkqdaKjh+1ye8o+Je8q1YtXte
 PzDrHgIj+37s5kXAnm9jVMa/bjRkMpb3EQOcemNSWBqF10/aWCtErye4ptdwKhnZz2SVNg
 boBaC7Iq0hh2g7JaIJ7K9ggRRqtXmxc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-NnveQU98MJaOYPjzmrAUNQ-1; Thu, 24 Nov 2022 09:17:15 -0500
X-MC-Unique: NnveQU98MJaOYPjzmrAUNQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 i24-20020adfa518000000b00241e2f40d8bso446592wrb.14
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 06:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5T/8rimIyiWFdF9+/URV/GWVqhmE1eLWCSBZgvq2rY=;
 b=ORkVnZrSAkAQujU/TiC6drcW3DLGXeuFsR7V97UYkQn1KbUnCsJn2SxoFP6cERQ2Lb
 3F8NiED42nNGkx9iOzuCn2CwGSgqkcVUVhoUYChhxL6hQ89RSq6fUrE7K1MLUScAPdIZ
 jhhI1Jzsa1wPimQu27Ke4MH4DmkSYkiQCEl3gOkF1XUePO51dnvI0ECKnZMOBV+H7FdU
 rlash03LtYCdka/03Ip00HWZ1trtv+950WSYwSaY6vEdWMSUQPF2AGd2GPn9MlzM65XA
 qRw+Ms765hGz6JHv0cTfs/OmmodiZz8ITKgYY2MYBiWnvUTP5NwQqOFuJ/bjkrtkz9ZH
 m06A==
X-Gm-Message-State: ANoB5pmpnVSIN/ZV9dunQLRgy3uVSV1wAIeFHftzMFZVjt8RCGKU6p6N
 IM57vhmHk9R0i8RMyurcqsJ+G13m5dejI+meHygLb+eH27zgVlKa3gLWGFAAOrDZlnA6ES/V8Ku
 S+uccCPCNGXSS4eg=
X-Received: by 2002:adf:fd46:0:b0:22e:382d:b06 with SMTP id
 h6-20020adffd46000000b0022e382d0b06mr19534295wrs.265.1669299434708; 
 Thu, 24 Nov 2022 06:17:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4xOL494TtfHd9AjQVs2WacAJMXFCRSsgvYPsTgvKHGwd6xf+maQlLvAn9/h6S0oRasT+pD2Q==
X-Received: by 2002:adf:fd46:0:b0:22e:382d:b06 with SMTP id
 h6-20020adffd46000000b0022e382d0b06mr19534260wrs.265.1669299434298; 
 Thu, 24 Nov 2022 06:17:14 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 a1-20020adfed01000000b00241da0e018dsm1489953wro.29.2022.11.24.06.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 06:17:13 -0800 (PST)
Date: Thu, 24 Nov 2022 09:17:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] acpi/tests/avocado/bits: add SPDX license identifiers
 for bios bits tests
Message-ID: <20221124091625-mutt-send-email-mst@kernel.org>
References: <20221124135834.924426-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221124135834.924426-1-ani@anisinha.ca>
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

On Thu, Nov 24, 2022 at 07:28:34PM +0530, Ani Sinha wrote:
> Added the SPDX license identifiers for biosbits tests.
> Also added a comment on each of the test scripts to indicate that they run
> from within the biosbits environment and hence are not subjected to the regular
> maintanance acivities


activities?

> for QEMU and is excluded from the dependency management
> challenges in the host testing environment.
> 
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/avocado/acpi-bits/bits-tests/smbios.py2    | 4 ++++
>  tests/avocado/acpi-bits/bits-tests/testacpi.py2  | 4 ++++
>  tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++
>  3 files changed, 12 insertions(+)
> 
> Apologies for this. Somehow this patch fell off my tree between multiple
> revisions. Quite trivial and does not affect any QEMU codebase.
> 
> diff --git a/tests/avocado/acpi-bits/bits-tests/smbios.py2 b/tests/avocado/acpi-bits/bits-tests/smbios.py2
> index 9667d0542c..fc623de072 100644
> --- a/tests/avocado/acpi-bits/bits-tests/smbios.py2
> +++ b/tests/avocado/acpi-bits/bits-tests/smbios.py2
> @@ -1,6 +1,8 @@
>  # Copyright (c) 2015, Intel Corporation
>  # All rights reserved.
>  #
> +# SPDX-License-Identifier: BSD-3-Clause
> +#
>  # Redistribution and use in source and binary forms, with or without
>  # modification, are permitted provided that the following conditions are met:
>  #
> @@ -24,6 +26,8 @@
>  # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
>  # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>  
> +# This script runs only from the biosbits VM.
> +
>  """SMBIOS/DMI module."""
>  
>  import bits
> diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> index dbc150076e..f818a9cce6 100644
> --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> @@ -1,6 +1,8 @@
>  # Copyright (c) 2015, Intel Corporation
>  # All rights reserved.
>  #
> +# SPDX-License-Identifier: BSD-3-Clause
> +#
>  # Redistribution and use in source and binary forms, with or without
>  # modification, are permitted provided that the following conditions are met:
>  #
> @@ -24,6 +26,8 @@
>  # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
>  # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>  
> +# This script runs only from the biosbits VM.
> +
>  """Tests for ACPI"""
>  
>  import acpi
> diff --git a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2 b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> index ac55d912e1..7adefbe355 100644
> --- a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> +++ b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
> @@ -1,6 +1,8 @@
>  # Copyright (c) 2012, Intel Corporation
>  # All rights reserved.
>  #
> +# SPDX-License-Identifier: BSD-3-Clause
> +#
>  # Redistribution and use in source and binary forms, with or without
>  # modification, are permitted provided that the following conditions are met:
>  #
> @@ -24,6 +26,8 @@
>  # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
>  # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>  
> +# This script runs only from the biosbits VM.
> +
>  """Tests and helpers for CPUID."""
>  
>  import bits
> -- 
> 2.34.1


