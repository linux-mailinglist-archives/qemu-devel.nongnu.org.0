Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4805406E03
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:12:24 +0200 (CEST)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOiCV-0006yL-WC
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOiBN-0006JR-UY
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOiBK-0004FZ-IP
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631286668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HDxpoixy5Jh7s+X5GuensEUh8R7jjiPDSkZsWq8bYc=;
 b=feHRTrMvYzII9I4tfyQf/AOARzWrl0653evHkgF+FeHwvYRWlwG73wcxGXOP3DHd7dBvGO
 lKu3YpPMlKgTDTKnlzZ3zApzjRwACJ5/boEAulfPqiDFEQ2gf4r05ZrZF49utFni2tn4PL
 By8UmcrcKQpldcf2KtCsxvJ29GHqhsY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-Yoof-JBnOGGcZ115loH5rA-1; Fri, 10 Sep 2021 11:11:05 -0400
X-MC-Unique: Yoof-JBnOGGcZ115loH5rA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so1055641wmj.8
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1HDxpoixy5Jh7s+X5GuensEUh8R7jjiPDSkZsWq8bYc=;
 b=K/5oe6JHskAiFn0CLBX+AahC8dGnkiIz4OLTM2QYZCoLSzw9barwfFuAA+KjBUEkjJ
 iEKvzusLoK6zqHFbhiXK8Eb1jNwRb4260H+byrS9YRlvz4l/r4Hi+lJHO9cqHrz02YnI
 ag/nbAc9cgtlGQeuOqsU/sFatPApqu42rVtIV1jMrkSW+wXATiTsaSjhplrWDOr6wufD
 uKkX+D0CyY8qTw1EHwXwIUFV7VDNmlulQutr0ajeh5obsPfzQziKUpLdqOHu4PBKbWz4
 ABzjY1Cj1g2D+bX3A0bq29+6qCFBTMCSgb/AQHEMTgGsxaV82h4uWYr1b+cVg4MIi+Fl
 Ge3w==
X-Gm-Message-State: AOAM5312e0VP+8zGCn1fUuAP66Vg5MosWsUmtVEjv13XPJfC7242IPfe
 gfmGvSue2ZLHMOXCs+TO1+k1Kva1rcZQ7oGCI/FoKrQ57rgab92QnLUqBMV5d8rUvp4VsDtSSYF
 SzBMU6ShAWpq5PQU=
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr8832484wmq.193.1631286664312; 
 Fri, 10 Sep 2021 08:11:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKekixrpyZ7JiTsGrMzeZ3Y6B0owH8ZzK+U61oNszzZCw+sA3xpqzlG3OjL9hkzT4dheMBqQ==
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr8832459wmq.193.1631286664021; 
 Fri, 10 Sep 2021 08:11:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id f3sm4455131wmj.28.2021.09.10.08.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 08:10:53 -0700 (PDT)
Subject: Re: [PATCH v4 22/33] hostmem-epc: Add the reset interface for EPC
 backend reset
To: qemu-devel@nongnu.org, jarkko@kernel.org, seanjc@google.com,
 kai.huang@intel.com
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-23-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
Date: Fri, 10 Sep 2021 17:10:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719112136.57018-23-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/07/21 13:21, Yang Zhong wrote:
> +void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
> +                              Error **errp)
> +{
> +    MemoryRegion *mr = &backend->mr;
> +
> +    mr->enabled = false;
> +
> +    /* destroy the old memory region if it exist */
> +    if (fd > 0 && mr->destructor) {
> +        mr->destructor(mr);
> +    }
> +
> +    sgx_epc_backend_memory_alloc(backend, errp);
> +}
> +

Jarkko, Sean, Kai,

this I think is problematic because it has a race window while 
/dev/sgx_vepc is closed and then reopened.  First, the vEPC space could 
be exhausted by somebody doing another mmap in the meanwhile.  Second, 
somebody might (for whatever reason) remove /dev/sgx_vepc while QEMU runs.

Yang explained to me (offlist) that this is needed because Windows fails 
to reboot without it.  We would need a way to ask Linux to reinitialize 
the vEPC, that doesn't involve munmap/mmap; this could be for example 
fallocate(FALLOC_FL_ZERO_RANGE).

What do you all think?

Paolo


