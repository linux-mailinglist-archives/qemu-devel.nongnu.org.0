Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839B3018A2
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 23:14:20 +0100 (CET)
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3RAh-0003kw-Mw
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 17:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3R9l-000366-Kq
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 17:13:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3R9h-0001Ml-KR
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 17:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611439995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5wEhY11tcHU1fmKrQ0YLi2C/FyD1TknmlVYR/xAx7g=;
 b=chZjhfAR7WWxiB3ckZ2lKcQSWZcIRtiANS3taOfbGXZbUwOw0pjfnkN7ImY4zEWfcKvJGL
 8EQ+7xW/OYlrealQl7KTUCe7kTS/FiKQPVqNy7od8Xs2X5uyY0zmOfWNl8ZNOYHOJMS541
 Y9dAwYjoZVLIMsKgRlO3xWZadZL29xQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-qmnyf4PsNc6O8U8OuAl7Kw-1; Sat, 23 Jan 2021 17:13:13 -0500
X-MC-Unique: qmnyf4PsNc6O8U8OuAl7Kw-1
Received: by mail-ed1-f71.google.com with SMTP id m16so5023302edd.21
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p5wEhY11tcHU1fmKrQ0YLi2C/FyD1TknmlVYR/xAx7g=;
 b=dbEPR82lnK2jKar0dmcA1VYewpxqp//VH3FCYBjTkVkNaA9uM4ChuPK8VEXvTQQZ4q
 8EBYGuIrpkYalQZbEL5ZYzfwa9xNWmS/ZQtbijL8Es6KMNyWxOrMmqftPnmPaIK5ZoPK
 4EWUd7ED4Dhz+yWZSbomz3z0BMhBkqaBCuYG21SfWsf4qtnyOycwhnIFkoftcTyzGtRa
 Tn9zaVgshwOTTgxJPv9/WhzOvq2yjVb1x7chY0BW7NmugIfU+v0oVH2ZRiBbrQgJwMBt
 KdER/av1zva0X9cX6rjta8NsIsDbLwvwj/Gfb5spi/poV2IzIRFbD+ayuxoj+stYSjv+
 rBMA==
X-Gm-Message-State: AOAM531pNpizy+MHKQCuJjk+GY2rCFaTB3Y5wmYUWhI/yRZiNGXLMDKn
 B7ByTch50gdRExWWXX05j2ybWdvu/N3J2m1xgo+wCRJVtZA4RKYZWUsy65OGW2h7MTEZXxKpoD4
 pzQjudm96vya2bFw=
X-Received: by 2002:a17:906:ff43:: with SMTP id
 zo3mr572068ejb.542.1611439992550; 
 Sat, 23 Jan 2021 14:13:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsudneKbcZVJRGMsR/vrf5ep60WmHH1qgFITsL9UN6augE6uWvtkPCj4EiRz5BXSxbENgH+Q==
X-Received: by 2002:a17:906:ff43:: with SMTP id
 zo3mr572060ejb.542.1611439992391; 
 Sat, 23 Jan 2021 14:13:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id q4sm6267465ejx.8.2021.01.23.14.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 14:13:11 -0800 (PST)
To: Laszlo Ersek <lersek@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
 <d68e5cc9-d6ba-2dac-04ad-49d5509cd836@redhat.com>
 <eef8237e-293a-b6e6-20be-fa004509fa05@redhat.com>
 <1121a803-98e7-6d41-119c-3d82717976ec@redhat.com>
 <cba8919b-0480-3520-6ad6-920bf9d4186e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
Message-ID: <063dd2a6-a3ae-0d7c-3e29-96a08a6d9a3d@redhat.com>
Date: Sat, 23 Jan 2021 23:13:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cba8919b-0480-3520-6ad6-920bf9d4186e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/21 22:26, Laszlo Ersek wrote:
> That seems bogus, per POSIX, given that all signals except SIGUSR2 are
> included in the mask passed to sigsuspend().

What happens if you get a SIGSTOP at exactly the wrong time?  (Yeah I 
know how incredibly unlikely that would be).

BTW if we are in a mood for cleanup, there's no reason to use 
pthread_key_t instead of __thread + qemu_thread_atexit_add (adding a 
Notifier to struct CoroutineThreadState).  That would fix the issue with 
async-signal safety of pthread_getspecific.

(It makes sense for the function not to be async-signal safe since it 
can in principle allocate memory for the data.  In practice it's most 
likely okay if the function has been called before on this thread).

Paolo


