Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCA2316A89
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:56:36 +0100 (CET)
Received: from localhost ([::1]:48850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rr1-00022c-Gu
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9rpP-0001YA-FP
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:54:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9rpN-0002GY-Cb
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612972492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muC17dFD8wHtxJusF+tyHMmQS0JEYF3/a1h7AOPIoTg=;
 b=d1Y9B6ncv0e91bhlsoWGmNAJcwKVsmbLnTmPVErIe2nCKW2ooSczz/x7mEP5znHw5EBhVF
 QlVZlMVJ4b83M96K+Q6KWBiz2T7zTcrAZ1EvB7P4BK0IZaMnH6cOnqlQdwSz8MzwLyWk6t
 AScDz9TeqQSygtFa2p/AXqeRpT49VsA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-g1t2mUzVOkOte7kGCsqXiA-1; Wed, 10 Feb 2021 10:54:50 -0500
X-MC-Unique: g1t2mUzVOkOte7kGCsqXiA-1
Received: by mail-ed1-f70.google.com with SMTP id i13so2856706edq.19
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 07:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=muC17dFD8wHtxJusF+tyHMmQS0JEYF3/a1h7AOPIoTg=;
 b=hg42V4GPk21cMgoyF599Si9H0ACIvR8sZPLsTFHIHopzhqAkOwjrVIefOQZG36PR1b
 Cxe1oX9UwDQiPR+LDOkWiD/69aHZoYw+j1R7hvoIjTJLg9uS1Vz/lq+gstccAgHG0rZZ
 kf1GhjUEZ/EjOTkrcQXwqGXHHUCf7mLnXaMboXNx0IikOKS+qmrGLfai0duQTAec7ZZ2
 Xeb/F/EdV2Evt/T46kW7am80s+/pxVc17BHDY+JKv8rZwDp9c2ejEr8sHj174scpox4i
 XdleQzK3jfF/fbTuGJoprUx5+ARfK+CZcIdKFde1XEIKVDTpA2qhl4U1gLoRal/eOdwy
 BOyw==
X-Gm-Message-State: AOAM533CTMCF9aBJq94ayN/nVDyu/reWGBbyGuo14Ua+M/QaVUxTQ8fa
 jZ2+xpkdaWgT1Pxw3LJza8PD8tG8U+2wpVO7ZJ9D87Pju02iIrxTi0cuI8lLlJr7CVlfRQwYTzG
 A8Kj0GraiJlfMNaZvqSzHiejb4ZFvesNMq79n9xjX3d4Bw1J9PqLPfFWH7hQOU4uS
X-Received: by 2002:a17:906:380c:: with SMTP id
 v12mr3512653ejc.65.1612972488921; 
 Wed, 10 Feb 2021 07:54:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6bJxwlB8wdHRvP85VK+W6ngAXq5EteE5n+L1QKMzyrYiBEERgaQG1z1pbNOgUIfJM78Cuyg==
X-Received: by 2002:a17:906:380c:: with SMTP id
 v12mr3512637ejc.65.1612972488732; 
 Wed, 10 Feb 2021 07:54:48 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r3sm1379623edi.49.2021.02.10.07.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 07:54:48 -0800 (PST)
Subject: Re: [PATCH] .shippable: remove the last bits
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210154106.20825-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <038a34b2-dd28-0eed-d1a4-dc5ea7d07cfc@redhat.com>
Date: Wed, 10 Feb 2021 16:54:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210154106.20825-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 4:41 PM, Alex Bennée wrote:
> Shippable is about to sunset in May 2021 [1] and we had already moved
> a chunk of the crossbuilds to GitLab. We already cross build
> mips-softmmu targets since:
> 
>   6bcb5fc0f7 ("gitlab-ci: Add cross-compiling build tests")
> 
> and x86 is very well covered.
> 
> [1]: https://blog.shippable.com/the-next-step-in-the-evolution-of-shippable-jfrog-pipelines
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .shippable.yml | 23 -----------------------
>  1 file changed, 23 deletions(-)
>  delete mode 100644 .shippable.yml

Thanks for cleaning this.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


