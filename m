Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751E537FF5E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 22:40:25 +0200 (CEST)
Received: from localhost ([::1]:47140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhI88-0003Q8-1C
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 16:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhI72-0002Xp-NQ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:39:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhI6y-0003rD-Gw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620938350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/iLMHBOqazUOiVK0VR9XGdqobfPOHjCDMpm8IKR5Fc=;
 b=CwThoMcGO94+dpVRX8a3NAcR6EG+6Bqx8/0I3zxmOeJjoSFsTU6RbCd/uB2I0sswzccOXN
 rG/IqFynOJeEsqoMj363EMA0qWvSZx/8dau9OnFN0foBL6vj7PUYMLxr2Un7x0KO39+izx
 xEZoQ7enZEsEab9OWMwUH8YdHgyaPbg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-tKuJzKdtMcm1AKS53eeblA-1; Thu, 13 May 2021 16:39:09 -0400
X-MC-Unique: tKuJzKdtMcm1AKS53eeblA-1
Received: by mail-ed1-f72.google.com with SMTP id
 o12-20020aa7d3cc0000b02903891695ceabso15255167edr.3
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 13:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h/iLMHBOqazUOiVK0VR9XGdqobfPOHjCDMpm8IKR5Fc=;
 b=dEulgC8DZbm6vg0LJioPZNRDTOtBMgXEYIMoti/IdRjS5Q+dq8ehaq8DLMb0I/mn2O
 ZrUdl41fHahVc/pVFsgpzvej54Kc8lAn/H4P5yToCkbxFvYmKDWhLf/isgbWddAkrFDc
 O8+1IbmKer7MN7ePQAWESrAgeAmoQgJHCq+pjDK/iMNVipq/DMhcJd3HphFd2Eg57LIH
 imyZVcgWTdSt8lqR9u5Mu4hdsskd5LN3kJSh0CWlBmHpNmVq0QFLoDpnJ+j1Yt1Fqyoh
 eZhEopIL6W5UKBWa6fzB51TVClgpim7LQIVHJ/a93mt7kBUDqOL3/gfG05vxdEnXk7cH
 +/uw==
X-Gm-Message-State: AOAM5310e1asDlu0KDG87R+UG3NmnWxtLN9tmgZ+1QJjW+gMvRSY//fU
 VBQFHSsitR+idt8xrfYMpv9gZ3fkZIsoBY6dp2D9jf6w8bwzwGWiMaP0Uo4+IERYaz+zAycLk6j
 pc55CcMAHYqanJscOTur5BDoS8bkcyrSqfAEGuyy58fXEqfjKdm9GIUrBoZ0C75jG/ag=
X-Received: by 2002:aa7:d04a:: with SMTP id n10mr5978413edo.33.1620938347760; 
 Thu, 13 May 2021 13:39:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMVVhluk0qJApNGdexivYd0DlyAzHir16KWvAjH0nbj4agjbXRAjen+B0OHyesO5jJnQuUPg==
X-Received: by 2002:aa7:d04a:: with SMTP id n10mr5978397edo.33.1620938347486; 
 Thu, 13 May 2021 13:39:07 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id x9sm3105693edv.22.2021.05.13.13.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 13:39:06 -0700 (PDT)
Subject: Re: [PULL v2 00/32] Misc (mostly i386) patches for 2021-05-11
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210512084020.606871-1-pbonzini@redhat.com>
 <CAFEAcA_EkFT2UCgGsgHYrFNZNn0S42aWOzw1DC+9OEzuerFvTw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <93b879ee-3e28-9bd8-f0b2-3ac99033198b@redhat.com>
Date: Thu, 13 May 2021 22:39:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_EkFT2UCgGsgHYrFNZNn0S42aWOzw1DC+9OEzuerFvTw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/21 21:12, Peter Maydell wrote:
> Something weird has happened here.
> 
> I think I applied v1 of this pullreq (merge commit 31589644ba069ba06c5
> now in master), and then when I came along to try to process this
> one the tag was an entirely different set of commits.
> 
> Can you check whether what is in master is what you intended, and
> send a revert/fixup patch if necessary, please?

Yes, it is.  You processed the tag that had already moved to v2, but 
replied to the buggy v1.

Paolo


