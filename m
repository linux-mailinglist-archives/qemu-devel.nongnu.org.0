Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC6C3A6561
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:35:54 +0200 (CEST)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsksj-00035N-8h
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lskr3-0002CZ-UT; Mon, 14 Jun 2021 07:34:09 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lskr2-0001pE-F8; Mon, 14 Jun 2021 07:34:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id nd37so8393231ejc.3;
 Mon, 14 Jun 2021 04:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ElXzj8D4m7l5hpjdsmmL2PGMb82jKrtOEVqck08sPo8=;
 b=PLxa+ZHfCQFDd/QfN4CQLlVtUoUdWkWwljQu/L6y1Q1rvg5mqvnoFuvuX+32klbkIR
 iI0I4nWLJ6jA0hivCzUv1n3qs+AdCVqXFuJdNCWn8j/31FLImDocMqkq9F/8MEFONcHQ
 R4QnE1cSr8eC8yp8Vs3Ur/C/I8M6AT1nEV/Rz+oxR+5gI81KGK9434+HQqQDb2MN572+
 21TZ1WvnAyUReiC1Clr8p3q6NSVDu3edbWatuany9M6+wJjWzIik96q1qyJo+y9x1nAl
 saV3V2iq2guOBro5kT4qV3OWOGbXDXFGKrq3+KW0gp4XXgD472Mppd4NeWyH5aXC905I
 XiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ElXzj8D4m7l5hpjdsmmL2PGMb82jKrtOEVqck08sPo8=;
 b=fO85cYOJxdzwHFAtImj5ERUPe/hxpNywRquKfu3O8um6knvVZ+J/bwd1y0+Wzp206m
 UiuoGwwIt/k3l/NUGFL3MSxmmnq3TLvndrEEzv1PwWfkemzanSTRUn1ijQFDfRUdfL4b
 RTOuzrjmUxEBnS8O3rq8yY7anwbBlwlFby+98SQywop4LLhuqxA0FctY15/dI0xXiWki
 dA7DcC9pJaJyIL0FMuOcOt2LmFZftQSh3jvl5EfX6ZghzrVM1D8yoQOZcSBN5oBczqyX
 iJyECo/m34UXDe1mzlMrSxlUMiEKWtX3hhYGT7CclmhHeu65485p2eQ35A/3kKKI0t0F
 V/Hg==
X-Gm-Message-State: AOAM532sZQx8pxYDVoo3Y7Hgf7xMOl76SSZ3cbX7vg7tQj4EQNdYildN
 bDu7C87JBrLl9HFom9FDYaI=
X-Google-Smtp-Source: ABdhPJwnIv6CSVklPn97B104yWedBCDg43231j/621tG1FpFSygj0Ho/PUBRY9ZN68MZCuEe9+gI9w==
X-Received: by 2002:a17:907:6ef:: with SMTP id
 yh15mr14634582ejb.151.1623670444611; 
 Mon, 14 Jun 2021 04:34:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id i6sm7052563ejr.68.2021.06.14.04.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 04:34:03 -0700 (PDT)
Subject: Re: [PATCH v2] async: the main AioContext is only "current" if under
 the BQL
From: Paolo Bonzini <pbonzini@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20210609122234.544153-1-pbonzini@redhat.com>
 <YMC7z/86LurXvAQ6@redhat.com>
 <0cc60d50-c047-4978-7fd6-49559044d84b@redhat.com>
Message-ID: <8af04436-505a-669a-5bdb-69e249afcf22@redhat.com>
Date: Mon, 14 Jun 2021 13:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0cc60d50-c047-4978-7fd6-49559044d84b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, stefanha@redhat.com, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/21 13:13, Paolo Bonzini wrote:
>> The commit message doesn't specify, but in the buggy case, are we
>> talking about calling aio_co_wake() for a coroutine in the main context
>> specifically, right? Could we have a unit test for this scenario?
> 
> Yes, that's the scenario.  I will try to write a unit test indeed.

Done ("tests: cover aio_co_enter from a worker thread without BQL 
taken").  aio_co_enter() is the function that "does the work" for 
aio_co_wake().  Eric, you may want to review and pick that up as well.

Paolo

