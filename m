Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1C44C1A0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:54:34 +0100 (CET)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkn7Z-0004tg-5v
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:54:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkn5Q-0002TI-BP
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:52:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkn5M-0003lV-EF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636548735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=om5Ivpy0oUJtEq1nh0G6/nrRLIteQW6MRkaMfu6zXNE=;
 b=X36V9rPxX5EH7DbTUWL4RL19Z52wEzgN8SzbS0FJc/lXbrmA2Hast9PxCMQXecaMExxpjM
 6kGRZInMCEno6GZ3EAcuoAM1puT31jPt3Vabn+pRtV/3ugSuUF3qvRk8t5+OZBIprfWav4
 GnHKl/S0FBQjHMJf5Pf2/wukHEzlxlg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-vD-cpOK-NXOWLTVXAzUlxQ-1; Wed, 10 Nov 2021 07:52:14 -0500
X-MC-Unique: vD-cpOK-NXOWLTVXAzUlxQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so2201838edl.17
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 04:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=om5Ivpy0oUJtEq1nh0G6/nrRLIteQW6MRkaMfu6zXNE=;
 b=dxonmnkDQQHe69SHJnvKkX93hx996lg01q4oB2F2Zxmtrm57xgZf1xdjPwUKDVBJlC
 Maq0sQzp71pcz5thJdI0E4OkamBpW5YncQUkHHYe3cgJCkUZ6jkMHK/eURvEuHvBzAGb
 Vuxy2AvfCXPKQUjOE69yu0buNKGcJjyanZi9ATV33mf/JZyf17cgEfOyGuML+IChKyiu
 PdaxrDS4QiIIj3Cty/H7vv1Ba5EOFNhv14wF4Ih28B3V08kzKh7o0lY45FDyAP9lvqMS
 5YNTMS5cuhkjJEZphRkOy4VRmuEmu/ASLwvbQ2gHdfNXm8/K8WLg7/pBg0eS5mTYfBmK
 uBfw==
X-Gm-Message-State: AOAM531SSdx0XAR5N2c3f8LmIuxp5JiZ7Vqr1bVMpWbL6cOf2ssIxR8T
 ZUDVKWCeK1NKNI3h+Zg5VuZGZCp8fsimdBiWVnykb8qGOU+Nllh0ipT6JsbBgoRNeEZA19aVelq
 dzXewg+oaS4Us2BU=
X-Received: by 2002:aa7:d14d:: with SMTP id r13mr21305487edo.172.1636548732359; 
 Wed, 10 Nov 2021 04:52:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwltirvemGenLGSgwaN+8DpIR+cqyXOecf7qCNKuK00OmQKDQ2XF0saAZQ6DCupk04Ib+snwQ==
X-Received: by 2002:aa7:d14d:: with SMTP id r13mr21305457edo.172.1636548732175; 
 Wed, 10 Nov 2021 04:52:12 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id mp5sm11788453ejc.68.2021.11.10.04.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 04:52:11 -0800 (PST)
Message-ID: <f8ce527e-5ea7-3359-d2e9-62497136d7af@redhat.com>
Date: Wed, 10 Nov 2021 13:52:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/5] SGX NUMA support plus vepc reset
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20211101162009.62161-1-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211101162009.62161-1-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, jarkko@kernel.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 17:20, Yang Zhong wrote:
> The basic SGX patches were merged into Qemu release, the left NUMA
> function for SGX should be enabled. The patch1 implemented the SGX NUMA
> ACPI to enable NUMA in the SGX guest. Since Libvirt need detailed host
> SGX EPC sections info to decide how to allocate EPC sections for SGX NUMA
> guest, the SGXEPCSection list is introduced to show detailed sections info
> in the monitor or HMP interface.
> 
> This version also plus the vEPC reset support because the related kernel
> patches were merged into tip tree master branch, please ref below link:
> https://lore.kernel.org/all/20211021201155.1523989-1-pbonzini@redhat.com/
> or the tip tree master branch.

Hi,

I queued patch 5, and enough of patch 2 to avoid crashing 'info numa'.

For patch 5, note that linux-headers/ is automatically generated from 
Linux headers (as the name says!) so the ioctl has to be declared in 
hw/i386/sgx-epc.c.

Thanks,

Paolo


