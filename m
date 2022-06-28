Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CDD55BFEB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:55:07 +0200 (CEST)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67w2-0008CJ-Dj
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o67u0-0007Au-9b
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o67tt-0003GP-0I
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656409971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PZBAVHvplp4/FHuWIiRZuLclkff6x/bhqF0tQy4WgIo=;
 b=eteDGq0ui1qvnZzj7g+Y8BZWI+6ekxlCraFY5zZyBLeHpCjpk7Ouvl4dpCsogcLh0gqeP3
 pLH5HMu9FdY4O8mbIqJBNyr1RaDaHtlq4MfnX/VAwXRHi0+p+ha74D9y9oFQCeIpldr3Tx
 dQkuABFkpTLSQEVDj2jAuwd7dkyX/GU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-qEC_12d0NTOoiIDWIV-dlQ-1; Tue, 28 Jun 2022 05:52:50 -0400
X-MC-Unique: qEC_12d0NTOoiIDWIV-dlQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m17-20020a05600c3b1100b003a04a2f4936so2844938wms.6
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 02:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PZBAVHvplp4/FHuWIiRZuLclkff6x/bhqF0tQy4WgIo=;
 b=tzxbhfBZ9JQHIAkhBOknPkRO8TaNukr+mrVqYPAGDJx2KnBzdA1OlwQSgRSgejhZc3
 txjjC2c5NJ84bXOkEpNSpVkjwqOWMhbRalSCIRe6QulY3KeHBzJeOSVQ5OSLDXw7NNET
 O1MMWvBEzXXawTOpMKtI8NIzoAHCRqwRcOxrZnXhS3LZpYPfwJgTzrmswe+BFFGW62Tu
 CWLsYDni/YuQAYUmR+LOlp6/eIB49oESu0U6l+hLBJiuMtcMrYWCrSO00r0oGM8qx5fE
 1UonrkOpKatPizLAkQeWra6mTwoi1fXoK/glBgFuwhyNAXvAkcn5AbMdICg/gYrWFQs8
 bbqw==
X-Gm-Message-State: AJIora9cO29tVNQ9e63c8KFO4RZ955s8TC/0mZaYe/ttNzT6f0M8zW79
 itBQb+8UsJ0j9Ksl8L+KPi3IN3OhPBJPAoaqrxCpKMMTuCEHqS9gspU1h+w/Dr32W/dYFpp8kKb
 JuRhRmqWp+18lmzo=
X-Received: by 2002:a1c:7c16:0:b0:3a0:4c5f:ce13 with SMTP id
 x22-20020a1c7c16000000b003a04c5fce13mr8570693wmc.73.1656409969100; 
 Tue, 28 Jun 2022 02:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vWR1hlSp1t1MGAAhnMp6FZ5uYbo3VjuaYd3t5Ifq2yCB5Jx8VZ+Jbd9P13J8HWBW77UIijKg==
X-Received: by 2002:a1c:7c16:0:b0:3a0:4c5f:ce13 with SMTP id
 x22-20020a1c7c16000000b003a04c5fce13mr8570677wmc.73.1656409968861; 
 Tue, 28 Jun 2022 02:52:48 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 p20-20020a1c7414000000b003a05621dc53sm1024982wmc.29.2022.06.28.02.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 02:52:48 -0700 (PDT)
Date: Tue, 28 Jun 2022 05:52:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: [PATCH 04/12] acpi/tests/bits: initial commit of test scripts
 that are run by biosbits
Message-ID: <20220628055114-mutt-send-email-mst@kernel.org>
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-5-ani@anisinha.ca>
 <9de4a425-dfdf-3d3e-17c3-622ce1c5df2f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9de4a425-dfdf-3d3e-17c3-622ce1c5df2f@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 09:24:19AM +0200, Thomas Huth wrote:

... 3000 lines of irrelevant code ...


> > diff --git a/tests/qtest/acpi-bits/bits-tests/testcpuid.py b/tests/qtest/acpi-bits/bits-tests/testcpuid.py
> > new file mode 100644
> > index 0000000000..ac55d912e1
> > --- /dev/null
> > +++ b/tests/qtest/acpi-bits/bits-tests/testcpuid.py
> > @@ -0,0 +1,83 @@
> > +# Copyright (c) 2012, Intel Corporation
> > +# All rights reserved.
> > +#
> > +# Redistribution and use in source and binary forms, with or without
> > +# modification, are permitted provided that the following conditions are met:
> > +#
> > +#     * Redistributions of source code must retain the above copyright notice,
> > +#       this list of conditions and the following disclaimer.
> > +#     * Redistributions in binary form must reproduce the above copyright notice,
> > +#       this list of conditions and the following disclaimer in the documentation
> > +#       and/or other materials provided with the distribution.
> > +#     * Neither the name of Intel Corporation nor the names of its contributors
> > +#       may be used to endorse or promote products derived from this software
> > +#       without specific prior written permission.
> > +#
> > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
> > +# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> > +# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> > +# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
> > +# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> > +# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> > +# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
> > +# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> > +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
> > +# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> 
> Could you do me a favour and add a SPDX license identifier in front of the
> license boilerplate codes?
> 
> It's not required for the QEMU project, but at least I normally have
> troubles to find out what such longer license boilertexts mean ... is it a
> BSD license, is it a MIT license, something completely else...? A short SPDX
> line at the beginning helps to identify the license at a first glance.
> 
>  Thomas

Pls remember to cut out irrelevant text when you respond.

Thanks,
-- 
MST


