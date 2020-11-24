Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86B02C316A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 20:52:11 +0100 (CET)
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kheME-0002Cr-R1
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 14:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kheEy-0006Xh-Nj
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 14:44:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kheEx-0005Xb-1V
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 14:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606247078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfa/+5WksyYKgM5/kPfGL03zik+pwCXpbEAIO7/6BQs=;
 b=AmPPHpXLSQ+y8ZyjaFRPNm56W1fwFigvpCLhkfLfFGXDF++0Oy7jNyx0NAUBoMrAWHEY79
 /vF1eXogKvGCoodvglVh6PROTdZygGNjDonNxjbD0DIYCP98XEkTmGzDlxl3ZrrCtmKAn3
 0Krv8MFLGjCKzRTu/T8zv8+XEzO3puE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533--V57rGQtO_6iTc5wUuMpWw-1; Tue, 24 Nov 2020 14:44:36 -0500
X-MC-Unique: -V57rGQtO_6iTc5wUuMpWw-1
Received: by mail-ed1-f70.google.com with SMTP id y11so24342edv.6
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 11:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wfa/+5WksyYKgM5/kPfGL03zik+pwCXpbEAIO7/6BQs=;
 b=TqS50HyJRqrMjgQg+Y6CP0e6/vcwYNZQVS2uQx82dcMuB2sJsf/TV6UTQVWeZxyhC+
 hbcs4gFxUPAcaRs47EUa4nd/crfXOUCNotPC5f8zhIP96G76ZbfUS267NpfhKJcEU169
 0AxC0lku+7rjiwdWdWnxNS9KJn3E7tolI0HejoXpt6biFl8ORjKu5UO5fWThG6a51gn+
 69MH6UgFT2DjSo7PkSZjGUwUaPfiXCEqGzgB2cEyEmznz7hKRbb9F/aM1IHG3/YwF/Kq
 H6XYui1WUPt+k3lw1DE/lGFLwJT1uRGNeyjepgAcmn1r91ixGaTF00wP/vFa18dW0kR9
 MTBQ==
X-Gm-Message-State: AOAM530WqpR+6Jlul6tzlk7NMmHqZSVsR52B1zuYz6iGt5eEMEU4AyvP
 /UKgf2NYT+f/4KfzSTvr9RrrvgWvdTcH9e8Yx2Ti3YFEazEvWPPgdzItNtU4spJi7wXCKvoHJ9S
 AcaQ/5M0/XuPVl5g=
X-Received: by 2002:a50:9fc1:: with SMTP id c59mr72628edf.59.1606247075509;
 Tue, 24 Nov 2020 11:44:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY7YpZL/G2tlpnLY8ocJrryUq8gPBnZjWCxgEnu1gzUTetGYLpJuOK1eYZn1yXl9hESxhCjA==
X-Received: by 2002:a50:9fc1:: with SMTP id c59mr72609edf.59.1606247075342;
 Tue, 24 Nov 2020 11:44:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y12sm7382389ejj.95.2020.11.24.11.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 11:44:34 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201123131426.2725276-1-pbonzini@redhat.com>
 <ee22951a-6e40-67d4-c0b0-7df096572ea5@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/i386: fix operand order for PDEP and PEXT
Message-ID: <49f0103c-eef4-5458-b222-14a63ab01cfe@redhat.com>
Date: Tue, 24 Nov 2020 20:44:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ee22951a-6e40-67d4-c0b0-7df096572ea5@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Lenard Szolnoki <blog@lenardszolnoki.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/20 18:54, Richard Henderson wrote:
>> +test-i386-bmi2: CFLAGS += -mbmi2
>> +run-test-i386-bmi2: QEMU_OPTS += -cpu max
>> +run-plugin-test-i386-bmi2-%: QEMU_OPTS += -cpu max
> I suspect that we still support host operating systems whose compilers do not
> support -mbmi2.  This might require a bit in tests/tcg/configure.sh akin to
> CROSS_CC_HAS_ARMV8_3.
> 

Actually -mbmi2 should not be needed since (unlike sse or avx) the 
instructions use normal registers.  Only the assembler matters, and at 
least RHEL7 (binutils 2.27) has them.  So I'll just remove the flag, it 
should be enough.

Paolo


