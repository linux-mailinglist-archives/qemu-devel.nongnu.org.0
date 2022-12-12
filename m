Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F064A5EA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:32:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4me2-0000My-Pr; Mon, 12 Dec 2022 12:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4mdw-0000Md-5O
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4mdu-0005MO-Ku
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670866265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c4l2cUQjnmJ7h8soCfF+Csm/sLFJpFXug+GghKBRrrM=;
 b=NZhlbwjQL/MWCmd77qoIZ8r4kBOkMWS9hpdJHbdnQDH0BseFoC9L6zGycxQ54p5bIprlcj
 4u7G/Rkbb2/cLrTiWHi5JGp3DnFjQIQ2imzxqZsNQQUsN7dwmcbo1cMIE+KUdX4bVhcbiD
 +fC6Rv/aFzBf6JsbUHsAegPqH55idP8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-1qNcjbQLMNeZJ-fynx1D0g-1; Mon, 12 Dec 2022 12:31:04 -0500
X-MC-Unique: 1qNcjbQLMNeZJ-fynx1D0g-1
Received: by mail-wr1-f71.google.com with SMTP id
 l9-20020adfa389000000b00241f907e102so2399797wrb.8
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 09:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c4l2cUQjnmJ7h8soCfF+Csm/sLFJpFXug+GghKBRrrM=;
 b=FjXCB9KtcfyhRO7h9916unjY9TLpcaUAX1lk77hW3gvYFpbIVV+s9Pa2mCeTtRzZxC
 HHYKGQXpTk27tVSGXjfQVSUe3ZbBHQciSGCR0yrtPr+m7OIAfTP0HK9Kx7rdB2sywnHj
 bl8lvzEFf753h3bMWxjrp6VlmsDRC2WIJmtlfoyOu4m8ohCIVUm2ubMmHmtq/T11K+eU
 OvRTcvfVyBB5RV/c2nQSjaiYm1m5BFbXIspr4iWQzfGjZW1lOf017MQMobYF9Bz+O60U
 e5N3uCry5DbRUbm43UnIphdOxxA/asPd8k/cAKDKpBxn1lisn5wiqX+SNqDcR4EorNpp
 hlJQ==
X-Gm-Message-State: ANoB5pnRIE0eAIyfvk3qWx2j+YxW4QciZCa2DbXL2S8U6eBk4fksYcH/
 wDJ7tBUg4ehXhqsYfoR9ogxgngb2MVSh248dbsXMNZ99eKPOhxUmoUWb9ane39Ja/0omBqefYSm
 UzV084WEBfBr7UYM=
X-Received: by 2002:a05:600c:34ca:b0:3cf:7624:5f98 with SMTP id
 d10-20020a05600c34ca00b003cf76245f98mr13445157wmq.18.1670866262873; 
 Mon, 12 Dec 2022 09:31:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ccok8kTc4i9aexmbKHNIOS8yMy1pnoyc8L8K5Z+g3ROnFe3oazCHutiPmjkJaboD6Paq4bA==
X-Received: by 2002:a05:600c:34ca:b0:3cf:7624:5f98 with SMTP id
 d10-20020a05600c34ca00b003cf76245f98mr13445143wmq.18.1670866262660; 
 Mon, 12 Dec 2022 09:31:02 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h22-20020a05600c351600b003d21759db42sm10680897wmq.5.2022.12.12.09.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 09:31:02 -0800 (PST)
Message-ID: <3a2876b0-cc7a-f498-ce21-78b84c2bd0f5@redhat.com>
Date: Mon, 12 Dec 2022 18:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 21/30] build: move sanitizer tests to meson
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-22-pbonzini@redhat.com>
 <CAJ+F1CLgpt_mcGn59jcCt+Sn-xs4rHJ30USUJyLPCkjrsZk9dA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJ+F1CLgpt_mcGn59jcCt+Sn-xs4rHJ30USUJyLPCkjrsZk9dA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/12/22 13:16, Marc-André Lureau wrote:
> No, it compiles successfully with clang (Fedora 15.0.4-1.fc37) and
> glibc-2.36-8.fc37.x86_64 at least.
> 
> I guess we need someone to check on macos with glibc 2.35
> (https://formulae.brew.sh/formula/glibc#default)

That's a Linux-only formula, so no need to check with macos.  I'll leave 
this patch as is, we can remove it later.

Paolo


