Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6C623D9C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 09:36:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot32W-0004MT-D9; Thu, 10 Nov 2022 03:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot32I-0004Lf-TS
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot32F-0006BG-QR
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tscDa6AmG9WbHj2MOjQ0frbeGfMOMs/REQUmYYKUHKw=;
 b=KtrxTiwG/tRrRXubNjU5SC977cfkon5rx4hxVhOcvm+jgT2U//HuyDGinzN7m4ws73osWq
 B5TIZ3oQYkc1GfpNduef6mzMSs7o8SnTB6GM83cWmpjcDIRFMCI7c2uUSUdUYQtp3+c63b
 izwhzuOuZPjVWkrIGUgN1LTXSv8+Ss4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-Hb3b6k57MVulNme3-XlfTA-1; Thu, 10 Nov 2022 03:35:40 -0500
X-MC-Unique: Hb3b6k57MVulNme3-XlfTA-1
Received: by mail-pf1-f198.google.com with SMTP id
 a18-20020a62bd12000000b0056e7b61ec78so716477pff.17
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 00:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tscDa6AmG9WbHj2MOjQ0frbeGfMOMs/REQUmYYKUHKw=;
 b=rZBwVrLpRvzeGNx++jhspBJ/i768dSIFKppYXMhXfKA9SWV14KTtL111aca7TRSUNa
 0aNje5+Jqo8hDSG2HGm/DagzetkHJdBpdG4lP4TkCWk40OMICgwFosfXMGomK+0SSpkP
 hZNDb7UUEfV/NZVTlY/HDPHe3BtSeRkVPia3uTcj42syCI+378VU9rAWK3Y0VwUHkq9z
 04HhoNy9f7CSUykqL1Eh5XCeDfmSLbHeiox3FXcmB4oN5q9n//yXQvSYtBIg1xlGyTCr
 hA6CrAcscNqiBzEVkCQC7YL2L6ZMKK20wlwwAGJH0/uwfO7Bkwqc6tL0ggE4Hjhcjzkr
 thyw==
X-Gm-Message-State: ACrzQf1VJrtncJg74bvIxq3Kx7Nn9AIkc+LMK4DKX8oHUes5ZiEm+bj4
 4p2nQtkWJpRTGVIz6gS+fn2Wn7k5chg9DYD9Y0v2jx5zJgEIjf7exCwzlMkkf9GPhompG7UJQig
 /QdfeEvFUpUqW6c8=
X-Received: by 2002:a63:8bc2:0:b0:46f:5bbb:7370 with SMTP id
 j185-20020a638bc2000000b0046f5bbb7370mr55300573pge.70.1668069339019; 
 Thu, 10 Nov 2022 00:35:39 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5UNF8I+ZxmGdEIkxEfkzjX23o9fgKXenC6zGBMkfyQqaSQ3xYwnl/6fFopP1Qzta4dHF4OAw==
X-Received: by 2002:a63:8bc2:0:b0:46f:5bbb:7370 with SMTP id
 j185-20020a638bc2000000b0046f5bbb7370mr55300561pge.70.1668069338714; 
 Thu, 10 Nov 2022 00:35:38 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l65-20020a622544000000b0056be4dbd4besm9634865pfl.111.2022.11.10.00.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:35:38 -0800 (PST)
Message-ID: <cee224a9-b107-9bf1-66d5-b631d5a88345@redhat.com>
Date: Thu, 10 Nov 2022 09:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 qemu-trivial@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221109173750.201615-1-thuth@redhat.com>
 <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org>
 <87wn83jr54.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87wn83jr54.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/11/2022 06.49, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 9/11/22 18:37, Thomas Huth wrote:
>>> If configuring with "--disable-system --disable-user --enable-guest-agent"
>>> the linking currently fails with:
>>>
>>> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
>>> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined reference to `qmp_command_name'
>>> build/../../home/thuth/devel/qemu/qga/commands.c:71: undefined reference to `qmp_command_is_enabled'
>>> build/../../home/thuth/devel/qemu/qga/commands.c:72: undefined reference to `qmp_has_success_response'
>>> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_info':
>>> build/../../home/thuth/devel/qemu/qga/commands.c:82: undefined reference to `qmp_for_each_command'
>>> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_exec':
>>> build/../../home/thuth/devel/qemu/qga/commands.c:410: undefined reference to `qbase64_decode'
>>> qga/qemu-ga.p/channel-posix.c.o: In function `ga_channel_open':
>>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:214: undefined reference to `unix_listen'
>>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:228: undefined reference to `socket_parse'
>>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:234: undefined reference to `socket_listen'
>>> qga/qemu-ga.p/commands-posix.c.o: In function `qmp_guest_file_write':
>>> build/../../home/thuth/devel/qemu/qga/commands-posix.c:527: undefined reference to `qbase64_decode'
>>>
>>> Let's make sure that we also compile and link the required files if
>>> the system emulators have not been enabled.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> I wonder for how long this has been broken.
> 
> Should we add such a configuration to CI?

Some month ago, I'd say: Sure! ... but considering that gitlab now limits 
the available CI minutes and that apparently nobody really cares about this 
configuration (otherwise someone would have complained about this earlier), 
I think it's not that important to have a separate CI test for this 
configuration.

  Thomas


