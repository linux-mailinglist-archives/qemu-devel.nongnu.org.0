Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA782569F20
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 12:10:02 +0200 (CEST)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9OSP-0001s1-Bi
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 06:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o9ORE-0001CD-Ho
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 06:08:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o9ORA-0007in-RH
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 06:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657188523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sTnTFjqUTY9ZmJPx84hSaxZzuiPka6Jy1n/64JFq+D4=;
 b=HEOGB62hECymQqlJpVUpRbN/yIXLAyF4V4q5m713UIMRTi5+YBQi+nXvA3D7FAUtCTyDXA
 qgUJBHTqY2Yo7q6bco84q0Ow05A+RYB5hi/LCzpeewsAc6dvAJB64pUWLLrKCZJgO4ZAW1
 4u6Z6tmW3GhAntvdfIYebyobTSCIo0A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208--WB8Z2afMkmMEF8trVuhTQ-1; Thu, 07 Jul 2022 06:08:40 -0400
X-MC-Unique: -WB8Z2afMkmMEF8trVuhTQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 t4-20020a1c7704000000b003a2cfaeca37so362756wmi.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 03:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sTnTFjqUTY9ZmJPx84hSaxZzuiPka6Jy1n/64JFq+D4=;
 b=t0IAC+mC6iHLvAJ4rd66flRGPcIyH8IIHgtnj8xBkydit2ggDPTiF9DGxiagtKwFeO
 WjiccduZXo5bpaREsdM4tE2awqARL+LtVp6Qz3cbqF0XyisNRXfijVgghsPQanFRToTz
 zVFlYxHf2tbHUv0shCYPf9zDl+sB3qWFOmYjch8owb6dDqDRjR2gk3/20XaW2lO6xzpR
 X/NyqJ2eFoBhRmoxigbaGB7tu974MXt5IldxOC6U8CJeM5ht6pnA/iqkaxWf0uI4898k
 lq4fCW4jE2HcXSB6x/gGVDksCbAYeTuiaXWTa47yg2cl+S3vUok36YZYZT9DbsnrWvgz
 Sybg==
X-Gm-Message-State: AJIora+v3wKAOZExBU4TBLMZatZ7aQJ3ehgDWjoLrt+tiH/5/0zJ37JB
 r7O4+REg4U6wDccbT6fkBTyooFjVrpnLsLU+4TZzYhMZr59ioo0X9o5weUk17oVEcAo6xDuVOB3
 tM4XL/XlVtb70eZU=
X-Received: by 2002:adf:9d92:0:b0:21d:66c4:e311 with SMTP id
 p18-20020adf9d92000000b0021d66c4e311mr22572976wre.575.1657188519135; 
 Thu, 07 Jul 2022 03:08:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sO1YvxjPJJiUZBg9gvTZHxaO7mvzNA9Fqma4sMNjVRlxfLdyiLgsRGfDDTBjMMwfJgHDe7OQ==
X-Received: by 2002:adf:9d92:0:b0:21d:66c4:e311 with SMTP id
 p18-20020adf9d92000000b0021d66c4e311mr22572950wre.575.1657188518835; 
 Thu, 07 Jul 2022 03:08:38 -0700 (PDT)
Received: from redhat.com ([2.52.154.68]) by smtp.gmail.com with ESMTPSA id
 p5-20020a5d59a5000000b0021d20461bbbsm28400401wrr.88.2022.07.07.03.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:08:38 -0700 (PDT)
Date: Thu, 7 Jul 2022 06:08:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca
Subject: Re: [PATCH 02/17] acpi: x86: deduplicate HPET AML building
Message-ID: <20220707060622-mutt-send-email-mst@kernel.org>
References: <20220701133515.137890-1-imammedo@redhat.com>
 <20220701133515.137890-3-imammedo@redhat.com>
 <20220701121346-mutt-send-email-mst@kernel.org>
 <20220707111616.3f43b503@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707111616.3f43b503@redhat.com>
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

On Thu, Jul 07, 2022 at 11:16:16AM +0200, Igor Mammedov wrote:
> On Fri, 1 Jul 2022 12:26:16 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Jul 01, 2022 at 09:35:00AM -0400, Igor Mammedov wrote:
> > > HPET AML doesn't depend on piix4 nor q35, move code buiding it
> > > to common scope to avoid duplication.
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > 
> > Apropos, tests/data/acpi/rebuild-expected-aml.sh ignores the
> > fact that some tables might be identical. Also, there's no
> > way to reuse expected files between machines. And so we have:
> > 
> > 
> > [qemu]$ find tests/data/acpi -type f -exec sha256sum '{}' ';'|sort
> [...]
> 
> > 
> > 
> > It's easy to fix up duplications within virt. But I am not 100% sure how
> > fix up duplication between q35 and pc.
> [...]
>  
> > Then we could maybe use the directory "pc" for files common to i440fx
> > and q35.  Maybe just teach the test to look under tests/data/acpi/x86
> > too? And I think we should teach tests/data/acpi/rebuild-expected-aml.sh
> > to check for duplicates and at least warn the user.
> 
> Probably duplicates in 'virt' mostly due to combination of not knowing
> that there is a fallback lookup (which is hidden in the code)
> and simplistic way tests/data/acpi/rebuild-expected-aml.sh rebuilds tables.
> 
> As you suggest, rebuild-expected-aml.sh can be improved to warn or even
> better drop duplicates if found.

Want to try?

> As for reusing tables between different machine types, alternatively
> we can add explicit remapping rules (possibly auto-generated) versus
> currently used implicit fallback approach.

My worry with this is that if a specific table needs to be split from
the generic variant then user would have to hack the test code as opposed
to just updating the tables, so the update can not be done
automatically. Thoughts?

-- 
MST


