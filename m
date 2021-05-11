Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5237AEE9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 20:57:28 +0200 (CEST)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgXZP-0001kt-Am
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 14:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lgXWS-0006QG-VI
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lgXWR-0004QW-3Z
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620759262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqeI3p2f70arufNAwymopge2Unl1MPzbaKMmitvVeao=;
 b=ZBJBBacXtRf8mcLsROET5DF0TPmybwzwD5+QFKc2pzwWM1sMC3WMkn+3FXqgLL2/NtQe+S
 64zDDoJVqGAb34B05Rs37XCMGDnGEdTFQXtatUjSZZcIjcpna+Ww0do+FZfPL3v5opz5O7
 2diiCyZQxe0AGnCUWn4mjI2/wtdsAhA=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-FsRfrLY4PY-v4gw1sHclXg-1; Tue, 11 May 2021 14:54:20 -0400
X-MC-Unique: FsRfrLY4PY-v4gw1sHclXg-1
Received: by mail-oi1-f197.google.com with SMTP id
 p124-20020acad8820000b029013d36f4aa65so11587977oig.18
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 11:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fqeI3p2f70arufNAwymopge2Unl1MPzbaKMmitvVeao=;
 b=eM51qI3v9Rd111D+RHU+cG/QDDZd0qRHHT9Pg85iApDSrhytg+VA9BjQ3gOO1YdEdC
 XOdIVqQdF9ys5Lf1zJXe2pZnBcHEwfJz06OZpsvUSrZPv6pjBFkoL9TyQK9lYkLZkg9h
 Yt9IPr3Yz57jya++QhWZgT3UKnYpulWwOqHdzPWDE59CcqEj48uMyCm06yIuGGfYvPjF
 zA/FrjcQFi10gZVimh23qjLOwHYG8aqAEC6tPsXZqIsLUqq4E/UPh7rJUXWl1wkilADg
 aEpZZyMU9S37YdXGuwwWyHv2Bb4wxJ3G0BhVEc0uh5MVktPpAlX+Lq2aTbwFO2RO+6Qw
 6RZA==
X-Gm-Message-State: AOAM5312AXZbbKFdQb7vHpa+BuwGyQyXpg6CVmIIHxV3zxnjkH8xdxHo
 5qrns2LF3PlnXXV4PRgM8GwNxz2AXIlDWgCnAHYllzJ7ocsp0htQx2Uit0SOuJpMbdefm+k/tP5
 xjD9rBAS6gzt8bio=
X-Received: by 2002:a05:6830:151a:: with SMTP id
 k26mr10722166otp.10.1620759259652; 
 Tue, 11 May 2021 11:54:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY2d6Gl/zLsR5nejU7OL97NiBT6eNG1HP626TRrEVKNmjWdebVC+ykjhaE5/c6mPYgECDNhg==
X-Received: by 2002:a05:6830:151a:: with SMTP id
 k26mr10722153otp.10.1620759259518; 
 Tue, 11 May 2021 11:54:19 -0700 (PDT)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 f8sm2994372oos.33.2021.05.11.11.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 11:54:19 -0700 (PDT)
Subject: Re: [PATCH 0/2] net/tap: minor fixes to interaction with the bridge
 helper
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505121236.532755-1-berrange@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <dc960526-bfe6-16ac-a9b0-8bf99a8aa4be@redhat.com>
Date: Tue, 11 May 2021 13:54:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505121236.532755-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 7:12 AM, Daniel P. Berrangé wrote:
> QEMU fails to report a good error message if the bridge helper exits
> with success code, but forgets to pass back an FD.
> 
> There is also a minor portability problem impacting FreeBSD/NetBSD
> dealing with cmsg initialization.
> 
> Daniel P. Berrangé (2):
>   net/tap: fix FreeBSD portability problem receiving TAP FD
>   net/tap: fix error reporting when bridge helper forgets to send an FD
> 
>  net/tap.c | 34 +++++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)
> 

Just a minor question on patch 2.

Otherwise, for the series:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


