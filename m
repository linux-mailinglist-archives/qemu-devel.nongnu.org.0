Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6574837A439
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:04:04 +0200 (CEST)
Received: from localhost ([::1]:54240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPFD-00028r-Fv
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPD0-0001Sq-SH
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPCz-00042F-EW
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620727303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pg4TvmcKFSTvuRgsWsqIyIJPyVDk1hwJN2d4wpCF+0=;
 b=SibDmOJot9+3+bw+ivt3Azl1VmMMKmwCLbmqRxVt9eXh8D5Sh7f2tvrizWEficrpQnn9v3
 gdhEsvTZLKIx91gx0o2vnWDTDNSBSlG48Ysseoc1ISR87JOk6cXsUqtIIscnQFH1Hn8Sxz
 oLzlW4/D6Xz3JvH3ouzaaqN+W4JjGLc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-PRuuqnQ9N2O5DwSTGxpBQQ-1; Tue, 11 May 2021 06:01:41 -0400
X-MC-Unique: PRuuqnQ9N2O5DwSTGxpBQQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 s66-20020a1ca9450000b0290149fce15f03so403253wme.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6pg4TvmcKFSTvuRgsWsqIyIJPyVDk1hwJN2d4wpCF+0=;
 b=fUOfIZByNGRkYNooVL2iAXDyiTpnkHBn/lvtPCl5dfjGKxLVHCagDHtyozXHIUVEmg
 +10Jc0RijCaZ+/1t4QgpGw9Gjye3doQ9w3orRmhhiCQC/zjyAOJQO7CiVjcQ8C7R2N5g
 M44C35XG3YddwIkU4hkt+lzMZrvnZ+dwdbxHM5dQicU07eI6LkLiKroQRpvYpjs4QpXR
 xtvrDkPS1mxQl2KiBt1v6Sfu1OuY3m0jrohWMyXz+sujL+xf65eoiuQ2rSe8P1p63Ttf
 p/wCdS1y+UCgxEsypLntIG580o/0qxuR1rEuL7u/nGL1KmIQ+by9rQ2QFPHS6hgQ05Mh
 bVbg==
X-Gm-Message-State: AOAM532z6ujGidTRLSeZJICtyf586Ne8RHwHj4CjY8EEvhVN8Ct5hRUt
 aSiTVh2gWk9lbmua3+XSChuGhw6clL497si/2jVNnCCEcke76i7ohpR8mX7HrTbi6xC9/SuSoRh
 d6a0wARM++CqmTrg=
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr30750011wmc.131.1620727299701; 
 Tue, 11 May 2021 03:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvCKcw3G87/lAeyjVlYbDZyqILNAhk6vtk4WYPPhFRuZ3VT0hzv2zrLOpwvRYncVWgjFVySw==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr30749999wmc.131.1620727299500; 
 Tue, 11 May 2021 03:01:39 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 p5sm22665709wma.45.2021.05.11.03.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 03:01:39 -0700 (PDT)
Subject: Re: [PATCH 05/72] tests/fp: add quad support to the benchmark utility
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-6-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <f2994e26-9f68-cdb9-62c5-f42b3cc23079@redhat.com>
Date: Tue, 11 May 2021 12:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-6-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.05.21 03:46, Richard Henderson wrote:
> From: Alex Bennée <alex.bennee@linaro.org>
> 
> Currently this only support softfloat calculations because working out
> if the hardware supports 128 bit floats needs configure magic. The 3
> op muladd operation is currently unimplemented so commented out for
> now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20201020163738.27700-8-alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/fp/fp-bench.c | 88 ++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 83 insertions(+), 5 deletions(-)
> 

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


