Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5B36F069A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:28:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1dv-0000rd-Ij; Thu, 27 Apr 2023 09:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ps1dt-0000rP-E7
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:26:37 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ps1dp-0003y0-Es
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:26:36 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-95f4c5cb755so360040366b.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 06:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682601992; x=1685193992;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2bic5sG+6OnxY71gu4anTi1dikTOh+dfoDwVqtBx4oc=;
 b=Xs/d6kwVzSgDGYVCbxdj618JBlZHZgisyi7wXH5FxQ6fnzj2WGbx6wG6t7TXVlhImN
 l9yvulSuNPzi2xY5eF8BXGY7vgPmwD8dFZNNCjyCGwp/9EKlNxEvkt+V5iVrSGGO1Or6
 PUxKtsQtlkQLqESyeaJSli/FAmzjq0pr4W3jgFti4zpTfeCokrQGPP9Chv3mHgVNEeA4
 ryiMt8wx+QDBdSxdykSJanLiFJf501UTNTyvG1ZK2q8U4ULCRtouOr+z4hT61qWSW40Z
 Ayby8LPTSKWOpYaCTCS5uxrUbRA+6sHue01M2Iyhub4O0dL+TnQsIBL7UQ1EbszwJkRk
 6mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682601992; x=1685193992;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2bic5sG+6OnxY71gu4anTi1dikTOh+dfoDwVqtBx4oc=;
 b=G65mRSc7FIK2N2ryE1FsA6yFgaWy4Mewvy51mcFe4Bbpgrl8R5xh7PCPV+w6NZBDWA
 TfEQWU9hgc6BKvaTWnj3+48pKuyEApJkaUXFtFwTJLPo3+skbZcjR98uVj4U4uh+sGve
 isSwgQPy92dGUK88ObMlxRAKgekLw77j9ZWEgcT+P6C7jLyApgUyGhW6/5S3bQ2dH0GC
 wCHy/KQ3rRCcb9+zb9uKzCTpVYV7ZY2yJOQdaElPgQHFqwBeZhE6Q9tlHyYcpgKRiEbM
 pLnCWab+rXm+uzVGxfCCvrp3TO4IbK/CyPKRA+3OsG0snf+0s9AkVO8EDl2O59RvuGIV
 4fdA==
X-Gm-Message-State: AC+VfDzO95ip54yDVUDjL1onNQZL4FCGIq7jxjDZayaGsamCLPr7kitJ
 DIHLM8pCf2QMaPmqK7QgvBca2g==
X-Google-Smtp-Source: ACHHUZ4SRL9TEomJoMyI6stheEMZfWxs4HfrQ57oJJBmO/+mG5GR9JiYwEd8NGChZZdQFuDuPxbaDw==
X-Received: by 2002:a17:907:1c9f:b0:92b:f118:ef32 with SMTP id
 nb31-20020a1709071c9f00b0092bf118ef32mr1787062ejc.48.1682601991734; 
 Thu, 27 Apr 2023 06:26:31 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 wv14-20020a170907080e00b009598cbe55c2sm5737028ejb.28.2023.04.27.06.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 06:26:31 -0700 (PDT)
Message-ID: <1e297268-168d-4df6-dca0-d950f17b9ef7@linaro.org>
Date: Thu, 27 Apr 2023 14:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/7] Migration 20230426 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
References: <20230427082557.20994-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427082557.20994-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/27/23 09:25, Juan Quintela wrote:
> The following changes since commit c3f9aa8e488db330197c9217e38555f6772e8f07:
> 
>    Merge tag 'pull-qapi-2023-04-26' ofhttps://repo.or.cz/qemu/armbru  into staging (2023-04-26 07:23:32 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git  tags/migration-20230426-pull-request
> 
> for you to fetch changes up to a67cceb071b76cc1631c67c11c845ffc4aa0803e:
> 
>    vmstate-static-checker: Recognize "num" field (2023-04-27 10:18:26 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request (take2)
> 
> With respect to the last PULL request:
> - fix compilation on hosts without userfaultd.
> 
> Please, apply.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


