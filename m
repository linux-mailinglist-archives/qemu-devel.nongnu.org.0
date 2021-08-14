Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6896C3EC3A8
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 17:47:20 +0200 (CEST)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEvsV-0004ow-0S
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 11:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mEvrd-00049J-4D
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 11:46:25 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:34741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mEvrb-00054W-KO
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 11:46:24 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 e13-20020a9d63cd0000b02904fa42f9d275so15786630otl.1
 for <qemu-devel@nongnu.org>; Sat, 14 Aug 2021 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=GTycN65LLoVvkDr2bBP5oVEeC7fsYIAnyGRRZysG8kA=;
 b=o2QRFuGTlctpz2uSyyNZJRMSNggw1VEdCYoB/F7ejhaH9lRutj79WdcOiJESVTrf+Z
 qpTv6OUN2b96G1ek3XGgYl8WEzeGTtUf0yKhCr96Erdwyg2rxDAUr1F7FEcYg6cXBerw
 p1Ul9MZCWFfzMtWi5zFcNQDP0zO7DHDxnGEoeYLYFleFFV2eXmZan1qKqI7i5wsEBhoI
 XRwM/n6oIRpqXzCxEHzOmjhc7EeRi77Mm7jg0asWFz1VsAmMg+lKjMscB06lru9dXzvD
 PsnhpDnzKC1Jiim81PEGn2OBvpZQqSfMRKVsmaLQ2xM6+2SWn96GTyg7oEfywI4wiuSR
 yLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=GTycN65LLoVvkDr2bBP5oVEeC7fsYIAnyGRRZysG8kA=;
 b=EIax7M4+NraWZVCMLiQohPo4MFQIi9kdbG2jsFcj5ZBh7BX/6mOabb2Z6jYOrQWXZK
 n+nBseXKYtDx613jlNp8yvPj5QJG+izGsdQv8D8zJpRen/9NYfEa4JM4kP+HftuOw+Y4
 KZRH9EwS38Uvc2XmMPkmGiFy2SWXhneNHDarxvSxSSuGJP5bpEcWMqFpDPxYySJ7o4TR
 5dGebYWneXRYiH787eWY24hCcwzVENXcsfdr6J5UXM3t37sl4xczhHhf/zH0Edqol67s
 oltEUZxhljGyb/m9l5wck3aIuJANimEYhnEqECLwtSYUbelSfb9OvB6xONyycMxRvOE+
 Ohsg==
X-Gm-Message-State: AOAM532InKVWkPsCgpOskFhOZz3NaD98kPIEUAkkmim9h4h9nezQfjKI
 HXKFWycf4acOTPkd6upj4w==
X-Google-Smtp-Source: ABdhPJxkT0D7p0j+6RrxO32ai56sU3hOYQqS2wlCKdQh3vzP0Mo+3Fk05n+lMsvN9UZthLBXrnzKsQ==
X-Received: by 2002:a9d:4f02:: with SMTP id d2mr6323117otl.332.1628955981730; 
 Sat, 14 Aug 2021 08:46:21 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id z3sm935337oot.46.2021.08.14.08.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 08:46:20 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:3473:22de:5192:40f0])
 by serve.minyard.net (Postfix) with ESMTPSA id E5455180058;
 Sat, 14 Aug 2021 15:46:19 +0000 (UTC)
Date: Sat, 14 Aug 2021 10:46:18 -0500
From: Corey Minyard <minyard@acm.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 3/4] tests/qtest/ipmi-bt-test: Zero-initialize
 sockaddr struct
Message-ID: <20210814154618.GW3406@minyard.net>
References: <20210813150506.7768-1-peter.maydell@linaro.org>
 <20210813150506.7768-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813150506.7768-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 13, 2021 at 04:05:05PM +0100, Peter Maydell wrote:
> Zero-initialize the sockaddr_in struct that we're about to fill in
> and pass to bind(), to ensure we don't leave possible
> implementation-defined extension fields as uninitialized garbage.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Looks good to me.  Thanks, Peter.  I looked through all the other
patches, too, and reviewed those.

Reviewed-by: Corey Minyard <cminyard@mvista.com>

> ---
>  tests/qtest/ipmi-bt-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
> index 8492f02a9c3..19612e9405a 100644
> --- a/tests/qtest/ipmi-bt-test.c
> +++ b/tests/qtest/ipmi-bt-test.c
> @@ -378,7 +378,7 @@ static void test_enable_irq(void)
>   */
>  static void open_socket(void)
>  {
> -    struct sockaddr_in myaddr;
> +    struct sockaddr_in myaddr = {};
>      socklen_t addrlen;
>  
>      myaddr.sin_family = AF_INET;
> -- 
> 2.20.1
> 

