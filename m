Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDB92F6239
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:43:12 +0100 (CET)
Received: from localhost ([::1]:51936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02u7-0000VX-VA
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02oJ-0001eN-5m
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:37:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02oD-0005Ru-PK
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610631425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PU4lB1w6VmBDphNbqrRxRRV/1Id5nzuaKKMmLo21V8k=;
 b=Suf9M0jB8VpXVr/PQyJFsSJb6czdMuHaWr1x8lerWqu+3udwcwElpdrbw+9cvKhJFVl0+8
 ZW495nfdfKOMwoF93maYZcpOaPWOxCGqgyAfk+VqxV9zP/xXKewLjl64ydHmwU0Tv1nrE9
 qYnhmeBhnNrBVGD6kdgzNonMWMlRgCE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-N1GimJ7tNQalo2iVfQy7Rw-1; Thu, 14 Jan 2021 08:37:03 -0500
X-MC-Unique: N1GimJ7tNQalo2iVfQy7Rw-1
Received: by mail-wm1-f69.google.com with SMTP id x20so1916073wmc.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PU4lB1w6VmBDphNbqrRxRRV/1Id5nzuaKKMmLo21V8k=;
 b=LckVPPQmlLe7wwvJCfO0hCibmQ3BiXkV1fxCtkX5Ijlk5BIpuFlOLfR+Suis1BJL2i
 amBD/sc2yburrHf5b2mPT9i8oz8hTCy7F2I3XRHLu1BItoZnXMOJrbzcfgxqSrgWqq0C
 WR6F54c+Vrc39xzhjoJBN4LCt8xUtLXXLkCaBZ1x6VwUna0DsORfPsB07djabV3geXjB
 bBmp9d/tKGRnwpHgv5Zu0HGurDNVNKFdUYDOE8BYK2C+gFay9ec3f3NKmn0BO/oRgGa4
 3KmGMyabBl3yHiltZ/7TkTN8xoZ0GUoLtcIKhZCXTqt8B+d4n+HYyGsLmTywC4LhB1mx
 O94Q==
X-Gm-Message-State: AOAM5333Up649Bag5XhW24yeM9Y4NqVxHfVJtfZwOuvaFk1ze6frnKLZ
 wS0qCr9fFHrNDWEvJ82mGfSIIUrCpDZOiLCq0SsZ0jflaO1Y9xYlByN+nyUXZ72bdPcGVJ3LaRm
 71+vhCvrb3DHsVuY=
X-Received: by 2002:adf:c6c4:: with SMTP id c4mr8195317wrh.348.1610631422209; 
 Thu, 14 Jan 2021 05:37:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNrWXgRnPfYTBYsg0BrEzsnWzUGfNP5Jyw0i8KWM28Ko4M7YjG5B84pZ0GB3tGNFtWZs4OFA==
X-Received: by 2002:adf:c6c4:: with SMTP id c4mr8195311wrh.348.1610631422084; 
 Thu, 14 Jan 2021 05:37:02 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y14sm4937049wru.96.2021.01.14.05.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:37:01 -0800 (PST)
Subject: Re: [PATCH v2 21/25] tests/docker: auto-generate fedora with lcitool
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-22-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ac6a8ce7-bed6-c543-bdf3-b6c3219cfb3d@redhat.com>
Date: Thu, 14 Jan 2021 14:37:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-22-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 2:02 PM, Daniel P. Berrangé wrote:
> This commit is best examined using the "-b" option to diff.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora.docker | 236 ++++++++++++++-----------
>  tests/docker/dockerfiles/refresh       |   1 +
>  2 files changed, 130 insertions(+), 107 deletions(-)
...

> +RUN dnf install -y nosync && \

Yay we get nosync.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


