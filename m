Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF89297589
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 19:08:54 +0200 (CEST)
Received: from localhost ([::1]:46558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW0Yf-00038y-JR
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 13:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kW0XB-0001cA-N5
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 13:07:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kW0X9-0006LU-TV
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 13:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603472838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uv348hOlmwnXCqW0YKJPMk8st5yikMTDxnAgbpXKkIw=;
 b=MMOFR3UFXsc0p/+qYFKXvA5bW09cHU6Za47X7ykO/X6Zp8HZ0N6Saaitve8HeKfbqGkiVh
 pmbnd5QrinMNzgyAERe+Nx+ymjwD4TQoIk2ahs/4r26Gzitgl1tl+IfqytpL9tVrn2d66N
 SkH3dIHeSIk6XPSqnB4NDPeo/qcOgD0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-QabkRt8iPsiAgGLx7bqSlg-1; Fri, 23 Oct 2020 13:07:17 -0400
X-MC-Unique: QabkRt8iPsiAgGLx7bqSlg-1
Received: by mail-wr1-f69.google.com with SMTP id i6so807101wrx.11
 for <qemu-devel@nongnu.org>; Fri, 23 Oct 2020 10:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uv348hOlmwnXCqW0YKJPMk8st5yikMTDxnAgbpXKkIw=;
 b=c593BzMA+oKnzdsWcVJ3gQapFeTdG5FDfV8NYiryegt/DQjs2Ogde+KzNSU1hV58+r
 dNd2Tjtq6GlLZXs0mCMIvgVYfimZ7nLm2kbrqQW+8tVSrqPioshhOnsHU8uKysziqOfp
 z+UCBZPvp/o+nRqqfLL7tEWEBuO2nDd0Y2+JY0DWNrnJmUXsiSvpg2B3Zdc3cZsqCfbi
 /4ndpQ9wCpPSErOfjizKGtyXJT03b1DRHbwLTfP8TBlpsaGZmJwwH/V+VsfgwQQ+YiOn
 ikDX0lCsWfnVZUk131tBJ+hMztThnkHBabjEJa4AVnRw2gyEC7fLCf+a41WTHdqI82sH
 U+8g==
X-Gm-Message-State: AOAM5324mdJtDx4CwuFyclku4TNMoXmz5bOROI/aR9W4xrBzo6sXBMIG
 Besy3QmWtrYRcLFHPJMYjFuAz66zS1E2UffWdjgu0RYNXVIJidXlp8TbH/bqBBpneZO6puhRFW4
 hRYd5InhsF2BjdYg=
X-Received: by 2002:a1c:2601:: with SMTP id m1mr3134483wmm.12.1603472832774;
 Fri, 23 Oct 2020 10:07:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtrU3Q52WqZZY7bvliRrgwoDopMnzV1GRRrPLoh1IEas0fcCOEs/AdqtoiVDD2HH0BTsjUeQ==
X-Received: by 2002:a1c:2601:: with SMTP id m1mr3134475wmm.12.1603472832591;
 Fri, 23 Oct 2020 10:07:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a199sm4847229wmd.8.2020.10.23.10.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 10:07:11 -0700 (PDT)
Subject: Re: [qemu-web PATCH 6/7] Add link to "edit this page" for all pages
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201023152957.488974-1-berrange@redhat.com>
 <20201023152957.488974-7-berrange@redhat.com>
 <d61c100e-fb49-6f13-77e0-2262cb06946d@redhat.com>
 <20201023161912.GB463062@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d50d8fe4-c980-2765-7a37-feffff5bfb9a@redhat.com>
Date: Fri, 23 Oct 2020 19:07:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201023161912.GB463062@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.108, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/10/20 18:19, Daniel P. Berrangé wrote:
>> I think this is a good idea *if* we switch to merge requests for website
>> edits---which isn't something I'm opposed to.
> Note if you disable merge requests, then the page we link to doesn't
> show a live editor. It merely shows the read-only source. Not as
> useful, at least the user can see which source file they need to
> touch in their fork, which is still a step forwards I think.
> 

I agree, so I think if you change it to "View source" it's okay.

Paolo


