Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E229040F906
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:23:11 +0200 (CEST)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRDpe-0001jb-Cy
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRDoK-0000aE-27
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRDoG-0002Cu-Kh
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631884902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S9Qv4hABT4rCfHlbPbHD3TihYA+ggytrIx86sS6wae0=;
 b=CXj9sqzver2lWFrOFMs0u7t5dSjmwbBN3MB1FuctnkOSVA1JcQkl2Hr1DD/mwpy6IdiCpf
 NITUFgbTtzPunnJAWawR/+5s4BZCQX5gL9ECGHk4rxy3vQNQknZFdtojn1JAicxqLlFLJm
 pGHwCcisiJNqWyWnOTJguWDjs7BGXt0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-2o6_sL9uNnOKsXaFP9mv8w-1; Fri, 17 Sep 2021 09:21:41 -0400
X-MC-Unique: 2o6_sL9uNnOKsXaFP9mv8w-1
Received: by mail-wr1-f72.google.com with SMTP id
 m1-20020a056000180100b0015e1ec30ac3so3710867wrh.8
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 06:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=S9Qv4hABT4rCfHlbPbHD3TihYA+ggytrIx86sS6wae0=;
 b=jS8/9Mvd87i5IVZU8DV/8wrlcy/eXGULyaHLS3Z907IhWY59m5px+gma6Xq2JgBB98
 7B2G8GQ5FThYq/Mm+VGRturKFuge2EvD0qOTZB1qXISF0oreDw5xoqEQ0TCw4kdmCbHn
 hNVxmVmkA/JxbuZtj/0WwZQCXs9R5HdNzO07zoHDB2b/fr7wunji9sAb2NVK8o3kBx8t
 m+CCBR7qvptkX944upgv2tvXiG3GvwJ+vanjRY32kfpZProfOm1wh5M4CYzT17XU5Rxq
 a74JUnF62gBczyhYwUEAK2GMQEMrs/XDlMc8MvZNPG+bo35Cpg98OZP9i+MVsRbUessl
 ZfCg==
X-Gm-Message-State: AOAM533g8MslgnyplwIPAx33EdlZGVIeFhu3OFYX6U4wA4ZyBylb1wht
 HDLcCWiPBjCtOoIpLytywvzEbR17U/3ECKALk0QRjpsL1KfU4mx21SpCm+L2FML/6u3ubjjLGn9
 E8Lsak/bur38pOuc=
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr15163639wmd.36.1631884900352; 
 Fri, 17 Sep 2021 06:21:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0oI55DoELbCCrnq4STghuZ1k/Rwtdzy7qKeU2aBdf9VmQVWnhYS+E5/ad5wNXsFa0SPTrLQ==
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr15163612wmd.36.1631884900028; 
 Fri, 17 Sep 2021 06:21:40 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id m29sm7254691wrb.89.2021.09.17.06.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 06:21:39 -0700 (PDT)
Subject: Re: [PATCH 05/15] python/qmp: add send_fd_scm directly to
 QEMUMonitorProtocol
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-6-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <0d227ccb-f6d8-3382-8f51-b3eeede9d8ef@redhat.com>
Date: Fri, 17 Sep 2021 15:21:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-6-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 17.09.21 07:40, John Snow wrote:
> It turns out you can do this directly from Python ... and because of
> this, you don't need to worry about setting the inheritability of the
> fds or spawning another process.
>
> Doing this is helpful because it allows QEMUMonitorProtocol to keep its
> file descriptor and socket object as private implementation details.
>
> *that* is helpful in turn because it allows me to write a compatible,
>   alternative implementation.

Bit of a weird indentation here.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/machine.py | 44 +++++++---------------------------
>   python/qemu/qmp/__init__.py    | 21 +++++++---------
>   2 files changed, 18 insertions(+), 47 deletions(-)
>
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index ae945ca3c9..1c6532a3d6 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -213,48 +213,22 @@ def add_fd(self: _T, fd: int, fdset: int,
>       def send_fd_scm(self, fd: Optional[int] = None,
>                       file_path: Optional[str] = None) -> int:

[...]

>           if file_path is not None:
>               assert fd is None
> -            fd_param.append(file_path)
> +            with open(file_path, "rb") as passfile:
> +                fd = passfile.fileno()
> +                self._qmp.send_fd_scm(fd)

Seems a bit strange to send an fd that is then immediately closed, but 
that’s what socket_scm_helper did, and so it looks like the fd is 
effectively duplicated.  OK then.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


