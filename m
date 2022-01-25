Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E949B99E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:06:41 +0100 (CET)
Received: from localhost ([::1]:43576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCPHE-0003MZ-2V
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:06:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCPED-0001rI-BV
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:03:33 -0500
Received: from [2a00:1450:4864:20::32d] (port=34408
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCPEB-0003e2-GW
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:03:32 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so968970wmb.1
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pHqmzBCmLUqqK5yo/LysYPjTU/stvam03/Fw8w0sa6g=;
 b=ADmrS7zWiaWsCjA5EjIiGyW/FJXYv40umPayPqEMfEuvFR4OLsfqO9yIPE+bsK61OL
 Hr4ZeteJM3B5hgBU6DPA3sc0A8YfGIXdI6P/Rwcm13MkyDwoZBPHcrExV9DkYv1ReuRI
 0Ia9ky/kvL/R3D93N6QuLMD9D80SEMNdckADOMvA5E3xHS3fJIydf+Bttd46w6vTBW67
 Sm6YCgVO0ga5KaWiNp9nqF94oHIzoncHdVfrv0Li7yJ82vWCegspxu5Dv/UsMrFkINQL
 fnvxm/Seos5WIXK65KBNpC6GjhHNVMdmawmOhFjsUtUH/FMCd4VOlZgzS3eucjEYY2A7
 iIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pHqmzBCmLUqqK5yo/LysYPjTU/stvam03/Fw8w0sa6g=;
 b=7MIqC35EzfZKnRCJDFRC2oW9sB/cY/w9BcmL55aAnx2WI2+9zTQ7K+yIf1WocnLIPY
 JdMw6sv/mgkmoXSqVcD1qEazUSilCUhNMotWfQITFF9PKqXnv2Jmh6jhlKR8i2PbaOjS
 4fBeUHfcya0idSAytWgApCSUQALJyuSj3x5FhbOETMRjHOPWcTIp/vlwYmPlMnEgUdPR
 a0oVc1pE/W6wDdf0wKh2wvqoQC6CWcXwUU8sEDpGyZ9JOFpTMTB2A+gwapwp0anxGeA6
 uRO7/KCsbQFwlFrkq0h2e70TZlzkKrGmxML5tB54p9D9IcrypBBuwChlFKSM7vFxqtpV
 o7Jw==
X-Gm-Message-State: AOAM531FA7CAZPaUjsYGKBnY27n7vEOh5V0lOXErJ4FC8XaE/O0A/s+E
 Sw24aLaqEJPO6DaIRpqJjjx50A==
X-Google-Smtp-Source: ABdhPJyB9P/tzuV3XlJ5guavNUkTJZE7K553teX9o4saPKFW4mxqHsBH86a7a3axaIr9jRup6xd7rA==
X-Received: by 2002:a7b:c7cf:: with SMTP id z15mr3756471wmk.105.1643130208861; 
 Tue, 25 Jan 2022 09:03:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 10sm854184wmc.44.2022.01.25.09.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 09:03:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 77AAD1FFB7;
 Tue, 25 Jan 2022 17:03:26 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-30-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 29/42] hw/cxl/host: Add support for CXL Fixed Memory
 Windows.
Date: Tue, 25 Jan 2022 17:02:32 +0000
In-reply-to: <20220124171705.10432-30-Jonathan.Cameron@huawei.com>
Message-ID: <87sftbd9y9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
> The concept of these is introduced in [1] in terms of the
> description the CEDT ACPI table. The principal is more general.
> Unlike once traffic hits the CXL root bridges, the host system
> memory address routing is implementation defined and effectively
> static once observable by standard / generic system software.
> Each CXL Fixed Memory Windows (CFMW) is a region of PA space
> which has fixed system dependent routing configured so that
> accesses can be routed to the CXL devices below a set of target
> root bridges. The accesses may be interleaved across multiple
> root bridges.

This breaks the linux-user builds...
> diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> index 0eca715d10..27dff3868b 100644
> --- a/hw/cxl/meson.build
> +++ b/hw/cxl/meson.build
> @@ -1,5 +1,9 @@
> -softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
> -  'cxl-component-utils.c',
> -  'cxl-device-utils.c',
> -  'cxl-mailbox-utils.c',
> +specific_ss.add(when: 'CONFIG_CXL', if_true: files(
> +      'cxl-component-utils.c',
> +      'cxl-device-utils.c',
> +      'cxl-mailbox-utils.c',
> +      'cxl-host.c',
> +))
> +specific_ss.add(when: 'CONFIG_CXL', if_false: files(
> +      'cxl-host-stubs.c',
>  ))

I think you want this:

  softmmu_ss.add(when: 'CONFIG_CXL',
                 if_true: files(
                   'cxl-component-utils.c',
                   'cxl-device-utils.c',
                   'cxl-mailbox-utils.c',
                   'cxl-host.c'),
                 if_false: files(
                   'cxl-host-stubs.c',
                 ))

  # This is required as well:
  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('cxl-host-stubs.c'))


--=20
Alex Benn=C3=A9e

