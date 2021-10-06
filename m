Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9274239A5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:21:54 +0200 (CEST)
Received: from localhost ([::1]:47042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY2BT-0006PE-5q
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY22N-0005jP-8Q
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY22G-00079g-2E
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633507939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anBl3nhtxaPKnNe0Ikp7Ut89cAoGL0l90WohRi4CYYk=;
 b=heBoXlqvWCX0F6SyoOySuwfcL+kId/zuEa8ql4B5sHPDVnwiH7py6kDR3lDWmo7nMz9Ebw
 EcUCGFF7LzieQMMFrAPuNJ0BRJUjsH9QqVmw0mUOyQIsM8Yb2ZbtcfHGM4uvqBODlT2IPo
 bLgACFOskozuDkRiymBWIVlgbFVAO24=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-n8jZ2WkvOJaIG4kJFrxJiQ-1; Wed, 06 Oct 2021 04:12:18 -0400
X-MC-Unique: n8jZ2WkvOJaIG4kJFrxJiQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 k2-20020adff5c2000000b00160b12639a5so1363287wrp.3
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=anBl3nhtxaPKnNe0Ikp7Ut89cAoGL0l90WohRi4CYYk=;
 b=73XtD3uVCQAwG+bGOCnZGJ3mrUn36QBPdEDQQMV5Xvlx0dNh4h42UbhPh3eaeGrxJF
 bcat6gGiYQL4Z6ZDrmjA9vor/BfvCF2GPcptn7dYcqRwuEh9d9qfGqcU6Cda8GvRnXGQ
 GkcQXO8Flko6P35z6zVz638jtfl9jExI/XMOSPIMq0Sas+L6DR65d7RLFZIo/pu3iWsz
 NKEUfWC8kPZ0LbuzpLHPkHXn6OwudrU1/H6+NuYnq81mfnOyuZTk19cue36MmCdYgh7t
 GJZpDXWFAvQiHYg6v+6j6VFR1LUjkG98Uv6uuZRj5L79pSQ6yBH3j45OyrLzp8q7RFdc
 rZaQ==
X-Gm-Message-State: AOAM5322Hq2XeTC1ycJuHJGpU1pBXQyzHqfTiMzGoncCF7B35rkh4vOS
 pqeBeKsq17TknQbl/vHDgEsSsigH7Kqetw3TFO+6woyUVy+F3jS8N5eydm55aBsAlGJ5U8uEjVc
 K3+2mCtdKoJVSjik=
X-Received: by 2002:adf:bd91:: with SMTP id l17mr14965991wrh.261.1633507937332; 
 Wed, 06 Oct 2021 01:12:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVBxxf817SExbwWcvSQjCs2Fi0lLqP0uoIrvH63/kBSOJ0cn8F7n4hQVICZo5XAD7XFUVnFA==
X-Received: by 2002:adf:bd91:: with SMTP id l17mr14965960wrh.261.1633507937114; 
 Wed, 06 Oct 2021 01:12:17 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id k128sm4701645wme.41.2021.10.06.01.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:12:16 -0700 (PDT)
Date: Wed, 6 Oct 2021 10:12:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 08/11] tests/acpi: allow updates of VIOT expected
 data files
Message-ID: <20211006101215.24414401@redhat.com>
In-Reply-To: <20211001173358.863017-9-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-9-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  1 Oct 2021 18:33:56 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Create empty data files and allow updates for the upcoming VIOT tests.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  tests/data/acpi/q35/DSDT.viot               | 0

does default tests/data/acpi/q35/DSDT differs from
DSDT.viot?

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


