Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D952315133
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:05:59 +0100 (CET)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TeQ-0004sq-Ir
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l9TW1-00018D-30
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l9TVv-0007sI-AU
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612879029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRkNP/Tcc6NRzXM9tyoxaYmBzBGgJ0Ca+ow7KiYvp44=;
 b=TbD6rgvNJUNBwf1Ejz7LKubQLz4NLi4IL8tqjS8s9K9SjVavHDCXmoMIvaSEf5Lq4DSGLS
 F9ZsUYLkwi5r4AoguDpZc1096BlEXUMl0KwzjWASkf1iBzj8ITDLidolKPG6mRtoDeJ+12
 KzCvM0vKAlRSpV2wLqb+TxSVNfpqSG8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-GP9z0JwWNRS3LdAj8havKg-1; Tue, 09 Feb 2021 08:57:07 -0500
X-MC-Unique: GP9z0JwWNRS3LdAj8havKg-1
Received: by mail-wm1-f69.google.com with SMTP id p8so2836265wmq.7
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 05:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MRkNP/Tcc6NRzXM9tyoxaYmBzBGgJ0Ca+ow7KiYvp44=;
 b=BxcY/l/FSyubEYWid0OKnmMg+ecHZWcohQVcJ1uNwIpLTq44hr5LdQ2WjJ5MSwdXGT
 5t7GCRhG4ftr9ryk2ZmKvTZxqYbInmqjk8rz+vi4PBFGJ+bWmTvIw9tL6bqcXGBEarMf
 FqoROJSjzd4k8Vh4+67johDk8UI1iRRZMnH7i8zTsC/J9XKQTgbNWGeAyhCg52z05lAm
 YJrXUwqQtGmy/5vrG6AnoPkyvwx3OKZRjignvFEAGrlHBT7YaT3pYqN5Gsjf55pwsizC
 M8V/ciuOQ+fsv5mZTHHQbnwd31eshsyC50C6wPH97mrtWSZUIL1WRbXFuYwujP9u8ktn
 k0TA==
X-Gm-Message-State: AOAM533Zm9r35tOhuYqOpCQWrFG9Oj/RZmzZETR/f2nuOCP9JTzOkQEr
 +s4AAXLynOXeKM4WtkB1TagjSh8KdAX+GlXZv6UR35JRqf5SuXZuxRUM3CQTDbqwRrRz3xquaZ5
 wWJVi2si+AdWCbiE=
X-Received: by 2002:a1c:f60b:: with SMTP id w11mr3521339wmc.3.1612879026070;
 Tue, 09 Feb 2021 05:57:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9xkHBnKbkInxYBYbKEWYQFIS5S+7+u7kyrd47kM2L/CHJXuRFHcKCPZEB59AefdvMs459CA==
X-Received: by 2002:a1c:f60b:: with SMTP id w11mr3521318wmc.3.1612879025801;
 Tue, 09 Feb 2021 05:57:05 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d10sm35927351wrn.88.2021.02.09.05.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 05:57:04 -0800 (PST)
Subject: Re: [PATCH 0/5] enhance debugging with qtest framework
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1611704181.git.qemu_oss@crudebyte.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <98e50576-19f0-85c3-1798-aa3a03a90408@redhat.com>
Date: Tue, 9 Feb 2021 14:57:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1611704181.git.qemu_oss@crudebyte.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/01/21 00:36, Christian Schoenebeck wrote:
> This series is a follow-up of the following previous series:
> https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02251.html
> The 9p patches of the previous series have already been merged.
> 
> This series consists of 2 parts:
> 
> 1. libqos patch 1 removes a limitation of the qtest/libqos subsystem:
>     support for more than one device using the same (official) QEMU device
>     name.
> 
>     Like discussed in the previous series, if nobody finds this patch useful
>     then just ignore it. I needed it in the previou series before but
>     eventually decided for a different approach and personally don't need it
>     in near future.
> 
> 2. Patches 2 to 5 enhance debugging issues with the qtest framework. I would
>     appreciate if they got merged, because I still find them useful while
>     working on new test cases.
> 
> Changes of these patches from derived series:
> 
>    * Squashed previous patches 1 & 2 -> [patch 1].
> 
>    * Dropped ANSI color escape sequences [patch 3].
> 
>    * Squashed previous patches 4 & 5 -> [patch 3].
> 
>    * Extended commit log to provide more details about purpose [patch 4].
> 
> Christian Schoenebeck (5):
>    libqos/qgraph: add qos_node_create_driver_named()
>    libqos/qgraph_internal: add qos_printf() and qos_printf_literal()
>    tests/qtest/qos-test: dump qos graph if verbose
>    tests/qtest/qos-test: dump environment variables if verbose
>    tests/qtest/qos-test: dump QEMU command if verbose
> 
>   tests/qtest/libqos/qgraph.c          | 99 +++++++++++++++++++++++++++-
>   tests/qtest/libqos/qgraph.h          | 36 ++++++++++
>   tests/qtest/libqos/qgraph_internal.h | 12 ++++
>   tests/qtest/qos-test.c               | 15 ++++-
>   4 files changed, 158 insertions(+), 4 deletions(-)
> 

Queued, thanks.

Paolo


