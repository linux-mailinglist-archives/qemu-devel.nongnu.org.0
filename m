Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5142FD227
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:00:20 +0100 (CET)
Received: from localhost ([::1]:50134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2E1z-00055Q-Kl
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:00:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2E0J-00045E-Kc
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2E0H-0005JY-7r
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611151111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MflD+G0aYMJRaaPW1zxK85lcbX/r/TZcCLoMayKHs4=;
 b=Jv11X0Y29ooGRyB3qE7McyWjFAtspnl3oOGaIAvUqz9ASW75qQYoFLHlqrkeVVwaPMInjG
 NGlZ/chfLv/PLda2C+xN4IEY5/m4ZCNdEiYHwjTLjIds6vbehnkzDgUPei/wUfj1tcOQZA
 39SDj86enZdiNCDNeSSpR39EeYGF6Aw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-WS2Fdt8mM02aj2-MjhHNeQ-1; Wed, 20 Jan 2021 08:58:29 -0500
X-MC-Unique: WS2Fdt8mM02aj2-MjhHNeQ-1
Received: by mail-ed1-f70.google.com with SMTP id u17so11154351edi.18
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 05:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7MflD+G0aYMJRaaPW1zxK85lcbX/r/TZcCLoMayKHs4=;
 b=sU7EYmj1O9TaXbyHNEuSFdfDZDednUMCcIJ3ltoqfhuJjJ6TVkGoM0Fey4IYqQx3lN
 NPpvJNI0pyegGFzmCCkHjDNjBRoUylrqilUNoo05aOvYQbiZNT5wm02AALtxMMKLlAT5
 THDHTC4aPKfoLHREzhdZqiTq/ff5kprj4GTY33SFhV5oZD7XQpiGG/nxep8LejLVFrZx
 39/4Ve/jsWoXbpKrKHj7NqZXEEjl2MFa2/G5mt5agKI+1m/+zLtaQ+b42Tyy5fMhWlOU
 Yc2m1SX07BdA8Rl2csl6E3NgFx/lrkT1J8ARK1VUDDEC+H5hDPzi6Vh5in7q/YNjK6qZ
 hcjA==
X-Gm-Message-State: AOAM530DgQiuTq1PX3HGxZVZqWCYHsDEF9TofG/BPV6C5XKfIqXfTk39
 IcdSLZeQaH9FV2FDG9LqePXV7m6tobjnIYpaV1oMCZSY+Xom+uCB0UQg9APE20TlB/2l+YnWuG5
 dDOLt8PgZ9Yl9U3Y=
X-Received: by 2002:aa7:cfd7:: with SMTP id r23mr7343110edy.298.1611151107988; 
 Wed, 20 Jan 2021 05:58:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGKDSN1fZzS1JEFZ+I40FZs0QurQh4kKRNPZQWIj3uTLPSj1ma0vOLnk9XRVEhJ0UZ02Jtyg==
X-Received: by 2002:aa7:cfd7:: with SMTP id r23mr7343102edy.298.1611151107782; 
 Wed, 20 Jan 2021 05:58:27 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id f16sm928763ejh.88.2021.01.20.05.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 05:58:27 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
 <20201215175445.1272776-17-pbonzini@redhat.com>
 <CAFEAcA93tYRjdjQJm8GKNS2=4iV5QU4X_JJevWEBc7wggX6Cwg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 16/45] vl: Add option to avoid stopping VM upon guest panic
Message-ID: <f7374ec6-ace5-9ba0-6c12-a6203281dd7d@redhat.com>
Date: Wed, 20 Jan 2021 14:58:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA93tYRjdjQJm8GKNS2=4iV5QU4X_JJevWEBc7wggX6Cwg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>,
 Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 22:34, Peter Maydell wrote:
> We used to default to 'pause' and now we default to 'poweroff'.
> 
> We noticed this because it broke an in-flight test case for
> the pvpanic-pci device from Mihai (which was expecting to see
> the device in 'pause' state and found it was now in 'poweroff').
> Test cases aren't very exciting, but was it really intentional
> to change the default behaviour? It's part of the user-facing
> surface of QEMU, so if we did intend a default change that ought
> really to be more clearly stated (and noted in the Changelog) I think.

To sum up the difference:

1) before, without -no-shutdown:
{"event": "GUEST_PANICKED", "data": {"action": "pause"}}
{"event": "STOP"}
{"event": "GUEST_PANICKED", "data": {"action": "poweroff"}}
{"event": "SHUTDOWN", "data": {"guest": true, "reason": "guest-panic"}}

after, without -no-shutdown:
{"event": "GUEST_PANICKED", "data": {"action": "poweroff"}}
{"event": "STOP"}
{"event": "SHUTDOWN", "data": {"guest": true, "reason": "guest-panic"}}

2) before, with -no-shutdown:
{"event": "GUEST_PANICKED", "data": {"action": "pause"}}
{"event": "STOP"}

after, with -no-shutdown (aka -action panic=pause,shutdown=pause):
{"event": "GUEST_PANICKED", "data": {"action": "pause"}}
{"event": "STOP"}


I think the new behavior without -no-shutdown is (albeit not 
intentionally) preferrable, since QEMU used to report twice that the 
guest panicked.

Looking again at the -action CLI, though, there are some inconsistencies 
in the naming.  I'll send a patches for them, but they will not affect 
the HMP output.

Paolo


