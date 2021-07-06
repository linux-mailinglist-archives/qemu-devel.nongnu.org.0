Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3223BC746
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:34:01 +0200 (CEST)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fai-0001jZ-94
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0fYq-0000Si-FB
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0fYn-0003bZ-Eu
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625556720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPWS48xyHJPcaLp1sBYohywsr40Y8GFu+h4AF/SahzU=;
 b=Fo1V8UY0t4p8bGyjnTS8iMTuidAysSdS7w0/BjpO2nZFL9nc6cweK0ijH9AUA4MgcoIiBX
 XQq2NTOt8Ieyr6tlUKZZiw8Pn6EGF7qA6D+6TAf7AInt2MWXzQSzaSzBUYeiPf1Kk1+EV7
 Ie+Mkd6/hvUlSgOca8LNWUILVUd+Jyw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-wodxfyCbNCy1kxu505ImtQ-1; Tue, 06 Jul 2021 03:31:59 -0400
X-MC-Unique: wodxfyCbNCy1kxu505ImtQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 d16-20020a1c73100000b02901f2d21e46efso537971wmb.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 00:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cPWS48xyHJPcaLp1sBYohywsr40Y8GFu+h4AF/SahzU=;
 b=g/i6LPoqZYeSmJOqNX5P7ugEW0jb3zyayqRt5lg7iiSPT+jC2iVIZ2+Chf0ACHoC+O
 k3BncsATqendv7s4HaWWJzeS5V8QParWnXbM+q4nNaHjevlBAiRfj4hXPpBTCdmdCFPX
 xXkG7NP56jwO9Giz8qZhWrjXYTto4dxZtgypBWFZ8W8DaIxeh3govwl+ApJmbIUvMpKk
 B/2OsSXj9XvAiJBip+tASfnNP2izvFX2E6iWI+mdyp2sHNdXaPAH95FkN6EMUDBdqVqe
 uMJg4oz9X72dKP3ZU9MgRBNAFFFSEVtwetBxG44CoecLFnqVKZS2MgWAdz/rlEWaZOVE
 BOdQ==
X-Gm-Message-State: AOAM531OQ+z1DUtTm9YpQhrkrgVxnk/yEjeWdJRHLssGxbQDCpUYbR3i
 PUd4u602NbLOimYNNkw5wZLyuwpW/HjU4dccCgmdSIOf9D4fL+WHUH4ua+6bpjbxX+iz5HzQThM
 Ho8Jw2YJZPj96JSE=
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr3150201wmj.99.1625556718289; 
 Tue, 06 Jul 2021 00:31:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztOf24+lpgNpDE4vlgF7YlTWPcztiWuTcSy/b1fJvgdNZM62EvLJmRQJ06YZZkSBAHo4uGIA==
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr3150168wmj.99.1625556718041; 
 Tue, 06 Jul 2021 00:31:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w9sm15024137wmc.19.2021.07.06.00.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 00:31:57 -0700 (PDT)
Subject: Re: [PATCH] configure: Remove the OBJCC variable from config-host.mak
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210706071934.1054496-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <61e0202e-aeea-f66b-bd76-615a66690df4@redhat.com>
Date: Tue, 6 Jul 2021 09:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706071934.1054496-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/21 09:19, Thomas Huth wrote:
> The last user of this variable has been removed in commit
> 660f793093 ("Makefile: inline the relevant parts of rules.mak"),
> so we don't need this variable in config-host.mak anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

There's quite a few more: CXX, OBJCC, ARFLAGS, RANLIB, NM, PKG_CONFIG, 
WINDRES if I didn't miss anything.

Paolo

> ---
>   configure | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configure b/configure
> index e799d908a3..068716a56c 100755
> --- a/configure
> +++ b/configure
> @@ -5888,7 +5888,6 @@ if $iasl -h > /dev/null 2>&1; then
>     echo "CONFIG_IASL=$iasl" >> $config_host_mak
>   fi
>   echo "CXX=$cxx" >> $config_host_mak
> -echo "OBJCC=$objcc" >> $config_host_mak
>   echo "AR=$ar" >> $config_host_mak
>   echo "ARFLAGS=$ARFLAGS" >> $config_host_mak
>   echo "AS=$as" >> $config_host_mak
> 


