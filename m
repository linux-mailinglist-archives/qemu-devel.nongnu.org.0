Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15226FBF90
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 08:51:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHCC-00019Y-5w; Tue, 09 May 2023 02:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwHC1-000195-7V
 for qemu-devel@nongnu.org; Tue, 09 May 2023 02:51:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwHBz-0003sE-QJ
 for qemu-devel@nongnu.org; Tue, 09 May 2023 02:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683615083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRUycvyeJsgfCR4Up/kBe/GSmpa2t96Jnpur212oKHA=;
 b=QyN731C2xC983mwNBsZ1yzbsSba7T3aswD+cNPW1WRKAD0/5ZZYm/OMH/2lNzapn1OfqNT
 dV7sChQnwJJYKXC+JlLCTsX7gSvM5fjkQWOZelXaFe9GFVGEK3erc98jZj+vOimi2bbhlX
 CjK0X7+FlXsXZ6zg+fCFeQRY0RCBorw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-StrCVnnGOMajPC2ST90sKg-1; Tue, 09 May 2023 02:51:21 -0400
X-MC-Unique: StrCVnnGOMajPC2ST90sKg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-307814dd87eso1512425f8f.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 23:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683615080; x=1686207080;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pRUycvyeJsgfCR4Up/kBe/GSmpa2t96Jnpur212oKHA=;
 b=hxxRNn/C027Dq0yWhTtwNczLUV+OHHtZlZmPXEp42oQ+VYsQm9lPserrMZrfbcgxUI
 bb1ix6dEFxoRgKpWXADlKk0ETzj4iokyPP7c7CIR4pEhnb5TFUjELPFx8qyi6dxnZ4dw
 9HoXsgFHK0hGVb8f+9hnJL22Gd6ogdmQwn+vVn3yzEjw2G8EQ65YANQAZTa/TdIobFma
 IYi40XzQZBhPK2PSNJ2UlkDJ3OiGbcJWJoqN1WMQ5KIttNQU+c0hp3xXfhuUdCtD+/pY
 RCPYMpeGgEbs+4mc3xK06H6CXWVJ+Hf9KWKDA94vSPIyAHe+7H6bykawt/zJ1XvaZKso
 TtHA==
X-Gm-Message-State: AC+VfDwN670ZMJhq4fy3fR0ifhnVl8cshQ9/NRsNqjcBaOWpqMYG/ruA
 nFIkTFI7ChppLljA6simZv1se98eFurl1inRm1dX8TOPrRQnUSA87kse4GXwwXo45P4NrnE2+UO
 hqmys2TV081RiqVQ=
X-Received: by 2002:a05:6000:10a:b0:2f9:482f:c13f with SMTP id
 o10-20020a056000010a00b002f9482fc13fmr8166296wrx.46.1683615080403; 
 Mon, 08 May 2023 23:51:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ebxITGFbtvM+ttG6PLisIrVpQOS6HF7dHKaCikvaUcycWewpD9+JDvBqaUoVYcAt+jYxPvA==
X-Received: by 2002:a05:6000:10a:b0:2f9:482f:c13f with SMTP id
 o10-20020a056000010a00b002f9482fc13fmr8166280wrx.46.1683615080144; 
 Mon, 08 May 2023 23:51:20 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de.
 [109.43.179.53]) by smtp.gmail.com with ESMTPSA id
 h14-20020a056000000e00b002ceacff44c7sm13322429wrx.83.2023.05.08.23.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 23:51:19 -0700 (PDT)
Message-ID: <09048894-0f80-cc17-c222-9371fd76b20d@redhat.com>
Date: Tue, 9 May 2023 08:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/3] tests/qtest: Don't run cdrom boot tests if no
 accelerator is present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230508181611.2621-1-farosas@suse.de>
 <20230508181611.2621-4-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230508181611.2621-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08/05/2023 20.16, Fabiano Rosas wrote:
> On a build configured with: --disable-tcg --enable-xen it is possible
> to produce a QEMU binary with no TCG nor KVM support. Skip the cdrom
> boot tests if that's the case.
> 
> Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/cdrom-test.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 26a2400181..31d3bacd8c 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -130,6 +130,11 @@ static void test_cdboot(gconstpointer data)
>   
>   static void add_x86_tests(void)
>   {
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available, skipping boot tests");
> +        return;
> +    }
> +
>       qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
>       qtest_add_data_func("cdrom/boot/virtio-scsi",
>                           "-device virtio-scsi -device scsi-cd,drive=cdr "
> @@ -176,6 +181,11 @@ static void add_x86_tests(void)
>   
>   static void add_s390x_tests(void)
>   {
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available, skipping boot tests");
> +        return;
> +    }
> +
>       qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
>       qtest_add_data_func("cdrom/boot/virtio-scsi",
>                           "-device virtio-scsi -device scsi-cd,drive=cdr "

Reviewed-by: Thomas Huth <thuth@redhat.com>


