Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD45259B8C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 19:03:43 +0200 (CEST)
Received: from localhost ([::1]:49962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD9h8-0002gN-NC
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 13:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kD9gN-0002Dy-VL
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 13:02:56 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37235
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kD9gM-0004WR-0M
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 13:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598979772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbaKAiIo0ZD4AhA08YdKXa+ZQzyKJNkPAgbcXhXyctU=;
 b=NWggDpQNt5Yph3Cx1eBBk4qnJaOY/twR1MTRDchp1og8Fm8wdRmYTuWn+u4yiApDM0lZDj
 l13ae11OV5DI6BlyZkobh8s0DOJphfOVTll+eA+olM1hY8t0/VCSUKgyCAadIHydxDIYZG
 USnep2jRCRVIVgKWdcuD/m2r8xAQarY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-ds4jKvJFOKCpiTL6d9ScSg-1; Tue, 01 Sep 2020 13:02:51 -0400
X-MC-Unique: ds4jKvJFOKCpiTL6d9ScSg-1
Received: by mail-wr1-f71.google.com with SMTP id r16so333115wrm.18
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 10:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CbaKAiIo0ZD4AhA08YdKXa+ZQzyKJNkPAgbcXhXyctU=;
 b=jNnBxSZsl9A2KUOZjSpcjUkt+U5NdDq/z2M2lwjWRpanWdmD7K05CFgft8jrE3x+8e
 xxJHelJXrua549RUTd605IVv7O6HhJBaqCZ5DnJwAC/vNaDoFMUnfglLdv8K+4iOMs0n
 dUaP1vYhWQ5E3cFPZxj6a2armxr8nSlPLmGbsHzAdgohtniZIU0LXtN4kidunzzt20RP
 2n1tMQ+n3boabciIepnshN4u3Wcw9olEf8+PYfQq0NRxPm5d/MLm0UzuDR7Ntl04KTHV
 9+PHLHf3tfqJht+iJFKzzn58b+z457BoSwjRfXiqkTMOnc89BG79gQ87/Amc+n/4j3cy
 nzlw==
X-Gm-Message-State: AOAM533fV9owxuG1pYaVpQGUiOWFeJQ7cetU5QP9x8F3dWHc1SeTncJZ
 T5Pkit+adevD93XP4yM4+kG5DhCdCzAr/vH/XsWznljTAnNB5YhqeM1P1geFf2oTMwYsyH0nTlU
 qxv+0b26e8wpb/Tk=
X-Received: by 2002:adf:e385:: with SMTP id e5mr2829884wrm.129.1598979769681; 
 Tue, 01 Sep 2020 10:02:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEpbQwQ27wfZfSzioyCS0vxhg1vHir4ERF6+AxZWCPmR6/xlIYbEJMjYW7xx7GXG0VqwtKQA==
X-Received: by 2002:adf:e385:: with SMTP id e5mr2829862wrm.129.1598979769462; 
 Tue, 01 Sep 2020 10:02:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7fbd:8007:1fa7:ed17?
 ([2001:b07:6468:f312:7fbd:8007:1fa7:ed17])
 by smtp.gmail.com with ESMTPSA id h2sm3096605wrp.69.2020.09.01.10.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 10:02:48 -0700 (PDT)
Subject: Re: [PATCH-for-5.2 0/4] hw/char/serial: Use the Clock API to feed the
 UART reference clock
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200806130340.17316-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c02e70ec-2567-5c0e-f85d-2acfb8ba009a@redhat.com>
Date: Tue, 1 Sep 2020 19:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806130340.17316-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 10:16:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/20 15:03, Philippe Mathieu-Daudé wrote:
> This series improve tracing of multiple UART device in the same
> chipset, and allow to use the Clock API to feed each device with
> an (updatable) input clock.
> 
> Based-on: <20200730165900.7030-1-philmd@redhat.com>
> "hw/char: Remove TYPE_SERIAL_IO"
> 
> Philippe Mathieu-Daudé (4):
>   hw/char/serial: Replace commented DPRINTF() by trace event
>   hw/char/serial: Remove old DEBUG_SERIAL commented code
>   hw/char/serial: Let SerialState have an 'id' field
>   hw/char/serial: Use the Clock API to feed the UART reference clock
> 
>  include/hw/char/serial.h |  4 +++
>  hw/char/serial.c         | 55 +++++++++++++++++++++++-----------------
>  hw/char/trace-events     |  5 ++--
>  3 files changed, 39 insertions(+), 25 deletions(-)
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Are you planning to deprecate the baudbase property, and instead setting
up the clock already in serial_mm_init?

Thanks,

Paolo


