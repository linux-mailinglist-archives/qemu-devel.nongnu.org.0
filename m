Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A62F6583
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:14:09 +0100 (CET)
Received: from localhost ([::1]:60482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05GC-0005o8-BV
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l050B-0008VM-Ju
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:57:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l04zz-0000B4-Gb
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610639837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9zbugeDUOOLJVavBXFvkwMoMMecOX8yT+1f0UZwvpg=;
 b=LbL/3DQWJm028LXN37IgZZ/zD1KpzMUViJPP0DNRqIzLjF0qMgkwj1hM2ZyInRu7vQj9s2
 2QCHHu9ayElOmyX6D6lpG3Y9zImTSTQgBoq9adjzSgDNO3DfGjQpwlDZUZsrX1Dk7ArJhp
 UFcLoYGOZuWWRYQfBt/1OHX0XgzFUqY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-k_kChyp6MEW0pBkAH3qazg-1; Thu, 14 Jan 2021 10:57:15 -0500
X-MC-Unique: k_kChyp6MEW0pBkAH3qazg-1
Received: by mail-wm1-f69.google.com with SMTP id r5so2058572wma.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 07:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O9zbugeDUOOLJVavBXFvkwMoMMecOX8yT+1f0UZwvpg=;
 b=glOvcNMGJ+DaqXkOnJpdXXQ/GHvyQWJX7Ti/xBfQG7zUvPHYYq+43Y8V+TlsqB+0qk
 jLarzUHyMPgYS/dC3oxO7Zuhor9bfmkj5vEWO9hJlgE1Xl3eupTKF046VKVH0XrH1/GD
 G0Q+Ni+sc5YK5ecYEp+G1oC/8oremJUtaevIv3U7+MEYmqPrjELac9+0qg7ytuK4GdXD
 QE2QXenKZNpIZnM3WA+W9QqvBhv3trSCGQbJxwLnzt5tH4hj6V+8023Gvr1QU3pk1MoR
 1a2ONfS0BnGxqwnql+Al7fPjLqtPlJ7kZJuFs1CcOButSfKg01FaT4Y8VI4KuvpaLun1
 utiQ==
X-Gm-Message-State: AOAM5303KdlvgQ2DfuEsytBZHQRNdqbJMuLKp3PVyqNFXiEBuLek3XWr
 Rye9HTE48C9Ef60hmk638l62icEefyjOr1FA3xQ6ESqpN749KUNsdvXFihlr3ZTEbfBJWLrNlf9
 CO1qck3iB9enEmdcNIT6AVJWGv1n0r99HEgNB8QbxTkHBuVb9vtcOEG+dhLdf1BwT
X-Received: by 2002:a1c:9684:: with SMTP id y126mr4709792wmd.2.1610639834141; 
 Thu, 14 Jan 2021 07:57:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyevyCz1lf6pvJl8ym3dHu+lvJK5ohD6t6CRBnpizRasv6ALmRDAy2eJkVpLZv0WkXk5yECzg==
X-Received: by 2002:a1c:9684:: with SMTP id y126mr4709772wmd.2.1610639833901; 
 Thu, 14 Jan 2021 07:57:13 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o8sm9899472wrm.17.2021.01.14.07.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 07:57:13 -0800 (PST)
Subject: Re: [PATCH v3 4/4] hw/blocl/nvme: trigger async event during
 injecting smart warning
To: zhenwei pi <pizhenwei@bytedance.com>, kbusch@kernel.org,
 its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
 <20210114072251.334304-5-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <50f96aea-4622-3ac8-3268-51fa5ad78f2e@redhat.com>
Date: Thu, 14 Jan 2021 16:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114072251.334304-5-pizhenwei@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 8:22 AM, zhenwei pi wrote:
> During smart critical warning injection by setting property from QMP
> command, also try to trigger asynchronous event.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  hw/block/nvme.c | 47 ++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 7 deletions(-)
...
> +static void nvme_enqueue_smart_event(NvmeCtrl *n, uint8_t event)
> +{
> +    uint8_t aer_info;
> +
> +    if (!(NVME_AEC_SMART(n->features.async_config) & event)) {
> +        return;
> +    }
> +
> +    /* Ref SPEC <Asynchronous Event Information Ã¢â‚¬â€œ SMART / Health Status> */

Mojibake UTF-8 encoding problem?


