Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F2543330A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:02:19 +0200 (CEST)
Received: from localhost ([::1]:47194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclwo-0000N6-AK
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mclrX-0001Hc-OM
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:56:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mclrV-0006Zu-Sq
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634637408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjsNZgxKh1B15mEPCMHL7EAyeLzK132CVQoDHuULcA8=;
 b=LsrOfG/krf83fvFMd/uqbwfMePpry2c02k3JIVX9YJbEULt/F88TfeKX5DUX3mcRE9iwff
 5AhhHITdVJl8v/bcpuBmZFBDyuDf3s59G9kG5rpVst1scXZPkVVh4g2BHgqOo3AmLnCYlG
 m1dw2R7KXjZ3HWYMJtuyvcBiG+poUE4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437--rED6F8yMLefGkczKO6PuQ-1; Tue, 19 Oct 2021 05:56:47 -0400
X-MC-Unique: -rED6F8yMLefGkczKO6PuQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso2943619wrj.20
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rjsNZgxKh1B15mEPCMHL7EAyeLzK132CVQoDHuULcA8=;
 b=fKBx+EYmXdNj3VwkshF/7tkYtU2OJqrKJskafKdS9LtOeqofaMflyms5LZAq5vn+W5
 dnw6HaIXLxr003z/gAxMYHzx21lHh+pa8oVaAikfssp03PsPhi77jAG2cbQmFGXmsM75
 CiDA6bLdeVF1ABCq5UrDrBGF40+O7NYugH+1Ccn6b8XMyoq9Tn2zOSZYZQTLTDDbt6l6
 kCpb6VxNAE1TopeGrNZstEjOLvE17twUcFQzflLGLbOlGaIF8V6dRxVpnR8XGQbOVJlI
 rcZod3OhiOblhN0l0IennabgpJG7FhJhOIzyv5BCsRN61z0IDO9SIGWhlugoq6YkODYF
 ukLA==
X-Gm-Message-State: AOAM530b9KtZhrWBcUYCMStB84rg+3MwM2r4c235Yz7g8GCtVyNLbSbn
 7rg1qFKiNCjmKVbc3aZxmklesacY4H/2YHT2/LsgJlX2/Jlo/9Juv0orAdXPRw+ebgnvRX7XR6a
 ltdEK1+C9A6zh/BU=
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr4900654wmq.21.1634637406105; 
 Tue, 19 Oct 2021 02:56:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZOjbvuyibvGmoG2scrt1k+M42ulQl/5ZL7jFYZdMc4SYjl4a87YuLvSpNAhVgmtv+1VtzlA==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr4900637wmq.21.1634637405943; 
 Tue, 19 Oct 2021 02:56:45 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id 10sm2081950wme.27.2021.10.19.02.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 02:56:45 -0700 (PDT)
Message-ID: <0d5955be-09ac-3581-a13f-f7f8eaa53790@redhat.com>
Date: Tue, 19 Oct 2021 11:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] chardev: don't exit() straight away on C-a x
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211019092901.1519570-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211019092901.1519570-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.junger@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 11:29, Alex Bennée wrote:
> While there are a number of uses in the code-base of the exit(0)
> pattern it gets in the way of clean exit which can do all of it's
> house-keeping. In particular it was reported that you can crash
> plugins this way because TCG can still be running on other threads
> when the atexit callback is called.
> 
> Use qmp_quit() instead which takes care of some housekeeping before
> triggering the shutdown.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Lukas Jünger <lukas.junger@greensocs.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211018140226.838137-1-alex.bennee@linaro.org>
> 
> ---
> v2
>   - use qmp_quit instead of direct qemu_system_shutdown_request
>   - g_assert_not_reached() for the stub definition
> ---
>  chardev/char-mux.c | 3 ++-
>  stubs/qmp-quit.c   | 8 ++++++++
>  stubs/meson.build  | 1 +
>  3 files changed, 11 insertions(+), 1 deletion(-)
>  create mode 100644 stubs/qmp-quit.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


