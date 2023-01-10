Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA8F664A37
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFJLS-0004C5-Bi; Tue, 10 Jan 2023 13:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFJLN-0004BH-S6
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 13:27:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFJLM-0001QD-A9
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 13:27:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673375247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XNuJrruTu5LhyQL2V20YY/ZteDsWCoMTmcv5RHUyK6U=;
 b=gRLbn726Zu9HHxOJ+rDgkW2nijGJT332i0NOy42LfWjCelv4u2qfyN1tJ9i2JwD+0WRo5/
 3HpAt97/sWidh9p1AD1EjJcn9YTcQ8us+lwF1HyjOCuNcIFTDNYLKMHoh70xNv1iiZXQH+
 /IssU+hl9z1FikNHdkMT0Lycd8o0l10=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-yChTELGiNBmcrQXssQzSGg-1; Tue, 10 Jan 2023 13:27:25 -0500
X-MC-Unique: yChTELGiNBmcrQXssQzSGg-1
Received: by mail-qt1-f197.google.com with SMTP id
 ez10-20020a05622a4c8a00b003ab6c16856fso5945302qtb.17
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 10:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XNuJrruTu5LhyQL2V20YY/ZteDsWCoMTmcv5RHUyK6U=;
 b=JM2FOxcMm2TAqAhoLirmXBnZLb9CjC6LcFQAizfIWHvzIxCsRF1fMQMtV2h4JHLuYg
 ku3VJy2OUcUKeFRhzQnAhNHQWjXmPAysgzud1sllhaT7atNc0AD6J6igh0FbHu3zKg8K
 fc+3a+ufFgE1OgoGIega9wParrkmt44sZ+RhCJCVKjJA80b+I2g24oxr2t+pCh/qipFQ
 iX+mIMnmp62bjq4qOzOmeWddGzyuzV9meBE7tzrombdtHZJnlxszYF1pu5bORSKgQLJ+
 cFVLzSxZZ7ocjMupu0D1Kkbq5RT2RaAuqHEYAKfPGuNKLhfKaVA3XP/BDujvoxo9+o+c
 E4YQ==
X-Gm-Message-State: AFqh2kqROFX4QnRmPt8O+c6b2+K1Lzs0q/V+16Mv1j3oVoB2FENsaRfH
 3+/CSjLpQtoW6GmH4SXWIRloJza+8ZTN3GIuwwes1EDBgt9pFnJLVGKgBmU1a4AEbaeNFZ8jBcM
 hLi/ZGeE8XbN7ZCQ=
X-Received: by 2002:ac8:6f1b:0:b0:3a9:7f1d:11f with SMTP id
 bs27-20020ac86f1b000000b003a97f1d011fmr6261927qtb.36.1673375245209; 
 Tue, 10 Jan 2023 10:27:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs5f2sNzuNgBLKxOrQpdWsNLQJDN93gnG54zr5muy5+hrI0db3mSGRfLVEU2sa+wHdn6APdXQ==
X-Received: by 2002:ac8:6f1b:0:b0:3a9:7f1d:11f with SMTP id
 bs27-20020ac86f1b000000b003a97f1d011fmr6261895qtb.36.1673375244956; 
 Tue, 10 Jan 2023 10:27:24 -0800 (PST)
Received: from [192.168.8.100] (tmo-125-180.customers.d1-online.com.
 [80.187.125.180]) by smtp.gmail.com with ESMTPSA id
 bk25-20020a05620a1a1900b006ff8ac9acfdsm7602957qkb.49.2023.01.10.10.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 10:27:24 -0800 (PST)
Message-ID: <5a328f4e-2da3-3db7-7cde-01b8c9abe38b@redhat.com>
Date: Tue, 10 Jan 2023 19:27:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] Makefile: allow 'make uninstall'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230110151318.24462-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230110151318.24462-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 10/01/2023 16.13, Peter Maydell wrote:
> Meson supports an "uninstall", so we can easily allow it to work by
> not suppressing the forwarding of it from Make to meson.
> 
> We originally suppressed this because Meson's 'uninstall' has a hole
> in it: it will remove everything that is installed by a mechanism
> meson knows about, but not things installed by "custom install
> scripts", and there is no "custom uninstall script" mechanism.
> 
> For QEMU, though, the only thing that was being installed by a custom
> install script was the LC_MESSAGES files handled by Meson's i18n
> module, and that code was fixed in Meson commit 487d45c1e5bfff0fbdb4,
> which is present in Meson 0.60.0 and later.  Since we already require
> a Meson version newer than that, we're now safe to enable
> 'uninstall', as it will now correctly uninstall everything that was
> installed.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/109
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Works for me!

Tested-by: Thomas Huth <thuth@redhat.com>


