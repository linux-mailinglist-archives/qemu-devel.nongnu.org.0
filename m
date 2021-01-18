Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD312F9C00
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:46:23 +0100 (CET)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1R78-0007Sm-C8
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1R57-0006Uh-0P
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:44:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1R54-0007uc-0t
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610963053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juo0Knj0PHakqWhUiaclcX3+DfYXH1XU/VqsFKd99hE=;
 b=LF3TpdQVGZHQlPMUwu/wAOTwlU4qVuikQX10TEVUjEVCqGcdsy/cFOsCdx4Bgel8xrE3a9
 pYNaDa2ml+SK5dp/QXU5NcrtHGn6gsRoiUMy5/vrkgLsS4be6JLgeSgz71qD2uyq0iaBTK
 aDfo+wXxEnA5pMZnWApoZ9GoNuWt9zo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-zDq_Z18jOm2BIqcvvF9aog-1; Mon, 18 Jan 2021 04:44:07 -0500
X-MC-Unique: zDq_Z18jOm2BIqcvvF9aog-1
Received: by mail-wr1-f69.google.com with SMTP id j5so8022107wro.12
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=juo0Knj0PHakqWhUiaclcX3+DfYXH1XU/VqsFKd99hE=;
 b=ryHpW3B7XVQiDk2Mpcdp0dlaExJXtDbyFaGgLMzhEoU6TCjCiWL0QR54GgNmG+yAuT
 h9x7f5gayfkpJyNluNRkv71tD+7OAlrsr0w/55y+0DBKw+VI+aBF0j3bSUQqC5FNCPs9
 Sv4fE4AzCjIET8cyalIgB9F0WpNOyXUBNOC5C2cFdBOw1eOz3PgSAoF8pSWUost6gx/1
 rYMJCn+vjRDM+/38r1Mu7YJtP1dN14deTlPgRbRI+EHsSpkiwzmnDv+X+NCAdy0/L4D2
 9hwLub+EW7h6VJoxz2G6MvZNC4QHZwV2fKfzZOoToFHSfL+6B5FfaRLiL0lux3sGk0xS
 v0Pg==
X-Gm-Message-State: AOAM5310LgbNE+lGeob08FCwOkjlbFMyxLhTG9Ee9311usslwM5PI4Dw
 qz4s5oKJ85yRV7dv5TFhM/VYNMavWypl55t4MQO2AJtwDQ7bGAD6iVjlUmleeR8vhIHht00nq1F
 W81Yys4PBBNlwoZQ=
X-Received: by 2002:adf:9427:: with SMTP id 36mr15289196wrq.271.1610963046499; 
 Mon, 18 Jan 2021 01:44:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyc0jqY2v+rKGRN12C2mn5NX35ITrXn7MgCfzcumIjwfhKN5BoFzagIIQOvkpADuYMLfr67wA==
X-Received: by 2002:adf:9427:: with SMTP id 36mr15289172wrq.271.1610963046339; 
 Mon, 18 Jan 2021 01:44:06 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c78sm25377725wme.42.2021.01.18.01.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:44:05 -0800 (PST)
Subject: Re: [PATCH v2 4/9] hw/block/nand: Rename PAGE_SIZE to NAND_PAGE_SIZE
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-5-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <537e90d4-8c14-0338-0b4c-ee26caced113@redhat.com>
Date: Mon, 18 Jan 2021 10:44:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118063808.12471-5-jiaxun.yang@flygoat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kvm@vger.kernel.org,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 7:38 AM, Jiaxun Yang wrote:
> As per POSIX specification of limits.h [1], OS libc may define
> PAGE_SIZE in limits.h.
> 
> To prevent collosion of definition, we rename PAGE_SIZE here.
> 
> [1]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/limits.h.html
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/block/nand.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
...

> -# define PAGE_SIZE		256
> +# define NAND_PAGE_SIZE     256
>  # define PAGE_SHIFT		8
>  # define PAGE_SECTORS		1
>  # define ADDR_SHIFT		8
>  # include "nand.c"

Why not rename all SIZE/SHIFT/SECTORS at once, to avoid
having half NAND and half generic names?


