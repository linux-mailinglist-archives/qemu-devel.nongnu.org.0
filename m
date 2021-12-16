Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1359A47731D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:29:09 +0100 (CET)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqom-0004es-5R
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqjg-0001d8-Ml
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:23:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqjf-0000V0-5t
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639661030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyqJvCZgSeYqSaSJX8CibDEHflrmsRZgXyVxRI4bC9w=;
 b=CwhDvcBAG++9iM8DNVdPuWaE1zDwRTihzWjWE9QCmi80RDvP2SF51L/yRlOW96YXMCRLyG
 UeY26YHuh0eWgEybdcs+NKL7SezQ5kiwxDtxNrl1T36N+LIJDUNfPVvD173acpPGpKRq74
 TiBeJjRQH1zC+Z2+Q2PYZUEMvF9T3X8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-GjD952uANcGlYQtUMIhR5g-1; Thu, 16 Dec 2021 08:23:49 -0500
X-MC-Unique: GjD952uANcGlYQtUMIhR5g-1
Received: by mail-wr1-f71.google.com with SMTP id
 n22-20020adf8b16000000b001a22f61b29cso1532014wra.23
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CyqJvCZgSeYqSaSJX8CibDEHflrmsRZgXyVxRI4bC9w=;
 b=FQK6PggtIzmGQXPT8IafXGzyXVZ62AZewnZiolrMpBD8uz73eaSXvZi8NpLRekc8OU
 WHX4ODuF3NRyXEyjC0EpyZH4HEfkzBtvfYCs/FZyYHT6JRXuGvRcqMNOuGYTF/bOaTQ6
 uGpG1kVAwPs+5C61fs28ImfHibDWHPe6RB+Qt1xPX5ebMGEZrzENEUhV4ltB3PK6SPTK
 JkXLG59ElxI7tALCQat0U0bvg56gcf/coEd3E5Uc4jVB/bQWQOY7H8gnq30z0EWe48Qq
 wiIji/3Qk0+zbR9wkpUS+GcAGDqFQE9RIpyR68D3yrH85F+iWCCrnAiHdEPycicOFyiZ
 Bbpw==
X-Gm-Message-State: AOAM532Z69DGEYpGCSHe33XGaJ1zAn9WYwI4q3zrZqYqEOjorCHLi/mV
 263FKTtSJUPwYP66kiwpsBMJXjklsgCrjLucPAO0nFqmjfVdsUtuvGitGPTWUujq7DVW8IQSoWo
 70JQyyHGB2c7NBSk=
X-Received: by 2002:adf:ee47:: with SMTP id w7mr8929484wro.368.1639661028480; 
 Thu, 16 Dec 2021 05:23:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0pZrE8UAnEzkYNzUKEdZI7UorCBUEtSIc0vJdQ5IP2xuM4xyHiliteNSISmnx2WTCkTCiVw==
X-Received: by 2002:adf:ee47:: with SMTP id w7mr8929467wro.368.1639661028343; 
 Thu, 16 Dec 2021 05:23:48 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id bg12sm5853557wmb.5.2021.12.16.05.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:23:47 -0800 (PST)
Message-ID: <7c4f8cdf-2a8c-35a6-a425-c549de34c9b6@redhat.com>
Date: Thu, 16 Dec 2021 14:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 03/10] hw/core/machine: Wrap target specific parameters
 together
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211121122502.9844-1-wangyanan55@huawei.com>
 <20211121122502.9844-4-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211121122502.9844-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/21 13:24, Yanan Wang wrote:
> Wrap the CPU target specific parameters together into a single
> variable, so that we don't need to update the other lines but
> a single line when new topology parameters are introduced.

Where new params are introduced? Not in this series apparently.

> No functional change intended.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine-smp.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)


