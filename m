Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0813A407C16
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 08:56:24 +0200 (CEST)
Received: from localhost ([::1]:46374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPJPa-0001Ko-KL
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 02:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPJNi-0000ex-QS
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 02:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPJNf-0005jy-DN
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 02:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631429660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3hoRRE+wo+aljMn63QiA2Hm5zUTG6nLF91fPbzM3Js=;
 b=EqsEkb97pr1C+C9DcZ4f8H0irA/5sViULZKrTsACSwu/k8jmbnNtDhYYrtYUEiio276J7K
 pnx+TlylUmt8dZqBxu7F6Y3OELxfHJ2n9iGwph3MzN/PemKzf7RiS0n7tqzPIFsz8XRJ1W
 kjh9PFvzlJhvwa8Tr55zPrmpTmtJi50=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-ryLGjBlNNtixIhsFuvAU2g-1; Sun, 12 Sep 2021 02:54:18 -0400
X-MC-Unique: ryLGjBlNNtixIhsFuvAU2g-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso1726979wrw.22
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 23:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R3hoRRE+wo+aljMn63QiA2Hm5zUTG6nLF91fPbzM3Js=;
 b=xtspjybb69Jf5F3sduAqKBYMIFJjnb0zh5GBSCBbxMC5FtY4L6QFgrU1Fmu01xqTNo
 X4fMHlc9nW5YTzLxcw//rEojGadPY1L3FesHthresbSx4Fk0Xs8Ld5fKTALRrIN9P4js
 Ge1fqSPCBvRyS1gWBDAW9XECqvjtcfQ65t/kL++66OsYwd1Ay9lNk+H6sJxLGGwOB44I
 vso7DcnebtxQ/BaVNzh8Pnczp24jF8/LzFqcWDmmgL9UJvZ2HuEYQVcSMPHlEq7yUhcy
 How718ItoGw4DzKDAat68QFcnyEzDsp6uu2/mCmrxmqXJSCOpItY3dAjnvo/hQCPZeSJ
 HY+A==
X-Gm-Message-State: AOAM531AXewysdtFUAXN6jN0LSP37pejIHgeww1sOxnlillJXZEKpQ/H
 yF30wrLz/RFjeAc5CqrFbL2bIDgg6LEjW1HQfPv5vHy3BNV/ns4rQsYyxy56NFafOeigzlqA0Ge
 01MV5FXqoqQTtins=
X-Received: by 2002:a5d:5003:: with SMTP id e3mr6291843wrt.118.1631429657374; 
 Sat, 11 Sep 2021 23:54:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKymYH9gQCYW9p8XeBTiS0jbxPL19G04WjbGDf+pEicMeHXev9CMAQ+ZVo1Vc6cnR16SOYug==
X-Received: by 2002:a5d:5003:: with SMTP id e3mr6291820wrt.118.1631429657159; 
 Sat, 11 Sep 2021 23:54:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id o14sm3664150wrg.91.2021.09.11.23.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 23:54:16 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210909141031.958393-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] memory: remove incorrect RCU comment for
 address_space_read()
Message-ID: <1d846c3f-5deb-4317-e3fb-1b183bdf7187@redhat.com>
Date: Sun, 12 Sep 2021 08:54:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909141031.958393-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/09/21 16:10, Stefan Hajnoczi wrote:
> Although the doc comment says "Called within RCU critical section" the
> address_space_read() function takes the RCU read lock itself. There is
> no need for the caller to hold an RCU read lock.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Fixes: b2a44fcad74f1cc7a6786d38eba7db12ab2352ba ("address_space_read: address_space_to_flatview needs RCU lock")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/exec/memory.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317..60508a1e19 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2768,7 +2768,7 @@ static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
>    *
>    * Return a MemTxResult indicating whether the operation succeeded
>    * or failed (eg unassigned memory, device rejected the transaction,
> - * IOMMU fault).  Called within RCU critical section.
> + * IOMMU fault).
>    *
>    * @as: #AddressSpace to be accessed
>    * @addr: address within that address space
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


