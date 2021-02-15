Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4498831B7C5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:06:45 +0100 (CET)
Received: from localhost ([::1]:36290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbiG-0007P9-DD
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBbhU-00070D-SP
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBbhS-0007W1-EW
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613387152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COKk4eK4/XUSqycSe9vhjiD+JyY5pYBSweYA39wlOWg=;
 b=LpIMs7elO+7GGxXdZRqADI075cFdeGpl5K27OBCVw1oC25CafZaoIoLrTVqS0+cIIQSBoc
 C08yVKr/70mzI1uRkxC54tDLgV6BzaymKZgBkodMXWD0WMRRe0HZT6gPi83SzimlQnUcV1
 bV3cJIHGTsJTzQFyaEh90kpcoDW3Bx4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-rhx82-pSOVi6KVjib-CmvA-1; Mon, 15 Feb 2021 06:05:50 -0500
X-MC-Unique: rhx82-pSOVi6KVjib-CmvA-1
Received: by mail-ej1-f70.google.com with SMTP id ce9so4116101ejc.17
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=COKk4eK4/XUSqycSe9vhjiD+JyY5pYBSweYA39wlOWg=;
 b=VyyVzxmQuRd8Or59rhMcOK/o4pdesy3zmUzM5sEBFkodBbME4BMM24A1knp4SMkpAr
 F7aKuzUwazUlL/9m+oPKZWnopyl0m17s4nQfNubjQmtzaH/55hWiepQHXLEk3SplszpZ
 ONd4pJFzfiX2XI7Ws1m+4sPRSenuMhd+EdqDJxWKyNYx8qqsRDO5qntHAkR45t7qCC0x
 P8tU2qi2i/XYFPkY7Jwllx8q4JjHarvXyu+5TioGwVtT7zbOM9s/2dECDqaaWuM7RZV9
 PEt2RgYm8AWjOOV4+Gkx0Kty2MKYOx+obzguXnAQMJ8Sdc77cYLGbEtEsCG6rB02e0/3
 O+OQ==
X-Gm-Message-State: AOAM532MsQsfeukbAdgEnt7tXYjWlYB8JPCPydqg5enohCPttEzWCWpI
 2WTpl3l7+NTTXCvRJHEQqOwiRR6D0Jihch6Yha7DlsaCyVMX08EPkfZnWJvhLNLl/RL51LmWtTx
 4VkprkUhCt7U0I2+ByDDzmUAi5nkrExRrZgD+I5NkBcBGSqnTNqw1FtgZ2wXvgQHlLwQ=
X-Received: by 2002:a05:6402:1215:: with SMTP id
 c21mr14962798edw.310.1613387148854; 
 Mon, 15 Feb 2021 03:05:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWGjaHcTSpJ4/uUwuMXBtqdOtLGu5UpsZm82AP1UaChbNj515mbjLwoZ1dG/wd1W9PHu+/lg==
X-Received: by 2002:a05:6402:1215:: with SMTP id
 c21mr14962772edw.310.1613387148616; 
 Mon, 15 Feb 2021 03:05:48 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m24sm10272945eji.10.2021.02.15.03.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 03:05:47 -0800 (PST)
Subject: Re: Call for Google Summer of Code 2021 project ideas
To: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <87pn29kxcp.fsf@dusky.pond.sub.org>
 <b860c470-cbe3-00b5-1966-59fa87045024@redhat.com>
 <87h7njsnui.fsf@dusky.pond.sub.org>
 <c26786ac-159e-149a-aa5e-dd08f418d11e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cc4e606b-eb39-f423-f60b-fec7b622175c@redhat.com>
Date: Mon, 15 Feb 2021 12:05:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c26786ac-159e-149a-aa5e-dd08f418d11e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/01/21 17:36, John Snow wrote:
> 
>> The sane way to evade the language design problem is to use the existing
>> QMP language.
> 
> I wouldn't mind implementing this for version 0.1 -- just allow 
> copy-pasting JSON into the input bar -- it's a feature I wanted anyway.

I think the only way out of language design is to instead design a TUI 
for inputting JSON.  For example:

* after typing the ' for a key you can autocomplete the next field, 
using the TAB key similar to vi

* after typing the : the TUI tells you the field type

* after typing the ' for an enum, the TAB brings up a menu to pick an enum

* after typing the last character in a key or value you automatically 
get a suggestion for what to type next (comma and next apostrophe after 
a value, colon and possible apostrophe/bracket/brace for a key)

One idea that has worked for me in the past was to write a mockup that 
shows what things are going to look like, with fake user interaction. 
You would have something like

    // {
    keypress("{")
    show_suggestion("'")
    // '
    keypress("'")
    start_autocomplete_choices(["execute", "arguments"])
    // TAB
    await asyncio.sleep(1)
    do_autocomplete()
    // '
    await asyncio.sleep(1)
    keypress("'")
    // string argument, propose ' for the value automatically
    show_suggestion(": '")
    // TAB
    await asyncio.sleep(1)
    do_autocomplete()
    start_autocomplete_choices("query-status", "query-kvm") # many more

etc.

Then you plug in an incremental lexer, so that you can e.g. replace

    show_autocomplete(": '")

with

    lex_state(Lexer.AFTER_KEY); // this would come from the lexer
    show_autocomplete("'")      // this would come from the schema

And then again plug the incremental visitor to autocomplete on the 
schema types.

Another advantage of this approach is that you also have a natural API 
for the mocks, and thus it becomes easier to write testcases.

Paolo


