Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19197698DDD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:35:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYnC-0008Sx-UB; Thu, 16 Feb 2023 02:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSYnA-0008Ro-Qa
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:34:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSYn9-0006Mh-4C
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676532894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPb4rNiPVH62XA6fMrT3LhZNZV/gCdQNzwieA9CVAc8=;
 b=cbSgTaCtbJPrnidfBDIRGFwfrAGdGDvZqtHDlsYMeQvoe+BxNqESOtMHTl//t89pmcMTM5
 1/doaXzKWWE4FvkwwAiyOIpyJUazYxk/PkCnzKW6BJcgj0h2svPWJxdT9L1/9vn13SagNa
 9ZuOzwwVM8VZNpMBAQIEgvYBiSKl/qA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-dHdgS9GRNX2MWlZxDMVOUg-1; Thu, 16 Feb 2023 02:34:52 -0500
X-MC-Unique: dHdgS9GRNX2MWlZxDMVOUg-1
Received: by mail-qt1-f198.google.com with SMTP id
 g9-20020ac80709000000b003ba266c0c2bso780240qth.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZPb4rNiPVH62XA6fMrT3LhZNZV/gCdQNzwieA9CVAc8=;
 b=bMSXmBBFwkhBlkfjw9hAbM9rlr9KboyDGK+Yp4th69u6wVW26RDa2e6lMVYLwKfKdG
 PaDAJeYiwZfwpS3iDYNQHHQZqOjf9pOxQeIUKef9ZjtOyKBpHUlXOLjhsxXhOC3LN0PJ
 Rq5yhfwDSs8iLLQ7ro6AgcsJdEYXyx3w/mBbpjHdqYmnSFNXF2dGNgQYlhOhNnU9kz9W
 VMra7BNrBIb5XNfHTpKt1r4wJF5JARv0jVgB/u2d47Ji+LB8ycqdxnIymka1qOnaNGb4
 4RegYsAEn5+7NlnZfWDsCNIPYsAjv8ov4qrWSLlEQBPzvMZLNpRYHUxGdEy7ZoJ4eXao
 oEDw==
X-Gm-Message-State: AO0yUKU+kTs6UZUTRN94FGCOHl0GiuYj1TKL22vgN4pawIs5rH8gFV8h
 3DK2Pu/nzp9N8wt3dbVyJlAVDkDGZ6UTBckqrPhx1Nl4R9G/KLZRwL4ICkez5KpmqZCcr4KgYDX
 h7EECV1xeuF+mI8E=
X-Received: by 2002:ac8:5bd5:0:b0:3b9:c074:6e3c with SMTP id
 b21-20020ac85bd5000000b003b9c0746e3cmr9210933qtb.43.1676532892433; 
 Wed, 15 Feb 2023 23:34:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9Lix5CPENztoWwpkljA0119Ts493OEY//wSk5aTq2TQJkXES7BC8Chr7M1XJYlyexCx8VEtw==
X-Received: by 2002:ac8:5bd5:0:b0:3b9:c074:6e3c with SMTP id
 b21-20020ac85bd5000000b003b9c0746e3cmr9210912qtb.43.1676532892203; 
 Wed, 15 Feb 2023 23:34:52 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 c13-20020ac81e8d000000b003b9ba2cf068sm795457qtm.56.2023.02.15.23.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:34:51 -0800 (PST)
Message-ID: <1b0d28cb-61aa-1e5a-f246-5e110ab5df79@redhat.com>
Date: Thu, 16 Feb 2023 08:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/12] tests: be a bit more strict cleaning up fifos
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15/02/2023 20.25, Alex Bennée wrote:
> When we re-factored we dropped the unlink() step which turns out to be
> required for rmdir to do its thing. If we had been checking the return
> value we would have noticed so lets do that with this fix.
> 
> Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


