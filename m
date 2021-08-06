Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3233E2927
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:11:48 +0200 (CEST)
Received: from localhost ([::1]:36656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxlT-0007L0-Vn
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxk9-0005oC-RB
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxk6-0002N8-SR
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628248221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RtBNB8jMAZPkPUHqq2AZEZwQBib3996b4AOMsts9eM=;
 b=XOwG3VAc3hkKqBprs1swfZ0s2nAXbovhFFuMvkU6a5iQoD+CLStBTXl9Rc/nZjwGDdU9fE
 e2kRwbuMhhfGXpJB8z30Twno0nFROm7Wx5l06IhTENRNIXB5MzRFElyvNsvMcVQfib51kh
 t3MINOHqnISaaIcZOVDaAgkaWfTVAh0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-Al5QnWPBNbWNqYzwO4wgaw-1; Fri, 06 Aug 2021 07:10:20 -0400
X-MC-Unique: Al5QnWPBNbWNqYzwO4wgaw-1
Received: by mail-wm1-f69.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so1913422wmc.3
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 04:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9RtBNB8jMAZPkPUHqq2AZEZwQBib3996b4AOMsts9eM=;
 b=OsKOBni11Q7ZnKOsrEjrTphmJrJYcYL9pmCw7q8FQow4i3UMlFiimGQUqo94c04eEX
 njHReRNBa8G0xVqF9TP9wMIfgD03uaStOdZbkWbNQkDd9hbPI7iOAMMnbHegAA5MxGe5
 c30ADMqSu2Iw2pW6lVXt1AHvN0RNEijVxAKeGv/RkNsGcZGXZLXHhkstwpf1175RG2uq
 QvxtayqvbtNvAl3IELRroY2S4azaFUjuni++UyThDxh6iREGKUyspHFnVsmDf20qtYA6
 3cjSpOfWoK0Cg3vot1b+is9dC2h3XT++YE/2bE3MUkiKOGEqmn1+/6pxULeox4oNp8wJ
 KyRQ==
X-Gm-Message-State: AOAM5307plKC4F3kEaD+jokLlfEeMRhWi1QP09pMrTnvXV5i7bR/7PRo
 txPpkpqClsyId+O41ftfd73iGOfRkoFuqoUV2HMIIVKeqKIVS8UTlNB/W94sQma80GwuPqRlnKe
 j/LPqvIpBMyhwjbs=
X-Received: by 2002:a1c:32c1:: with SMTP id y184mr19032047wmy.70.1628248212484; 
 Fri, 06 Aug 2021 04:10:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbniy5Jx1noHhD6NsOGocTtzwY/ixNuEGEGcRqLbSggkvMp9tau9fYF67pVGiDHuhLWXGmng==
X-Received: by 2002:a1c:32c1:: with SMTP id y184mr19031856wmy.70.1628248210018; 
 Fri, 06 Aug 2021 04:10:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id x21sm11589520wmi.46.2021.08.06.04.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 04:10:09 -0700 (PDT)
Date: Fri, 6 Aug 2021 13:10:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v7 08/10] tests/data/acpi/virt: Add IORT files for ITS
Message-ID: <20210806131008.0aebc81a@redhat.com>
In-Reply-To: <20210805223002.144855-9-shashi.mallela@linaro.org>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-9-shashi.mallela@linaro.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, rad@semihalf.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 leif@nuviainc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 18:30:00 -0400
Shashi Mallela <shashi.mallela@linaro.org> wrote:

> Added expected IORT files applicable with latest GICv3
> ITS changes.Temporarily differences in these files are
> okay.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/virt/IORT                   | 0
>  tests/data/acpi/virt/IORT.memhp             | 0
>  tests/data/acpi/virt/IORT.numamem           | 0
>  tests/data/acpi/virt/IORT.pxb               | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
>  5 files changed, 4 insertions(+)
>  create mode 100644 tests/data/acpi/virt/IORT
>  create mode 100644 tests/data/acpi/virt/IORT.memhp
>  create mode 100644 tests/data/acpi/virt/IORT.numamem
>  create mode 100644 tests/data/acpi/virt/IORT.pxb
> 
> diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..2ef211df59 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,5 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/IORT",
> +"tests/data/acpi/virt/IORT.memhp",
> +"tests/data/acpi/virt/IORT.numamem",
> +"tests/data/acpi/virt/IORT.pxb",


