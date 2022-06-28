Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13F255C81E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:55:05 +0200 (CEST)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6AkC-0000YG-My
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o6AdB-0002M8-1b
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o6Ad9-0003KS-F3
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656420466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhTf2P9bOrWBc3dF8qnx9UxondQ4DZL8ncSnluTsMh4=;
 b=TnzbA8iWxsrCwoBInnigLIbdeEumz/Hlu7UgZSCZYLVo3ME8Ktc78FSa3qDNbAUqiW1YQ4
 5ue/0O0jEl9kJYT8M1xYMwzC8e1joLTD/liQUZaWsTC1DfNlLy1bLhEci+7kbzXRw7OXjT
 6xhIqCuwZxNZJViFwsjbjj+gRZ0CQmw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-fhgRkCjgNGyoDtGmGXWBNQ-1; Tue, 28 Jun 2022 08:47:45 -0400
X-MC-Unique: fhgRkCjgNGyoDtGmGXWBNQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 l189-20020a37bbc6000000b006af2596c5e8so6323543qkf.14
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 05:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UhTf2P9bOrWBc3dF8qnx9UxondQ4DZL8ncSnluTsMh4=;
 b=0GgKpi6y2L6jRa9lg2qO+sL7+VOvLHvmq3uP5wzi7G8YfSyAFv3itLJSwPdhxk7rec
 Gr8+RUEBumWy1iRRmnE15GgOiDMLh4PoDjOMlr3obsR5UFSW8nGKlTcjtpR5RvZX1aor
 FPRgTQaawf81wnU/p2e0KT6fRjg5Q5OG5qiFPnoZr/o+CFf799znuD0k7bKXerc/+OJL
 J8WtXF0jb84t+KB9W3vaOdOsvcTEQNcUdamYjnZBShtTNFUeNGpnYCsz2bYyodjhlfkP
 cDKjCYFIHYz6GA8wVvjEaAMlczt4zmIhyhmfZ7Jbsf892vJAejvNx/oBMmTDPgf4GbK2
 werg==
X-Gm-Message-State: AJIora9wAndl8my4kOqfjNnST731YQsoW8PhCqjFX4zsaFbbPS5dS4GJ
 JjZKccNR5yAIweivnQCzm9MoS2vV22IEq7zH01DtMKB/jAxom+gH7Xc0RhRTxgn8luQ9J2QiWAA
 BMD+aA+bBcshuIPI=
X-Received: by 2002:a05:622a:120e:b0:31b:f5d8:c63c with SMTP id
 y14-20020a05622a120e00b0031bf5d8c63cmr855622qtx.316.1656420464774; 
 Tue, 28 Jun 2022 05:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u0W2ajWVpnvwvpl2rjIWElQ2iA/d71hN9jUuJ19F5D6PK255U83c2n95AJArUzmPGm5BbQ+g==
X-Received: by 2002:a05:622a:120e:b0:31b:f5d8:c63c with SMTP id
 y14-20020a05622a120e00b0031bf5d8c63cmr855610qtx.316.1656420464543; 
 Tue, 28 Jun 2022 05:47:44 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05622a130200b00304e47b9602sm9632743qtk.9.2022.06.28.05.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 05:47:44 -0700 (PDT)
Message-ID: <f968139f-5c07-8852-96e1-8a0b62e2b877@redhat.com>
Date: Tue, 28 Jun 2022 14:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/5] tests: increase migration test converge downtime to
 30 seconds
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-4-berrange@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220628105434.295905-4-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/2022 12:54, Daniel P. Berrangé wrote:
> While 1 second might be enough to converge migration on a fast host,
> this is not guaranteed, especially if using TLS in the tests without
> hardware accelerated crypto available.
> 
> Increasing the downtime to 30 seconds should guarantee it can converge
> in any sane scenario.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/migration-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index ac9e303b1f..a54eff6d56 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -47,7 +47,7 @@ unsigned end_address;
>   static bool uffd_feature_thread_id;
>   
>   /* A downtime where the test really should converge */
> -#define CONVERGE_DOWNTIME 1000
> +#define CONVERGE_DOWNTIME (1000 * 30)
>   
>   #if defined(__linux__)
>   #include <sys/syscall.h>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


