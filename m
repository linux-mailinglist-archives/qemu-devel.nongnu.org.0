Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BD33D88F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:03:25 +0100 (CET)
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCAF-0001pX-Ls
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMC6h-0000Uc-Sa
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:59:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMC6f-0008Ml-DE
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615910378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ihJ/LQJ0apnkwLnXX/xJoGLI2g0UzazLuDhW0amOlc=;
 b=ZVOtkexTS1N5mqCq1EoA9qiJa5fh3nb3L9qeR2hAVI10z8CDDATdGKjgRLGZKlkA8hiEwT
 1d52me5AWSLlFKBXLcynbaq9J9Cv++6sHTgQzrILtDLQDLnaH9xidV6w1u4OBKw8QSZLM/
 ySregKZHSi4ooC1t6GkxOSU1CHCEafA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-wNB4v5WqN7yVI9heEVWpug-1; Tue, 16 Mar 2021 11:59:37 -0400
X-MC-Unique: wNB4v5WqN7yVI9heEVWpug-1
Received: by mail-wr1-f69.google.com with SMTP id z17so16871573wrv.23
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2ihJ/LQJ0apnkwLnXX/xJoGLI2g0UzazLuDhW0amOlc=;
 b=BydRFim6AdXPkJXElFsa1SAnNZWtKYP2H2HbgPNojMjAiu7OXsdBgJyYJ39uJKacNz
 WNkzoY6G24T+U5wwi1/ZBRiulGutcwu6UV2lNFgufgimpGvbgaB5SVhZgl5z3maZZHfN
 D6WYFMgvS87zAAX9nTtwwNsKNJryww9I+VhFdoS66EpwbEL69ppGwscl2QSibRLU5IKd
 3/aaMNWSyZ65wLAjSkKVP5iexEwjaP81alkG5m/HGKTmGy8bdG8xCg9hoB7JrqUJot7g
 wTENIDigYusOSaSenGYkq1n8hlfBYRSOZN2rKBBbVSSDlyQYbusTIGb/uN7Erf7vNJ/y
 fuZw==
X-Gm-Message-State: AOAM533bot/yDUsnRaiN4eJozbUyoz/NEFhDHDq9lU6Kms5X3PrPXs5b
 0vP7lO1Q4oKxjBsb++hybKTnpQXCNwXBkSaaUrhidw9yHIpwghel8ivJW3va4lWGYtR0tRoPDgu
 r+MXLUg32o8VoX0M=
X-Received: by 2002:a7b:c007:: with SMTP id c7mr292658wmb.59.1615910375844;
 Tue, 16 Mar 2021 08:59:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKsSSBBfxTfA0wIOWSyOmLybRN0ZvV7fbntll+OxQ5MoGBifoOPlvMmuMzAw8K4Wxl+12swg==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr292652wmb.59.1615910375724;
 Tue, 16 Mar 2021 08:59:35 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l5sm3597190wmh.0.2021.03.16.08.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:59:35 -0700 (PDT)
Subject: Re: [PATCH v2] util: fix use-after-free in module_load_one
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210316134456.3243102-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6560fca2-cfe2-c96b-1b57-19970d8ae036@redhat.com>
Date: Tue, 16 Mar 2021 16:59:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316134456.3243102-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: pbonzini@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 2:44 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> g_hash_table_add always retains ownership of the pointer passed in as
> the key. Its return status merely indicates whether the added entry was
> new, or replaced an existing entry. Thus key must never be freed after
> this method returns.
> 
> Spotted by ASAN:
> 
> ==2407186==ERROR: AddressSanitizer: heap-use-after-free on address 0x6020003ac4f0 at pc 0x7ffff766659c bp 0x7fffffffd1d0 sp 0x7fffffffc980
> READ of size 1 at 0x6020003ac4f0 thread T0
>     #0 0x7ffff766659b  (/lib64/libasan.so.6+0x8a59b)
>     #1 0x7ffff6bfa843 in g_str_equal ../glib/ghash.c:2303
>     #2 0x7ffff6bf8167 in g_hash_table_lookup_node ../glib/ghash.c:493
>     #3 0x7ffff6bf9b78 in g_hash_table_insert_internal ../glib/ghash.c:1598
>     #4 0x7ffff6bf9c32 in g_hash_table_add ../glib/ghash.c:1689
>     #5 0x5555596caad4 in module_load_one ../util/module.c:233
>     #6 0x5555596ca949 in module_load_one ../util/module.c:225
>     #7 0x5555596ca949 in module_load_one ../util/module.c:225
>     #8 0x5555596cbdf4 in module_load_qom_all ../util/module.c:349
> 
> Typical C bug...
> 
> Fixes: 90629122d2e ("module: use g_hash_table_add()")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  util/module.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


