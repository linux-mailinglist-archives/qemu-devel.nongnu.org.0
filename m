Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308164428BE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:42:24 +0100 (CET)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoR5-0005lL-5J
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mhoOi-0002Bn-TD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:39:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mhoOh-0000uP-Cz
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635838793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2pliXpWKKjuAfZVo3BQHlWak/QA1JJS/3S3eywOs9E=;
 b=Zq60N/Jea/4fl8Ky8EkRFCCedNrx3Xk5D6E9mfUZ2A4gawqjYUqAbPDcaz983ggVRuSAX9
 znwCwkhjFo/qFS7abckF/fk77p9fvi1aj90dKyJlTIhyO7rVoGJ4HAHYhXpkV78d7MEbXZ
 lifSCNgQF/fsZp5SuEDPa9bN4Xyzn5E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-BTczGoWMMhSNAV9VbVpUew-1; Tue, 02 Nov 2021 03:39:52 -0400
X-MC-Unique: BTczGoWMMhSNAV9VbVpUew-1
Received: by mail-ed1-f72.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso18046894edj.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 00:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v2pliXpWKKjuAfZVo3BQHlWak/QA1JJS/3S3eywOs9E=;
 b=C3ds+it0AArPJFQmm8EmXEkJo8GrjCnYpi+7RGugBbqwr/nGkywgjKW1TE4BPMvgAT
 RoxY58+tKO369CShDEavBKmVIb6vueko39gRYlt0hMNw8m5WK77gzjLk6ONP40WOMpbU
 uL6vdHI+b3V5Om+Kunw3juBPp8xAtKkaInSbEv/17isMh+1HuA1Cc8g8309dALTdnXXZ
 4HMv1133xQOME/WQrH/p+4u8Sz932occFBMFHbMMGM4i78RcMlCQbW+ZECFzC0fXXR7c
 m09bsOL0tyAIvmBAMcPQ5lLggGgkcK+/refEhhZPnJvH3nR2INl7InFFLdkvMe33nQcb
 8TKg==
X-Gm-Message-State: AOAM530L6+r1b3EbcmIWpKfmxI6ro37HCGCWQy+p/hxlKNsu+OMoKkaj
 9NI3gsqHgEO819+QnhoMqq3UP/2t8ck4ZQhpjD1muHFJPFsOVVUHtseGEj4L3bJ0KD+3uFBDwYp
 o7PlrHW8P6ktNHFE=
X-Received: by 2002:a17:907:d8f:: with SMTP id
 go15mr9855501ejc.495.1635838791487; 
 Tue, 02 Nov 2021 00:39:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWp+02zKY6Iw3uvCrTojmOzgzd47DaVFOmTf/isl2AgwK0z8KMoFGmm2fB10i+uaoELTSfug==
X-Received: by 2002:a17:907:d8f:: with SMTP id
 go15mr9855465ejc.495.1635838791222; 
 Tue, 02 Nov 2021 00:39:51 -0700 (PDT)
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id oz13sm2649303ejc.65.2021.11.02.00.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 00:39:50 -0700 (PDT)
Date: Tue, 2 Nov 2021 08:39:48 +0100
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211102073948.am3p3hcqqd3cfvru@gator.home>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 10:44:08AM +1100, Gavin Shan wrote:
> 
> Yeah, I agree. I don't have strong sense to expose these empty nodes
> for now. Please ignore the patch.
>

So were describing empty numa nodes on the command line ever a reasonable
thing to do? What happens on x86 machine types when describing empty numa
nodes? I'm starting to think that the solution all along was just to
error out when a numa node has memory size = 0...

Thanks,
drew


