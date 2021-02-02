Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6696430C3E8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:36:03 +0100 (CET)
Received: from localhost ([::1]:58130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xik-0000wp-F7
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6xen-00065L-Uk
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:31:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6xel-0007N1-JS
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612279914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfWCIrPuKE1ojaV9GRKTdok05S6ev3vkZumI7DGuKtE=;
 b=W3QhUwCL08940dnm4HkZUEpMkWQytIKJBmghW/XSAgYRlcRMbOOjTWa1mVg3yegydJSKGg
 CWit88BF1hEvrPiN3hqeJfR/mDfSZkubZbXuIZsNjyzZxlEAqeqVkwpqEwD6bKNh2dHWd8
 Y/suzIWqEzZ02XFGtBUk7R2/UWWgttg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-NBZBE475PAOU44OhNAiqeQ-1; Tue, 02 Feb 2021 10:31:52 -0500
X-MC-Unique: NBZBE475PAOU44OhNAiqeQ-1
Received: by mail-wm1-f69.google.com with SMTP id u1so1618204wml.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dfWCIrPuKE1ojaV9GRKTdok05S6ev3vkZumI7DGuKtE=;
 b=JOByMhatDQZ1R1QN0D+0pXUZFRC30iwNRf/iHGFFUf9LyB/I31gWGdYqIP/IU+C4FW
 sSeg5c2eOKT1MZ4pdFfdBHocA97DabMLLwBIMmAfXCKJXYgA4sOqlr76oQCMu5VAy1UQ
 Itz4HpV23XVsNBpEgoUdvg49gU9Ki7JGMx2wOiEhySSCbtR/NcpkK/1LPd1i29+u28XP
 h/xUrFuPzLVSknqlcz8iBxDUce483eSPvlumPe6H8f9X++5jFXDPO97T3qcHHzGCMCJc
 etRqFtm4JXL9fZDYqtJsWY+j9jWyACQG0hbCSF5fS0Ie68W7PG+ef83q+jWOAj6zNybK
 jQSw==
X-Gm-Message-State: AOAM5337aYQLY0W8tfkLykSun5gHCNFbiOtjMVHaRU0EYKSSoOgM87vZ
 MzleVkd585SMechihjYgLlkW5KhXZZuv3LFms9jgecx53hC/hyjLp9VJ22w1zrmCwMIbqzwbUMp
 L9ld1LDAls+b7E4s=
X-Received: by 2002:adf:eccc:: with SMTP id s12mr17984613wro.383.1612279911579; 
 Tue, 02 Feb 2021 07:31:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy94a0qB/vcOpTuOXvEVChmNvQx9H3BN4V9iO29eH+iQei/39WcQKQST1rzfaSYYnQYQ4TwZA==
X-Received: by 2002:adf:eccc:: with SMTP id s12mr17984598wro.383.1612279911428; 
 Tue, 02 Feb 2021 07:31:51 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id c18sm5477206wmk.0.2021.02.02.07.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 07:31:50 -0800 (PST)
Subject: Re: [PATCH v4 05/23] exec: Improve types for guest_addr_valid
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a52264bd-2f06-0ddb-8bdd-63b7854aa2fa@redhat.com>
Date: Tue, 2 Feb 2021 16:31:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128224141.638790-6-richard.henderson@linaro.org>
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
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 11:41 PM, Richard Henderson wrote:
> Return bool not int; pass abi_ulong not 'unsigned long'.
> All callers use abi_ulong already, so the change in type
> has no effect.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


