Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CAF6901E9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:12:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ21Y-0005Pr-9u; Thu, 09 Feb 2023 03:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ21Q-0005LW-FC
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:11:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ21O-0000a8-Gr
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675930269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtZrGUWL0dyLmh4ez+DCVWOMOKohu88CNJaw5mZn+pA=;
 b=IuZu1zOW1/v4PJKkSZNbxm/hdWyKmXUTLwculTr3KBECX4vVDyBmtM5SmbzqwELeM47HCr
 s1wXWlqv1zexeyiCu3xl0q4wOSxPrtF1YL59kcxUUi4KHR2+h+ARxmB/SGXPyEc3zvKjKv
 kntvLJiAveYrlGW9urMZOcP2rUlol4k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-K086-NbiOxWHBY45KRjZRw-1; Thu, 09 Feb 2023 03:11:07 -0500
X-MC-Unique: K086-NbiOxWHBY45KRjZRw-1
Received: by mail-qv1-f70.google.com with SMTP id
 k15-20020a0cd68f000000b00535261af1b1so833830qvi.13
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:11:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OtZrGUWL0dyLmh4ez+DCVWOMOKohu88CNJaw5mZn+pA=;
 b=Z6mGjLdWuEe3G3QTs0xUdCrOgTSd3bSrjmXjMqwEh8+bmfJlKqDwl45z1JrzU0NavX
 2a4qrW7tCR+2IgKr2Mshu+kjwpYKXTUT07qlLigek9CFheoJomVmBHd/m7XNMzPoX3fd
 1DV7Aq//GTa259hDPt3wbkwiEzHifTw9UX8yOLVRcGK7m5bIPujHTslpeOziHKNCj3W7
 rR5pWHjFNn3pDXXqg6m8Cn9ZnLnz6gWWVoKkp1k4KsCK2CVh9mRrLjuDdYBBO1d2yz7m
 qX3u6ov7wU/XwZ6+gc6x68NNIG4lC22iZaiPpXEdBByR/cPV8Ex2NMYDN7khiGvGTbZv
 6NcA==
X-Gm-Message-State: AO0yUKV0wW0hfXY/b9wCETe2mzbpo0xPczyrUI+gwZQvb81/HaKRepow
 qu+BOhwyc3y1w4zGoJB9vpQR8grVHuG+CJQuGpxSwKwX0q8zUR7pCXBHWOOzCUSOyqcL1F7WUB6
 cGvUEAr4kWitatpw=
X-Received: by 2002:a05:6214:21aa:b0:56b:fd8c:746f with SMTP id
 t10-20020a05621421aa00b0056bfd8c746fmr17194810qvc.39.1675930267206; 
 Thu, 09 Feb 2023 00:11:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9lW1dYcoV/M5iO5EiCIGBsuzb/p7EFe0B17fGn3zSVIjQi21PkkE6DiozUAQaF4d5EJHFbKQ==
X-Received: by 2002:a05:6214:21aa:b0:56b:fd8c:746f with SMTP id
 t10-20020a05621421aa00b0056bfd8c746fmr17194795qvc.39.1675930266990; 
 Thu, 09 Feb 2023 00:11:06 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 t185-20020a37aac2000000b0071eddd3bebbsm875536qke.81.2023.02.09.00.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 00:11:06 -0800 (PST)
Message-ID: <502e011a-39a1-4a28-64a3-63411aef9713@redhat.com>
Date: Thu, 9 Feb 2023 09:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 07/12] tests/qtest: Skip unplug tests that use missing
 devices
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230208194700.11035-1-farosas@suse.de>
 <20230208194700.11035-8-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230208194700.11035-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08/02/2023 20.46, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/device-plug-test.c | 33 +++++++++++++++++++++++++++------
>   1 file changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> index 4f92617335..01cecd6e20 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -68,6 +68,11 @@ static void test_pci_unplug_request(void)
>       const char *arch = qtest_get_arch();
>       const char *machine_addition = "";

Reviewed-by: Thomas Huth <thuth@redhat.com>


