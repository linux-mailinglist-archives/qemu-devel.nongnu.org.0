Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DA942A84E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 17:32:49 +0200 (CEST)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maJlo-00033s-KJ
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 11:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maJjM-0001yc-RR
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:30:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maJjG-0007JU-B9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:30:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634052607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=witJ3OV3FAzlQWv4wSWvicZct9LG64np//sYOiAnqxw=;
 b=JlFHLpc051R/uy61Sbwv/y0ctRAcIiurvXGJ3UP3itnyX97SD1DqPKjEpISUIYQOnkenBP
 nDAlcrW2GqrXATiXk6ToU+hBFgEP0V04i53IfI8gmKfP2QreoECnkUI5UCHsWE6UE7b+Iq
 sDMFRcABVE4KL9GccphKic4XFH+tx6M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-bdt8gqJnPKCZ2znt5eOpyw-1; Tue, 12 Oct 2021 11:30:06 -0400
X-MC-Unique: bdt8gqJnPKCZ2znt5eOpyw-1
Received: by mail-wr1-f69.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso15998803wrb.20
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 08:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=witJ3OV3FAzlQWv4wSWvicZct9LG64np//sYOiAnqxw=;
 b=oyXRMgrzMyaqqj6AuDe5+bMeWIY31yxQyZbWTPkHLXZQxNrVSP31o9u+nfZqfp1zjA
 I68RO7NHcjqc5d2+PSVZ/T3MBjM9i9QuEuXQ6EMOsX0QvMxFPIXN7rGZRh/MPv9zjlcc
 4wB8869PHRRRNk6xz8jUOpl85z7s+VzvW5y6X2+pmn/xdOV/tXuM2RnlNoax7O7MNrZt
 VvghRJlXzgwNphfc1TQSbiTKRpYP/N1pScGIc+ls6GzO5J7xv+eyCD/mJCYgtxKQg0T9
 AR8ZGn2DmCUfNrb3kNTNMsDys0kGaFb1rRxkEqSPGNeqboY9JbLmsqIfMmL7Odlg+X7t
 m3DQ==
X-Gm-Message-State: AOAM532+ccsncMF0sY2Hd/PC53lZ5ao/20oLH4WEMFuY0Xo8zRab853v
 jgBnUvqzDSum6kcU3r9K5YsPTicvvfHWkZLcqDYgm4G2i3RGTxnIsbMlyrSIN6czA4ragun0LRN
 qBNgMZGYxBMn82OU=
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr6541150wmd.96.1634052605515; 
 Tue, 12 Oct 2021 08:30:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKcyx7brunYqQxbRMbKEXhdkA0ad2XKxrdY1rypD2nKLIz3bTvinB/1V1npYVKSo41KVyv+g==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr6541119wmd.96.1634052605319; 
 Tue, 12 Oct 2021 08:30:05 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id x21sm2801968wmc.14.2021.10.12.08.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 08:30:04 -0700 (PDT)
Message-ID: <4a95c13f-1b2b-0c67-bf84-c4f5280c1741@redhat.com>
Date: Tue, 12 Oct 2021 17:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 11/17] python/machine: remove has_quit argument
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-12-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20210923004938.3999963-12-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.09.21 02:49, John Snow wrote:
> If we spy on the QMP commands instead, we don't need callers to remember
> to pass it. Seems like a fair trade-off.
>
> The one slightly weird bit is overloading this instance variable for
> wait(), where we use it to mean "don't issue the qmp 'quit'
> command". This means that wait() will "fail" if the QEMU process does
> not terminate of its own accord.
>
> In most cases, we probably did already actually issue quit -- some
> iotests do this -- but in some others, we may be waiting for QEMU to
> terminate for some other reason, such as a test wherein we tell the
> guest (directly) to shut down.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/machine.py | 34 +++++++++++++++++++---------------
>   tests/qemu-iotests/040         |  7 +------
>   tests/qemu-iotests/218         |  2 +-
>   tests/qemu-iotests/255         |  2 +-
>   4 files changed, 22 insertions(+), 23 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


