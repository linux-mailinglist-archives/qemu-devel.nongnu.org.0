Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF083876A6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:36:41 +0200 (CEST)
Received: from localhost ([::1]:55400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix5c-0001lT-Kp
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwYK-0000LQ-7Z
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:02:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwYF-00044L-Ud
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1CQlV1mAtfS/9SXIKDM+IwewUqjdmp8YBgzTGdnCKE=;
 b=QtPFrMLcl2CyZwlYewpbH/GNRu04S0kU0zLhsJDzNPC6M845IhT/6lMDa0UHOpa2Isha1+
 6TGkaACckfHS4uSJKprdYyqmbcSa7tw2I5a4+obrKut5xvaID5kOx5yHEMob7eSqHyCuPN
 Ssoy75cJADR23QsLRP5m/S22VRS+tCU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-7JDMRtDXO_Simq0QU32Jjg-1; Tue, 18 May 2021 06:01:30 -0400
X-MC-Unique: 7JDMRtDXO_Simq0QU32Jjg-1
Received: by mail-ed1-f70.google.com with SMTP id
 u14-20020a05640207ceb029038d4bfbf3a6so1897067edy.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z1CQlV1mAtfS/9SXIKDM+IwewUqjdmp8YBgzTGdnCKE=;
 b=LuytEPw0wHPB6kUGD9sE4824ajsyTmyKcsRElS7Zkv5CClcUihtNQh2PB++7wbpsAG
 7JjNC1YXHHJWLvpWJh7oCD+PrerLoc7I0FOoAiCrUxwTM8SRyByIN8gTBYBuyzEZ6BRL
 hpWjqliHu64JYQYEfhO78iLf49pZAyGp/WPhKXjLACHJ8NqLg0ux2flm533fK3BelIgr
 QpZ6RkkNS/VT+E6cfIR2ODathlYE9ZbNmarLwtbbuvAvsSAekyTg4epSfMcjGVPJT9YT
 1FH8DWy3YLggvM5J0dKRBDo3xrjaKhyLg/oKiQ4qxAv/kitgnyhLCfDD3T4+Ac+ZULrU
 fKnw==
X-Gm-Message-State: AOAM5316Ka2YSMyHgPpbaHAMCoNi5OxTeVivyYQPB/ptWbahxQfUAFx2
 Ni5vH+PAnh3WumswPDrkT86mzTkYeY8czTB5T1d2NPEDD33Ib54C5fiO5ghe1xTqQNWyhPEHSh+
 X9eS3gI8Lzvzeb+s=
X-Received: by 2002:a05:6402:1d18:: with SMTP id
 dg24mr5949793edb.369.1621332089344; 
 Tue, 18 May 2021 03:01:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpy0BzHYThCVsUkA/f6lJQUMZg64WOfRKnb9LGUuayAgKozhxAu90EXivSzoP3IjpoIURQLQ==
X-Received: by 2002:a05:6402:1d18:: with SMTP id
 dg24mr5949773edb.369.1621332089138; 
 Tue, 18 May 2021 03:01:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z9sm12303627edb.51.2021.05.18.03.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:01:28 -0700 (PDT)
Subject: Re: [PATCH v2 43/50] target/i386: Inline user
 cpu_svm_check_intercept_param
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-44-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ad98deb6-54a8-0c27-77e7-d3629ad405d2@redhat.com>
Date: Tue, 18 May 2021 12:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-44-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
> The user-version is a no-op.  This lets us completely
> remove tcg/user/svm_stubs.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/cpu.h                |  8 ++++++++
>   target/i386/tcg/user/svm_stubs.c | 28 ----------------------------
>   target/i386/tcg/user/meson.build |  1 -
>   3 files changed, 8 insertions(+), 29 deletions(-)
>   delete mode 100644 target/i386/tcg/user/svm_stubs.c

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


