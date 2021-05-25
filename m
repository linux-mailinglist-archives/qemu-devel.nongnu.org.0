Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912E390364
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:05:56 +0200 (CEST)
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXgx-0002nJ-4j
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llXe9-00086o-Dq
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llXe6-0000CB-55
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621951377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxTbUVcT66q7llxWF8ddXd1WQvglI+VNNZxPS7uEvII=;
 b=jC7hvv+gpebXw3Em5I1KYqLL/qa6YmANneQN70syvmmi0WA5L8Z58Z8gpiFXtDP2UT8X09
 C06OjtlT1EPFr0h9s+5DemZNtGBQOwztvCXJQiBMFHgfLHI5TSn+Dc80ftFXoKMq6NKRAe
 gDkqQWpKGJvu9mKmG1uxVSfKG52M/uw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-maJHUIyHNg2wspT-APB_lw-1; Tue, 25 May 2021 10:02:55 -0400
X-MC-Unique: maJHUIyHNg2wspT-APB_lw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n20-20020a05600c4f94b029017f371265feso3632163wmq.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pxTbUVcT66q7llxWF8ddXd1WQvglI+VNNZxPS7uEvII=;
 b=PzEI4IubfKzGokfJaT1KN2A0JY5Y0IXfXb8EwReUwUOIVnhBs5RZAztFRkrrW+K/7U
 90BzlgLtHTZTAOJXqEC49jicXYsAFK00s6URDfJCLbZGvAnFAmXbNltdrCK4h76OhL1j
 TvsR7sbIGQtrSSTafsCVofOujUa51ODPDavnEiyvBNFxSZe2qP94HNvB/Q60d4SGMxtm
 rAYsncN7HnGiruxVKoG0vGgFIFVnMh30OjFQvfDVk4kMouRDuEmLxTVSwhABSx7o8zC8
 Yf2wtjleadW03tW660FfLzkzPGqcaVn5xvs4fhdEYA/GI1Z0CeYJK+meLwC7qluqRqsT
 /jvg==
X-Gm-Message-State: AOAM531WPSaWVmB353+LoT8E6ewD58o0cd1tQc5ZvsquPHpHDOreEhf/
 tQQUz9R0juIGuzlHLiTyhkeovdpdfC9yvIm4T/yySYxz5xxhSyE5PsYA9063gcq30Q7pC1+lC/f
 WTQiO/kqMO/D1h9o=
X-Received: by 2002:adf:ffd2:: with SMTP id x18mr27516954wrs.144.1621951374436; 
 Tue, 25 May 2021 07:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxseTlbhY2pu+VNbezTCRmOi8vy7PWaTXUHCZor84piN/YvxUeNRUi5mLycbfBEOfsZT/kYbw==
X-Received: by 2002:adf:ffd2:: with SMTP id x18mr27516933wrs.144.1621951374264; 
 Tue, 25 May 2021 07:02:54 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id i5sm16658359wrw.29.2021.05.25.07.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:02:53 -0700 (PDT)
Subject: Re: [PATCH 6/6] tests/unit/test-vmstate: Assert that dup() and
 mkstemp() succeed
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210525134458.6675-1-peter.maydell@linaro.org>
 <20210525134458.6675-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d8bd2450-9ffd-4f81-e831-4ea4429809da@redhat.com>
Date: Tue, 25 May 2021 16:02:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525134458.6675-7-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 3:44 PM, Peter Maydell wrote:
> Coverity complains that we don't check for failures from dup()
> and mkstemp(); add asserts that these syscalls succeeded.
> 
> Fixes: Coverity CID 1432516, 1432574
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/unit/test-vmstate.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
> index a001879585e..8d46af61511 100644
> --- a/tests/unit/test-vmstate.c
> +++ b/tests/unit/test-vmstate.c
> @@ -44,6 +44,7 @@ static QEMUFile *open_test_file(bool write)
>      QIOChannel *ioc;
>      QEMUFile *f;
>  

Eventually move the assignation before the assertion:

-- >8 --
@@ -40,10 +40,12 @@ static int temp_fd;
 /* Duplicate temp_fd and seek to the beginning of the file */
 static QEMUFile *open_test_file(bool write)
 {
-    int fd = dup(temp_fd);
+    int fd;
     QIOChannel *ioc;
     QEMUFile *f;

+    fd = dup(temp_fd);
+    g_assert(fd >= 0);
     lseek(fd, 0, SEEK_SET);
     if (write) {
         g_assert_cmpint(ftruncate(fd, 0), ==, 0);

---

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +    g_assert(fd >= 0);
>      lseek(fd, 0, SEEK_SET);
>      if (write) {
>          g_assert_cmpint(ftruncate(fd, 0), ==, 0);
> @@ -1486,6 +1487,7 @@ int main(int argc, char **argv)
>      g_autofree char *temp_file = g_strdup_printf("%s/vmst.test.XXXXXX",
>                                                   g_get_tmp_dir());
>      temp_fd = mkstemp(temp_file);
> +    g_assert(temp_fd >= 0);
>  
>      module_call_init(MODULE_INIT_QOM);
>  
> 


