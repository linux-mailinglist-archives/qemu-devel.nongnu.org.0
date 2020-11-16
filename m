Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307C02B44B1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:31:01 +0100 (CET)
Received: from localhost ([::1]:37280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeay-0006Lt-7I
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keeXp-0004Xj-Jv
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:27:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keeXl-0000G2-3O
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605533258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSEdWlHFKQ+KqrT3oNm/mvqp/uL82goUQSVxKS28JnU=;
 b=dvwTzbr1U/gBFiO/At1RMi5RC20/Z2FTbF2QZe2P0HNpTJvDBIWsPha4GJjb4WRUDutQ2x
 ++jnemXGC5+c+Y29YVQeH2eHDVAAvfHHVmH7GBpR0teK2EDHBm5s9OKVrY49OdoWcEN/7C
 9eEeYyxsBwulrKdIXSlItPUDewHDfJc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-sHiwjGE3MB6cVkf-npd4zQ-1; Mon, 16 Nov 2020 08:27:36 -0500
X-MC-Unique: sHiwjGE3MB6cVkf-npd4zQ-1
Received: by mail-wr1-f72.google.com with SMTP id f4so11123170wru.21
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 05:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tSEdWlHFKQ+KqrT3oNm/mvqp/uL82goUQSVxKS28JnU=;
 b=L56Zbno3ACa+zIwGJVyB+FrxkmkFbMT6AgzWAzerdre2bNlUHJd1gy5QjwTh57sEBg
 qGgVEZLQiv5Y/P7A3H3T+Jg2IAfO1U4UFAZq/GoZl4zVKxYS8Gjshj9DttVYEcqTHuvW
 OBoBWFU87sgtfvz/Un7XPyNOc1joxQQgSRdMZ79ayNc63bzgzg8Mhni0e5VnhClkgTu6
 8FfEar4IoFnJgDRpTnlchm7q69WJDwFczez56BcPfAUoJ3P66qb+d1nhm3b03lPIRMxl
 hZYQladWRh0Q3ZE+W9i0h5npoElDBHAUB22BKX867/hXKPGBa3Z3W1Y+VyZibqoblhHQ
 M35A==
X-Gm-Message-State: AOAM530gRslSuC1/7mVKL7PxwY4pINCg8Ik7LhgBvAvcQG93nkoJr+t0
 2i8J3W3bzxhA1ht8J08HSP6fl99S90dFRRy/5iRKE91AZhfuEylD69Cb/xUITUvrJANo97tZFTe
 XhxH6JPGRwHW+3Fc=
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr15161461wmh.41.1605533255239; 
 Mon, 16 Nov 2020 05:27:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3aJVy/SwWAk8WKw7I1gvgdO+Jk7Iduh/MF0ZwjiaENgPO+6op2XbduhpjKohphDHf7iJNLA==
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr15161433wmh.41.1605533255003; 
 Mon, 16 Nov 2020 05:27:35 -0800 (PST)
Received: from redhat.com ([147.161.8.56])
 by smtp.gmail.com with ESMTPSA id s25sm16025745wmh.16.2020.11.16.05.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 05:27:34 -0800 (PST)
Date: Mon, 16 Nov 2020 08:27:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PULL 7/9] hw/i386/acpi-build: Fix maybe-uninitialized error
 when ACPI hotplug off
Message-ID: <20201116082603-mutt-send-email-mst@kernel.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
 <20201116122417.28346-8-alex.bennee@linaro.org>
 <20201116072607-mutt-send-email-mst@kernel.org>
 <46c6a76d-348f-4351-656c-8ec4b07f8f8b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <46c6a76d-348f-4351-656c-8ec4b07f8f8b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 02:11:35PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/16/20 1:27 PM, Michael S. Tsirkin wrote:
> > On Mon, Nov 16, 2020 at 12:24:15PM +0000, Alex BennÃƒÂ©e wrote:
> >> From: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
> >>
> >> GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
> >> is already in the "if (bsel || pcihp_bridge_en)" block statement,
> >> but it isn't smart enough to figure it out.
> >>
> >> Restrict the code to be used only in the "if (bsel || pcihp_bridge_en)"
> >> block statement to fix (on Ubuntu):
> >>
> >>   ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
> >>   ../hw/i386/acpi-build.c:496:9: error: 'method' may be used uninitialized
> >>   in this function [-Werror=maybe-uninitialized]
> >>     496 |         aml_append(parent_scope, method);
> >>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>   cc1: all warnings being treated as errors
> >>
> >> Fixes: df4008c9c59 ("piix4: don't reserve hw resources when hotplug is off globally")
> >> Signed-off-by: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
> >> Signed-off-by: Alex BennÃƒÂ©e <alex.bennee@linaro.org>
> >> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >> Message-Id: <20201108204535.2319870-4-philmd@redhat.com>
> >> Message-Id: <20201110192316.26397-8-alex.bennee@linaro.org>
> > 
> > BTW it's in my pull request alredy.
> > Not sure why you are merging it too ...
> 
> I suppose to unbreak Gitlab-CI...
> 
> There is no policy w.r.t. CI so maintainer don't have to use it,
> but this breaking it delay the workflow of others subsystems.
> 
> I'm not asking you to use it, just explaining why this patch is
> in Alex's queue.
> 
> Regards,
> 
> Phil.

Not sure I understand.
It's in my pull request from Nov 15. I'm not sure how does it
help anyone to also have it in another request from Nov 16...

-- 
MST


