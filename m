Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47A237B6FD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:38:59 +0200 (CEST)
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjSM-00061m-Vp
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjRC-0005B0-12
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:37:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjRA-0005Ze-Gh
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620805063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ey4LzHArlRKXLCCVPHUFQ3BotpZb2rcCCR9e50mwpbM=;
 b=C2Cz6sn9TfygGzn15Y7o3LLDDfLLo0zxUj1h6zimsOQalmc8OWUNQ9dK0nC+T/sIkTQK8S
 XrxYJgGgirWU7DDyEe5u/K6J/8HyvBCVOHLLVWYzPDmP6fxEd7qPK0WMcWrH+3/COIFjKC
 QvTUdO9XrIfgAXKhFCpL7vlbyhlavfg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-J0gNRDQFNCO5iJY4wBhTJw-1; Wed, 12 May 2021 03:37:39 -0400
X-MC-Unique: J0gNRDQFNCO5iJY4wBhTJw-1
Received: by mail-ej1-f71.google.com with SMTP id
 k9-20020a17090646c9b029039d323bd239so6797040ejs.16
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ey4LzHArlRKXLCCVPHUFQ3BotpZb2rcCCR9e50mwpbM=;
 b=iYQEjHYChczfY2tWiRsY0l/iPjvOSPn1CDvuCR/HA7usgzBPk4SeLl5E1bnrRbXMo3
 UJJnekY0re071jJpu/8pMgTXoGk5E7blZgAFGLHZqgiv7OKtv8KVPlVWmF2PkO0Ud+MC
 +zGAtSXXl5Ycmi722cQYLM13LdK28yioC11nPGNB88y68VviqQhD0iuFokz+Tfrrw4pq
 4rioDMVkWfVLF9xgc/0sBz304FYPmtJz51pVWyCeT4mvfdE8eN06vIVVs5LV1MKSmkTY
 4tAtl+bJlhvsRC2AQaJUA7GL/V9epMT8q15bVBH8b0Ddp++US6V2tF16PPzKG45470m3
 NfCw==
X-Gm-Message-State: AOAM533bFLh+kcfLeb8PrFuacp0KpMPyis5BkXjvXuYOuZBaQ4fYjQ4N
 fyOszLRPFjfEEeLK5/QX9LWjdkwEaKQvuwRDlp4Hz1gmCozf1ghqpNNfKQ/CrJT2Wa/Q3Ez7Zvl
 ug+aEBMK71p+pr8A=
X-Received: by 2002:a17:906:2dca:: with SMTP id
 h10mr4396575eji.507.1620805058832; 
 Wed, 12 May 2021 00:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlJjGi0NZCV5Iavrz3ZqYqKSYfsVGyPuj/IQS0Ys6o6txHFKcS9HZyXMMgf1mlTX8i2h7aDQ==
X-Received: by 2002:a17:906:2dca:: with SMTP id
 h10mr4396557eji.507.1620805058649; 
 Wed, 12 May 2021 00:37:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id nc42sm13044175ejc.103.2021.05.12.00.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 00:37:38 -0700 (PDT)
Subject: Re: [RFC PATCH 2/5] Kconfig: Declare 'FDT' host symbol
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-3-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f2c7fa41-c376-66c9-eb51-31120b2d5010@redhat.com>
Date: Wed, 12 May 2021 09:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511155354.3069141-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/21 17:53, Philippe Mathieu-Daudé wrote:
> The CONFIG_FDT symbol depends on the availability of the
> fdt library on the host. To be able to have other symbols
> depends on it, declare it symbol in Kconfig.host.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   Kconfig.host | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Kconfig.host b/Kconfig.host
> index 24255ef4419..0a512696865 100644
> --- a/Kconfig.host
> +++ b/Kconfig.host
> @@ -41,3 +41,6 @@ config PVRDMA
>   config MULTIPROCESS_ALLOWED
>       bool
>       imply MULTIPROCESS
> +
> +config FDT
> +    bool
> 

You need to add it to host_kconfig as well, don't you?

Paolo


