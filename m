Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F02ECE81
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:18:37 +0100 (CET)
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTJM-00012H-Pz
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxTHn-0008PZ-Bs
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:16:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxTHl-0006mH-M5
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610018217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GcKJtxosZjXHRTmmrVkct0SbQjB/VQbFnNrJSQlN5zA=;
 b=EqMEhsWf+SEOwyZrlEVGOi/PYpQ7rvk3vpGIVCBD6LgFnRUcE9NhNsjMy5rdfffR0JZZiR
 JRFfbgGCOpr3LZHVGjNr30MzanCSY8wmO9ktlXjFR03Q6gsU01afmWtuO3VMJVKdV2wIou
 r2fm1F3lvSNUj1iZ2lIY+zbVpqRYBhA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-S8wsEf7oOv2HpZwv9erGqQ-1; Thu, 07 Jan 2021 06:16:55 -0500
X-MC-Unique: S8wsEf7oOv2HpZwv9erGqQ-1
Received: by mail-wr1-f72.google.com with SMTP id g16so2545537wrv.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 03:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GcKJtxosZjXHRTmmrVkct0SbQjB/VQbFnNrJSQlN5zA=;
 b=O792y7XLtwCrNsNt0R1ELTyB2DF9jec9yJl8fA4R8so5IBZhkPnJc6F7CazST1Ynl4
 i18fB5tMUecuv57Bo8ve3U2+CTTjuzgk4mO34eHta3uBnUp04FUpSr65iBOfQcM3Gkgi
 8XlUAc8cNXkwkb5OE1vllMdLCEc6fO/upFdn19XNSoqd5l8bTuFHBZz3G3m6oMq/MyAR
 zwLHwO3qnGsWIJWub9eHUxaxKRLnE2OiQ28JTJRaKjtoPPiNKOMCOd/7c6MvahxV6cLI
 S1Jp4qNE6WTF5awIu+cMF1/C91GIYd+hVGgjzBbD+Xk3jznY9EyK+pTTx97VWdQfKBjc
 r/ng==
X-Gm-Message-State: AOAM530IoBKtca/xKmY1n3ZZemyna4DOjx6y4uLgJOaQSY8tq+jpKhhk
 wX3YzvYW2ef6/cx1FCkd0Ak3sx04WkZWO7+JNxO5WKPRsb1mbnx9PqPQii5lsKSrYeZ99Tovh4h
 TZ2luVF1UnfLQcHA=
X-Received: by 2002:adf:e84c:: with SMTP id d12mr8942425wrn.382.1610018214310; 
 Thu, 07 Jan 2021 03:16:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2yAQpAAl5j5b8jSBlT2jDM3mgoE+YqIS4NhX1jbZCpdmDQpHpMRHqjtBYKTxInbAHXy2Big==
X-Received: by 2002:adf:e84c:: with SMTP id d12mr8942411wrn.382.1610018214208; 
 Thu, 07 Jan 2021 03:16:54 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id 189sm7398897wma.22.2021.01.07.03.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 03:16:53 -0800 (PST)
Subject: Re: [PATCH v4 1/5] cirrus/msys2: Exit powershell with $LastExitCode
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20210107101919.80-1-luoyonggang@gmail.com>
 <20210107101919.80-2-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2a4db26a-29b2-0ed7-eb62-6221a086a06f@redhat.com>
Date: Thu, 7 Jan 2021 12:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107101919.80-2-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 11:19 AM, Yonggang Luo wrote:
> Currently if we don't exit with $LastExitCode manually,
> the cirrus would not report the build/testing failure.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>

Please keep tag from reviewers when sending new versions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  .cirrus.yml | 2 ++
>  1 file changed, 2 insertions(+)


