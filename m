Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681E3BBA4A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:38:19 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0L3S-0002F8-C2
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0L1x-0000Z0-6Z
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0L1r-00061t-FC
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625477798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kC7/egN2a6l9qGZtzTmr/nLNi18dJxD60KvH/Fqvvvo=;
 b=XEOZHDB/FisLQjn8gnHi3iCSxbZ7gKLS/cryWhJj9f+7JYNSMoMFIttchSyndeaOU0RgP1
 JvNTd4ZAdd40ILBX0v/Mo6+mihHN/5HK3COufWfO5h2hMwy2LAaULg3Iq4A7Y+CPtXeJ6q
 Y0VSXYWlUA7fgIBVXX2aKcHwKoXn44k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-9OeIh9wpOGKqcoal8YWZJA-1; Mon, 05 Jul 2021 05:36:35 -0400
X-MC-Unique: 9OeIh9wpOGKqcoal8YWZJA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n17-20020a05600c4f91b0290209ebf81aabso817278wmq.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kC7/egN2a6l9qGZtzTmr/nLNi18dJxD60KvH/Fqvvvo=;
 b=Pv1nA5JJAbxydQIy23368LGMFIG4KGHNUa9K4JhPmg+sdn+JsEDb6LPiOT9mAwcsMc
 T72+OR3OCu3OB8KrniAyM35TsL97GWVJ7btfE/mFFPEaSMHr5/3wzTGEpIzETUGL4D8F
 tpyIVXG5rE0PeiRIdUoTbbW5+/UvCvvTwnT9YQeKPnGuhHDRpD3aWvnFoAcHlb21JWU5
 57mxBiiStcoE+ed+a3GDb+WIQascGTLYPr+n3hPrjyQOygl/igbESAnhPfmUbJW/Wj6x
 Gp3oAMtDsT24Cv3P96Ym8rGtWKRQxiU1LOoIFyelRl4qCSaSbzxa0Oy+0y3ZiM4BHFxn
 SZeA==
X-Gm-Message-State: AOAM5308NocmZ4coVHu1RU1r0txPv0Fdknl289PmPXIp0Er1X5BukTHI
 bD4DDEwQoCi8TMrQ43FMgPxD9N+RlRUWf8dLSmxePUUEvu4JZL48ieVUQd//sHkdECXlytmUt7K
 Zi7+dj9Vw7+hfw30=
X-Received: by 2002:adf:dc8b:: with SMTP id r11mr14923022wrj.363.1625477794492; 
 Mon, 05 Jul 2021 02:36:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSEUwNVZTO10RpgIK9q6be+uM0nOcUkF9bSGA4QFyQQ3Cx2jaOqTbKHlSxyGnAV4g/d2hh1g==
X-Received: by 2002:adf:dc8b:: with SMTP id r11mr14922995wrj.363.1625477794240; 
 Mon, 05 Jul 2021 02:36:34 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id l2sm11438460wms.20.2021.07.05.02.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 02:36:33 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
References: <20210623023250.3667563-1-iii@linux.ibm.com>
 <20210623023250.3667563-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <ce59213b-4642-63b4-32b1-4566415c3b7f@redhat.com>
Date: Mon, 5 Jul 2021 11:36:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623023250.3667563-2-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.06.21 04:32, Ilya Leoshkevich wrote:
> For SIGILL, SIGFPE and SIGTRAP the PSW must point after the
> instruction, and at the instruction for other signals. Currently under
> qemu-user it always points at the instruction.
> 
> Fix by advancing psw.addr for these signals.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/319
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
> ---
>   linux-user/s390x/cpu_loop.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
> index 30568139df..230217feeb 100644
> --- a/linux-user/s390x/cpu_loop.c
> +++ b/linux-user/s390x/cpu_loop.c
> @@ -133,6 +133,11 @@ void cpu_loop(CPUS390XState *env)
>   
>           do_signal_pc:
>               addr = env->psw.addr;
> +            /*
> +             * For SIGILL, SIGFPE and SIGTRAP the PSW must point after the
> +             * instruction.
> +             */
> +            env->psw.addr += env->int_pgm_ilen;

We also reach this path via EXCP_DEBUG. How can we expect 
env->int_pgm_ilen to contain something sensible in that case?


-- 
Thanks,

David / dhildenb


