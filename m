Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BED301785
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:15:30 +0100 (CET)
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3NRZ-0000lE-VQ
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NPP-00081G-5w
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:13:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NPN-00080k-Gy
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611425592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t74zT8sC6+gXua+Ohvn+dU9Qk6WcmVYcHAxxzrlMTr4=;
 b=eqTDur20KMfANHQZq3DSRyZLRldrRUEfXRyNbAoXjF4yu0pU2P7SgvB+3hijSy7fvEeBgM
 zk5vTBqcCU0nk0NVf7nr0aI8m14XWRCzcTsCu2f4r+MLuF+dA3FyGOuu/TL03cHm0ugOdO
 gPfvsB1pxgyuTSFYlF1XLl5A2cUkebo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-jaZRg8aKN7yVjj7WlWCFcw-1; Sat, 23 Jan 2021 13:13:08 -0500
X-MC-Unique: jaZRg8aKN7yVjj7WlWCFcw-1
Received: by mail-ed1-f71.google.com with SMTP id a26so4857039edx.8
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t74zT8sC6+gXua+Ohvn+dU9Qk6WcmVYcHAxxzrlMTr4=;
 b=uG02qN2seY/6lsWQHS7A1gJKF5Xz+9OW1s8pwLHLiv+TasUMR9C0cgA/2fnKvLeQVp
 844hmKM0YQiBpwPHTjj4WmFdiY8ugpKYXBUGFA3m0HOsNHSyGMUhlMkqLfxsgdpv8xhP
 xyIH87Gqq5loKV7sSvTXKz0KzNZAhqcudUlyH3i+zxJTi0XLv4SHOGNnt82+Tz1juO0e
 oInuOTt0CAWGUgw7sqUeYuZQbMdWVvpPk4HR983ro0R1RTmwOHvyL7rGGKTYQ3KRvuqx
 loMW+MAxYEtJifB6Ckd56LuuRthpV/x5pMrI0M/48asCiWGz2ymKkuG5qXF24brHYZmz
 qt6Q==
X-Gm-Message-State: AOAM531QL66Vjo6LmSKqAcDX3aImUmB73l3Mjb6y7haxTBs6pTajbriN
 hncOxtH6jhhFwYMERYs++9/bDmmUt2CIV+z8Hs4iVWjspCTw5uVteB8d0n4Qy9U9S+vsyndCsyH
 U+CFokcUmozvSxWw=
X-Received: by 2002:a17:906:c954:: with SMTP id
 fw20mr955497ejb.342.1611425587439; 
 Sat, 23 Jan 2021 10:13:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLPRzfZjKy4kONwEWGgn3opOxP2WAUUrQkLccsLYd1sRKWl684C52o3S9NC42wfYKWPGeA3w==
X-Received: by 2002:a17:906:c954:: with SMTP id
 fw20mr955487ejb.342.1611425587292; 
 Sat, 23 Jan 2021 10:13:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id dj25sm7337138edb.5.2021.01.23.10.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 10:13:06 -0800 (PST)
Subject: Re: [PATCH v3 4/4] configure: Reword --enable-tcg-interpreter as
 --disable-native-tcg
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122133004.1913923-1-philmd@redhat.com>
 <20210122133004.1913923-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c92fdd54-d67c-adfe-66a3-24206b8f4108@redhat.com>
Date: Sat, 23 Jan 2021 19:13:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122133004.1913923-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/21 14:30, Philippe Mathieu-Daudé wrote:
> Users might want to enable all features, without realizing some
> features have negative effect. Rename '--enable-tcg-interpreter'
> as '--disable-native-tcg' to avoid user selecting this feature
> without understanding it. '--enable-tcg-interpreter' is kept in
> for backward compability with scripts.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   configure | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 48bd6f48d7a..5e5ff779a69 100755
> --- a/configure
> +++ b/configure
> @@ -1121,7 +1121,8 @@ for opt do
>     ;;
>     --disable-tcg-interpreter) tcg_interpreter="no"
>     ;;
> -  --enable-tcg-interpreter) tcg_interpreter="yes"
> +  --enable-tcg-interpreter) # backward compatibility

Do you really want to break the old option?

> +  --disable-native-tcg) tcg_interpreter="yes"
>     ;;
>     --disable-cap-ng)  cap_ng="disabled"
>     ;;
> @@ -1753,7 +1754,7 @@ Advanced options (experts only):
>     --with-trace-file=NAME   Full PATH,NAME of file to store traces
>                              Default:trace-<pid>
>     --disable-slirp          disable SLIRP userspace network connectivity
> -  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
> +  --disable-native-tcg     enable TCI (TCG with bytecode interpreter, experimental and slow)
>     --enable-malloc-trim     enable libc malloc_trim() for memory optimization
>     --oss-lib                path to OSS library
>     --cpu=CPU                Build for host CPU [$cpu]
> 

The problem here is that for some CPUs there is no native TCG...  I 
mean, what's unclear in "exprimental and slow"?

Paolo


