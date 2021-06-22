Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A9B3B081B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:59:51 +0200 (CEST)
Received: from localhost ([::1]:34562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhsU-0002hO-TV
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvhra-0001aP-0y
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:58:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvhrX-0008Je-IQ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:58:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so1984574wms.1
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 07:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=adh0CDRbRK1m3qUER5CSUHtOdb4/lR9KTStmLZwFv5M=;
 b=ZiQFZ3KU6fNv8Qsw3ntn+fRNlD0l3ZgkosfE4YIblysmDY0BIgvRlUHnVDWMEEGY0D
 at3yUbkvvwG3mbEGlfcb9+xzKRvRlrirl5i6Tc2pSlzLHLONUc/2cLCJ4uxmWPqXytdD
 GSj2HAvTWbsvbCEHpliNgWAaxGtbdT6C0y/jcvgf9cfYXTuB5/wBEWH42poimv8oDJFe
 Qkg51BoG5WhTCqpQIRQbGmh1pvnkFI6Y+Q8XaagRKjyVoE5i+2lc3leuTWPvEnIlVd/s
 QPNlX9gfTHlKGFkB+4Ccokyi6keLh9y/wE3+BE79StVGDvszuQOIfRJlnvarMXmF0Fxy
 4U4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=adh0CDRbRK1m3qUER5CSUHtOdb4/lR9KTStmLZwFv5M=;
 b=gI5HNP51KKp6GTQ+keY8XsbGxFS+3VaafMTIOVjAEd+OqoPzYjUw23mF/vjAjP4ieZ
 vQpX3WUTFbDmSr6heBn1ry4jigLS62WLk2Q2JOgfGQ8QH36Vhl6CLTTwLIAZS2gkIzZI
 SB5DQsvJzQBQTpPrnID3G0RXys+dp4rPoHT7I5S1LHRRQb6ni/rdOoHLEbjyvOnhMfWU
 PyPu5QptDtdy3rArBDY6VGJ+wSWqCuSm5drEgf+2Oh2Ff6tzeY7q6PQb+nq280KTLsms
 n5wtA8JG43TAwLfiZ7SeuGUalWGPguFQ0D8Ku0afs5X3xk52El5Z47CHaxt3A+SuoFWJ
 ZDwg==
X-Gm-Message-State: AOAM531bin+yOIrSZp0t0mxHeu3TB1LJE9ZY+r+EqcYdwNhFCrRJTeXv
 jQE9GrgB7h9DhW+2OeEOG3IMFw==
X-Google-Smtp-Source: ABdhPJx0VzXH9ksRKQaRt3gtGjIU1B95WhT3pNzrKDEE9aMQtNmtUb9uZIuhHl9PIEMxagQPQ9rCvA==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr5106099wmh.69.1624373930137;
 Tue, 22 Jun 2021 07:58:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j11sm764430wms.6.2021.06.22.07.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 07:58:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F2591FF7E;
 Tue, 22 Jun 2021 15:58:48 +0100 (BST)
References: <20210608040532.56449-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH v3 0/4] Cache TCG plugin & symbol-resolution API
Date: Tue, 22 Jun 2021 15:57:35 +0100
In-reply-to: <20210608040532.56449-1-ma.mandourr@gmail.com>
Message-ID: <87pmwerlnb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> This RFC series introduces a new cache TCG plugin that models separate
> L1 data cache and L1 instruction cache and uses one shared cache for
> all the cores.
>
> It also includes a commit by Alex that adds an API call that resolves
> the symbol of an insn.
>
> The original RFC patch posted by Alex Benn=C3=A9e included incorporating
> symbol resolution into the cache plugin that caused conflicts, so I
> dropped the plugin additions from that and introduced them afterwards.

Queued patches 1-2 to plugins/next, will queue the rest from next
revision. Could you please also add a section to
docs/devel/tcg-plugins.rst to detail the argument options.

>
> v2 -> v3:
>     Precomputed the value of block size shift once and stored in the
>     cache.
>
>     Removed tag shifting since it's okay to leave the tag in the
>     high-order bits and mask out set index and block offset.
>
>     Used one hashtable to store InsnData structs and made the structs
>     have separate counters for data misses and instruction misses.
>
>     Used a boolean to indicate whether an access resulted in a hit or a
>     miss.
>
>     Inserted an InsnData struct into the hashtable on translation-time
>     and made sure we do so once so that we don't rewrite the struct if
>     an instruction is translated multiple times.
>
>     Made the output format for most-missing instructions more
>     machine-readable.
>
>     Removed trace-generation.
>
>     Freed tokenized strings after argument parsing.
>
>     Returned null from cache_init() if argument cache config is bad.
>
>     Used one enum to indicate the chosen eviction policy.
>
>     Added function pointers for cache update and metadata initialization
>     and destroying. Those pointers are assigned to policy-specific
>     functions.
>
>     Remade LRU. Assigned a generation number that is incremented on each
>     set access to the currently-accessed block's priority. On miss,=20
>     evicted the block with the least generation number.
>
>     Allowed to give multiple "evict" arguments and sticked to the last
>     one.
>
> Alex Benn=C3=A9e (1):
>   plugins/api: expose symbol lookup to plugins
>
> Mahmoud Mandour (3):
>   plugins: Added a new cache modelling plugin.
>   plugins/cache: Enabled cache parameterization
>   plugins/cache: Added FIFO and LRU eviction policies.
>
>  contrib/plugins/Makefile   |   1 +
>  contrib/plugins/cache.c    | 642 +++++++++++++++++++++++++++++++++++++
>  include/qemu/qemu-plugin.h |   9 +
>  plugins/api.c              |   6 +
>  4 files changed, 658 insertions(+)
>  create mode 100644 contrib/plugins/cache.c


--=20
Alex Benn=C3=A9e

