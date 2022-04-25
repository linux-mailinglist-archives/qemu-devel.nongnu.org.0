Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C40550DE35
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:51:01 +0200 (CEST)
Received: from localhost ([::1]:58734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwJ2-0000EB-90
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nivia-0006VD-7b
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1niviY-0002UU-MW
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650881596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isS09XiZpfF8/Gg3ZLoV1WlwaK6tdx7qWiFgCRiDXWM=;
 b=Xn4Ju3RYdbTq/hHkBgBDNqfi7ytN9aX43S8K5SpCTp03NN/phC4njYOWf6m9BrX4MA7uHw
 e5UL3sOIdAvHX1NkxIKkiwrxwjXwxl+gIyDYcO+ZVRclnJA4k+EjN4ullu5CfnH50EZydR
 w38bGvbV8bFnF8LuEvHIu3JvPrGIDhE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-2mVWMxISMh6nLO04WEcdWg-1; Mon, 25 Apr 2022 06:13:15 -0400
X-MC-Unique: 2mVWMxISMh6nLO04WEcdWg-1
Received: by mail-ed1-f70.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso8101362edt.20
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 03:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=isS09XiZpfF8/Gg3ZLoV1WlwaK6tdx7qWiFgCRiDXWM=;
 b=gq3dEGM5CkrZ786uSupFNUzkCtLJG5MgMnhPaOvBQwjPWf2IJ3JV3DsvToMU2DaDov
 Y5jzzmLNLcg0nuoNFdn3DfXlbeBQacyhDB45tnnlgo3ISuUT6ijBrbk0rfHefZevbFjK
 rjkuUXv5wdD/Rigapj6I2NEvnHmEiqALSEHSYWT4MltwgI6ciyY1jNo4IFvvGe1PMgMQ
 BsIxppPbhnyvmCmr4gq+lHWkCJMGEui+b7tnEWXKiB1BOV5b7KhhLl/Ln2T0YOHSS4qf
 Qn4q3KiDiRcaNjKqiQamz6rxhlyKzPgLthmAaI9kwxwtNQZGeueVa2RYVSedpG8YJeE1
 1GGw==
X-Gm-Message-State: AOAM5328YGNS71kOgEgu9znrzA6B7bBE2C38utyexBNAjexlW26MnF09
 GglXJ0fVNQUv/d2TQ+XQgPn/PtqDjzLAa9Yy/HiXFdwn7mJLW8R3gcCtITEojqXh8uq+ouCDecr
 vlDfTZ1ZsFvle+9Q=
X-Received: by 2002:aa7:df0a:0:b0:425:d4bf:539 with SMTP id
 c10-20020aa7df0a000000b00425d4bf0539mr10379255edy.24.1650881594564; 
 Mon, 25 Apr 2022 03:13:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSUTw5W4Xu3RubQZLKfEwmEetW+hghCqvbVw0lm4Dh48cGRVXIDNSSm2czQ5dLPyXwiTuBLA==
X-Received: by 2002:aa7:df0a:0:b0:425:d4bf:539 with SMTP id
 c10-20020aa7df0a000000b00425d4bf0539mr10379218edy.24.1650881594217; 
 Mon, 25 Apr 2022 03:13:14 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a17090606c200b006a728f4a9bcsm3508392ejb.148.2022.04.25.03.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 03:13:13 -0700 (PDT)
Message-ID: <18aa397c-23a9-ea1b-03a6-8e439b9d2f6b@redhat.com>
Date: Mon, 25 Apr 2022 12:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 for 7.1 1/1] block: add 'force' parameter to
 'blockdev-change-medium' command
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20220412221846.280723-1-den@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220412221846.280723-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.04.22 00:18, Denis V. Lunev wrote:
> 'blockdev-change-medium' is a convinient wrapper for the following
> sequence of commands:
>   * blockdev-open-tray
>   * blockdev-remove-medium
>   * blockdev-insert-medium
>   * blockdev-close-tray
> and should be used f.e. to change ISO image inside the CD-ROM tray.
> Though the guest could lock the tray and some linux guests like
> CentOS 8.5 actually does that. In this case the execution if this
> command results in the error like the following:
>    Device 'scsi0-0-1-0' is locked and force was not specified,
>    wait for tray to open and try again.
>
> This situation is could be resolved 'blockdev-open-tray' by passing
> flag 'force' inside. Thus is seems reasonable to add the same
> capability for 'blockdev-change-medium' too.
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> Acked-by: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Eric Blake <eblake@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> ---
>   block/qapi-sysemu.c |  3 ++-
>   hmp-commands.hx     | 11 +++++++----
>   monitor/hmp-cmds.c  |  4 +++-
>   qapi/block.json     |  6 ++++++
>   ui/cocoa.m          |  1 +
>   5 files changed, 19 insertions(+), 6 deletions(-)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block


