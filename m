Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10E2D16B5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:46:31 +0100 (CET)
Received: from localhost ([::1]:48286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJeg-00045K-TC
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmJbz-0002zr-P4
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:43:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmJbl-0000L1-Ut
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607359408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEo2J+1/DD3EnkbMgJS6Lp8y84vDCj+pL6+32o0UpIg=;
 b=AWVglYItrnbUMNh/RaNBf2ojfr7QBSUSEa+G3lh5mU9eGdn1oH5Cb8o1GS+yMr5/Yu2iMM
 ap5l9WWsMQescEvav4ZeG6/QUuPuNY+KfzhvetwJtX8HBgNrcXWib/gMmuopXjZJ2NVKJO
 MII9S6v9w9P6vFHjWJ/1Dly4gB2UHt4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-9kKbOVKwOYe6pz5H8oSJ7Q-1; Mon, 07 Dec 2020 11:43:20 -0500
X-MC-Unique: 9kKbOVKwOYe6pz5H8oSJ7Q-1
Received: by mail-ej1-f71.google.com with SMTP id dv25so4033587ejb.15
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 08:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IEo2J+1/DD3EnkbMgJS6Lp8y84vDCj+pL6+32o0UpIg=;
 b=XE+zreK+n3JKQON1dfznMwxSCIM6C88cuTSpv2hjqxdW46pruXcJmthrhKsclYdJzZ
 TyDnuVOwARexheKBHpfHRmY2S4y/7VkWnE9JgwkJuudG3rR2SNw9m8peLNrrwA4Si5vz
 vcgDNoBW2E1Cot9x4d0q7Rq8i6TAob07Kf0kdPegC3yxOSh+pPT7ecOpl9ROnEkdPtlW
 70oniiEcspk60d/u93DLNeiRg5JzthXwA9gBJFBtyCsz1YBz073otUD2UwKwf+iJa6Zv
 gRxMkmVg9YTD1zakWoq7lxbRzOk0OSRU9GB8Xez5vM6GchzmTqAOFoaB9w30hqJbdpVy
 kf2Q==
X-Gm-Message-State: AOAM530wDJfP5NlTwOqrLwttqlpbhHuq2wZjijDcmFmwNHEVRSfM++yt
 5PBQtRT2alAssmlvD3dcEZdMYudqtJNbqIA2en67H5AiQE0sXP0nA9/YNgpzebXVnO3OCcNTf1H
 J8+PMeTMay67EqqF55cE1C1DiRQJuyD9klXhoJdMXbrI0t9/7llnoWgWlJBPA4I8gFMU=
X-Received: by 2002:a50:fe0e:: with SMTP id f14mr21244610edt.159.1607359398811; 
 Mon, 07 Dec 2020 08:43:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIBIMeCQ0UvY18ywerr5hMqsvJbI1hS9Dc7vm5JqGuDCkxk+YcpYapDz3YNWAh7BY9TxxGfQ==
X-Received: by 2002:a50:fe0e:: with SMTP id f14mr21244594edt.159.1607359398629; 
 Mon, 07 Dec 2020 08:43:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id b7sm13146657ejz.4.2020.12.07.08.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 08:43:17 -0800 (PST)
Subject: Re: [PATCH 11/15] qtest: add a QOM object for qtest
To: Igor Mammedov <imammedo@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-12-pbonzini@redhat.com>
 <20201207172447.77d22d17@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <853e64f9-9a37-5214-0111-b489dc82af44@redhat.com>
Date: Mon, 7 Dec 2020 17:43:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207172447.77d22d17@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/20 17:24, Igor Mammedov wrote:
>> +void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **errp)
>> +{
>> +    Chardev *chr;
>> +
>> +    chr = qemu_chr_new("qtest", qtest_chrdev, NULL);
>> +
>> +    if (chr == NULL) {
>> +        error_setg(errp, "Failed to initialize device for qtest: \"%s\"",
>> +                   qtest_chrdev);
>> +        return;
>> +    }
>> +
>> +    qtest_server_start(chr, qtest_log, errp);
> why not create qtest object here instead of trying to preserve old way,
> or create it directly at the place that calls qtest_server_init()?

Because I wasn't sure of where to put it in the QOM object tree.  So I 
punted and left it for later.

Paolo


