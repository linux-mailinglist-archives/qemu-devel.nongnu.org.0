Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF222F696E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:23:24 +0100 (CET)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07HI-00017Q-0N
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l072U-0002oP-OZ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:08:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l072Q-0005Pa-Dm
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610647680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5PsAX7CDHe6y/H09pq4GbMLI1pVuIb+ZcWRAtGiRfY=;
 b=b+e7nBqrL/6Fu8emSWRP94gpfmnwYM3eCQ6cUEdYEsqS9M1oQ8HOSuT6cDHEH0rDWCl4SG
 o8zNitcuhbB8J4ld1rejbitXEAMTdcJc2CcMwdKpzcWag6VKvICIo83yfL8tLNW7rm5dYA
 lCjyMetaB6WwErdcOWt66mrKa0qy7Rw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-Pydn2Eu0P5-sCIhIhv1mBA-1; Thu, 14 Jan 2021 13:07:58 -0500
X-MC-Unique: Pydn2Eu0P5-sCIhIhv1mBA-1
Received: by mail-wr1-f70.google.com with SMTP id z8so2957034wrh.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 10:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z5PsAX7CDHe6y/H09pq4GbMLI1pVuIb+ZcWRAtGiRfY=;
 b=UZrsPVxKMsaMfSkag9LPjN+ylJ7KV9FuAQISxKFXo+Vydvz0x11H0GoP1RiLyMD8gv
 P27fIrffUGYHPd1FCd1x3aH5fKLJsGruKRP+jmr8NlD5vPkMtDdsJ/AFak1gzR5yCx1M
 txfEsiUdGx0i5QpToYAoTlo6Qh2bAYI2vKM6UmFSSii9FQFbMuUnTPPZnlFvken6xtRa
 QHKmw6zIqCiayptbXEDOjwT8jGEJrZh5kCoBtZzILbYyPDzWkDwEeIXqhRY78m1BBIwD
 TQgSMJSAA1nbasmiGKfSKxk4RpYxkreh5R925rJhStXcCtFMIquOOcpZ/5uChpqbSTQj
 2P4w==
X-Gm-Message-State: AOAM531mUUMwkDjDchXGulM90yxfcPg6G5C1ixIYNpphNX6Si3iGdx1i
 RzS8xpug+TRWs7AXOkcGBbYDPqRMKpXeZunuxvi/w9EOBXdHMMypufcXdXskDfbOk4il+6OTfMy
 JibaDnnQIBXeOWrab6DmYo9Vrirm3WLRQeDJiwCM175qC+8RYysYv+lDR+fNKC+8v
X-Received: by 2002:a1c:40d6:: with SMTP id n205mr5200802wma.0.1610647677343; 
 Thu, 14 Jan 2021 10:07:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrP8DY5wjhSufx9jntQDCnREl588FPiZElU/ppjY37eQDknZVr0YsiZis+29RVxdW6gQWeGw==
X-Received: by 2002:a1c:40d6:: with SMTP id n205mr5200781wma.0.1610647677088; 
 Thu, 14 Jan 2021 10:07:57 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g184sm9918368wma.16.2021.01.14.10.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 10:07:56 -0800 (PST)
Subject: Re: [PATCH v2 05/12] Makefile: wrap ctags in quiet-command calls
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9221068e-bc4c-3b0e-f28e-55040e2aefca@redhat.com>
Date: Thu, 14 Jan 2021 19:07:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114165730.31607-6-alex.bennee@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 5:57 PM, Alex Bennée wrote:
> For prettier output.

Having commit description following patch subject is not very
practical (maybe this is obvious in an emacs client, not in
mine :S).

Anyhow:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)


