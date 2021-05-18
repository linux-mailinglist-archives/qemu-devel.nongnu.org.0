Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127533875BB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:52:51 +0200 (CEST)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwPC-0003io-32
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwLq-0005P8-PL
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:49:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwLo-0004Mi-8i
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFDNCtK5k4WVkMlo9BRhkHcNvgWpf0y8In5BGChHKj4=;
 b=HS30/jK4JVgFqVTUxBObaBCenzAXVtlGBS9cSETkLfzRssXwr0F61xj1N/nPDufXmB8xpY
 VVSokE4rKVC32fgMkmDFl+fzuTkylJ1kUsXRvBfr2AmhTd+Ucx48C1j2EDyZI/clbugWZM
 K0KeTXG1A7d+nQ5VMlBEwkn9PAwZR5I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-shwd-YCOPNyjs1waQQTiXg-1; Tue, 18 May 2021 05:49:17 -0400
X-MC-Unique: shwd-YCOPNyjs1waQQTiXg-1
Received: by mail-wm1-f69.google.com with SMTP id
 y193-20020a1c32ca0000b029014cbf30c3f2so364569wmy.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eFDNCtK5k4WVkMlo9BRhkHcNvgWpf0y8In5BGChHKj4=;
 b=e8oPIroMPlExzBk9GCBjahyfg1l/TZ6Jbk9x8Yyc0pNxpSppXKixaAerwQ+oVO7CPO
 5moGGIxtMo9HbuJHJ0tIL0tFAgifUyGICJK9XMo9uqr+vjyZzwjCxoWU/s+JPprojyDU
 ESIOw78fSLCywid4kzCzmgxu0D2wdhD74reJDW8ouTGs1PLVwqO9MZye7mcAafuwhnpx
 2VO861+Qav5fjeSFWG6msJEg6k+kHv9RQnGhDmh/Xazu8+5x8y8UEqSrrGt8FtIv8FAc
 bh2X0DPHVWeI+KiiIp5KL30bzan21aeESvln7ndNyuGEL0N7N3vryGELE1tCmn1yjTb7
 4A1Q==
X-Gm-Message-State: AOAM5336MaigwOIUqBDEIEHPr56pvGikL299hTwpNlDXgbZWAEAUvF1N
 C6d7tpIOuPc2nUDFPuzcGtprCy1pu4H7Rcf/PqaBdcx3zn825KBe6hZx6h+3OuOz3bdoPddODEu
 brLm5SWo6n5gP9yo=
X-Received: by 2002:a05:600c:19cb:: with SMTP id
 u11mr4564675wmq.185.1621331355832; 
 Tue, 18 May 2021 02:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz17CugQRc5vx6FIXZneAOZc4Qczt80Sb5aKR9T5h/Y4U2bKwsEOvHA2/Ar6Uft+3r3JCCXWQ==
X-Received: by 2002:a05:600c:19cb:: with SMTP id
 u11mr4564663wmq.185.1621331355687; 
 Tue, 18 May 2021 02:49:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d3sm21249211wri.75.2021.05.18.02.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:49:15 -0700 (PDT)
Subject: Re: [PATCH v2 28/50] target/i386: Reorder DisasContext members
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-29-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <46e48836-49a6-b82a-c3e2-0e34bc7d9a37@redhat.com>
Date: Tue, 18 May 2021 11:49:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-29-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Sort all of the single-byte members to the same area
> of the structure, eliminating 8 bytes of padding.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 27 ++++++++++++++-------------
>   1 file changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


