Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFF73C8682
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:58:56 +0200 (CEST)
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gLf-0004Fz-El
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3gJh-0001nS-3c
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:56:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3gJe-0004Y5-F0
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626274609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66mpSeLPShBX209PcEQqq6I3DL4h5/75RHs3fAbCrCo=;
 b=J6DfCk+eeIUDvwpMBWD7i76E47oJRKadUlgTibGGsqkYEWBof+t56mdH+MHJKSrIIe77D2
 uLabT4+bl6Q7lRRd5jWwaqEuBVRyjKOhit1B+cKiLwQ4+V60r/28mpk43cPGSlOnTwZMND
 RNc1c2QRfSp3NHXzCIggwizhskrJ04k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-jM9S0MomNj2BPVoM-VMvvQ-1; Wed, 14 Jul 2021 10:56:46 -0400
X-MC-Unique: jM9S0MomNj2BPVoM-VMvvQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z4-20020a7bc1440000b0290228d7e174f1so537813wmi.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 07:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=66mpSeLPShBX209PcEQqq6I3DL4h5/75RHs3fAbCrCo=;
 b=e1NktAW+8Q30IA/RiTP396UoSfz70sKF9XPk4L286kVKaOA+eiKIM9eCLOD0qITtJ0
 tamEIbTZHltsMIgf+0KEUDcNXjfI+CqI3wFEb2fWb7pNPVDOarmtzcinpYyyDLPbNw1K
 I1lX3mN4DcDafiC16DNY7H+6BLv1O3kEk0UuMYr/sRxb8NV5W/1TjnqY+L3ZhDlw7w/c
 +dD67qYDccb1CuJT/XD2brItnQJQv2ua7RkXAeVvL1QnC/SP4eS07/PQ3RPq+6ZEvTyG
 TzXVcOVEnvrq7g1V/a0wDI8dI6OfNWbYLJbGHeaRV5iffZi3RLTrgctgZ8DRA9vA9Hbl
 P61w==
X-Gm-Message-State: AOAM530uwd10Y28go7PmySBjwaWTG0rlUFotspjXlL3b0vcW2OTmfMk8
 9ZnyduXfJWgzbb+t2LqeoBFNNpH8Oqm4UxRl7b/0h7UTSGRBr6tefRAn82ii/tjx37QX/K96nQZ
 MYX7T+zHGxQvWiDA=
X-Received: by 2002:a5d:6302:: with SMTP id i2mr13558734wru.366.1626274605803; 
 Wed, 14 Jul 2021 07:56:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGd1JG8eEWw2cwJ7bODaRrPb3Gs0jIXTQ7S7kcNwQCLwnSGmB92BaDRciUXjXbyDgOl9BpOw==
X-Received: by 2002:a5d:6302:: with SMTP id i2mr13558710wru.366.1626274605544; 
 Wed, 14 Jul 2021 07:56:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id l34sm6424232wms.45.2021.07.14.07.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 07:56:45 -0700 (PDT)
Subject: Re: [PATCH] configure: Drop obsolete check for the alloc_size
 attribute
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210714072855.785566-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <78a4a3af-ef79-07e2-e6a1-37d11e5ef7ac@redhat.com>
Date: Wed, 14 Jul 2021 16:56:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714072855.785566-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/07/21 09:28, Thomas Huth wrote:
> We recently bumped our requirement for Clang to at least version 6.0.
> And according to:
> 
>   https://releases.llvm.org/6.0.0/tools/clang/docs/AttributeReference.html
> 
> Clang v6.0 supports the alloc_size attribute. Thus we can drop this
> check in the configure script now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configure | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/configure b/configure
> index a0a32c427c..eee1356814 100755
> --- a/configure
> +++ b/configure
> @@ -3184,18 +3184,6 @@ if ! compile_prog "$glib_cflags" "$glib_libs" ; then
>   	       "build target"
>   fi
>   
> -# Silence clang 3.5.0 warnings about glib attribute __alloc_size__ usage
> -cat > $TMPC << EOF
> -#include <glib.h>
> -int main(void) { return 0; }
> -EOF
> -if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
> -    if cc_has_warning_flag "-Wno-unknown-attributes"; then
> -        glib_cflags="-Wno-unknown-attributes $glib_cflags"
> -        CONFIGURE_CFLAGS="-Wno-unknown-attributes $CONFIGURE_CFLAGS"
> -    fi
> -fi
> -
>   # Silence clang warnings triggered by glib < 2.57.2
>   cat > $TMPC << EOF
>   #include <glib.h>
> 

Queued, thanks.

Paolo


