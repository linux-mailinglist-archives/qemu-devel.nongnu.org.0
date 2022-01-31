Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1E4A4913
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:12:28 +0100 (CET)
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXPv-0008Kk-I9
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:12:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nEWsl-0003kp-Bz
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nEWsi-0003S9-6z
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643636286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pmg2YDZGnj9pMRytb79HXg18cRWjM/X5BpL3etptDN4=;
 b=N+Gunh7Plk0e71Fzq7tMnC2bFmqv+Rj7HxZpejLh+vxWegzlyLboeNI/GwtcU2Q4fMshIx
 WYsodR/uD9GL9PwIxLeIEsBPNzUAYGm+UN35WysSArmoT+Fyukw9RSY0TwdmekJCAYa+tj
 wVb5V3+7+idTTZEo8b9WAEg3LKmR+Tg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-NoXd7yZJODKiLFE45Bdusg-1; Mon, 31 Jan 2022 08:38:05 -0500
X-MC-Unique: NoXd7yZJODKiLFE45Bdusg-1
Received: by mail-ej1-f71.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so4973653ejw.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 05:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pmg2YDZGnj9pMRytb79HXg18cRWjM/X5BpL3etptDN4=;
 b=zol+zFV3lJ5EqHCup/dJIVQ5DeYN6FTfgYl7maxj2T3XURxXG0BYidhz0DifBZInRe
 rijjnfaI94mc5pihfjmuOoBoHdtYNCtXS9KLrISMbCojLdSB86rJPDUOUyrSsICn3aL+
 Ay/RaOOgichjowN9Lmw+laYm24sTMP3TldpSn+h6i29EgDAsCMzVaRe3NMcGc3/Dpgej
 fDkybCz1jM8kXi3B52V1dPuN9rLYdxt3kC+egncPV1xKUjKytQAcLJh68xfO8N74A2Pe
 PTz9LzYMUa4Zytk1rsdkziXEY8JykeWp+4sMgILbKeXZMWiinYqIXZJ2L5HXa/pJdrLR
 aCpQ==
X-Gm-Message-State: AOAM530GWRfHZqfetVPPCdJ39bh3YI4odfg7cW/uE0UCuGiitSA31RXH
 uBXTEw1W+Xg9UmzDNox0GqZatSspVpXvdpicbgjt5tCbMskgQUPlYD/9Y06pIwEKm+fSUxfRWt5
 tRojwOEHELPF3Lcg=
X-Received: by 2002:a17:907:168b:: with SMTP id
 hc11mr17466899ejc.676.1643636283838; 
 Mon, 31 Jan 2022 05:38:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwt2BjfMyW/K1IJHbTSvM5WA5pbHwxmVBdW3DjxtUDONgt9fn5v8li46OA//A3EeV6MiLPHZw==
X-Received: by 2002:a17:907:168b:: with SMTP id
 hc11mr17466889ejc.676.1643636283647; 
 Mon, 31 Jan 2022 05:38:03 -0800 (PST)
Received: from redhat.com ([2.55.147.35])
 by smtp.gmail.com with ESMTPSA id w22sm5832033ejc.137.2022.01.31.05.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:38:02 -0800 (PST)
Date: Mon, 31 Jan 2022 08:37:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/4] acpi: fix short OEM [Table] ID padding
Message-ID: <20220131083732-mutt-send-email-mst@kernel.org>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220131142156.1e4b1690@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220131142156.1e4b1690@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 02:21:56PM +0100, Igor Mammedov wrote:
> On Wed, 12 Jan 2022 08:03:28 -0500
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > Since 6.0 the commit:
> >   602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> > regressed values of OEM [Table] ID fields in ACPI tables
> > by padding them with whitespace is a value is shorter then
> > max possible. That depending on vendor broke OEM [Table] ID patching
> > with SLIC table values and as result licensing of Windows guests.
> > 
> > First reported here https://gitlab.com/qemu-project/qemu/-/issues/707
> 
> ping,
> Michael can you pick it up so that downstreams could
> backport the fix?

I see the differences with Ani have been resolved, will be in
the next pull.

> > 
> > CC: Marian Postevca <posteuca@mutex.one>
> > CC: Michael S. Tsirkin <mst@redhat.com>
> > CC: Ani Sinha <ani@anisinha.ca>
> > 
> > Igor Mammedov (4):
> >   tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for test_oem_fields()
> >     test
> >   tests: acpi: whitelist nvdimm's SSDT and FACP.slic expected blobs
> >   acpi: fix OEM ID/OEM Table ID padding
> >   tests: acpi: update expected blobs
> > 
> >  hw/acpi/aml-build.c              |   4 ++--
> >  tests/data/acpi/pc/SSDT.dimmpxm  | Bin 734 -> 734 bytes
> >  tests/data/acpi/q35/FACP.slic    | Bin 244 -> 244 bytes
> >  tests/data/acpi/q35/SSDT.dimmpxm | Bin 734 -> 734 bytes
> >  tests/data/acpi/virt/SSDT.memhp  | Bin 736 -> 736 bytes
> >  tests/qtest/bios-tables-test.c   |  15 ++++++---------
> >  6 files changed, 8 insertions(+), 11 deletions(-)
> > 


