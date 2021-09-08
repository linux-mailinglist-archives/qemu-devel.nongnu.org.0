Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC34403673
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:58:16 +0200 (CEST)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNtPL-0008Ew-I8
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNtMY-0004fn-NT
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNtMV-0003V3-En
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631091318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHJ9pXASVH32jEc3Z2M7vn33npS6kMfAnj+/wiuXHRc=;
 b=BweYTKyYcRq1x0ed3bYD08uA/w1FYigKJLm9Gz0vlquLf76skeMADawYefoJZ1gpvrGQdt
 jV0RwTtgcTA9cgCn9LH9TaHGewK0+Kj1hIXQ+TrKz740rLFiW9nvrHTFU3QU1umLs6sOmb
 Pzn9Eq3WeyknaevUojprFzkckzx0eSg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-I8odt-C9N7OL0JrkiqHIMQ-1; Wed, 08 Sep 2021 04:55:17 -0400
X-MC-Unique: I8odt-C9N7OL0JrkiqHIMQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 e33-20020a05600c4ba100b002f8993a54f8so757392wmp.7
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UHJ9pXASVH32jEc3Z2M7vn33npS6kMfAnj+/wiuXHRc=;
 b=lyRKQBEh1hxs5mXbr2r0j88/8wVE5jT/Bl4mY/kFG/VO/XWF/PchgW4aE7yD2O9NG+
 9oOGn+KJSN6/IvXvbwnqTbTMFdODySqSaXaHnTx4fYjoiu0aJh5fJ5eHNFdziP1lRsPc
 wByhMHDqO+y1YXO9cDZwhK9bnkCcUmJkFPR95vlSTrp8gmeRKLFyQqP9tGG9qSLhGJa7
 1XXrYCYnUoPvWTjWo4lcY/Qj/ec7JAtwrNfbAYZEoInUrZ4hhxQBU3zndBG1aJZoTjco
 hHu26T8qK1fsFnuHK3XJRNtzbCLmKYL9M/wqGHsGeFHcahr6K4IQ3dEiaP7nZL3ZMRNH
 fM9g==
X-Gm-Message-State: AOAM530QOAaUC0Q4eLHT6EGf1vlDuO3S4WauPlygXlhl09zK5PeSUZlJ
 eLHz+OJXOZ6Q10kvWCDPYcyyNnj6gPLF28ntbTzDkI8QLLQ0N5d9DrCs3s4Ua1KfvmrRD0b/vL9
 ZtVDngRunPq/L/rI=
X-Received: by 2002:a05:600c:4e87:: with SMTP id
 f7mr2463573wmq.191.1631091316378; 
 Wed, 08 Sep 2021 01:55:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj1YsyyyNsYnHU/+JpXCvA9LSDxzDRb/0ACGeiRNRrNmVpCRPCwME54IE2N4w4HlmU8KKSeQ==
X-Received: by 2002:a05:600c:4e87:: with SMTP id
 f7mr2463551wmq.191.1631091316146; 
 Wed, 08 Sep 2021 01:55:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm1509838wrh.13.2021.09.08.01.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 01:55:15 -0700 (PDT)
Subject: Re: [PATCH 3/7] i386: Add sgx_get_info() interface
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-4-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b8008d89-1b18-de17-59b9-557e59f499b8@redhat.com>
Date: Wed, 8 Sep 2021 10:55:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908081937.77254-4-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: seanjc@google.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/09/21 10:19, Yang Zhong wrote:
> +    if (x86ms->sgx_epc_list) {
> +        PCMachineState *pcms = PC_MACHINE(ms);
> +        SGXEPCState *sgx_epc = &pcms->sgx_epc;
> +        info = g_new0(SGXInfo, 1);
> +
> +        info->sgx = true;
> +        info->sgx1 = true;
> +        info->sgx2 = true;
> +        info->flc = true;

Since this is querying the actual machine, it should check the CPUID 
bits of the first CPU, instead of just returning true.

Paolo


