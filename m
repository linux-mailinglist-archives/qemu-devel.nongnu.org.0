Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC2248EA70
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:15:51 +0100 (CET)
Received: from localhost ([::1]:54240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8MQo-00081E-53
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n8MLb-0005o3-9c
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n8MLX-0000Ow-6E
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642165822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=szsmUDZMubaBsBKnbofxNf6p139VW3/uO5HplkvCbYk=;
 b=Oq/Zqm5+Fa1L0dGgknBXGJ7mn6/34mi/p+B78zu/UysiFirTX0/2XF3+GBMegtxoRXlwcA
 rES3h42DPKC3kvn9VIDwxrhFylfjOW5GABlM3tIZ5JzPV9OW6xHZCz459qk1tjCK1K1kpn
 DBEyU8mTMTRN/3xLDdzhT5fPnFZRMzA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-Dip60jzdOKmmmWkYzXIzHw-1; Fri, 14 Jan 2022 08:10:20 -0500
X-MC-Unique: Dip60jzdOKmmmWkYzXIzHw-1
Received: by mail-ed1-f72.google.com with SMTP id
 v18-20020a056402349200b003f8d3b7ee8dso8290657edc.23
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 05:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=szsmUDZMubaBsBKnbofxNf6p139VW3/uO5HplkvCbYk=;
 b=r0uzIgJE0+/iAurAfY24SszGP0hLpNqyFGVemYsi4YiqkShin3Wk0qd+rY+GTUfL9p
 kSH2rDiFKKvoJdBdv3dArO8YcCa73muFSidk/BlsGsiJCP2p5Sr7OSRfq+j6QM9k5+88
 n0b6DaTkl/0KJqdcxwXR5/L4H+DSvhNfcxFFA/nP+MxNx35vXb07DzK+IwKzKoxjiJE5
 OQOF4Ama7tSnwH6VY5FbkhBiytsVfxlbFdD1hCHIw9619YHAXsGfSt8amZZhW01l2xTJ
 AlG5C/L27c8mFyA1GRkrrg5WJQS0jaXuepIJvLsrABXNf/QAH7I6zRN54HAQKre82f9J
 LQzw==
X-Gm-Message-State: AOAM530u1joWIbCZMYMDlvzOcAbyUD1SeHkPrhSF1gucCesDE4stY6Om
 vm8sZ0m1RDviHmUc5ljfo8me1VrJtatJFCdZKYqyGfQ3+pgAk9MWeIKgrL4zDp1h6Ole2lXmJa7
 ett9RxlzZ9nMCF3U=
X-Received: by 2002:aa7:cdca:: with SMTP id h10mr8656836edw.279.1642165819745; 
 Fri, 14 Jan 2022 05:10:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGeKIC1Kq5ZQqZSbeGhHRB/cC/IelGi2ItNDYYGKNBp3gfbaxtPDUbyxdWvSVpVrUT2DmRIQ==
X-Received: by 2002:aa7:cdca:: with SMTP id h10mr8656809edw.279.1642165819519; 
 Fri, 14 Jan 2022 05:10:19 -0800 (PST)
Received: from redhat.com ([2.55.154.210])
 by smtp.gmail.com with ESMTPSA id rp17sm1762783ejb.113.2022.01.14.05.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 05:10:04 -0800 (PST)
Date: Fri, 14 Jan 2022 08:09:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/4] tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for
 test_oem_fields() test
Message-ID: <20220114075714-mutt-send-email-mst@kernel.org>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-2-imammedo@redhat.com>
 <20220112084124-mutt-send-email-mst@kernel.org>
 <20220114124820.7aa72a3a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220114124820.7aa72a3a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 12:48:20PM +0100, Igor Mammedov wrote:
> On Wed, 12 Jan 2022 08:44:19 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Jan 12, 2022 at 08:03:29AM -0500, Igor Mammedov wrote:
> > > The next commit will revert OEM fields padding with whitespace to
> > > padding with '\0' as it was before [1]. As result test_oem_fields() will
> > > fail due to unexpectedly smaller ID sizes read from QEMU ACPI tables.
> > > 
> > > Pad OEM_ID/OEM_TABLE_ID manually with spaces so that values the test
> > > puts on QEMU CLI and expected values match.
> > > 
> > > 1) 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > 
> > That's kind of ugly in that we do not test
> > shorter names then.  How about we pad with \0 instead?
> 
> 
> test_acpi_q35_slic() should cover short OEM_TABLE_ID.
> 
> also padding in this patch makes test_oem_fields() cleaner
> and simplifies 3/4, switching to \0 here would require
> merging this patch with the fix itself to avoid breaking
> bisection.
> 
> If you still prefer to have test_oem_fields() test short
> names, I can post following on top that can to it without
> breaking bisection:
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 90c9f6a0a2..0fd7cf1f89 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -71,8 +71,8 @@
>  
>  #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
>  
> -#define OEM_ID             "TEST  "
> -#define OEM_TABLE_ID       "OEM     "
> +#define OEM_ID             "TEST"
> +#define OEM_TABLE_ID       "OEM"
>  #define OEM_TEST_ARGS      "-machine x-oem-id='" OEM_ID "',x-oem-table-id='" \
>                             OEM_TABLE_ID "'"

Don't we want to revert ARGS change too then?


> @@ -1530,8 +1530,8 @@ static void test_oem_fields(test_data *data)
>              continue;
>          }
>  
> -        g_assert(memcmp(sdt->aml + 10, OEM_ID, 6) == 0);
> -        g_assert(memcmp(sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
> +        g_assert(strncmp((char *)sdt->aml + 10, OEM_ID, 6) == 0);
> +        g_assert(strncmp((char *)sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
>      }
>  }
>  

Looks much cleaner to me. OK as a patch on top.


> 
> > And add a comment explaining why it's done.
> > 
> > > ---
> > >  tests/qtest/bios-tables-test.c | 15 ++++++---------
> > >  1 file changed, 6 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > index e6b72d9026..90c9f6a0a2 100644
> > > --- a/tests/qtest/bios-tables-test.c
> > > +++ b/tests/qtest/bios-tables-test.c
> > > @@ -71,9 +71,10 @@
> > >  
> > >  #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
> > >  
> > > -#define OEM_ID             "TEST"
> > > -#define OEM_TABLE_ID       "OEM"
> > > -#define OEM_TEST_ARGS      "-machine x-oem-id="OEM_ID",x-oem-table-id="OEM_TABLE_ID
> > > +#define OEM_ID             "TEST  "
> > > +#define OEM_TABLE_ID       "OEM     "
> > > +#define OEM_TEST_ARGS      "-machine x-oem-id='" OEM_ID "',x-oem-table-id='" \
> > > +                           OEM_TABLE_ID "'"
> > >  
> > >  typedef struct {
> > >      bool tcg_only;
> > > @@ -1519,11 +1520,7 @@ static void test_acpi_q35_slic(void)
> > >  static void test_oem_fields(test_data *data)
> > >  {
> > >      int i;
> > > -    char oem_id[6];
> > > -    char oem_table_id[8];
> > >  
> > > -    strpadcpy(oem_id, sizeof oem_id, OEM_ID, ' ');
> > > -    strpadcpy(oem_table_id, sizeof oem_table_id, OEM_TABLE_ID, ' ');
> > >      for (i = 0; i < data->tables->len; ++i) {
> > >          AcpiSdtTable *sdt;
> > >  
> > > @@ -1533,8 +1530,8 @@ static void test_oem_fields(test_data *data)
> > >              continue;
> > >          }
> > >  
> > > -        g_assert(memcmp(sdt->aml + 10, oem_id, 6) == 0);
> > > -        g_assert(memcmp(sdt->aml + 16, oem_table_id, 8) == 0);
> > > +        g_assert(memcmp(sdt->aml + 10, OEM_ID, 6) == 0);
> > > +        g_assert(memcmp(sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
> > >      }
> > >  }
> > >  
> > > -- 
> > > 2.31.1  
> > 


