Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4F480CCB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:28:28 +0100 (CET)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2I95-0007SW-NQ
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:28:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I7F-00068W-Ks
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 14:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I7E-0002ot-6g
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 14:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640719591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXQSBjrSm98vjpWfGDxxfqGgz7Gdxfzcr7bG4Ey24MA=;
 b=b+TOaGBY+WZfQXUU6PqpmiNM2ye3iBc96ZWtjTy2NctkudIs5V7lzD/tusz/HMRsrGmIkB
 Vpm2hmQ8+RbFDk2KlRLu/BsLo3EwuvNSRu1xfHPo9hhBZnYHKEmqnsALo5wEsEk755dCnh
 GhRuy8cZLz71QnXOw1QFFDDnkUpDqI4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-ugWQz7GxOKy3xiRo0b6u5Q-1; Tue, 28 Dec 2021 14:26:30 -0500
X-MC-Unique: ugWQz7GxOKy3xiRo0b6u5Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 g189-20020a1c20c6000000b00345bf554707so10740764wmg.4
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 11:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NXQSBjrSm98vjpWfGDxxfqGgz7Gdxfzcr7bG4Ey24MA=;
 b=hyPfyD4xcFkIOPVCtr9TXsIWtyBHORYjxK8VtAcdqBTCU4IIHFcWPKzcD+NOF6TTfx
 C4UPelCCRx4JWqB+y6Wmb4cKOM1sUyROSvWXNe2kDKxxISnOPjqEW0mwhx3terzvlB4L
 3MS2/9OZ8dhPjMdDpM4FZr491AVuP0IEbwdhLBU1CWZ01M97sg3tQKXuKiCrrucq2zdE
 sU0C2TME9FfgsXT/K1QcU0hBWbC6UkHessbbNLvOOV9PXRUt1PVQbXdpdSGTCV1udPRc
 VM6B0vsuN3KyQ8qMGJONspbSIk3UFinMA0bPasqlCvrQUxZqK6NOGeqa3SoMXzOF2WDf
 wCaQ==
X-Gm-Message-State: AOAM533CAZ8DIQ1Qe17Cf10D6tbaNgylf/4/s+7fQrIFr3PNpTHeCUkM
 vkJ27RBdJni8M08dmJlQwFPz6HI5KQVpBhncToYgPF3LUuyJvSKBLqylIgkguDdKsTp/BuENblh
 cef11N74OHXv+dgk=
X-Received: by 2002:a5d:4563:: with SMTP id a3mr18326103wrc.371.1640719589438; 
 Tue, 28 Dec 2021 11:26:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHWhjkA2bfnvvAjjC8EBAn4ppUywt3pK+tExp+zeziScTH+YEhKP2ou8inWSPFtfnynoglVg==
X-Received: by 2002:a5d:4563:: with SMTP id a3mr18326065wrc.371.1640719589096; 
 Tue, 28 Dec 2021 11:26:29 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id k7sm18871860wrg.105.2021.12.28.11.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 11:26:28 -0800 (PST)
Message-ID: <85f7e33d-3ddb-6504-35e5-60f44f667fc2@redhat.com>
Date: Tue, 28 Dec 2021 20:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 04/14] tests/unit/test-smp-parse: Add testcases for CPU
 clusters
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-5-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 10:22, Yanan Wang wrote:
> Add testcases for parsing of the four-level CPU topology hierarchy,
> ie sockets/clusters/cores/threads, which will be supported on ARM
> virt machines.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/unit/test-smp-parse.c | 130 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 123 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


