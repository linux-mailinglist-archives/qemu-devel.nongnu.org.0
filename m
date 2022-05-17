Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE4C52AB4D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:56:35 +0200 (CEST)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2Mr-0005zN-9s
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nr2Ej-0004yE-EC
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:48:01 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nr2Eh-0007c4-Sc
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:48:01 -0400
Received: by mail-ed1-x52a.google.com with SMTP id fd25so80717edb.3
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jYjoQu7y23gADn78aC3cEQ/0RyVMFW/54C282GYAty8=;
 b=RXM5cvAdqCMhgj1GpZhyCxSGLVUMqWVrAVO721Gfu29t52lc4zSGMVtpXrN+oxm7jQ
 3TOAgq/UGC5W+87YcvDGSPMSv9IbSvVxepdNz9lGwNhy3nsdiPWMtDOZZXE4R33omaEk
 G9s4d1ErX4M5da6DLeC/U0WP9gfiOYppBozprRktJjqLJ6axw60e2qlh86PQXoLzvChg
 Q9sO37AmmjXN3TstGcxIBFn592F/fh0XuCS5AX3H86XwOuLBqdzifAKx+p6a57/VUKdz
 16IytKTag52bQg/7NJDPL/wguuTOTvvRALCeeMoAaht6po5AMpyNpjQJin8+ByRredzM
 vwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jYjoQu7y23gADn78aC3cEQ/0RyVMFW/54C282GYAty8=;
 b=kv5NRhCZ0uISgiE4aSPoUUPldoLGObii2iNYIJ3i0G8xhMPa30E/RDGoeEa4NomjML
 yBsl+Z+8bP9EtmEhN6vUOML4e6asxC9nsG4JkbriGu5BzWzyzbBLsaYhqRJFM7/QI4hk
 q3niHYcFMWORGfeQV0PYXLBDgLHbE6N2RY11RDXbVEkeEO1T21NJHct701HEAWe+1ccx
 bfRKhkkzZ31zf3hKrjtnEh/W+xnn3H1QF+tKF9UVq+PIUovJlRBZswMNl21GAjyRdYm/
 vf0equXKbfG5YLTkQX9MeMYDga4ZBa4Aqs5+FJ/tBBTDnyzGOizFxvNMlcQvycNUiCT+
 8dVA==
X-Gm-Message-State: AOAM5311lwdccaU5tekGtFtTY3j/q3s0HEdPZPKi5zJRNv63M5asZzaN
 GKlqTFrgkD7o7VyqyiGXlf4=
X-Google-Smtp-Source: ABdhPJxKAikc9TxpWWPMMr0FHHZ3Lbzfp+tWSDDL5iQgp/ZD3T6WsbxoBtuq/B7aqOOHVIHVAgMULA==
X-Received: by 2002:a05:6402:75a:b0:42a:bbb9:504c with SMTP id
 p26-20020a056402075a00b0042abbb9504cmr9179693edy.348.1652813278132; 
 Tue, 17 May 2022 11:47:58 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 cz26-20020a0564021cba00b0042aad7448besm30378edb.18.2022.05.17.11.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:47:57 -0700 (PDT)
Message-ID: <986d46b2-a883-4e8d-6e51-36d776062a53@redhat.com>
Date: Tue, 17 May 2022 20:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 01/16] configure: do not define or use the CPP variable
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220517092616.1272238-1-pbonzini@redhat.com>
 <20220517092616.1272238-2-pbonzini@redhat.com>
 <e157719a-f3d3-cf51-b3a1-e5a295bac39e@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <e157719a-f3d3-cf51-b3a1-e5a295bac39e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 20:07, Richard Henderson wrote:
> Although I'm surprised we need to do this pipe thing. Surely just rely 
> on the assembler-with-cpp rule built into the compiler driver.  Are we 
> using a custom AS in this case?

No, I don't think so.  I'm also surprised, but decided to change as 
little as possible.

Paolo

