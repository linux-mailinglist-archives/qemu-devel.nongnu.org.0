Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7639843B7B5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:58:49 +0200 (CEST)
Received: from localhost ([::1]:49634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPmi-0004Pv-2a
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfPl7-0003Z3-Jv
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfPl2-00012t-BB
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635267419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87jbbGD2Qja4tI5uQqqwDJXosLP6NC/9n+kR2z4fSpM=;
 b=Bw4pnSn+hi71gPckIzmWz9oWeN8o4xRM+/OpT2/Zbvev49C/AJ68lQCpW0EC83bc9lFd7/
 3elAJT9igMVnJxAvWUENOYRZhM6h7s9d9XNFCUulKgfD854+FkmxJXdXMvmIwlRHmRzFjt
 6KNp8i3/N7SA2kBtqFOsliCHgL2kXsE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-hYlVqyytMQqRAPpCHAg97A-1; Tue, 26 Oct 2021 12:56:58 -0400
X-MC-Unique: hYlVqyytMQqRAPpCHAg97A-1
Received: by mail-wr1-f72.google.com with SMTP id
 e7-20020adffc47000000b001688df0b917so2517012wrs.22
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=87jbbGD2Qja4tI5uQqqwDJXosLP6NC/9n+kR2z4fSpM=;
 b=TtLwfnFJQVIfpqzZ3xj8SkLx3WCm7WMfu5FFLgUPRb26oKPtiaSW0LbBFxRl9fVyUN
 RzdWgABBBoyohJ3A/5Fnekwbvw4WJwRC4X9OqhjrWR1mDz72z8curIDv3YyDj+/FVaRW
 0EOiWCYxz8o/EFlwVBgGo6MOK3Wm2LHEqGrrQ6o/D7Bb+ZutXsZCpRIzFC/nOhhOHJ9A
 cdy5gqZO0ds6W3fuSCTeVFzdrAJJ6WniqR+XxRKFFEz3wLgp51r1YrZUBtB7XJmzapH6
 zxqi9twhswNs+pWomZr3njmiuNUUF9WiuorObgd4pkEgdEeKBfSdLLwa/zY18Y3Ih4qM
 ofmg==
X-Gm-Message-State: AOAM530xmsSqKSOdVTY2v8UMtp3bcE95KvQbbkcRc5/rhgm5qW8CK/4l
 9lt8lplA+p8tOm+kEis4xgTzw2EI79EwwtC/SaDIfeL+E7p1qecFh2TXpzngB/3lUg7JxU0Ng5z
 IJ6gcZ6ZPjKvVBEU=
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr1317359wru.363.1635267417172; 
 Tue, 26 Oct 2021 09:56:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvCTc20Chv0BEzgUhIM02EOVb4fUSEmsga5jtsrL6DHvr5+QIvdWwHrb7ES7t49UTwJIsR2A==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr1317337wru.363.1635267417011; 
 Tue, 26 Oct 2021 09:56:57 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g77sm1327608wmg.31.2021.10.26.09.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 09:56:56 -0700 (PDT)
Message-ID: <2388aeb4-90c9-6471-f798-2d005c18896a@redhat.com>
Date: Tue, 26 Oct 2021 18:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/3] machine: Use host_memory_backend_is_mapped() in
 machine_consume_memdev()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211026160649.47545-1-david@redhat.com>
 <20211026160649.47545-2-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026160649.47545-2-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 18:06, David Hildenbrand wrote:
> memory_region_is_mapped() is the wrong check, we actually want to check
> whether the backend is already marked mapped.
> 
> For example, memory regions mapped via an alias, such as NVDIMMs,
> currently don't make memory_region_is_mapped() return "true". As the
> machine is initialized before any memory devices (and thereby before
> NVDIMMs are initialized), this isn't a fix but merely a cleanup.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


