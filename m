Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2840341E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:07:45 +0200 (CEST)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNqkK-0000RU-EE
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqjE-0008BJ-Fh
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqjD-0005fs-33
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631081194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UTHv8YS4AgvpbBSxm/zplofz9TwT9wJ99XgYSg8cbc=;
 b=TpwEMM7lG6O6xV3KYgpG/dMdP4n21ts+wOLmqcvq9N+OZmb0LpJyCOK3JYYSuJ/ptwuoXD
 5aOu6InQZRgdCrUl1JWRtvoygPsUgMS8klQpNzp50xkB3j5B7OWD6FtnmGXu6m1q5e3/kn
 z23H1hMpwv+Tkjqc0vcr2lfk9tqDWVM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-CH91Uur5Mr6OlcYC_nDENQ-1; Wed, 08 Sep 2021 02:06:30 -0400
X-MC-Unique: CH91Uur5Mr6OlcYC_nDENQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 f23-20020a17090624d700b005d7f8be91eeso468570ejb.13
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 23:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+UTHv8YS4AgvpbBSxm/zplofz9TwT9wJ99XgYSg8cbc=;
 b=mQ4UxJpujrbk3s7NF31q5896yOm0XgxG//6hLK5/sqMzOyFH9L8ZyIn9NR5W9bhncw
 YaKDjnJpEp+vRffATNXBe4bkIeOGy4JiedHE/QJWrFgntAQnw07nwT9cVflwViBCV1ZR
 t6cvPcqUqTFw4iaIWNGeRWIBlEz9MEmoc9CscKVYDNmk/zsSRo+m26O01/LiK1jJAace
 otT3pMLWfie+9jc7VFgJCRjIgVJF1OqVSsqpKu5e87SJ3VRNuJk+LyyD3XgWgczJGqRP
 +cxyAjyYfgpbJELPPPFXd9fluCyRm2FzzhlA8AqbACz5P0bgkCgFCYc6gzUOvvZ+p0Xo
 KRMw==
X-Gm-Message-State: AOAM530HTjUXhl0vB8u16fa1pvwHN4/jgmoZdZf0CZcQV0p5FiPvrcPD
 qk5w5fQT4hi/z/9TcUTyoSlZH/peBSAxQhMo1KiEqFtIdvUzxZHphIfPFqsTTKMlYHtvcwYie2A
 gc7IAMrsEneD3/i0=
X-Received: by 2002:a05:6402:4247:: with SMTP id
 g7mr2098522edb.287.1631081189658; 
 Tue, 07 Sep 2021 23:06:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkwBY1jfelH9OUPuCqSHpFzVcTbXklH1zXy8tV1Juf6tjpEbRu9sEa+rRAq6/gnqs4g427Mw==
X-Received: by 2002:a05:6402:4247:: with SMTP id
 g7mr2098501edb.287.1631081189445; 
 Tue, 07 Sep 2021 23:06:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i11sm529651edu.32.2021.09.07.23.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 23:06:28 -0700 (PDT)
Subject: Re: [PATCH] fuzz: fix unbound variable in build.sh
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210907110841.3341786-1-alxndr@bu.edu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e93ce7f6-2f0c-f676-e1e7-b5a59376561b@redhat.com>
Date: Wed, 8 Sep 2021 08:06:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907110841.3341786-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/21 13:08, Alexander Bulekov wrote:
>   
> -if [ "$GITLAB_CI" != "true" ]; then
> +if [ -z ${GITLAB_CI+x} ]; then

I would slightly prefer to have "${GITLAB_CI+x}", since "test" in 
general doesn't like parameters that go away:

$ [ = abc ]
bash: [: =: unary operator expected

What you wrote however works, so it's okay.

Thanks,

Paolo


