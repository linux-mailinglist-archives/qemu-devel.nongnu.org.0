Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC4D387553
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:40:17 +0200 (CEST)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwD1-0007z1-AD
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livqf-00073t-HF
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:17:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livqd-00020h-AN
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNVoRu6XvLlOwkAq8LGOXHD3uqayQ1YbbrjC8pZEtdQ=;
 b=IHryQQCko/FbKvVLTsJ0yzION6nIRvXk5e4At3EoCPqJjoJQoo4TkT74gbgnIHGxG9qWN0
 KHpDhd9iNWxFrpNw+jFx/kQq8nIWDIWauvc4SlsK952cIDugvL5WiD27RUXqbyFm+AG6QE
 /gcXMM7MmBD9F6KSolI8fwaPiGCDlPU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-epYgnEEuNR-FGobtrBCChQ-1; Tue, 18 May 2021 05:17:04 -0400
X-MC-Unique: epYgnEEuNR-FGobtrBCChQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 d4-20020aa7ce040000b029038d1d0524d0so4649098edv.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MNVoRu6XvLlOwkAq8LGOXHD3uqayQ1YbbrjC8pZEtdQ=;
 b=JyWJ6SEUDMbNR9Doxk8Vxmbq86ExWt1jV4+e2ujhNcOcYb+PVTe+UvkPikGY5s14yX
 co76T4czDO7VsvAGN7t6HTg58ijYQC+YJtgKCIx0jSoKus0trw68jWx+exzUN73P/BiD
 xBfh+VTk8hepc+PDb7n7sMtV3ht1MrswNtIB+Cz2IoKhDNvKL5eoWU00UAsMdeYfReq3
 eeLMoSuFiSTaMzJcwkO5RDJyViSGA7aKH+FPKPZYe1GhbT+V/IsdbHYQa6i4qYBMcASS
 9sVxl1MhYx/ha7j+xhY3+/FDlewmoU1R21Il0DUNwKnUR7Wy7ihotVNeHAkefQZ3NUti
 gXnQ==
X-Gm-Message-State: AOAM533mxfUDbJUscbCX0EJYjlzUueieUnnGa7AFicRnQYDgv41ws6g7
 VllE0WXX71oEUr4VeET79d02syA+DcTmhHCQFbig5JE9/pH9fM3qieC4PLPZDFn6zElrxbXJE4F
 KKitFmzpdv/5Ofg0=
X-Received: by 2002:aa7:c84a:: with SMTP id g10mr5755378edt.326.1621329423468; 
 Tue, 18 May 2021 02:17:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcXYb8MB3ueZxgX4QmfEKayilRqh9+AaOCHDwCUNzmho+2SX7KvgEg6GcAM1zBRw6ufLiLvA==
X-Received: by 2002:aa7:c84a:: with SMTP id g10mr5755362edt.326.1621329423299; 
 Tue, 18 May 2021 02:17:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gn31sm9764164ejc.124.2021.05.18.02.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:17:02 -0700 (PDT)
Subject: Re: [PATCH v2 07/50] target/i386: Assert CPL is 3 for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-8-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e6f1a645-d630-11cd-cfd6-a02287f3206e@redhat.com>
Date: Tue, 18 May 2021 11:17:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-8-richard.henderson@linaro.org>
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

On 14/05/21 17:12, Richard Henderson wrote:
> A user-mode executable always runs in ring 3.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


