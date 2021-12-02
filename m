Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C977B466897
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:47:10 +0100 (CET)
Received: from localhost ([::1]:48568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspEj-0006Qb-UZ
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:47:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mspBY-0002V5-Q9
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:43:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mspBX-000471-A0
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638463430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6JjYLohUFlcVmS5xBkp+G8EASUgD6uYKjRCWcYlGL4=;
 b=L1bUrBP5POQMMjQY60t55BWLIn1dUB+3vkbxRc9DAVRb71JnatfP9NnZy+G+jzuRMMkuPd
 zdt4MiyHaowwjq261hz+jXgx+hVMvVf14bDhYrQ3qxGe45vBfAqWw0y5kJToLUc9tatBK9
 ACKPo2eoS9fge3R0yT6WBtcM7kYPe/A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-hSyZ0Mi9PgS08xhbDuyx9A-1; Thu, 02 Dec 2021 11:43:49 -0500
X-MC-Unique: hSyZ0Mi9PgS08xhbDuyx9A-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso93331wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 08:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Q6JjYLohUFlcVmS5xBkp+G8EASUgD6uYKjRCWcYlGL4=;
 b=s6vLcOnKC6bEFNwFtkfVABK0+uH8/sHgF8qM+eqPH2NnyVO7W6/okzNPeSkKSUHy7u
 Lb2S9kTeBmEMbCqGHjxp2IXBzYdswTO1amuWpLVX5qWt/4UU3qYf8kIt3gfCe0cHVOyq
 ZC76AY9Vx3mwPfHA2P3chPGzyIRuWFVlqcHTe3e2UIpq07q377m/Du27BHZhwusbugme
 fWlRv2yqlQv/Xzq0bw0OkhmvZbNGz9ioSycBjeUvTedmDCD0TYXlOps1dLIlNhe73qoI
 VYCYPqp4Uwg93vSkblvkXFUMlAwSFSBazJtV8PnuQo1Pd7jWzzSZxDE+ZF1nK07ivAK6
 LtdQ==
X-Gm-Message-State: AOAM5325rJQeoIYOXyffL9PCH+Qm/x7iFK69S5pzBl6YNM3sub2Pul4b
 ev33d5NSh4rSNeOMEL7g5F4yjAnk/H14+Um2RtvDKd/v2s7+yar9xKQ2gQQ0Tq+CX1xAdf6GgyA
 KTwxWpSgzEN9Y95s=
X-Received: by 2002:adf:b35d:: with SMTP id k29mr14860388wrd.466.1638463425196; 
 Thu, 02 Dec 2021 08:43:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKRKVPpfWcWnd0nzrNmGXP1FyoeQAjlRMg93StlItuSJqR/jcON9OcVeKdVhnyHZc51z2HXQ==
X-Received: by 2002:adf:b35d:: with SMTP id k29mr14860359wrd.466.1638463424944; 
 Thu, 02 Dec 2021 08:43:44 -0800 (PST)
Received: from ?IPV6:2003:d8:2f44:9200:3344:447e:353c:bf0b?
 (p200300d82f4492003344447e353cbf0b.dip0.t-ipconnect.de.
 [2003:d8:2f44:9200:3344:447e:353c:bf0b])
 by smtp.gmail.com with ESMTPSA id f15sm224559wmg.30.2021.12.02.08.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 08:43:44 -0800 (PST)
Message-ID: <123ecaef-0f76-614c-2f6d-cdb824a84f56@redhat.com>
Date: Thu, 2 Dec 2021 17:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/4] s390x/pci: use a reserved ID for the default PCI group
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-2-mjrosato@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211202164110.326947-2-mjrosato@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.3, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.12.21 17:41, Matthew Rosato wrote:
> The current default PCI group being used can technically collide with a
> real group ID passed from a hostdev.  Let's instead use a group ID that comes
> from a special pool that is architected to be reserved for simulated devices.
> 
> Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  include/hw/s390x/s390-pci-bus.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
> index aa891c178d..2727e7bdef 100644
> --- a/include/hw/s390x/s390-pci-bus.h
> +++ b/include/hw/s390x/s390-pci-bus.h
> @@ -313,7 +313,7 @@ typedef struct ZpciFmb {
>  } ZpciFmb;
>  QEMU_BUILD_BUG_MSG(offsetof(ZpciFmb, fmt0) != 48, "padding in ZpciFmb");
>  
> -#define ZPCI_DEFAULT_FN_GRP 0x20
> +#define ZPCI_DEFAULT_FN_GRP 0xFF
>  typedef struct S390PCIGroup {
>      ClpRspQueryPciGrp zpci_group;
>      int id;
> 

What happens if we migrate a VM from old to new QEMU? Won't the guest be
able to observe the change?

-- 
Thanks,

David / dhildenb


