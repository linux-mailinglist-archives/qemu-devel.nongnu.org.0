Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3E13196BF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:38:20 +0100 (CET)
Received: from localhost ([::1]:60892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lALXP-0003rR-G0
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lALUk-000389-If
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:35:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lALUi-0004KF-24
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613086531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+G+pWKw+CVDRD6wfq7U61jt8YiI/+XDh/tGe5uZmcKQ=;
 b=FaNzEQK4Lw2h5876Dfk5IZpE8Iz6oE5fcnRmVWDTYAVkJvhEIqpR93xTq8HSKpZoeUjomP
 oXdDPg8jazwevoMjdEoFa8dsZNoxfX1bUqDJCNxbpDaczmOreNxFFYFZlfm8uyTLQXItqQ
 mmqNnA/mVyVT6ypKqBYB7ZfVWH+9FCE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-BJItWh2kOti9nR4IKiYbRw-1; Thu, 11 Feb 2021 18:35:29 -0500
X-MC-Unique: BJItWh2kOti9nR4IKiYbRw-1
Received: by mail-wr1-f72.google.com with SMTP id o16so3394632wrn.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+G+pWKw+CVDRD6wfq7U61jt8YiI/+XDh/tGe5uZmcKQ=;
 b=OGwAjInuFu44pOT358a9jOeEm0e3gZbrNw3R/vZasH5OUiQqXYGP/xSOxbKvvFlBSE
 q3N3T+p359bhaHJOXbriOIWdfFCSfHClaR29Oh2E15pdv1m40NK8HPn8jXi0ek+9MMQ/
 qVdIH06ZCBTz2ihmpZFZj3e3vyB4ksKZTngoB5248mEz/a7uP1k3rvILkPQvrk72cG/l
 fzb4DYrGY1PnIELa+8ka9cAs4/bNog3gAe4KxJ8DJjcfAe/d+JEdzfSXEQWgqtlZAZzu
 sNkj2ZID1OBwcLIVolq5UsKE7IGbSl+jBlKeDo14cMazIg7wus4CjBrOv83r73j/lLM0
 Swfg==
X-Gm-Message-State: AOAM532iurEpp9TcleChQlBPb+8BJgGx6HvdY2kNhLBSgUITcHpeox2w
 JdQ4VFbjCVh+VOFSYpbVkX6oRwjvUjz0ykvMo7dUf29X0vp08UT+Y0hiPZCC08/eBZzJLZESOIF
 aOaeDBFrEUZlbTfI=
X-Received: by 2002:adf:80c3:: with SMTP id 61mr232458wrl.100.1613086528360;
 Thu, 11 Feb 2021 15:35:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxj1kF52z9iKhz62FWfaBweTA/xKT3VsIIfN7vTPFOcdVKJIuT8jEQkoAGW1xijgmCCXUg5tw==
X-Received: by 2002:adf:80c3:: with SMTP id 61mr232425wrl.100.1613086528160;
 Thu, 11 Feb 2021 15:35:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y15sm7210427wrm.93.2021.02.11.15.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 15:35:27 -0800 (PST)
Subject: Re: [PATCH 2/6] Python: expose QEMUMachine's temporary directory
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-3-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <678e8133-afba-533d-9678-ff22604e499a@redhat.com>
Date: Fri, 12 Feb 2021 00:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211220146.2525771-3-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 11:01 PM, Cleber Rosa wrote:
> Each instance of qemu.machine.QEMUMachine currently has a "test
> directory", which may not have any relation to a "test", and it's
> really a temporary directory.
> 
> Users instantiating the QEMUMachine class will be able to set the
> location of the directory that will *contain* the QEMUMachine unique
> temporary directory, so that parameter name has been changed from
> test_dir to base_temp_dir.
> 
> A property has been added to allow users to access it without using
> private attributes, and with that, the directory is created on first
> use of the property.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  python/qemu/machine.py         | 24 ++++++++++++++++--------
>  python/qemu/qtest.py           |  6 +++---
>  tests/acceptance/virtio-gpu.py |  2 +-
>  tests/qemu-iotests/iotests.py  |  2 +-
>  4 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 6e44bda337..b379fcbe72 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -84,7 +84,7 @@ class QEMUMachine:
>                   args: Sequence[str] = (),
>                   wrapper: Sequence[str] = (),
>                   name: Optional[str] = None,
> -                 test_dir: str = "/var/tmp",
> +                 base_temp_dir: str = "/var/tmp",

Not this patch fault, but I see we use /var/tmp since commit
66613974468 ("scripts: refactor the VM class in iotests for reuse").
Can we use an OS agnostic method to get temp storage directory instead?


