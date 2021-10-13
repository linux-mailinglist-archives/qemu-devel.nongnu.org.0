Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51942BF40
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 13:52:43 +0200 (CEST)
Received: from localhost ([::1]:47470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1macoM-0002sV-Fa
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 07:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1macmI-0001sJ-Ir
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1macmE-0007Iz-Hj
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634125812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hrbn/5+jWc/z8qn8Ng+pO/WeJo1D7CHe1yANL+Cst7g=;
 b=F8ajUfZZQaUetZsJB4dNiDNqaBP27j0X8g3BCyc5KKLbReTL7znZFiLrhfF5WuKcvNB2Rq
 MBYLpl0yR8kXzqSTSGYpPWP9Z2S82thu/gi1f4WZDWmEPYM28m/WYNeKL3y5XZ/ccgAdMz
 IrXge1WOudV0Jwp3bIE3pP+rLHjTh8E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-PWAAIgdIPsSxXzCa6FmH7A-1; Wed, 13 Oct 2021 07:50:10 -0400
X-MC-Unique: PWAAIgdIPsSxXzCa6FmH7A-1
Received: by mail-wr1-f69.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so1764833wri.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hrbn/5+jWc/z8qn8Ng+pO/WeJo1D7CHe1yANL+Cst7g=;
 b=fle2NKK0C+nP3dOWQ29TkWotGz39x85YvYMfTIM2PyNxx6MDljPB5QlrcLD66Qw1os
 GOv6KFTvPgKRWQC7gcxrO1bXAJJP6ddDVSd6Y27wU6iyMSOBlnxrojQtRQg7vxZhj0XZ
 k9lH6lUivzhUX31x/DpaLAsRKk3A36PJSO9R1mfCl0U6+Y45XM/HA+1PNLASJWBQrUhx
 W038/eCRsrGVbQr6ByBYBsQLgI6x2gAxMMcppqIb/As5XjtJcbNClnn0rzWWAiKl90H2
 VbsZWAD5CPXPQfT+bI7SOVx/2Fsu9f6uiaVvY1tEBBsk19qYuFOUxT4mANBjSXMSoTpm
 sZBg==
X-Gm-Message-State: AOAM532hrSGovlzn83iV0HxBiPSL25QZWE6O+n1QfWva3NRVYaIkMhOq
 hg3XzPFcxK68zigvhdO0pYl7AMdgmv8FzCzXWpq791cN/7Zj8yDmFbMPQ1pW3emraJRTKE/QpJp
 KWQZI1DFoF0+IpIk=
X-Received: by 2002:a1c:808e:: with SMTP id
 b136mr12268680wmd.178.1634125809258; 
 Wed, 13 Oct 2021 04:50:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlbgXQOdOQ5rqHds6r2ytIzFYAZJtlGaUHDU0+got0cGvJTIMl1sYpcKkz5H/04bPfPJHQTg==
X-Received: by 2002:a1c:808e:: with SMTP id
 b136mr12268636wmd.178.1634125809005; 
 Wed, 13 Oct 2021 04:50:09 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id o11sm6578945wry.0.2021.10.13.04.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 04:50:08 -0700 (PDT)
Message-ID: <bbaa0613-3b95-84d8-52ae-c53b1175d096@redhat.com>
Date: Wed, 13 Oct 2021 13:50:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 09/13] iotests: split linters.py out from 297
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-10-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-10-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 23:04, John Snow wrote:
> Now, 297 is just the iotests-specific incantations and linters.py is as
> minimal as I can think to make it. The only remaining element in here
> that ought to be configuration and not code is the list of skip files,

Yeah...

> but they're still numerous enough that repeating them for mypy and
> pylint configurations both would be ... a hassle.

I agree.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297        | 72 +++---------------------------
>   tests/qemu-iotests/linters.py | 83 +++++++++++++++++++++++++++++++++++
>   2 files changed, 88 insertions(+), 67 deletions(-)
>   create mode 100644 tests/qemu-iotests/linters.py

I’d like to give an A-b because now the statuscode-returning function is 
in a library.  But I already gave an A-b on the last patch precisely 
because of the interface, and I shouldn’t be so grumpy.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


