Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB6A569E6C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 11:18:03 +0200 (CEST)
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Ne4-0003Gr-CK
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 05:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9NcZ-0002QO-AX
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9NcU-0003dn-C7
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657185381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aXAa41vx67eJlZ5N5uST8LLUcsxoGbDP5TEsuoMc3Y=;
 b=UNp+pEoAjGt1kQFIqSwMjVtcK3ob/U3viQMcfO41+fhFiOBGYJBwhKUPpD96JbCQxUaBya
 cEi+BcfwIRNi5HdKCFNH/2dKZ5ooudUqBB2gkKXhZiLDgjIgMJTuBNe7BF+/6pETMIgrjC
 xPrTXvtZmN1JuT652gziKwIqZRMi/mQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-Sw0YB6ZdPN6APEPtaIdWFw-1; Thu, 07 Jul 2022 05:16:19 -0400
X-MC-Unique: Sw0YB6ZdPN6APEPtaIdWFw-1
Received: by mail-ej1-f69.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so4563587eje.23
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 02:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9aXAa41vx67eJlZ5N5uST8LLUcsxoGbDP5TEsuoMc3Y=;
 b=F6CkPsngFWUf96+q/7gV7WYIHp54ZANn33OiFcl0rXc4VIWVT/EkKJXwaebwET3IV+
 M7yozIUabh7BJ9QlB+Bdcs+z+S3Tc5TMx923VFA2XRFD5u8Pv4dQBH2XHvIAx+JIuioO
 jbmcl/5DqfitzQU6Eqr1ZDK6IpxF7alD5JVVGzha3kRKD4pM5EbCaTgPk+ZKLu54AAi1
 ReQzJMyE3hbnsEiclB/2iGrYiuvZ4QczFAQqYox///xoXV0jSoKuJNCrEn7x8mp92YPN
 htZtgBIvZrxRp57SaLe8VwbtuggwxdmvZmpGBCvF8vznHWXuBMcLxRWI5pZu5eROcjNu
 Z85w==
X-Gm-Message-State: AJIora+IzD/kI+xrSCoeFtUo4066WqKRn/oyt1b2+/M9ClHgbFDtuO74
 NdUVxg9RgVlOx+it+SLuSwi0RSjOGxrwY+aiS4jLjNWb7CLfusI72jQip5ca+zAOuX2w7QuFZJi
 NJeHRKQPtWJ+sDTE=
X-Received: by 2002:a17:907:6da4:b0:726:9a46:49cd with SMTP id
 sb36-20020a1709076da400b007269a4649cdmr44045584ejc.12.1657185378409; 
 Thu, 07 Jul 2022 02:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s8tWLp69lh1R1fJY4muasULRctf5O9rdGSunMZ+3Zp3CDy78BTS3R30ciHEKNLq1rjPMMkeQ==
X-Received: by 2002:a17:907:6da4:b0:726:9a46:49cd with SMTP id
 sb36-20020a1709076da400b007269a4649cdmr44045559ejc.12.1657185378134; 
 Thu, 07 Jul 2022 02:16:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 kz9-20020a17090777c900b0072af2460cd6sm2721301ejc.30.2022.07.07.02.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 02:16:17 -0700 (PDT)
Date: Thu, 7 Jul 2022 11:16:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca
Subject: Re: [PATCH 02/17] acpi: x86: deduplicate HPET AML building
Message-ID: <20220707111616.3f43b503@redhat.com>
In-Reply-To: <20220701121346-mutt-send-email-mst@kernel.org>
References: <20220701133515.137890-1-imammedo@redhat.com>
 <20220701133515.137890-3-imammedo@redhat.com>
 <20220701121346-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 1 Jul 2022 12:26:16 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Jul 01, 2022 at 09:35:00AM -0400, Igor Mammedov wrote:
> > HPET AML doesn't depend on piix4 nor q35, move code buiding it
> > to common scope to avoid duplication.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Apropos, tests/data/acpi/rebuild-expected-aml.sh ignores the
> fact that some tables might be identical. Also, there's no
> way to reuse expected files between machines. And so we have:
> 
> 
> [qemu]$ find tests/data/acpi -type f -exec sha256sum '{}' ';'|sort
[...]

> 
> 
> It's easy to fix up duplications within virt. But I am not 100% sure how
> fix up duplication between q35 and pc.
[...]
 
> Then we could maybe use the directory "pc" for files common to i440fx
> and q35.  Maybe just teach the test to look under tests/data/acpi/x86
> too? And I think we should teach tests/data/acpi/rebuild-expected-aml.sh
> to check for duplicates and at least warn the user.

Probably duplicates in 'virt' mostly due to combination of not knowing
that there is a fallback lookup (which is hidden in the code)
and simplistic way tests/data/acpi/rebuild-expected-aml.sh rebuilds tables.

As you suggest, rebuild-expected-aml.sh can be improved to warn or even
better drop duplicates if found.

As for reusing tables between different machine types, alternatively
we can add explicit remapping rules (possibly auto-generated) versus
currently used implicit fallback approach.


