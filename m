Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A645D6F159E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:33:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLPv-0001G1-Hj; Fri, 28 Apr 2023 06:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psLPt-0001Fl-J4
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:33:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psLPr-0008Et-S8
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682678007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZnDIFtFQaJSKCtnZqx4SVloyy7MovU14Ud/EgQU8mK8=;
 b=UtpKUBbTKe/S2xZWNrGRYep5zMiG8puUdMIUjNYDWys4RsPQvpBn3kevjrfOgYpP5L07D/
 DYmJ+muCLKKMHSrFtj0akh1gmCRcQUreUh1+GE9B5oCjwuOW0Ty2SwUTVW30uLZAj45U9m
 DRddljYTgVfk/e04yve0gCsxAGl0Z60=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-t1_TwvaxOZS5v1TUpOsadg-1; Fri, 28 Apr 2023 06:33:26 -0400
X-MC-Unique: t1_TwvaxOZS5v1TUpOsadg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30479c17304so2198211f8f.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 03:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682678005; x=1685270005;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnDIFtFQaJSKCtnZqx4SVloyy7MovU14Ud/EgQU8mK8=;
 b=ghZp9OSAJUZXAeJx7gvVaIkuHMZ5voE4X4e1smgbBCW021NFLIDMfQvdDZ6jp6tidc
 2892VNluXUsNFFq9NrMzstPfrsbvOAZ4mBLzhShr9Yuv/XBnLPzzVnaGb/D8L1JuplXH
 JqMBM6cGWgBOTbkFK7Peg5ENruO3u+lTwurah1ThqOmjJASSXMNCgQ74BIpq2gZyi4GA
 kNhP/R7KN6YYXsMS8jJ2xmmgTiwrp8rtXzP/g0osA9bXeKOLzZPEA+j1vSKucKtUmMV7
 vq52skL2NWM5uJkRDXPo45v6wxOwkBgcU7ZYbHFsJ/coSVQ092xoPUMBeinYl1LEp36l
 1aAA==
X-Gm-Message-State: AC+VfDzNKqVWYIcejOUojiMpm70B0RMu07xvIh3Si6R/9mwR883oO/Xt
 qfc0Funl2/d9x9ra+d0AzbQ8bXcB7khHOItIPWupIIQu47lb7gAMMNDiiUan9M0rAIEVDDgrxvf
 Mv7xcMUgS9MYq3tE=
X-Received: by 2002:adf:e68f:0:b0:2fb:6277:54a with SMTP id
 r15-20020adfe68f000000b002fb6277054amr3830279wrm.51.1682678005001; 
 Fri, 28 Apr 2023 03:33:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ679mUJx8YAzvQGbLUdRy21u8gbDGfOruBmAJeGDI8jzBqcz0YlGn+JqchMrgJ4qTXuLN8WFQ==
X-Received: by 2002:adf:e68f:0:b0:2fb:6277:54a with SMTP id
 r15-20020adfe68f000000b002fb6277054amr3830260wrm.51.1682678004640; 
 Fri, 28 Apr 2023 03:33:24 -0700 (PDT)
Received: from [192.168.8.102] (tmo-098-235.customers.d1-online.com.
 [80.187.98.235]) by smtp.gmail.com with ESMTPSA id
 s12-20020a7bc38c000000b003f1739a0116sm23770866wmj.33.2023.04.28.03.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 03:33:23 -0700 (PDT)
Message-ID: <e61e3522-2cd4-9e81-e74b-2932a53b8da0@redhat.com>
Date: Fri, 28 Apr 2023 12:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL 03/18] tests/avocado: Add set of boot tests on SBSA-ref
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: richard.henderson@linaro.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:SBSA-REF" <qemu-arm@nongnu.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
 <20230427154510.1791273-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230427154510.1791273-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27/04/2023 17.44, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> This change adds set of boot tests on SBSA-ref machine:
> 
> 1. boot firmware up to the EDK2 banner
> 2. boot Alpine Linux
> 
> Prebuilt flash volumes are included, built using upstream documentation.
> 
> To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
> the same Alpine Linux image on both.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <20230323082813.971535-1-marcin.juszkiewicz@linaro.org>
> Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
> Message-Id: <20230328171426.14258-1-philmd@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230424092249.58552-4-alex.bennee@linaro.org>
...
> +    def test_sbsaref_edk2_firmware(self):
> +        """
> +        :avocado: tags=cpu:cortex-a57
> +        """

This is failing for me in the gitlab-CI:

  https://gitlab.com/thuth/qemu/-/jobs/4196177756#L489

Could you please have a look?

  Thanks,
   Thomas


