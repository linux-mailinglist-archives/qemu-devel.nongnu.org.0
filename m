Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874A6F14BC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:56:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKpO-0006Yh-39; Fri, 28 Apr 2023 05:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psKpM-0006YU-4E
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:55:44 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psKpK-0001Yw-3x
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:55:43 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-959a626b622so992622866b.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 02:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682675740; x=1685267740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bSCOX9+18pw5APnlKJfAUuscQiLiDCRqa148LTybgoA=;
 b=pnP+uZqm4MDTrOQvam44cVP9xEphieRzZYVF2vZg1J/+4XU28P5skZYWJL1CsvES3k
 RnRlApWK1DkDSHX0KCTlYim20ZpZbIbBIHZkbuUXxwn9S+zdyTCWbbO5cWUoOUHJCQVx
 8BtIPmns9w1kK3W9yEFqlkiP3SCEg6b4abTxWfHaBHkIuDT5thKZRh+/r8cWlBFZVUjq
 SOuWXqyD4kpYUFLTDdtFkFc2yV3t0o0TzqfH8/DnJFTcM+JJOZlQx9bFvUH+rgbcKB+T
 Oc47G4o1RBfEgAsVlAozq3WnXpx5GR3YyTETYX9f9EYujy6sof1kXX96BjMSPmAK6+kP
 oKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682675740; x=1685267740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bSCOX9+18pw5APnlKJfAUuscQiLiDCRqa148LTybgoA=;
 b=mCPNTLri/Qzli04NGPZwrR0xB1K0+MQwEZA8GMDlCbwPdixdAuU4hiHxa0AJzFyP2L
 J37CHmf724Y8F4EFqRqXgYCr1zCjSCoQuJRCehBe6ZjvDV4yBzau+jbsXMR1ygMcsAG4
 7GQLWxkDGMJltNdZfCaT3OO2g9VhwaDuZeFXvj1HB4EZJlBvcilgnwR/0Mh6yH9StPHm
 AhjxJG6pKRjZ7g6nrvOQkn2jrKVQ4iTZ5M/WQM4c2gNt41zDONFFiaEE8hcuNY7s8YLp
 3rNAUMTm1zDurGM+6nr9ORuf+9/b6GDV5nEqxlLZqetyGHT9BRRtpTyNllxhY4HjNqVG
 nV0A==
X-Gm-Message-State: AC+VfDxO2rDvAhgJgmLZHqUv1in2s9nbNGNzomBHwSfzjB9g/f2v8E3g
 0aPviOldKe1w3fkjlvOxR91h+w==
X-Google-Smtp-Source: ACHHUZ60Knj5NZx5Hfm0rD+uw+cSd3Dd+fE5mbp0P4N3SIG2g8bWvN+XpVLXozVj++R6kZnGBfU1dg==
X-Received: by 2002:a17:907:728d:b0:94f:3074:14fe with SMTP id
 dt13-20020a170907728d00b0094f307414femr4978006ejc.17.1682675740007; 
 Fri, 28 Apr 2023 02:55:40 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a1709060c5400b0094ebc041e20sm10885916ejf.46.2023.04.28.02.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 02:55:39 -0700 (PDT)
Message-ID: <8a3cfbbb-6bf8-6a15-47f6-2f010d55c296@linaro.org>
Date: Fri, 28 Apr 2023 10:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/18] Migration 20230427 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Peter Xu <peterx@redhat.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20230427152234.25400-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427152234.25400-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/27/23 16:22, Juan Quintela wrote:
> The following changes since commit 1eb95e1baef852d0971a1dd62a3293cd68f1ec35:
> 
>    Merge tag 'migration-20230426-pull-request' ofhttps://gitlab.com/juan.quintela/qemu  into staging (2023-04-27 10:47:14 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git  tags/migration-20230427-pull-request
> 
> for you to fetch changes up to 73208a336e249bc8e3bdd76a78d0af7ecaee9178:
> 
>    migration: Make dirty_bytes_last_sync atomic (2023-04-27 16:39:54 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request (20230427 edition)
> 
> Hi
> 
> Everything that has been reviewed:
> - stat64_set() by paolo
> - atomic_counters series fully reviewed (juan)
> - move capabilities to options.c fully reviewed (juan)
> - fix the channels_ready semaphore (juan)
> - multifd flush optimization reviewed (juan)
> 
> Please, apply.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


