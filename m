Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA330EDD3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 08:56:48 +0100 (CET)
Received: from localhost ([::1]:47008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ZVP-0004Xu-Ji
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 02:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7ZSl-00043c-Fg
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 02:54:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7ZSi-0002Ko-It
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 02:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612425239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=truLr4Q8pUV34BESmkW9nA9YvpXaj7MWMHyFM6GdiI4=;
 b=MMeb2DyljwoJIoKLFloQ8VTCzoG+aC/qFa+2R4bfp5p4ySv6Bf2mNzQ3JaZoydfgChSK+G
 p7CK55GURKFt50mPvuKoMXMbPXeVQVrQ2pnp8dX9pH93ACsrT3l/QV1VdYK/nqwftbWHq9
 UILfO+IxCWbdBAIHYfmdbDGTo3mu2ak=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-gSPmGzl3M0C9AC93P9wpGw-1; Thu, 04 Feb 2021 02:53:58 -0500
X-MC-Unique: gSPmGzl3M0C9AC93P9wpGw-1
Received: by mail-ej1-f69.google.com with SMTP id q11so1998255ejd.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 23:53:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=truLr4Q8pUV34BESmkW9nA9YvpXaj7MWMHyFM6GdiI4=;
 b=BUY02De2aBumZAHY7L2GnHJNK4AdVsX5IJlr+jyXqK6aZ/QBYL/FdPmtRC6HxsSU0E
 EpLU2qR8nyMZWFUuT1mOEUstjXztuOtIz81igGNbNkNtXCDUoaLx+XCi9QU0DhFfQVW1
 1LQE7vI90Ruxmw5MdXhC6CQji5WfwMcTfhRwmqFSj46fhwp/PfSxSgHg75ixU7rty1lj
 BaYYUvRKGMVwzlD53hO5/iRq8PPoLeW67Q2ukkQQfRyz6Z8TE1j2oCMGEX+Cs1NMAwe7
 s878UM52aRwWNtEOSVDC8Dw2OE+xtWo6U+UxD0WSsAifCyiE3UHdTUahmMY3rQUIOI32
 SzRg==
X-Gm-Message-State: AOAM531vmO+jsySA5XRdJaj39zGB21addeCiN4WrzdvHFc/ziCmUaaTl
 zSnI+oB/04m4TS49+OXft5cbqootBYldAmZkypEBeh4MeQVMSkE9kXkE+GzQxSZhqUDhEcdADyy
 Xkvzq7TDtad7GcHQ=
X-Received: by 2002:a17:906:6057:: with SMTP id
 p23mr7002239ejj.281.1612425236769; 
 Wed, 03 Feb 2021 23:53:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrp9FHYudPv/5mggoon6+EZk6HwokN8tAkRpSi3Cf3fGmDfotJzUPk7ccRnVW0y72SZJ74/A==
X-Received: by 2002:a17:906:6057:: with SMTP id
 p23mr7002225ejj.281.1612425236618; 
 Wed, 03 Feb 2021 23:53:56 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id kv24sm1908800ejc.117.2021.02.03.23.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 23:53:55 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Fix the location of virtiofsd.rst
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210203211922.1342203-1-wainersm@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dc02482e-35b1-e7b1-a871-1c4475cecb7d@redhat.com>
Date: Thu, 4 Feb 2021 08:53:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203211922.1342203-1-wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, dgilbert@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 10:19 PM, Wainer dos Santos Moschetta wrote:
> The virtiofsd.rst file was moved to docs/tools, so this update
> MAINTAINERS accordingly.
> 
> Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")

Thanks, but why not directly fix all the files changed by that commit?

> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


