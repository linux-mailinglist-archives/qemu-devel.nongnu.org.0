Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A255ED3BA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 06:00:27 +0200 (CEST)
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odOFF-0001aB-VK
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 00:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odODZ-0000B5-Sw
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 23:58:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odODU-0003nD-Cz
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 23:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664337515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pDPIS6caYWOJotOX8OS6v4GaMbCKoU6u9o8OTsHQzVs=;
 b=EMe93qONHr6xmU5FzwMXmco8eIacGX1aFVCfOqcj6cvM9QmjeiYALIdjXIfZE9baVd2bVa
 zyLnmTN6dtMDiiJM8ZZ4pSfpplG6Wc6MNKnEYmsTVGjHJVGY3ck5Ks4J6EudYaf1YRPtBv
 pepENeFZNswTafy6lmHuy1+1lA7rhyE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-xVMWab1iMxeTPmg17fyebA-1; Tue, 27 Sep 2022 23:58:25 -0400
X-MC-Unique: xVMWab1iMxeTPmg17fyebA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i129-20020a1c3b87000000b003b33e6160bdso447536wma.7
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 20:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=pDPIS6caYWOJotOX8OS6v4GaMbCKoU6u9o8OTsHQzVs=;
 b=f8hown095fYDk47ltyhEE2shDWlttkqEcIPmBdMk+Cy9rADegLohpr9RU/gSx1lU4W
 CpywSwBWj2OQ/F7Z90xEnbtaIaAajwPVhyByxf81RuTsDJWZspAV3+1Un6R6HdYNm34K
 FJtvETJ6SS5U2QWf0lBS0VSSKo4z9H76MxzoMjzrGdtWE01Ene8oA91RKHHrV6ZiaS6R
 DTnQUwZ+BY67JgKg4B7vwuTl/qQF5CeapVMSTqXopr6uKwFl2L8msGwWK4RkPqgh8koG
 h/VmDvmd1cMWKO3aO8AHOCUgvZukzQXsa+EOWaeTmcl0uMmfbJsPJKYvdvZbWZdhkC1G
 GS0A==
X-Gm-Message-State: ACrzQf2Vee3vl1gIojxX1H3GKcfg1ytZt6lZQpvREiSllEE8w8TaabFB
 Bx6CS7b2p6Cp3g/Tn4AmcXSwYjkFAPZMeErlJ4MmSO4oRrF4iMh+cj84/oNciYqnVI4B6eWSKin
 7ljJZXVgs4ZUMRNY=
X-Received: by 2002:a05:600c:2118:b0:3b4:76ce:d274 with SMTP id
 u24-20020a05600c211800b003b476ced274mr5102216wml.95.1664337504520; 
 Tue, 27 Sep 2022 20:58:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5+orr579Cx3BJ6wFpZY8MW7drjydsaVqhTya650II4cLCQ1BIB+6mBNvpgemxGm6GKfFwwZA==
X-Received: by 2002:a05:600c:2118:b0:3b4:76ce:d274 with SMTP id
 u24-20020a05600c211800b003b476ced274mr5102203wml.95.1664337504302; 
 Tue, 27 Sep 2022 20:58:24 -0700 (PDT)
Received: from redhat.com ([2.55.17.78]) by smtp.gmail.com with ESMTPSA id
 j8-20020a5d6188000000b0022cc3e67fc5sm1702032wru.65.2022.09.27.20.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 20:58:23 -0700 (PDT)
Date: Tue, 27 Sep 2022 23:58:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 imammedo@redhat.com, jsnow@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220927233925-mutt-send-email-mst@kernel.org>
References: <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <20220927171601-mutt-send-email-mst@kernel.org>
 <CAARzgwx=514Q8hMMLP4OpczRH4U2iiMnHqhJ6p3vg-8O3_aK=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwx=514Q8hMMLP4OpczRH4U2iiMnHqhJ6p3vg-8O3_aK=w@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SORTED_RECIPS=2.499, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, Sep 28, 2022 at 08:38:54AM +0530, Ani Sinha wrote:
> > I don't really care where we upload them but only having the
> > latest version is just going to break anything expecting
> > the old binary.
> 
> In fairness, I am not entirely certain if there is a tight coupling
> between the qemu tests and the bits binaries. I have written the test
> framework in a way such that test modifications and new tests can be
> pushed into the bits binaries and the iso gets regenerated with the
> new tests from QEMU itself before running the tests. Only when we need
> bits bugfixes or say upgrade to new acpica that we would need to
> regenerate the bits binaries.

Theoretically, that's correct. But if we did not have bugs we would
not need tests.

-- 
MST


