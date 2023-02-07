Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352FA68D9B6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 14:53:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOOk-0006Yc-T1; Tue, 07 Feb 2023 08:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOOd-0006YS-Sl
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOOc-0008Tw-EZ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675777949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=STW3ZyQMQykZNAp8IF8BcX3aTds63Vtth94ImFTjnZ4=;
 b=abik9BAL42WcUijBDxjiu8I1bfKQCrZ3ODRRTJ2dHwZthuf6N/SJOP/GZ3eReoSBGNjUre
 sti4r6Oq7D8jLiIal1TpIoh1JP9fzauC6KuVR+HhgF/B/2RIqvzqAnxgjfoxTaa5nZ4+i/
 jKDy/bp3HsRiKbnjA1ufD8cqDgCbdUA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-uAm1e-EgORWVoh-DmyWZCg-1; Tue, 07 Feb 2023 08:52:28 -0500
X-MC-Unique: uAm1e-EgORWVoh-DmyWZCg-1
Received: by mail-qk1-f197.google.com with SMTP id
 w17-20020a05620a425100b00706bf3b459eso9890263qko.11
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 05:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=STW3ZyQMQykZNAp8IF8BcX3aTds63Vtth94ImFTjnZ4=;
 b=QKCHS3EIqfPuREBWIxCeL+JH13VVd9lcTXylZsNxpuMox4XKH0015LEGVXs15koMAI
 v84NTSqIXzKeUMct4VqfYmYST7bdZW1f/VYupJyaf5pYmdNJQ+1Sm5bpP99MIDc6NfPU
 SqwaoNov5I/td1ee0oMqPuX4JvyinzyFTytQ6civt4+sfG7PBNGkFw8C0+Ay3WQpHUrw
 W2cYcTiUL98KLGj6jEEy1MpINA+3umXAsu9h1z5jScSdRrSzfUQzCmKKbWLap6Yjn2me
 DJFMO8j4zpVtpcRTgnB2Cu0J82Easi6zxsdDMaQFgWtUKIDMmQUamrBg1allOCzAOV8j
 f5CA==
X-Gm-Message-State: AO0yUKWyMIE7+C0dfCWwzz0P9HSSNg5Fn2j2Lx4NIdCPXtiNPYQszzi/
 64dT7esSyvmvrWkY5yABNbCuqsDTN+/mLnYqQ056lLFjVD3GHv1DKKUjnz36L2am8nqA2JhyOnx
 ek5MfV30AnjRbbCQ=
X-Received: by 2002:a05:622a:1207:b0:3b9:bc8c:c217 with SMTP id
 y7-20020a05622a120700b003b9bc8cc217mr26808015qtx.34.1675777947184; 
 Tue, 07 Feb 2023 05:52:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9TZE9QoQsj9o+jDJyL5XC5RG/nuIln76BlGzgTFH0cEc0FOgZua/do/y17IBHcM4kBaFzfYg==
X-Received: by 2002:a05:622a:1207:b0:3b9:bc8c:c217 with SMTP id
 y7-20020a05622a120700b003b9bc8cc217mr26807997qtx.34.1675777946945; 
 Tue, 07 Feb 2023 05:52:26 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 o21-20020a05620a111500b007339c5114a9sm3718423qkk.103.2023.02.07.05.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:52:26 -0800 (PST)
Message-ID: <5cafe092-231d-7d5f-e7c5-175339934d73@redhat.com>
Date: Tue, 7 Feb 2023 14:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 05/12] tests/qtest: hd-geo-test: Check for missing devices
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-6-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> Don't include tests that require devices not available in the QEMU
> binary.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/hd-geo-test.c | 38 +++++++++++++++++++++++++-------------
>   1 file changed, 25 insertions(+), 13 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


