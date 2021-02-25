Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE47F324E4D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:43:30 +0100 (CET)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFE7F-00089W-V5
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFE5y-0007Xh-OP
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:42:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFE5w-0007oZ-W7
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614249728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLELNZ5FMw6J4z0iKytGOymiuDW68WgnsMFftjnmb3U=;
 b=bLCqwZLIgQPCnvOGuWtaiL53VCYuMkkqP7np44Tat1oG8ljR16qMs9bQbUSIglpiRZciQU
 /rFAD106kzRF9mT95NivTVOTOT62YGorh/Yvf/UYLXSc9r9pxFcc4e6bsFHL4AXXB5tF9w
 DuRQgJ6pyHFPyDxe+xcHheKKy00131Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-XDZLSWIYMJaCCoDpkck4cw-1; Thu, 25 Feb 2021 05:42:03 -0500
X-MC-Unique: XDZLSWIYMJaCCoDpkck4cw-1
Received: by mail-wr1-f69.google.com with SMTP id e29so2470029wra.12
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wLELNZ5FMw6J4z0iKytGOymiuDW68WgnsMFftjnmb3U=;
 b=B6LTBQO16LfcvWZxO/9tqgtecZ2zk34398KwxcOnt/d0b3hOcz/R9v56gAl5Kw5T/S
 Rc6UEgXEvbBZvGyMs8qvB7AE+EXG1fQM2NVjSQZk2e5CGw08tBVyRGcBnSJ+OB8SsGW0
 URq6pnx+prMyJflzbN9xJ3eRUs2goS7GTNethnedIxg7zXrg75s7JPkRfqBysCbiK7nA
 8AGBWsQYWqhnlkZLriYFMFhbCBTsNe7OkgQQ7MypUF+e8B9dZwd66N5YluZKy87Q3b+e
 hNiLKw4OYT7P6L1AXvzLvUoN1ffxM8nUBn19DWAg0Jy65NR2wg2Zj7kyjhqF9EbHnTKj
 ThKQ==
X-Gm-Message-State: AOAM531SADW9SUVUJItbqeF/k8XcvKIjhJUqiWYVmOL4DhsnyHgH7cSS
 76dxFGTj8XTp0uCF/Q1cg0PrBUkS5Kes2/bzACmyOOOuTkFohcOWtzpB1kc9W6xPwxsIKisnM+Y
 GJcAPBe/prJVrpCA=
X-Received: by 2002:a7b:c956:: with SMTP id i22mr2670937wml.85.1614249722766; 
 Thu, 25 Feb 2021 02:42:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjHZny+md3A4rkmBqva8+hrRgJTToTSVwt8zHgw2dpZZvzOvM6kHDDFppl9gmd6MGX55E77g==
X-Received: by 2002:a7b:c956:: with SMTP id i22mr2670929wml.85.1614249722656; 
 Thu, 25 Feb 2021 02:42:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q140sm8013865wme.0.2021.02.25.02.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:42:01 -0800 (PST)
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
To: Nathan Chancellor <nathan@kernel.org>, Gabriel Somlo <somlo@cmu.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210211194258.4137998-1-nathan@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6ac57db8-3866-297a-dc37-87c565b51ee2@redhat.com>
Date: Thu, 25 Feb 2021 11:41:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211194258.4137998-1-nathan@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Sami Tolvanen <samitolvanen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 8:42 PM, Nathan Chancellor wrote:
> fw_cfg_showrev() is called by an indirect call in kobj_attr_show(),
> which violates clang's CFI checking because fw_cfg_showrev()'s second
> parameter is 'struct attribute', whereas the ->show() member of 'struct
> kobj_structure' expects the second parameter to be of type 'struct
> kobj_attribute'.
> 
> $ cat /sys/firmware/qemu_fw_cfg/rev
> 3
> 
> $ dmesg | grep "CFI failure"
> [   26.016832] CFI failure (target: fw_cfg_showrev+0x0/0x8):
> 
> Fix this by converting fw_cfg_rev_attr to 'struct kobj_attribute' where
> this would have been caught automatically by the incompatible pointer
> types compiler warning. Update fw_cfg_showrev() accordingly.
> 
> Fixes: 75f3e8e47f38 ("firmware: introduce sysfs driver for QEMU's fw_cfg device")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1299
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/firmware/qemu_fw_cfg.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


