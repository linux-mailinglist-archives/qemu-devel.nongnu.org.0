Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCEF6B1F88
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:11:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCIk-0004Vl-Lg; Thu, 09 Mar 2023 04:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1paCIi-0004VV-JR
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:11:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1paCIg-0007y9-FO
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678353061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y773Ht8CK6K9KfN5EGIMCtxTxw7D3pLA3pEABmJZBso=;
 b=ZMYfzqsLXE64B7FJ6+Rc0W40doOmbSvM7FJ0EFogtc0SjjZxomzKhJlfx1GwnvMgNwne6L
 aPYRs1PNbSPHGmUugJ2IGAFfI6q/ukGKdbMpkZA64MhV0K7bNAJUIR+PjIKev7m6FxJRP6
 r6Ya8kwUtOqFzLcmA/AB4AzZxHNsuxo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-P1hQGYLROuW5FUiUeLebjQ-1; Thu, 09 Mar 2023 04:10:54 -0500
X-MC-Unique: P1hQGYLROuW5FUiUeLebjQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso2128570wmc.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 01:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678353054;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y773Ht8CK6K9KfN5EGIMCtxTxw7D3pLA3pEABmJZBso=;
 b=ANIqbZ4lhq9BxxHCTV2x7UGT8h54XKzr3xI+sVna6q6pPUJtLM42E6nUZaHxxlTpyE
 RId2wlHJGAszf5Uwoz3qnogLvm45HmP1Cgqi+Rk5Ga4bXay1bTXZQNCLMgX2b/rERnVA
 vzdobsrWn0k/H8tG/on8XWuNVoSTYjal4gA/6W0QJSr6+Ui/Ya8QLGN+EUFja6RdPuRR
 jdB6Tc9aDU21zUrWjlQYT+LilsQily4c2n/7Bo9SAztQjoYqcCTuYjaUgZxy2imGvVfC
 bu+Do2gVpoLE4wo8mr6v2wUQoLFPh4l7rIQc1FRi0+BbPQprsJGvT3cygQc4Wq2h8ZPf
 gSXg==
X-Gm-Message-State: AO0yUKXqmccEnPb27dwhk3lm1E/mY3PNDZFJEtHsHiH7PhLSPv/fEMEs
 mwyQRLdm9nemumr0Bm72UvooMYjoNQEDxo27KL+1/QVHMZnOgxseX4E0LeFzSnLZoQ3QNgpRgtl
 IVWysH4ZV7301v4I=
X-Received: by 2002:a05:600c:a08:b0:3eb:2e32:72b4 with SMTP id
 z8-20020a05600c0a0800b003eb2e3272b4mr18636192wmp.15.1678353053831; 
 Thu, 09 Mar 2023 01:10:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9JNM+pqpyXH0CThPZMiAVF18lxeEzdz+WGEnDLUej4/gJyNQcRWnzMLnLRC0rjlQROn+CbEw==
X-Received: by 2002:a05:600c:a08:b0:3eb:2e32:72b4 with SMTP id
 z8-20020a05600c0a0800b003eb2e3272b4mr18636172wmp.15.1678353053472; 
 Thu, 09 Mar 2023 01:10:53 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:5200:a73:3e7e:12c:b175?
 (p200300cbc70252000a733e7e012cb175.dip0.t-ipconnect.de.
 [2003:cb:c702:5200:a73:3e7e:12c:b175])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003dc4a47605fsm1992422wml.8.2023.03.09.01.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:10:53 -0800 (PST)
Message-ID: <697611aa-601d-8376-556f-42b7bc6b82f4@redhat.com>
Date: Thu, 9 Mar 2023 10:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] virtio-balloon: optimize the virtio-balloon on the ARM
 platform
Content-Language: en-US
To: Yangming <yangming73@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
References: <20230309022752.1013-1-xiqi2@huawei.com>
 <e13bc78f96774bfab4576814c293aa52@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <e13bc78f96774bfab4576814c293aa52@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09.03.23 08:52, Yangming wrote:
> Optimize the virtio-balloon feature on the ARM platform by adding
> a variable to keep track of the current hot-plugged pc-dimm size,
> instead of traversing the virtual machine's memory modules to count
> the current RAM size during the balloon inflation or deflation
> process. This variable can be updated only when plugging or unplugging
> the device, which will result in an increase of approximately 60%
> efficiency of balloon process on the ARM platform.
> 
> We tested the total amount of time required for the balloon inflation process on ARM:
> inflate the balloon to 64GB of a 128GB guest under stress.
> Before: 102 seconds
> After: 42 seconds
> 
> Signed-off-by: Qi Xi <xiqi2@huawei.com>
> Signed-off-by: Ming Yang yangming73@huawei.com
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


