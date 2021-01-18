Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DEA2F9BF1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:43:10 +0100 (CET)
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1R41-0005N8-TT
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1R2a-0004Vc-AO
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:41:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1R2X-0006kl-Nn
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610962896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RK/GHwVnIsKFl5HYTBp/hacekTXz1maNcQXoruESCDo=;
 b=EA1oQCbz1WU9SQe2MnB1X+KIQlw+4FfUsh42tbN4zNacgZBWd+XGY/6/IVkXQ/Mu8fm5eD
 hTIL0jqDj1pS3l31GAAtIqr7sGja9+xjvJ7BO1Nl7z+8MXLRK9KhDrhvy+N5J++Vj+sru+
 ikqcZPcCHtDkKr+OTZobAuzoaze8sL4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-O90S2mofNSKxvj0t65K4bQ-1; Mon, 18 Jan 2021 04:41:33 -0500
X-MC-Unique: O90S2mofNSKxvj0t65K4bQ-1
Received: by mail-wr1-f72.google.com with SMTP id 88so8003911wrc.17
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RK/GHwVnIsKFl5HYTBp/hacekTXz1maNcQXoruESCDo=;
 b=cEfgkm1946oJnlio9harozWvxRUFrFIw+YV4eQMHubxoCA8+dqAivlzUjgQoCcJZb8
 kiuTePus9ex2Kulu26YM400N0ka4FaWXGGrnW/6VytcVNJbVMBCo6AVDS1RP9SY+u+nG
 iTRSoss78raHhTwoS8H/v2ZQLlo1NX1w1RpCw/DDxByyEhZkzloe+XoFYoBZJAVQUlEF
 f49CnjPRBZDP0c78b/jCnXpa+/vHmevW8xn5tFuH7bQVMPKhZolzfEGqhadDgrfFcew/
 hSyHSl2+Uo/xq+FOV+Qbf9moE9ptNL+ao6E3EIn+1/D738IZ8+Q195sPnwuJ/mX+rEcM
 WtNw==
X-Gm-Message-State: AOAM530oV4OZUN2VOVEdWJ5w8ZdoYwz6lHLE99fh3igY7Y7Txa57dTju
 GK3wq11rmsSEJZInEZFPAJxWKvOdKyf5nZ1eigalUb1WPx9vJ/+/Gp2Yjz38pnbk5VVrB7yprdZ
 6IrFvDLsHWWbUTEo=
X-Received: by 2002:a7b:c849:: with SMTP id c9mr19706464wml.11.1610962891963; 
 Mon, 18 Jan 2021 01:41:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBvRFWZht/IHZvozu0wO6u/1uswFcf9xvWp4osS0W4KzXLCffBO3VyCqDeYcPFpuuEvRlgoA==
X-Received: by 2002:a7b:c849:: with SMTP id c9mr19706453wml.11.1610962891842; 
 Mon, 18 Jan 2021 01:41:31 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o124sm26126427wmb.5.2021.01.18.01.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:41:31 -0800 (PST)
Subject: Re: [PATCH v2 3/9] osdep.h: Remove <sys/signal.h> include
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-4-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f1ea6ea8-0ade-6f6f-ff30-99c0df6bf82b@redhat.com>
Date: Mon, 18 Jan 2021 10:41:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118063808.12471-4-jiaxun.yang@flygoat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kvm@vger.kernel.org,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Michael Forney <mforney@mforney.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 7:38 AM, Jiaxun Yang wrote:
> From: Michael Forney <mforney@mforney.org>
> 
> Prior to 2a4b472c3c, sys/signal.h was only included on OpenBSD
> (apart from two .c files). The POSIX standard location for this
> header is just <signal.h> and in fact, OpenBSD's signal.h includes
> sys/signal.h itself.
> 
> Unconditionally including <sys/signal.h> on musl causes warnings
> for just about every source file:
> 
>   /usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
>       1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
>         |  ^~~~~~~
> 
> Since there don't seem to be any platforms which require including
> <sys/signal.h> in addition to <signal.h>, and some platforms like
> Haiku lack it completely, just remove it.
> 
> Tested building on OpenBSD after removing this include.
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> [jiaxun.yang@flygoat.com: Move to meson]
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  meson.build          | 1 -
>  include/qemu/osdep.h | 4 ----
>  2 files changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


