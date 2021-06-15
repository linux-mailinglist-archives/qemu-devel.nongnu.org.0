Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87BF3A89EA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:02:20 +0200 (CEST)
Received: from localhost ([::1]:50826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltFGN-0004Af-AS
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltFEK-000358-6J
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:00:12 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltFEH-0004UZ-He
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:00:11 -0400
Received: by mail-pf1-x429.google.com with SMTP id h12so317103pfe.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qZvEs1DZ8CNNaq5SuPmQQKuLYBra2OwDPNwkc5Jc+M0=;
 b=EPC116RXTvWnRPVyqXItWugN2rohNjBf7YVfxlsvpVZXwFz34eUjog7qNnC7bv6ERC
 6WDUnwxcvlMbm2jLW4/GQaGiiDjGsCar/dg2Ku/ehlCGD3ZSOI++wpiqL0TUo8cfhbMy
 2wdJMZc3QusLIcVGtN2O7u+TWhFm7oSsGAGorJpdBfwMxxOTchdUpHGwvD88mAs9or6T
 5+nYVS+WPJvpplaX5aPxyeEYyxlfh80c6pVYOpaPSn+tIjVZc4HhV+YA282ndfjoZwxz
 IvjwhBSXzoT6N0jjKVcQs+C90WYPH2G/3pLfWLdselxW/z6uKe6otZPU9SN4QuFdcAG5
 6GCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qZvEs1DZ8CNNaq5SuPmQQKuLYBra2OwDPNwkc5Jc+M0=;
 b=FU5T48fSHXYhqmxxAX62hmZ4/atN+rhFqbWlf8NddFEU2/ZSu+/O1CKZnuHl03MPyh
 PhJvd19FaG4vJ7jqSSGG0sg7TmWk7U461L6j2s1/WKY5Y707tzkoSQfQ6r99DTb+v3jw
 x9TnCrXpxJkz1AVuMDRIXnJUy9Xj+Xbd60XauwiXcU4wM07HqZpXGLKxY96jmKPBMBM5
 IMpADflYuAKqfqG06MS9z4dI4IdMfo3u8YkKf6+aTEcXB86AOzEv9ElMt5RkztjbRntR
 K3qxRSgCQ9SQHEkLPAZLAeU8xLEHJv1SOJZKIDnorFvNcsQ3LzJBtDnA1hD0s3B6BBa7
 Y0Ug==
X-Gm-Message-State: AOAM533vVL5wAB+8aTyPWIj3R0A/pb5E3h/9W9kvGycoD2nwvvJ4Wg0K
 /aClM47GNUZTb5CmUxLScHBP2w==
X-Google-Smtp-Source: ABdhPJxfgyOKuMnPcEYknovJ4iEOUfub8mc1GKHrZ5rgDUTiFcIlRWFCugKIt5GJeG3Co8epLHcXRA==
X-Received: by 2002:a63:9552:: with SMTP id t18mr1203867pgn.206.1623787208026; 
 Tue, 15 Jun 2021 13:00:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z5sm11056pfb.114.2021.06.15.13.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 13:00:07 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate
 priviledged addresses
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
 <c2ffffa6-2868-f7ab-78c6-1f29eaafc4e5@linaro.org>
 <1c27c473-be10-41cf-d633-bcd838fed78e@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ce3cd57-0abf-f0d9-11ec-6fdc42b89b62@linaro.org>
Date: Tue, 15 Jun 2021 13:00:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1c27c473-be10-41cf-d633-bcd838fed78e@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 4:32 AM, Bruno Piazera Larsen wrote:
> On 14/06/2021 19:37, Richard Henderson wrote:
>> On 6/14/21 12:16 PM, Bruno Larsen (billionai) wrote:
>>> This patch changes ppc_cpu_get_phys_page_debug so that it is now
>>> able to translate both, priviledged and real mode addresses
>>> independently of whether the CPU executing it has those permissions
>>>
>>> This was mentioned by Fabiano as something that would be very useful to
>>> help with debugging, but could possibly constitute a security issue if
>>> that debug function can be called in some way by prodution code. the
>>> solution was implemented such that it would be trivial to wrap it around
>>> ifdefs for building only with --enable-debug, for instance, but we are
>>> not sure this is the best approach, hence why it is an RFC.
>>>
>>> Suggested-by: Fabiano Rosas<farosas@linux.ibm.com>
>>> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
>>> ---
>>>   target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
>>>   1 file changed, 23 insertions(+)
>>
>> I think the first part is unnecessary.  Either the cpu is in supervisor mode or it 
>> isn't, and gdb should use the correct address space.  If you really want to force 
>> supervisor lookup from a guest that is paused in usermode, I suppose you could force 
>> MSR.PR=1 while you're performing the access and set it back afterward.
> I don't see why GDB should not be able to see supervisor level addresses just because the 
> CPU can't.

Because then when you are debugging, you then don't know whether the address is actually 
accessible in the current cpu context.

>> I think the second part is actively wrong -- real-mode address lookup will (for the most 
>> part) always succeed.  Moreover, the gdb user will have no idea that you've silently 
>> changed addressing methods.
> 
> I disagree. Real-mode address will mostly fail, since during the boot process Linux 
> kernels set the MMU to use only virtual addresses, so real mode addresses only work when 
> debugging the firmware or the early setup of the kernel. After that, GDB can basically 
> only see virtual addresses.

Exactly.  But you changed that so that any unmapped address will re-try with real-mode, 
which (outside of hv) simply maps real->physical and returns the input.

One should have to perform some special action to see addresses in a different cpu 
context.  I don't think that gdb supports such a special action at the moment.  If you 
want that feature though, that's where you should start.


r~

