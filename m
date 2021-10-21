Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F930435D89
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 11:06:14 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdU1c-0000zo-Sf
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 05:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTy9-0007Cz-H7
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTy7-00061d-HH
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634806955;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7FhM9xguN3GyO5JfwlChbSE9NYxzYwDFNmKMn07tqo=;
 b=ImTtB1xAYGtWzUKtZaa5m+E2gQZnnAhBXFxhgzHR2WhC2Qd9BrFn1+hiaVIolikeoRY4sZ
 dn5sAHx8EiLKCTfS503DXRuDPPu72KXMZBA3jVrGXLYwtd/63wW+UBm25giKLJFxTnoyFX
 FET6kV7UHzWzmuwN31guzXiYxSUfjks=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-MsBmXD0RMkmJ3tmW3lha6g-1; Thu, 21 Oct 2021 05:02:33 -0400
X-MC-Unique: MsBmXD0RMkmJ3tmW3lha6g-1
Received: by mail-wr1-f71.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso11171149wrg.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 02:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=T7FhM9xguN3GyO5JfwlChbSE9NYxzYwDFNmKMn07tqo=;
 b=sw9/A5vBcqgUZ6ueCFA1VPTMH5HT0V6bDYMoj2BftsN3+1/9937Zt62dT+qcjGD1H/
 WhU/RZvPrdAS7R3M0M/xm9WBzNxNOSSmYVsylyXeK1r7zORwivc46W4RAZTpeZthsXAL
 7OIzTKR1wvRaE+nKU9kt+W57KuaBK6Bhd+0aF4DgKFSUOeZrG0JhEkQh5m5jYzuRXL5G
 s5frpqZdAqjn0zeUvCTAieEll3KUh4Zr2or+JsMxuyUB8m7lWBg2TUKAy/mCXmKQ5Bpg
 jKz04GaT8TCC2SlKSiH0iFKqfsoLwvLlKLRBstUU4Z6HmNL0Vz/HOyeLZtj3MhB6Mkn/
 j6/Q==
X-Gm-Message-State: AOAM530Q2jG1uL4dtbsc28USZAcFQrLwDGtseEWWPstSC2yn/FzJwzGF
 SYJZsS4T3a8Rb/lRT8rXru8esiugpDc87wa4uNnAT+e/DeXnIk94fGRrJbhmTi/wQo4pfNBtOPd
 rPjedPNRAuJfP0Y8=
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr5725447wrt.28.1634806952654;
 Thu, 21 Oct 2021 02:02:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz54m8kq+DchjzObP/Eu86WE306kkFBYluDb4R/Mb812wxx0DYhLaXGZPN0c91+Qu6p1YDLaw==
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr5725414wrt.28.1634806952433;
 Thu, 21 Oct 2021 02:02:32 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id n66sm4342696wmn.2.2021.10.21.02.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 02:02:31 -0700 (PDT)
Subject: Re: [PATCH v5 09/12] tests/acpi: allow updates of VIOT expected data
 files
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 imammedo@redhat.com, peter.maydell@linaro.org
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-10-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <33fc93b5-bd0a-4ef2-7b87-641b252c4e42@redhat.com>
Date: Thu, 21 Oct 2021 11:02:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211020172745.620101-10-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Reply-To: eric.auger@redhat.com
Cc: ehabkost@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/20/21 7:27 PM, Jean-Philippe Brucker wrote:
> Create empty data files and allow updates for the upcoming VIOT tests.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
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


