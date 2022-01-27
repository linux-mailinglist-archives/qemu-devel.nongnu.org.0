Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6020349E849
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:02:24 +0100 (CET)
Received: from localhost ([::1]:57762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8AB-0002PO-Bx
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:02:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nD72V-0003n4-0R
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:50:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nD72S-0000Ne-Cf
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643298619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbMEJlVIIuB7/B7c1Md6rKGBzoUm5fvDzNVaqtpUVYg=;
 b=hqoswrwpxvxvts0GTX/fGixiiOw1oScXkVuY7RuVyncCRpyAXjg9XXYHnu5WH/1IuIbWeL
 B/wtTaxNsX5Vfumk2CjzBQ09jZwNreYHoWrnDNyXnDBLOBd+AlYbTwfUrI7XuD4FsrG0Mj
 YRf8REnORNA3YFXlYjUfSGgl+CPmpns=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-_7cQPmqbO8Wo2Ui8mw0iOA-1; Thu, 27 Jan 2022 10:50:17 -0500
X-MC-Unique: _7cQPmqbO8Wo2Ui8mw0iOA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o194-20020a1ca5cb000000b00350b177fb22so3611763wme.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DbMEJlVIIuB7/B7c1Md6rKGBzoUm5fvDzNVaqtpUVYg=;
 b=Vm/HdO4akrgwm8mWGonMtJ1qFD6XoraOTDQBvIzJQ0kjDdus0LFpm2mgtinjHCZlZ/
 BzB0IQrdzZo4ziXRXGrQQwLBfdJhpFoDmrMcLSjkEUYzD5cv9StzNspIafqi8EcbN9Rz
 hP1ZWaQs4pOaKQwV9jt59iTCRt9eRNSl6Lrl+zlizFimpQoXyLSsOVUQge/7QtayBqJ4
 5VxhyRA7m94QIBKFWoEs/DaqiQKJhkziCc24frGSFHhJk1fXk8iQwcIY3kGWvnaZIjtW
 rjlEUD+/p8jNP33pJUqATzG8S73rGClf8O6KGfFI31WeZ7swpf1RnRGi1XIdbWz/7Xbw
 skYQ==
X-Gm-Message-State: AOAM532t+qiZbk+ev/tGct1dKRm7rVpYW7MuExKIN1VIXXuNsX4qcK6T
 /TzEM4hBZQSntdUI9FRt3uQFi+nPv15m6iOQMgKTRRn6wixnAuvzPternGdr27ARYYfzNd3kOpr
 G5rf3pRZNPIneAeg=
X-Received: by 2002:a05:600c:298:: with SMTP id
 24mr12077472wmk.100.1643298615982; 
 Thu, 27 Jan 2022 07:50:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbtmDblTZyhBs6qql/Y7qgMsOMsRhoW+Xooh+aObPmFlYqvl2HFwfthTBRFJ98Zj5dJRYhIg==
X-Received: by 2002:a05:600c:298:: with SMTP id
 24mr12077453wmk.100.1643298615805; 
 Thu, 27 Jan 2022 07:50:15 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id j2sm2669619wms.2.2022.01.27.07.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 07:50:15 -0800 (PST)
Message-ID: <7fdc4464-5083-5726-61da-26214759b471@redhat.com>
Date: Thu, 27 Jan 2022 16:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/4] python/aqmp: add socket bind step to legacy.py
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220124180626.627718-1-jsnow@redhat.com>
 <20220124180626.627718-5-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220124180626.627718-5-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.01.22 19:06, John Snow wrote:
> The synchronous QMP library would bind to the server address during
> __init__(). The new library delays this to the accept() call, because
> binding occurs inside of the call to start_[unix_]server(), which is an
> async method -- so it cannot happen during __init__ anymore.
>
> Python 3.7+ adds the ability to create the server (and thus the bind()
> call) and begin the active listening in separate steps, but we don't
> have that functionality in 3.6, our current minimum.
>
> Therefore ... Add a temporary workaround that allows the synchronous
> version of the client to bind the socket in advance, guaranteeing that
> there will be a UNIX socket in the filesystem ready for the QEMU client
> to connect to without a race condition.
>
> (Yes, it's a bit ugly. Fixing it more nicely will have to wait until our
> minimum Python version is 3.7+.)

I mean.  Looks good to me?  Not quite enough for an R-b, I’d say, and 
you don’t really need an A-b from me on this, but looks good to me! O:)

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/legacy.py   |  3 +++
>   python/qemu/aqmp/protocol.py | 41 +++++++++++++++++++++++++++++++++---
>   2 files changed, 41 insertions(+), 3 deletions(-)


