Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0022B44A0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:24:42 +0100 (CET)
Received: from localhost ([::1]:54280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeUr-0001Pf-MQ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1keeSt-0000Gl-B1; Mon, 16 Nov 2020 08:22:39 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1keeSp-0006ud-Q3; Mon, 16 Nov 2020 08:22:39 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CZV9N39V1zhXwn;
 Mon, 16 Nov 2020 21:22:16 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 21:22:16 +0800
Message-ID: <5FB27D08.2070600@huawei.com>
Date: Mon, 16 Nov 2020 21:22:16 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2] json: Fix a memleak in parse_pair()
References: <20201113145525.85151-1-alex.chen@huawei.com>
 <7412CDE03601674DA8197E2EBD8937E83BA6762C@dggemm511-mbs.china.huawei.com>
 <87eektkdjw.fsf@dusky.pond.sub.org>
 <895daa42-e241-ff9c-6f55-a369ccfe9eb9@redhat.com>
In-Reply-To: <895daa42-e241-ff9c-6f55-a369ccfe9eb9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=alex.chen@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 08:22:26
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/16 19:43, Philippe Mathieu-Daudé wrote:
> On 11/16/20 7:42 AM, Markus Armbruster wrote:
>> "Chenqun (kuhn)" <kuhn.chenqun@huawei.com> writes:
>>
>>>> -----Original Message-----
>>>> From: Chenzhendong (alex)
>>>> Sent: Friday, November 13, 2020 10:55 PM
>>>> To: armbru@redhat.com
>>>> Cc: Chenzhendong (alex) <alex.chen@huawei.com>; qemu-devel@nongnu.org;
>>>> qemu-trivial@nongnu.org; Zhanghailiang <zhang.zhanghailiang@huawei.com>;
>>>> Chenqun (kuhn) <kuhn.chenqun@huawei.com>
>>>> Subject: [PATCH v2] json: Fix a memleak in parse_pair()
>>>>
>>>> In qobject_type(), NULL is returned when the 'QObject' returned from
>>>> parse_value() is not of QString type, and this 'QObject' memory will leaked.
>>>> So we need to first cache the 'QObject' returned from parse_value(), and finally
>>>> free 'QObject' memory at the end of the function.
>>>> Also, we add a testcast about invalid dict key.
>>>>
>>>> The memleak stack is as follows:
>>>> Direct leak of 32 byte(s) in 1 object(s) allocated from:
>>>>     #0 0xfffe4b3c34fb in __interceptor_malloc (/lib64/libasan.so.4+0xd34fb)
>>>>     #1 0xfffe4ae48aa3 in g_malloc (/lib64/libglib-2.0.so.0+0x58aa3)
>>>>     #2 0xaaab3557d9f7 in qnum_from_int
>>>> /Images/source_org/qemu_master/qemu/qobject/qnum.c:25
>>>>     #3 0xaaab35584d23 in parse_literal
>>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:511
>>>>     #4 0xaaab35584d23 in parse_value
>>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:554
>>>>     #5 0xaaab35583d77 in parse_pair
>>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:270
>>>>     #6 0xaaab355845db in parse_object
>>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:327
>>>>     #7 0xaaab355845db in parse_value
>>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:546
>>>>     #8 0xaaab35585b1b in json_parser_parse
>>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:580
>>>>     #9 0xaaab35583703 in json_message_process_token
>>>> /Images/source_org/qemu_master/qemu/qobject/json-streamer.c:92
>>>>     #10 0xaaab355ddccf in json_lexer_feed_char
>>>> /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:313
>>>>     #11 0xaaab355de0eb in json_lexer_feed
>>>> /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:350
>>>>     #12 0xaaab354aff67 in tcp_chr_read
>>>> /Images/source_org/qemu_master/qemu/chardev/char-socket.c:525
>>>>     #13 0xfffe4ae429db in g_main_context_dispatch
>>>> (/lib64/libglib-2.0.so.0+0x529db)
>>>>     #14 0xfffe4ae42d8f  (/lib64/libglib-2.0.so.0+0x52d8f)
>>>>     #15 0xfffe4ae430df in g_main_loop_run (/lib64/libglib-2.0.so.0+0x530df)
>>>>     #16 0xaaab34d70bff in iothread_run
>>>> /Images/source_org/qemu_master/qemu/iothread.c:82
>>>>     #17 0xaaab3559d71b in qemu_thread_start
>>>> /Images/source_org/qemu_master/qemu/util/qemu-thread-posix.c:519
>>>>
> ...
>>
>> Queued, thanks!
> 
> If possible can you s%/Images/source_org/qemu_master/qemu/%% to make
> description more readable...?
> 

Hi Philippe,
I am sorry for that, considering that the patch has been queued,
do I need to modify the commit message and send patch v3?

Thanks,
Alex



