Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C17939EED4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 08:37:32 +0200 (CEST)
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqVMh-0004pS-MO
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 02:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqVL2-0002ix-TN
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 02:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqVL1-0003Aj-9J
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 02:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623134146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a3g5IILuMGRwiOEvxdvGoUnwt3Fbirt9s82j/WmWJ+c=;
 b=QxSnjZ9WD/E6pPOkRbSpkY+MMGTeAX8gokrPxiCn0G1rqEpVUSZzARD0DuOiExR6n9Cq3M
 /idDcikQsbisAsxYkJ/yFPQR5LmSDMccSL2/3pPT1Gr0FuaZk6nsb3gzSaAaI8WR4cyJ5i
 vx/I5/30bERttqHWJPT0BBm34qc0g18=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-NNwN4vI7MGWVtHioyPUNyQ-1; Tue, 08 Jun 2021 02:35:45 -0400
X-MC-Unique: NNwN4vI7MGWVtHioyPUNyQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 t14-20020adfe44e0000b029011851efa802so8917038wrm.11
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 23:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a3g5IILuMGRwiOEvxdvGoUnwt3Fbirt9s82j/WmWJ+c=;
 b=BihxBsXq5mJfhp2owpxpHZXnb00WmCf/T6QHbBzuyJKVhSHkELrDKxGgXS0/13WgwY
 ACWzrN2DJy9uTTUFAG4/RGgaJqTRgqc/DmnxY2z9aA+KweLPOZm4+CiKvWH0kATJTp8u
 k+ZX+TYbcxygbXLYauNajAOmWt5qbAuMzdTbUIP1KsFc93Lm/k5pwumshF6GZT6ri1PH
 IlvAlWAce1M8+NG4mS4xJ0oCJvfEWwXBt82E4r2LkcxFmL5Yq2jJaukk6HbwGjZ3FgJ5
 YNPvYlnck5gqfGwJIpuoikV0Az8NyrseJ0zF5aSRvJ7a2zAn5IE9u8T1qZX60q7RPcth
 M3kw==
X-Gm-Message-State: AOAM532j+5ZsYYF47riH3aaoVyQJCQvcCRNxajKslDabMyrBeZj8zdX2
 VJfR5lIsvyfVU2T9EVLh8Q2pBOUEQKg6Qkqxly+fL1WpnPtCrrSr9Xv17XiryJGkYeCps1IvekH
 hMnmcBkvME3gbJl8=
X-Received: by 2002:adf:fc11:: with SMTP id i17mr20280154wrr.374.1623134144187; 
 Mon, 07 Jun 2021 23:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlKE6ysj5IOPD6uQn6+JQXBxV9ivWBjAm8lY3oTHSL0wbA4uP9Is7V9HkZdqrYEcCuVH+x+Q==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr20280131wrr.374.1623134143976; 
 Mon, 07 Jun 2021 23:35:43 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id x7sm20594480wre.8.2021.06.07.23.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 23:35:43 -0700 (PDT)
Subject: Re: [RFC PATCH] scripts/checkpatch: roll diff tweaking into
 checkpatch itself
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210607171829.25111-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6e4a4fed-a6b2-4e2d-b40f-5f0910bace0d@redhat.com>
Date: Tue, 8 Jun 2021 08:35:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607171829.25111-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 7:18 PM, Alex Bennée wrote:
> Rather than relying on external tweaks lets just do it inside
> checkpatch's direct commitish handling which is QEMU specific code
> anyway.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/static_checks.yml | 3 ---
>  .patchew.yml                   | 3 ---
>  scripts/checkpatch.pl          | 7 ++++++-
>  3 files changed, 6 insertions(+), 7 deletions(-)

Clever.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


