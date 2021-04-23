Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1D1368F52
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 11:27:26 +0200 (CEST)
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZs5t-0004OM-Bh
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 05:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZs54-0003ty-Q0
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 05:26:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZs4z-0006Yp-RN
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 05:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619169987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dr9JKyJ9yrGVz5SYJDpzB0NcC9zc+GmghK0HPi1nPJw=;
 b=gGps+jFcrDPr0HfUd+Kpuayhl99JJPzQDChsbTn8aNjgUU2GkTG7VMP2uZGv94xMtO4hW5
 N7WYsGEs9QWc04YiJnruAvL0mVMXWtosh6KDiR9GmMS/mUaZ0gapy0hQm2kktoCesoMsro
 Yr+OQhGA9fxpFJ+87uKaNK0XVmebnvU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-LamcES-YOfO25oS-HzU7_Q-1; Fri, 23 Apr 2021 05:26:26 -0400
X-MC-Unique: LamcES-YOfO25oS-HzU7_Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 k1-20020adfd2210000b02901040d1dbcaeso14804121wrh.17
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 02:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dr9JKyJ9yrGVz5SYJDpzB0NcC9zc+GmghK0HPi1nPJw=;
 b=CsnXFgm5kJOy2mF7lPE0eZnpbWo+c4stlvzcOaqPY7qJV15IPhuVaJfF96tbz3DJuK
 62gza+V0jnYNqmhRT8qyNcsHFwnp2aR34nLafvMeN7IONugkJFSYPbkDcr9EUP1lHcr9
 TBKkSFey+7hZ3wfmcnjaC3pYxuuKht5yWIF1pFWuQwFMmcZLq8+OwqNDBr/fBv6Vqtmn
 Doudjg/vKHssJNRq9z8WW+zk5Hu5GM7Rk19rSETbQs0twGCE23amfZqp34HO1818RVsm
 35hya0czCr4PI3pWRx6Mpn0keC2je1pzRiJHE0tNhoA3IhWFBCOQU7DOUQ6HwBMfAi7R
 /ivg==
X-Gm-Message-State: AOAM530ZIUDOByTEmUaHdZRMjm3V2KH42FSHM87IP51u1WD3i0hk5uCi
 dNHz8ZT9eydy8fOjD0MmPygkmQsWrjiEraWbDqJ3QpJVBFapGJ+hvv/Qq7bUYHxf0BHM6dTndqQ
 nIkIQ8DK4XPP0oos=
X-Received: by 2002:a5d:460b:: with SMTP id t11mr3582585wrq.310.1619169984889; 
 Fri, 23 Apr 2021 02:26:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEtLrJVWQrTOkzOvbgU8Nai9Q4UBD8E4RdUxQhqxBtQXMZhayIKZfdCbRURhm8MORZbPG5qg==
X-Received: by 2002:a5d:460b:: with SMTP id t11mr3582558wrq.310.1619169984631; 
 Fri, 23 Apr 2021 02:26:24 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o62sm35893353wmo.3.2021.04.23.02.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 02:26:24 -0700 (PDT)
Subject: Re: [PATCH] pc-bios/s390-ccw: Use reset_psw pointer instead of
 hard-coded null pointer
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210423083604.526367-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e282b686-3b19-5082-83cb-ca7f5966917c@redhat.com>
Date: Fri, 23 Apr 2021 11:26:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423083604.526367-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-s390x@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 10:36 AM, Thomas Huth wrote:
> When compiling the s390-ccw bios with clang, it emits a warning like this:
> 
>  pc-bios/s390-ccw/jump2ipl.c:86:9: warning: indirection of non-volatile null
>   pointer will be deleted, not trap [-Wnull-dereference]
>      if (*((uint64_t *)0) & RESET_PSW_MASK) {
>          ^~~~~~~~~~~~~~~~
>  pc-bios/s390-ccw/jump2ipl.c:86:9: note: consider using __builtin_trap() or
>   qualifying pointer with 'volatile'
> 
> We could add a "volatile" here to shut it up, but on the other hand,
> we also have a pointer variable called "reset_psw" in this file already
> that points to the PSW at address 0, so we can simply use that pointer
> variable instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/jump2ipl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


