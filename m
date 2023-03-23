Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434486C680C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 13:19:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfJtL-0005Ug-8C; Thu, 23 Mar 2023 08:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pfJtJ-0005UT-6S
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 08:18:01 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pfJtH-0003Bb-4j
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 08:18:00 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 m20-20020a9d6094000000b0069caf591747so12002363otj.2
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679573878;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OblV3wPVUThmDrYpgk/a80ozbgpGes/XkGkZR9S8NIY=;
 b=C7hVtqUTAJjZXMRLkF5eZz+Q6ct3zV8sNqykEEtOIdj4XwExAqRAJKVYGMy+2cWGqd
 pPI10dYJ2gNYZ2GF/D4Ru7/sP5ZDCqVLxFjwPjvVzTQbhD0u2kDXKS7BOCnGP28FOjtG
 OnwY5lGjF2wOPLAtJHocabfe1b9ExJdLSlQBOO7G1R7TpRJC3dBaS83QpXQa0MCQnDYf
 iG2CD8LdYoIEYQhmrstiTpgg/X117AtmIE1RWlZIMtSOz8h+M62/mr95pQTJpd6OjO0e
 p0v3h8BVG2sVFWSGvZ5a1cfyQuiUVeUf3WkZ1TbzXFn/gbl3XNkGPk8+Um/m8XCTFx5A
 XeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679573878;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OblV3wPVUThmDrYpgk/a80ozbgpGes/XkGkZR9S8NIY=;
 b=BfNnfyA7ZI2TecWVw3Bud48E634UqCzjASJ2A2nqVZUQlQzp11xId6WsovIScuPilP
 /RZRVUDTDDz989NO8uRL7+VnDgNbyWEoUM7p/gnYZqlPV8HrufNb/6cBCcdCapr61kDD
 uzIoG5wmKLI6mK4qgfgQ47hM6LOmtUWO5r2jBFgNTbF3AI20GYVHAgjDlFd2EHypcRO/
 dYW0HC23UW6LbIs2GGsOmLLEnUXDceQQcOApIheFATk69ejJYLyPlTVjVKwQMOrp89ix
 WF7GFVk6WEf05CFdYuiMSen2sdeEr+u0KjO66acWcYdj4StlLeoJCYKCyovE7AfC0EJc
 iZaA==
X-Gm-Message-State: AO0yUKVO/nHYhKQMWGvx5H4F9/o6GjR0z3RH3XT1L9+MFTeaPwoJtyVf
 XHzIWqe/wdyfsEhyUXXI7LXViA==
X-Google-Smtp-Source: AK7set/vGazLqNCfYncnqpXTuBlL00XeflwHxj607cCqwP4oUy2sL/F5sTAJKem7yOm47tkyEHI4ew==
X-Received: by 2002:a05:6830:12d8:b0:690:dcaa:727b with SMTP id
 a24-20020a05683012d800b00690dcaa727bmr3886461otq.27.1679573877768; 
 Thu, 23 Mar 2023 05:17:57 -0700 (PDT)
Received: from ?IPV6:2804:14c:f435:9162::1009? ([2804:14c:f435:9162::1009])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a9d6405000000b0069b82311f27sm7303911otl.74.2023.03.23.05.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 05:17:57 -0700 (PDT)
Message-ID: <0f671d7f-5862-cf59-2ef2-be347c044a0b@ventanamicro.com>
Date: Thu, 23 Mar 2023 09:17:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: QMP command dumpdtb crash bug
To: Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <87jzz82d6o.fsf@pond.sub.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <87jzz82d6o.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 3/23/23 03:29, Markus Armbruster wrote:
> Watch this:
> 
>      $ gdb --args ../qemu/bld/qemu-system-aarch64 -S -M virt -display none -qmp stdio
>      [...]
>      (gdb) r
>      [...]
>      {"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 7}, "package": "v7.2.0-2331-gda89f78a7d"}, "capabilities": ["oob"]}}
>      [New Thread 0x7fffed62c6c0 (LWP 1021967)]
>      {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
>      {"return": {}}
>      {"execute": "dumpdtb", "arguments": {"filename": "fdt.dtb"}}
> 
>      Thread 1 "qemu-system-aar" received signal SIGSEGV, Segmentation fault.
>      qmp_dumpdtb (filename=0x5555581c5170 "fdt.dtb", errp=errp@entry=0x7fffffffdae8)
>          at ../softmmu/device_tree.c:661
>      661	    size = fdt_totalsize(current_machine->fdt);
> 
> current_machine->fdt is non-null here.  The crash is within
> fdt_totalsize().


Back when I added this command [1] one of the patches of this series was:

[PATCH v8 03/16] hw/arm: do not free machine->fdt in arm_load_dtb()

https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg04201.html

The patch aimed to address what you're seeing here. machine->fdt is not NULL,
but it was freed in arm_load_dtb() without assigning it to NULL and it contains
junk.

Back then this patch got no acks/reviews and got left behind. If I apply it now
at current master your example works.

> 
> I suspect ...
> 
>      void qmp_dumpdtb(const char *filename, Error **errp)
>      {
>          g_autoptr(GError) err = NULL;
>          uint32_t size;
> 
>          if (!current_machine->fdt) {
>              error_setg(errp, "This machine doesn't have a FDT");
>              return;
>          }
> 
> ... we're missing an "FDT isn't ready" guard here.


There might be a case where a guard would be needed, but for all ARM machines that
uses arm_load_dtb() I can say that the dumpdtb is broken regardless of whether you
attempt it during early boot or not.

One solution is to just apply the patch I mentioned above. Another solution is to
make a g_free(fdt) in arm_load_dtb and also do a ms->fdt = NULL to tell dumpdtb()
that there is no fdt available.

I don't see any particular reason why arm machines can't support this command, so
let me know and I can re-send that patch.



Thanks,


Daniel


[1] https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg04190.html

> 
>          size = fdt_totalsize(current_machine->fdt);
> 
>          g_assert(size > 0);
> 
>          if (!g_file_set_contents(filename, current_machine->fdt, size, &err)) {
>              error_setg(errp, "Error saving FDT to file %s: %s",
>                         filename, err->message);
>          }
>      }
> 
> Also, I think the error message "does not have a FDT" should say "an
> FDT".
> 

