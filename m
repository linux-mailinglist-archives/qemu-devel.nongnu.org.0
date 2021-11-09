Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D4844B22F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:50:39 +0100 (CET)
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVGY-0008JY-4n
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:50:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkVF6-0007cv-O4
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkVF5-0008HU-8E
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636480146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L394c25o/XijfJAW9X/a1zThDF8INiAZ/DGWDZd4gAg=;
 b=aasdmwppelAbtglzOtF9MOcZAvpgwmiLlPAIOWuX7UABmI3sViTUxDF2PypCNPwDjA844J
 LQicxXpd+X+50LsmXFHuCDpL+vAHdqw/vU4nOuXLl9aHa1KuK/u33mePJRm8qZu8BzMBoy
 LvvtgpQZbHCF4YgkK6/SkAnOApAhPqw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-erL87udxPg-3dNEp0itZXQ-1; Tue, 09 Nov 2021 12:49:05 -0500
X-MC-Unique: erL87udxPg-3dNEp0itZXQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 z1-20020a05640235c100b003e28c89743bso18508229edc.22
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 09:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L394c25o/XijfJAW9X/a1zThDF8INiAZ/DGWDZd4gAg=;
 b=oRY/WR+k+HqPTQMFRkkPCAT19CfBB9cJWH7cCe1Z4ia2YMfdQuDrBl5LELg2nTyOia
 ys5HfZz8hCYUhFtZ6xyid/uVUycUjVV4/5VDv3KWRkdRcM9nKd/2GsTKTct1GCNXyxBU
 YfyYOQTNLeZpvUnNzPfU3P2y8qOz1B+twwWJbaIbqFULMCr6RvpNDva2wpJKBJIzygvQ
 Hb5CQal9lERXZLMkNbilx6xFvcAqbHmaAgA7zhFZoAQUflXHaQouZJfotHp3qPcUoqNf
 cVEyuQzLCYz4UmsaL2/AP6QllaqCOlbQSrQYM8UZUsCVR1Cu1nPW70YYdBSUr+1ylEn4
 3Jfg==
X-Gm-Message-State: AOAM532u8cr0wKqzmJgNOgyhhLUgYJo8KHgSEjx8zICk62D1DNWHo0PG
 NPGZE0EcgjCRgurb8FKp1+/AAWQhBK10jktldY8A9bu6dtME50I9lBt/WAmbwYvC0u11RZF4UJ6
 rzNuenHVtfXRntUg=
X-Received: by 2002:aa7:ccc6:: with SMTP id y6mr12456392edt.262.1636480144038; 
 Tue, 09 Nov 2021 09:49:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCyArouP8hV5+qeDOtId3SXOWP/31KhaBbQKrEYCtxQFoxItLFYv3+2E27I4B+elX2lYg3BQ==
X-Received: by 2002:aa7:ccc6:: with SMTP id y6mr12456372edt.262.1636480143866; 
 Tue, 09 Nov 2021 09:49:03 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n23sm11666883edw.75.2021.11.09.09.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 09:49:03 -0800 (PST)
Message-ID: <59c77978-a099-a25f-5d84-7ee3489ac3a3@redhat.com>
Date: Tue, 9 Nov 2021 18:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 05/33] i386: Add 'sgx-epc' device to expose EPC sections to
 guest
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
 <20210928125116.183620-6-pbonzini@redhat.com>
 <32078e7f-608c-2c62-b92e-58efb6f6d241@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <32078e7f-608c-2c62-b92e-58efb6f6d241@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 15:25, Thomas Huth wrote:
> Our device-crash-test script reports that this new device can be used to 
> crash QEMU:
> 
> $ ./qemu-system-x86_64 -M none -device sgx-epc
> /home/thuth/devel/qemu/include/hw/i386/pc.h:128:PC_MACHINE: Object 
> 0x55c80d332290 is not an instance of type generic-pc-machine
> 
> Should it be marked with:
> 
>      dc->user_creatable = false
> 
> ?

Yes, it should.  Thanks for the report!

Paolo


