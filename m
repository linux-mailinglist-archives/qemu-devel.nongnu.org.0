Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CBC2F6252
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:49:29 +0100 (CET)
Received: from localhost ([::1]:37054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l030B-0006PI-Ix
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02p4-0002Ka-3B
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:37:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02p2-0005iV-DO
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610631470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWecLgTR2D5f1qcRKA8jMpLbs6JoyQa4t2F0MB7sF5I=;
 b=RypC+rCPdpHP3EbHHRMh8skfc8bNoNnQgRXq5akVVF/YsVseBpWl+lTdYNdS0eYDGn4Yx8
 /SDHwEmOw8gZOuARsuSgl4Tmgy70QBVMu2WEtybrWl2ziThEoyWT/DevokxweNUB8bOe84
 qa9b0i17yOPLD4tw7/3M80f/Oxq/5uE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-ThYUR-8bNVqVvyXk4BhMXQ-1; Thu, 14 Jan 2021 08:37:46 -0500
X-MC-Unique: ThYUR-8bNVqVvyXk4BhMXQ-1
Received: by mail-wr1-f71.google.com with SMTP id j5so2606632wro.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SWecLgTR2D5f1qcRKA8jMpLbs6JoyQa4t2F0MB7sF5I=;
 b=bcYqxvIRJrfGe4Et+kN5wbPrWAxnEfrWPQ1S4Mis/kP4vIbD5bB55La1JXfGkjVn8e
 MDwhFiaMk7157AN+12B+O6cTFGHxN2ZU9kXFfyjZh/koQ2Na5sEB3ehfejZrq7VD4zMm
 nFM0rpGQgCX8IrYwFH3hN4c4QcYwyZ0t5KEhGHbI9MgFIfmowh8XE8M2ewcbFA3lJ8Bw
 ZVS75aub1omF8U6Q2RUMbi8yv45ncKqLJusd91QXKGVL28j1GWTyvhCFBbKLJMJdae7Z
 fMP1qZznbC0OnOy69N1olqWfKDvrsMbaxnytvQwIXAaKo/VFBiyWVt47hakSngDfTYOz
 mekQ==
X-Gm-Message-State: AOAM533wpkueeHHsUCzU6fjtLviLbm5egqaBdJKcf5ADu1oGKIOiFdsB
 Nbv3hEV4DENTY+9c9ucC7XISDcyPuQv3MkdtC2QcHVLfcQDTkogQE7Vx25LkrO2D/ZPX/muomJU
 wjsiqI/ZocmR3cpQ=
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr7956364wrs.80.1610631465572; 
 Thu, 14 Jan 2021 05:37:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx16Iy6glhcAOqe2vKs2oPFSEEsFGT9OVxrs84Fm1SLQ40FHZzESiMIcH/dFbCruLdy4Hxjuw==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr7956351wrs.80.1610631465445; 
 Thu, 14 Jan 2021 05:37:45 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b133sm9265359wme.33.2021.01.14.05.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:37:44 -0800 (PST)
Subject: Re: [PATCH v2 22/25] tests/docker: auto-generate ubuntu1804 with
 lcitool
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-23-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <40e909eb-f2e0-a246-1c7b-f5333be29a2f@redhat.com>
Date: Thu, 14 Jan 2021 14:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-23-berrange@redhat.com>
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
>  tests/docker/dockerfiles/refresh           |   6 +
>  tests/docker/dockerfiles/ubuntu1804.docker | 235 +++++++++++----------
>  2 files changed, 135 insertions(+), 106 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


