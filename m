Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391BC2ECE7F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:18:02 +0100 (CET)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTIm-0000Ev-Vo
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxTGs-0007gj-SA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxTGp-0006Kv-Ku
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610018157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8LfCmhioXUD9tNW9Cf3qAXgBp3PZcoqgoono4Ad0K4=;
 b=Hzn3BiNgOtWCmM7nP/PgZfjwiEgJBqRbd69Lbox9r+Ec7JhRF+Na/eIx36isQyxfpyr2hb
 uv76vMKqZ4TOQlW1YMB5oA4iYYC8zTzvgnFLc83BEBIO+8OlUZg3kV9Gt+8OmvZsxcN6gZ
 6spbTT76I8XYpaU0F/ogcbt2LEjS+eg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-q8Rw-BVvPgusEYQwmrFzmw-1; Thu, 07 Jan 2021 06:15:56 -0500
X-MC-Unique: q8Rw-BVvPgusEYQwmrFzmw-1
Received: by mail-wr1-f71.google.com with SMTP id v5so2527560wrr.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 03:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e8LfCmhioXUD9tNW9Cf3qAXgBp3PZcoqgoono4Ad0K4=;
 b=cWzh+uexn9EIF0ZXJvhh1tphEVy35J9n/pRVybOWlISLQrI1bBXlJBwrBchOqRoK8t
 EoRmf3ZYYFyPpUu8XkRIVbQxC++HSPElradqmGxAFvGbXolmIQ83TUbWzgYLFkIXgSHT
 K1PSFMwfZpDlrUdVNprubs4LBkReTTF9HBEfV+ENggGBTk8FOOvMyej+PiNvoj7V3+pf
 OuCvf9D8NwZUhSWYCgiBXfYPtw2eBfHxgUKyxLnSnT63A0etY0/nemGMoK46cnR1zsqC
 hLKRnujGefMncXqasrpE5pkVO+Nzw8mNlXZ/T3Ksw4La+DK5dmbvE+mroCoSI4qk7RU0
 292A==
X-Gm-Message-State: AOAM531nYXNuQZeDFs1PWz3Yhv3IJwiRH8iLGKeXny+CanVZVALUL2Fa
 3HTKWm9N1mnFVZfE1lzRy//Wx0dI++nnPr2AZwvEW4/B0QKGOyvMfShZyg8FrP98sAXdyOATDBA
 qkopNhNKLLwAj5Lo=
X-Received: by 2002:a5d:4243:: with SMTP id s3mr8443120wrr.31.1610018154788;
 Thu, 07 Jan 2021 03:15:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuSpKQ6+34J5I6qkWzfKGtSOoE2r5bDk/0PKIuM4+zVnBtO6tY4341c/2/6ANBRJedEpzYYQ==
X-Received: by 2002:a5d:4243:: with SMTP id s3mr8443108wrr.31.1610018154630;
 Thu, 07 Jan 2021 03:15:54 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id a13sm7423261wrt.96.2021.01.07.03.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 03:15:53 -0800 (PST)
Subject: Re: [PATCH 2/2] whpx: move internal definitions to whpx-internal.h
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201219090637.1700900-1-pbonzini@redhat.com>
 <20201219090637.1700900-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bc5a8d34-4598-291e-4836-c225da185cdd@redhat.com>
Date: Thu, 7 Jan 2021 12:15:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201219090637.1700900-3-pbonzini@redhat.com>
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/20 10:06 AM, Paolo Bonzini wrote:
> Only leave the external interface in sysemu/whpx.h.  whpx_apic_in_platform
> is moved to a .c file because it needs whpx_state.
> 
> Reported-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/sysemu/whpx.h            | 22 +---------------------
>  target/i386/whpx/whpx-all.c      |  4 ++++
>  target/i386/whpx/whpx-internal.h | 18 ++++++++++++++++++
>  3 files changed, 23 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


