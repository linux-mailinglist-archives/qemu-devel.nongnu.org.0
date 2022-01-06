Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54412486809
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 17:58:48 +0100 (CET)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5W6B-0002VR-5J
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 11:58:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n5W4O-00013h-UL
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 11:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n5W4N-0000OO-IU
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 11:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641488215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqnPVFnLk+gnTJd1vcwNfbJB1AXwZpPjrH1B5IOzxbo=;
 b=QuRmh0xtWSvY68TL7bNHidorNX/alTG7FXLCqbTpBr69gfsToZRNY+L1h5fhZ6gurTdG6P
 moL/Rmbhh70ZJ5p8v7xGRKrbr2XL8ZhCOvHSVLzzpVuvlb2RwUv/XAw411rW313TRey4ty
 r/p9WLRWQ6RncGa+4JbapX/6sMNk7qc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-KR1HpBFSOzyV1Pk6nWegUQ-1; Thu, 06 Jan 2022 11:56:53 -0500
X-MC-Unique: KR1HpBFSOzyV1Pk6nWegUQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 d7-20020aa7ce07000000b003f84e9b9c2fso2416277edv.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 08:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VqnPVFnLk+gnTJd1vcwNfbJB1AXwZpPjrH1B5IOzxbo=;
 b=t+FOgb1mEPVCfPGsVqmSdOazzVVEfo62YJSsGGz5Y0LRaXaO0rModuR7scyuhFIYMs
 pvO31HABz1ZlwTvLGybURzrezmyEcGISLdmyWBK6+vDPRQql8ZLlmnALaGs7vz7x0xBM
 JIblE7c6v+s/bNGVAR61mgyW2R0JbW3xfCBEys7vWZq4SSXUkLOY06eMHMr106I0Z9Ux
 BFAgdpZe6YLku8APvx8YnNrvJRW2sht/iUoF6GyQjtRhQTLgFBfqSXJ7uvnvtmHaeB8l
 cozv1lou3OFfHX0K1FDy9F/QzQL4LMS5iSsNrq1g4e6DjvJOyyccEXBsnvrJsAIBQJhw
 98jQ==
X-Gm-Message-State: AOAM531RpEGZirHuh+2vu8cb12IQ7jXL42bCwp20GUUr50TLkQ3uBH8q
 FJGUV3BbCyT6tFCI9npwaj4Tp91A/l8cvVc9bsVN39DUEn2v+Itr8QHIyeOb3iZXwqspDiCqJDm
 INSUJ/4UN07FDrrg=
X-Received: by 2002:a17:907:e86:: with SMTP id
 ho6mr47059783ejc.208.1641488212820; 
 Thu, 06 Jan 2022 08:56:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2onrcT6ZsrVd6F36IpqfPGYNK4W2YdttlYvdu/wjPLlR/Qs95cHECmJ10GchTsYELyinASw==
X-Received: by 2002:a17:907:e86:: with SMTP id
 ho6mr47059774ejc.208.1641488212650; 
 Thu, 06 Jan 2022 08:56:52 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id ga37sm618535ejc.65.2022.01.06.08.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 08:56:52 -0800 (PST)
Date: Thu, 6 Jan 2022 17:56:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v5 1/3] tests: acpi: prepare for updated TPM related tables
Message-ID: <20220106175651.6ce8b001@redhat.com>
In-Reply-To: <20220104175806.872996-2-stefanb@linux.ibm.com>
References: <20220104175806.872996-1-stefanb@linux.ibm.com>
 <20220104175806.872996-2-stefanb@linux.ibm.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  4 Jan 2022 12:58:04 -0500
Stefan Berger <stefanb@linux.ibm.com> wrote:

> Replace existing TPM related tables, that are about to change, with
> empty files.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Acked-by: Ani Sinha <ani@anisinha.ca>
> Message-id: 20211223022310.575496-2-stefanb@linux.ibm.com


Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..5d80e408d4 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT.tis.tpm12",
> +"tests/data/acpi/q35/DSDT.tis.tpm2",


