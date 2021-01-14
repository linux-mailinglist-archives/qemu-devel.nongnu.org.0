Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA222F69C4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:41:07 +0100 (CET)
Received: from localhost ([::1]:34160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07YQ-000710-SO
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06m8-0005CQ-OV
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:51:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06m6-0007br-Go
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610646668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/1xiO+VL2p8FozT0g7o4YQX0c9cSbZk39bLSXlskQY=;
 b=BoO1OSDYhhVgfM0sU4V++F+WtCGq96jf4HHNeqvQ7+Q38uzpG+TNTEq4L25aBA/3TphAh6
 Rk4nN03NNIrIGHqQbX1nrJsh8dSctTy1uIbYZgAYhIvqF9qtvurDrToe0CofUIJUP9ASAM
 iIW4V6bSqLumxvrbHR8eE6g0I0Lh7Ww=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-uGZNTYJgOdqWR5R9j__pVQ-1; Thu, 14 Jan 2021 12:51:07 -0500
X-MC-Unique: uGZNTYJgOdqWR5R9j__pVQ-1
Received: by mail-wr1-f72.google.com with SMTP id q2so2930836wrp.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 09:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k/1xiO+VL2p8FozT0g7o4YQX0c9cSbZk39bLSXlskQY=;
 b=GLC+tCde7SNMXcLhO7lMlhsM8jOX+y0o/WCyTbysIvl7jByQJCET0AFh8Y1AqCWjSz
 zJXvNflgapLXymwJQZEfrcNTkztlp2u8nMqpxSDGC3rjXCxZCxS1OoRJANmS9sQmmvsx
 AccI+LE602svoSYHxEUkodcbcOYUAsRxO9O4zJOIUFiaMot6HCNQ1v9d4odrqktIXzfl
 kMgv84EFoBqNRcREHPC37CX3Einn6Ps6deL2hZb/lZosE9bqJZh9ZnZttlUvGxyPB5kQ
 AWmrFCRidsmS6NUjup+AICRivEblqZh9ce9ZnCL7W6541kojHrF1WvAsAxU03N+rn4i2
 Ui2A==
X-Gm-Message-State: AOAM532xSEVHZUnU39Y6R5sxVvvnFkF17ePS55lKGIrA5lucuRpONbHC
 kaIs90sGw7WQ5bbZ4g7QeAZjEOuDVvOfXqgG88n/X/bDUuZDRf2CtUpImkhdaHycxZRlTABL1jr
 +vTa2WrsuAK1xa30=
X-Received: by 2002:adf:fad0:: with SMTP id a16mr9451404wrs.390.1610646665990; 
 Thu, 14 Jan 2021 09:51:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwd7V1rGiOSR2It46mN34KY0bvZXJ+SArqQBzDKCBE70dnvGgP9LGGFvF/nKfQmWAJuzO/7Lw==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr9451394wrs.390.1610646665883; 
 Thu, 14 Jan 2021 09:51:05 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b10sm9802429wmj.5.2021.01.14.09.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 09:51:05 -0800 (PST)
Subject: Re: [PATCH v2 04/12] Add newline when generating Dockerfile
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8304a9a5-b037-2ba8-1965-ab8c9f5c483c@redhat.com>
Date: Thu, 14 Jan 2021 18:51:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114165730.31607-5-alex.bennee@linaro.org>
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
Cc: Alessandro Di Federico <ale@rev.ng>, Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 5:57 PM, Alex Bennée wrote:
> From: Alessandro Di Federico <ale@rev.ng>
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <1610080146-14968-36-git-send-email-tsimpson@quicinc.com>
> ---
>  tests/docker/docker.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


