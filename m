Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1A22E0BB9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 15:32:31 +0100 (CET)
Received: from localhost ([::1]:44166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriiE-0004f8-9S
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 09:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krih0-00041L-SP; Tue, 22 Dec 2020 09:31:14 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krigy-0000O2-RU; Tue, 22 Dec 2020 09:31:14 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r3so14731686wrt.2;
 Tue, 22 Dec 2020 06:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ujFknXpq40I/eDpO2DbCGxz+omHeT5UdEFV3r7gJ6hM=;
 b=TEaTjlp4nYFb5TcREKvHR/yGCNbL98sohfABRAV9zcWJEbmcN35Qg3aaL2xOkur9oV
 9CaAGZxP9viBCv1wRQIIxxGOVFrR70chhDY0YqTw4ZEEDR+1uhsk22eslFx+AoiEy1Dq
 jMN/R+v+PhUAMt07Jz2YkfTSO7VbmQWZqlCjBh6wk5fmPVE9fMhfo69PGiNK6SaGjVbI
 Cjo8fTRNf49581+QpxUMjAsSn/820v1SnbuKuibeP/xtfkIJT9avnlmp+EzNEBGTSAqD
 1LYXZrWz+n7pram2/BuBCy98OrF9EgIVlpvB1QdCfsPs+4rc1/U2it+vOtY9ZZ+/kyUQ
 evcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ujFknXpq40I/eDpO2DbCGxz+omHeT5UdEFV3r7gJ6hM=;
 b=o8bTQQ0CWx7/hadAWL6too+yGJjCP/Cjqh/c0yv7RaPbTsrVDionkG0fXQPszx+jAx
 jbvBu2OnUxytGORgWqPmOWnbtK8SAHiXqcF+TBqK/Iyn7bWamSKJzh3ibdPJu82u72r8
 qt8FMUigtSMRdQMumqkt1SdbenpahJpeO0I2NA+LWk4uPBx9Tc6FzFrW1sPieYrI/tHF
 hwvF0f9+8ai73BUkGtlreg3DPeUgHwa51HQgwOeka+kgdrlYiESQQlKfd4abL3SQGUZ/
 UUOYqTjYB6/HjRy1RaNIOD44TvnPkNW+jZ5x8G7sk5vtaOF7WLAq5Ffm9gHxfh+SJL+E
 HiiQ==
X-Gm-Message-State: AOAM532CkZES8RBWC/rYv3iSMs0hTEDKAlRqfewv6wHwFanSX9WbSFgU
 SCuDt6Xxp/MZRcyI48Duw4I=
X-Google-Smtp-Source: ABdhPJyOAVbQ6lHfPzayBBBfBvqKaHm7MqqoG1VoUHFFsmES1r30Z0HzejSbg1YXmz+DI67Xy4jnyA==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr24461525wrt.46.1608647470945; 
 Tue, 22 Dec 2020 06:31:10 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id q1sm30148250wrj.8.2020.12.22.06.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 06:31:10 -0800 (PST)
Subject: Re: [PATCH v2 1/2] block: report errno when flock fcntl fails
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20201221134931.1194806-1-david.edmondson@oracle.com>
 <20201221134931.1194806-2-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <67730878-e090-d107-1fb1-b93a5d93ba2e@amsat.org>
Date: Tue, 22 Dec 2020 15:31:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201221134931.1194806-2-david.edmondson@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.521,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 2:49 PM, David Edmondson wrote:
> When a call to fcntl(2) for the purpose of manipulating file locks
> fails, report the error returned by fcntl.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  block/file-posix.c         | 20 +++++-----
>  tests/qemu-iotests/153.out | 76 +++++++++++++++++++-------------------
>  tests/qemu-iotests/182.out |  2 +-
>  3 files changed, 49 insertions(+), 49 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

