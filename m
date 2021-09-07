Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA962402711
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:22:27 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYFG-0003Qm-Uc
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNYDD-0002Qy-3x
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:20:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNYDB-0000yr-M8
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631010015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRNInx7vUzsisgZPFyAYXt3Ei5qwj9SPX3Hi5nzLxWY=;
 b=YtoXJoJSwEMSDZIAYIAmpZE59F7HCRDeaVEvDn1GEmDAO1O1JRJC2/jJl5CMePFjlK3Sfe
 OvWpx0Qz4suHTKi5xQ26vwpIUWqXfJtqYMV1kG1yJa8Mf3IzRzB1h6lvtJfB4UuwENmCoP
 yxwY2uGbno4j47DOh4R4jeMYzYDqBCA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-lPNeJCUJNHC8Bwe0qXXseA-1; Tue, 07 Sep 2021 06:20:15 -0400
X-MC-Unique: lPNeJCUJNHC8Bwe0qXXseA-1
Received: by mail-ed1-f71.google.com with SMTP id
 b15-20020a05640202cf00b003cd5efcd633so5047077edx.9
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 03:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NRNInx7vUzsisgZPFyAYXt3Ei5qwj9SPX3Hi5nzLxWY=;
 b=Ejv1F2zpFljNkzMRyLJTBdHZyu5qRPQ8MXAPyRxBxXI72SnbESOO4HEcDChaM842x+
 tuOJ2Bg+8/SmOWtXXy4I3j+ZqXAwQ2u5kcfa/A56i9LQc20WBD/vzQNyT86X4bq9jC4k
 JNStqqXmUKg+cLMcooRR0ruG8K8HYHkymd/RnU4RpUJw7mRWi+nIYsaNy5gXkflo2Goa
 GiI34XVW+8k8W0Kz6/v72GVL4ilDtPJ9u/GN6oI0n1YtMbxAMlm7w+dUkz3baA2JGU05
 2jDyv0rljP8P6YqpE7bY5qx4MdFVSeQC97iqEm1okqcS2GVMvvVHQB8xdsDOA03pIDSJ
 VrkA==
X-Gm-Message-State: AOAM531qtyO15hRzUcbIlLP8h8i/AB5vltPDF9QJ2diO+yPh3pualUJh
 Qc+qDxc/tzhC23f4om+1YVjOMScr4z+F5xckyCcFB32Vu0ES+fCcW0GXCho/SpXGgnr1YjEX0vh
 HrHqpKzrwoPRxX4k=
X-Received: by 2002:a17:906:1d41:: with SMTP id
 o1mr18065471ejh.232.1631010013852; 
 Tue, 07 Sep 2021 03:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTxclFqyfomPf6bROJSKIA4XlltHfiYFdWi4mgJOIfyobL/la5loo9PHKycdCVTKiPE9EvGw==
X-Received: by 2002:a17:906:1d41:: with SMTP id
 o1mr18065439ejh.232.1631010013557; 
 Tue, 07 Sep 2021 03:20:13 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id bx11sm5282992ejb.107.2021.09.07.03.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:20:13 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:20:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 1/3] tests/acpi: Add void table for virt/DBG2
 bios-tables-test
Message-ID: <20210907122011.368a4e1e@redhat.com>
In-Reply-To: <20210906123139.93593-2-eric.auger@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
 <20210906123139.93593-2-eric.auger@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  6 Sep 2021 14:31:37 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add placeholders for DBG2 reference table for
> virt tests and ignore this later for the time being.

s/ignore.*/ignore till reference blob is added /

> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/virt/DBG2                   | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  2 files changed, 1 insertion(+)
>  create mode 100644 tests/data/acpi/virt/DBG2
> 
> diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
> new file mode 100644
> index 00000000000..e69de29bb2d
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8bf..1910d154c27 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/DBG2",


