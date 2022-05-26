Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6F534CB8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:45:52 +0200 (CEST)
Received: from localhost ([::1]:53348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuA3z-0003nW-5O
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nuA0U-0001X7-Bv
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:42:16 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nuA0S-0004yc-IO
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:42:13 -0400
Received: by mail-ej1-x635.google.com with SMTP id f21so1874181ejh.11
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 02:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S4xpIZ6vPCHIfUqSm9g8i7c8oWDcfiD3LfoNic7ZT78=;
 b=nqQqnJXmFcyT3eerGueS/upc5pUBlRm3hKquW63yQsb2fmzR0R36W6ykG+XC84o3yk
 yQhQcLmlz78suKCkrahP7yWNH3dtB4IdbSPzPqBPD2/4zCVNn03ZB78X7X8BgxkhFq/G
 C8rwlvRkaE/x+qTY7BQuTkf1ZUwPTPOalMn0FPhLfqnF0/Jtau0iQ6s9mcIlBJHF9jzD
 EQers4xVVyTcNpIay9JEqRxrJkTdoDdFAaIZhSJmYAkJEehE0zestGitQ48/TDp3FfQJ
 qaPqTLCH+c4BL6diwAe44vpBli+BLr2ImwUwuDuHn3u0whc+TPlcuo4B+hMXdzMIMo4L
 Rvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S4xpIZ6vPCHIfUqSm9g8i7c8oWDcfiD3LfoNic7ZT78=;
 b=32tdP9u5C3dRz7QViTdoBOJjZ3/XzblLCy3k6zf60ao0MhuGAeJRo67gqFo+jTSv7F
 72I3XX5jn4g+kIA2dQqykUDwfE6S9MBIZhOSGJQb9+YtqdqsMZl4LgbZ2rJ64E8kS96W
 Vh2t+poDVNVAgBPaM4zLrv//wK0flK3UvPdQKIQ73VNhMumbXSgJrFtlwh5IhXqpGt+q
 A/GRsxdlI8IUFd3pmke7YrF4U1Y4tYEpMQ+428v3c5tP3RdyF9l7hmYHun01VwtfhyIK
 VnLqa8gXObhZ6CO3T1F8CVqAQidI93+x/+AYezMrDPyISLlPjfZBSfzMzUGPN6NZwhm+
 Gqmw==
X-Gm-Message-State: AOAM533RwPtwsfbIjeVDyssBe+25NMnUr3FyZWIy+3OUvOGut0n/uEYW
 HJgH4XCyxqsHz7/woY9XelI=
X-Google-Smtp-Source: ABdhPJwMySB7I0rO215KS/R8zy1itcqoXhEFGVleSBqISx9i9SC+yOldBNd+4v/wU5Pm3hbFcNzqUA==
X-Received: by 2002:a17:906:5204:b0:6fe:902a:da93 with SMTP id
 g4-20020a170906520400b006fe902ada93mr35211624ejm.155.1653558131102; 
 Thu, 26 May 2022 02:42:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 q14-20020a170906144e00b006feb047502bsm352758ejc.151.2022.05.26.02.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 02:42:10 -0700 (PDT)
Message-ID: <b8e12320-82ee-fefa-02d8-7d3371112df8@redhat.com>
Date: Thu, 26 May 2022 11:42:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 0/9] Record/replay refactoring and stuff
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, crosa@redhat.com, f4bug@amsat.org
References: <165355470196.533615.1219754093587154582.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <165355470196.533615.1219754093587154582.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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

On 5/26/22 10:45, Pavel Dovgalyuk wrote:
> The following series includes the following record/replay-related changes:
> - simplified async event processing
> - updated record/replay documentation, which was also converted to rst
> - avocado tests for record/replay of Linux for x86_64 and Aarch64
> - some bugfixes
> 
> v3 changes:
>   - rebased to master
> 
> v2 changes:
>   - rebased to master
>   - fixed some issues found by Richard Henderson

ACK except for patch 2 (the suggestion in the reply to patch 4 can be 
ignored or done separately).

Paolo

