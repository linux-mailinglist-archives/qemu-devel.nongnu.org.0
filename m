Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEAA4DC75A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 14:14:25 +0100 (CET)
Received: from localhost ([::1]:59748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUpxP-0004n9-MI
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 09:14:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUpwU-0003tI-BV
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:13:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUpwQ-00051j-Pd
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647522801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwsVN7wJvmrJaXqnX/Xbmtw61ZQZs14zytBuNW0It5A=;
 b=ESkrOp/FV/TnSCptuqPcihlB53KUxmbdqyHQ+hMks29lyGHJpqRwBoMtMoVqhtxaposrXh
 GVavLMMy8TZA2eE9B/0M+BqBGoFCrz17jajKqq6TjQB1TDyecIYpksApSJXFzeNqAk895e
 IMMw4v2ZL9TFGFY10BldZFHvVxxLO58=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-fyxEVtdKNg2x0gxnuS0fdQ-1; Thu, 17 Mar 2022 09:13:20 -0400
X-MC-Unique: fyxEVtdKNg2x0gxnuS0fdQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 v9-20020a509549000000b00418d7c2f62aso3085977eda.15
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 06:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wwsVN7wJvmrJaXqnX/Xbmtw61ZQZs14zytBuNW0It5A=;
 b=aUxqwCaWXqSME4PN10Oa8S6+O8bMgBKYbWu9c2A99hm60hS7d9ib4OkSXbx8YgYCM6
 u5zreEzCsOy5KmvN4vRBZ1s4O7eN5FcdKG/KjoqGKbQZfxzprBDoUkMb1NDYoJvxycZs
 T32xn21LIDijry3Ntk0SzlYrYowsCCgp2qMpDsIN9y+jHpj8clO4j2MYVmri3fUaAJmH
 aCv8HjWHvJpH3wVOFIe+5DTopj4uQtClr2p601wc4KauEi+r89UnVP9G0P77+QhViIsA
 PtmijzDYF49Bf/cMp6Es4wNBTdSSS3hUKPVBRodz4jl6QJVPU+8c7P6pmTCbNMCQ+XnL
 AAPw==
X-Gm-Message-State: AOAM530jz/2gsNJ6CZxGTPL+/V18EJ2dk1t13SDeWS572rTQ/cKOeVWl
 3341SNtfPYMuf8p5m5jFJ8YkbDbewZLCqdhXbO79Rp4OI9/AwSBnYAoUeVBLJrBWx2CGIF5x+Vk
 /cmgdiItrkjS/s6A=
X-Received: by 2002:a17:907:1c0a:b0:6da:7ac4:5349 with SMTP id
 nc10-20020a1709071c0a00b006da7ac45349mr4328188ejc.596.1647522799196; 
 Thu, 17 Mar 2022 06:13:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzJ79W/bkZQHqtGKHAaMQa3paStQVHpl+Jy4JjQjtQob9UD4zB9fgzi32DTO/HmxrYG20oaA==
X-Received: by 2002:a17:907:1c0a:b0:6da:7ac4:5349 with SMTP id
 nc10-20020a1709071c0a00b006da7ac45349mr4328157ejc.596.1647522798900; 
 Thu, 17 Mar 2022 06:13:18 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a1709065d0d00b006df7dfa2a51sm2179418ejt.132.2022.03.17.06.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 06:13:18 -0700 (PDT)
Message-ID: <6b54a2d2-6933-8bd4-4ff2-77d0b98551c2@redhat.com>
Date: Thu, 17 Mar 2022 14:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/14] iotests: use qemu_img() in has_working_luks()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-11-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-11-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:54, John Snow wrote:
> Admittedly a mostly lateral move, but qemu_img() is essentially the
> replacement for qemu_img_pipe_and_status(). It will give slightly better
> diagnostics on crash.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


