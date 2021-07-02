Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6653B9D15
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 09:44:27 +0200 (CEST)
Received: from localhost ([::1]:34944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzDqb-0003eL-PE
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 03:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lzDpp-0002ue-2l
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lzDpl-0003yp-P9
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625211812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Uw80BVDzXNCF+NgBbT2FhJC/D6/6bZUlodG2CieBaI=;
 b=BK0Ja25VyzCAY+QBw8zO30IHzF9Z257qtHrGDFzXsIQT3lKjXQiWyIf/6y36chnbhoXopO
 9fJvVs0BlYM0i99hbnYq0tzIzXimFG1LwBHWW2l/2FZWHlrsuWFOur3nZsROrIkHP/gJ7b
 xfjNWEQoy38ukKPqQaWbFecw2J3olu0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-n2ygCeS6NAmkAZqLNUyaDA-1; Fri, 02 Jul 2021 03:43:31 -0400
X-MC-Unique: n2ygCeS6NAmkAZqLNUyaDA-1
Received: by mail-wr1-f72.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so3586721wru.6
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 00:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Uw80BVDzXNCF+NgBbT2FhJC/D6/6bZUlodG2CieBaI=;
 b=ZXC0MH0SaEQb7QR6gcvknmisfvMguBRYQ82H61oStQgHGefKGgB11CL9wM/DGValad
 dHImFzgSn+iljTg7trEX3jLOViY9FMXEJ1316JaICp8ZG8wXBxDuO2QcakG26ypoNfH3
 25F/dpr+NzGgXc22E1bl0bYYnZuDQBwUBFXLu5y+nsi5kw6a1hl4I9Jf+vAtC5TJAVJY
 q9/6KZZ9oDPttuobx3DhjtGsKX+SHDomPZAnQu4cIAuHMYHvwYHSb1Wu9YIvukdhFBbm
 JpC2GdeTqAbQu8qMcVLIuZbo5CYH7tSnUMtTx30t7y8DQQRr0/08qSorYD3uBAII5DGv
 lzAw==
X-Gm-Message-State: AOAM531r8cqwWcR9t9GdNiPZoJQfZ4uiqWVh28LVoDFvGJx2Yp0vcxF6
 cx/JyZD1jGyeEA5wVaWT/9ZkHczNbbEUGvZ7olq2GPZN14MQE5lBFp+1wR7CRT0JV5uWDcEXjJM
 6D60QnZXICdQf8Xw=
X-Received: by 2002:adf:e488:: with SMTP id i8mr2313927wrm.285.1625211810128; 
 Fri, 02 Jul 2021 00:43:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvlK7RtqlD3xWpGObPbNjh9vZpIqG7GdCOHwYDcS0/wE6sSPM0z2v0cveqFKI1NA0EPVIQpQ==
X-Received: by 2002:adf:e488:: with SMTP id i8mr2313903wrm.285.1625211809829; 
 Fri, 02 Jul 2021 00:43:29 -0700 (PDT)
Received: from thuth.remote.csb (pd9575db4.dip0.t-ipconnect.de.
 [217.87.93.180])
 by smtp.gmail.com with ESMTPSA id z5sm2315263wrt.11.2021.07.02.00.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 00:43:29 -0700 (PDT)
Subject: Re: [RFC v6 13/13] target/s390x: split sysemu part of cpu models
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-14-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7f8c8265-0102-925f-d3b7-8028c7c1fee4@redhat.com>
Date: Fri, 2 Jul 2021 09:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-14-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: cfontana@suse.com, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> split sysemu part of cpu models,
> also create a tiny _user.c with just the (at least for now),
> empty implementation of apply_cpu_model.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>   MAINTAINERS                      |   1 +
>   target/s390x/cpu_models.c        | 417 +-----------------------------
>   target/s390x/cpu_models_sysemu.c | 426 +++++++++++++++++++++++++++++++
>   target/s390x/cpu_models_user.c   |  20 ++
>   target/s390x/meson.build         |   4 +
>   target/s390x/s390x-internal.h    |   2 +
>   6 files changed, 454 insertions(+), 416 deletions(-)
>   create mode 100644 target/s390x/cpu_models_sysemu.c
>   create mode 100644 target/s390x/cpu_models_user.c

Straight forward code movement. Looks fine to me!

Reviewed-by: Thomas Huth <thuth@redhat.com>


