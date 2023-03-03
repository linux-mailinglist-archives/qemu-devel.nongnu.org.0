Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7AF6A9BE0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:40:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8Rv-0004SZ-2H; Fri, 03 Mar 2023 11:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8Rs-0004MX-Vg
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:40:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8Rr-0007yP-C9
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677861598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHFMj0YyK/67OTxw0LeU9NShKXFOH7glGHwzeAtaiaw=;
 b=C7Wmf/R0adCql+H88mF7pWo3TrwUTCwlwKv7cS1CYW/jyaSeTucHdbdXnh6G6FGkmnyP4J
 fgxCoOQso4t996B6TlF007xp6F3iYKMmKk6I+qmC5erw8QKcZpg9VWaZR12hcApzX0388y
 4P7dMbYN0vu/nTEHIYk8syX63PDsE44=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-p9we-j45Pci1i1aKmUOZ6A-1; Fri, 03 Mar 2023 11:39:57 -0500
X-MC-Unique: p9we-j45Pci1i1aKmUOZ6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so1240109wmq.6
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DHFMj0YyK/67OTxw0LeU9NShKXFOH7glGHwzeAtaiaw=;
 b=8Ht6VFUnV3/8VD7ZhvtkLCNXy5PPZ42vt1UlM6cuvDA2EGaVCOo09LNct4iodYBzFo
 rCshZCkSLkwofBQca2d7f/7iPlvPNnnluEOQfVBbXfEmOnzVZJFGqYGbJMgmjAgrXx9U
 pUEQWslXrd+0YPPnh7gTb+pPvxBAjiOK/c8PJvS4MnJSG0nh47hIlqwdAXyrZq88HsLG
 Xu6ag7PkpLV3iN//zkSvhAZa15MPyjB7Ps2c8Ke0fRAHJqzLOpkJaD2+3Z8civRvDlE1
 +csU+3N9fhpAtEqKhG/mF9DqnSPd9dZNpDqaSCvTvdxas4rrKlXlZA+ABCFuo+EH1D34
 2Xaw==
X-Gm-Message-State: AO0yUKVYJ8vU9p7VtQzaobRRdzP5WL/ATXgfwifs21zrzRURMqhTC6Fc
 oizYc/i6mKmVuH+E1hcDPLF1MKVGWx2URyWQoCpX1wAVcFh7pHG5lmIXmTPbiFAION2Gd2r5io7
 GedHdHsOZ7tExEWY=
X-Received: by 2002:a05:600c:4449:b0:3e1:fc61:e0e5 with SMTP id
 v9-20020a05600c444900b003e1fc61e0e5mr2092275wmn.33.1677861596546; 
 Fri, 03 Mar 2023 08:39:56 -0800 (PST)
X-Google-Smtp-Source: AK7set81Po/ON+PhY7tFR5dlf/7VVVZrVwgUk77rXrgOwxfGdet/oacsCKAp5CfdlxGmBuK1qcGDBA==
X-Received: by 2002:a05:600c:4449:b0:3e1:fc61:e0e5 with SMTP id
 v9-20020a05600c444900b003e1fc61e0e5mr2092256wmn.33.1677861596246; 
 Fri, 03 Mar 2023 08:39:56 -0800 (PST)
Received: from [192.168.8.103] (tmo-099-97.customers.d1-online.com.
 [80.187.99.97]) by smtp.gmail.com with ESMTPSA id
 v38-20020a05600c4da600b003eb68bb61c8sm2492961wmp.3.2023.03.03.08.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 08:39:55 -0800 (PST)
Message-ID: <94a2b02d-cfe0-57bd-fc14-0215fa7d4f92@redhat.com>
Date: Fri, 3 Mar 2023 17:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 6/8] iotests: always use a unique sub-directory per test
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230303160727.3977246-1-berrange@redhat.com>
 <20230303160727.3977246-7-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230303160727.3977246-7-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/03/2023 17.07, Daniel P. Berrangé wrote:
> The current test runner is only safe against parallel execution within
> a single instance of the 'check' process, and only if -j is given a
> value greater than 2. This prevents running multiple copies of the
> 'check' process for different test scenarios.
> 
> This change switches the output / socket directories to always include
> the test name, image format and image protocol. This should allow full
> parallelism of all distinct test scenarios. eg running both qcow2 and
> raw tests at the same time, or both file and nbd tests at the same
> time.
> 
> It would be possible to allow for parallelism of the same test scenario
> by including the pid, but that would potentially let many directories
> accumulate over time on failures, so is not done.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/testrunner.py | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


