Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CA38751E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:29:35 +0200 (CEST)
Received: from localhost ([::1]:59434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liw2g-00036n-Kq
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livtJ-0002WU-Gk
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livtH-0003JB-TV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBmX8rz0GURO4PPYmHIok5YzPIKlkaV3PAL25MTmYVM=;
 b=h2llSkqTzKilwaViyNj1MhytCZW4bqr3T9uo0zVAikhWAf2m21rYshzL1gtkf14OmqeQUl
 oCmp6UiRwpoMkC7PQApMm2u5+CQrMpX2PO5dQhf14FNuZE7kguowWfZiPeqG6t6JOJUtbv
 ORvTZOcdICVQ5pJb7uEDFm4yYmrX2Es=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-GaBrikHlMJyNAWThHlxljg-1; Tue, 18 May 2021 05:19:47 -0400
X-MC-Unique: GaBrikHlMJyNAWThHlxljg-1
Received: by mail-ed1-f72.google.com with SMTP id
 d4-20020aa7ce040000b029038d1d0524d0so4652778edv.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wBmX8rz0GURO4PPYmHIok5YzPIKlkaV3PAL25MTmYVM=;
 b=M9NEwH4uciMtq0y60PnsubKSfjhrbfszV6heizPXt1MjNRzMT39S/sdbSdzsmjN9hi
 33tjDtYqfki2tpHoahVHzFQ+un7RmZVJfFy/TlrfmRkrtNstHzEPijuV9nFxrCT50lsj
 RAAqeYg5DF2YG7YBm/6PM7Z+Au8j788qw9jQ0dZ6nTIkEhOj8E83NEOFLaK6xhSwRSQ/
 wAgqp5kRUxzxvY4m2g5ca2pHgPwD9w7B/xKn/vHFyfGs/H7n5y18IaFsfUVuhd68oU9R
 YkkKbTsUt3LMSsQw+wsSnSHvgE4S7NvbBKT6iebpnqYXLhgJF1tt92YEhjQuLWX/l/MI
 ROnQ==
X-Gm-Message-State: AOAM530o5NhJv5uRGyaBdz3U9QYRrXqK98oB639XC7PWC0DHASVEnNwX
 OGo/eVd3UYTSRN610TwZHT2Ty7DPCTcHFWr+btkxWzTepklvA5cbVFmW4JadH/+ZkrNH2rvRoFB
 t1gZNW8IRiXUJhJQ=
X-Received: by 2002:a05:6402:50c6:: with SMTP id
 h6mr5880744edb.327.1621329586139; 
 Tue, 18 May 2021 02:19:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiSKpioelgTuEApatqqCi4/queLUosUaGnaf8GRAxJZjSIt0c+xe02axRJ2KxbvtZRpWuQ4A==
X-Received: by 2002:a05:6402:50c6:: with SMTP id
 h6mr5880726edb.327.1621329585969; 
 Tue, 18 May 2021 02:19:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m19sm7323309edd.12.2021.05.18.02.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:19:45 -0700 (PDT)
Subject: Re: [PATCH v2 09/50] target/i386: Assert !VM86 for x86_64 user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-10-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3b49030c-2b92-0b06-97ed-468d8fb7f9dd@redhat.com>
Date: Tue, 18 May 2021 11:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-10-richard.henderson@linaro.org>
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
> For i386-linux-user, we can enter vm86 mode via the vm86(2) syscall.
> That syscall explicitly returns to 32-bit mode, and the syscall does
> not exist for a 64-bit x86_64 executable.
> 
> Since we're adding an accessor macro, pull the value directly out of
> flags otherwise.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 40 ++++++++++++++++++++-----------------
>   1 file changed, 22 insertions(+), 18 deletions(-)


Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


