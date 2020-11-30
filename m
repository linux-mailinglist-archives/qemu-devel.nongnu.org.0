Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AFC2C8505
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:24:00 +0100 (CET)
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjj9r-0004GJ-3p
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjj4x-0001uq-L4
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:18:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjj4v-0001aT-Cx
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606742332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2gSZc1FUYiNNlrRJKwujfsK6+qtRYQ0aIoD+jT371c=;
 b=RjZw+0+o3deohBMAr41eHP6fPrkuOmXkvOlTNSQSMbkq8PuOfBO7eSJHEB2zvgNlpcmynC
 1NRcuDfOcAb+XNBiXqPXE7G3dxnsLEK/5RuXmT0IZqANCdWKkG3Wc93KJgFp8E3SOpTws/
 LF2xAbMg79lU1vjPVDXv68gidwl4iXs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-DZk40i4DMg6jvYIy4VkT2Q-1; Mon, 30 Nov 2020 08:18:49 -0500
X-MC-Unique: DZk40i4DMg6jvYIy4VkT2Q-1
Received: by mail-wr1-f71.google.com with SMTP id v5so8404060wrr.0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 05:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X2gSZc1FUYiNNlrRJKwujfsK6+qtRYQ0aIoD+jT371c=;
 b=t/cku27ipbVLGvLtKNcItP4d4XxA4Z0RaT9WUq/X1F+ESf1du10A2EEKeubZaFMijd
 rl4d6KIXgyHWSoawvnVq4cevJ6SjrAWQpngnjdu+Udz1K4krv4As5RVr8CTm3yvMTlxm
 SsPeB5rDQcD3OhvSOj6z1sSGgbYHjK/grPVsVRMcG/aGFvLNeMZAmRdJ443yNEA2Brve
 4R25D7ppE1ZZQITtIXoImSKxtavFBWR+18H0SaOLtcGqP1KAskLd/4JLopc8osIrIOau
 N32qzZBPigMh+TiM2/zUqVSU/WAIQQSWG0ncmDt8JNGIzsE8W4NYQTXhaXbjmXzyLF60
 b5uQ==
X-Gm-Message-State: AOAM533qffudkZwQAuYXwDf0wTCV/ziF6YYGu1CDzB2N/2s2zH5w00zK
 ZvjK/2Lc2erbMCXegWtJ+c15LYx9TuDqh90kUEggw9nNn1wAECelDEZI/gMCNQSVBwQVr/TBldS
 17IQjptpjZhrqkIs=
X-Received: by 2002:adf:a495:: with SMTP id g21mr28062608wrb.213.1606742328586; 
 Mon, 30 Nov 2020 05:18:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzV5fa06gL9T+niLf7tp8pXQSVzX+QWJxZ2wDIiv5MObZMmUCCRqB0DXu+/if3tUBnb3iHleQ==
X-Received: by 2002:adf:a495:: with SMTP id g21mr28062583wrb.213.1606742328356; 
 Mon, 30 Nov 2020 05:18:48 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id x10sm21487292wro.0.2020.11.30.05.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 05:18:47 -0800 (PST)
Subject: Re: [PATCH] qom: eliminate identical functions
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201130123708.3442032-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a778f512-85c1-8bec-6e34-86cf182fb963@redhat.com>
Date: Mon, 30 Nov 2020 14:18:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130123708.3442032-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 1:37 PM, Paolo Bonzini wrote:
> Most property release functions in qom/object.c only free the opaque
> value.  Combine all of them into a single function.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qom/object.c | 36 +++++++-----------------------------
>  1 file changed, 7 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


