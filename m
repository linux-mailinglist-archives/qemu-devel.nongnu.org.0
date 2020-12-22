Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE552E085D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 10:57:52 +0100 (CET)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kreQR-0006Db-Jn
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 04:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krePB-0005kW-OY
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 04:56:33 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krePA-0006Or-6e
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 04:56:33 -0500
Received: by mail-ed1-x529.google.com with SMTP id b2so12387306edm.3
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 01:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DaxZ0ngrWxh5bKo9+xoy6FdsTGmADSqA43Y6gnpEERo=;
 b=iMovsHhTLRvcSFrqeiYMf9QNE0g3ZFQxYLam0wq+9N6Zi5y9fNJ2MFM2DIWtesPxZv
 jzYDosw/33Qd02pMrXum0/a6WSXxVNf8FFqeobJq/39ZbWbifA6FHA33x/o2gR5qB2Yo
 1aEnXxtvYWf4Mu0qbMgNnqdS77XpNXMKwO14jEuxuwMOOLkNhqG1ReE+rDH4nUrKoOtl
 D45Tdfn5GTl+sDwZyJEYicPnDE0w70IEoDIKyT/ybA1uAFUaE27ZMV2V3JtLxU48CGdx
 WcP38nHz5jVxKVPgA2gbI12EJA2s23bGrwnMOlZ+2ySvvCl2DiG86C0cHZDv5U7iu6zw
 M6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DaxZ0ngrWxh5bKo9+xoy6FdsTGmADSqA43Y6gnpEERo=;
 b=bKA5AY9QAn1hr/Ci1CGiiEsqI+93xmLIx9TN8Iy7B0YufBwoLQf2e5mTTz54AZVpuK
 kgnZb/gqkW5cMAQA9B/x92IPUSqRS1vzRFYRqlCrn7Msn8AibyXoX9Uf5gcnpTDzo/+Y
 qSN06oU1PK3XWotOjZ7kfbCP2OJoL7TJGB5ekSG80NCDFOHVVEmT75amxKsbnRFGIRrP
 CwQvAWrO89AX/UjUEKv4VMOmQAcRvRl8Pq3Bd94aWQq0T0Xqs1sbzUnaHR12brJ1eIrz
 skWZqRrDdbr5dymLlqeGtFL1CqvY04CfJ3qYLPOf79AvH1NiF1bEfJbYUFXX7iQ/iSdO
 oNUA==
X-Gm-Message-State: AOAM531Fa0lBmbWnLpzYCiZKYBEgsqv8rmZd8rT2VvPzaq0oxuKO9Rrf
 Yvcb1fW2GVVJBGBO0yhpQ9M=
X-Google-Smtp-Source: ABdhPJxXpaiF0twXoo4InuAwS1nE15rE+YQ9rSJex2SPUeHBU3CLx28Ez7KUi6j1v5nO3QzplwJQUw==
X-Received: by 2002:a05:6402:2066:: with SMTP id
 bd6mr19479993edb.211.1608630990739; 
 Tue, 22 Dec 2020 01:56:30 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id k21sm30819764edq.26.2020.12.22.01.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 01:56:30 -0800 (PST)
Subject: Re: [PATCH 18/20] keyval: Use GString to accumulate value strings
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-19-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ee46bd65-e6bd-929b-74d1-1fb8110879c1@redhat.com>
Date: Tue, 22 Dec 2020 10:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211171152.146877-19-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.233,
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 18:11, Markus Armbruster wrote:
> QString supports modifying its string, but it's quite limited: you can
> only append.  The remaining callers use it for building an initial
> string, never for modifying it later.
> 
> Change keyval_parse_one() to do build the initial string with GString.
> This is another step towards making QString immutable.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

It's a bit unfortunate that the infamous "keyval: accept escaped commas 
in implied option" patch was already getting rid of mutable QString.

It used a completely different mechanism, namely unescaping the string 
in place.  This means that my patch was doing n+1 allocations, versus a 
best case of n and a generic case of O(n) for this patch.  The 
difference does not really matter, though I still like my code better.

Paolo

> ---
>   util/keyval.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/util/keyval.c b/util/keyval.c
> index 7f625ad33c..be34928813 100644
> --- a/util/keyval.c
> +++ b/util/keyval.c
> @@ -189,7 +189,7 @@ static const char *keyval_parse_one(QDict *qdict, const char *params,
>       QDict *cur;
>       int ret;
>       QObject *next;
> -    QString *val;
> +    GString *val;
>   
>       key = params;
>       val_end = NULL;
> @@ -263,7 +263,7 @@ static const char *keyval_parse_one(QDict *qdict, const char *params,
>   
>       if (key == implied_key) {
>           assert(!*s);
> -        val = qstring_from_substr(params, 0, val_end - params);
> +        val = g_string_new_len(params, val_end - params);
>           s = val_end;
>           if (*s == ',') {
>               s++;
> @@ -276,7 +276,7 @@ static const char *keyval_parse_one(QDict *qdict, const char *params,
>           }
>           s++;
>   
> -        val = qstring_new();
> +        val = g_string_new(NULL);
>           for (;;) {
>               if (!*s) {
>                   break;
> @@ -286,11 +286,12 @@ static const char *keyval_parse_one(QDict *qdict, const char *params,
>                       break;
>                   }
>               }
> -            qstring_append_chr(val, *s++);
> +            g_string_append_c(val, *s++);
>           }
>       }
>   
> -    if (!keyval_parse_put(cur, key_in_cur, val, key, key_end, errp)) {
> +    if (!keyval_parse_put(cur, key_in_cur, qstring_from_gstring(val),
> +                          key, key_end, errp)) {
>           return NULL;
>       }
>       return s;
> 


