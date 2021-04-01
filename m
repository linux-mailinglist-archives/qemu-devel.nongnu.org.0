Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BEB3510F7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:38:50 +0200 (CEST)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsqn-0004ul-FH
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRsoM-00041u-58
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRsoJ-0004SW-1C
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617266173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkNvy7gtKB4wajLYixwjS2U8AcHfs41D3/4sSI+1nyY=;
 b=ix97gCcNd0y5WrOJZi5AEngMCVw6LlR8Gjd9mPBOLS0mAY0DxjhyxEEzssFSPihaPd2BeT
 ZioYGXD/+MKaoSpqid0TlQSu97YOJ9N0z/DJFQcPs75ZJ0Sk7xx9Ak/2auUYmnA6lJ4xpJ
 zRhz5P9OirAAZnvKrzH+KTRclYLjX78=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-Hh_LxbAYN7mCgzhVp4hUXw-1; Thu, 01 Apr 2021 04:36:10 -0400
X-MC-Unique: Hh_LxbAYN7mCgzhVp4hUXw-1
Received: by mail-ed1-f72.google.com with SMTP id k8so2468584edn.19
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TkNvy7gtKB4wajLYixwjS2U8AcHfs41D3/4sSI+1nyY=;
 b=DU69X7EjstoMPJtNdG0ti/4DYcCDGwMM3+fxf58Sqrt+XxibbrG29qMUXldXuRkeLO
 arG1Tx2B/68gvqkbznEnIL+EHyBpu8xoCTcP8Ho17EM7pmZqExS7vF56zW3iP+4sWzc2
 NbKLmBn4uSP+oIIlhIEDvSjGflThTeICbysJuDB8pMvWhLYUaTG2jar9fI4vQEHYkZL7
 oMtmQddyJG+e36pA2C+oatPgC+BOJASvu3I/gBRYHfZTXxtTCBx0YNx7VpcVK7Ou11Cd
 Qk6WPB15fxDCCPUkYWKORruRuIc7DtjD6XSgnQjE0XCt2rXbDStKWL7Qp0cLhdY28Irq
 IBsw==
X-Gm-Message-State: AOAM5323TaX6lFezs3pmD7tS0NNxaURGTjynipj7xQId/3tCijjLADUX
 QJVpjcMcFeYh1fFg/HTw0jRXZVRotgxeoXVES/5aEX44ZbOl+00UUUfwYjk+lDJ3azjWpjprNsB
 Xd3/hSmH6pI9IM14=
X-Received: by 2002:a17:906:fc1c:: with SMTP id
 ov28mr7940923ejb.342.1617266169317; 
 Thu, 01 Apr 2021 01:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUXUJQla7WVN2HSAwWwyb9gOSD6IMsjTjkVf/X7UupaK7ubpj6UpUgxx17jjqBqXu881sm8g==
X-Received: by 2002:a17:906:fc1c:: with SMTP id
 ov28mr7940909ejb.342.1617266169124; 
 Thu, 01 Apr 2021 01:36:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n16sm3190901edr.42.2021.04.01.01.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:36:08 -0700 (PDT)
Subject: Re: [PATCH v6 0/4] Implements the NetBSD Virtual Machine Monitor
 accelerator
To: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org
References: <20210331200800.24168-1-reinoud@NetBSD.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <df14826f-4ae4-fca8-ea66-572b22bbb2a1@redhat.com>
Date: Thu, 1 Apr 2021 10:36:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210331200800.24168-1-reinoud@NetBSD.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kamil Rytarowski <kamil@NetBSD.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/21 22:07, Reinoud Zandijk wrote:
> The NetBSD team has been working hard on a new user-mode API for our
> hypervisor that will be released as part of the upcoming NetBSD 9.0.
> 
> The NetBSD team has implemented its new hypervisor called NVMM. It has been
> included since NetBSD 9.0 and has been in use now for quite some time. NVMM
> adds user-mode capabilities to create and manage virtual machines, configure
> memory mappings for guest machines, and create and control execution of
> virtual processors.
> 
> With this new API we are now able to bring our hypervisor to the QEMU
> community! The following patches implement the NetBSD Virtual Machine Monitor
> accelerator (NVMM) for QEMU on NetBSD 9.0 and newer hosts.
> 
> When compiling QEMU for x86_64 it will autodetect nvmm and will compile the
> accelerator for use if found. At runtime using the '-accel nvmm' should see a
> significant performance improvement over emulation, much like when using 'hax'
> on NetBSD.
> 
> The documentation for this new API is visible at https://man.netbsd.org under
> the libnvmm(3) and nvmm(4) pages.
> 
> NVMM was designed and implemented by Maxime Villard <max@m00nbsd.net>
> 
> Thank you for your feedback.

Very nice.  Just a couple remarks but nothing too serious.

Paolo


