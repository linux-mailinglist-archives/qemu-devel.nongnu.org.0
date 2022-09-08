Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDAE5B2329
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 18:11:00 +0200 (CEST)
Received: from localhost ([::1]:57468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWK7H-00011c-4R
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 12:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWK0N-0001Zt-4D
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 12:03:55 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWK0L-0004dm-A0
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 12:03:50 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bz13so23478882wrb.2
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 09:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=VXKfDu/BE4mmWeGPAsPysDcMmFTv6ek3zdL74yLxyiE=;
 b=zGgbMdzC9HJRIIUHMwrSBxcFa06vthlW64v95h6yKqCYq+Tizdu2GmrgbhQkWMT0rJ
 aZCwQMAjaW4pCCaYgXV6a7xnRvvXVrK2UdJnvl78/8dl7WPjlefskibI2TZTMvm2C7i+
 W/K33JlZ1sKnFfNZPZoL4+y/UmvjQ+3bToC90fvz0LtydRVOXGDDfmx4TBgEHiOluEfR
 YHA6w4UaPaf7HBFXdd8CYkPqfPQJpTLBwaj6+SB5hly2tR7EnUsLVFH5BouhyaL8gA1z
 OgG8Xn5rcRblt73E51+jUxocvIEWViW1lb4sXz0KUP6LitWpjwjGSXJza99ZryH/KbtL
 g9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VXKfDu/BE4mmWeGPAsPysDcMmFTv6ek3zdL74yLxyiE=;
 b=AK+TuovU8tgMZxYd38Y6V2/i714V+uyW8F1zcxncGOQ/LCx8fBXMG9NLro+kgZiZ6n
 q4a9frM8NqEp1lnT4Bm+4Wzqh05FzpP9DAYM0bTKIaAfIYKNyhdjbXMn1kw0A7pcbVYQ
 lcp6e6iCP8dpWggN+d2y4n1kIE/EFnQepQkdrVWufIs48jBV/QirDFB79pTHwBvAHLnO
 lTxXwF92LREjlSi6ej3YnuImOMCPltqbGDfWRV9y40o25shnz+tfelPfvvM7jhyDAzsi
 zAygxo21QS59vaGttdRi2hqNGe/HbC/Mcnte71dOjo7+JOXq2+kk89SeyO0N8l0xf+Ya
 WbPA==
X-Gm-Message-State: ACgBeo0qx5OovSFUz/r8XEtwl6gG9wOahFWCOY5oEUswJ54OOiZSkXYS
 ZTuRViIpetLgc2MvIz4t7LsyMw==
X-Google-Smtp-Source: AA6agR4h+S7SEVLnoiF27M6SQHhE8YO0uh69IuBiv9IlZZt2Mb4WNt+tfmQiOANieUK5xnIslnsjdQ==
X-Received: by 2002:a05:6000:1849:b0:228:c87d:2578 with SMTP id
 c9-20020a056000184900b00228c87d2578mr5614025wri.274.1662653026739; 
 Thu, 08 Sep 2022 09:03:46 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c511200b003a2f2bb72d5sm4347167wms.45.2022.09.08.09.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 09:03:45 -0700 (PDT)
Message-ID: <062faaa8-064c-f68a-e316-aaacb80efa5a@linaro.org>
Date: Thu, 8 Sep 2022 17:03:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220908145308.30282-1-cfontana@suse.de>
 <20220908145308.30282-3-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220908145308.30282-3-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/22 15:53, Claudio Fontana wrote:
> @@ -446,8 +447,13 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>           return -EINVAL;
>       }
>   
> -    block_module_load_one("dmg-bz2");
> -    block_module_load_one("dmg-lzfse");
> +    if (!block_module_load_one("dmg-bz2", &local_err) && local_err) {
> +        error_report_err(local_err);
> +    }
> +    local_err = NULL;
> +    if (!block_module_load_one("dmg-lzfse", &local_err) && local_err) {
> +        error_report_err(local_err);
> +    }
>   
>       s->n_chunks = 0;
>       s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;

I wonder if these shouldn't fail hard if the modules don't exist?
Or at least pass back the error.

Kevin?

> @@ -1033,7 +1039,10 @@ ObjectClass *module_object_class_by_name(const char *typename)
>       oc = object_class_by_name(typename);
>   #ifdef CONFIG_MODULES
>       if (!oc) {
> -        module_load_qom_one(typename);
> +        Error *local_err = NULL;
> +        if (!module_load_qom_one(typename, &local_err) && local_err) {
> +            error_report_err(local_err);
> +        }

You can return NULL from this path, we know it failed.

> @@ -172,46 +170,38 @@ static int module_load_file(const char *fname, bool export_symbols)
>       }
>       g_module = g_module_open(fname, flags);
>       if (!g_module) {
> -        fprintf(stderr, "Failed to open module: %s\n",
> -                g_module_error());
> -        ret = -EINVAL;
> -        goto out;
> +        error_setg(errp, "failed to open module: %s", g_module_error());
> +        return false;
>       }
>       if (!g_module_symbol(g_module, DSO_STAMP_FUN_STR, (gpointer *)&sym)) {
> -        fprintf(stderr, "Failed to initialize module: %s\n",
> -                fname);
> -        /* Print some info if this is a QEMU module (but from different build),
> -         * this will make debugging user problems easier. */
> +        error_setg(errp, "failed to initialize module: %s", fname);
> +        /*
> +         * Print some info if this is a QEMU module (but from different build),
> +         * this will make debugging user problems easier.
> +         */
>           if (g_module_symbol(g_module, "qemu_module_dummy", (gpointer *)&sym)) {
> -            fprintf(stderr,
> -                    "Note: only modules from the same build can be loaded.\n");
> +            error_append_hint(errp,
> +                              "Only modules from the same build can be loaded");

With error_append_hint, you add the newline.

The rest of the util/module.c reorg looks good.


r~

