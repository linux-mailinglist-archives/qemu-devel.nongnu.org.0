Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39A49E4E2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:44:15 +0100 (CET)
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD60U-00088e-Ee
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:44:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nD5fW-0007vD-4Z
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nD5fQ-0003Pi-Gd
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCKl48lWaDOvwCyOR8KBRAXJjndzxy/6z+gFJEOfqsU=;
 b=f8NgyE7ZCu45DObgr3Y12yz1AAOFgn17mn+8DETRg8AtaHJ3j8SMKP+agbAlpCZZKWY07A
 snjaJDaDGI4+8Zd5yK00hG0L0M6wNYkYPAz0YADqtHXaTbG7+0kdePguuwwvDjwEfLo6V9
 dqgiCwxI3/HeNo4xOFaiRuTex5wY5+E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-SeBslIMmNfiZoRolmiJbeg-1; Thu, 27 Jan 2022 09:22:26 -0500
X-MC-Unique: SeBslIMmNfiZoRolmiJbeg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i26-20020a1c541a000000b0034dc8bd7078so690605wmb.8
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GCKl48lWaDOvwCyOR8KBRAXJjndzxy/6z+gFJEOfqsU=;
 b=iVUGCMZKCHkGEScpn18YeQnnu5QNeNkuiy7qByL4StW0ump4A3WD3euG42qibMkOyu
 2/I51P+9FjupYte4M32wuaTSdhbr6Hfb2vqsKSRla3zhgKIFshKe5IKL6E4YPsdFhEXf
 F52gp7tnr1A5A6AA3sdX3ZkWRLEvCYkS2wgCQJcEXQFyN80rD7RcTPF96mB0cKkHJeUa
 JnMUN9ZQ/IJfvGFYbDcnyumUV0E6So66s1ZvbwbqzFll8eg8LcuA8MhEDOK1HkuGQPbM
 xsEU094aNiXGLsyndzVtU6qzU9HbtNaYvy28qmw+d+tnFy8C3U9Qnibv7KOj/8bxpa6w
 baOQ==
X-Gm-Message-State: AOAM532U5xSSll5/HFXzwnC7hWg0ilJsRzDPa85MT9VqkTCO92xJjkaT
 o09yJHvteUE+Ic9/w0tgHEDxuDzy77DzgHxo62n4TJmhxlWZ4anWj6Nl9oE7b2XxoDRzIOG4M36
 zZclkprqLwrj61zM=
X-Received: by 2002:a5d:4081:: with SMTP id o1mr3274025wrp.52.1643293344780;
 Thu, 27 Jan 2022 06:22:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOVEDoCUMImkJInL239L76br1RRrDnDl/kuD3l/Mtlxp7G85XkPWW0/zQdPOj2F0m7o9qBOA==
X-Received: by 2002:a5d:4081:: with SMTP id o1mr3274003wrp.52.1643293344441;
 Thu, 27 Jan 2022 06:22:24 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id bg23sm2867969wmb.5.2022.01.27.06.22.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 06:22:24 -0800 (PST)
Message-ID: <852c6011-eb3c-2753-2814-364dd3188278@redhat.com>
Date: Thu, 27 Jan 2022 15:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/4] python/machine: raise VMLaunchFailure exception
 from launch()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220124180626.627718-1-jsnow@redhat.com>
 <20220124180626.627718-3-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220124180626.627718-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.01.22 19:06, John Snow wrote:
> This allows us to pack in some extra information about the failure,
> which guarantees that if the caller did not *intentionally* cause a
> failure (by capturing this Exception), some pretty good clues will be
> printed at the bottom of the traceback information.

OK, I presume in contrast to unconditionally logging this on debug 
level, which is less than ideal because on that level it’s most likely 
hidden, but that was exactly the point, because we don’t know whether 
the caller will catch the exception, so we mustn’t log it on a more 
urgent level.

But by creating a new exception class, we get a reasonable log output 
exactly when the caller won’t catch it.

> This will help make failures in the event of a non-negative return code
> more obvious when they go unhandled; the current behavior is to print a
> warning message only in the event of signal-based terminations (for
> negative return codes).

I assume you mean the one in _post_shutdown()...?

Confused me a bit, because for a while I interpreted this to mean “We 
don’t output anything in case of a positive return code”, but it means 
“We don’t print any details in that case, because the exception we 
re-raise in launch() doesn’t contain valuable information”.  Makes sense.

> (Note: In Python, catching BaseException instead of Exception is like
> installing a signal handler that will run as long as Python itself
> doesn't crash.

This really confused me, because I can’t really understand this at all.

But I guess what I took from googling was that every exception object 
must be derived from BaseException eventually, and so we continue to 
catch all exceptions here, we just give them a name. (And then we create 
a VMLaunchFailure only for Exception exceptions, because the others 
don’t have much to do with launching the VM.)

> KeyboardInterrupt and several other "strong" events in
> Python are a BaseException. These events should generally not be
> suppressed, but occasionally we want to perform some cleanup in response
> to one.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/machine.py            | 45 ++++++++++++++++++++---
>   tests/qemu-iotests/tests/mirror-top-perms |  3 +-
>   2 files changed, 40 insertions(+), 8 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

(Looked at `except` and `ConnectError` usage outside of 
mirror-top-perms, but couldn’t find anything else that looked like it 
caught VM launch exceptions.)


