Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23992F803D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 17:07:14 +0100 (CET)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Rd3-0002kb-9W
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 11:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0Rc2-0001yW-P8
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:06:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0Rby-0000Uy-Rg
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610726765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vHsoWBhmrSyBe3aT1JSEa0JwGXVo21SZ5PFWaeYEbQ=;
 b=G4qDTJXah2Oh0vqlb3mu0uaHseK5aN8pGdimWlEzAGAlCCg+n7s5Wgtwna+uozSTaBsolb
 tXOqdSHdq5znPvxZpKKrGMyRDj/GCfCrB33cKiAHqPmnc0C/c4bZ5d7RbOoCoHC+iHBJQu
 eiDgDqJGEAQylBUIJMDhlj1s/d6bE8A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-b8qhptVzPWKJtGeVNY0B8A-1; Fri, 15 Jan 2021 11:06:03 -0500
X-MC-Unique: b8qhptVzPWKJtGeVNY0B8A-1
Received: by mail-ed1-f71.google.com with SMTP id w4so325221edu.0
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 08:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6vHsoWBhmrSyBe3aT1JSEa0JwGXVo21SZ5PFWaeYEbQ=;
 b=ebCc+1Xb8pruvxu3ovSJd2W82jjDar6GJHn7lN+KWyGVE11n/uvnc+x7XFnaIO3qu0
 AMMTLJfi6clSebU+8JmstCa0vevoNHHRfzXE1VxCbAbwqp4+0Y2CcG+nquwfxtxzPviu
 Sazs+Uf7yOB+J3IH+4fy80lGzmy7gLe+03x7G9156M/wmIKd4/iMuK4MgHjVjY+ML6kE
 MvvXeeWmgphrHGB2v8ngCt4to0r1kp2Q8WkSZxSRAhK6/fR8U8PZpFKhSNxxwVzzfZ6v
 ms2TkKwf1kwLtDBzXEIyk2rJ4wtJjqmXhdXlmYgO0GDNRAyp9APxL5ehKJvdEdilcsEj
 LTcA==
X-Gm-Message-State: AOAM5300q3A5j70tfSn1aowpwnsGnahntUB6z0X0xWZwwYOCcEoINEao
 YM+5zOJgMokkoEFd9DXBD/WAT7K09SEKgUUTyjhMzM9sxIxNRIirTJdzOzNjOELrsr1iNLNu3ZX
 XxHnxSdjeoPkEWRU=
X-Received: by 2002:a50:f9cc:: with SMTP id a12mr9862439edq.335.1610726762169; 
 Fri, 15 Jan 2021 08:06:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5EBqC91jssNKfKV+amSU7XxVKkLb+55LlSfjKwp5MEZKK5wcYMfQqtw2SpWINE0uaf82Jaw==
X-Received: by 2002:a50:f9cc:: with SMTP id a12mr9862413edq.335.1610726762014; 
 Fri, 15 Jan 2021 08:06:02 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r18sm4300217edx.41.2021.01.15.08.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 08:06:01 -0800 (PST)
Subject: Re: [PATCH 1/4] tests/qtest: Remove TPM tests
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-2-philmd@redhat.com>
 <647c3b2d-a68d-43a1-052f-1f5c08b6f3cc@redhat.com>
 <56096449-e909-0f5e-b458-0aae20132865@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a3b60b30-4e7c-5fc8-381f-5f4e6abe11c8@redhat.com>
Date: Fri, 15 Jan 2021 17:06:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <56096449-e909-0f5e-b458-0aae20132865@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 4:53 PM, Stefan Berger wrote:
> On 1/15/21 10:52 AM, Philippe Mathieu-Daudé wrote:
>> Subject is incorrect, this is not a removal of the tests, but
>> removal of their execution. The tests are still in the repository.
>> This is more of a disablement.
> 
> How do you compile / run them to have the LeakSanitizer checks?

I used:

../configure --cc=clang --enable-sanitizers && make check-qtest

$ clang -v
clang version 10.0.1 (Fedora 10.0.1-3.fc32)

This was previously covered by patchew CI. I just figured
patchew is running without the LeakSanitizer since commit
6f89ec7442e ("docker: test-debug: disable LeakSanitizer"):

 docker: test-debug: disable LeakSanitizer

 There are just too many leaks in device-introspect-test (especially for
 the plethora of arm and aarch64 boards) to make LeakSanitizer useful;
 disable it for now.


