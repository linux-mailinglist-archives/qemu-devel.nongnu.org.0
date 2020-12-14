Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA22D9753
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:23:53 +0100 (CET)
Received: from localhost ([::1]:36584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolxI-0000sf-R7
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kolvi-00009y-AZ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:22:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kolvg-0000X4-QI
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607944931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uApf777Wala6/296NW41/dr+laFxrWQ9oEppa0cEKcY=;
 b=aN5GW5IqUqxpuXEYQN605SoJpaVWJu9KdeZyJZsgRGnWZdtu7XEB1FQll4k6YEMxIlWhGQ
 e1AAufGIl5LhsbhltPclI7tZpbJBavIq6WfOH3zeHgNplNLc1NiDHuIlypjbMA3Kr9H+rI
 dS7GwXvYerwDQa1ZjVVmHSn6kfHjaP4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-mSGKuajbMZ2G2BlHXz-_gQ-1; Mon, 14 Dec 2020 06:22:10 -0500
X-MC-Unique: mSGKuajbMZ2G2BlHXz-_gQ-1
Received: by mail-wr1-f69.google.com with SMTP id g17so2013162wrr.11
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 03:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uApf777Wala6/296NW41/dr+laFxrWQ9oEppa0cEKcY=;
 b=LOaC11wrPNVWtihLz8XjFozMwY6J6LpQLSeza9dwURpFf4OXMPlfpinCxKIe9+70kM
 qp6F2aVOQ3KI0bSepotYRUWn4oEyM4Q+jLQBMKwK77VdKd9jko10vAQHHM01lg01i/FG
 Xe3/LRPkszqzn3POjy6cFN9/KID6nd/TIjR8F1zN/Foj/IQuHjQ0AAfMExrGMj/XUSYE
 PRAmyh0WV0dmvnxlKLEWK0fJh7JyWa4VVKrA5ecJcr+izz94vNe7EZXhNl4D1CtVQkPO
 sulDOqp2CYRjl/qkLfJMjNaGD+cKydGlHgmRxuO4UkLf1dxaQphpyVapq8xncuHDrIag
 TrSA==
X-Gm-Message-State: AOAM530EATEoaXm4GKZMLop47SL82DV/DcKBFjdvaDdqTOgkmXE+chKE
 Zq6gG7ZWIcwNy0uUK9vHEcDvxN1MqlaSWdQ2plX50fUYsc8TUPxUBC8m33B9crsD+QKrKSYKDdZ
 EeMwQORY9h1kI3nmMCphLOUpNpUurecTzLRf2wQimLGhsHNDsO96dfnZjGxBBkcMRmXA=
X-Received: by 2002:a1c:6055:: with SMTP id u82mr28229986wmb.61.1607944928616; 
 Mon, 14 Dec 2020 03:22:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoEsX2OrAk2n7OE3EGilYPaf6MDnizju2gCtX3oU4EjEjn8exgxvmkJDtMWEA3aZSPTE/eQw==
X-Received: by 2002:a1c:6055:: with SMTP id u82mr28229959wmb.61.1607944928380; 
 Mon, 14 Dec 2020 03:22:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id 138sm33774331wma.41.2020.12.14.03.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 03:22:07 -0800 (PST)
Subject: Re: [PATCH v4 4/5] configure,meson: support Control-Flow Integrity
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
 <20201204230615.2392-5-dbuono@linux.vnet.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aea1530f-9dc3-0cea-0688-e0f6d482bc18@redhat.com>
Date: Mon, 14 Dec 2020 12:22:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201204230615.2392-5-dbuono@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/12/20 00:06, Daniele Buono wrote:
> +option('cfi', type: 'feature', value: 'auto',
> +       description: 'Control-Flow Integrity (CFI)')
> +option('cfi_debug', type: 'feature', value: 'auto',
> +       description: 'Verbose errors in case of CFI violation')

I'm changing these to value: 'disabled' to match what configure does 
already.

Paolo


