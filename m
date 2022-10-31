Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A4D6133EF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:50:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opSMZ-0003YX-WD; Mon, 31 Oct 2022 06:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opSMX-0003YD-NO
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:49:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opSMW-0007lk-8m
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667213387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHqVyUDW+3mwaeWEmqnrd8tkTFPI40Q8v/hqDHCJ6XM=;
 b=I6+/EBCKQkFnDyM+M+ojHYOh5psOfYMFC2wyWacqwuF7cdb9Yc1yZJiHEABYh87aCWzkXX
 lB0Kmny41He+SLvujS0PeytmouegE1esRb9EuIZyqGKVnJUrSDaYKmbi/l3p/RHMSFv055
 +Y2iFcdO0EbWOzBDYxC6gTccbDnXlJ4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-htQzclheM6m7mb8H4IZ5Iw-1; Mon, 31 Oct 2022 06:49:45 -0400
X-MC-Unique: htQzclheM6m7mb8H4IZ5Iw-1
Received: by mail-qv1-f70.google.com with SMTP id
 x2-20020a0cff22000000b004bb07bf7557so5533084qvt.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tHqVyUDW+3mwaeWEmqnrd8tkTFPI40Q8v/hqDHCJ6XM=;
 b=EWUFS1pNBz04chiAN5SnCqPCgocSdvjrobPR2AyUqbZtqKoSDLaBG2YhOxqwnZ1JHn
 4eIz1hfUmRJzEwkVs3eCMr3PwI54p3z1i4XZ3ilMnfkNhblNG4xhCrgMlsbFYKfuB31l
 yJdUWzBzuFVOpHGrUHy2T1XDpZ5cYMN2CwOQl7qMfLKEgCDFGspIR7t6nPoBTVfYf1+T
 yEguEQehQSqzZ1Yk7IOl/eJyf9qGOtulTGHdvUHt082HUhGKQ+acmviRmLWUhkGjycCR
 /KKIdUVFaAkpRrmVxZsp3OuwOGM2pPEtR1tYvlnKFciJN+KHTv8ehaIsknu2CFy6WVkg
 ZVRQ==
X-Gm-Message-State: ACrzQf2RuKavGCn5VIcMh+hSS/jCIsOLGHjerK3lLQlZkYNI24nodTIe
 uOU3Hen5VnT59nLDQIZUtBE+rziusQeWnZoieQfhTW+OONchgvaFUVpqpKK2Gay9+vABgAvdzMs
 TB60OiQoUGOLWPoc=
X-Received: by 2002:a05:620a:440e:b0:6f6:2a11:c497 with SMTP id
 v14-20020a05620a440e00b006f62a11c497mr8137552qkp.213.1667213385524; 
 Mon, 31 Oct 2022 03:49:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM62+JoPE08D1B0U8SxfgpA/CQsB5trsw8+YBhYb+nm7RSqo0fdTj9HavrfZVl47km2KCHC5AQ==
X-Received: by 2002:a05:620a:440e:b0:6f6:2a11:c497 with SMTP id
 v14-20020a05620a440e00b006f62a11c497mr8137543qkp.213.1667213385323; 
 Mon, 31 Oct 2022 03:49:45 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05620a0e0600b006aedb35d8a1sm4384851qkm.74.2022.10.31.03.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 03:49:44 -0700 (PDT)
Date: Mon, 31 Oct 2022 11:49:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] bios-tables-test: do not ignore allowed diff list
Message-ID: <20221031114942.36e1dc83@fedora>
In-Reply-To: <20221027151135.496368-1-mst@redhat.com>
References: <20221027151135.496368-1-mst@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Thu, 27 Oct 2022 11:11:48 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> we had such a beautiful structure for updating
> expected files, designed to keep bisect working.
> It turns out that we ignored the result of
> the allow list checks unless all tables matched
> anyway.
> 
> Sigh.

strange,
it seems to be working fine (I mean white-listing) here

> 
> Let's at least make it work going forward.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index e6096e7f73..a72f6ca326 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -458,7 +458,7 @@ static void test_acpi_asl(test_data *data)
>                  "for instructions on how to update expected files.\n",
>                  exp_sdt->aml, sdt->aml_file, exp_sdt->aml_file);
>  
> -        all_tables_match = all_tables_match &&
> +        all_tables_match = all_tables_match ||
>              test_acpi_find_diff_allowed(exp_sdt);
>  
>          /*


