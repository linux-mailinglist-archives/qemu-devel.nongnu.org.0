Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5447D7AE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:29:24 +0100 (CET)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07Ih-0001NG-Au
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:29:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n079Q-00010g-Ut
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n079O-0001ZM-Rw
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:19:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640200785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIezjOLbKCs3HkE6UzBUP1M4GuwCisiCR+oVqszw+hA=;
 b=ADkxikM0ICPe5OMtf7z+i+gvgj2hZUkTeGkY+nU5TCnf5k7YnZl57uyh8zmcaGYzFrag24
 XXb8TCavwwe/TnW+5AlyYO4CTAIXvQ+OBewv+MawRh5HKQpIod43V2dPtNvk4SiUFbEKXv
 qZVL8i4P/aTe8EbAL0ErC0ar+ctIgDQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-Fvd2f_TWPPqxevd57Ptacw-1; Wed, 22 Dec 2021 14:19:44 -0500
X-MC-Unique: Fvd2f_TWPPqxevd57Ptacw-1
Received: by mail-wm1-f71.google.com with SMTP id
 g140-20020a1c2092000000b00345d1448d3aso96970wmg.9
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 11:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kIezjOLbKCs3HkE6UzBUP1M4GuwCisiCR+oVqszw+hA=;
 b=lP2DBtcW9VLeniIhpyXIpvb38iOg/+bOr/P0V7pccPN4D+zgx1z7Q0WNMaoIBIDqP7
 Kh8cWZwtMSBOx8n+ZeCYnotWoJZUrPbWq3dbdGj0Ha3WWeNHcrbmlUKcCgS1zjWKHLqY
 BVbp1RrF1Iwh3xxy9l8rx4Bdxr4TyJ0j0Qneu2zRdD8jUriXRE6Ynyht/KCkuggdVyRF
 zaJR8Yp77a+dhMVs9Z5EmPT4LcjFGzLGfwRNqJNwgNyCJbsKwZdw4m6veuXlA3FGJ/fF
 TYlDiDpoylX25kdS+M0GbgpFNtPfkBV1qBKZlxfEth9th1th8ZXJvl5kjGXmOsB/2jRS
 rzyw==
X-Gm-Message-State: AOAM531GTnfvEMqKwBSSEcfZ5uJTXwtsVi8gd0z5QZANTyklUR40GzqW
 itRecT1dB+61neRyLow4QHu4B5+DG/i7+9U1eBW5IZFLal0vQFQCyuJEL0GWBRCH8vT2sbBTl8X
 CX5YiizWmkPGKeik=
X-Received: by 2002:a7b:c450:: with SMTP id l16mr1833372wmi.21.1640200783461; 
 Wed, 22 Dec 2021 11:19:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+BmnhrmVkDeJBcrif/I7wqTvBUxzT8FEy4Kyb3tSxLFiu9TktraqcSMmeVn9ISZG+9yC7Qg==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr1833358wmi.21.1640200783275; 
 Wed, 22 Dec 2021 11:19:43 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id b1sm3193740wrd.92.2021.12.22.11.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 11:19:42 -0800 (PST)
Message-ID: <ad22de10-a52c-ff34-0790-3be8e7d62630@redhat.com>
Date: Wed, 22 Dec 2021 20:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] acpi: validate hotplug selector on access
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211221144852.589983-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211221144852.589983-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.694, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Alexander Bulekov <alxndr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Mauro & Alex

On 12/21/21 15:48, Michael S. Tsirkin wrote:
> When bus is looked up on a pci write, we didn't
> validate that the lookup succeeded.
> Fuzzers thus can trigger QEMU crash by dereferencing the NULL
> bus pointer.
> 
> Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
> Cc: "Igor Mammedov" <imammedo@redhat.com>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

It seems this problem is important enough to get a CVE assigned.

Mauro, please update us when you get the CVE number.
Michael, please amend the CVE number before committing the fix.

FWIW Paolo asked every fuzzed bug reproducer to be committed
as qtest, see tests/qtest/fuzz*c. Alex has a way to generate
reproducer in plain C.

Regards,

Phil.


