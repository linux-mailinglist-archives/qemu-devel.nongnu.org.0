Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE934247E89
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 08:38:22 +0200 (CEST)
Received: from localhost ([::1]:46044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7vGH-0005PZ-Ra
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 02:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7vFD-0004f9-Ps
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 02:37:15 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27818
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7vFA-0005oM-AZ
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 02:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597732631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lz5kYLppyS+Saqyua8qtZQdzGy1uDRloi+F1k1zNBsY=;
 b=FH06K+sB4tl/r3NoHO0qv5CkwRvhSltJ3sYkcY8jkung4ZBoDU/Wc5JQE1KjjyBghfqWfy
 zWO/IvFO1KfA8B0xFrirUH45R86a4rwZNi8mgi0iFcn8YrhdMU+03DSYFpaznS/NVHm0tB
 XlMx3v4UWt0FfqMnnYeD2ik1sOQ7QQg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-ESqgxwvxNZiCsIq-J9HhwQ-1; Tue, 18 Aug 2020 02:37:07 -0400
X-MC-Unique: ESqgxwvxNZiCsIq-J9HhwQ-1
Received: by mail-wr1-f69.google.com with SMTP id f14so7796403wrm.22
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 23:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lz5kYLppyS+Saqyua8qtZQdzGy1uDRloi+F1k1zNBsY=;
 b=ZWjEmScJ974GZri17USQSGZSy7YA6N8ZdDOiRIgKeLjDPFh2m5F0mZq3xlwHqIGUJI
 Ir+ja7Q9zThoJg+DARHc0WPs9dBIUzw2N9QAACjkB7W8xTLMjWUeZWdD0g1EyUBNqK0E
 LK0TDoSZ7bAAGl2ssrEXtzpyiOXdKdnQ2JudzcEbYlMYq9WsmFZiQVOW1NKOsJFIhSah
 yxdTxaEW7/A46VyJqDKlLEf/Zuunz7lOa4i1YIJ16vi4DzSC7jJB20BR9kUtO9QI8/fp
 nbrfLuOEFoRzbNiFPTnzCd+oWJu8l5DHBPW9ylpsfJeBkjcwZT8KjVHaYjg+7LA0hsqw
 MS5A==
X-Gm-Message-State: AOAM532+4udC502fuiYxZbQWgVJth2s+EzKvkGZgWXPojEJF6aEap6nc
 DQeq+SXmQ+A8FrkqO6QDQzGfwqQ/Isx5Ipt16AbWfJRqDsQ5ubGoBKRojUUyw+9h4yUTJLh4Air
 AzaN0dU3H0dxHEKY=
X-Received: by 2002:adf:8445:: with SMTP id 63mr18040169wrf.375.1597732626726; 
 Mon, 17 Aug 2020 23:37:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4a7DT+EUq1X/l2B8zfS9D6sBmgzX+bmPbIfqDaYCKlbiP3Z5mO+M5lgGzIZuK/9i7wLUcNQ==
X-Received: by 2002:adf:8445:: with SMTP id 63mr18040145wrf.375.1597732626494; 
 Mon, 17 Aug 2020 23:37:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:a0d1:fc42:c610:f977?
 ([2001:b07:6468:f312:a0d1:fc42:c610:f977])
 by smtp.gmail.com with ESMTPSA id g70sm33002478wmg.24.2020.08.17.23.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 23:37:05 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 v2 0/2] stubs: Fix notify-event stub linkage error
 on MinGW
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200805085526.9787-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ce101d90-910a-5906-4034-7d3aacbb3dc2@redhat.com>
Date: Tue, 18 Aug 2020 08:37:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200805085526.9787-1-philmd@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:16:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/20 10:55, Philippe Mathieu-Daudé wrote:
> 2 trivial patches to fix the link error reported by Thomas:
> 
>   LINK    tests/test-timed-average.exe
>  libqemuutil.a(main-loop.o): In function `qemu_notify_event':
>  util/main-loop.c:139: multiple definition of `qemu_notify_event'
>  tests/test-timed-average.o:/builds/huth/qemu/tests/../stubs/notify-event.c:5: first defined here
>  collect2: error: ld returned 1 exit status
>  rules.mak:124: recipe for target 'tests/test-timed-average.exe' failed
> 
> Philippe Mathieu-Daudé (2):
>   exec: Restrict icount to softmmu
>   stubs: Remove qemu_notify_event()
> 
>  include/sysemu/cpus.h  | 4 ++++
>  exec.c                 | 4 ----
>  softmmu/cpus.c         | 7 +++++++
>  stubs/cpu-get-icount.c | 2 +-
>  stubs/notify-event.c   | 6 ------
>  stubs/Makefile.objs    | 1 -
>  6 files changed, 12 insertions(+), 12 deletions(-)
>  delete mode 100644 stubs/notify-event.c
> 

Patch 1 will be superseded by Claudio's refactoring.  For patch 2 please
respin according to the review.

Paolo


