Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC9B25E804
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 15:45:41 +0200 (CEST)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEYVf-0005Ql-LI
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 09:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEYUh-0004vD-FP
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 09:44:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38394
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEYUf-00083s-S1
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 09:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599313476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4gJJYdug+rv5vIsOREdW1LRtrO72zrc86SNT7twxwzc=;
 b=X4drUOt1qFi+qZXcR4tktBbfedpKUjBiinVzThnNwPCFhq5FqK0JuDqoNeVPrFJjLgSK38
 lzoiiTfcUJh0cxQGgvBa51HlEnI+s/gj52y5xzvUktJfDQLH05UXdVUOgsXYhccOsSJlHZ
 ba+q1tzyt+91xuigvvANAegKE1HGsLY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-44q9VgmQOUiPD4canGOzHg-1; Sat, 05 Sep 2020 09:44:32 -0400
X-MC-Unique: 44q9VgmQOUiPD4canGOzHg-1
Received: by mail-wm1-f72.google.com with SMTP id x6so3113578wmb.6
 for <qemu-devel@nongnu.org>; Sat, 05 Sep 2020 06:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4gJJYdug+rv5vIsOREdW1LRtrO72zrc86SNT7twxwzc=;
 b=KfyH0YSVKwNUE8PCIT63afBPzOW7C+iA4/Nzy/7/4O+KanuVmQ+Z2jSBC/hPgqcB+r
 Weo2gyziUNmL3UAQ2FBOI5hNXmoPaRLtld3r0l/NjXKRffGPju1T31837Tu4kqvntJrH
 J2AefItzB1KV5ByLTerlokxy1D7MqEmFtYAf+OifXxrPOwjE3PvPV6nwW162dIanSors
 Rjbgi9x01qWe5K/avnBS2ziB3c2KARHFuRiSS+Y8T7uuCxXcuXbggCLM+Ldq4epZd/H1
 Te+/HTjh6OP5s5VJYqnxpAw2ewk+cdKkDwxNzkFMVklfrps/gmtQTdvsm/+FTlOIy1+4
 Seyg==
X-Gm-Message-State: AOAM532h+jYGQuynbwJ34oZBrc5PfU4PbMtxE9BId1gaNMn48aBL+Djf
 +Kz/xoaUU0o31pBDMbWS6MvLeVEaHGl7EmWar7ayw0fp8y+WKib/q3Jah+iKbEgcjPJONrKEywf
 VCNlnJQbCZi+Wo3g=
X-Received: by 2002:adf:a18c:: with SMTP id u12mr12956365wru.90.1599313471715; 
 Sat, 05 Sep 2020 06:44:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhpEzYvPAmPSdAK4dW5mWYyecUr8zpRAyXwWG9ySZJnL19A0Je+4BlY/OG48uSkN0+uOeWdg==
X-Received: by 2002:adf:a18c:: with SMTP id u12mr12956340wru.90.1599313471450; 
 Sat, 05 Sep 2020 06:44:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7e68:30ed:f9ac:3d14?
 ([2001:b07:6468:f312:7e68:30ed:f9ac:3d14])
 by smtp.gmail.com with ESMTPSA id f14sm18450189wrv.72.2020.09.05.06.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 06:44:30 -0700 (PDT)
Subject: Re: [PATCH v5 04/11] meson: upgrade meson for execute custom
 ninjatool under msys2 properly
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20200905062333.1087-1-luoyonggang@gmail.com>
 <20200905062333.1087-5-luoyonggang@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2a9e7f91-9c06-3117-dbf7-952d7da55320@redhat.com>
Date: Sat, 5 Sep 2020 15:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200905062333.1087-5-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/05 09:44:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/09/20 08:23, Yonggang Luo wrote:
> The ninja options now have no need anymore.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  meson | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson b/meson
> index 68ed748f84..492afe50a4 160000
> --- a/meson
> +++ b/meson
> @@ -1 +1 @@
> -Subproject commit 68ed748f84f14c2d4e62dcbd123816e5898eb04c
> +Subproject commit 492afe50a439d70df99d6e3e59572aff55e14c6b
> 

Sorry, we cannot use a random commit.  We need a release so that we can
in parallel update the version check in the configure script.

Paolo


