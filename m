Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB736387610
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:07:18 +0200 (CEST)
Received: from localhost ([::1]:35746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwdB-0007Qx-Ng
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwXB-0007lM-Vb
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwXA-0003Wu-5u
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApW3ziitQLg2muTXzySGur/9Ytrz6uxxD9y72uf+Nu8=;
 b=RVE1L9F+OljYLCTKomOdNVcLoUTw/8ZeLtWeLMURL4ZtIX5zr+BneJ23przOhH6QD4lK1i
 YXO92lxihifYt8fVkAFdGsYI8uuM2+18Go12Yh4UUUV0lUu6eUnH3Sbpmcq1NyjB68TBD5
 KCtA1L/Gsyaf7T28Qg9yjdzEnP6ocL8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-nV0yB41eNLWxQwS_dNppQg-1; Tue, 18 May 2021 06:01:00 -0400
X-MC-Unique: nV0yB41eNLWxQwS_dNppQg-1
Received: by mail-ed1-f71.google.com with SMTP id
 r19-20020a05640251d3b02903888eb31cafso5470581edd.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ApW3ziitQLg2muTXzySGur/9Ytrz6uxxD9y72uf+Nu8=;
 b=s3tld2YgnAY9tb84ANwB9h9Eq+j8BZ/quPV0F230V2ktPn+j2M91E8bnE+wgtgVCeo
 yQ0B1zDIFUReLmmPNRySJwCvyUiPUI7FwLiWiZP28qDF7Vmv+diOT8cw3uSGiWV/thXw
 8DgceAaOtU7x//9gYL0ygV5V0lKcPu6MlcnMbqK+FKDkWGt9faKj5+BSGJ0GWe8ulJC4
 37CC17IAsdNDhWcSd0ShTzhkPNsRVvaESMwKyHpxZpEgGaOtH7BIgcbULzOVsZGtQg1a
 K8HqYm0OTyk2Y30TjQSThKNJJEohMMBrcm7LeOSM5PcZeOunxvoHlABkU190WkfwGg+q
 gseg==
X-Gm-Message-State: AOAM530atYKkmKPvh/c79XjqF6zsTMrq8gEt3TAbeicUctPT6Z4ywTQ4
 l6HiqrJmarjk3PZXjtEjnPZ+T5A1ULX1eZ55dVAcCNG87h5IORUX11sBGarsZudeutbaa6ekFMX
 2pVyS4BQNtqN4aMo=
X-Received: by 2002:a17:907:10ca:: with SMTP id
 rv10mr5094922ejb.377.1621332059621; 
 Tue, 18 May 2021 03:00:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR4TxcJyBkGzx9FVCbYAxm91YawM9iY1RqUdFdlmIx2QSYtypjaWkhA7V91XmgOwXfRTpQ8g==
X-Received: by 2002:a17:907:10ca:: with SMTP id
 rv10mr5094910ejb.377.1621332059442; 
 Tue, 18 May 2021 03:00:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f7sm13018656edd.5.2021.05.18.03.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:00:58 -0700 (PDT)
Subject: Re: [PATCH v2 42/50] target/i386: Unify invlpg, invlpga
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-43-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b442149f-2d77-1927-2686-ec2dd6ac6da1@redhat.com>
Date: Tue, 18 May 2021 12:00:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-43-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Use a single helper, flush_page, to do the work.
> Use gen_svm_check_intercept.
> Perform the zero-extension for invlpga inline.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/helper.h                 |  3 +--
>   target/i386/tcg/sysemu/misc_helper.c |  7 ++-----
>   target/i386/tcg/sysemu/svm_helper.c  | 18 ------------------
>   target/i386/tcg/translate.c          | 20 ++++++++++++--------
>   4 files changed, 15 insertions(+), 33 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


