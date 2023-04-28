Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCAC6F1749
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:09:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psMtk-0004cQ-3d; Fri, 28 Apr 2023 08:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psMti-0004c7-Nd
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:08:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psMtd-0002lJ-VV
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682683696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qlqv8BrnvGZCNaL9Psvl4Wbj+drqPTg+qMYsM76mVFw=;
 b=f3pMn8iAZnYl+uOyLOlmqPOCE0YL3nRpjlDDRZKBfLadpsWu8xlRox2PKxtsC8cr64vAhy
 f9t2KxXf71v5F6ZyTugBihGe0COzi5qSai6lEUCY3tSb2oCxsomfAwQOtLeJDD1ZOWhwzJ
 fci92uQ3p04SrexGIdUGxwyd+vjah0c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-idePRqVGM7uIhAav4f_Kbw-1; Fri, 28 Apr 2023 08:08:13 -0400
X-MC-Unique: idePRqVGM7uIhAav4f_Kbw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f5382db4d1so3241675f8f.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 05:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682683692; x=1685275692;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qlqv8BrnvGZCNaL9Psvl4Wbj+drqPTg+qMYsM76mVFw=;
 b=VH+lG6WCQDV+Dv4/OJKAgKHagxROYJd7LL/k5vI6nBLoYajU5bopVqDID/+Nbn4Fcd
 3nu55JHyI1MrVMUxgpzJ/HfhLKtPH3ObXIFAqGAxbuKPV/fsB8I/WnOOgEOs9KIEw5I4
 Pd9i2k2A9Wg5o6VKIheiuAXBnQnMs8eS3scoBHMJUbNfJ7rFAUdv7ZeRgYTOmC93ixjB
 BOiXaA5YfXEf1LxLfG8JV5rSR0+bSJNoVHgveMZ0fXM+6Ix2d0E7fBJIV+Qnb3+x6wzs
 iJNDQumm5hLjRIkKrGwOiLqvWAnxrHIuAFZIcKyeIBWhGF531GQQ3VmrdKKjO6Z+sno+
 1G4g==
X-Gm-Message-State: AC+VfDzRj5MXTSLNejqhQfrezyKrLOYrRjlpVToZryLXfvu9fjLt1EtL
 7MT0wmRuqsWqrf6iueqT0aKksMC2lo6iwAqlHsRPrpqMMgcuK0nVrrt907e8LcoyZYrGCaoaapg
 kVB7Bn4Oug2HYXec=
X-Received: by 2002:a5d:63d2:0:b0:2c3:e7d8:245c with SMTP id
 c18-20020a5d63d2000000b002c3e7d8245cmr3720307wrw.13.1682683692500; 
 Fri, 28 Apr 2023 05:08:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7IrYXWKkDI6vOpL5XSoInKZNLgN4tllEsy412+AZag5TYMrbltghSOeAb9UksUorCSClOptg==
X-Received: by 2002:a5d:63d2:0:b0:2c3:e7d8:245c with SMTP id
 c18-20020a5d63d2000000b002c3e7d8245cmr3720286wrw.13.1682683692178; 
 Fri, 28 Apr 2023 05:08:12 -0700 (PDT)
Received: from [192.168.8.102] (tmo-098-235.customers.d1-online.com.
 [80.187.98.235]) by smtp.gmail.com with ESMTPSA id
 d14-20020a5d538e000000b002efac42ff35sm20964271wrv.37.2023.04.28.05.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 05:08:11 -0700 (PDT)
Message-ID: <c5e8ab71-8840-b420-b6b2-cab1efb44ab3@redhat.com>
Date: Fri, 28 Apr 2023 14:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL 02/18] tests/avocado: use the new snapshots for testing
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Cc: richard.henderson@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
 <20230427154510.1791273-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230427154510.1791273-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> The tuxboot images now have a stable snapshot URL so we can enable the
> checksums and remove the avocado warnings. We will have to update as
> old snapshots retire but that won't be too frequent.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230424092249.58552-3-alex.bennee@linaro.org>
...
> @@ -316,7 +387,12 @@ def test_ppc64(self):
>           :avocado: tags=extradev:driver=spapr-vscsi
>           :avocado: tags=root:sda
>           """
> -        self.common_tuxrun(drive="scsi-hd")
> +        sums = { "rootfs.ext4.zst" :
> +                 "1d953e81a4379e537fc8e41e05a0a59d9b453eef97aa03d47866c6c45b00bdff",
> +                 "vmlinux" :
> +                 "f22a9b9e924174a4c199f4c7e5d91a2339fcfe51c6eafd0907dc3e09b64ab728" }
> +
> +        self.common_tuxrun(csums=sums, drive="scsi-hd")
>   
>       def test_ppc64le(self):
>           """
> @@ -329,7 +405,12 @@ def test_ppc64le(self):
>           :avocado: tags=extradev:driver=spapr-vscsi
>           :avocado: tags=root:sda
>           """
> -        self.common_tuxrun(drive="scsi-hd")
> +        sums = { "rootfs.ext4.zst" :
> +                 "b442678c93fb8abe1f7d3bfa20556488de6b475c22c8fed363f42cf81a0a3906",
> +                 "vmlinux" :
> +                 "979eb61b445a010fb13e2b927126991f8ceef9c590fa2be0996c00e293e80cf2" }
> +
> +        self.common_tuxrun(csums=sums, drive="scsi-hd")

  Hi Alex,

when I run the manual avocado-cfi-ppc64-s390x test on gitlab, the ppc64 and 
ppc64le tuxrun tests are now failing for me:

https://gitlab.com/thuth/qemu/-/jobs/4196177779#L758

Are they working for you?

  Thomas



