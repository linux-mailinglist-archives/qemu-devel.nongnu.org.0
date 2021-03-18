Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0FD340BB7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:25:36 +0100 (CET)
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwOt-0005Lb-O6
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMw4k-0005b2-Qc
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:04:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMw4f-0006El-Ca
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616087076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WvvwvOk+TXuaVCZJMhMhUC5Pots5Fx7JHiTWjeRqSk=;
 b=dNK53oaw3PztSS4aoC5C5XxizNxEQXt1NU2nJWiLiS/gr5Fp/1CrdfzsaY+4IAyEc/6SK6
 mM8qjLCO9T6kQ0HNWzJvwjThv9OG90WUMdElH15foh2fDkDrvUQB0nXW/Kzvd7JJmYOoOg
 Ja/M+AOH3FPXrBmYzjA9zxhwjZcRA4s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-TcJ9mZXyNseCpE3wFBi67w-1; Thu, 18 Mar 2021 13:04:31 -0400
X-MC-Unique: TcJ9mZXyNseCpE3wFBi67w-1
Received: by mail-ej1-f71.google.com with SMTP id fy8so16922916ejb.19
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6WvvwvOk+TXuaVCZJMhMhUC5Pots5Fx7JHiTWjeRqSk=;
 b=GBcE9KWi1ms+ynU1PaH+J4zfnxYxETI/XTtKSYEH0+d9i5Q7QWyds3rq9SS1XzWAq9
 VFzYeD7vt2dLJypv6c5P4YhNafwlxBtdWVrALqKn3+0zOUHGZj06MJMzZuUD8gmKZolI
 NELf1V7CdWSzCV/LlDrIiKXSMJDqlenuVueaot6609h8eFazxioo86J0NiYWH/Aqjqqi
 LwhNyioy+/zrgEh1xCy/tal/gnjIKLwFFYTWhQPgwaY5sJ/Qt8hlR+3C0EYEIgjkn01d
 LZfSXE8iIsu5DHwp/kpJW8eCaBXsfpJ/jBYceAzpA97CdaSebL7Sg9S+c5yF3LfIZzuH
 gtiA==
X-Gm-Message-State: AOAM531rXo34vT1NBuZabAQqfEBBb458WBWUGct8SvpiXLMj1BOAF5NP
 oYk51euFn4p2VORoe9/8Nk4nVPMsjvkYJQz3iV5ZWuMQgoWnGLraDgawqYflaeE2sss/8GbxOXd
 RBp7xb6/YT2kxtPc=
X-Received: by 2002:aa7:c551:: with SMTP id s17mr4863655edr.291.1616087070563; 
 Thu, 18 Mar 2021 10:04:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuEBg8q72jhiqaFS+ZCf+rk3DC83NOCYyI8HZoPkz374nogBI4LL9SDc84xvD0XLJPl5TC/Q==
X-Received: by 2002:aa7:c551:: with SMTP id s17mr4863632edr.291.1616087070357; 
 Thu, 18 Mar 2021 10:04:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i11sm2213174ejc.101.2021.03.18.10.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 10:04:29 -0700 (PDT)
Subject: Re: KVM_MEM_READONLY slot flag not working properly
To: Laszlo Ersek <lersek@redhat.com>,
 Lorenzo Susini <susinilorenzo1@gmail.com>, qemu-devel@nongnu.org
References: <CAHFRQs1GuB+8tw+SDK11LOLXF4H6z+6+ZbQMTABXNK3gj7vffA@mail.gmail.com>
 <f05ce059-0802-404f-e2df-f8a7ddfc43c5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a82e8771-913c-8dc4-03cf-c6148db1e15d@redhat.com>
Date: Thu, 18 Mar 2021 18:04:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f05ce059-0802-404f-e2df-f8a7ddfc43c5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 17:07, Laszlo Ersek wrote:
> However, when I try to register a new interrupt handler (for instance for
> the edu device, just to try it out), it works perfectly,
> meaning that the IDT is not really read-only. Do you have any idea why? Any
> suggestions on how to solve the problem?
> Of course I've also checked KVM_CAP_READONLY_MEM, no problem with that.

Sorry for asking a question that might be extremely stupid, but: did you 
check that the guest is writing to the IDT?  For example Linux never 
modifies the IDT when it runs, in fact it even makes it read only (check 
out idt_setup_apic_and_irq_gates in arch/x86/kernel/idt.c).

Paolo


