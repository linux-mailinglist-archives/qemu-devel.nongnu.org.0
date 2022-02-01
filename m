Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B54A585A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 09:15:21 +0100 (CET)
Received: from localhost ([::1]:37852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEoJj-0005Cg-SZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 03:15:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEnlE-0006t0-9L
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 02:39:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEnlA-0006b5-U2
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 02:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643701167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5118ncW+laiFpQIccbTuWP8SPJcL5ndfWWnaPHe7BI=;
 b=PkrdHAG7SNMH6H7UORDJUCtylbMMpjaWi2BLF+GXc0qF83PHfmBuf9L1b/vx64NamDyKm3
 zE6yrIOC7yNJEP5zrCZQFHKGp4t1I5j2RCfyGB0iMk7ARkwTe3tv1fbuNde3ErzdJuEL7i
 WQ46p6WJgNttii4L1DgwkLy6k5KtHiA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-xfzCYWYDN8W4rea57woZrQ-1; Tue, 01 Feb 2022 02:39:25 -0500
X-MC-Unique: xfzCYWYDN8W4rea57woZrQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so6079047ejw.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 23:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5118ncW+laiFpQIccbTuWP8SPJcL5ndfWWnaPHe7BI=;
 b=xWLecaQOy0iyDn0zqkYgR3c8x1d0zNCHUwF3n3JB8EMGY2hdxSFhDLy+5FtE9kQZHM
 z/2yHTs0gtlgIVCuSOjfaueoiG5iV9jaYeRBpcoNwUlDDX9MtwVjAC8Co/E4gNgmxU58
 Y7rqspyQv5dYkCUPWJCyrYLoG8713Mov9ElCNSM4c+CKEXoUxwNDsbs2d4oJudPlcxJU
 XhrTSe0dR7Gy+LicATgkKlzLXrhoZXakar8sDadNX3wKeEkqrllHGG3cVHuOlusKAkbo
 7XXcYjDRuOSEp744Rz6XCT14S8Bq/Ho0frJA9kWkDbnhIZYTQIPfNFeARe6sMtiXMPsU
 nQfQ==
X-Gm-Message-State: AOAM533YXxA0M4ZoD1u9FwV2zzzgtwTIS1pu8eF7M/d0pHM7QnJaGzZT
 QQmZGyelWyJCbh27eusMtCLPtmJqDhr8i101ZlVYcX+p4VACwaB3f4EVDHSpjR3CeyN1TCK4myK
 C+xaJhL8rcfBCg8I=
X-Received: by 2002:a17:906:99c1:: with SMTP id
 s1mr15997105ejn.298.1643701164628; 
 Mon, 31 Jan 2022 23:39:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0LHS2NANA8/ILA3OTWn+SQKva/JmQ1vs8y7oCKuzUZjztOPm5DSfHcCop/kocvUBpxFeRiQ==
X-Received: by 2002:a17:906:99c1:: with SMTP id
 s1mr15997081ejn.298.1643701164302; 
 Mon, 31 Jan 2022 23:39:24 -0800 (PST)
Received: from localhost (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id i14sm2171202ejp.181.2022.01.31.23.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 23:39:23 -0800 (PST)
Date: Tue, 1 Feb 2022 08:39:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
Message-ID: <20220201083922.73428015@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2201311942130.1491657@anisinha-lenovo>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
 <CAARzgwyc4UkvDSfu_tg8PqvG9VUZWVuPgVv5NRWqAguJgc8Thw@mail.gmail.com>
 <20220131142015.5e73ff90@redhat.com>
 <alpine.DEB.2.22.394.2201311854290.1478493@anisinha-lenovo>
 <20220131151024.15070c15@redhat.com>
 <alpine.DEB.2.22.394.2201311942130.1491657@anisinha-lenovo>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 31 Jan 2022 19:51:24 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Mon, 31 Jan 2022, Igor Mammedov wrote:
> 
> > On Mon, 31 Jan 2022 18:58:57 +0530 (IST)
> > Ani Sinha <ani@anisinha.ca> wrote:
> >  
> > > On Mon, 31 Jan 2022, Igor Mammedov wrote:
> > >  
> > > > On Mon, 31 Jan 2022 11:47:00 +0530
> > > > Ani Sinha <ani@anisinha.ca> wrote:
> > > >  
> > > > > On Wed, Jan 12, 2022 at 6:33 PM Igor Mammedov <imammedo@redhat.com> wrote:  
> > > > > >
> > > > > > Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> > > > > > fields in headers of ACPI tables. While it doesn't have impact on
> > > > > > default values since QEMU uses 6 and 8 characters long values
> > > > > > respectively, it broke usecase where IDs are provided on QEMU CLI.
> > > > > > It shouldn't affect guest (but may cause licensing verification
> > > > > > issues in guest OS).
> > > > > > One of the broken usecases is user supplied SLIC table with IDs
> > > > > > shorter than max possible length, where [2] mangles IDs with extra
> > > > > > spaces in RSDT and FADT tables whereas guest OS expects those to
> > > > > > mirror the respective values of the used SLIC table.
> > > > > >
> > > > > > Fix it by replacing whitespace padding with '\0' padding in
> > > > > > accordance with [1] and expectations of guest OS
> > > > > >
> > > > > > 1) ACPI spec, v2.0b
> > > > > >        17.2 AML Grammar Definition
> > > > > >        ...
> > > > > >        //OEM ID of up to 6 characters. If the OEM ID is
> > > > > >        //shorter than 6 characters, it can be terminated
> > > > > >        //with a NULL character.  
> > > > >
> > > > > On the other hand, from
> > > > > https://uefi.org/specs/ACPI/6.4/21_ACPI_Data_Tables_and_Table_Def_Language/ACPI_Data_Tables.html
> > > > > ,
> > > > >
> > > > > "For example, the OEM ID and OEM Table ID in the common ACPI table
> > > > > header (shown above) are fixed at six and eight characters,
> > > > > respectively. They are not necessarily null terminated"
> > > > >
> > > > > I also checked version 5 and the verbiage is the same. I think not
> > > > > terminating with a null is not incorrect.  
> > > >
> > > > I have a trouble with too much 'not' within the sentence.  
> > >
> > > :-)
> > >  
> > > > So what's the point of this comment and how it's related to
> > > > this patch?  
> > >
> > > My understanding of the spec is that null termination of both those IDs is
> > > not mandatory. Guests may get confused or expect the strings to be null
> > > termimated but they should really be open to expecting non-null terminated
> > > strings as well. What is important is that the number of chars of those
> > > two strings are fixed and well defined in the spec and qemu
> > > implementation.
> > >
> > > In any case, I think we can leave the patch as is for now and see if the
> > > change causes trouble with other guests.  
> >
> >
> > these fields have a fixed length so one doesn't need terminating NULL
> > in case the full length of the field is utilized, otherwise in case of
> > where the value is shorter than max length it has to be null terminated
> > to express a shorter value. That way QEMU worked for years until
> > 602b458201 introduced regression.
> >  
> 
> My comment was based on what I interpreted from reading the latest
> version of the specs. I guess the spec does not explicitly say what the
> padding
> bytes would be in case the length of the IDs are less the max length. I
> interpreted the wording to mean that whether or not the
> length of the string is shorter, one should not expect it to terminate with null.

that's what AML grmamar quoted in commit message clarifies
for specific field(s), as opposed to your generic string
type description

> It would be nice if a future version of the spec made is explicit and
> clearer.


PS:
you were asking the other day if there is any bugs left in ACPI,
(the answer is that I'm not aware of any).
But there are issues with SMBIOS tables that need to be fixed
(it's corner cases with large VM configurations), are you
interested in trying to fix it?


