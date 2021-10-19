Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27B643335A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:17:23 +0200 (CEST)
Received: from localhost ([::1]:54304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmBO-0007QD-W1
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcm8p-0005BU-6r
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcm8m-0008K4-Og
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634638480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tIMDHvcvJc3w4onZve5dCwg26nMcuueLjmCCPzwrLjw=;
 b=feX7JZind0XQsfy+MbOlvDKwQO3Asak258bEdrj/hulVeaYgj/6pKx8YbRByR560tvseAg
 fchPtkyROqrhI+nRuQxwQLQ9i+46GnJEcdLB40aJBSXTph0I3Yjwv3w88SKgky8eEcMnRr
 duHww3YShACLmm6DKSxY9otIkHnBIO0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-e8FF82m1PXi3THesvofH9A-1; Tue, 19 Oct 2021 06:14:39 -0400
X-MC-Unique: e8FF82m1PXi3THesvofH9A-1
Received: by mail-wr1-f71.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so9915500wrc.21
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tIMDHvcvJc3w4onZve5dCwg26nMcuueLjmCCPzwrLjw=;
 b=mfY4SURpoSpDkhGYdo9VSgo2JklTC9neimMn9kqYogeyPvBz/lEahkDMseYf6OYdhn
 EhfjJ9VkYSzyz+rcfYKPJM9feZ55b8vY6R0SPkAYbFu/ZGdIAFblmIkuz76hGqRmgnuA
 +InZOo/KP92B6/VgZwMUSqpplhZFohWCr8w2N1u5vAfKyPb8hxlw/EFtDTjsl1svmP3N
 GvbYdUojJQDXJGJ4qcYfqdJBh99p3UA9wknzaqCum8fJDHW68mPGxqQ1XKr3mzY6HXDb
 12RO2Zn9QWpv/RcdAEb+4vU3W19Z1sTE2Pbmkr1k1BTaRMObohPOMNZENUu/FVbAJC1g
 bUsQ==
X-Gm-Message-State: AOAM531FpMuJ7cYcdh/bDBlQ5hyn66/xFZCO/3RsgXTR0Ay34ZM3U7GR
 ym+gjPVU/F+7vLmZcXVqPDcuM98yfpy/gA/8iyMUa5bV/OPNGFTof/e0z5Yv+sYhJ69I1PBOiSD
 XB09Ky0fj0luTZPGZIBSIqo63IRWy8nlyn31p12EjQtIRzvu3UsP/ZgIwBkJb
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr5135477wmq.94.1634638477761; 
 Tue, 19 Oct 2021 03:14:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlkGHZ/munRjeDERGyF3vGWkFPZtA0Jyf5b8BPQ4mVdw4TP9LxtsyEJ5nJbnQIU/ftO4Z7Hg==
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr5135447wmq.94.1634638477521; 
 Tue, 19 Oct 2021 03:14:37 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id l6sm1837504wmq.17.2021.10.19.03.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 03:14:37 -0700 (PDT)
Date: Tue, 19 Oct 2021 06:14:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] bios-tables-test: don't disassemble empty files
Message-ID: <20211019061424-mutt-send-email-mst@kernel.org>
References: <20211019101245.574716-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019101245.574716-1-mst@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 06:12:52AM -0400, Michael S. Tsirkin wrote:
> A recommended way to populate new tables is to have an
> empty expected file. In this case, attempts to disassemble
> will fail but it is useful to disassemble the actual files.
> Detect and skip decompile step in this case.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

sorry fat fingers. sent too soon.

> ---
>  tests/qtest/bios-tables-test.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index a5546180b7..ee0ddb088e 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -271,19 +271,28 @@ static void dump_aml_files(test_data *data, bool rebuild)
>      }
>  }
>  
> +static bool create_tmp_asl(AcpiSdtTable *sdt)
> +{
> +    GError *error = NULL;
> +    gint fd;
> +
> +    fd = g_file_open_tmp("asl-XXXXXX.dsl", &sdt->asl_file, &error);
> +    g_assert_no_error(error);
> +    close(fd);
> +
> +    return false;
> +}
> +
>  static bool load_asl(GArray *sdts, AcpiSdtTable *sdt)
>  {
>      AcpiSdtTable *temp;
>      GError *error = NULL;
>      GString *command_line = g_string_new(iasl);
> -    gint fd;
>      gchar *out, *out_err;
>      gboolean ret;
>      int i;
>  
> -    fd = g_file_open_tmp("asl-XXXXXX.dsl", &sdt->asl_file, &error);
> -    g_assert_no_error(error);
> -    close(fd);
> +    create_tmp_asl(sdt);
>  
>      /* build command line */
>      g_string_append_printf(command_line, " -p %s ", sdt->asl_file);
> @@ -463,11 +472,20 @@ static void test_acpi_asl(test_data *data)
>          err = load_asl(data->tables, sdt);
>          asl = normalize_asl(sdt->asl);
>  
> -        exp_err = load_asl(exp_data.tables, exp_sdt);
> -        exp_asl = normalize_asl(exp_sdt->asl);
> +        /*
> +         * If expected file is empty - it's likely that it was a stub just
> +         * created for step 1 above: we do want to decompile the actual one.
> +         */
> +        if (exp_sdt->aml_len) {
> +            exp_err = load_asl(exp_data.tables, exp_sdt);
> +            exp_asl = normalize_asl(exp_sdt->asl);
> +        } else {
> +            exp_err = create_tmp_asl(exp_sdt);
> +            GString *asl = g_string_new("");
> +        }
>  
>          /* TODO: check for warnings */
> -        g_assert(!err || exp_err);
> +        g_assert(!err || exp_err || !exp_sdt->aml_len);
>  
>          if (g_strcmp0(asl->str, exp_asl->str)) {
>              sdt->tmp_files_retain = true;
> -- 
> MST


