Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FFD4A48CA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 14:55:16 +0100 (CET)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEX9G-0003PN-Iv
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 08:55:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEWba-0002gx-G2
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEWbW-0000jL-Eq
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643635220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52AADeGyYzojwAqbdTxrIwODO7NSerxUIXlVA85w45E=;
 b=i463bL9W8KEeXLwasv3YFwm/EhmHgyLlT0yt4TR21tgWYHK2Fuzuwwtc7AAebeoVB4g/H2
 3dJI1+vrLBXHRbvYDzbjBSYFCc30sgmOIfolnXZiKcplIhwpslDDgw0MygAYdRN5n3RhVf
 hybCLAeyykWtLAEopCOJ0ybc0v2rbr4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-N4BSi8N8O12DaHDB-xbwXQ-1; Mon, 31 Jan 2022 08:20:18 -0500
X-MC-Unique: N4BSi8N8O12DaHDB-xbwXQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 gb4-20020a170907960400b0069d1ebc4538so5008093ejc.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 05:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=52AADeGyYzojwAqbdTxrIwODO7NSerxUIXlVA85w45E=;
 b=o7+MtNzQBH3L4JtVC7I6pWkLd5bBvQWD9akod86fp1njL7iu5BEWkrzWxpJBDfgwu1
 2WB//LE5jxIN0WZ1tQHuoIw2c8GnfS09F8YRkF+40XprqR4LlO/chxtJdLles7txoU/y
 osdE1O/83n5MU23qnBOkp0koLABHCTopxvRQlFNpqj3i8853RUJHu8zxZZtWCybOSuMc
 hYKw/ht3vOmaroA0y0Ml4ZM5XyePphxl+A8ye0sB2sraXORmF38lJjv/fdfbWF/7yYdi
 LtzuYMU+hXtQD6N9pBpaPtfUyfvcLBmy5jIU/CVauMIq3elBfgf6KFycSXQLA6/Q+dwW
 WnHg==
X-Gm-Message-State: AOAM530A5P50A0y5TgtjjTbZsLSv/sPTynZi+9BJY/WTb018CgkwHAPn
 RwpKQW7VB/6hCOrSsqKmJykeV+Xor4t7bUuF1dav5QkwZbqtkZwGKy0NSghMP5SfFruvMffP82h
 KC+Fa8xAl6PbIR+w=
X-Received: by 2002:a17:907:1c8a:: with SMTP id
 nb10mr17101521ejc.273.1643635217539; 
 Mon, 31 Jan 2022 05:20:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrDFsoNBY3j1o4YvU1DtNTVPYC01KX9kgDNR6agQPOi3IsavHmyWxTtAkfW2TSlw8QDIEGEg==
X-Received: by 2002:a17:907:1c8a:: with SMTP id
 nb10mr17101496ejc.273.1643635217255; 
 Mon, 31 Jan 2022 05:20:17 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id u1sm13370085ejj.215.2022.01.31.05.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:20:16 -0800 (PST)
Date: Mon, 31 Jan 2022 14:20:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
Message-ID: <20220131142015.5e73ff90@redhat.com>
In-Reply-To: <CAARzgwyc4UkvDSfu_tg8PqvG9VUZWVuPgVv5NRWqAguJgc8Thw@mail.gmail.com>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
 <CAARzgwyc4UkvDSfu_tg8PqvG9VUZWVuPgVv5NRWqAguJgc8Thw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org, "Michael S
 . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dmitry V . Orekhov" <dima.orekhov@gmail.com>,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 11:47:00 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Wed, Jan 12, 2022 at 6:33 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> > fields in headers of ACPI tables. While it doesn't have impact on
> > default values since QEMU uses 6 and 8 characters long values
> > respectively, it broke usecase where IDs are provided on QEMU CLI.
> > It shouldn't affect guest (but may cause licensing verification
> > issues in guest OS).
> > One of the broken usecases is user supplied SLIC table with IDs
> > shorter than max possible length, where [2] mangles IDs with extra
> > spaces in RSDT and FADT tables whereas guest OS expects those to
> > mirror the respective values of the used SLIC table.
> >
> > Fix it by replacing whitespace padding with '\0' padding in
> > accordance with [1] and expectations of guest OS
> >
> > 1) ACPI spec, v2.0b
> >        17.2 AML Grammar Definition
> >        ...
> >        //OEM ID of up to 6 characters. If the OEM ID is
> >        //shorter than 6 characters, it can be terminated
> >        //with a NULL character.  
> 
> On the other hand, from
> https://uefi.org/specs/ACPI/6.4/21_ACPI_Data_Tables_and_Table_Def_Language/ACPI_Data_Tables.html
> ,
> 
> "For example, the OEM ID and OEM Table ID in the common ACPI table
> header (shown above) are fixed at six and eight characters,
> respectively. They are not necessarily null terminated"
> 
> I also checked version 5 and the verbiage is the same. I think not
> terminating with a null is not incorrect.

I have a trouble with too much 'not' within the sentence.
So what's the point of this comment and how it's related to
this patch?



> > 2)
> > Fixes: 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/707
> > Reported-by: Dmitry V. Orekhov <dima.orekhov@gmail.com>
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Cc: qemu-stable@nongnu.org
> > ---
> >  hw/acpi/aml-build.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index b3b3310df3..65148d5b9d 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -1724,9 +1724,9 @@ void acpi_table_begin(AcpiTable *desc, GArray *array)
> >      build_append_int_noprefix(array, 0, 4); /* Length */
> >      build_append_int_noprefix(array, desc->rev, 1); /* Revision */
> >      build_append_int_noprefix(array, 0, 1); /* Checksum */
> > -    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
> > +    build_append_padded_str(array, desc->oem_id, 6, '\0'); /* OEMID */
> >      /* OEM Table ID */
> > -    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
> > +    build_append_padded_str(array, desc->oem_table_id, 8, '\0');
> >      build_append_int_noprefix(array, 1, 4); /* OEM Revision */
> >      g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
> >      build_append_int_noprefix(array, 1, 4); /* Creator Revision */
> > --
> > 2.31.1
> >  
> 


