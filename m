Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624BE456DB4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:42:55 +0100 (CET)
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo1M6-0006CC-7c
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:42:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo1KO-000532-Ih
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:41:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo1K8-0003tA-I2
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637318451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNW29QlzyrK/HRDX5UM1zsprjO9EIHL7sf8OT2fSyqY=;
 b=P2DfRR8na6AcgAF7G64D/fjyNHHL7Thv57Du5C17Iqqm3aszMkBDJKz/OWF1kAPqeQrzgU
 jHmnD0R1sPjJnSh3rtLae7+pchWmU+RDaJzlXgdpcgrc23FPHkmnJNH+Y0UYFGZw1ToCJL
 RRY8UtO3AwZtlM5uPD24txQQ/E/bwIk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-109-c5AMD7U7PY2GXdDB-AkEzQ-1; Fri, 19 Nov 2021 05:40:49 -0500
X-MC-Unique: c5AMD7U7PY2GXdDB-AkEzQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so4511981wms.8
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 02:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bNW29QlzyrK/HRDX5UM1zsprjO9EIHL7sf8OT2fSyqY=;
 b=2+WbFQeCcrrz6YmRer4MDHcMxqtj/1PiaEpWeUd4EoxzwzLwVtInz9qDF2VY89gr0H
 /xg0OD5DuH6GZ7DI1irLtyNwy9e5ljxkNow1Yh3kbnv8IXhKScX1LwumvCsL6ZKUvcsj
 OZ0gNRxsa2HrW8AsYv7xk+FvSb5gcjCsGM9drsBs/R9roplhhKMoRPc9cvQ6arRqUcKK
 v4GEHoNyGEQHYjZqa7s3drAvn0dfpI2SXsgfPlxsD/ylfw5bVzd3qESvbpMhA1BZ7Fpu
 ERciacRAjFKvh2aoEBr/w58CRaXb3FhBKEfR6iyxPm7RiC3K2U18IzrBhdx71+K+Ewcw
 WYmQ==
X-Gm-Message-State: AOAM5331+Wi8/Fg2cl3NIdnfLaK8+nJxSs5lblFfBqoNKYWrJIzdYKkP
 J6L2m59NBOmcnpxyUM8LHP2v9ldj3wH4motOviZVSWsNZfqHqAaUpZy5v6dZzjRd0O6W04kjygN
 9ColW99sQ82L/uLo=
X-Received: by 2002:a5d:5186:: with SMTP id k6mr6158807wrv.146.1637318448380; 
 Fri, 19 Nov 2021 02:40:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhUQXOcGJVKBvKC6uBQ9fPTF4Eanll8zg+QnsEpZKoyivlL1AyJa2rxUFv6/jnHdDQZltDZw==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr6158766wrv.146.1637318448101; 
 Fri, 19 Nov 2021 02:40:48 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n1sm2975256wmq.6.2021.11.19.02.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 02:40:47 -0800 (PST)
Message-ID: <f2de8ec7-3157-0f87-cfc8-70633e0f8658@redhat.com>
Date: Fri, 19 Nov 2021 11:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP
 device instead of IF_NONE
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>
References: <20211119102549.217755-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211119102549.217755-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 11:25, Thomas Huth wrote:
> Configuring a drive with "if=none" is meant for creation of a backend
> only, it should not get automatically assigned to a device frontend.
> Use "if=pflash" for the One-Time-Programmable device instead (like
> it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).
> 
> Since the old way of configuring the device has already been published
> with the previous QEMU versions, we cannot remove this immediately, but
> have to deprecate it and support it for at least two more releases.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 6 ++++++
>  hw/misc/sifive_u_otp.c    | 9 ++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)

> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> index 18aa0bd55d..cf6098ff2c 100644
> --- a/hw/misc/sifive_u_otp.c
> +++ b/hw/misc/sifive_u_otp.c
> @@ -209,7 +209,14 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
>                            TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>  
> -    dinfo = drive_get_next(IF_NONE);
> +    dinfo = drive_get_next(IF_PFLASH);
> +    if (!dinfo) {
> +        dinfo = drive_get_next(IF_NONE);

Isn't it a bug to call drive_get_next() from DeviceRealize()?

Shouldn't drive_get_next() be restricted to the MachineClass?


