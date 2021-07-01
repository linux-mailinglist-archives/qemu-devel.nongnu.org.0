Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6AB3B987C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 00:09:10 +0200 (CEST)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4rt-0002qZ-GF
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 18:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lz4qj-0002A6-Lf
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 18:07:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lz4qg-0005Ku-P8
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 18:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625177273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TtV85+LniYMMGMydaCAQR1v+qvTuLwGM75ml6jclpZA=;
 b=J28CRn6NkF5+8aXUk67bKs0RGdiVms1y4t6Qu67buSt9LrOnud0dwucr6TlhM2NNqs9/Uj
 kFtdTqwxvXl76FJZlcB4LO6SyQLmAxj2YdSyq/gJCWEGITaVZn5dUEBsxMLbJePIU3G3Kf
 /MTCLHUIjxJeEqD/5ONWq2QqSsE7fPQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-UHJQk_TmN4eksRUOX402eg-1; Thu, 01 Jul 2021 18:07:52 -0400
X-MC-Unique: UHJQk_TmN4eksRUOX402eg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o19-20020a05600c5113b02901ecf901808fso1557261wms.6
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 15:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TtV85+LniYMMGMydaCAQR1v+qvTuLwGM75ml6jclpZA=;
 b=fJUMyEW512FGq+Lgcsw17slzHjLe4LyhT5wgLRYYJ5gjxQTlIE7H1cUWx11AnRAaye
 dRwBL3qFdnPOVu39YSaq9Y6MrytrGBweFdASX9qiFKBKUUWKZ0M7SlIUbomqEoV3qzqf
 vCR9dB4uRHXWYeACyHl8Lc52X7/myMefXfpUaWs6sUsIlM8+qZPD6TPLJyg4nDH3Z0bv
 sDYygpuUhyZcBqqDI7QN5PvFeVFf4W/7n+szI1CxWoGYPOcMdvq7nguAq4TFQdpPfuoV
 0M3OAZVDTBCDPtxCHwcGpTLJcHy53cf4erUcC6hQPRKtXo/Q4fuqvnZxPCbeaUAe5dxz
 zTAg==
X-Gm-Message-State: AOAM533iYZ+oLMI9m3tdo/0KpjviThU2ElAe9Cvq77v1tdeDak+1E7Xk
 pmemDk2+GbeaXQDdPQWlIUldClc4SWXkL8BHUwikVx3UU+nEbPKz95dPLkDIGJjjvdCn4SzqbD0
 D/vynY2W42f+AUOdrJ+CcfR2YAzlzHENKKbcNaDiL0Ax0nY5/6720fDEGiUce4AKh
X-Received: by 2002:a05:600c:282:: with SMTP id 2mr1897864wmk.77.1625177270890; 
 Thu, 01 Jul 2021 15:07:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLQ7Q5hNdMo1fJxu/0C5eM+AR0xH8pAgMN/lmoJ2h+wph74vH/f4lwgHSSAO2BBZ30+auLCQ==
X-Received: by 2002:a05:600c:282:: with SMTP id 2mr1897852wmk.77.1625177270715; 
 Thu, 01 Jul 2021 15:07:50 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id p16sm1156026wrs.52.2021.07.01.15.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 15:07:50 -0700 (PDT)
Subject: Re: Contributions: Adding New Devices
To: Connor Kuehl <ckuehl@redhat.com>, Federico Vaga <federico.vaga@cern.ch>,
 qemu-devel@nongnu.org
References: <20210630140102.ecuyxyeqnthvausb@cwe-513-vol689.cern.ch>
 <a394439c-0e82-b915-2e49-70ceda3d7b02@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3430433f-7ef6-9403-c160-6b135fb199a2@redhat.com>
Date: Fri, 2 Jul 2021 00:07:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a394439c-0e82-b915-2e49-70ceda3d7b02@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 9:48 PM, Connor Kuehl wrote:
> On 6/30/21 7:01 AM, Federico Vaga wrote:
>> Hello,
>>
>> I can't find this information on the website, so here I am.
>>
>> I developed a QEMU device that virtualises a PCI card that we widely use at CERN.

What kind of device is it? You might be surprise to see later someone
else interested in what your specific device does and reuse part of it.

Is the datasheet/documentation public?

Can you provide test? (so it doesn't bitrot while we do code changes
unrelated to your device code)

>> But this card is only used at CERN.
>>
>> Clearly, having CERN specific devices in QEMU does not help much the qemu
>> community, hence I maintain an internal QEMU fork.
>>
>> But, I was wondering what is the QEMU policy about contributions that are known to be
>> used only by a handful of people (one organization in this case)? Are they accepted?
> 
> Your first instinct is correct that it's unlikely that the community
> will be able to maintain a device if it's really so niche as to only
> be used at your organization.
> 
> However, if you do decide to try to upstream it, it could only help
> your chances if you or some of your colleagues agreed to maintain it
> for the QEMU community. This mainly involves adding an entry to the
> MAINTAINERS file where, if accepted, the expectation is that you'll
> be reachable within reason to review patches, make pull requests,
> help discuss bugs in the subsystem, etc.

As Connor said (although you probably won't have to worry about
pull request burden, other will help you while you ramp up).
Beside, code only usable by you shouldn't have a lot of traffic,
so maintenance shouldn't take too much.

Regards,

Phil.


