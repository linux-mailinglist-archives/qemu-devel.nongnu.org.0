Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4374363B8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 16:03:19 +0200 (CEST)
Received: from localhost ([::1]:45536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdYf7-0001Ja-Nr
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 10:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYd1-0008GH-F1
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYcq-0008FA-9q
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634824854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdaqRsTxIcorfz6kht5/IWl3Xn2FlVJupR/VWOEiuns=;
 b=Z3/N0wQibaHq9/of/+pskcmtp+GycVefyHgpwbLW/2fkHewhqsmJzHaR35KT9E1pf5IORG
 8sqvu2HFAV3Nd29g6YPOdVPlDGyCIy37/wMZdqNtt2MDM4WjBJEhbVj3tHBsjxsb7eOxJP
 xhgfuv1AWMfgb5tD9yLB8HDVcXwzt4U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-vQfTgKxUOayPZyjqG-PsVQ-1; Thu, 21 Oct 2021 10:00:52 -0400
X-MC-Unique: vQfTgKxUOayPZyjqG-PsVQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so402794edl.17
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 07:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VdaqRsTxIcorfz6kht5/IWl3Xn2FlVJupR/VWOEiuns=;
 b=xJBphW+PeynycHJyFlgNcSXnkLDdBZIviRxGo2VTDVq0nt90sfAleBuZ71N1riLIkx
 Sk0zfeFWNoRdQJCvUAxF0QYHl7SflWJ23Y1j61cke7djsxwAI7fk+2pCRcjmjQxtRXz5
 oNRq/WsKGodJ2eQOzmIcC4X14T+utB6Mvf/qj7M3whZP51Sp03iCd5EL+syV5Tq/GTUQ
 JHen94HIAEaRMmLBaKyvFk3+ynWPJQzkuI9yhdzj1HuPaI0fZdaXdLYTxSZqN8E/KCyg
 061qsQ+mIvd0iApXaWDlZgUBdQsCUUc9UnuC3nlK3VbiYMrMSQSLQ7M9Aoqxpu6/sziU
 SaPA==
X-Gm-Message-State: AOAM530zCpDNmoQb7ptkIXufZvq49vb7jNfUMIw2kRjLlKeZzdJ5K4bl
 7waAlWJJzxoZVsmEjgwsrAJM3hZtrHbeIm6cST36Chji7J+MWDh1CS6CzMH4AZwAkH0VhJkd3VA
 d1tiuNlMuOIRJBvQ=
X-Received: by 2002:a17:906:1706:: with SMTP id
 c6mr7755604eje.343.1634824851677; 
 Thu, 21 Oct 2021 07:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNpy21byugJMoKP6xxsxzETfPF3ggoMEY0bvTA6Rgw8DarpXo2nnBA3qnWxuOVdOHb9Y0Xqg==
X-Received: by 2002:a17:906:1706:: with SMTP id
 c6mr7755538eje.343.1634824851072; 
 Thu, 21 Oct 2021 07:00:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j15sm2946407edl.34.2021.10.21.07.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 07:00:50 -0700 (PDT)
Date: Thu, 21 Oct 2021 16:00:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 09/12] tests/acpi: allow updates of VIOT expected
 data files
Message-ID: <20211021160049.4f7659c4@redhat.com>
In-Reply-To: <20211020172745.620101-10-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-10-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Oct 2021 18:27:43 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Create empty data files and allow updates for the upcoming VIOT tests.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  tests/data/acpi/q35/DSDT.viot               | 0
>  tests/data/acpi/q35/VIOT.viot               | 0
>  tests/data/acpi/virt/VIOT                   | 0
>  4 files changed, 3 insertions(+)
>  create mode 100644 tests/data/acpi/q35/DSDT.viot
>  create mode 100644 tests/data/acpi/q35/VIOT.viot
>  create mode 100644 tests/data/acpi/virt/VIOT
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..29b5b1eabc 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/VIOT",
> +"tests/data/acpi/q35/DSDT.viot",
> +"tests/data/acpi/q35/VIOT.viot",
> diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
> new file mode 100644
> index 0000000000..e69de29bb2

Acked-by: Igor Mammedov <imammedo@redhat.com>


