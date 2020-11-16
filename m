Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17772B4318
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:44:46 +0100 (CET)
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecw9-0008LC-No
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecuq-0007ju-JO
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:43:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecun-0005NP-MG
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605527001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TxbNsxDba/PpkOpadrLl3SFBEeq3y4TuCfmJNDGjyE=;
 b=M+5N5IMW1aGRFoqC3DT9wqPduc1uKNGsqAUr5vsTRuBx9Oiukl5hYQ43rt/HdHrKh99xe7
 YutTLG2Iw5nBYbhK78Fp3vGyxxja/6Fg2iDLMlOFfa2KQc/wkuLfscoX6gjK++JmGDUylQ
 vEunlB6Hb3u790ZAO8SDSFpIxI8BggE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-cMb_QDcNOae7ZreXGrMy_Q-1; Mon, 16 Nov 2020 06:43:19 -0500
X-MC-Unique: cMb_QDcNOae7ZreXGrMy_Q-1
Received: by mail-wm1-f72.google.com with SMTP id b206so8599337wmd.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 03:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8TxbNsxDba/PpkOpadrLl3SFBEeq3y4TuCfmJNDGjyE=;
 b=ro7UvGcvU6VxM4CDE4AwpDKnux1oHp1m0eUpo63g5FS+o+rOkrhoFBHiFd+3dH9BbY
 TOvjpKrPr22MUeXKRmHNlIqeMqw8t92zg0T1oTStX54UR+bwmWxWdDSqgElo8v1exwaO
 6LGEStXMIphOngM1m154axL9Zd3g4oylMSfnuWyrTBRBLv0LDsVK5Iz4sIebX52rygMk
 i52LJyopWYaehOyDP8d/cWclM2QkvNMi9+eauy5G+yAIY3U3qG3EtjiiFpGelZegp7xV
 EItAUSYyuShzc9f2jedNN3FHtQaGFhFMEh0OAs3wPmJc1BldZ9Dbncw59pzeRXC02VXb
 VpKw==
X-Gm-Message-State: AOAM531+z50bXX+WT1V3FdGScm4VoFqSBf2l56Ip3bAf3Fk6JoX0JN4w
 6btgfKdUfJWzIS/Py5vJARcJmVsHTIVrwhyvJ/4cjBASSAjmcLnwVqPN/+lZFCcI+Y77eIYYtHF
 ivJpLVC2Vj3Me1SkjTxoXfAZyGDNKKFLq3ux4/m+TSWzsrbFyojPzwm9Yy4s5Rts7
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr18608242wrr.353.1605526997992; 
 Mon, 16 Nov 2020 03:43:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxufs6WxW9VKFdEXS/pzY2fYpoPOOCqP0eC9RwXsS1BNmnO4tWw2dKblBmTq30js/11RdDK7A==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr18608214wrr.353.1605526997725; 
 Mon, 16 Nov 2020 03:43:17 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t11sm16097571wrm.8.2020.11.16.03.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:43:17 -0800 (PST)
Subject: Re: [PATCH v2] json: Fix a memleak in parse_pair()
To: Markus Armbruster <armbru@redhat.com>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
References: <20201113145525.85151-1-alex.chen@huawei.com>
 <7412CDE03601674DA8197E2EBD8937E83BA6762C@dggemm511-mbs.china.huawei.com>
 <87eektkdjw.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <895daa42-e241-ff9c-6f55-a369ccfe9eb9@redhat.com>
Date: Mon, 16 Nov 2020 12:43:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87eektkdjw.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 7:42 AM, Markus Armbruster wrote:
> "Chenqun (kuhn)" <kuhn.chenqun@huawei.com> writes:
> 
>>> -----Original Message-----
>>> From: Chenzhendong (alex)
>>> Sent: Friday, November 13, 2020 10:55 PM
>>> To: armbru@redhat.com
>>> Cc: Chenzhendong (alex) <alex.chen@huawei.com>; qemu-devel@nongnu.org;
>>> qemu-trivial@nongnu.org; Zhanghailiang <zhang.zhanghailiang@huawei.com>;
>>> Chenqun (kuhn) <kuhn.chenqun@huawei.com>
>>> Subject: [PATCH v2] json: Fix a memleak in parse_pair()
>>>
>>> In qobject_type(), NULL is returned when the 'QObject' returned from
>>> parse_value() is not of QString type, and this 'QObject' memory will leaked.
>>> So we need to first cache the 'QObject' returned from parse_value(), and finally
>>> free 'QObject' memory at the end of the function.
>>> Also, we add a testcast about invalid dict key.
>>>
>>> The memleak stack is as follows:
>>> Direct leak of 32 byte(s) in 1 object(s) allocated from:
>>>     #0 0xfffe4b3c34fb in __interceptor_malloc (/lib64/libasan.so.4+0xd34fb)
>>>     #1 0xfffe4ae48aa3 in g_malloc (/lib64/libglib-2.0.so.0+0x58aa3)
>>>     #2 0xaaab3557d9f7 in qnum_from_int
>>> /Images/source_org/qemu_master/qemu/qobject/qnum.c:25
>>>     #3 0xaaab35584d23 in parse_literal
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:511
>>>     #4 0xaaab35584d23 in parse_value
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:554
>>>     #5 0xaaab35583d77 in parse_pair
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:270
>>>     #6 0xaaab355845db in parse_object
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:327
>>>     #7 0xaaab355845db in parse_value
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:546
>>>     #8 0xaaab35585b1b in json_parser_parse
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:580
>>>     #9 0xaaab35583703 in json_message_process_token
>>> /Images/source_org/qemu_master/qemu/qobject/json-streamer.c:92
>>>     #10 0xaaab355ddccf in json_lexer_feed_char
>>> /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:313
>>>     #11 0xaaab355de0eb in json_lexer_feed
>>> /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:350
>>>     #12 0xaaab354aff67 in tcp_chr_read
>>> /Images/source_org/qemu_master/qemu/chardev/char-socket.c:525
>>>     #13 0xfffe4ae429db in g_main_context_dispatch
>>> (/lib64/libglib-2.0.so.0+0x529db)
>>>     #14 0xfffe4ae42d8f  (/lib64/libglib-2.0.so.0+0x52d8f)
>>>     #15 0xfffe4ae430df in g_main_loop_run (/lib64/libglib-2.0.so.0+0x530df)
>>>     #16 0xaaab34d70bff in iothread_run
>>> /Images/source_org/qemu_master/qemu/iothread.c:82
>>>     #17 0xaaab3559d71b in qemu_thread_start
>>> /Images/source_org/qemu_master/qemu/util/qemu-thread-posix.c:519
>>>
...
> 
> Queued, thanks!

If possible can you s%/Images/source_org/qemu_master/qemu/%% to make
description more readable...?

Thanks,

Phil.


