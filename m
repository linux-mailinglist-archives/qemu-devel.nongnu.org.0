Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3025E628F69
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:39:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijW-0003aa-5q; Mon, 14 Nov 2022 18:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieV-0003HL-D2
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oue61-0005lv-UF
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668450133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZ2nh9KuJMa7Bxw2hKkiuSihIV+Qi/ll9R6KeqTBHfs=;
 b=JXFCD74redn4AMgvu2DnctFDCTu4btqvVIaVYBrAEb/ukJjuz9R0sjEo1p3YZjmCM+8DCw
 Ytux+a2dhurfl1ReHgh5VX6U8NsRojHqroljILr/VN8ctG9w0n2D3eTPEg99YOeCXZUsWg
 f/FFoXxJRAlNkRsqDF4WtfDmt8iscTQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-MZqfYKocMfie0_5WYU96SQ-1; Mon, 14 Nov 2022 13:22:10 -0500
X-MC-Unique: MZqfYKocMfie0_5WYU96SQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 f20-20020a0564021e9400b00461ea0ce17cso8696359edf.16
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bZ2nh9KuJMa7Bxw2hKkiuSihIV+Qi/ll9R6KeqTBHfs=;
 b=jhbhHzJc++fd9vbWGtSoVQULsZi/rYUswjcjY7HGlM0IMvXq9gazFTOwnnkX6dHhYj
 o6aTLgahICq1mohy+eUW3J9iU4XYPlbpSGs8Ppjk1r7SoqDilw0SZZdzevYh20Y//nsa
 96WubOfSPRD5ME2NmjxgkeCXfDhyVODnuH+SunvXpE8fO4ReIUlS0dZbq3wJzrn+hpHL
 qtX5YLdy7zT7R3a17tBoJshCM/0dA/V92D4L5Pe49rDwA1MzV8o6+cP8Py3Ww91DzRR1
 mJYAOiOzPADOW6tJ/Wyt6csJ9d9zhqjj/pzAtR9jv6lEJYa762CUJS9VIq/Mzmdr6xNJ
 Yusg==
X-Gm-Message-State: ANoB5pmBnUZScHwv+2hLaEZehHqHaBW2ZFCAtGpZnY9gftQRNogRgZvP
 UO4ihjkXZX6JdwcBZHG3ylYNt8RqQTGc2Q0ZTTmadWeCegRUGbSfbbkGbN+U5xcdSaEEUBGeLC1
 tR8CRSG1z1wKk3iY=
X-Received: by 2002:aa7:ccc2:0:b0:461:bff7:9783 with SMTP id
 y2-20020aa7ccc2000000b00461bff79783mr12335559edt.200.1668450128908; 
 Mon, 14 Nov 2022 10:22:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4OxvmCtIZp/E2sjt5EfLCKXm5u2U+6z6hZWLFZ0V4Z46LmbAcPBCMbD7e6Q9fwKxAk/6iRoQ==
X-Received: by 2002:aa7:ccc2:0:b0:461:bff7:9783 with SMTP id
 y2-20020aa7ccc2000000b00461bff79783mr12335545edt.200.1668450128745; 
 Mon, 14 Nov 2022 10:22:08 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a170906315400b0077b2b0563f4sm4529576eje.173.2022.11.14.10.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 10:22:08 -0800 (PST)
Message-ID: <e0c1b4e8-2a2a-779a-60ea-7b4401721f09@redhat.com>
Date: Mon, 14 Nov 2022 19:22:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/13] block: Remove subtree drains
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-10-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-10-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 08.11.22 13:37, Kevin Wolf wrote:
> Subtree drains are not used any more. Remove them.
>
> After this, BdrvChildClass.attach/detach() don't poll any more.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/block/block-io.h         |  18 +--
>   include/block/block_int-common.h |   1 -
>   include/block/block_int-io.h     |  12 --
>   block.c                          |  20 +--
>   block/io.c                       | 121 +++-----------
>   tests/unit/test-bdrv-drain.c     | 261 ++-----------------------------
>   6 files changed, 44 insertions(+), 389 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


