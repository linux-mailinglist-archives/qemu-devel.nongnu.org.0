Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BF2D631F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:10:40 +0100 (CET)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPSh-0003Qq-HH
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knPEe-0000U0-QO
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:56:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knPEd-0006qs-6N
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607619365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bjzoX5J7S98ON+2lymCeYEQg0wKnou6ZkfCwEFYP7pw=;
 b=cLx5cmya908bFP3yHB8cX5pm2fC01Z/Q+/VYPmVdGwqXMV3+tbwyz/RLjHMz+0jp+MT4/V
 VVrOSGaEZymHKDVXtilN+dx7uS0SsmteVsAP26E12dBXFD8oSI7/dik4FMBnSXtmbZkPSt
 zjgHKTOM3E6lTRjdCMGv8+SlHDgWjjs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242--3rhDba4MOWFAklybJaR_Q-1; Thu, 10 Dec 2020 11:56:04 -0500
X-MC-Unique: -3rhDba4MOWFAklybJaR_Q-1
Received: by mail-ed1-f71.google.com with SMTP id bo22so2686210edb.15
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bjzoX5J7S98ON+2lymCeYEQg0wKnou6ZkfCwEFYP7pw=;
 b=EU0nXuN3x6d2E2qp/FNmHd4zzA4gqq5ajwVjisDXAuJtnHyJLqpEUYtSYOCRqSH0yN
 r1v+++T5JPfnLdPVzfGLquPOaf4kq2uAFOATuwMTXzOwfzt3p94TDBHuwQOuW8p6Z9Xk
 3z5GPdzwRF8JNxo+OhBSA6xmeZFiP/Xh4rzFtBbbWbYioreKPSF/ITbXk86higLHl9ed
 q49WT+E2pvKZhh/LtHjDZNKdEkkViwhS3v3iZyl6MIXFgFC4iJSZhJKThw8JJR0sTGKz
 QwkNWZUcNTxhg0tc7qV+/lGAECyy71kD5Lbvv7xrJqQKS5IPcg6PjtSInIzcvPeF7Xv4
 V0Xg==
X-Gm-Message-State: AOAM5306WPnlJqO4CKNpC/u+WZfviJZJN487Z0Y4NnBO/jDw5KMtup4C
 M1QT6QlQDOjPjLciCEO6TlOPC87XDsSknKm0g4cfzQ0jqmsMdcAchH6cG6BuRV6RB1RrM4IN+WN
 lMJ0INJ7Nf8A9kyk=
X-Received: by 2002:a17:906:27d1:: with SMTP id
 k17mr7442224ejc.325.1607619362704; 
 Thu, 10 Dec 2020 08:56:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxc+ZzPMzPiWbyvEGJy7XP2Ac3rdKbKCP2bdBtcXDJt9Wk9BtrJJYHs3y9l5FyAV3kJ+Be0LQ==
X-Received: by 2002:a17:906:27d1:: with SMTP id
 k17mr7442207ejc.325.1607619362481; 
 Thu, 10 Dec 2020 08:56:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id cc8sm5787871edb.17.2020.12.10.08.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 08:56:01 -0800 (PST)
Subject: Re: [PATCH 0/4] Remove deprecated CLI parameters
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201210155808.233895-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f4e2e5d3-336c-b5fd-9ffe-39fa475ff994@redhat.com>
Date: Thu, 10 Dec 2020 17:56:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210155808.233895-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, kraxel@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 16:58, Thomas Huth wrote:
> Remove some simple CLI parameters that have been deprecated since
> at least two releass already.
> 
> Philippe Mathieu-Daudé (1):
>    accel/tcg: Remove deprecated '-tb-size' option
> 
> Thomas Huth (3):
>    docs/system: Move the list of removed features to a separate file
>    Remove the deprecated -realtime option
>    Remove the deprecated -show-cursor option
> 
>   accel/tcg/translate-all.c           |   2 +-
>   docs/system/deprecated.rst          | 246 ----------------------------
>   docs/system/removed-features.rst    | 243 +++++++++++++++++++++++++++
>   qemu-options.hx                     |  29 +---
>   softmmu/vl.c                        |  45 +----
>   tests/migration/guestperf/engine.py |   2 +-
>   6 files changed, 247 insertions(+), 320 deletions(-)
>   create mode 100644 docs/system/removed-features.rst
> 

Queued, thanks.

paolo


