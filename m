Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F0604BE9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:43:43 +0200 (CEST)
Received: from localhost ([::1]:41194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBEM-00082i-FJ
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olB3o-00059z-R4
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:32:57 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olB3n-0004cd-8j
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:32:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so263307wma.3
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VNvwHkGrOcOL/6X2aUCAVmoI1LC93qBZ8sWk70IbZuM=;
 b=mxUy8hiFgjUxTJ2ZZEKIaexWazq5LRHLy/Viq6xew5Op+VxVOL/SgFrxt4hOnqES7k
 m0kg9KAZn1XVnFuGRSMkfwKzjRlbtwYC9RN1EnqizEoXZwwk21j/j4Ztk3PXIRUVWXaP
 c8okFb/3yzontOiUop4pafmMfEvc62ZKsJ9emEdT8w8vcMXOdCoKI/xrb118SiA3ltDe
 k3TZKNncKG+7Ho9hOC2prBlSCRaGLLeeszINFTPSm4/b+if4vU5LzBhdo/ReaiRDyBk9
 dmwO+merVmq2HNhbdMC6rmBUoMk1J9lWAO69vrF7SffNYkVrw9QfikgjfLjF2FXcgliR
 Lykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VNvwHkGrOcOL/6X2aUCAVmoI1LC93qBZ8sWk70IbZuM=;
 b=lLFvsiZNXQo9UGynCOAmFTgclIAo5TWnd6gIwRvkkgOoVOr2ueoE1ZDB9wsfsDRKaB
 5vC+SDtF9CofmZfOFT2atDzy+6uwafOOXbyL1epuiPGXLCvWDtV3L/+SG7IxoCd/Fsi0
 wdF1JjwIubCmJ1kQLNgxJ0eDkfjXeEoyNtFmR/Vh7h/OHyi5y1aCMjVv1gsQOgJytzzs
 f9s7GGOs2J59+O5JKw1w+sx36zwcyg6CEh3nAyi+6x7O3oU/vZkMvYQP4HsipzXdu9lQ
 y8XrunojtrS9dp0cTdifDLhP+6J/GnLXiQ5DKX3Nyte7a0autxYHjaiqOmZnnspJ4Kdt
 kQgw==
X-Gm-Message-State: ACrzQf1GIVtHt5HuyCLJih1VwgowSwmN9n7JSFj9J/DBOZ14OuX1tGRi
 qFWAX7YouFr+MLlVl99/Bp3brg==
X-Google-Smtp-Source: AMsMyM53yfb3EeVn5HreW3rFjh0dRu5stM7we7GEqt+L3BV32lPQ/ZaKsmx0wZjabtxqQJX4IFmmQw==
X-Received: by 2002:a05:600c:1c07:b0:3c6:cb22:8a93 with SMTP id
 j7-20020a05600c1c0700b003c6cb228a93mr27423568wms.45.1666193565318; 
 Wed, 19 Oct 2022 08:32:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c1c0800b003c6b7f5567csm2904575wms.0.2022.10.19.08.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 08:32:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3D83E1FFB7;
 Wed, 19 Oct 2022 16:32:44 +0100 (BST)
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-6-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 05/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits smilatency tests
Date: Wed, 19 Oct 2022 16:32:04 +0100
In-reply-to: <20221019025828.683113-6-ani@anisinha.ca>
Message-ID: <8735bjbzhf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ani Sinha <ani@anisinha.ca> writes:

> Added the SPDX license identifier for smilatency tests.
> Also added a comment indicating that smilatency test is run from within t=
he
> biosbits environment/VM and hence is not subjected to QEMU build/test
> environment dependency fulfilments or QEMU maintanance activities.
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/avocado/acpi-bits/bits-tests/smilatency.py2 | 4 ++++
>  1 file changed, 4 insertions(+)

Thinking about this again, why not just merge this with the initial code
dump?


--=20
Alex Benn=C3=A9e

