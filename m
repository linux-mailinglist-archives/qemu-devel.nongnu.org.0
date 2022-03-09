Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B04D2E37
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:37:42 +0100 (CET)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRudR-0003x4-85
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:37:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRuaf-00017q-TN
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:34:49 -0500
Received: from [2a00:1450:4864:20::62a] (port=44911
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRuae-0001OE-3w
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:34:49 -0500
Received: by mail-ej1-x62a.google.com with SMTP id qt6so4233856ejb.11
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=e1mCpgZQKVR3X+zPDOzkweeQg6CYkxvTj8dT3AbCpA8=;
 b=CTDwEhYVwWpl8JwFa5vALzyYrMjMHm+KRXE5HGjTLdionReSN/NKbw0MtcszJbwQuj
 1lNMSuhHCgNuzWLMdFq79fZYvjVaeZK7hBKlCaGjI1PDTtd7bn/O/s9gtxVfudma7sSX
 cm341QOA7I/CW87135kIU28SZhzw6yyX7gXWIZaiD06Ubg21p8/VzzT7rLVvI1tWcwMV
 tSOsV1jOpv2MgzzA3rjxVShCwUds927MVbOahisg/qn2tGl2vL4X20uGMsx+Oz6YBfw2
 bhYQA+QioGMfXnzVEflM0Lfp65n/RvogZaJ2Lw4VEf/1ZXG4CTVGxL9CMF09IXlPgrMH
 d41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=e1mCpgZQKVR3X+zPDOzkweeQg6CYkxvTj8dT3AbCpA8=;
 b=vmODFgMr+JT+IbXTuxXxm2k7RZUh1xjSBIDupJkZ2qECkbqiQeGeqxIwXTl9u9LgIG
 N/1NYSE/LQO9e9WqHiE/CzoDLZTC0NvwusY4QdL5abc2OrM+RBqtKIdP6LQPAIWVaN83
 61qHYgqjLiW6jdszMjN2m1219wwo26kjx/r9AJemv4xPRG5E6WsR/oRPLsCuDGo/NGys
 dGhFWMDwWmWu7aCxG6EsJ9/pmmb65ravuvLAqwy3u/p8KxmbgGHHwTi4/KmEIGQE7LQF
 +iHsfqx4gHvz3c+EhSeFjkZC4cDSxWUjBsd6ovrMyLpT/1ksUmW7vYKx656arH8YNrI8
 GT9w==
X-Gm-Message-State: AOAM530h9gmG/efu89eU0VpjujE5lf283h7TyYXvd61ostC/YwDl7s4Y
 V+yYKphEr3Rsv1kRz7qJhys86w==
X-Google-Smtp-Source: ABdhPJyo3Vdv5OrjCA4eURlNsK/eR6zrgUauSCSuAGq2ROif8jO8DRiemKBqTtyCXuP5XzKXARcZTA==
X-Received: by 2002:a17:906:4987:b0:6c9:e16a:b5bf with SMTP id
 p7-20020a170906498700b006c9e16ab5bfmr16317520eju.247.1646825686611; 
 Wed, 09 Mar 2022 03:34:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a50e08f000000b004134a121ed2sm713672edl.82.2022.03.09.03.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 03:34:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D19941FFB7;
 Wed,  9 Mar 2022 11:34:44 +0000 (GMT)
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-2-kraxel@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 01/11] tests/acpi: allow virt memory hotplug changes
Date: Wed, 09 Mar 2022 11:34:39 +0000
In-reply-to: <20220308145521.3106395-2-kraxel@redhat.com>
Message-ID: <87zglz5pgr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Gerd Hoffmann <kraxel@redhat.com> writes:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index dfb8523c8bf4..e569098abddc 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/SSDT.memhp",

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

