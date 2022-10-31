Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB66133FE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:52:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opSOz-000680-CJ; Mon, 31 Oct 2022 06:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opSOx-00067g-Sk
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opSOw-0000Rk-9s
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667213537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gwsHNKcgHm6GgNYA9iFf/NQi4v2Seh9dwEtGjMd0TO4=;
 b=M/nJQiS0iXOg5bulGVDXZ1GV0nPYLJV9JbLWKti5JhxeX6fBokyX13lIXvzivd01Kb69Ji
 GvFbt/iCfxFBkmBYnnOOTswwpsD2KR09iIVZX+QUsuVNH1pWQVlR2l+WQj5MU/4PO4RHUC
 GPLVZu6/RR/UK/BzPWJFdGQJrD+9H1Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-MoH90vgzNgKxc5OeeT9AnQ-1; Mon, 31 Oct 2022 06:52:15 -0400
X-MC-Unique: MoH90vgzNgKxc5OeeT9AnQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 e21-20020adfa455000000b002365c221b59so2957192wra.22
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gwsHNKcgHm6GgNYA9iFf/NQi4v2Seh9dwEtGjMd0TO4=;
 b=nkxR06OSnGzwkgsLWr1rpI47uCW9kdsYj0a9EI/jn7bPT2m76JkAweWSC13uZ47XSq
 c4xPMoShiCOrOGRxX2giDFCZbT/AetJwMTZf0ZZJ9QoH2g9GcPQ2VYYIKYUWHpC+RTss
 Hf7yh/FvERGnZaSPqHYrRavULMzBrViO8appg8V6sLmF6SCL7mAVZWbBrJqU9RBGE+z4
 xT22MzqzJpBT3xfXIGxaFsJ3valoeDLVyKnpMeaY8s6Pn+IUcW8xrykuTnZ1F5jCz51G
 Dv0kOTxNP6gTMgYXIsre0f4ljOd9+4ui1nQV2xLVzPjajrVyM9C5DTJfAs+xNf1Jo9i7
 44HA==
X-Gm-Message-State: ACrzQf0C4Emw4lrTvImCmrlld75FibGQ8deZXIYn7On0BcW8nqCh2Ivz
 DMPEs90gLR3kbn1Yo70Za/XC+96n6ypFyF7C1mfym9RyY5q8qbekS66tLjnav87RCU5GomitMZh
 XcueFEUNEHe0OghU=
X-Received: by 2002:a7b:c005:0:b0:3c3:6b2a:33bf with SMTP id
 c5-20020a7bc005000000b003c36b2a33bfmr7478201wmb.167.1667213534675; 
 Mon, 31 Oct 2022 03:52:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mFnoFkvVIE6nsTx04aa6LSsAV9t2O1Rd2GDru9BYPN7YrHpE6UfLqtX+XlGJmlR3POyJsXw==
X-Received: by 2002:a7b:c005:0:b0:3c3:6b2a:33bf with SMTP id
 c5-20020a7bc005000000b003c36b2a33bfmr7478191wmb.167.1667213534447; 
 Mon, 31 Oct 2022 03:52:14 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c468b00b003cf75213bb9sm1340620wmo.8.2022.10.31.03.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 03:52:13 -0700 (PDT)
Date: Mon, 31 Oct 2022 06:52:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] bios-tables-test: do not ignore allowed diff list
Message-ID: <20221031065126-mutt-send-email-mst@kernel.org>
References: <20221027151135.496368-1-mst@redhat.com>
 <20221031114942.36e1dc83@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031114942.36e1dc83@fedora>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 11:49:42AM +0100, Igor Mammedov wrote:
> On Thu, 27 Oct 2022 11:11:48 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > we had such a beautiful structure for updating
> > expected files, designed to keep bisect working.
> > It turns out that we ignored the result of
> > the allow list checks unless all tables matched
> > anyway.
> > 
> > Sigh.
> 
> strange,
> it seems to be working fine (I mean white-listing) here

it's pretty clear no? if we only check test_acpi_find_diff_allowed
when all tables match anyway, it won't help test pass.

> > 
> > Let's at least make it work going forward.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index e6096e7f73..a72f6ca326 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -458,7 +458,7 @@ static void test_acpi_asl(test_data *data)
> >                  "for instructions on how to update expected files.\n",
> >                  exp_sdt->aml, sdt->aml_file, exp_sdt->aml_file);
> >  
> > -        all_tables_match = all_tables_match &&
> > +        all_tables_match = all_tables_match ||
> >              test_acpi_find_diff_allowed(exp_sdt);
> >  
> >          /*


