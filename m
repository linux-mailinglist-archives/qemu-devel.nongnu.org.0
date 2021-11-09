Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B803844AF40
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:13:40 +0100 (CET)
Received: from localhost ([::1]:46648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkRsZ-0007Lf-TU
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkRrC-0006RN-4S
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:12:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkRr9-00086r-2B
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:12:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636467130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZNeGeKg+Id5vZpFlAvfttZqWE3rCq9x0C3pjuuZKHDw=;
 b=g9nHx5f6jQsfivjXFuXMuxhtUi3uaAv7/b2Q5sw18ISj/tIBUAHIJ+KmAbvKmrZ5Xsa2j2
 AO91sVWw7Jx5rBV6vnsqyg8X0IxihO+L2FfodO0rlWn1xkRJwXSOMlkBOUz/BsgoKByOdF
 I1rQliq1f/5d6i/Gau1iO/FzrPZBmtU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-iJ5nDK5GOfS2OspS8AB4sA-1; Tue, 09 Nov 2021 09:12:09 -0500
X-MC-Unique: iJ5nDK5GOfS2OspS8AB4sA-1
Received: by mail-ed1-f70.google.com with SMTP id
 h18-20020a056402281200b003e2e9ea00edso13475406ede.16
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 06:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZNeGeKg+Id5vZpFlAvfttZqWE3rCq9x0C3pjuuZKHDw=;
 b=UAlZqjinJXbUs5wOFd4+pYRmSBh8u0BVGOQbn9R+JWpVBa/gtvKUmHHx1MILf6wjmI
 C6TBfW4HmRb8mws44UK9VFviUjBCzpM79aHQ5qy5APmT2FYccwCMkRLu6PzJisGPMTlM
 /aug0VVsQKp6DcFr5nZYdDp5EuXOtffn/JwprFo5ZhTAPQaEQzdxaPledbzySuJSOCWx
 B9XbS0IUPw5XH4x3mEXKv2qe/kaiiV9vkXOY4xqPjLk0I7WgJVpnsCs6yr067ifWydV7
 dfiNzLezsqm5gBZk2QN0VOtsh/Czl5mNStZPX2Ib6jYT2Rp4KiWOM6Ao5jvkUga28RtA
 SlOQ==
X-Gm-Message-State: AOAM532U+PKqF77M+sdNipA4mMBjWzhxAVFuuMkAM9lom0UU+bEqwF4n
 ximSxEXBLyCat+6Npad6Wz7Y80H/QyDkhXlprZJEE489yI+Md33nhxc6nA3i31NGRJ+dMNT9pZJ
 QCDQVNmUSew9jy80=
X-Received: by 2002:a17:906:168e:: with SMTP id
 s14mr9979739ejd.340.1636467125983; 
 Tue, 09 Nov 2021 06:12:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwK6EAwHxTFSKdf7SYVv2htp3rglnb7JW3oFYqudu5qAIRLXknA5s21XG3ODAULHNFh9RMgSA==
X-Received: by 2002:a17:906:168e:: with SMTP id
 s14mr9979692ejd.340.1636467125603; 
 Tue, 09 Nov 2021 06:12:05 -0800 (PST)
Received: from redhat.com ([2.55.133.41])
 by smtp.gmail.com with ESMTPSA id cw5sm3396304ejc.74.2021.11.09.06.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 06:12:03 -0800 (PST)
Date: Tue, 9 Nov 2021 09:11:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] tests: acpi: prepare for updated TPM related tables
Message-ID: <20211109090952-mutt-send-email-mst@kernel.org>
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
 <20211109140152.3310657-2-stefanb@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211109140152.3310657-2-stefanb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 09:01:50AM -0500, Stefan Berger wrote:
> Replace existing TPM related tables, that are about to change, with
> empty files.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Why do it though?
I don't think it's a good idea - will make it harder
to see what the changes are.

> ---
>  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8894 -> 0 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8894 -> 0 bytes
>  tests/data/acpi/q35/TCPA.tis.tpm12          | Bin 50 -> 0 bytes
>  tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 76 -> 0 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |  11 +++++++++++
>  5 files changed, 11 insertions(+)
> 
> diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
> index c96b5277a14ae98174408d690d6e0246bd932623..e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 100644
> GIT binary patch
> literal 0
> HcmV?d00001
> 
> literal 8894
> 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
> E11ZdDc>n+a
> 
> diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
> index c92d4d29c79352a60974ea9f665d0b9a410a4bac..e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 100644
> GIT binary patch
> literal 0
> HcmV?d00001
> 
> literal 8894
> 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
> H_Sydd;%I4k
> 
> diff --git a/tests/data/acpi/q35/TCPA.tis.tpm12 b/tests/data/acpi/q35/TCPA.tis.tpm12
> index a56961b413e7715b3d60f9836d1c8f2f4c7347cb..e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 100644
> GIT binary patch
> literal 0
> HcmV?d00001
> 
> literal 50
> qcmWG>4sbMLU|?V}a`Jcf2v%^42yj*a0!E-1hz+7a07U<12eAOxRtEt9
> 
> diff --git a/tests/data/acpi/q35/TPM2.tis.tpm2 b/tests/data/acpi/q35/TPM2.tis.tpm2
> index fe0f05987be40f1c1742ae189df7821adc522fc0..e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 100644
> GIT binary patch
> literal 0
> HcmV?d00001
> 
> literal 76
> wcmWFu@HO&bU|?Vob@F%i2v%^42yj*a0!E-1hz+8V0UI(0%m%6W&kkY&0CHRh0RR91
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..9743422eee 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,12 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/APIC.tis.tpm2",
> +"tests/data/acpi/q35/DSDT.tis.tpm12",
> +"tests/data/acpi/q35/DSDT.tis.tpm2",
> +"tests/data/acpi/q35/FACP.tis.tpm2",
> +"tests/data/acpi/q35/FACS.tis.tpm2",
> +"tests/data/acpi/q35/HPET.tis.tpm2",
> +"tests/data/acpi/q35/MCFG.tis.tpm2",
> +"tests/data/acpi/q35/TCPA.tis.dsl",
> +"tests/data/acpi/q35/TCPA.tis.tpm12",
> +"tests/data/acpi/q35/TPM2.tis.tpm2",
> +"tests/data/acpi/q35/WAET.tis.tpm2",
> -- 
> 2.31.1


