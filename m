Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604463E54A0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 09:53:31 +0200 (CEST)
Received: from localhost ([::1]:42068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDMZm-00042i-Es
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 03:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDMYk-0003FE-H9
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 03:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDMYh-0002fx-2b
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 03:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628581941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wPRoVfml7cSDAY7lNHhfzlrHQESElDDst9p5BT53RX0=;
 b=HtkC/eKBA3Tkz7PuDc2F/P5Oj/DcurxYkjlQpK+8yUvtqMGKIMibKEMsURcgcz0BB/Hrsk
 H9sD7VMktZyjjh7guo1/WgsY7rgETyClLye3wsl151DgK/wxqUUHVuNbceUbaTP2NS42bC
 WThxujy4zn82T0QMsQ62guY+UcBTd6g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-ZbDVVWOmNgKeCnLcd-3g3Q-1; Tue, 10 Aug 2021 03:52:20 -0400
X-MC-Unique: ZbDVVWOmNgKeCnLcd-3g3Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 z10-20020a5d440a0000b0290154e0f00348so2656344wrq.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 00:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wPRoVfml7cSDAY7lNHhfzlrHQESElDDst9p5BT53RX0=;
 b=rO47wNbUA8x6ncRZKVUgbcE6osO2gOHjNhpVRzTHR6WYNyWniARgejhVdUEdJ7hnYu
 AdmXbkeC/7dxgD/RvwtmkkJydIwaswrV8ZcmyaPx3/L0xXtd9SYsjbhtA/93XMRbCExr
 1tsNCV62fFDVWIyfX23qDjngYaS27w2ZDEv5Jtizy/ASfZpUwxr7Fn62wgFRPZJmf/Za
 mFX0nfYmvQEpm5wGJYbNci7zaaJnpGE3lXp4UYidS7OSM7DrslBhQfZKOPrsgr7rQRt3
 jVfNOPsz42UTgJO2VBiX9Blhs1H7D2NyA4bnFkpIRIZALKFHVcqW7/sHZog50G/jgJ0C
 ELaQ==
X-Gm-Message-State: AOAM533zDdmPeP7d7zyX07KRtE1PzX2QpZ1bECweiLgut9+MEwocxgWG
 L++5ps+De/9G/UQXd2HJaiaXcYBvQ2SUbrtr9zsoXF19Oth/bftifhwGz1514MKlW4sx/xGZFXB
 fSLnA2WJR29YCV4w=
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr30033247wrq.204.1628581938911; 
 Tue, 10 Aug 2021 00:52:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDM9Xi7Kw5wst4+3tIVtP/zAeRV1hCmkaqUJ062wz2XUOQ+cGHrMVlddNyRlMX3RTIMYNI3g==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr30033221wrq.204.1628581938623; 
 Tue, 10 Aug 2021 00:52:18 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 j6sm7761776wms.44.2021.08.10.00.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:52:18 -0700 (PDT)
Subject: Re: [PULL 0/2] Block patches for 6.1-rc3
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210809170319.740284-1-hreitz@redhat.com>
 <CAFEAcA_NujZgkjPzV0WDvuDuxAJn3qCGPxRRKCLeYXHWPcQX4A@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <c0aee195-bc31-8ea2-f49f-2193b77cd7e9@redhat.com>
Date: Tue, 10 Aug 2021 09:52:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_NujZgkjPzV0WDvuDuxAJn3qCGPxRRKCLeYXHWPcQX4A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.08.21 20:43, Peter Maydell wrote:
> On Mon, 9 Aug 2021 at 18:03, Hanna Reitz <hreitz@redhat.com> wrote:
>> Hi Peter,
>>
>> Let me prefix this by saying that it's me, Max.  I've changed my name
>> and email address.  I understand freeze may not be the best of times for
>> this, but it looks like I can no longer send mails from the mreitz@
>> address for now (only receive them).
>>
>> I've tried to create and sign the tag as Max, so I hope this pull
>> request won't run into any issues from that perspective.
>>
>> (For the future, I'll create a new key and hope signing it with my old
>> key will make it sufficiently trustworthy...)
> Yep, that's fine. This pullreq is going through OK (will send the
> usual applied/errors email once the builds have completed). I'm happy
> to treat signed-by-old-key as trusted enough. (In fact we already
> are working basically on trust-on-first-use for new keys, but if
> you're OK with signing your new key with the old one that does
> simplify things a bit.)

Great!

> Do you plan to send a patch to MAINTAINERS ? It has some
> mreitz@redhat lines in it currently.

Yes, I do.

Hanna


