Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE7A402A79
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:12:42 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbq5-0000WC-HI
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNbag-0003zE-0s
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:56:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNbac-0003rp-Vg
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631023002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDW6fzLUU6CHzmdb0BPu1PT1hFSWrlUO/b+GtVF+gbc=;
 b=RPZwU+8lucKvmqD1aWelIu0XXMtpDLHMQ3WbG/YRgiq3btiUz45SH8SrsrkSi6JrrGeyZ8
 hw2taKF+vrJrNensmUbY2KENMziZUh/cODfTki1Q6IKHcqVAOkaYv9sLt5jKVvtRleoYvV
 vTh15RPuhUNqNjmJM5qTitDQ5hSmXvw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-IIu9QgBpNYGEXLb0SMj45g-1; Tue, 07 Sep 2021 09:56:39 -0400
X-MC-Unique: IIu9QgBpNYGEXLb0SMj45g-1
Received: by mail-wr1-f70.google.com with SMTP id
 n1-20020a5d4c41000000b00159305d19baso2146211wrt.11
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WDW6fzLUU6CHzmdb0BPu1PT1hFSWrlUO/b+GtVF+gbc=;
 b=sfBliV6IWNFBW8HqonP1XNVWE7aGP8V8t2YOQ34o0K1kBkCWxCfPgN8wNSKAK1AdnC
 u1NlNaEgRpn184vKxONIP8qQSkwKl4hI4za4o28XJorGvFA/d83WblIMsby6if5M/O8O
 IC83MS83TM418CIAcyxIeJHsIoCwQisx6+r1RgsWwUYN9Q5ob4QXdLR/5obsEo4DP5Xw
 9h0c5a8jYoDTD7tY4MTbEmT2Cijccd9x7VR1EALIkHg2QhUpSQpFrqIlOmJdT4Pqekkq
 P6KG/eB2U0O+4exuurDaldyAzus0KVV3jnovzmUojOCa3WtLLRapLPp47Vg2LaXBYSd5
 lrlw==
X-Gm-Message-State: AOAM533AhIyU3QcXuW5gufr0gOu5c1XZ5JbxFVf7zcWJ7+uZp06cDypN
 +R8ZXfnMrrtxwA2zcvAepegLkKtJEJ8r6pUm4P868/QJUu9p/3jH/hQHdpG73j+9ioDPIWzrx5E
 wZmVNrQKEJpgjqiY=
X-Received: by 2002:a5d:410b:: with SMTP id l11mr19351024wrp.76.1631022998492; 
 Tue, 07 Sep 2021 06:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlydQ9C5jwfgiZZd2PC+EynOCa3P9MAoRD/DQHKGEQ4p3Q2GFAkt68myaKxUKjDRsOGWAekw==
X-Received: by 2002:a5d:410b:: with SMTP id l11mr19351005wrp.76.1631022998233; 
 Tue, 07 Sep 2021 06:56:38 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id k17sm2604099wmj.0.2021.09.07.06.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 06:56:37 -0700 (PDT)
Subject: Re: [qemu-web RFC] CONTRIBUTING.md: Mention maintainers
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210906170038.26602-1-hreitz@redhat.com>
 <63441b5c-2262-3b7a-e0bd-e6f41401a64a@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <a1f5fc57-a5df-2e02-680e-b7010642f168@redhat.com>
Date: Tue, 7 Sep 2021 15:56:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <63441b5c-2262-3b7a-e0bd-e6f41401a64a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.09.21 14:57, Paolo Bonzini wrote:
> On 06/09/21 19:00, Hanna Reitz wrote:
>> This is an RFC first because I feel bad about sending a patch that
>> gives people responsibilities who aren't me.  But Thomas seemed to agree
>> with me that making this requirement explicit would be nice, so I guess
>> someone has to send a patch for it...
>
> Don't feel bad, I'll make sure you'll have to send a v2.

Well, as long as you aren’t asking me to take responsibility so I could 
feel less bad...

> Actually I'm kidding, this looks good to me and I've merged it.

Thanks!

> But we should make a decision on accepting qemu-web merge requests on 
> GitLab.  For that, apart from touching the CONTRIBUTING.md file, we 
> should also edit 
> https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/ which 
> suggests using "git send-email".

Well, it’s definitely not my decision to make, but FWIW I’m in favor.

Hanna


