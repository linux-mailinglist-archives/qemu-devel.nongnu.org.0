Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9383F7786
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:37:31 +0200 (CEST)
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIu1y-00043g-79
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIu0r-0003EW-93
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 10:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIu0o-0004cD-CM
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 10:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629902176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpIWdKvEv/5y1gxyhAAq/8mMwN9F1cpQqDt/RRYd+ok=;
 b=d4liIzz4fz96BGx/dkNQxCHqqSeU5y536r5liCb+vVDqMF8YEKKgRLGMw+fwZi7BtcMD/4
 Q9WN+tvz+uCkB1sslQFBUfCs96vTBxxUJll5S0CMHrAMhGeWh4urOiMCe86mKu/ZXSJMIE
 t3aVOrjx4qfg2cGTQIYYKvHHI0yAvbY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-FRHQKOTxO9Kj82pGRj2hZQ-1; Wed, 25 Aug 2021 10:36:14 -0400
X-MC-Unique: FRHQKOTxO9Kj82pGRj2hZQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so1872770wmp.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EpIWdKvEv/5y1gxyhAAq/8mMwN9F1cpQqDt/RRYd+ok=;
 b=crE3jI8Gh/sl0wi7HDNd5UAjvpowSjHW2VjnsnFpJwDIYiF41u5SvcezOsu7xKG8kR
 yPBctxpAgcd+yrZjqRDQNHaoR2Ci0mN2B+vvQgIVq6dYAjLNroio1K5BFsnPbsTG/j9t
 GWgqlvlywt2j8ZUWEImuai5w8Y+ofNdXDzeH6fHXbhWI/zJctv4Z7754B8cKrezdkzOI
 WqufZ2QRmu1/CWvOozOxq8w4on/gsgWas90EXRl7OkNL+BdCGMpIuKnr05MDz7hEUMb6
 99vXtiYxbLOlQIQqpPN6a56fGQci8mcy9ZWRZ6HBALHCSphwMnIS+aXYFDSxqD3NZD0D
 0t3Q==
X-Gm-Message-State: AOAM533TdUI89PgXhKTzvkPbtU7vAfYPk4Gs78xG6Yrzn5sO2zPbBiLv
 cWVX8ZkmiowJJxjUfoOQ7AiQuZeMlIrIy81WwW0tPUdmGLe3anFtX/4efFs9jrGzi3hrzfM4JgD
 FxxKhSOdaqC0oWdM=
X-Received: by 2002:adf:82a8:: with SMTP id 37mr3917378wrc.123.1629902172313; 
 Wed, 25 Aug 2021 07:36:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1tIv6ZYNVy5MZ1Nu4o7o6He6sp1kMm9G1Rlq7nuTuqmWI7qXDR0WZ/CXMSwJOUYWC0ylkBg==
X-Received: by 2002:adf:82a8:: with SMTP id 37mr3917343wrc.123.1629902172019; 
 Wed, 25 Aug 2021 07:36:12 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z17sm116941wrh.4.2021.08.25.07.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 07:36:11 -0700 (PDT)
Subject: Re: [PATCH] scripts: Remove the "show-fixed-bugs.sh" file
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210825142143.142037-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0653e552-8939-f947-0fbb-1394ec61de30@redhat.com>
Date: Wed, 25 Aug 2021 16:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825142143.142037-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.24, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 4:21 PM, Thomas Huth wrote:
> Since we are not using Launchpad anymore, there is no more need for
> this script.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/show-fixed-bugs.sh | 91 --------------------------------------
>  1 file changed, 91 deletions(-)
>  delete mode 100755 scripts/show-fixed-bugs.sh

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


