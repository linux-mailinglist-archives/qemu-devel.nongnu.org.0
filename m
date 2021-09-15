Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6F540C7D9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 17:03:33 +0200 (CEST)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQWRg-0007JQ-CO
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 11:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQWOE-0005tZ-8H
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:59:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQWO7-00019a-B0
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631717988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5qwegczCIuEFn6juUZeNhuH65RnZejdzJTateyrGm0=;
 b=iIupRMOLbFBHMu5Z6SqeWatcRWwn9FqBiqoCoF3bpYr/HdMKCGqvaTP3EwUMuCHLsaq/UH
 9hsUUt87pX129ab5ybR71GWXZtF+sPQhztxMz9roXpYtXKigvoxf836J3X8uiJahVeMXdV
 jnmmmcHkSZusvqyX23fe4g+qafw5Yys=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-0NOC2uXbNo6scfutVTFZCg-1; Wed, 15 Sep 2021 10:59:47 -0400
X-MC-Unique: 0NOC2uXbNo6scfutVTFZCg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j193-20020a1c23ca000000b00306cd53b671so1589154wmj.1
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 07:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z5qwegczCIuEFn6juUZeNhuH65RnZejdzJTateyrGm0=;
 b=Pn5J+y5SbYu/CF/wF7doT3nYAtGNrcqRcutcu2E8xxkJhKN6ZbfIGVGP3RcYIWXyQ3
 VYzAYsbwcM5SQuXP3oUKDM5Iiph1peeJoweLZQYnBwbvzhEuqQrkH/IOdmVtzNgBvJUr
 2U+mT6EYaZnpSoR7L9wdfhopPQFJuxBGv2a1zhahvf2Vu9ro7LtLIhQocERpXTmE+z5m
 J6q4a4Z0J70KCtw4S0Tn705ADMJF0qXsqVppVRQpSNeA2t82eb1fqzUE+3AVRzUeY2qc
 iWuFzqJXZktWRyZgtHlsJ1soAxxaRfNmQwDTKAxkVNIoWlPTQsx6AzOxU/GDGRMDC1PE
 PYRQ==
X-Gm-Message-State: AOAM5329wIA48WrbHSX9EA7pYGOTlUZfTEgV/4/g9RED+LMLCC1+tfhB
 gjVHvwrKsi87nB3dog3D1k2dnTgV+r6LtKeqVRzah9CUof4fbXyQ1M1OGRvmwVuYaH2ATFaLkD3
 6fbpaFmjokcT0kJY=
X-Received: by 2002:a1c:1f09:: with SMTP id f9mr160521wmf.58.1631717986599;
 Wed, 15 Sep 2021 07:59:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3GAPb6Py6qR1dBVeOVP7kG/gz6xEjTPdPY3TO5uJTjBnj2+aVLFLSn18gAVRRfyg7PvzP5Q==
X-Received: by 2002:a1c:1f09:: with SMTP id f9mr160506wmf.58.1631717986432;
 Wed, 15 Sep 2021 07:59:46 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id l10sm240980wrg.50.2021.09.15.07.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 07:59:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] gitlab: skip the check-patch job on the upstream repo
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210915125452.1704899-1-berrange@redhat.com>
 <20210915125452.1704899-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b48898c8-d20f-0bd7-279e-3dae5fa47930@redhat.com>
Date: Wed, 15 Sep 2021 16:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915125452.1704899-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 2:54 PM, Daniel P. Berrangé wrote:
> The check-patch job is intended to be used by contributors or
> subsystem maintainers to see if there are style mistakes. The
> false positive rate is too high to be used in a gating scenario
> so should not run it on the upstream repo ever.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.d/static_checks.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


