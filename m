Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812E542A2F4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:17:04 +0200 (CEST)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFmJ-000623-Fr
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFVU-0007Y2-VV
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:59:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFVR-0000Gv-Ow
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634036377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZwv9Wa2HY3Cim/WXKfjVamSsn6BkCmMcgIp2+Hsy9c=;
 b=C/jOEP44UFqvkgNo0840TbftkNBXll1wz+xtMwukuKf25TSral9uOOSpTEUm5d2m5BIUAL
 FTPTLH06wHH1teLB7t7RsQXGJIiSwvCOA1ik5DtcVdbjLNSgBr0EJtc7NMDBTHrfucFx+W
 6QGhZXsgRZGb+aIkAdEobLkV4O44lCs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-zRN0UpQpPQuZSTBHM6WvWQ-1; Tue, 12 Oct 2021 06:59:35 -0400
X-MC-Unique: zRN0UpQpPQuZSTBHM6WvWQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so10225409eda.23
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UZwv9Wa2HY3Cim/WXKfjVamSsn6BkCmMcgIp2+Hsy9c=;
 b=bYdsqe3Ja3aNzdDO3oRxwAjgfHT2uz7s7saFZMsJEu9FNSpktbEWV0jJQlu89Lm+yS
 WxYMWwxFYZTID2ZJT3SMIGjGXseecfG1rrTWHu7eTOz/KPYiZMuTxMkWW/uekybXf0re
 8zUrLbp9eK3ba7VVW7ey4XD1jGtO4i581i7VxNFDnzRJItgGz+inmltCd9Bzxc00hf1a
 LKTRQtL9WxhDUR4zyJY9L3zxqXXhHxAKUdwjFcQNmjuQLfFpkyn2ahPdYHh4s5NG2KgY
 /+bjJP35KwuTfE/sjU+XmufVK1tRNQee9lY+Ed/jWLG5vxTIivGeR9CbOGUk93axUJUY
 6Gpg==
X-Gm-Message-State: AOAM532IA2f5++D0+AlncSheodd+xGFLycgTfWvws9J3K6eMpRoeuBgy
 qXQgFs7goQIzd1FP2UYtgIAyl9pB5rLilfTXTrJWxXrfJ1w/Y3Rc+uUN0m2+s8JjNC6FaKf+1Ys
 I9XKIGFYObuWcqM4=
X-Received: by 2002:aa7:d1c2:: with SMTP id g2mr48680393edp.248.1634036374300; 
 Tue, 12 Oct 2021 03:59:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhRkXjUPnpOkB90hpVR9QYn/4f9BxB2RfxFSJLQI0BIJNc9iI8lqq2Rw+dNBbHR1GxoLnIPQ==
X-Received: by 2002:aa7:d1c2:: with SMTP id g2mr48680371edp.248.1634036374119; 
 Tue, 12 Oct 2021 03:59:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 6sm4759202ejx.82.2021.10.12.03.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 03:59:33 -0700 (PDT)
Message-ID: <8b89a5d9-936c-d660-6546-6545d048368c@redhat.com>
Date: Tue, 12 Oct 2021 12:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 5/6] numa: Enable numa for libvirt interface
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20211011111554.12403-1-yang.zhong@intel.com>
 <20211011111554.12403-6-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211011111554.12403-6-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: philmd@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 13:15, Yang Zhong wrote:
> Libvirt need get the detailed host SGX EPC capabilities to support
> numa function. Libvirt can decide how to allocate host EPC sections
> to guest numa from host numa info.
> 
> (QEMU) query-sgx-capabilities
> {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
> [{"index": 0, "size": 17070817280}, {"index": 1, "size": 17079205888}], "flc": true}}
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>   hw/i386/sgx.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index 8af45925c6..fe3034060d 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -74,11 +74,13 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
>              ((high & MAKE_64BIT_MASK(0, 20)) << 32);
>   }
>   
> -static uint64_t sgx_calc_host_epc_section_size(void)
> +static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
>   {
> +    SGXEPCSectionList *head = NULL, **tail = &head;
> +    SGXEPCSection *section;
>       uint32_t i, type;
>       uint32_t eax, ebx, ecx, edx;
> -    uint64_t size = 0;
> +    uint32_t j = 0;
>   
>       for (i = 0; i < SGX_MAX_EPC_SECTIONS; i++) {
>           host_cpuid(0x12, i + 2, &eax, &ebx, &ecx, &edx);
> @@ -92,10 +94,13 @@ static uint64_t sgx_calc_host_epc_section_size(void)
>               break;
>           }
>   
> -        size += sgx_calc_section_metric(ecx, edx);
> +        section = g_new0(SGXEPCSection, 1);
> +        section->index = j++;
> +        section->size = sgx_calc_section_metric(ecx, edx);
> +        QAPI_LIST_APPEND(tail, section);
>       }
>   
> -    return size;
> +    return head;
>   }
>   
>   SGXInfo *sgx_get_capabilities(Error **errp)
> @@ -119,7 +124,7 @@ SGXInfo *sgx_get_capabilities(Error **errp)
>       info->sgx1 = eax & (1U << 0) ? true : false;
>       info->sgx2 = eax & (1U << 1) ? true : false;
>   
> -    info->section_size = sgx_calc_host_epc_section_size();
> +    info->sections = sgx_calc_host_epc_sections();
>   
>       close(fd);
>   
> 

This too.

Paolo


