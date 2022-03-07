Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD574D052B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:24:42 +0100 (CET)
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRH6A-0000Tj-0f
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:24:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRH3B-00067v-Sr
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:21:37 -0500
Received: from [2a00:1450:4864:20::533] (port=37819
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRH39-0005Vc-VA
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:21:37 -0500
Received: by mail-ed1-x533.google.com with SMTP id q17so20950555edd.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uiio1QdbiVhv4wLJb3RR+XnGOyGVjHlg49eJiN1BwO0=;
 b=JVhV3Cx9X5PgQOyw7G8nBmMWcAX3+wFnFHhb/QjEzQ5qFqOigVcT92bLpq7fyEHC/G
 fDlvXu3k7QMC5rEFNnCe/zySiR9+Wm0lS5R8mjWew2bltUzGJcItSrj2pvU5f0h8i/U0
 sG1HuoD/oikFgFRxwAeX9YfLmiVYswN3JNkHrvZkWfc1CXaZCkZ3dv6Fd1L9QeX55H+J
 fJVnMx+gyFBXIfri/+qGxuJ1hj/jqZNU6itHxWNEh1uWc4hEWbCKY7wEYS5izti4fgtg
 pxWw7uX1b+51MOPFbjpJOvO//i/14+9i6yYLm8s/D8cRylohUMPm0/u6UhjIHTZWGt5X
 /Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uiio1QdbiVhv4wLJb3RR+XnGOyGVjHlg49eJiN1BwO0=;
 b=geMZMOUcPzuduaLoCFjyXlGFDDG257wbQ+/LltNIwnfVRJs0N5D1PTEqzYBnYUCTBO
 uEvXQN508QJMca54lr+kyQ1w1OH8GfinGv6aPZwb+TKJoETm7a7cTHJPY70aPhdOF9NF
 nn//9imsrMp4q8kU0rlvTiM7HgY8yZ2w/h9BUp9GIpA6R/lty1fUChEeBykq/7bbfDU6
 pWGnpD1hI370I34xby0LdoOr3ouB7C4In6FvHZKvy1SC7anO+2MGjBSS7R/ATTUGjqhF
 KwlsMb94Pe2D1BPArFTETU1JOnRfQc1/FWjw6CMZCcv+rmPTOiqszlvKzLJ0b/C04lLo
 k09w==
X-Gm-Message-State: AOAM5339eiCHLMvDKq0Gey+OKHLGXejvraO4Hz4a8V8hsDza7gdEc+nZ
 hhwV/EHv4NVSUSig1t/mVUQ=
X-Google-Smtp-Source: ABdhPJy3o504tudLRjYgxX8uPEKfBjNeChDIKYMFxjGr1eQkCFl4YnRCCsh7pNfJqL+9nT/RqeV2AQ==
X-Received: by 2002:a05:6402:718:b0:415:a0e5:48c with SMTP id
 w24-20020a056402071800b00415a0e5048cmr12129225edx.156.1646673694133; 
 Mon, 07 Mar 2022 09:21:34 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 f5-20020a17090624c500b006cee6661b6esm5016443ejb.10.2022.03.07.09.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 09:21:33 -0800 (PST)
Message-ID: <89a0316d-7e9a-46d9-31cc-c3507483fffb@redhat.com>
Date: Mon, 7 Mar 2022 18:21:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220307151004.578069-1-pbonzini@redhat.com>
 <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
 <CAFEAcA8XshU90eKJM_4+_mLRhUCN+ExWzCkPTveLht0bWBb8=w@mail.gmail.com>
 <CAMVc7JU=easTepCd=j0QHWBcFrry7iYXgX1BbQjs27fmxZGXrA@mail.gmail.com>
 <CAFEAcA8h0E5i=iJswVwC+v_=vs_u92-s90wMgq_C5ZjSTsrZSw@mail.gmail.com>
 <CAMVc7JVZSTpD5VL1Ls8CcWZsoEMMzsZsGApZ+tNkuFhMc8_+cA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMVc7JVZSTpD5VL1Ls8CcWZsoEMMzsZsGApZ+tNkuFhMc8_+cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 17:41, Akihiko Odaki wrote:
>> That series doesn't remove the general design that has quite a bit
>> of "we know some other thread holds the lock and waits for us" code.
> Well, I don't think so. main no longer calls back QEMU code (and it
> should never do so in my opinion).

That's an arbitrary limitation.  With my patch, until [NSApp run] only 
the main thread has the lock and therefore it can do anything.  In my 
patch I decided to minimize the changes, but if 
register_displaychangelistener() and qemu_clipboard_peer_register() can 
be moved earlier, then the iothread could even be unlocked before [NSApp 
run].

There's also the advantage that the flow is a lot more similar between 
"-display cocoa" and "-display none", and also between --enable-cocoa 
and --disable-cocoa builds.

Then main() remains as

     /* doesn't hurt in the !cocoa case */
     NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

     qemu_init(argc, argv);
     if (!have_cocoa_display) {
         qemu_main_loop();
         qemu_cleanup();
     } else {
         QemuCocoaAppController *appController = 
[[QemuCocoaAppController alloc] init];
         [NSApp setDelegate:appController];
         [NSApp run];
         [appController release];
     }
     [pool release];
     return 0;

which is in my opinion the best of both worlds.  But my patch (assuming 
it works) really fixes the threading model.  Without it, moving menus to 
the iothread makes it even more complicated.

>> It also gives us the opposite problem that we're now calling a lot
>> of Cocoa APIs from something other than the main Cocoa thread.
> Basically NSView is the only thing prohibited from calling from
> another thread so it shouldn't be a problem.

I'd rather have a single thread that does all things related to Cocoa. 
If my patch doesn't work, I would just call qmp_query_block(NULL) from 
cocoa_display_init() and save the result in a global variable.

Paolo

