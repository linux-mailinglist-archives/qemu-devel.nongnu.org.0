Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB19438745
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 09:44:05 +0200 (CEST)
Received: from localhost ([::1]:46368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meYAl-0003oe-Oi
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 03:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1meY9i-0003A5-AB
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 03:42:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1meY9f-0005jB-JR
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 03:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635061374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLdLBgIZntIGd34uEBNTL3ZY68gmwIZU4F8k7GIfvss=;
 b=GvZRVYBhLKePc6/i4ttcSZatQHQBwvfiH/BbDI+hZUOimfZtxcL638s96xtIArEgUXv200
 CfCMsXA+iKHcJjl50P2w8Tq25KY4VqA9FevrD6b/Z8cMRHWOEqhfXCf9yKmVOfRG0xjSZa
 tRCYhTFaSm32zJq9P++rrLCIytBqjp0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-Mouk79MBNsCNPWjBooEFgg-1; Sun, 24 Oct 2021 03:42:52 -0400
X-MC-Unique: Mouk79MBNsCNPWjBooEFgg-1
Received: by mail-ed1-f69.google.com with SMTP id
 m16-20020a056402431000b003dd2005af01so5568448edc.5
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 00:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LLdLBgIZntIGd34uEBNTL3ZY68gmwIZU4F8k7GIfvss=;
 b=Fn/Zv/evSQd/358BDpHkISBk+u1zdl9P8ASIj9tMOE2K284+jmp+r9YiMayUnZzFtC
 ZRg53RXApgQFfyUm2WZC0nzVYr8GYeHVRtwdSAfXoLCec1BdADpdD0lBcmGStOJy5VFn
 LfWHixzIQkw8IZ3bB/UDzEREe9JfIjbiaporf/cr5cwyPYVQyNzUa0tfz80FZrVHYgvT
 dStLqVc4pnQLXZsvT6VnlMHANdQRw8SauHwrzKZuiv8Co6L3BiT+l/O0rZLeRQCRBenB
 k7fD5AJ+ozfDBEzG4b0+VDZg2Cc4GqOkECWldoM36Ixa/MinTZ5msaFV1Wrc0n45rfb6
 Yl3g==
X-Gm-Message-State: AOAM532WkOKrUzmsXgPadZW3U2ySsIwcmTcuPF4/SC4Yq+b1q38f7juo
 Z8/wzYRnD47IkwgKx2M8D5vvYEPImqUQ8EsM5PpzSAsIZWTqQ2hqIiYDSZoyIlZNUu8V7726FI3
 3myCwy3o4ywKPqSc=
X-Received: by 2002:aa7:c797:: with SMTP id n23mr15313895eds.275.1635061371347; 
 Sun, 24 Oct 2021 00:42:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzps4+Fo0E1ecSEJ/uu0NzErihkukEvgC9tObmHGgk091JlmEFEchIckHGhgS+4vjc2mW6yxw==
X-Received: by 2002:aa7:c797:: with SMTP id n23mr15313879eds.275.1635061371142; 
 Sun, 24 Oct 2021 00:42:51 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id ep4sm5766211ejc.18.2021.10.24.00.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 00:42:50 -0700 (PDT)
Message-ID: <f80220c1-84cd-e9c1-9542-40f4ea9aa419@redhat.com>
Date: Sun, 24 Oct 2021 09:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: gitlab/cirrus auth token failure
To: Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <8257c433-f8fb-7766-dec3-a220e9bee84b@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <8257c433-f8fb-7766-dec3-a220e9bee84b@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.781, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/10/21 20:31, Richard Henderson wrote:
> Hi Daniel, you win the cookie because you committed cirrus.yml.
> 
> I should have reported this before the weekend, but at some point this 
> week the auth tokens expired(?).  All of the cirrus-run tests are now 
> failing:
> 
> cirrus_run.api.CirrusAPIError: API returned 1 error(s):
> [ { 'extensions': {'classification': 'DataFetchingException'},
>      'locations': [{'column': 13, 'line': 5}],
>      'message': 'Exception while fetching data (/createBuild) : '
>                 'AccessTokenAuthorization(token=[MASKED]) '
>                 "doesn't have permissions to create builds for "
>                 '5748266831446016!',
>      'path': ['createBuild']}]

It seems to have fixed itself for kvm-unit-tests, so maybe it was just a 
temporary issue within cirrus itself?

Paolo


