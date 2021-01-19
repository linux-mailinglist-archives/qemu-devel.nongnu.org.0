Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF22FBD0F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:59:28 +0100 (CET)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uLn-0004sj-3a
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1uHj-0000v8-2Y
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:55:15 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:46883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1uHb-0002G5-UY
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:55:12 -0500
Received: by mail-qt1-x82c.google.com with SMTP id h19so14123305qtq.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=cOuD2Frp5BcOZYgr/ShCfmGg8pGDW7k3GpkJWnV6pf0=;
 b=nOJtp3mqNWThvaOJjmaPyifDw77SBjw2KnjuknRWU+B/5AT6WhQ0n/RTOlzmtoXNSr
 aa1F3pIsFXLhXqCIiqOhue7o/b6nsvwvZigmkTxyuuv9CLvw4k34auRuJxspvpGHAwvQ
 j1wkBwJCLc/pjrPuwhQbs+ZGPLVNgK7t8yeZOrNBQI5fONbTapS4iIT+p5u7Mm/cQYsH
 cgwG8xpp7hl0LuMOJGDTYKSoBJHu5PsbcfT4h4b9ShZWJgIbc8q5DYqQjnb9MjPRhd5+
 rJnn+qIx15KSSPapTuGmPFdcKjb+6XfTV3eSmNERdjiL0TP2vr9tp9ThLbdQoki8duj+
 NAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cOuD2Frp5BcOZYgr/ShCfmGg8pGDW7k3GpkJWnV6pf0=;
 b=TOZju6XPLV6VOjvtOxfeVql7WhUuTpUueJap5uDj8r/8GqHGYpCV21rR+xJdVdnvje
 BvjCCNTAN0K7d09MRv9xgHvJVXBxiRk8ERJu0AhG5cwkodzScIian3SSIx4k5fqtP+it
 sswYU24YvxPxpkpHDV4hKFMXX8eIQIkMPFOUjoas/aVBsRZPsMI6VRt3YT08BWuPJygT
 UG5HzaLIBN5KnwJt9r43pwQsmjB9Z3ekk+uRw2eIk9oJ5mIt9cXEPflBh4gxaLwU7fBH
 1GICLUM8auWgWXwafXZo3ittm7S9JJClLEjVUEAow0PB+iqM7PjrGRWWPEn3iH7jXUeD
 Ijpw==
X-Gm-Message-State: AOAM531frZ95TSrtDyrfjlbjWVe0Bih7zOB+4ggioUwff0LEV4S8goHM
 t3hfUmwNh/6uQznD82Wh8E1qSrOOFpI=
X-Google-Smtp-Source: ABdhPJyDb46QOSnxCLwITLPMfBoCdFDudzaOk/CjOV+OG9tK32wD3DpTW63blEZR0wUokeYFEf6ffg==
X-Received: by 2002:ac8:5a43:: with SMTP id o3mr4916123qta.222.1611075306575; 
 Tue, 19 Jan 2021 08:55:06 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:a75a:cb34:ba60:6de6:be1d?
 ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id j124sm13185831qkf.113.2021.01.19.08.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 08:55:06 -0800 (PST)
Subject: Re: [PATCH] hostmem: Don't report pmem attribute if unsupported
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <96eb4f94e6381082ec0188ad180f60f19f2583fc.1611059652.git.mprivozn@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <ba5b7164-94e1-840c-2f73-803db5bf7536@gmail.com>
Date: Tue, 19 Jan 2021 13:55:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <96eb4f94e6381082ec0188ad180f60f19f2583fc.1611059652.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/19/21 9:35 AM, Michal Privoznik wrote:
> When management applications (like Libvirt) want to check whether
> memory-backend-file.pmem is supported they can list object
> properties using 'qom-list-properties'. However, 'pmem' is
> declared always (and thus reported always) and only at runtime
> QEMU errors out if it was built without libpmem (and thus can not
> guarantee write persistence). This is suboptimal since we have
> ability to declare attributes at compile time.
> 
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1915216
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---

Testing it on a host that doesn't have libpmem support:

- without this patch:

{"execute": "qom-list-properties", "arguments": {"typename": "memory-backend-file"}}
{"return": [
   (...)
    {"name": "pmem", "type": "bool"},
   (...)
]}

- with this patch there is no 'pmem' support reported:

{"execute": "qom-list-properties", "arguments": {"typename": "memory-backend-file"}}
{"return": [
     {"name": "type", "type": "string"},
     {"name": "policy", "description": "Set the NUMA policy", "type": "HostMemPolicy"},
     {"name": "prealloc-threads", "description": "Number of CPU threads to use for prealloc", "type": "int"},
     {"name": "dump", "description": "Set to 'off' to exclude from core dump", "type": "bool"},
     {"name": "share", "description": "Mark the memory as private to QEMU or shared", "type": "bool"},
     {"name": "prealloc", "description": "Preallocate memory", "type": "bool"},
     {"name": "size", "description": "Size of the memory region (ex: 500M)", "type": "int"},
     {"name": "x-use-canonical-path-for-ramblock-id", "type": "bool"},
     {"name": "host-nodes", "description": "Binds memory to the list of NUMA host nodes", "type": "int"},
     {"name": "merge", "description": "Mark memory as mergeable", "type": "bool"},
     {"name": "align", "type": "int"},
     {"name": "mem-path", "type": "string"},
     {"name": "discard-data", "type": "bool"}
]}


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   backends/hostmem-file.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index 40e1e5b3e3..7e30eb5985 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -123,6 +123,7 @@ static void file_memory_backend_set_align(Object *o, Visitor *v,
>       fb->align = val;
>   }
>   
> +#ifdef CONFIG_LIBPMEM
>   static bool file_memory_backend_get_pmem(Object *o, Error **errp)
>   {
>       return MEMORY_BACKEND_FILE(o)->is_pmem;
> @@ -139,17 +140,9 @@ static void file_memory_backend_set_pmem(Object *o, bool value, Error **errp)
>           return;
>       }
>   
> -#ifndef CONFIG_LIBPMEM
> -    if (value) {
> -        error_setg(errp, "Lack of libpmem support while setting the 'pmem=on'"
> -                   " of %s. We can't ensure data persistence.",
> -                   object_get_typename(o));
> -        return;
> -    }
> -#endif
> -
>       fb->is_pmem = value;
>   }
> +#endif /* CONFIG_LIBPMEM */
>   
>   static void file_backend_unparent(Object *obj)
>   {
> @@ -180,8 +173,10 @@ file_backend_class_init(ObjectClass *oc, void *data)
>           file_memory_backend_get_align,
>           file_memory_backend_set_align,
>           NULL, NULL);
> +#ifdef CONFIG_LIBPMEM
>       object_class_property_add_bool(oc, "pmem",
>           file_memory_backend_get_pmem, file_memory_backend_set_pmem);
> +#endif
>   }
>   
>   static void file_backend_instance_finalize(Object *o)
> 

