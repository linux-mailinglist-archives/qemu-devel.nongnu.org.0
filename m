Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD8B3EF5C2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 00:30:27 +0200 (CEST)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG7bG-0007cQ-61
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 18:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mG7a4-0006VT-U7
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:29:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mG7a2-0006fq-Ry
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629239350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yoxs9i5wCqhS96BidTmzjXSQsqL4Egz7H7XxZ1MR/zk=;
 b=N9XFr84XDuS+f06smoLx7aGu6Vh7ywrMcfGpvf//gDkO+KJkLXyx67ZgAfI/FvCgqhjsOp
 +KQCj6UtM1CaswwKmCmVX/1ivLJH6+RjwhauNlu1qnsCOEzZ80uRMHd+7k2YDUeSlRkoyS
 7S6mPk57HoOTAzFZeK6wCu31of9qlys=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-auln560aN-KVNvpmSXhRHg-1; Tue, 17 Aug 2021 18:29:06 -0400
X-MC-Unique: auln560aN-KVNvpmSXhRHg-1
Received: by mail-wm1-f71.google.com with SMTP id
 z15-20020a7bc7cf0000b02902e6a68ffd3cso182709wmk.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 15:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yoxs9i5wCqhS96BidTmzjXSQsqL4Egz7H7XxZ1MR/zk=;
 b=uZIMoqx9aGkh2HYUwtB9dH9hvZpNIT+C9nfYcqSl8LWsMTdXa639kXwjKUMOphKtOG
 bpAWvTn42ywGQwllYc3Y5Zezj/i7m1IN5KaBbDXzc0tRd2k/XBBrhDBjZgfrnjCZPUXN
 KUCefg7t6OBXzO4PgK2F5LNoT9dbQBjZtWzhCu013dnIZsh3wNGWHcvr98P+C+FlhHIm
 GLFIidxOIupnLgSYuf8E+5n2dj56i7Q83YjMEgdF5j/wgAE/xz4b6nlYSmSaVS7mgQHP
 GcK9Cr8hHS6SWDccV0ijnaxMnfm/FpfGPkVmqE39yKybIcgFoTvb0/wXxtiqtt5mHWuZ
 AFMw==
X-Gm-Message-State: AOAM532gPWCyuJZMfob1nyI6qHbFz0VXuLB3/AN43DH0xVDsxi4OXImv
 jO6M+1G8cwVCfEjFkabB7lv+elSTxWHtkctPjcyNQQBKxNe9qbuObctQHMTam9I62fLZi/Pa7Ef
 0tI5YerONLXdhmxV40ucKbpq5anpkEKY4n9nbRZmv2//anuQ9vYT7vY+j0i/XH4St
X-Received: by 2002:a5d:456d:: with SMTP id a13mr6907079wrc.364.1629239345093; 
 Tue, 17 Aug 2021 15:29:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoQ9hlQ9FgmOnyvpSQBS8+iIQrvW3ja90j+4virHrVHG+H4ty1f+bYweU7qGE5cVfodso3kA==
X-Received: by 2002:a5d:456d:: with SMTP id a13mr6907060wrc.364.1629239344791; 
 Tue, 17 Aug 2021 15:29:04 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a11sm3893609wrw.67.2021.08.17.15.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 15:29:04 -0700 (PDT)
Subject: Re: [PATCH v3] block/file-win32: add reopen handlers
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kwolf@redhat.com,
 hreitz@redhat.com, sw@weilnetz.de, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210817202115.16771-1-viktor.prutyanov@phystech.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b83aa7b2-c3c1-3c33-fcdc-27bf4f2f2117@redhat.com>
Date: Wed, 18 Aug 2021 00:29:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817202115.16771-1-viktor.prutyanov@phystech.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 10:21 PM, Viktor Prutyanov wrote:
> Make 'qemu-img commit' work on Windows.
> 
> Command 'commit' requires reopening backing file in RW mode. So,
> add reopen prepare/commit/abort handlers and change dwShareMode
> for CreateFile call in order to allow further read/write reopening.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/418
> Suggested-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  v2:
>     - fix indentation in raw_reopen_prepare
>     - free rs if raw_reopen_prepare fails
>  v3:
>     - restore suggested-by field missed in v2
> 
>  block/file-win32.c | 90 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 89 insertions(+), 1 deletion(-)

LGTM, asked Helge Konetzka for testing (on the gitlab issue).

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


