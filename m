Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66132426684
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 11:17:10 +0200 (CEST)
Received: from localhost ([::1]:56152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYm04-0002jP-VL
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 05:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYlyi-000226-Rs
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 05:15:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYlyb-00089g-Si
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 05:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633684534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAH5OaRGVEwZlp4InZhXnsoq6LNAlT9l8fI8re1cUtI=;
 b=DGgYZldY04AOgYA9a1i0HIeYVszPrSF953QhrBzbIwdktsH8OTDoWjRmoik3VPMZUGNvVS
 WxjpHkzaaBQGi0XY5Q9KpKXTTeKXhgvRF9xfVKsKHhOjpfSbYB0V0BKbhFf9Xs1vt0tMSF
 mEBwFesi+JNOlzdZa7wjXGiYA5I1GQE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-V15r_HKZMFCZBIydSOhJMA-1; Fri, 08 Oct 2021 05:15:18 -0400
X-MC-Unique: V15r_HKZMFCZBIydSOhJMA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so6799448wrb.14
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 02:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rAH5OaRGVEwZlp4InZhXnsoq6LNAlT9l8fI8re1cUtI=;
 b=aNC9KO314A6yg/EhwNH1jTavTBbi64fiRvHrgzzAFC9Je6UynvRyhfd++S55FXWoZV
 za6fQfLaYe0J7E7CQzGn/jc6owBhIcD6BQ88Q7wEtlk7zHZz4pPKDJCWBboTiFZv7KO4
 YkKSjq5A6rcrE/ZPhNNe3Nks4DTplwPR0MyYQNgHJPdQMzRIpotCDQj+EkwgdWxGxiX/
 cVDpm697ypEKYvebgnVzYxbVI2iBWGV4oYKN/d1kqw4Ne3JHAIKobg/bh8fI2QDV9JkY
 Y1UXm/km6/wzaNQX2LC1qQJIYPAEtqkm4hgcrhDFOLalA9m4Eg9GrsC5/V5l3g3HEiAN
 IP4w==
X-Gm-Message-State: AOAM533A9/dseyPo6mTF+D6Hd6yPB7dpcGRMRfoID7/IMliDO5+azcar
 5jIIvJOgbQddHVbT4EY8LEegcbH1fQtY3zpu+iwaLEWMtqt2zQF2M1AtKhMgtQArDZ1IU3mOhiA
 dWCg2k1dJ6JmDeBw=
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr2172770wmj.76.1633684517548;
 Fri, 08 Oct 2021 02:15:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwNUF5gmiCNxHh6NE+LYoTM4MqswpdIc28yZ50UPhJ9vyii+qiWMDeBEK+0qNIvRhHxh6Cug==
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr2172746wmj.76.1633684517246;
 Fri, 08 Oct 2021 02:15:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x17sm1880363wrc.51.2021.10.08.02.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 02:15:16 -0700 (PDT)
Message-ID: <581e0147-3c0b-dbec-7b6d-2d32e44b8ad1@redhat.com>
Date: Fri, 8 Oct 2021 11:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 15/24] configure, meson: move libaio check to meson.build
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-10-pbonzini@redhat.com>
 <dc8d3342-96fa-a0fb-f337-c87066eba911@linaro.org>
 <52debbd6-574b-1f33-c880-28d229679eb0@redhat.com>
 <CAJ+F1CKeTxojeVVWfS1WS9b7b+B7rXS5ASRtXP3cAsLd6A77pA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJ+F1CKeTxojeVVWfS1WS9b7b+B7rXS5ASRtXP3cAsLd6A77pA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/21 10:47, Marc-André Lureau wrote:
> 
> 
>     It looks silly but it works ("when: []" is always-true, just like in
>     python all([]) is true).  I'll remove the if_true in v2.
> 
> 
> and why not  keep the one-liner version?:
> stub_ss.add(when: libaio, if_true: files('linux-aio.c'))

It would link libaio even in files that don't use it.  The stub is used 
by those files that get util/async.c via libqemuutil, but not 
block/linux-aio.c.

This particular stub (and the equivalent io_uring one) is a bit silly 
though.

Someone should check exactly which files get which stub, maybe there are 
opportunities for simplifications.  For example if a stub is only used 
by the unit tests, we might as well move more code to libqemuutil and 
remove the stub.

Paolo


