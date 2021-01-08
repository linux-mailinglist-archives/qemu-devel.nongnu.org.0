Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA52EF87D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 21:03:28 +0100 (CET)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxyp-0000aU-KD
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 15:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxxxm-0008Hl-OX
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 15:02:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxxxk-0008VA-Nv
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 15:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610136138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nab57hnOBUVefffekMw8GiFgvpKSZ4vixCswdy+ucIE=;
 b=A+qcHBXy4kkbQORyurtVvXp39pTFls/SVsApWFQG8BMgB0cuIRTUH5jMmJiwCE/iMuBxPb
 +zIfLwoAPG3t6BDd1b3ktzCzqsCw3Yc56EUBCgAa5DyxIpyChoR//TP72JlVIZ++xoj/XE
 riIpo3Eby97PI3osQwVz1+BKsEOh9PE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-HwV4XYJpPu2MnOe--j431A-1; Fri, 08 Jan 2021 15:02:16 -0500
X-MC-Unique: HwV4XYJpPu2MnOe--j431A-1
Received: by mail-wm1-f70.google.com with SMTP id z12so3593994wmf.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 12:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nab57hnOBUVefffekMw8GiFgvpKSZ4vixCswdy+ucIE=;
 b=ixXhMhtbdC+fmQxcrTeyeRs7pbJsZDZRKpqjFKww3bUyWha64LZFhHM8l4ieHZnrJz
 f8WzlEZRMoH8Gp09JxCrwEWdAzsfZ6j7mYw75MFKEjjKwC6cKkTyVLsPCvZ0NmOtDO8r
 Q+AOTBkz/xkhqLF0wQvRPuhL/VbtbvICDy151iTQm4xIMpGlmYgiTdSCGzaNQM3070rS
 6UvJJTswqj57Et54i1ZkJlekB7rw/ZBHV1CY/bZoCXaImvpxEJ8Ujz+PHyXjDoSC7C7N
 uRP0noStzWGtbP+iRHBccZZm5Yg4Fwf7lzkxuNL04IDFRklZahoJHOF/jGEQR473WRFJ
 Iu4A==
X-Gm-Message-State: AOAM5317OvMPspptKGyc31GJDfJFHN5Gy7ussiE0mkJw/v28behRYEAr
 dDqid6W2f9SKA2P+eWkoErywUQ4qhO96bo1waEan1VMVbOLDM0QnNm8fDPHxjTGX+qwTsqc0n95
 oSpVsvKhtnNQNIuA=
X-Received: by 2002:a1c:c308:: with SMTP id t8mr4555493wmf.22.1610136135306;
 Fri, 08 Jan 2021 12:02:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziRh2vSxJ2s68+G64nW5dDzaByQmwIrkPO4QIGpEnlJzyt5ynKCZRWbW5OBiU48ZMEvhrjZA==
X-Received: by 2002:a1c:c308:: with SMTP id t8mr4555465wmf.22.1610136135036;
 Fri, 08 Jan 2021 12:02:15 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d191sm13047763wmd.24.2021.01.08.12.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 12:02:14 -0800 (PST)
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
 <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
 <690581da-9258-41e5-14cb-bb1b162e8993@redhat.com>
 <X/cvK5Xkh6+1Qn1K@SPB-NB-133.local>
 <86bebbbf-ff0f-263d-96a2-4e6df9f85776@redhat.com>
 <X/dQb7xj/RYiT00R@SPB-NB-133.local>
 <74d3e1a4-3f0e-f3bb-6079-03043530bfa5@redhat.com>
 <X/ditOsBmc4A1lJn@SPB-NB-133.local>
 <CABgObfbYXoGVv4_KSzKR5J4XfJ2du9z77LEh1vrShz-q-O_t4g@mail.gmail.com>
 <X/iyiCT39u5MCS2D@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <99503726-e8b0-97e1-3799-a40e04d6203b@redhat.com>
Date: Fri, 8 Jan 2021 21:02:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X/iyiCT39u5MCS2D@SPB-NB-133.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/21 20:29, Roman Bolshakov wrote:
> Paolo,
> 
> I tried to use extract_all_objects() to get all object files directly
> but it doesn't work on dependency objects defined via
> declare_dependency(). It works only on regular targets (libs and
> executables). And as far as I understand the intention to have
> declare_dependency() in QEMU was to specify public interface to avoid
> some duplication. But meson doesn't have public/private notion for build
> targets so if we drop declare_dependency we need to specify link_whole
> in every user of a library that's had link_whole: declare_dependency()
> and build files would become less lean. So I'm not sure how to proceed.

Yes, that was just saying that the code was _in Meson_ but it still 
needs a change to the ninja backend.

> The proposed patch (in the subject) is the still the best we've got so
> far that fixes macOS build immediately without much bigger wrestling
> with meson.

Yes, I'm going to queue it.

Paolo


