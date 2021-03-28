Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5D234BD61
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:56:22 +0200 (CEST)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYhv-0002md-4D
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYgm-0002FP-UL
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:55:00 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:38801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYgk-0003IL-LB
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:55:00 -0400
Received: by mail-oi1-x22a.google.com with SMTP id f9so10928127oiw.5
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=swvaH3QHrvC0dkSzB9/+UaksFqtAiMrOv1CmYnp6+Ok=;
 b=oP7eZUfTCunuzGJtjCxFV/z+WEXxBDa7VBddtGg7V3aYQ6/zuZPfRKitAZSYjE0sTN
 gKMqOTA5JaZ6g1z8Ux7zifbl/kim8SW8CrVJBjc52tpJirZbZnwW8TDIaG4pTVyqNzo+
 StJRAlO/uaTzO9lsLESLCY/dTrLrpaqkya2YvOnHiQnYbP2zOBh7p+TWSyk/DlCcFYFJ
 ZgHu/GnoGgBQWd2bjpcqf9tZD5arXHqk6IxvX1/gDcwR0m1/Ueovp6YZVV8aPW41e48i
 aiaIsbkgyaCesXyffpb/Ev3VUaL4LfEJ78mLi9ojLP7JdvihLG3N1hDQ8x/bFIVeSt5f
 4e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=swvaH3QHrvC0dkSzB9/+UaksFqtAiMrOv1CmYnp6+Ok=;
 b=GJTIh0Ix8qR+4imt0jmA33gckQ3UV3CKVzt6qpeE9YPmdfGDZ2TGQBi0iCRndQ2ppr
 vkbZ22XSe+BwAT7Z0TLtGN9L6pldrlZtzCcbDFfXScpr2hgAk1Kq4c+YvtUSFYdHYPVT
 waQs9mTF35zubtZd5olMZSo0wZu4VrEl8DOdNtEDqIMnbcdAsE78TW57SlEIz4Mutzaq
 Uo/lO68ezrVqN8SLIvMZ6ci5xgkvogtt8skF/938RZW6dV7AsQG9Gq5EUJY07pre1Klm
 EXRQTtrou4rHhxe3zMYI62/AH4brJ8FCdrb2axm8PB6RdoeM9m+gNBRAvqIkYvWqcj0B
 ttQQ==
X-Gm-Message-State: AOAM533htehkVUOWnIoVzfIv4uxLrQTYwhVzBUuggq1HdDRxgW15peyK
 mBPvgdt0A3HRVLQLWTDu2j8oAg==
X-Google-Smtp-Source: ABdhPJxGVaVWAS8mOEikU4ilr4UzMe8uZw4CACCq1ehkdq12oO6ULOav48qrBmkz8cgZsdeLCatwvw==
X-Received: by 2002:a05:6808:151:: with SMTP id
 h17mr16082495oie.102.1616950496168; 
 Sun, 28 Mar 2021 09:54:56 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id u7sm3349959ooq.13.2021.03.28.09.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:54:55 -0700 (PDT)
Subject: Re: [RFC v12 36/65] target/arm: move kvm-const.h, kvm.c, kvm64.c,
 kvm_arm.h to kvm/
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-37-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cc6ba6f8-4f19-91c5-4a7e-345c643027c9@linaro.org>
Date: Sun, 28 Mar 2021 10:54:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-37-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> and adapt the code including the header references,
> and trace-events / trace.h
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

