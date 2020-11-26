Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD82C5281
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 11:55:56 +0100 (CET)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiEwN-0004Xd-99
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 05:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiEuh-0003pn-NL
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:54:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiEuf-0001Ui-9d
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606388047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWhaefZDJvHz38Xlrmb6/2RW2E2nv3kfYZJXGXfCkGU=;
 b=TVLY2oHj5ZN6bB78lYD7Y6ihZavYTMR4OmwVDRbp6pw3MKRZMMtd5Bdk7pdyftPO0GXQYf
 /XprzsXNPldUitkxoU3KDDY4rwjeNHabisnCfmEQBH+CGw1vxdgwUp8nwdrzheYTAaiZCo
 /75+h9NQF0jEl6PlUFt/bGc0eaBiRVc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-cVnPu_sbPlaK8Qwp3o3Kjw-1; Thu, 26 Nov 2020 05:54:05 -0500
X-MC-Unique: cVnPu_sbPlaK8Qwp3o3Kjw-1
Received: by mail-wm1-f72.google.com with SMTP id s10so1009786wme.0
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 02:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aWhaefZDJvHz38Xlrmb6/2RW2E2nv3kfYZJXGXfCkGU=;
 b=NtKu68pAbB9EPfhZrq69fKDZKGUUtocmdA5UXJXsNPYnZ66Ql84GyzRU5u2X+ehEce
 l9p/XHqgytvnBKs47M6jkyfo1mTLo3xREQJuuj241t/Pfbyu9to00SYknAyAv5vQWrT5
 0k7cee4rMF4Lwxx+/2PkvWfAZOKFOr4SgRfO/Ubkt0B6fnzbUz8QmXT0vZ8KOiVr0IoP
 gJI3YaE9QEC1JRYpWTbHyPbGtm3SAD8dR2Gat110HLd3xfXo0gyqbYvP1zV3lmyWbk94
 Jf6thSDCwhmC0z7sVxMKXuifYskAJf73EzAQxoyNbmFs/4ZV8NJE1dQYKPRKiCpQbQTC
 fzLg==
X-Gm-Message-State: AOAM532Y7GJyFJQ5f85Dg2TnB5THkVJq3nMmOeUktSNYMzQ1+l4FX+wm
 4HoKaYjg4zLzbzH4eUfWcujKv9Lgdp5KkTHAzuZJebxfvVo2ngsjH5bo3H1U13g/qCf9edOa6qq
 PVauO2rPJxP6M5lDqM3K9VP2ENuhCv7u3g7N5pOuF1gthkDRTk2y8qzQ7rO09YIt9AOg=
X-Received: by 2002:a1c:7902:: with SMTP id l2mr2762573wme.117.1606388044387; 
 Thu, 26 Nov 2020 02:54:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyP3b6ParI0xGKHoJvJa1/YbsbnmkHj0llNfLsOm95OCm9Wpvt/5vF5JwTmimEUq7W3u97frg==
X-Received: by 2002:a1c:7902:: with SMTP id l2mr2762328wme.117.1606388041379; 
 Thu, 26 Nov 2020 02:54:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm8782756wru.37.2020.11.26.02.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 02:54:00 -0800 (PST)
Subject: Re: [PULL 0/5] Final (?) batch of misc patches for QEMU 5.2
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201126075921.3116321-1-pbonzini@redhat.com>
 <CAFEAcA8YP0-=RUVdW1f6M7NizMvNXwLoBpvqUqyPQNCJ6d238g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d057a404-983e-6784-b4f3-998a3b2a4422@redhat.com>
Date: Thu, 26 Nov 2020 11:53:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8YP0-=RUVdW1f6M7NizMvNXwLoBpvqUqyPQNCJ6d238g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/20 11:10, Peter Maydell wrote:
> On Thu, 26 Nov 2020 at 08:02, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:
>>
>>    Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' into staging (2020-11-22 15:02:52 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to dae3916d846cd88aff038a56b82fa687fd6d02a3:
>>
>>    nsis: Fix build for 64 bit installer (2020-11-25 17:39:12 -0500)
>>
>> ----------------------------------------------------------------
>> Bug fixes + removing the setuptools dependency
> 
> Hi. We've passed rc3 now, so the only things going in should
> be absolutely release-critical bugs that oblige us to put
> out an rc4. That means pull requests need to have more
> explanation and justification of why these are release-critical
> issues; just "bug fixes" isn't enough detail...

The only one that isn't quite release critical is the target/i386 fix 
(though PDEP/PEXT are completely broken without it).  For the rest, two 
patches fix bugs that block Stefan's Win32 builds; the other two remove 
an unnecessary build dependency, and all they do is remove the code to 
check that python setuptools is there.

Paolo


