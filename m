Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE3387668
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:25:31 +0200 (CEST)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwun-00057f-Sx
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwob-0003WQ-8m
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwoZ-0004ws-5N
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YpSyRtFFeS+HwsX5ff+SFPrQMaT7BsRwnlGhMM0hK6s=;
 b=erPdg/g+ih01IOX3rYZFUmDJKbiCLHcFae+rQpR0qwobsm2nSA4dD+IZI5j/Qty+e6Yyhi
 iNAJiRwmcD4EjHJKq0YZFsR39Ham+5lEOX1sR2R4XQHpj5C55+Nc84FTBHT6TuFXKX3PZR
 9EtgHetimc37OwSG7R25LQGJAWybhGE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-QPT5g21cPkS6eX8MyIA0xQ-1; Tue, 18 May 2021 06:19:00 -0400
X-MC-Unique: QPT5g21cPkS6eX8MyIA0xQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so384583wmn.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YpSyRtFFeS+HwsX5ff+SFPrQMaT7BsRwnlGhMM0hK6s=;
 b=j8ZsvNN7iWe5dQ/576xr89VyAjpyz3CNfgMS0iwa1ZQ5HE5kziet5IsGYX+acYA/s2
 cN348DkI/oVPqC5zM3B+eu3aAG00TKagftgOWOAgFZmRfuLMdj7NxAn+WvzlRlC/G67A
 +tRDAFl8Q7up2lM7CzbraFi3JiNyQx6PGxsIBXdBxw+EAGiVXQM4O+b+LfyyhifmQfMK
 0dMbwaFX8ny5h3g7LNfieNL8vqc8MCqkFscw1oTS2LRmtTzxoS5nOdpsFmiEQO+otcta
 AISviyjq7+hiOUwIWo6XPN4CvXJc7giJrnBbnYIU7BSqTQHAbjWRcdRSTVAhdP1f8wWk
 LEVA==
X-Gm-Message-State: AOAM532dKcKK24RjSSErNb8tA3e3qxfHmpZvGjC8VpKIqcnj5oOjU1Dl
 NudgzYeZbJaeamD3oc6muhnQhrIJZzFMHqjJulEYkETYaWlY5btF3w4UYBX3vGlJ/gXnJJDAff0
 6AB/lTyo/ru3KwGc=
X-Received: by 2002:adf:e6c2:: with SMTP id y2mr5846700wrm.384.1621333139277; 
 Tue, 18 May 2021 03:18:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs0bBC78Bc/EUL06ss/karYAY+lNVXqkFIGZ14aSxCZNWZWUbE+xGYN3v9H9Ysiuga2VeNPA==
X-Received: by 2002:adf:e6c2:: with SMTP id y2mr5846685wrm.384.1621333139128; 
 Tue, 18 May 2021 03:18:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b68sm2163425wmb.11.2021.05.18.03.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:18:58 -0700 (PDT)
Subject: Re: [PATCH v2 46/50] target/i386: Tidy gen_check_io
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-47-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d28649b3-3190-de09-32d2-95095bed6af0@redhat.com>
Date: Tue, 18 May 2021 12:18:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-47-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
> Get cur_eip from DisasContext.  Do not require the caller
> to use svm_is_rep; get prefix from DisasContext.  Use the
> proper symbolic constants for SVM_IOIO_*.
> 
> While we're touching all call sites, return bool in
> preparation for gen_check_io raising #GP.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 57 +++++++++++++++++++------------------
>   1 file changed, 30 insertions(+), 27 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


