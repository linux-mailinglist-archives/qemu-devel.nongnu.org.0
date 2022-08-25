Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E155A0537
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 02:36:40 +0200 (CEST)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR0rP-0003Sc-91
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 20:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0o2-0000sy-LT
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:33:10 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0ny-0008E7-5v
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:33:08 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p9-20020a17090a2d8900b001fb86ec43aaso2826637pjd.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 17:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=9giStDhm65jdQSjYRKJ+MNJn+faz1B0CmbtfFJKrP2M=;
 b=L2gHcAQG+vcerZj3y/MOA2afTMJNBxU4yyGQIL+iCISLXYZ4RR+jZ8azIpoX0dWyDH
 GuNlz7xghYE7jbBlFr9fNXPZ4EySchBVq65RdQzWZmeuuH+ppg+4HhXxcpjpCe0Vec7D
 Buwex1WENJ6WxXBxzjEFlevZ8za1mUjYC03HP0NePe94i0r1AB95yGlTLnJrTBhP0dhB
 P/m8nF47Y9xRhULuznQ5cAclXWoa2TGDoFn9qwFk/ofA/9Q3yRaK3F2RDobAIwX6/XBM
 773lTm5gPeseT6GWmJcn2yEOpw1tIw1xU3xCjo5M8xWjQGtNfnb9G2JqAOPbhdCyc6fl
 7GPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=9giStDhm65jdQSjYRKJ+MNJn+faz1B0CmbtfFJKrP2M=;
 b=MMZqZjXTygRlFgk2zEpuJ5jhEY+XKrANZdJ7oxDSaNoO4YW32E/cp5IsgWc82x7PJY
 53y4hRNCUeOkj0bRgTKszx/vAe919ESmS1zjA9zJGrbD8h8VEmMAvHpxVV30eHhE8SgM
 frDB0XsTUMTTKNQn21oh1ryMsjEXOhFfCeq+7bSM+YkujS4lfKGQh77i4brG7AZTfXU7
 9XfXUJ9wo0V6o3kjjjJwMhJvncDVvBuVWZNqOHyGF3SG5A0iTlXdIQ1xONZpUYU3WTFS
 AsKgNTKwh9tllSAQ0UpFV1LgLrwCd47+3ju1KXpLE2YdwUmiU4K0yo0w0N6FGpqHrmfi
 2BcQ==
X-Gm-Message-State: ACgBeo1ZbxsDoO13PIauuLKnrpvZ67/aFSb6VKUl4QX6bQpyTfFp42Cc
 mYIkbN7ctW3e3SPLElpngw1VBQ==
X-Google-Smtp-Source: AA6agR5YD+faEofgd937Dn2p7qX7JoQ2FvfftVlCRKcacQfgrjhjD1PgCPbOAALtacNDyyQ5XlDEaw==
X-Received: by 2002:a17:90a:6b0d:b0:1fa:c6fe:db6 with SMTP id
 v13-20020a17090a6b0d00b001fac6fe0db6mr10866404pjj.99.1661387584309; 
 Wed, 24 Aug 2022 17:33:04 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:944b:63b7:13bc:4d26?
 ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090a154d00b001f2ef3c7956sm2026132pja.25.2022.08.24.17.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 17:33:03 -0700 (PDT)
Message-ID: <a86a4669-45da-accb-843c-e75de1c1207f@linaro.org>
Date: Wed, 24 Aug 2022 17:33:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/17] target/i386: add 60-67, 70-77 opcodes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173250.232491-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220824173250.232491-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/24/22 10:32, Paolo Bonzini wrote:
> +static void decode_group_0x63(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
> +{
> +    static X86OpEntry arpl = X86_OP_ENTRY2(ARPL, E,w, G,w, .special = X86_SPECIAL_ProtMode);
> +    static X86OpEntry mov = X86_OP_ENTRY3(MOV, G,v, E,v, None, None);
> +    static X86OpEntry movsxd = X86_OP_ENTRY3(MOVSXD, G,v, E,d, None, None);

const.


r~

