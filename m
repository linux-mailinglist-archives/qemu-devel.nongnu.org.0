Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3E83026BF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 16:15:45 +0100 (CET)
Received: from localhost ([::1]:57724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43ag-0004A5-HI
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 10:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43XS-0002Oj-CG
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:12:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43XQ-0006nU-FD
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611587539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TEkt3UDBgb1mNARyF8ivldRPdPQbrGVG1ZoXi0Tw5U=;
 b=IYjurKhpH6Enc2ozYyD2RWYDcc4UnwMIwzRlYLn+dNIVYPZj+iL8g87aGEbqbjPgd8YSZy
 cHyY1pTgWyG51+CN0PZ13lHANcZ+x6U+LdAAHpCNYiFf6UM8t7ARqSygG457pNT7nfE20Z
 G90bBGItm4WV0WBUoKpbpSwQa8SYGmQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-PkwDBc6YNUSa7En7i3bw2w-1; Mon, 25 Jan 2021 10:12:16 -0500
X-MC-Unique: PkwDBc6YNUSa7En7i3bw2w-1
Received: by mail-ej1-f69.google.com with SMTP id by20so3904068ejc.1
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8TEkt3UDBgb1mNARyF8ivldRPdPQbrGVG1ZoXi0Tw5U=;
 b=p1MQ+4cJowNsv8M8XIFWQ7btvKnsdTaRrMCLmyoVhxVfiywGIjVhGU1Az3c1wFth/2
 P1851H0mzrnh/aqYDBwzuc2sljw5es5AZtZsJqP6+nMwtX1mYngf/vWES23sG5ZBZ4WU
 LcWQ5m8C653YqsopAjoy3FMwC47JuLf68l+6GSTnu4SO4y8TP0YiX0ePBZxq9ICe4uON
 olSGsmVu0sdKSNr2Eh8YN5waRhflMm+g83gCkzh0xTd/2vMxqrNxGXSZjGFZ11DBv4gw
 ensCkvpljem/4kfZSFqHwz8h7ZFGePZJtGFL1WxGDkAAVGF8hYLnM2q6LQfGYaEZ+Syh
 2zmg==
X-Gm-Message-State: AOAM5319amiXYkdzrJt9vDbJAsBAAsD75+DyF4xKbHWfH09lkVOR5bi1
 XTNdb2RuWCwHASw86dx9bRccc/xNJDvCdeWWAnWZUmJgh9715qXYMl62Tc0fAj5vqHqKCLmIg4m
 LbRthFOW1LRHdZA8=
X-Received: by 2002:a17:907:1629:: with SMTP id
 hb41mr632404ejc.197.1611587534895; 
 Mon, 25 Jan 2021 07:12:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl11s6B+CdfOYZnRDwr6qn62AIT8CSDxDdjed2Cg5BK7lOlX1jhy5Qc3Vsu3/qYo6IagFurg==
X-Received: by 2002:a17:907:1629:: with SMTP id
 hb41mr632387ejc.197.1611587534681; 
 Mon, 25 Jan 2021 07:12:14 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a11sm10660926edt.26.2021.01.25.07.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 07:12:14 -0800 (PST)
Subject: Re: [PATCH v2 08/12] meson: Restrict emulation code
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
 <20210122204441.2145197-9-philmd@redhat.com>
 <188f9142-d90f-ffda-3bff-3dafbb8d886c@redhat.com>
Message-ID: <1ee452f5-f9cf-2efe-90b7-f05440d0d886@redhat.com>
Date: Mon, 25 Jan 2021 16:12:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <188f9142-d90f-ffda-3bff-3dafbb8d886c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 4:09 PM, Philippe Mathieu-Daudé wrote:
> On 1/22/21 9:44 PM, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  meson.build | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 396ea3aa19b..b5afa2923b3 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1809,16 +1809,18 @@
>>  qemuutil = declare_dependency(link_with: libqemuutil,
>>                                sources: genh + version_res)
>>  
>> -decodetree = generator(find_program('scripts/decodetree.py'),
>> -                       output: 'decode-@BASENAME@.c.inc',
>> -                       arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
>> +if have_system or have_user
> 
> Maybe better as:
> 
>    if not get_option('tcg').disabled()
> 
> And even clearer as:
> 
>    if get_option('tcg').enabled()
> 
> assuming enabled would be "auto" or "yes".

^ this comment is only for the decodetree generator, not for
the target/ directory ;)

> 
>> +  decodetree = generator(find_program('scripts/decodetree.py'),
>> +                         output: 'decode-@BASENAME@.c.inc',
>> +                         arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
>> +  subdir('libdecnumber')
>> +  subdir('target')
>> +endif
>>  
>>  subdir('audio')
>>  subdir('io')
>>  subdir('chardev')
>>  subdir('fsdev')
>> -subdir('libdecnumber')
>> -subdir('target')
>>  subdir('dump')
>>  
>>  block_ss.add(files(
>>
> 


