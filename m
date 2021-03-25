Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C111349755
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:53:33 +0100 (CET)
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTEh-0001xk-Oy
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPTBM-0000qF-Mc
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPTBG-00059U-Qq
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616690994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=121DS0LIlLDGdmTKGTNnln43LPt7mALX/sqO8XpkWkI=;
 b=dUmLjbzE407QAXH1Fh691pPMiYFIx1qlWhCNs73NT3mPEKvpLpFzihf/oGIx1xjOeYgke4
 e9dv6eyjyb6CfvdOHgOmbEnFtqnpLpB6zEIxkepouI5hJQdrN5ZZlqou5J+5KGvEirApYq
 8mSdIANgvsmsoWYN9jty4CJI8PlCm8I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-a4GhQRZIMMKpQOrd6G6zgw-1; Thu, 25 Mar 2021 12:49:53 -0400
X-MC-Unique: a4GhQRZIMMKpQOrd6G6zgw-1
Received: by mail-wr1-f70.google.com with SMTP id 75so2889830wrl.3
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=121DS0LIlLDGdmTKGTNnln43LPt7mALX/sqO8XpkWkI=;
 b=N9tR0iKRaEQzz1+LOUPhrj6p8L3ZbOtfR4eomSOQPaFJiJ1aqIj+bvQ1aujHDyPjvQ
 t+lIdkyDgidFMY/SFGTYE56GNtZgKqhXa6h2oFQZtdAuDw1CP6rMiACFwRAzhmq+QYhv
 BGG+wOF/i86TT1RX2OPp81DE03kZ7Bwqda1gXejrbgEC+e0z8ojtjs1yto2p0IT8RtV/
 czKbd44eclHzW0xhIvClVDuy/N9pGH5QAr/qR44GeH+t9XEI3UoJwQjVPScO70wzbiGk
 dmxql1eCgMRwOgd3H7UElV3ou/v1+0QMYUGYuf/HFfe5SqBFzrO27k4R0TBjQ8FgCoWn
 VyNg==
X-Gm-Message-State: AOAM530T8ZKPK02djJbUGitJAR45NOtKhoGmP3zKszJtoCIFreAsXOsw
 IdC6bqzEsc0HkPtRlgFygDO8iDF1mXQaDJ+wqF8FUipkemY+DRtlzFQ6JLrznydynabSQrglQ3R
 xHC4RNNv9zyuVCMc=
X-Received: by 2002:a1c:c1:: with SMTP id 184mr1069002wma.143.1616690991824;
 Thu, 25 Mar 2021 09:49:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPWFxtRUx2xUzR+f2PBAv/JqVK7YygaZ0ZccnI4WrsK0a6PduqDEoDgfxInGEPSSeviU9e3Q==
X-Received: by 2002:a1c:c1:: with SMTP id 184mr1068978wma.143.1616690991577;
 Thu, 25 Mar 2021 09:49:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r206sm1022782wma.46.2021.03.25.09.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 09:49:50 -0700 (PDT)
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
To: Olaf Hering <olaf@aepfle.de>, John Snow <jsnow@redhat.com>
References: <20210317070046.17860-1-olaf@aepfle.de>
 <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
 <20210325121219.7b5daf76.olaf@aepfle.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
Date: Thu, 25 Mar 2021 17:49:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210325121219.7b5daf76.olaf@aepfle.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/03/21 12:12, Olaf Hering wrote:
> Am Mon, 22 Mar 2021 18:09:17 -0400
> schrieb John Snow <jsnow@redhat.com>:
> 
>> My understanding is that XEN has some extra disks that it unplugs when
>> it later figures out it doesn't need them. How exactly this works is
>> something I've not looked into too closely.
> 
> It has no extra disks, why would it?
> 
> I assume each virtualization variant has some sort of unplug if it has to support guests that lack PV/virtio/enlightened/whatever drivers.

No, it's Xen only and really should be legacy.  Ideally one would just 
have devices supported at all levels from firmware to kernel.

>> So if these IDE devices have been "unplugged" already, we avoid
>> resetting them here. What about this reset causes the bug you describe
>> in the commit message?
>>
>> Does this reset now happen earlier/later as compared to what it did
>> prior to ee358e91 ?
> 
> Prior this commit, piix_ide_reset was only called when the entire
> emulated machine was reset. Like: never. With this commit,
> piix_ide_reset will be called from pci_piix3_xen_ide_unplug. For some
> reason it confuses the emulated USB hardware. Why it does confused
> it, no idea.

> I wonder what the purpose of the qdev_reset_all() call really is. It
> is 10 years old. It might be stale.

piix_ide_reset is only calling ide_bus_reset, and from there ide_reset 
and bmdma_reset.  All of these functions do just two things: reset 
internal registers and ensure pending I/O is completed or canceled.  The 
latter is indeed unnecessary; drain/flush/detach is already done before 
the call to qdev_reset_all.

But the fact that it breaks USB is weird.  That's the part that needs to 
be debugged, because changing IDE to unbreak USB needs an explanation 
even if it's the right thing to do.

If you don't want to debug it, removing the qdev_reset_all call might do 
the job; you'll have to see what the Xen maintainers think of it.  But 
if you don't debug the USB issue now, it will come back later almost surely.

Paolo


