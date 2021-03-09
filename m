Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0E33317E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 23:29:22 +0100 (CET)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJkqv-0000ly-6N
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 17:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJkp9-0008BZ-9M
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:27:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJkp5-0004gR-Db
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615328845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iF5oqIU9J8CHNTs6y1dhdy8nQCiQFH7t8NVsiB1mEBA=;
 b=abaxljZObBDkxbSFse1z0sWCx1pf1/sui5lNKnQTj2QFLBUAoQ6FLQaL1UUC0+QybARJ4Y
 Ox/SwHnismGU8Xgf/jexXeRv8AwFBeqwyZLQx20bEXds+Xxl2CvHl3IOkYhtSNSaH0xN23
 sUb3uSZ8yyL1an0YkC0n0xMLIt+ebYs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-6haOG2A_M--OhakX3-5bgA-1; Tue, 09 Mar 2021 17:27:22 -0500
X-MC-Unique: 6haOG2A_M--OhakX3-5bgA-1
Received: by mail-ej1-f71.google.com with SMTP id n25so6324517ejd.5
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 14:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iF5oqIU9J8CHNTs6y1dhdy8nQCiQFH7t8NVsiB1mEBA=;
 b=EHH4d92A8pjIJGpccqOx47fM2zj5CWwiouxk2rGqnDfRMgQvJmxBxAC2gRWtQmRIet
 ylo/Aq2fzCDylXSQSmCusMHD9rTmoNgJ7LveZsNzsvkyg9cdBaQ7IDWXrZs7ecbfl936
 qtYCDWUu9Wz7UO7QYxHyu3P3SYltGIElMuwO2KrFDugqW3PQ4rPstNpSulCxRixEJi9W
 CYk6ZnX+6Llp+QedNhIhiyJNgaRqstS1uhu2eTKiwrq4R+S7CynVR8kmDwPv4SEmi7wD
 LeOrNp3n3r8IjmwUQ694L1MQBUbdaeVbyMEr9AXGALS+ZQgvtc8JGtmgg+vddQCY2Zrd
 dv8g==
X-Gm-Message-State: AOAM531bH5Gun7SDr/q9dI78NYH/31/7mdy8O2oyQdwXcwBwZe1olTHr
 +CUmUCLqZZg16kc9SAp8krIrYjxWxLJFU7l2wgpUiTyO1mCNHZ6PW7giy1tqdm7s0iNRVA8rBq7
 CdMQOjFPCl/Wps1g=
X-Received: by 2002:a17:906:9152:: with SMTP id
 y18mr279251ejw.19.1615328841712; 
 Tue, 09 Mar 2021 14:27:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTS4UpllDmoDlCTKY3eJY4Tbt0+oK2Zng11k/nlkMlBDY26Cv/a+teLjx3oJ1AovO5KvmHtQ==
X-Received: by 2002:a17:906:9152:: with SMTP id
 y18mr279242ejw.19.1615328841608; 
 Tue, 09 Mar 2021 14:27:21 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id cy5sm9718327edb.46.2021.03.09.14.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 14:27:21 -0800 (PST)
Subject: Re: [PATCH v5 0/4] qapi: Restrict X86 features to X86 targets
To: qemu-devel@nongnu.org
References: <20210224224643.3369940-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8d9fbfab-97b2-b9d2-328b-e717c8d4edcf@redhat.com>
Date: Tue, 9 Mar 2021 23:27:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224224643.3369940-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 2/24/21 11:46 PM, Philippe Mathieu-Daudé wrote:
> Since v4:
> - Rebase on Claudio's work to avoid stub
> 
> This series restrict the 'feature-words' property to the x86
> architecture (other archs don't have it), and to system-mode
> (user-mode doesn't use it).
> 
> v4: https://www.mail-archive.com/qemu-devel@nongnu.org/msg746628.html
> 
> Supersedes: <20201001144152.1555659-1-philmd@redhat.com>
> Based-on: <20210224133428.14071-1-cfontana@suse.de>
> 
> Philippe Mathieu-Daudé (4):
>   target/i386/cpu: Introduce get_register_enum_32() helper
>   target/i386/cpu: Restrict x86_cpu_get_feature_words to sysemu
>   qapi: Move X86 specific types to machine-target.json
>   qapi/machine-target: Restrict X86 features to X86 targets
> 
>  qapi/machine-target.json   | 45 ++++++++++++++++++++++++++++++++++++++
>  qapi/machine.json          | 42 -----------------------------------
>  target/i386/cpu-internal.h |  7 ++++++
>  target/i386/cpu-softmmu.c  | 36 ++++++++++++++++++++++++++++++
>  target/i386/cpu.c          | 45 +++++++-------------------------------
>  5 files changed, 96 insertions(+), 79 deletions(-)
> 


