Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDA53BC75C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:39:42 +0200 (CEST)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fgD-00063d-OG
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0fec-0004jE-Dt
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0fea-0007nN-Lt
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625557079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yOMyiRCKw5U5OwpOnlf4ObhyygbjSl636lwaEJxq/Kg=;
 b=Kom2RJ4DRoHWCTLuWbOCovpTP0cfCSNZ43oixiSAmQQdNMwchO3juq9qqn/x3+34RAC67Z
 FV3/JiPDSZ/2kw23JDKZCJbpiXanzSk6QmazuCtk3NRFOiQokCb5KU4JOQ4DHVtH2ez03n
 1qhXi9zFOt7s+YG/YAYdIqi+bmjMKqY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-Y4pfDqEPNqWFj5wvx7xqHg-1; Tue, 06 Jul 2021 03:37:56 -0400
X-MC-Unique: Y4pfDqEPNqWFj5wvx7xqHg-1
Received: by mail-wr1-f72.google.com with SMTP id
 w4-20020a05600018c4b0290134e4f784e8so1727707wrq.10
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 00:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yOMyiRCKw5U5OwpOnlf4ObhyygbjSl636lwaEJxq/Kg=;
 b=OtTZwHW7auQ2dNjwRAaPyFCW2WwOCYDYoUCT0OgbJOihS7XbglYv3IqJ6d+JrKP9lT
 Ema/iN7Ga3vM2GoJg0d1RY0YpB6VdM41jFZKVvlACazzkyXHqPbR8U1RYySpXog9ntB3
 8vKgR35GsP0XzVVlSft8WFXpczvnzNMUQHOuGy4LCz6CXb6BFzXNNUmvrcspqKMY+YI9
 HOSw2tYybEpsfm6MXFsTjWSXGMNMq6/Xce9Efezd7bG3PnyRyk6ZvYA4PT7O1Jhhj50e
 ylgbIdc5VuQDPdD4n80uQkgyV9CSxmmfBVS4z+wFA9hNwhUwX3bYRZWKq/e3gXRqStnd
 5FdA==
X-Gm-Message-State: AOAM532gKCGqblDHNY5pb50utd40XlaiG/aLMTt429I3o1aIFInCOLWa
 0hczLtCT2UhWwHB5ttj7PZtDDLluwUicM+ipBmS2h/Qu01DwSpIJGXjZzLp3Dtuoee3zM4vDlb7
 Ktcr0wwGKerA25EKqCL6YqmwCBmKCaRhg4Vc4xbzEzEpZ/KVgMlhIKBDgKI+yqN0=
X-Received: by 2002:adf:ce07:: with SMTP id p7mr20806023wrn.70.1625557075803; 
 Tue, 06 Jul 2021 00:37:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6zgYbwkPOjWFlpsRcb+5DkTBNV5pA6AsH8v3EQsxvBNew3K4vhvH1LX6SANxkJqH+vI8q+g==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr20806013wrn.70.1625557075577; 
 Tue, 06 Jul 2021 00:37:55 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
 by smtp.gmail.com with ESMTPSA id p16sm15203672wrs.52.2021.07.06.00.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 00:37:55 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210706072907.296061-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] config-host.mak: remove unused compiler-related lines
Message-ID: <e53e0e67-a508-84af-70cf-552154b3501a@redhat.com>
Date: Tue, 6 Jul 2021 09:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706072907.296061-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/2021 09.29, Paolo Bonzini wrote:
> Most of the build is not done via Makefiles, therefore the toolchain
> variables are mostly unused.  They are still used by tests/tcg
> and pc-bios/roms, but most of them are not needed there.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure   | 10 ----------
>   meson.build |  1 -
>   2 files changed, 11 deletions(-)
> 
> diff --git a/configure b/configure
> index 0e487ae091..650d9c0735 100755
> --- a/configure
> +++ b/configure
> @@ -521,9 +521,6 @@ query_pkg_config() {
>   pkg_config=query_pkg_config
>   sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
>   
> -# If the user hasn't specified ARFLAGS, default to 'rv', just as make does.
> -ARFLAGS="${ARFLAGS-rv}"
> -
>   # default flags for all hosts
>   # We use -fwrapv to tell the compiler that we require a C dialect where
>   # left shift of signed integers is well defined and has the expected
> @@ -4917,19 +4914,12 @@ echo "HOST_CC=$host_cc" >> $config_host_mak
>   if $iasl -h > /dev/null 2>&1; then
>     echo "CONFIG_IASL=$iasl" >> $config_host_mak
>   fi
> -echo "CXX=$cxx" >> $config_host_mak
> -echo "OBJCC=$objcc" >> $config_host_mak
>   echo "AR=$ar" >> $config_host_mak
> -echo "ARFLAGS=$ARFLAGS" >> $config_host_mak
>   echo "AS=$as" >> $config_host_mak
>   echo "CCAS=$ccas" >> $config_host_mak
>   echo "CPP=$cpp" >> $config_host_mak
>   echo "OBJCOPY=$objcopy" >> $config_host_mak
>   echo "LD=$ld" >> $config_host_mak
> -echo "RANLIB=$ranlib" >> $config_host_mak
> -echo "NM=$nm" >> $config_host_mak
> -echo "PKG_CONFIG=$pkg_config_exe" >> $config_host_mak
> -echo "WINDRES=$windres" >> $config_host_mak

I wasn't quite sure whether we'd still need some of those e.g. for compiling 
capstone or dtc, but looking at meson.build again, I think you're right, 
we're not using "make" to build those anymore, right?

In that case:

Reviewed-by: Thomas Huth <thuth@redhat.com>


