Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C1247BBC5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:24:37 +0100 (CET)
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzaRp-0003nt-0h
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzaPD-0000sq-Dh
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:21:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzaPC-0002yf-4U
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640074913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07GhwGn7j4ae+u7hh5YvN2Jnt2naPhaMay1KTTkLNlo=;
 b=Ei1WubABxCoGJiJvCsPxD2PmkcCKYnr0JJyE4n8pI74donhJe8CavNF5GVBZSeacvvgPCn
 kDM5vlRXKmvUDMFhIYChcEw7DLcq6vKZAXOiX49v7D6Dl12dANbj3bpJSvpGsjTMZJ2/tC
 g1VS2aaK/A0av+P1SNRhZstl2chb9yA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-NHdrxcxaOvORPQswjw5eGA-1; Tue, 21 Dec 2021 03:21:47 -0500
X-MC-Unique: NHdrxcxaOvORPQswjw5eGA-1
Received: by mail-wm1-f69.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so2604406wma.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 00:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=07GhwGn7j4ae+u7hh5YvN2Jnt2naPhaMay1KTTkLNlo=;
 b=k3vaKoOae8C5jFRtjUeAKmh++jksEu5HYRwxBsNaXjjQFVc0INsrL5N75wp8tGez7N
 BKQBGMdcD/nfkHlToVS9sIv9n2iCt0Ocw2yYd9q7BPt4F4fvy5rfsWi7YRku2ND7O/FJ
 5+OaDGTNwtIk/1+BMr/0VSt1Cp6JTx5cTcKmUfLDJyN9M+b1SGkLP8SG6X6h+HDnkTjA
 uVN+1/r4v9bGrur+fn3zZMebBzFKrpRYbQizQk3XfvTTeuHERfDQyLAILceH8Kop1p0u
 OiaYM0LReo+euS4i7a/ubm5ty8bawnxW+H9u9cgnnacwn2bNOWszfbcmCViOEkE52UNc
 rWig==
X-Gm-Message-State: AOAM5328OIL+vs2vt+4MXefimSeLDgLmLr/2QawwWT+bUuO0VdGUKA0s
 VfZ6Mwd1xfxhPTAU+5hx8ZW09XJEi1dC6WJM6tVVHVfU9/ds/wWUjIaum37n3YbGw6d6WR0ANZB
 Hy7UNtEy5RrjOFlE=
X-Received: by 2002:a5d:5912:: with SMTP id v18mr1636232wrd.144.1640074905647; 
 Tue, 21 Dec 2021 00:21:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsw8xESniN3p3Vyc1PzD4kh0dNPuoImepIKvhuaZX4PTGmS0Dy+FADGqYmZicWvPkz5mGibw==
X-Received: by 2002:a5d:5912:: with SMTP id v18mr1636217wrd.144.1640074905440; 
 Tue, 21 Dec 2021 00:21:45 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l4sm4268562wrm.62.2021.12.21.00.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 00:21:45 -0800 (PST)
Message-ID: <424a4ea1-b6db-c0c9-fcd8-5d567ce03195@redhat.com>
Date: Tue, 21 Dec 2021 09:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] MAINTAINERS: Update COLO Proxy section
To: Zhang Chen <chen.zhang@intel.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-dev <qemu-devel@nongnu.org>
References: <20211221080400.1492980-1-chen.zhang@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211221080400.1492980-1-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 12/21/21 09:04, Zhang Chen wrote:
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1de6ce6e44..5479b9376e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2983,6 +2983,7 @@ F: docs/colo-proxy.txt
>  F: net/colo*
>  F: net/filter-rewriter.c
>  F: net/filter-mirror.c
> +F: tests/qtest/test-filter*

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


