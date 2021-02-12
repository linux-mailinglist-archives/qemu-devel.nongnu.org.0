Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A21319BFF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 10:41:04 +0100 (CET)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAUwg-0000i8-Pd
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 04:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAUuN-0008J7-Vi
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:38:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAUuJ-0003Pi-Ff
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613122712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOyjXEbMZ6K9evvdm2VSFTMSwfS2pt4EaT1U4Lwaa8c=;
 b=UR6CD677yAjyser67/fqIlGmbRyk4+zNrn43FSLikW/MuCfa58ojq4QqhuRmc0LBZie0hd
 xq0yozP2pchsAntozd4G2hmDL6G4tFpioUNKop8U0oWRZE8uAacbZHap8h9zlwp9xfnR9Y
 MVrRDF0WY3fv4+9/jfxPDJodb/hHrfk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-Jg4Y7m0-M3Kd2V1zLmEfSg-1; Fri, 12 Feb 2021 04:38:28 -0500
X-MC-Unique: Jg4Y7m0-M3Kd2V1zLmEfSg-1
Received: by mail-wr1-f72.google.com with SMTP id w11so4623005wrp.6
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 01:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wOyjXEbMZ6K9evvdm2VSFTMSwfS2pt4EaT1U4Lwaa8c=;
 b=KNnhu5/kaiLkQQD/mr5FAdbsN9bz+YMxULxqFUIoLrQ07D0+HErdAL5qwIimLcJOgy
 vExl3zWfT1dcPg0vu2rDdNzxaAiakT/HZ+44mPb44EPFz4vbzyLRG/5KnKznv6NHFXum
 hiK8acMGKHNi2+WGm+3TfH7QUdFG2b+gEw7ssklyBH2ueKwgBWHH6otmOTGBesV//h01
 xUieKGkrjOF/2nA5kd0Au+5gUQXEvPh2bJ6Cf0wdle/f6l2TcyMWHjVwDgefQZxGxu8D
 dOvXEbVfhhi6+aTH5mRPLGeI7e3nPKT21CZAv4yffsN/VMZa0CKagNDfO4i2WjgsslvI
 IyVQ==
X-Gm-Message-State: AOAM533tJXs+BN9YYU4WYhCeMMJZ7e8QlaQy+NZzGh2cCDVZHfiLOOCv
 IIxaGTSzD8162xSoPwgnqgZ07bBL8DNpd8mwhM+Icd9kAHlk9C99u9ASNVsda1SP/9ak98bo1lf
 pusPvrPeENHtaH+3rvYt2uV9VnCROixtY2M7GX3cIrLSDTRprxD8bFpUc91ogxlSG
X-Received: by 2002:a5d:4e10:: with SMTP id p16mr2387879wrt.360.1613122707508; 
 Fri, 12 Feb 2021 01:38:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUccK8ybSZTDIQ1uS7a2dewGgGMG08G1JwYQisWCrqZgBiZ2qiXs5/PyQqeRuz4fqlaQ+J2A==
X-Received: by 2002:a5d:4e10:: with SMTP id p16mr2387855wrt.360.1613122707299; 
 Fri, 12 Feb 2021 01:38:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q15sm9394032wrr.58.2021.02.12.01.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 01:38:26 -0800 (PST)
Subject: Re: [PATCH] qom/object.c: Fix typo
To: Doug Evans <dje@google.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <000000000000530c7105bb191b33@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <47ac533c-b04e-76e0-0d84-fdff05be71e7@redhat.com>
Date: Fri, 12 Feb 2021 10:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <000000000000530c7105bb191b33@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Doug,

On 2/12/21 1:56 AM, Doug Evans via wrote:
> A simple typo (noticed by inspection).
> 
> commit ccdffd2c10c5e4447d5e462a6ad2f351df502dee
> Author: Doug Evans <dje@google.com>
> Date:   Thu Feb 11 16:29:13 2021 -0800
> 
>     qom/object.c: Fix typo
>     
>     Signed-off-by: Doug Evans <dje@google.com>

Your patch can be applied with git-am, but with author
Doug Evans via <qemu-devel@nongnu.org> and contains an invalid
commit reference.

Can you use git-format-patch which inserts a From: tag so your
email is properly set and you don't have to worry with the issues
with your email provider:
https://wiki.qemu.org/Contribute/SubmitAPatch#Use_git_format-patch

> diff --git a/qom/object.c b/qom/object.c
> index 491823db4a..6a01d56546 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -695,7 +695,7 @@ static void object_finalize(void *data)
>  
>  /* Find the minimum alignment guaranteed by the system malloc. */
>  #if __STDC_VERSION__ >= 201112L
> -typddef max_align_t qemu_max_align_t;
> +typedef max_align_t qemu_max_align_t;
>  #else
>  typedef union {
>      long l;
> 

For the typo:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


