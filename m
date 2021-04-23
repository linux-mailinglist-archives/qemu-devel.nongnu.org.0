Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0F368FE1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 11:53:07 +0200 (CEST)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZsUk-0002uI-BJ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 05:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZsTQ-0002Bv-I0
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 05:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZsTN-0005SG-F8
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 05:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619171498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7aywX2siW2xf5JbUNnSxIQ02na4vXcayTbFpZ/b0H40=;
 b=jRRuDzG7S1aDlBqu+gTBUROblR1PBGQ1zKY3vzNLheBND7c7pQhPD5S+nq6w0KqvL5ysNY
 UVb+x9vJdluGof2zpXuxssm/eJUprXK42ew4SatlnJ16+GdI+o51EYb/+xLjgvrmHdqIb0
 yv7G/svhtFnAjBZ50z8Lxumb7CNNjN8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-oLHFUI-RMuqWq0_qoaiMNA-1; Fri, 23 Apr 2021 05:51:34 -0400
X-MC-Unique: oLHFUI-RMuqWq0_qoaiMNA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v20-20020a5d59140000b02901028c7a1f7dso14890401wrd.18
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 02:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7aywX2siW2xf5JbUNnSxIQ02na4vXcayTbFpZ/b0H40=;
 b=pKs+TaqeNbbSN+g9sNA+mhitI0O/NMjNt9lgbUgAv/gFBFL53esahdOuMef98R/a2I
 mChywpOFN9yCcgerGt7mbLs95qJh9a3EfroW/8l37FmlTRjucRr+78x2uw58wPpJTHw0
 TN0xfrLdLef2LAjE3ldClix6d0jw+gQdlw3Cl+GUPP4FGziu1JtFDzdoSdVCVd9N8ner
 nIeaOatWPVy394xkcptCq2fCdmDbOmRO93Tl2il2+6meAP42g51lfwXxADQBB7EgHDic
 noloEDs7e9plupGMOvAhdHlsmhaccQ/nDaAXEpUQJ0Z4QFnP9dUGxRazFXcWaAHlKCKB
 Rdmg==
X-Gm-Message-State: AOAM533q6meihIxI5XoxMmT+uGom7r5LlGHaY0hSF4ZuWzjPuwDu4cRs
 S/APiSvp6FguAIPoVyM8y95xKtSqBpfF7IB22TIzr58ykhf+YjSPYtbg9bJ1jgb2k2fnNDU/J7P
 9WIu9YMrRVY7Thu0=
X-Received: by 2002:a1c:2b44:: with SMTP id r65mr4550498wmr.57.1619171493482; 
 Fri, 23 Apr 2021 02:51:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/IZyhLIHvQKK28mIOlQGzlW5yr8yCFPHmlCXE00AzsMXJRnOZ0yP7w4ehykzWADIymZd2XA==
X-Received: by 2002:a1c:2b44:: with SMTP id r65mr4550483wmr.57.1619171493317; 
 Fri, 23 Apr 2021 02:51:33 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x9sm8514644wrt.13.2021.04.23.02.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 02:51:32 -0700 (PDT)
Subject: Re: qemu/kvm tianocore restart stuck
To: VoidCC <raidsmainacc@gmail.com>, qemu-devel@nongnu.org
References: <CABZ9ZfUNmxTPxOBh0SCvaxBFRHKkTfmwAQjqFin=20CwMK64_g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a7247822-3433-b0b1-65c0-8d22b388e134@redhat.com>
Date: Fri, 23 Apr 2021 11:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CABZ9ZfUNmxTPxOBh0SCvaxBFRHKkTfmwAQjqFin=20CwMK64_g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 10:04 PM, VoidCC wrote:
> Hello,
> 
> I'm hitting a hard wall with qemu and efi.
> I'm running multiple windows server 2019 vms which usually reboot on
> updates.
> 
> The issue is, efi breaks on reboot.
> It randomly(race condition?, does not occur consistently) ends up in a
> blackscreen: no bootloader, no efi screen and the only way to get out of
> that state is to destroy the vm.
> moving the host mouse cursor above the console in virt-manager results
> in a flashing mouse cursor.
> there are no physical devices attached and there is currently no virtio
> attachment in use (os has virtio drivers installed)
> 
> 
> Machine is Q35 with tianocore/ovmf efi.
> I managed to reproduce the same behaviour on rhel 8.3 as well as
> voidlinux (kernel 5.11)
> 
> gdb output of qemu is showing nothing worrisome, else ive compiled ovmf
> manually for debug output.
> libvirt logs don't show any issues.
> 
> root · Slexy.org Pastebin <https://slexy.org/view/s2w8CdNBx5>

I tried to help you yesterday on IRC mentioning SMM / EPT
but then you didn't reply. See:
https://bugzilla.redhat.com/show_bug.cgi?id=1348092#c24

Regards,

Phil.


