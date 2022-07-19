Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C186157A66E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:24:01 +0200 (CEST)
Received: from localhost ([::1]:51574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrt2-0004tb-JD
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDrdZ-0003Tt-IE; Tue, 19 Jul 2022 14:08:01 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDrdW-0007xV-AL; Tue, 19 Jul 2022 14:08:00 -0400
Received: by mail-ed1-x52b.google.com with SMTP id z22so7741009edd.6;
 Tue, 19 Jul 2022 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IxPmMPiTZBDg0mxTBZfvX2MiuFCJg2yXTVp2DiI2ZHU=;
 b=CcGeIBHGYQ9/qlYGmkjYMcGZPHoysyudeNiqvbQwzeAZ4jptln7R8fOX/sWFhKOZ0R
 OGeAsQMzvRim2s8IR1g0XzQjK/V6cLaR8DuS8nX6PMah91qIEJOjbUGMqmTGEFJGnqpr
 aDb0jKLQCuWkpoD0j3UbIFWOlb28iqD7BRpqgmNs7SC4y3/EDWCKnDGws3OpJJB5PRS2
 ivDf8JwZ0wLGI/Fs9nYsgSrRk0SNMgD+H7XnqWpztns6LBOLbGO8cVvo/IFhDGe8P7F3
 U0ONshj4pA3LZEmBmLJrak3TP83f/+A3+7X7t9K1b7D1DOvOwrJ3j4o8y9CkjqJJyPdV
 HPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IxPmMPiTZBDg0mxTBZfvX2MiuFCJg2yXTVp2DiI2ZHU=;
 b=Zg4u30f5JuATlgNlNiYlLm30HkiXxHbQkLiN6bRXd9wzw9AiC3XldxqhE1gIMAoDV4
 xeUuFFZK+EtFK3SH4tonbAkiEVoFFHfmtiIuBT46ZcMRZ+g21SiaGPd1NL7jD0X6qVej
 wlp72JPDhgLokR41Wl/OS9xnIHzBzW+PA7bZU6ecNdvE7Uw3nc6OmBiWhR9SbAcL9YJN
 cBhTLBZNAFjGN465xpcFFtm+lmu1kL2HPT7rY0rSeiJ5CL1D0lRKz++2Qe1hftltpmJe
 yhRl33U0uLgaBef3tja6GSvu0hnFCtaDsud3rxnjDieAyHMf5IRqxcuZzO7VWN3wTwiV
 clqw==
X-Gm-Message-State: AJIora9DGKAAoOjovI0R3q5xSx5FgDZcudPnUMUF6gSe1v7P6FG1Dnk+
 a/68j1IDeMcyXZGYltdYLUY=
X-Google-Smtp-Source: AGRyM1uVZmk1/ACvw4yV3EpVJGNMpKx+h0eeUL+ErDWOL+uuHDiA8FFRWiPb+WHIjG9oemVPplW5/w==
X-Received: by 2002:a05:6402:22b5:b0:43a:8e9f:f495 with SMTP id
 cx21-20020a05640222b500b0043a8e9ff495mr44814436edb.324.1658254072086; 
 Tue, 19 Jul 2022 11:07:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 c7-20020aa7df07000000b0043a7c24a669sm10782127edy.91.2022.07.19.11.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 11:07:51 -0700 (PDT)
Message-ID: <79762fa3-74d5-ed08-8291-5534942c72b1@redhat.com>
Date: Tue, 19 Jul 2022 20:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 7/8] block: use the new _change_ API instead of
 _can_set_ and _set_
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-8-eesposit@redhat.com>
 <ea2b8793-532d-e7c1-c34f-a9ef89f8586d@redhat.com>
 <88e07fa2-60c9-0fb6-fc1b-b03a2f7d37f5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <88e07fa2-60c9-0fb6-fc1b-b03a2f7d37f5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/19/22 11:57, Emanuele Giuseppe Esposito wrote:
> 
> Wrapping the new drains in aio_context_acquire/release(new_context) is
> not so much helpful either, since apparently the following
> blk_set_aio_context makes aio_poll() hang.
> I am not sure why, any ideas?

I'll take a look, thanks.  In any case this doesn't block this series, 
it was just a suggestion and blk_do_set_aio_context can be improved on top.

Paolo

