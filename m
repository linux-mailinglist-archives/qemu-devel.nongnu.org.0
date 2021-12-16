Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84081476D2A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:15:04 +0100 (CET)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmqt-0005g6-1P
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:15:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxmom-0003dW-Gx
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:12:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxmok-0008VZ-Cj
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639645969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UEERdduVS86BNaSVSboS4mG13hIcxSfegu5weLUzkL4=;
 b=frxms82STldunJB/VA8gVxRzRdKCI3Tiztz3bh+xGC9Yy3McqMljMK/E+LFgpdF9U/zcTG
 s8MP7LtXpS6Wgi2ghbBa6VEqsHIJsl7cDkGOaRIwzt65dKgYofZhuKbFklIWH+vy6xZplr
 94VdhHriqobEE/MKRg157PB7q8O8y5U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-ajcy7axANR-MF6THNnWBjQ-1; Thu, 16 Dec 2021 04:12:48 -0500
X-MC-Unique: ajcy7axANR-MF6THNnWBjQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h12-20020adfa4cc000000b001a22dceda69so1405838wrb.16
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UEERdduVS86BNaSVSboS4mG13hIcxSfegu5weLUzkL4=;
 b=64TnXHqn+jNYfCOdcvjvQkC3qnWqrTIhaZz/6ByfkOY9MZTITm16drnYseG1CN21jW
 cg0vz7i/lVoGd3XosfecKJLExEN7Mw6DUTZz2R8yC0eMgkeWDkd8BsfglQ/rlxneiDjH
 S77ZsGm4AOSK7R8+I4vwYDSAp6WxrJfJUwkf7CWqyGJ3cCOFOOpIS5bREty6S04XYhgL
 3HHQ9JLcM/7y4UB0ngdEg8cIeH1b/W9p4ZLawDiIqU2d/Uo9Rn9PatN5BXishB9q+ZQy
 rqGVzMIStO7JIbsCzaglI+5E1XXTCKeaPE2lWKsE2INZthwcr/kxoeBeo87WmChjkh8D
 FTeQ==
X-Gm-Message-State: AOAM532Z5/2WbSJqRxVs0T2CG0jBq3vleaOjRvjq+4r6wEiqTdbZltyX
 hQX+pPFY+nzvJeJ8w9dJFhEMewq92aqkWXH/C3vk0vW1uhrq5MOO9xmSEzkrwXKuoS8tlo24Vk4
 9sSgA8NiaR40ytYg=
X-Received: by 2002:adf:e109:: with SMTP id t9mr7630372wrz.387.1639645967316; 
 Thu, 16 Dec 2021 01:12:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzMfGtjrIp9a7kihkj8VYe/uFqIYrjv9OsiSi3pxZwitF8mbzRTG5pFWv5Hu+lZEZHqjXvSg==
X-Received: by 2002:adf:e109:: with SMTP id t9mr7630362wrz.387.1639645967173; 
 Thu, 16 Dec 2021 01:12:47 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id t11sm4069747wrz.97.2021.12.16.01.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:12:46 -0800 (PST)
Message-ID: <a25cfa5e-c276-e1e0-b0c1-f71d8bce740d@redhat.com>
Date: Thu, 16 Dec 2021 10:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] gitlab-ci: Speed up the msys2-64bit job by using
 --without-default-devices
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211216082253.43899-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211216082253.43899-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 09:22, Thomas Huth wrote:
> The new msys2-64bit job is often running for more than 50 minutes - and
> if the CI is currently loaded, it times out after 60 minutes. The job
> has been declared with a bigger timeout, but seems like this is getting
> ignored on the shared Gitlab-CI Windows runners, so we're currently
> seeing a lot of failures with this job. Thus we have to reduce the time
> it takes to finish this job. Since we want to test compiling the WHPX
> and HAX accelerator code with this job, switching to another target CPU
> is not really a good option, so let's reduce the amount of code that we
> have to compile with the --without-default-devices switch instead.

Good idea!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/windows.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


