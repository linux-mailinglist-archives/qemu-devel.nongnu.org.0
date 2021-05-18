Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8422338770F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:03:02 +0200 (CEST)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixV7-0006IS-Iu
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwzk-00084p-KH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:30:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwzh-0003cA-5v
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPo0GllKDcfBVJkOQc88q3VvKKVzj8JTnmWmxdZvdQ4=;
 b=hTk4/rB7roBBJ2tlBGIrO29DpqfJPZDzlt0oml6JqBNJiHFBZh++7g7F4sH1yl1wGVGJlr
 IWjjYjta+UJtyjaadE+xUIicpLlNnhGTsGfgIK5kUKVwAzNybAl3auDiikJBXYmILFgH0q
 g4UiaphmnQ8cQYE0UQRVJujRpeVIECk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-S4QIglC_O-2o4aZ2EQTnoA-1; Tue, 18 May 2021 06:30:30 -0400
X-MC-Unique: S4QIglC_O-2o4aZ2EQTnoA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a5-20020a5d6ca50000b029011035a261adso5352343wra.17
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sPo0GllKDcfBVJkOQc88q3VvKKVzj8JTnmWmxdZvdQ4=;
 b=DdlQls85sVWbRwTftUl3+ogv1vUoMciPq/aFGTsHYDIqIScyvGvx1wlS5RKcb4m6hZ
 j5xU9UfJTeuUGqVQjMcSZVi/Jb8MpG1IWm7IpiEvfCNeza9k4K4Xi9pJ5Hvv65dEDci4
 4RrUsam+oeMJwIgTGdiEHAHcvA8gXg1+0mADWyHOOAFf9wW1oq4nQSkPx5MgLgttiLNw
 5TCsOJ1mdYEjlMTysjHGePGHjzeErMW8NTDhELXjFiGxu1l7/twR617xhUaHJpkFlD0W
 8bYjNEWMklyYJQa4KrgQhC3boCtm7p9du3GWfH0roWJgp73eqzptxs430xvpW6DEnyMf
 Bu5A==
X-Gm-Message-State: AOAM531w3UgfUhCUgTVLfXnaNvSSDlP2URR8jXhofUpaFhCYNFI7jbSF
 KMyWtdF8OS8h03Fe5iAmEQymLQ86qytxUnhG5+XS2mHI7v+xFz/Uo2bgBi5W/RkT56pfEnRvIfT
 XvECOc1RL2QHoWnY=
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr4738224wmj.46.1621333829702; 
 Tue, 18 May 2021 03:30:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyRcd8W4BYIVBD27baTYD82lsDoeXJfyGACnuAWiupOvthN55khhTUlrs2bEsNorSUk2/Heg==
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr4738202wmj.46.1621333829441; 
 Tue, 18 May 2021 03:30:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l18sm20864769wrt.97.2021.05.18.03.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:30:29 -0700 (PDT)
Subject: Re: [PATCH v2 39/50] target/i386: Cleanup read_crN, write_crN, lmsw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-40-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cc4dc600-afee-c822-02bc-18c0d845eb8a@redhat.com>
Date: Tue, 18 May 2021 12:30:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-40-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Pull the svm intercept check into the translator.
> Pull the entire implementation of lmsw into the translator.
> Push the check for CR8LEG into the regno validation switch.
> Unify the gen_io_start check between read/write.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


