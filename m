Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619B23809EE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:53:48 +0200 (CEST)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXK7-0006HC-GK
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWwI-0004yx-7o
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWwG-0003cw-FY
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620995347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NnccFYyCaqnGtSK7BMfFgbGNxGVubPHSD7J5jHHqMlU=;
 b=i5ZWKwotCKoMvgispA67Pn2HzccgNTPDcL/FjWiq2Oc9t9GK0cQ/V7wiC00/dE5a5/NFXj
 l+ycf9FK2z13Bi62+AyyAnatFqCYnTdY2Wfm4exgwqESMvXZnErNvWKNqsRpZ/W/QvK6Ia
 vDzyRc7Kp8sRWymq55uPIkBHQ2nr+Ko=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-5Dgwyn0rMvu1ZpdKK0hgyQ-1; Fri, 14 May 2021 08:29:06 -0400
X-MC-Unique: 5Dgwyn0rMvu1ZpdKK0hgyQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so9932967wre.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NnccFYyCaqnGtSK7BMfFgbGNxGVubPHSD7J5jHHqMlU=;
 b=il7VzUiMQ8945QLKw0OHvCsYZeXrXR5XqATqcV/51qMS0SQYIC1nk7giu7TRXvvXc8
 unrKDY4zQbybaVyrfM+5e+9tpntypcl1QCwPJxlzg8KPhC9kQsOs+TsE2vn8c8M+LoSx
 a03tjdmT8PFiKiUk2IogbfagN08AjXigb7qOXQVrd27lbjfgw88DauJ7M+kIFi1KHlBh
 RK5HmlNYoamUg/WfcjWb5kxFPpv8d9AnwlUYCUUQ0XDIr+8FyNkhHzHo/PStOVaiMebf
 VEBnG6l7AH7+k2BtePJXA8nvWiLM/oTC22kxoR6c4NqvSfx0xU2vWfEByHCDyluBOO6H
 FQdw==
X-Gm-Message-State: AOAM532PHLpVcHXgMiSRAQj1rbnM3AOLmvnYonvTOJE4t5nPtaTWWvXy
 A0Tx0+MpHY9vSUFeLrXQ3J/+JrSp3KVwpWjA5ulACdjWaL7P+VaWs3BuiDiOG2ZlHQW0OovtFWU
 KifZ0ic1RLx1OhxU=
X-Received: by 2002:a05:6000:1143:: with SMTP id
 d3mr59428870wrx.404.1620995345247; 
 Fri, 14 May 2021 05:29:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuZ2W6dU9UUwe39F+6yiut8cgnVNIVdVFskga2oH5h6FKfESnXuS6KcTR+4Qzfolpvaw+HLw==
X-Received: by 2002:a05:6000:1143:: with SMTP id
 d3mr59428848wrx.404.1620995345090; 
 Fri, 14 May 2021 05:29:05 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83cd9.dip0.t-ipconnect.de.
 [217.232.60.217])
 by smtp.gmail.com with ESMTPSA id c5sm1692508wrw.36.2021.05.14.05.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 05:29:04 -0700 (PDT)
Subject: Re: [PATCH v2 11/12] configure: bump min required GCC to 7.5.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-12-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cefbb586-036a-73fd-d4d9-6007c3d02cb2@redhat.com>
Date: Fri, 14 May 2021 14:29:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514120415.1368922-12-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/2021 14.04, Daniel P. Berrangé wrote:
> Several distros have been dropped since the last time we bumped the
> minimum required GCC version.
> 
> Per repology, currently shipping versions are:
> 
>               RHEL-8: 8.3.1
>        Debian Buster: 8.3.0
>   openSUSE Leap 15.2: 7.5.0
>     Ubuntu LTS 18.04: 7.5.0
>     Ubuntu LTS 20.04: 9.3.0
>              FreeBSD: 10.3.0
>            Fedora 33: 9.2.0
>            Fedora 34: 11.0.1
>              OpenBSD: 8.4.0
>       macOS HomeBrew: 11.1.0
> 
> With this list Ubuntu LTS 18.04 / openSUSE Leap 15.2 are the
> constraint at 7.5.0
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   configure | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index efd76368b5..ac8520172a 100755
> --- a/configure
> +++ b/configure
> @@ -2059,8 +2059,8 @@ cat > $TMPC << EOF
>   #  endif
>   # endif
>   #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
> -# if __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
> -#  error You need at least GCC v4.8 to compile QEMU
> +# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 5)
> +#  error You need at least GCC v7.5.0 to compile QEMU
>   # endif
>   #else
>   # error You either need GCC or Clang to compiler QEMU
> @@ -2068,7 +2068,7 @@ cat > $TMPC << EOF
>   int main (void) { return 0; }
>   EOF
>   if ! compile_prog "" "" ; then
> -    error_exit "You need at least GCC v4.8 or Clang v3.4 (or XCode Clang v5.1)"
> +    error_exit "You need at least GCC v7.5 or Clang v3.4 (or XCode Clang v5.1)"
>   fi
>   
>   # Accumulate -Wfoo and -Wno-bar separately.
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


