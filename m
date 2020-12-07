Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887572D1269
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:45:51 +0100 (CET)
Received: from localhost ([::1]:42776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGpq-0007ir-LA
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGHH-0001TJ-0Z
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:10:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGHE-0007uR-68
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607346602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xmC+Xu/jz0arN7mGMs+n2b7qHuhJ1srLusJhjHfcWY=;
 b=W+KjJhN7OhRMYXLT7Zc5yQjPQe+0YBj8FjgHfb7noR0WjITqYPWXVF01n3aMBwPV8+h3yY
 1zR2GyvFss1KeGCD6LUwzA+TyxGaMtGsD5JASXEPUQfyLBxlWY5ApuGiSnrDBweZk+HUPr
 RHo8YnMauFlSH+BrtfPYemZ3vQkjjcE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-oi8ulv64OaCde0XLzzk8lg-1; Mon, 07 Dec 2020 08:10:00 -0500
X-MC-Unique: oi8ulv64OaCde0XLzzk8lg-1
Received: by mail-wr1-f70.google.com with SMTP id u29so398450wru.6
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 05:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4xmC+Xu/jz0arN7mGMs+n2b7qHuhJ1srLusJhjHfcWY=;
 b=q1LS9FQvCWQ/Qh8dpkXCXLsZzJBIyxIrK/7iYTxI0wpydUfTCR+d8SoEjIyq8uvoCs
 Ui1v8alrMdMyKD5w06zRiJdZ6VEGeLHewJnTjjQkooH4OqowMlygchaI6//YHOPV489l
 e8ic72lenUUc0jicTeumU6Zr6g1xmNgjEp/BIr2czRZjAUft6wyWDehXkorJx1JQVw8G
 lExBSrBNWwgRAnzh/YxpXPAL3oL4r96ofiSHqJgIrRV2hDYfLmxWgPIaXt5AXinRXADf
 kCGtcbyn6XiSiHmnhwC8t0iXFIaUlDoor0boZQIoYpeoNpUX1Lu7/tXeDGBaMulgXIln
 O3TA==
X-Gm-Message-State: AOAM530fdwNw0D06iXW1r6gP8Six765UD3FM/GDWmdTZgolELv0GDq9R
 a8am+oZ+mD8lhiKtYST/1L1d9bnBJ1E0qPc4Blc//rVzd+eBXQW+rb56Exk3DIlGmb/uvWi8vmj
 y1NYxk6lxhgn6I0s=
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr18700609wmd.61.1607346598947; 
 Mon, 07 Dec 2020 05:09:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQKrZgvVB3jqmcaBzMPwSocbeACnsG8azUjRRM9kTLF5FUlRQfVtzh5WhE9to8+IErcHxdcA==
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr18700584wmd.61.1607346598770; 
 Mon, 07 Dec 2020 05:09:58 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i8sm14212753wma.32.2020.12.07.05.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 05:09:58 -0800 (PST)
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Dongjiu Geng <gengdongjiu@huawei.com>
References: <20201207084042.7690-1-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <858b7862-baef-f6e4-c4a0-37e020e44544@redhat.com>
Date: Mon, 7 Dec 2020 14:09:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207084042.7690-1-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 9:40 AM, Claudio Fontana wrote:
> cc->do_interrupt is a TCG callback used in accel/tcg only,
> call instead directly the arm_cpu_do_interrupt for the
> injection of exeptions from KVM, so that
> 
> do_interrupt can be exported to TCG-only operations in the CPUClass.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/helper.c | 4 ++++
>  target/arm/kvm64.c  | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


