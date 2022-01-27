Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9149E458
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:14:43 +0100 (CET)
Received: from localhost ([::1]:35008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5Xu-00062o-3w
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:14:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5Qp-0007la-6y
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:07:23 -0500
Received: from [2a00:1450:4864:20::332] (port=38729
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5Qn-0001I1-P8
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:07:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so5993965wms.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Hq9qqlHo85AwjtjEsLobiqP4b9lWYCusPNp9zTso/Ws=;
 b=eoBR822Nsb2poVFXqKowR6F1C5eDs78PBZSRbieQjigDlhM9gwLHPEWhjv6KQm0DPR
 AGaZK4gSxDWl1YvmvrfQG+dVqvehYws+OSEuwkSDdBAjF8NS11nge8bT3GlnPC/N8aE3
 PGti3DnqVlIJKELjt+rrBKZRaW7yxk8m7neMPIdjrhEKyOIt8/O2sZ2ISfLY0//wzK6C
 yGnvGpVu7ocRuXcRFpIvHhpayWu+Ypbm/+XMzaXzvLtiBf19MS8FLi0VpM/oY4ovcpQh
 1Qa6CIy2e6sx0DxBEsOdzJSpycq/wtAQL/if0MwXlr37PbsOrE0LHWfHSUfWzXsi9DzD
 bKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Hq9qqlHo85AwjtjEsLobiqP4b9lWYCusPNp9zTso/Ws=;
 b=kz8k88TCd2j/by0zU/SmiXCId1X981C8CNJZfBssHIxeyAZjT/oA/rrFNgLSMuQFer
 zt5bXhAoLJK838gBU2IwE1IBizzyVVg+8mRbszLWxO8HxHT7Oln5ErAcGGwhR8HBPhzU
 R5CWAzLjaj+o24nHC4gM/9bg99WQl/mTxg8be4QH3AtvwlP6nBRm3/YNAHeBEGqzDfqt
 JMd3VvukZgHnKkwmW7c5VUmm7PjX83SSGKlR31CONfVyqGSUMkhDG24W+sQabxo+o+NS
 duggVYzAb73PirYLTI6ukGkIY8ou4U/MPg80PPIVTQJ1GfE6qwRITJAuXEvAgIHFf0/V
 mKAw==
X-Gm-Message-State: AOAM532+RzP0WwhJjsT5m9ksKMArXSMrmHRpB+pMwQHa0+ErCqbIcAm3
 ioJGzLGWKeeEBeuWXignmA7IXA==
X-Google-Smtp-Source: ABdhPJyIvnUBx0tR7GERCvb7MWQrhXLX9JaISw0O7WEtVh5HBjwFgxSjAPqNToRkLFozvY7VW/aG2w==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr3409329wms.192.1643292435560; 
 Thu, 27 Jan 2022 06:07:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm2356652wmm.32.2022.01.27.06.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:07:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E8A381FFB7;
 Thu, 27 Jan 2022 14:07:13 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-15-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 14/42] tests/acpi: allow DSDT.viot table changes.
Date: Thu, 27 Jan 2022 14:06:42 +0000
In-reply-to: <20220124171705.10432-15-Jonathan.Cameron@huawei.com>
Message-ID: <87a6fh9sry.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> The next patch unifies some of the PCI host bridge DSDT
> generation code and results in some minor changes to this file.

I'd just squash this in with the patch that makes the change...
otherwise you risk breaking bisectablility.

>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index dfb8523c8b..08a8095432 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT.viot",


--=20
Alex Benn=C3=A9e

