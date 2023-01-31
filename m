Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35684683117
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:15:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsKu-0005Z0-L7; Tue, 31 Jan 2023 10:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMsKq-0005Q6-VM
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:14:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMsKp-0004Xs-Ha
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:14:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675178049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3I2+T0D8OqsI/8y+2QwSas+19xQsEZO1yMTwruAS5os=;
 b=d96fUukk6QcgNrv0NjkSxZqsC9KNPKkRBHYWTVVjHa6p1A8ebzid25rONpvxM7et6FmVeS
 XlpiGDReQGgUXgOOXnfMunkdgUAkDgEaUgmvbK3xbdY7EfEhat/iReCQx9bWc0mSIiSw92
 msJXnf4H5ZoRH547BM+ncAcYQzH1/dA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-394-JyQZHBtcNhuwn0k7qj9Xfg-1; Tue, 31 Jan 2023 10:12:34 -0500
X-MC-Unique: JyQZHBtcNhuwn0k7qj9Xfg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-5063c0b909eso167732937b3.7
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 07:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3I2+T0D8OqsI/8y+2QwSas+19xQsEZO1yMTwruAS5os=;
 b=RoiESd0wkHsUiqsTykMlzaU6vfCW1UGy+vrixaYws0ZpyUuSvwmlnYOklYkNOdKBZ8
 L8fRr39f14d1GUZKrfNK6qrQf+3G0uUQ7Gopw1YFDt42Kq4CrHvQpEufj9BIU1A20Rel
 juhg2PaPaU+SkZMwOgnv2KcOHC6jyd11N6Hzgij1zgMtuYUIPonSiWpUDBeIDK7yFkj6
 tfh4UsbCSppRFoMgkWKOaiGrcJ9modDqEHAsJgTjcxgec9uDbekB1+eEcO8LBHeZepcY
 yaCiQSm7RQixlhLlInqDBnQxF28RorqBAFtgCyV2g7N0TStzM4aKep6Orsw0ei/+/+CP
 kSCA==
X-Gm-Message-State: AO0yUKUVlpgkzAhjkksSVjtwjZpuviH9CCepULJoK40iqkGM81bB3P9T
 zs38tTygfF9AT4cFEGbYS3jrVDAHDl5P8IQ+CPrz19LgMpnuPiodQjqDgptDdY7l5Mm1wG8MGBo
 ZDi/kprzAHF354Sk=
X-Received: by 2002:a25:b2a2:0:b0:80b:e8c7:cd20 with SMTP id
 k34-20020a25b2a2000000b0080be8c7cd20mr15654952ybj.54.1675177948159; 
 Tue, 31 Jan 2023 07:12:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/ce42Xd/DvLi4EiyolM15m+3q+sqi5mtaNaIqAtvmvxX86rYuuR4bR6bepCOxtOZ6NGWY8eg==
X-Received: by 2002:a25:b2a2:0:b0:80b:e8c7:cd20 with SMTP id
 k34-20020a25b2a2000000b0080be8c7cd20mr15654926ybj.54.1675177947868; 
 Tue, 31 Jan 2023 07:12:27 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 q1-20020ae9e401000000b006fc2f74ad12sm10182916qkc.92.2023.01.31.07.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 07:12:27 -0800 (PST)
Message-ID: <c7a1a621-cd62-c8e7-e9d6-f1619749563c@redhat.com>
Date: Tue, 31 Jan 2023 16:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] libqtest: split qtest_spawn_qemu function
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230117080745.43247-1-pbonzini@redhat.com>
 <20230117080745.43247-3-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230117080745.43247-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/01/2023 09.07, Paolo Bonzini wrote:
> In order to create a function that allows testing of invalid command
> lines, extract the parts of qtest_init_without_qmp_handshake that do
> not require any successful set up of sockets.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qtest/libqtest.c | 103 ++++++++++++++++++++++-------------------
>   1 file changed, 55 insertions(+), 48 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 5cb38f90da19..4d9cf919b2f7 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -342,60 +342,25 @@ static pid_t qtest_create_process(char *cmd)
>   }
>   #endif /* _WIN32 */
>   
> -QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
> +static QTestState *G_GNUC_PRINTF(1, 0) qtest_spawn_qemu(const char *fmt, ...)

Gluing the "*" to G_GNUC_PRINTF looks weird, could you maybe put that 
G_GNUC_PRINTF somewhere else?

  Thomas


