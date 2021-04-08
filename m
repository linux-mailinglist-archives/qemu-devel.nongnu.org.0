Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFF4358180
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 13:17:41 +0200 (CEST)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSfM-0000pU-AK
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 07:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUSd7-0000Au-55
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:15:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUSd4-0002Ti-Rq
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617880517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnTtl9swYER5qkyl49YCUgpb3PvhZTlo7hv7l1X8l+c=;
 b=XeUvtAmjQ09XciUG5lFsThqQwSicyp+1Cr8V2sGOW0/bxKkdwDBhZVSte9WZzl1l5oUFsc
 apCe16pSCVyIxpEf/0I2nCuAcilyTJxoId8VA0DGVxI2ElFmddeorywcZZKSywS4i7IzGR
 CcGrzB5leoOUGREF0ECVD2ChvuL8C2g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-jnovyQ8jOKSnpZ8i7J1Ntw-1; Thu, 08 Apr 2021 07:15:15 -0400
X-MC-Unique: jnovyQ8jOKSnpZ8i7J1Ntw-1
Received: by mail-wr1-f71.google.com with SMTP id u10so847738wrm.2
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 04:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wnTtl9swYER5qkyl49YCUgpb3PvhZTlo7hv7l1X8l+c=;
 b=WCt7XjyzFVS31HMM+iYYn+VmsZ0R7UyrDx2laRKUF6P+mFsEavdexMTXp8/rYZ2KLR
 7PKwqgm6PGnfDXwF1uCAJjehWdvscDiKBWe6bKAO5G5pS1Uakh7bapL2+YVvJ6qLmq9u
 Soz9O78DR2zqj48gaAa2wQWH3J5l1PN/GPfHxfNMctCV6s8KkH6xoB3fJdn8hBA06BN6
 R7rX9cBzNagGAouXfDcu3i/46mz4DGRkUyq4wWj4fEXkZ33tBAZG0ZDIzVH3XuIxdhIK
 S0cV/kTeUBEBMUHpu6Xixlc+ZNUjbGHSguXctt5CF3LlYc5UfQneCzHIaRLEza08sin9
 yfmA==
X-Gm-Message-State: AOAM531d4cDILZ+D0bVid+bdgBidXUeWlnVgFq33XWceApLnK/77ykqQ
 Pri6PrIdT6arZEJyBjrewoDbHP7Ex4hzfc6rs59Bzaqd6VJ8vH07udKJKsHYpNfDHhPTLdBS3I8
 o66U/nxYSfvS6V6g=
X-Received: by 2002:a5d:4bcc:: with SMTP id l12mr10564315wrt.343.1617880514330; 
 Thu, 08 Apr 2021 04:15:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8BNyYoBkX6nowke3nbqcC2l9TqXIP1IK8j7gH4Uh6p41gdDHQB+7zgEt8jAgrtYsPwO+gPQ==
X-Received: by 2002:a5d:4bcc:: with SMTP id l12mr10564282wrt.343.1617880514103; 
 Thu, 08 Apr 2021 04:15:14 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.120])
 by smtp.gmail.com with ESMTPSA id g5sm12795083wmk.43.2021.04.08.04.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 04:15:13 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/11] qemu_iotests: improve debugging options
To: Markus Armbruster <armbru@redhat.com>
References: <20210407135021.48330-1-eesposit@redhat.com>
 <87wntdchbw.fsf@dusky.pond.sub.org>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <d580fb77-7e50-7af6-ad03-c28c94cd36f1@redhat.com>
Date: Thu, 8 Apr 2021 13:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87wntdchbw.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/04/2021 10:26, Markus Armbruster wrote:
> Emanuele Giuseppe Esposito <eesposit@redhat.com> writes:
> 
>> This series adds the option to attach gdbserver and valgrind
>> to the QEMU binary running in qemu_iotests.
>> It also allows to redirect QEMU binaries output of the python tests
>> to the stdout, instead of a log file.
>>
>> Patches 1-6 introduce the -gdb option to both python and bash tests,
>> 7-10 extend the already existing -valgrind flag to work also on
>> python tests, and patch 11 introduces -p to enable logging to stdout.
>>
>> In particular, patches 1,2,4,8 focus on extending the QMP socket timers
>> when using gdb/valgrind, otherwise the python tests will fail due to
>> delays in the QMP responses.
>>
>> This series is tested on the previous serie
>> "qemu-iotests: quality of life improvements"
>> but independent from it, so it can be applied separately.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> How discoverable are these goodies for developers with only superficial
> knowledge of iotests?
> 

Not really sure what you mean, but

./check --help now shows:

> -p         enable prints
> -gdb       start gdbserver with $GDB_QEMU options. Default is localhost:12345

Which I guess should be clear enough? Btw two-three weeks ago I didn't 
know anything about these tests either.

I agree I can make -p more clear, saying "enable qemu binary prints to 
stdout", and move -valgrind to the "optional arguments" instead of 
"bash-only"

Emanuele


