Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C89C40CF4D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 00:29:50 +0200 (CEST)
Received: from localhost ([::1]:59604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQdPY-0006V2-NW
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 18:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQdNp-00057k-1I
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 18:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQdNl-0007Xp-46
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 18:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631744873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+V5YK/aF41NGzOoa7GPgR7Dn2BQjsRHyTfZrd6AIPaY=;
 b=LS86xBUZO93iOkpYYAfmpbrjtp1uIm2s87fLh0sirhWi+MtJiLTWENx4pH5uv4SYq+DFkq
 ESVnNWlziVX77lW8v0aL0Oa1V8Z4oFDHqYLd6Btvvvwc4uqC2/MJ8Ut88YbID45wbrHsxo
 Bd5qWU+Y5FbeLxgmuiOe9EtqwDr+uto=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-Jl59xMFXMFWQZ1qFM6_ZTg-1; Wed, 15 Sep 2021 18:27:52 -0400
X-MC-Unique: Jl59xMFXMFWQZ1qFM6_ZTg-1
Received: by mail-ed1-f70.google.com with SMTP id
 y10-20020a056402270a00b003c8adc4d40cso3118880edd.15
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 15:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+V5YK/aF41NGzOoa7GPgR7Dn2BQjsRHyTfZrd6AIPaY=;
 b=XXRFtHpQ9jzQig+pwukVoG6t6YxGzuQI78w5OWVZg+/2GP9VI+C63E9ZI9qYWE8sFF
 apzL8jqVszJpCjHWAGp/n41H4aaeAYQX2V1DR0fwbqBz1gNtvEbNAQH5sdZW/8BrPJs7
 gXUPdzN6OXn9THmlrMDRVkuddtJlQfKMQa8vllokUcf5l1F3bLDzb038vezXGqdAScuo
 zpdkJnaZ4/U21mbaZGBVyiT8CIMzitYewnxDat8Dn6uLJO8r/jztH2vhnZ9sPNFiHxhz
 FALtUyPuUmVo32jVQ4/yUSiCqZQnB8Y8WjcU3FvOSMBOtJUu8puyuFRhjr/W1dcRf7rr
 +GCw==
X-Gm-Message-State: AOAM533cOPXm9E6wwow45wLXNFv8yJsYXDBojTyU1r1efA9GchwGUsss
 YDjGxxiQL77Cr5Mv7H+sYhEiMZKaLw5mI0q7cpOoAaE9fr2gazCxp9/V1x6Cz5akic+B4tkYfJD
 1RpJpOobFc8qihtU=
X-Received: by 2002:a17:906:1615:: with SMTP id
 m21mr2640838ejd.279.1631744871379; 
 Wed, 15 Sep 2021 15:27:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb8sB/dEwGmtWzFpUj1ABWHW+smEOqrGAB2q7qrB4yk1Nw0rHqCvYcpolB+ihBZIEUnBCdZQ==
X-Received: by 2002:a17:906:1615:: with SMTP id
 m21mr2640819ejd.279.1631744871220; 
 Wed, 15 Sep 2021 15:27:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id bq4sm509357ejb.43.2021.09.15.15.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 15:27:50 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Gemfile: Add webrick bundle dependency
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210913182927.1022862-1-philmd@redhat.com>
 <9f52b00e-0189-8f44-96d4-cbb398c4514f@redhat.com>
 <YUBbjbJwpcpxjDmt@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <574a9927-9a2d-f606-5192-3b66a1847b12@redhat.com>
Date: Thu, 16 Sep 2021 00:27:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUBbjbJwpcpxjDmt@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/21 10:21, Daniel P. Berrangé wrote:
> Yes, this is needed to fix Ruby 3.
> 
> I didn't propose it myself as I'm not sure if it in turn breaks people
> with Ruby 2.x ?

Does it pass the GitLab CI (which uses 2.5)?

Paolo


