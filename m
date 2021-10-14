Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926DA42E214
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 21:37:33 +0200 (CEST)
Received: from localhost ([::1]:42386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb6Xk-0005Pk-9B
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 15:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb6Te-0001xr-Oo
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:33:19 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb6TW-0004Oj-LQ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:33:18 -0400
Received: by mail-pf1-x435.google.com with SMTP id o133so6331643pfg.7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 12:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N9P+c+AYUqAY9PD4JMvREno5umvgtEkpEcg+fnPA8WM=;
 b=EVqAo+M+zgDvykFYBZbRuco5niwm9HsSGpOg4siCVXUaGw5G6MXzelCfNquJnPAQKD
 wqC4ov2uSPQs2jJYEO3diYahBG3CCFVta0Kpq/1YS3Bd7GuWrTcrw/ZZt/gKLYltjbQk
 UBzUsy/hlWEX+nQOOHMz6Qsdxwb6YdOJG7CNAamUDTjsGpfhDv5QfctyU/XDFe8D5+Eu
 ef3iAVrOpcumjGWlUpaYYrv+UBFBk0ZqnVqav0q8U2X6/vXQAOjgwO/3zcoPG/bZRlge
 8jsbe9TxsslHykYh6BJZAVFB4Up0aUDX2Mor6h5yl7I+jX1bGL+/ymzoG5MhyhGUbtZB
 g5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N9P+c+AYUqAY9PD4JMvREno5umvgtEkpEcg+fnPA8WM=;
 b=ybiq3xl41saVnpAp4oMQkf34NCCe+Nr6ckEvPHF9Ej/5m08bSgMubJ5PBv8OYhzcCi
 ZmbGop89OYWUPzrzeGjG5d6kGAK0guQBL5lnuG7YWw2qQ6Y+kwCNEAU4gZwL/gHlYIiY
 Rarfnh6z9n0AKP27leS5ffmPooALX2Li+U28rM722xi5nxCUrSLwpLWNzhWrmcsrvWz9
 vEZHxiy55+OhgEfGPAw45TY1a7Xvf8Q92fyNGRNPbZfydkfrPKmY+2lqXruw603obvyV
 QKrfus44sNgjeL3doeufYjUeLIN2UV2smfYg7AjrC5+COElzXMwVIbGEa8ASNo8qN42O
 BMjw==
X-Gm-Message-State: AOAM533bZEEHxTdHb185ygwwos7OgQLISVduU3P1pnVayZDN9u4NRwWv
 5LS3aiLIgglndeLmm4BuC6jzNg==
X-Google-Smtp-Source: ABdhPJwttKYUjmuXEkJto6YjyHcH22/VwN5V6yIhRYeKmskFi51djn8N4HrX8qyaCVrO9j1DNc8/fg==
X-Received: by 2002:aa7:94a8:0:b0:44c:f3e0:81fb with SMTP id
 a8-20020aa794a8000000b0044cf3e081fbmr7243781pfl.6.1634239988863; 
 Thu, 14 Oct 2021 12:33:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d24sm3130870pfn.62.2021.10.14.12.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 12:33:08 -0700 (PDT)
Subject: Re: [PATCH] Fix %#08 misuses
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, eblake@redhat.com, peter.maydell@linaro.org
References: <20211014185245.69803-1-dgilbert@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db332dc2-0e17-5b16-dbbf-377b9d03cffc@linaro.org>
Date: Thu, 14 Oct 2021 12:33:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014185245.69803-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: alistair.francis@wdc.com, shorne@gmail.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 11:52 AM, Dr. David Alan Gilbert (git) wrote:
> Although I'm tempted to think that perhaps we should just
> prefer '0x%08' which seems clearer.

That's what I think we should prefer.

r~

