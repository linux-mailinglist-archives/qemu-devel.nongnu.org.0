Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A728672634
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 19:03:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pICko-0001jg-Hv; Wed, 18 Jan 2023 13:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1pICkl-0001hy-61; Wed, 18 Jan 2023 13:01:39 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1pICki-0006M3-ND; Wed, 18 Jan 2023 13:01:38 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r2so34784819wrv.7;
 Wed, 18 Jan 2023 10:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tyw7ou4IJw8ncFrWRqCaWniwKpZIPmalh8abZ0UHJSU=;
 b=JiZamXMayMVvkR9EjR6QAiKPgqUWINlUPFxiELM/IKvWFfXMYwZE2uULrKipFT3FFm
 GVHIrVTecOfoqkP+VDjHEV8lywqMn68/jjQ4Kd3hT3A4JI1qwgYztXvTSHaD0pOTW/++
 qStpBRFBkP7PGwzCuh+6AezWCWb9Y/sqa6gqvQjI2QquGZz7WQV/kOJd0fYTOKE/rsxR
 dpP6q+Jt7QuH842d8GGhdwV6/YV1R2daD+za7AFGnjUe5M3/VexwtU3TWJqVRDvYLcZV
 KlUdNM+JBJBHPu0yUayHcNpBevFSAh1BFCnggsEIOqWJ5l1hY3M4sXBPZqiFVegbdR42
 Oq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyw7ou4IJw8ncFrWRqCaWniwKpZIPmalh8abZ0UHJSU=;
 b=27FIE5QUIrJTkdlwNc5bY1I46/oZyiH7F2gKsXkEt2TEkI+bnZbFDVuEr1/Np23O7P
 ZY80YcfZxHOzVAIXWSBA/5jBx/+Mx+QHnJUwVh8uJpxSBLjn2a3Li19kZ1pmG+jrVDk4
 +iFTts9SnG5bJJ3xOCAR1UabjDpu4n2IYuieTH4U9H0dAZ5W3f8GCtKQkxzut4a69YGR
 52EGQNxZDldXNOy7Ymy4GUXfM+QWBtvdZes3D6IZShQjumI3dZYZFnvSqbQ5LEQ/sLY8
 8j/TTRopj88HSKduWWopiCPl+AxHPYIVEaQ43+pBRDA18sr2EZ+OKRtGYmU66MTqr4aX
 n21g==
X-Gm-Message-State: AFqh2kp1y1reMgQqCuTAGbpHELcwROOtr66XNdfYMGH/T2JeChIsepw7
 u5U2fuZnEgrDxbSj8JCS+CY=
X-Google-Smtp-Source: AMrXdXvqjPh+vKUA7b/x4G3sR2bH72EAt3Jhv5PJiTwpKIzs40u2WMCZsUjvVb657JrNCwzUe30Ctw==
X-Received: by 2002:a5d:5e84:0:b0:2bd:f617:2b09 with SMTP id
 ck4-20020a5d5e84000000b002bdf6172b09mr7927091wrb.65.1674064893624; 
 Wed, 18 Jan 2023 10:01:33 -0800 (PST)
Received: from [192.168.33.3] ([147.235.205.16])
 by smtp.gmail.com with ESMTPSA id
 t18-20020adff612000000b002be2f18938csm2032301wrp.41.2023.01.18.10.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 10:01:33 -0800 (PST)
Message-ID: <3cc24e63-ad95-ae2b-077e-83e60291aeb4@gmail.com>
Date: Wed, 18 Jan 2023 20:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/1] hw/ide: share bmdma read and write functions
To: John Snow <jsnow@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
References: <20220219080818.327683-1-liavalb@gmail.com>
 <A83604D0-B156-4C34-BAF2-29D13D341386@gmail.com>
 <CAFn=p-bzzTM2cyEM_uVpnutj=7D5NgKFb3=854rNQe_Qc4GTfA@mail.gmail.com>
 <59AF7FF6-64F3-4633-B079-2C41DDF3B76C@gmail.com>
 <7e7bf877-0300-7a2e-e0a4-f8db6eeae88b@gmail.com>
 <CAFn=p-YwPCZOOzBpQb6FwdjKEYiNJj_HWrYVUs+Xg5i1=PkG0Q@mail.gmail.com>
Content-Language: en-US
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <CAFn=p-YwPCZOOzBpQb6FwdjKEYiNJj_HWrYVUs+Xg5i1=PkG0Q@mail.gmail.com>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

<html style="direction: ltr;">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style id="bidiui-paragraph-margins" type="text/css">body p { margin-bottom: 0cm; margin-top: 0pt; } </style>
  </head>
  <body bidimailui-charset-is-forced="true" style="direction: ltr;">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/16/23 22:29, John Snow wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFn=p-YwPCZOOzBpQb6FwdjKEYiNJj_HWrYVUs+Xg5i1=PkG0Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Jan 13, 2023 at 9:10 AM Liav Albani <a class="moz-txt-link-rfc2396E" href="mailto:liavalb@gmail.com">&lt;liavalb@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 1/11/23 01:07, Bernhard Beschow wrote:

Am 9. Januar 2023 19:24:16 UTC schrieb John Snow <a class="moz-txt-link-rfc2396E" href="mailto:jsnow@redhat.com">&lt;jsnow@redhat.com&gt;</a>:

On Tue, Sep 6, 2022 at 10:27 AM Bernhard Beschow <a class="moz-txt-link-rfc2396E" href="mailto:shentey@gmail.com">&lt;shentey@gmail.com&gt;</a> wrote:

Am 19. Februar 2022 08:08:17 UTC schrieb Liav Albani <a class="moz-txt-link-rfc2396E" href="mailto:liavalb@gmail.com">&lt;liavalb@gmail.com&gt;</a>:

This is a preparation before I send v3 of ich6-ide controller emulation patch.
I figured that it's more trivial to split the changes this way, by extracting
the bmdma functions from via.c and piix.c and sharing them together. Then,
I could easily put these into use when I send v3 of the ich6-ide patch by just
using the already separated functions. This was suggested by BALATON Zoltan when
he submitted a code review on my ich6-ide controller emulation patch.

Ping. Any news?

*cough*.

Has this been folded into subsequent series, or does this still need attention?

Both piix and via still have their own bmdma implementations. This patch might be worth having.

Best regards,
Bernhard

I see. Since you are still interested, I will try to see what was the outcome of that patch as I really don't remember if it passed the CI tests, etc. If applicable, I will send this as v2, or if it's already approved, then I guess we could just let it be merged to the tree?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I was just going to run some smoke tests on it and as long as it
didn't hurt anything, I'd wave it in. If you want it alongside other
patches that I also should stage, you can bundle them if you'd like.
Just let me know what you plan on doing.

--js
</pre>
    </blockquote>
    <p>For now I rather let the BMDMA patches (sharing read &amp; write
      functions) to get in, and work on the ich6-ide patches later.</p>
    <p>Thank you for picking this (I myself forgot about that)!</p>
    <p>Let me know about any problem being raised in the tests that you
      mentioned you will do for this patch.<br>
    </p>
    <p><br>
    </p>
    <p>Best regards,<br>
      Liav<br>
    </p>
  </body>
</html>

