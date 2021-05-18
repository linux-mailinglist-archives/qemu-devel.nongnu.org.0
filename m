Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAEC387585
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:48:13 +0200 (CEST)
Received: from localhost ([::1]:60970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwKh-0000QU-Dv
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw9K-000173-Ls
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:36:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw9I-0005Gp-Lu
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9iJKJoO0RFB8cYUzc8Ie43r5Mb/c2uuenhTiWoSgQIk=;
 b=UY/c+Gb9paKb9PHxi4QW5NcRvx0Y94KUCeGok38rGmWhdIVz+WA96+a7o58yiue4soVXFT
 0bMaHPueMr5UUSDngPNFFR28ga97XQeutnOCPpA/grVPPTWu5C669EosUdlkVKV5GAHBz9
 pvQUPO9PzJk6U01YwW8NdDG+2/ZV+YY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-PVtAaup5OIyEiyJD0A6iLw-1; Tue, 18 May 2021 05:36:22 -0400
X-MC-Unique: PVtAaup5OIyEiyJD0A6iLw-1
Received: by mail-wm1-f72.google.com with SMTP id
 x82-20020a1c63550000b0290158057efb6dso811702wmb.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9iJKJoO0RFB8cYUzc8Ie43r5Mb/c2uuenhTiWoSgQIk=;
 b=jySp7DDvMAjA0/kdBktdNn7u1vv3whN2TOUWzK6KYNJWwT+oyuOOvFJvX6CrBeG8yg
 zWHELIPP8v4yb8NYn38Eggrn6HVq3R4fFCpIDGJSrtC+olpFeCEpfnwpQbWh6eKUBaDv
 dA5F+1VU0T7qh5HMSqDg9jtDWZWN7xs688iHNCEEZE9EAMuFWWgSsm0ht7BgacQlylbF
 rM5/knQ7FRl1K0GbRll7X3i++IsuScbl7kOvGIMDGmvORUAVkacZqUAhhCKBz+2XW6Bt
 DKcY1he+vdw8Mh6Mblb2WTOtmzyD9ZlRu1bEkZGTcJ2xSKTLlYb73cYEbu0XdP4gfSiD
 HSfA==
X-Gm-Message-State: AOAM530PToPOTQ6eaeA+Hn+ugV53UAU9/aKSSuDf/HwY2+iPBUtTlZie
 qN6ciKfyxjoUoue3yD5rI9RbkpCxdOehCtsZolpf+2UEUlH95LsGHIXGKcFiUTKvDg8shEtHWpL
 V3nXY2jI/rv6qouU=
X-Received: by 2002:a5d:4385:: with SMTP id i5mr5719114wrq.192.1621330580444; 
 Tue, 18 May 2021 02:36:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1FFh7iFTCIyAKlbthQDXTYZhbADR9DVwIzum8b5WHVUjNAabI/ZWU2Vk0Q4ViP8mCTeOhcQ==
X-Received: by 2002:a5d:4385:: with SMTP id i5mr5719088wrq.192.1621330580299; 
 Tue, 18 May 2021 02:36:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f26sm2079183wmj.30.2021.05.18.02.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:36:19 -0700 (PDT)
Subject: Re: [PATCH v2 25/50] target/i386: Leave TF in DisasContext.flags
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-26-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3a88ae45-09b6-2e41-5977-879d54a5690d@redhat.com>
Date: Tue, 18 May 2021 11:36:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-26-richard.henderson@linaro.org>
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
> It's just as easy to clear the flag with AND than assignment.
> In two cases the test for the bit can be folded together with
> the test for HF_INHIBIT_IRQ_MASK.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


