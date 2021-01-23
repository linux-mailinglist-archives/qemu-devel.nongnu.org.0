Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B5301781
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:11:47 +0100 (CET)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3NNy-0006Io-9k
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NLS-0005hM-7W
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NLP-0006FG-PL
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611425346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cc0dHbxuw+JzfVGEGiiPQ2dYLA8uiDkTxDss4kiGdAw=;
 b=FFKhoBf4arAcUN0+OTrIXzPii5OWhPFLFphqa0Grv8w1OiotuahL+hk9/joZV3Wbdnz6Yx
 2rdds3VD5tS5Q+fEczoT+mWK+EZbkOe4yX6KHnF79lhJf8v55bfbMBaEqhyjqLnU1KZ1S7
 JAH8LkZMChOpUf5zlqSpS9zJUkBc1xc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-AytLlhwJOaymussLxnze5Q-1; Sat, 23 Jan 2021 13:09:03 -0500
X-MC-Unique: AytLlhwJOaymussLxnze5Q-1
Received: by mail-ej1-f69.google.com with SMTP id rl8so3007881ejb.8
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cc0dHbxuw+JzfVGEGiiPQ2dYLA8uiDkTxDss4kiGdAw=;
 b=thYl9iG1ELHCdrL0PA5Qye9OKVnExzZ0TViM1VtnxAbgPg5i+Ya+R7gs8nuj21YJa5
 xkLhQjEp4y+ADtjB+cKwG3JvOdtjTHeOnnvLM/OpM36hULeu7ULUeFbhNH1TLIWtTn7x
 mAwCdxc463f/opI/QkWBN03RtB5jm2ztohqPR2MOwoD533xPm9UxSjcqkURZtUqijz5c
 snumdbLYuztBy5GzOrcTEVG9MxcUQdHofTY8qEw6D4HyjYvZdXtJQCkmQwrYxISd0qpk
 hXrXevb+I3wCiapgAy1vS0PTikV08cxGRQjZ4jdvcgAmo1mhKzY3tYOu2gxWSYY5r9ci
 4fpg==
X-Gm-Message-State: AOAM530XRBlk/+cXaF3mcZ5A8Lnlu7oiLUXRuZfN+1gpj0bu96AvA6ae
 DcDu5xfzl10pBWh4yTpB1YqDXDwoOFyLcPq70M+/+ogaohtu+mbQgkDXUv3QZ8Mn/pOAFvjM9av
 0qUs3fCb6Mx15J8w=
X-Received: by 2002:a17:906:414e:: with SMTP id
 l14mr1432680ejk.476.1611425342010; 
 Sat, 23 Jan 2021 10:09:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0NZKcUZZrC6GSc4mp6n3etuxH32SfwlWn97a0EDcJvXsdtMMPButj6DX2+rEKPOksrF1OLg==
X-Received: by 2002:a17:906:414e:: with SMTP id
 l14mr1432674ejk.476.1611425341857; 
 Sat, 23 Jan 2021 10:09:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id f13sm6129151ejf.42.2021.01.23.10.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 10:09:00 -0800 (PST)
To: Brian Norris <briannorris@chromium.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20200615225827.183062-1-joe.slater@windriver.com>
 <CAFEAcA_ZU_w7PaYFVVaW1vzGySOLaNaThVcNQFNmd_GV-hG6Qw@mail.gmail.com>
 <CAFEAcA8BtVkBbHtLt-kB-AcZnN9YWtBahKTQ0wSvHWojF9CinQ@mail.gmail.com>
 <CAMxuvaxUqrq77_io9j6k7EU91vm7iEEBaTwLNsKd9YJ9NVR7rw@mail.gmail.com>
 <20200808013531.GA166030@google.com>
 <CAFEAcA__4GwKKe9rY4ut41f-S-u_AnSkdwHvSX0YoaPwjO3ARw@mail.gmail.com>
 <CAMxuvaw1Rpah2ErvGQWdD+K+KU=PFpfyNnM-95s5UUSXY6zj6Q@mail.gmail.com>
 <CA+ASDXMFw_-EH0Rt7AfLRHxent3o0ephp+GehZQkKbUioHMhBw@mail.gmail.com>
 <CA+ASDXOSR5ueNpwKRzuEEu9emS=yfkaLZiPt8Va_ZNx5vLRbgg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/1] os_find_datadir: search as in version 4.2
Message-ID: <2cb98ec4-9805-8474-9612-acbdf18c29ac@redhat.com>
Date: Sat, 23 Jan 2021 19:08:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CA+ASDXOSR5ueNpwKRzuEEu9emS=yfkaLZiPt8Va_ZNx5vLRbgg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joe Slater <joe.slater@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "MacLeod, Randy" <randy.macleod@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/01/21 03:05, Brian Norris wrote:
> It turns out that Paolo inadvertently (?) fixed this issue by
> refactoring, in v5.2.0:
> ea1edcd7da1a vl: relocate paths to data directories
> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=ea1edcd7da1a375ef7ccf8aa93b72827b518ad8e;hp=63c4db4c2e6d221cecb5aafa365934bb05724cb4

That wasn't entirely inadvertent.  It had been on my todo list to fix 
relocatability for good, I just didn't remember how it got on the list. :)

So on one hand I didn't remember it to be a regression, and I only 
really set out to make QEMU relocatable in order to enable the change of 
commit d17f305a26 ("configure: use a platform-neutral prefix", 
2020-09-30).  On the other hand, your report was what had made me aware 
that relocatable installs were buggy and inconsistent.

Paolo


