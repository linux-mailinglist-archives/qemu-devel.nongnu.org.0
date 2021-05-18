Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90920387570
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:46:18 +0200 (CEST)
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwIr-00046d-LD
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livuW-0004sJ-4i
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livuQ-0003x5-Pj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4Bm5AdlO194AcgfXDK2B3qGKmMnpHonLYfkNkl8v/A=;
 b=OM/Ape9HJTQdC1SRkxlpFlk6PpwvJtot8Hb7OjFrr/LTbxW4BLvA8oUERXOxBo97WWUtMN
 KixNCL0Te1mh7G3+v0NTk53pjeiJLqqjbnRdfX14haySiq78pHWzQ4UGS8WPPF2d6nDjZY
 UjkAX24/IKfC0f//FNwCKasuwyx5wpQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-bdRgVU6qPwWB51PZDd14Hg-1; Tue, 18 May 2021 05:21:00 -0400
X-MC-Unique: bdRgVU6qPwWB51PZDd14Hg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso5301027wrh.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H4Bm5AdlO194AcgfXDK2B3qGKmMnpHonLYfkNkl8v/A=;
 b=nFbM8Wk6qziek/wQ4zJR6O/qY+vMUdCGriFvVUIFuAHIJiKZZGuDm2Z9Yqmcjl+ucR
 gpEhd0EjumqRfthF85WLns/QKipBIGZ1Y9VpFYVMBEKhv0SqAS+lkmsdZmbvYi8TmJXl
 VgvySs2U2KR/ZynfKz+Ug24LKIsydt905Jm5lInLkwWppC+jlViIfUNk0hNwrx5Pkcpr
 KMCuq6926C66XlndM53zDRn1D5ZN7lF9zIhI+IQUn1K3d073xGJMHFcrql2k4WoJPn4s
 m9hQO0GEaHKyyut/P1ItsEWWFYVOrms2IdOUOG23Hgl/zqpaPyZwUyFdsAclXo+Mpj/v
 A4Tw==
X-Gm-Message-State: AOAM530iqLFwxyuzx7D+WNeLemhfxIG6RLH2/L/wdKGfK8QantaXQttP
 WdqSLCtkhIIS2Hp7KSGzkwcYhg7Y0KD9xBrRcu41c88q4IeRK2i4xLjcpRugCu3/6U6Z0Q1bubA
 CNRGnWeLyd58fMWg=
X-Received: by 2002:a05:6000:2ae:: with SMTP id
 l14mr5486540wry.155.1621329659189; 
 Tue, 18 May 2021 02:20:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDnmpbguFrKTR278zbmSCQEI7k84rkC/KSFA4wojUWuk08HOqe8hGWHU792qX6Wabv6rAGrg==
X-Received: by 2002:a05:6000:2ae:: with SMTP id
 l14mr5486519wry.155.1621329658992; 
 Tue, 18 May 2021 02:20:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h15sm3226827wmq.1.2021.05.18.02.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:20:58 -0700 (PDT)
Subject: Re: [PATCH v2 11/50] target/i386: Assert SS32 for x86_64 user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-12-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <23958fe9-e268-3171-1c76-d59e3cf6ae7a@redhat.com>
Date: Tue, 18 May 2021 11:20:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-12-richard.henderson@linaro.org>
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
> For user-only, SS32 == !VM86, because we are never in
> real-mode.  Since we cannot enter vm86 mode for x86_64
> user-only, SS32 is always set.
> 
> Since we're adding an accessor macro, pull the value
> directly out of flags otherwise.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


