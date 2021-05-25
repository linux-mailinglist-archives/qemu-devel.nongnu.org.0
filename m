Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6810D39034C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:03:07 +0200 (CEST)
Received: from localhost ([::1]:59712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXeE-0006Ui-FG
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llXbj-0003gu-LC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llXbf-00075s-V5
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621951227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lg3P1vCR4S9cfateo9OWgkTvkaZBx7u17Kaqpto4r+o=;
 b=a8szyz3ral+vbQL61wBwril7QHixcLafUou9fnZjfWbnbeZBDCqdRgXhFbZlIV2g+LbS23
 H/e6c7MQXlX0FzkEoih5U3J0aVGHXKmfmX+hAwZ2rI12DsA43rzoII8WgbQ0K4zZ/F/qpG
 Y42cu8YKWsgoO4PvolNMA8uIwdam/4c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-d7cgyy_zPcG7ook7jEoT-Q-1; Tue, 25 May 2021 10:00:24 -0400
X-MC-Unique: d7cgyy_zPcG7ook7jEoT-Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so14487660wrb.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lg3P1vCR4S9cfateo9OWgkTvkaZBx7u17Kaqpto4r+o=;
 b=UsUHi17tp1LOXxrFCTuQ+cDyKUMBCQspRiOzDyfXiLHhfesbl53CHjQvxJgBb9hu1A
 z1DOkBjPi5BO9tyJXVfAwfKEB5gSDgpKDgqZtSkh1KrQlhKjlWqLde+wkD/cUkYu4Xx3
 f4hBt28y7hYHc2GoVCEhDeki5v+3zg4SFpktnrA8ON08TdllvfWlvr1hmpaL9r1fXWdl
 6Au5lQxUrs6kjyzb0SNHZenGoaeX8s1DQwIZdTFB/BlNaxKEy3Nx6HEqYhzXlYd340nA
 IJU7uyb3kOwrpdpUeZ1Wzpa5JzJ19tlHL5fIMncMj0VjHlkmdZReiSHGE4dnsGEFzS1k
 b/Vg==
X-Gm-Message-State: AOAM533L5IxHqItpAaCftQjICcQu+TfQnX5LQFrWWDiJGesjCANfGCaR
 88/3KzZ7hScRNM3WTiuTtabod9N0qSQTW1SxLv/ya+WOAq+DjdscpXGpwW3JcYiJrfOp8PY4icx
 T7bdBGSxkJsrJPe8=
X-Received: by 2002:adf:d20a:: with SMTP id j10mr26700661wrh.188.1621951223151; 
 Tue, 25 May 2021 07:00:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5Cyn4Z4Fqr/nVyxPxI5yCOg5VBEl/SxsqAiAY1zJTPIb9gix8CzUuYOvLbDdNvngM2XUILQ==
X-Received: by 2002:adf:d20a:: with SMTP id j10mr26700641wrh.188.1621951222990; 
 Tue, 25 May 2021 07:00:22 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id y14sm16673575wrr.82.2021.05.25.07.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:00:22 -0700 (PDT)
Subject: Re: [PATCH 4/6] tests/qtest/pflash-cfi02-test: Avoid potential
 integer overflow
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210525134458.6675-1-peter.maydell@linaro.org>
 <20210525134458.6675-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3016ae08-7a61-8c6d-5a25-b9914ab5866c@redhat.com>
Date: Tue, 25 May 2021 16:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525134458.6675-5-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 3:44 PM, Peter Maydell wrote:
> Coverity points out that we calculate a 64-bit value using 32-bit
> arithmetic; add the cast to force the multiply to be done as 64-bits.
> (The overflow will never happen with the current test data.)
> 
> Fixes: Coverity CID 1432320
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/pflash-cfi02-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


