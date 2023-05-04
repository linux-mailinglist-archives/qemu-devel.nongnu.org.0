Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD816F6987
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:07:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWo7-0001oy-FM; Thu, 04 May 2023 07:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWo5-0001oj-Dg
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:07:29 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWo3-0004y9-RA
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:07:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bd875398dso449013a12.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683198446; x=1685790446;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YlNQpG2pHoRi7C9zHGjraMBNSI1xyKOvDecgVwMUba0=;
 b=pLA8BR2+mP5CiIH9hHQOCxZP07q/NoK6ec8CkTfbTw2s54RFthOt/89dIrPn9Enb7q
 O8gKHRhnY0ftU0pWE35BxMqExN2m+5zkIEKE6keGBShkUeb1YRKmf252kASAlxONpfYW
 L+jPuWWk0fIXdlYBfZDP4QhxLcpnAFcQ+LBm0njsqxo1IBiH9EpcXvWxZ7WKfBXyONtl
 5q230fRTA03mc7Pb316Q2hRvFtKWCoBFtWgvM1OAxoufVfTIT4Q9BU3KOgL4z2rcpV+f
 kFZ2Se2E49pLpCyLoQ1ZaaZ2bsZA0COz4dn0o7hWsOxEijUVvL9OGwWcnFoMl70NAQP/
 ni5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683198446; x=1685790446;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YlNQpG2pHoRi7C9zHGjraMBNSI1xyKOvDecgVwMUba0=;
 b=Beg9KCzicqnewca5rDZy6VSL2PKy4fYvyHeNJbVdnfZm7MUI+4yvTQ45bJ0WGhqUhC
 1po8MYBW9ZycY/eFAQD5OqK3fJMYHCVooDch5dQuetLC0/7c5wMHmUQOU2hMBo0QTVUr
 vkBDsiIbwJXFoJtgjhybaPKw5ICQBmOXerYNbtZKmes8R+ckPdbKR+1FjbQQJRjeVAxH
 eeoZENqkInHoQ6c/lrPIASGQh6QOYS2zMa17ZH2pcha9bT9k2MOljfgnJUDeAmqr/Lwv
 GCl7LHx53WHx79tvsS94IeFcah8oTbKixT0ozS8QMdZYC4L9QydueBzWGc8RstmP7905
 VeWA==
X-Gm-Message-State: AC+VfDx1Gc+yTMjK+dnawq38Z/1zd6c4zIPo9WHEy9iCqc9DGz5fJxcw
 XyaFd5sU2M4aHTcnG09sS2fKdAyoZJUDUIuupP0vvA==
X-Google-Smtp-Source: ACHHUZ79MCW+kjiumWnAEC5totZS6aGRY/5wZWkdoRe7JCZ0YWmZMzV8oT9lsWdhomtI2tx7Te4Qug==
X-Received: by 2002:a17:906:eec8:b0:94e:dd30:54b5 with SMTP id
 wu8-20020a170906eec800b0094edd3054b5mr6257597ejb.6.1683198446084; 
 Thu, 04 May 2023 04:07:26 -0700 (PDT)
Received: from [192.168.66.227] ([91.223.100.49])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a170906705400b0094f05fee9d3sm18636334ejj.211.2023.05.04.04.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 04:07:25 -0700 (PDT)
Message-ID: <5b5baa6b-9d84-010d-1e9a-b0fef1036669@linaro.org>
Date: Thu, 4 May 2023 12:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/2] NBD pull request for 2023-05-03
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20230503190232.362022-1-eblake@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503190232.362022-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 20:02, Eric Blake wrote:
> The following changes since commit 044f8cf70a2fdf3b9e4c4d849c66e7855d2c446a:
> 
>    Merge tag 'migration-20230428-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-05-03 10:29:30 +0100)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2023-05-03
> 
> for you to fetch changes up to de79b52604e43fdeba6cee4f5af600b62169f2d2:
> 
>    block/export: call blk_set_dev_ops(blk, NULL, NULL) (2023-05-03 14:00:08 -0500)
> 
> ----------------------------------------------------------------
> nbd patches for 2023-05-03
> 
> - Eric Blake: clear LISTEN_FDNAMES when consuming systemd sockets
> - Stefan Hajnoczi: clear export BlockDeviceOps in central location
> 
> ----------------------------------------------------------------
> Eric Blake (1):
>        systemd: Also clear LISTEN_FDNAMES during systemd socket activation
> 
> Stefan Hajnoczi (1):
>        block/export: call blk_set_dev_ops(blk, NULL, NULL)
> 
>   block/export/export.c    | 2 ++
>   block/export/vduse-blk.c | 1 -
>   util/systemd.c           | 1 +
>   3 files changed, 3 insertions(+), 1 deletion(-)
> 
> base-commit: 044f8cf70a2fdf3b9e4c4d849c66e7855d2c446a

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


