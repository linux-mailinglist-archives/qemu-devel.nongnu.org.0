Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6953A0D47
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 09:10:15 +0200 (CEST)
Received: from localhost ([::1]:37100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqsLu-0003rl-9q
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 03:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqsKY-00032m-Bo
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 03:08:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqsKV-0008Hq-FI
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 03:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623222526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLWJKK9nPpdMslc6TIvD895R3lp1plru5XjLpRho8Yw=;
 b=IX3kojCW4c3Ts8gV/B19GRa8Ld1/oMHL5PD/zGWJdCnHYima7ncTaxSVdr/95Q4+6E6/+m
 pDKGxn/qU/g2jj+mNoeFQP1cyhiwiPy/4PHo1eZZcIA41jlf4aZRuZ9Tb41gQTDgaJCvrH
 9KAQJQXZI2EvDGnKRujf7l2S5iaXPoE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-l1gRRBFaMcalTXJdpFpv6g-1; Wed, 09 Jun 2021 03:08:43 -0400
X-MC-Unique: l1gRRBFaMcalTXJdpFpv6g-1
Received: by mail-wm1-f72.google.com with SMTP id
 v2-20020a7bcb420000b0290146b609814dso1583165wmj.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 00:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZLWJKK9nPpdMslc6TIvD895R3lp1plru5XjLpRho8Yw=;
 b=ZqfDNxKnKUc0IP/DZ/7j5Vze/iczbnFkHz6hv9kaYGeqBmSQWsg9lXIn3VGhtliw6T
 7rQccuxQ71PiZnxjzb8NgVWgBULJjQzOt5DlEvtPArA4ilHAmFYaIOrnNSKUSnYVjycp
 wfB/+eFtOVc5Or90IVY1fRKNl0g7X5uP2JodA7nEC8oYJeQP2DmAfgjoQZYIB1Iu22ms
 sGdKHxr53ysQ96+JP24eWRvgUY7vDWiTSgd0mEGAtwHkJRGzikBA/uQurCo+5QKv+eqw
 6UnVTVqC+Wh9pdWqyoWgstIRPO1r9kgv3TycaPnll6S2w0S8iKee42lT1RocLoangvxT
 KnPg==
X-Gm-Message-State: AOAM5300ySl9SCt+5r0jxtKZiftadpgx1g+u+F/PlH3SNSPVS/RCJgD5
 3sXvsH0BGSur20VDZyQsoIDT2BqzhEbqVRJuzwcuCCT+t3PyvFe9SpLmotephoYZkIHtUGvmfJG
 CymhWJVDf/1n29ik=
X-Received: by 2002:adf:a193:: with SMTP id u19mr26954283wru.9.1623222522779; 
 Wed, 09 Jun 2021 00:08:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLw22xS6Cu7MDAM96YrF0+cXrweeztIvzOBGgKvMVKWfSHykVKUivlNxSCkpPwS+gFllE+Aw==
X-Received: by 2002:adf:a193:: with SMTP id u19mr26954246wru.9.1623222522529; 
 Wed, 09 Jun 2021 00:08:42 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de.
 [217.232.61.128])
 by smtp.gmail.com with ESMTPSA id v7sm22090758wru.66.2021.06.09.00.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:08:42 -0700 (PDT)
Subject: Re: [PATCH 1/4] block.c: fix compilation error on possible
 unitialized variable
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <20210608140938.863580-1-crosa@redhat.com>
 <20210608140938.863580-2-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <44686b06-3d40-cc11-2874-84ecb7827ecb@redhat.com>
Date: Wed, 9 Jun 2021 09:08:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210608140938.863580-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/06/2021 16.09, Cleber Rosa wrote:
> GCC from CentOS Stream 8 is erroring out on a possibily unitialized
> varible.
> 
> Full version info for the compiler used:
> 
>   gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-1)
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   block.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index 3f456892d0..08f29e6b65 100644
> --- a/block.c
> +++ b/block.c
> @@ -4866,7 +4866,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>       Transaction *tran = tran_new();
>       g_autoptr(GHashTable) found = NULL;
>       g_autoptr(GSList) refresh_list = NULL;
> -    BlockDriverState *to_cow_parent;
> +    BlockDriverState *to_cow_parent = NULL;
>       int ret;

Already reported here:

  https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01229.html

  Thomas


