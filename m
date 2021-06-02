Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEC83986D1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:46:09 +0200 (CEST)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOO0-0004fb-RH
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loOMU-0002uF-Mc
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:44:36 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loOMS-0002Q0-MO
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:44:34 -0400
Received: by mail-ej1-x62c.google.com with SMTP id ce15so3150264ejb.4
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rZJ5n6+sIBbjmTm0eIf68HeeeNfq2ijNJ1WXt2YcWSE=;
 b=Iu3Gi6bL8sPxHRTAl0zbaPoO4GVvlBTYFzIA9EukYMyVldFibB7Q0RXIImocZZBfmh
 68B8Wj7D26zV4lO4uxYiCudJbwg4gHx4igK8m9C2lXlhB+MeHViaUfzXprWORAUlJg7U
 kcLSXh1ikWLucP3YqY3Ypsx7SHycaFZdX9Ot+YIhLXNQ38OFbGNGay4TNfCS8JYyzKTg
 Ab0/zBmVv7I6aLOOw/JTcnBgMSnRzeH5mYmKHaPW0XOGmGXELrKWxgO/Pbo5aFNg/q9y
 eRM0pc0wuzEWaBWJkFsugEiJexpnAphHGkEzaZ8xj5D0w9CQa1lgi26SYLU5Iy06Y6rH
 mlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rZJ5n6+sIBbjmTm0eIf68HeeeNfq2ijNJ1WXt2YcWSE=;
 b=Kw8muaz4YmzxNmWvjZTe0CXU5A3KhTvDNgjZZWuRqtoXvPq19Ycbuj6DJoa1KkEfbQ
 L+Zm7KBjd3bhxIcy3V8oEzBYONAEdduFvDw9iIiOcB5d1xQGErqvRbqlx+jbF/u0SX2L
 MkI9QcEpE8ldMw5DlkA3w/6MMF6ngjfkOawBJ25ZzTRjYOsroZzE7wB2K/rDff7gtZ5q
 zjYV9IbXx2KFgrkRuSKCZRkFGYNCpHS5ntE81U96vjDpfNYtfpmQVNGDRT55eukFYMk8
 DKgXBlUiySI77jE36AxOnRBd/Ilm4cfvo/MLBOlVL2Yk3REZyYNU+JPmeXMUq50WVHDT
 81vQ==
X-Gm-Message-State: AOAM533DaHgbGBeF1PA4s/H9Ts3MtwjdB4EWDMk4kmET27rQOLRjISmQ
 L2Psa9Djt/TRe2K6I1WIQWU=
X-Google-Smtp-Source: ABdhPJxFC0cuUleTDz+0DPx/5Cxl4W2LD40QLr1c2r4jcwpxPswC3fNHuV/dvL1oLYQqweKDaLWXjg==
X-Received: by 2002:a17:906:f88b:: with SMTP id
 lg11mr20250817ejb.99.1622630671272; 
 Wed, 02 Jun 2021 03:44:31 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id kj12sm2546437ejc.93.2021.06.02.03.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 03:44:30 -0700 (PDT)
Subject: Re: [RFC PATCH] plugins/api: expose symbol lookup to plugins
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210601145824.3849-1-alex.bennee@linaro.org>
 <CAD-LL6iQMLG8xFMiAJfQL9y_bfSYOEWn+5ARcfO=kAkr7rqg6Q@mail.gmail.com>
 <87mts8bqgy.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f9b34f33-03e6-7334-6217-603c3962f6bc@amsat.org>
Date: Wed, 2 Jun 2021 12:44:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87mts8bqgy.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.613,
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
Cc: qemu-devel@nongnu.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 Mahmoud Abd Al Ghany <mahmoudabdalghany@outlook.com>, minyihh@uci.edu,
 "Emilio G. Cota" <cota@braap.org>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 10:43 AM, Alex Bennée wrote:
> 
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
> 
>> On Tue, Jun 1, 2021 at 4:58 PM Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>  This is a quality of life helper for plugins so they don't need to
>>  re-implement symbol lookup when dumping an address. The strings are
>>  constant so don't need to be duplicated. One minor tweak is to return
>>  NULL instead of a zero length string to show lookup failed.
>>
>> Thank you for implementing this, I found it a really easy addition since you
>> already told me how this is done in the kick-off meeting and I implemented it
>> but I'm glad you already posted it :D
>>
>>  Based-on: 20210530063712.6832-4-ma.mandourr@gmail.com
>>  Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>  ---
>>   include/qemu/qemu-plugin.h |  9 +++++++++
>>   contrib/plugins/cache.c    | 10 ++++++++--
>>   plugins/api.c              |  6 ++++++
>>   3 files changed, 23 insertions(+), 2 deletions(-)
>>
>>  diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>>  index 97cdfd7761..dc3496f36c 100644
>>  --- a/include/qemu/qemu-plugin.h
>>  +++ b/include/qemu/qemu-plugin.h
>>  @@ -525,6 +525,15 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
>>
>>   char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
>>
>>  +/**
>>  + * qemu_plugin_insn_symbol() - best effort symbol lookup
>>  + * @insn: instruction reference
>>  + *
>>  + * Return a static string referring to the symbol. This is dependent
>>  + * on the binary QEMU is running having provided a symbol table.
>>  + */
>>  +const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn);
>>  +
>>   /**
>>    * qemu_plugin_vcpu_for_each() - iterate over the existing vCPU
>>    * @id: plugin ID
>>  diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
>>  index 1e323494bf..afaa3d9db5 100644
>>  --- a/contrib/plugins/cache.c
>>  +++ b/contrib/plugins/cache.c
>>  @@ -46,6 +46,7 @@ enum AccessResult {
>>
>>   struct InsnData {
>>       char *disas_str;
>>  +    const char *symbol;
>>       uint64_t addr;
>>       uint64_t misses;
>>   };
>>  @@ -377,10 +378,12 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
>>           struct InsnData *idata = g_new(struct InsnData, 1);
>>
>>           ddata->disas_str = qemu_plugin_insn_disas(insn);
>>  +        ddata->symbol = qemu_plugin_insn_symbol(insn);
>>           ddata->misses = 0;
>>           ddata->addr = effective_addr;
>>
>>           idata->disas_str = g_strdup(ddata->disas_str);
>>  +        idata->symbol = qemu_plugin_insn_symbol(insn);
>>           idata->misses = 0;
>>           idata->addr = effective_addr;
>>
>>  @@ -397,8 +400,11 @@ static void print_entry(gpointer data)
>>   {
>>       struct InsnData *insn = (struct InsnData *) data;
>>       g_autoptr(GString) xx = g_string_new("");
>>  -    g_string_append_printf(xx, "0x%" PRIx64 ": %s - misses: %lu\n",
>>  -            insn->addr, insn->disas_str, insn->misses);
>>  +    g_string_append_printf(xx, "0x%" PRIx64, insn->addr);
>>  +    if (insn->symbol) {
>>  +        g_string_append_printf(xx, " (%s)", insn->symbol);
>>  +    }
>>  +    g_string_append_printf(xx, ", %lu, %s\n", insn->misses, insn->disas_str);
>>       qemu_plugin_outs(xx->str);
>>   }
>>
>>  diff --git a/plugins/api.c b/plugins/api.c
>>  index 817c9b6b69..332e2c60e2 100644
>>  --- a/plugins/api.c
>>  +++ b/plugins/api.c
>>  @@ -233,6 +233,12 @@ char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn)
>>       return plugin_disas(cpu, insn->vaddr, insn->data->len);
>>   } 
>>
>>  +const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn)
>>  +{
>>  +    const char *sym = lookup_symbol(insn->vaddr);
>>  +    return sym[0] != 0 ? sym : NULL;
>>  +}
>>  +
>>   /*
>>    * The memory queries allow the plugin to query information about a
>>    * memory access.
>>  -- 
>>  2.20.1
>>
>> How can I address such an addition? Should I add it to my next RFC series
>> under your name using your Signed-off-by line?
> 
> Yes, if you git am the patch to your series it will keep my authorship
> and also copy the message-id of the post it came from. When you re-base
> you can add your s-o-b tag to indicate that to the best of your
> knowledge it is code that can be included in the tree (which it is, I
> posted it to qemu-devel ;-).
> 
>> Also, I think that somethings
>> in my series that you're basing your patch on will be changed, such as having
>> two duplicated entries of InsnData and the stupid name "xx" of the report string
>> How can I base your patch after my edits?
> 
> You have two choices. Move the patch to the start of your series and
> drop the actual plugin tweaks and make it API only or keep it at the end
> of the series and fix it up when you re-base. Generally you make a note
> "under the line" of the changes so the commit message would look like:
> 
>   plugins/api: expose symbol lookup to plugins
> 
>   This is a quality of life helper for plugins so they don't need to
>   re-implement symbol lookup when dumping an address. The strings are
>   constant so don't need to be duplicated. One minor tweak is to return
>   NULL instead of a zero length string to show lookup failed.
> 
>   Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>   Message-Id: <20210601145824.3849-1-alex.bennee@linaro.org>
>   Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> 
>   ---
>   v3
>     - included in my tree, fixed up rebase conflicts
> 
> This is a useful reference for people reading the patches on the list to
> see what changed. The tooling will drop everything under --- when it is
> applied to a tree.
> 


