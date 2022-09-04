Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE45AC495
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 15:55:17 +0200 (CEST)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUq5i-0004Xb-OB
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 09:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUq4W-00038d-Qm
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 09:54:00 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUq4V-0000Sm-5q
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 09:54:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id t14so871298wrx.8
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 06:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=JM0N6nC4w3f5JMTXXcDvbsZuHB2NPGGjAA7lnG28rEI=;
 b=Ss1sjyouSHKG6L3qhBjywB532XLziEwT6rUE6iEImHebaRg8x1pGm0f7KT6JnlMsEw
 SEFwq016uq/XXrbH1NhHm8TaFHVB8BIhP0E7dS6y2ucFOtzpGIisrrRDBFH9CVu7Vvuy
 R9MHaI06wDJzevAp9tIGAL1G+6rOdC5mtPYZjpn23z1I2Hx3vqhFb/zTvFMaVtdFRbGm
 hoak+rZbAce36cFPKkuX+D76oSttPCLdSif3Ran3JW7DnqkKvNdxxKSkqfpIhOgcth5q
 KVdts0Y8hib7fferZmIdli9OVx6UQ1AxSVWizrdM+ATuSOFcD/16+8YwU65m8jUI3pa4
 nkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=JM0N6nC4w3f5JMTXXcDvbsZuHB2NPGGjAA7lnG28rEI=;
 b=XgKWs5WK/EBSDgCEXUdstdJULiUC8gjEOYbn6EHFTEYnmo+LukgRwIgr1jCYYQE629
 UGzgzO5tvKrH4M+cEeutSfLmt7alq1wjbuQl1Mk1BMYkkGlL9TfNf0KX74UXpEMyBmEh
 kvQoCj5yIcSAU47vTCYxG0mA01MC5QCi/XeLkDGouA7dQ2KJVmt4To+HZfig7U1D9dTN
 YNVz37NCX1y/xGx/h/uBn1k+FOmiYfYkS4P34ycInjAD3Q/EL7sr/LNMMEs2FzGCnRzE
 mGN4jZEfKsr717bUnu20v4HXHxL+pw9L18R4erfyRf7IPrb1sgHgsRXE5+LI8AT+zxKZ
 kwtQ==
X-Gm-Message-State: ACgBeo2DB2GzvJE0cQPOT5VBEkuT2vqactyHvtnqEb1zI4gmTUHQ3b8P
 gzpau+fiJA05o6c19/Lz4b0=
X-Google-Smtp-Source: AA6agR6pOPwXs+b0SnbyecZCnl8sp2JLu6bAm1stkBfZrh5u9SUNh0D7qZZYivYzwhH8UfB9sEnf0Q==
X-Received: by 2002:a05:6000:78b:b0:226:d10f:1c3 with SMTP id
 bu11-20020a056000078b00b00226d10f01c3mr21027812wrb.149.1662299634819; 
 Sun, 04 Sep 2022 06:53:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bd7-20020a05600c1f0700b003a331c6bffdsm8039402wmb.47.2022.09.04.06.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 06:53:54 -0700 (PDT)
Message-ID: <83b900e5-b888-006d-de29-c0cc7533579b@amsat.org>
Date: Sun, 4 Sep 2022 15:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 1/8] bios-tables-test: Make oem-fields tests be consistent
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
 <20220902173452.1904-2-quintela@redhat.com>
In-Reply-To: <20220902173452.1904-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/9/22 19:34, Juan Quintela wrote:
> Every other test function is named:
> 
> 	test_acpi_<machine>_<test>()
> 
> Just make this test the same.  Once there, rename "acpi/oem-fields" to
> "acpi/piix4/oem-fields" so it is consistent with everything else.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

