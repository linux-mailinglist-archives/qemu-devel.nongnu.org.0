Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD092F3133
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:24:22 +0100 (CET)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJen-0002fn-BK
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzJao-00013O-2H
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzJaj-0005eb-PZ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610457608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8XNsI5P4v3FlPNZbAU8BbRbpmUKVNYdfBTmCJX0SGQ=;
 b=gTt4O8xer7m8+58H+QufoUzbWo0eKJQYI5034Wk2c2VFGWnukgIjld/tc3oJv4i5Ngxncb
 EPTLtAOgmD6hy1K8b0R/YF2wAWo1s/9dG5rmLMB92snMQQjIMLOK70S/V8/0beWGcwvl7N
 kJoYzUql28HhiYcLNrArTcJpu51zDhA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-DOHr7kCNOz6nEMPBvV3syA-1; Tue, 12 Jan 2021 08:20:06 -0500
X-MC-Unique: DOHr7kCNOz6nEMPBvV3syA-1
Received: by mail-wm1-f69.google.com with SMTP id d9so367664wmd.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 05:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m8XNsI5P4v3FlPNZbAU8BbRbpmUKVNYdfBTmCJX0SGQ=;
 b=KMmePCUArKpjdQCpRXD7d/FKGlgRcx0AEW4dQW49ee5hl4TWsO0fXbFSbF0nHsxJ8Z
 O3amruDBWIHQaTpafFLuXSaJz5FC0hBOTJlF1/AE8doLFXWmQYV9wLEc+xxN3OVagjiI
 lrtTHIt5XzoWNIYGNmrGHqljI2vAl09qXv8LylBcyT1+9fIwyN9pMWmfnkXwDr2ydyYu
 K3VfZ49M240JNPwcCMIStUqI0cKPTdIlVcoctZ4f7n+aVva5M6X8GyySLqKkdj4B0imY
 dhp59P7JrtL+RJpGUcAIgbyYy5dWZSvaiBC3Pyodpm6KqH04E/3sOF23ZwDywkHHSUfE
 CERQ==
X-Gm-Message-State: AOAM5329C30JNukB+kDVFkfclpRopZA2KnwZam5TnitKiWFdP3jKoMck
 W9+rqz17SNyy7Pu6meKn/ZohQ8L4MPJCip8hxA1X8k69Ls2eV0tP1h07AfDFvp/DunIXiHF0xug
 TQWmEcYDXN0EauEo=
X-Received: by 2002:a05:600c:40ca:: with SMTP id
 m10mr3556571wmh.54.1610457605396; 
 Tue, 12 Jan 2021 05:20:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYG0rdt4ovMlV0yzZbUrZwy6PzQRbipz1i8tk9VNP8lRD/prnFnTiEtVQagiFs2igG0BFAvw==
X-Received: by 2002:a05:600c:40ca:: with SMTP id
 m10mr3556553wmh.54.1610457605262; 
 Tue, 12 Jan 2021 05:20:05 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id m18sm4912220wrw.43.2021.01.12.05.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 05:20:04 -0800 (PST)
Subject: Re: [PATCH] hw/block/nvme: fix for non-msix machines
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210112124714.220657-1-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0d5fc44d-14cf-5fd9-e8e3-2aae48ebfa4a@redhat.com>
Date: Tue, 12 Jan 2021 14:20:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112124714.220657-1-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 1:47 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Commit 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar()
> return value") had the unintended effect of breaking support on
> several platforms not supporting MSI-X.
> 
> Still check for errors, but only report that MSI-X is unsupported
> instead of bailing out.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar() return value")
> Fixes: fbf2e5375e33 ("hw/block/nvme: Verify msix_vector_use() returned value")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


