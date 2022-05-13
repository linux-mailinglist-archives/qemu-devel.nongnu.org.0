Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EAC525DC7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:46:38 +0200 (CEST)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQwX-00044D-Or
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQsM-0001Mp-QA; Fri, 13 May 2022 04:42:19 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQsL-0003id-BL; Fri, 13 May 2022 04:42:18 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ks9so14880008ejb.2;
 Fri, 13 May 2022 01:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8AEBFK3TLB23oX3L37Csh8MQg00IBeRwRhpzg3URHhQ=;
 b=NUfq3xcYPwzrLVUdSvVhvItedzr38EjuaJ37rL1zAouI70s/I7GOvllE9JP24U/f44
 1dED5t6xsQ0sXmvBMYJ20g2/347hGorC9vo9FySLdY8G6y0rs6kGy4KM+hHV4u2hlDZr
 BUz5lqasZOpWpNYZdNfxBtQvoUMkpF14p3rd9hLNVgx/LKdOodsklW844TU0+D7kS3ah
 R9Vj6oU4+jo1K+xvS7InJ8HBSONEiXAmq+KcLqXWcrD1Iao52vQJhx1xeYF+g1CKFifd
 f35Bf+aVOPVAHv0D2QEH2q7zm8v59agtADSUzvx5m9IlDwv/N2n2U7QXmbT1dbX9C6KA
 Yiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8AEBFK3TLB23oX3L37Csh8MQg00IBeRwRhpzg3URHhQ=;
 b=stceq8XcafQo7NLddU37Qyr/BhJFYynzgMhXWGgFMts1Gflqkfa/G+Mrq0dvrGZnPT
 6rDkt019w/HvdRjOPjunHv6CrqKRRRNxmgTy6NgtFIAVlb2bDkAlImgJONOyFGLXsSJ6
 Ka+FjjFB3NQX8pTWpXfHem/5DkX9O6OhGH5HXtPpaeZvNZ5EiEDDxcWjr7tVurv4oLnq
 SFUMOYoe76zASqjE4wG9MGcKx4D11VbGNhN+9MzfnZAawVLdfIDb6r5TXngkU8Ybv5qo
 cPiZfKXHxh1JMXeMaQ82buRb5DZxEWKAwci8/AeGTX2kutu1/Koi//2NVVEOTmGUuITU
 gNlQ==
X-Gm-Message-State: AOAM5323YUKeyDOhLmpmkME7vQlCSsJFM119We3FdrDO5j/oiTAmshbm
 Uc+Z9ckx3XI7F8cA/hkECEQ=
X-Google-Smtp-Source: ABdhPJxeLIGHtEBykAT2d/iIMjXCaF4AFBGQJxOnHGdc5Uj/0ND06+hO0iMyfdECkjBb7N1XHcXi1Q==
X-Received: by 2002:a17:906:fccc:b0:6f3:7569:77fd with SMTP id
 qx12-20020a170906fccc00b006f3756977fdmr3293233ejb.266.1652431335764; 
 Fri, 13 May 2022 01:42:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 f5-20020a1709063f4500b006f3ef214e13sm529541ejj.121.2022.05.13.01.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:42:15 -0700 (PDT)
Message-ID: <1f2b00d0-2884-ec26-fe43-1a75f3d23e87@redhat.com>
Date: Fri, 13 May 2022 10:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 1/9] python: update for mypy 0.950
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-2-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513000609.197906-2-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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

On 5/13/22 02:06, John Snow wrote:
> typeshed (included in mypy) recently updated to improve the typing for
> WriteTransport objects. I was working around this, but now there's a
> version where I shouldn't work around it.
> 
> Unfortunately this creates some minor ugliness if I want to support both
> pre- and post-0.950 versions. For now, for my sanity, just disable the
> unused-ignores warning.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Whatever floats your boat :)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

