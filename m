Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A22F6228
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:40:11 +0100 (CET)
Received: from localhost ([::1]:40518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02rC-00040E-Th
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02nd-0000uy-Eg
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02nb-0005Ct-R0
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610631387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSfio2q5RBRlg5NAapGbI7i1M7231NEa7Vs9xhfvBxs=;
 b=b9TUjTM/82Tg2G+Ysag+tqahqPEqfbtzA/VoCW91RTJuToumAgeTX/1RnhNQ8CRqkAEQ/q
 plxt0HTgv418Ob163SCm1fpfs58NVnXck8fm/xyZyXLZwVQCCmHeDCI6wX3eWAldCUHOpa
 uQPtiR47K5ynlc/o5CF6ZT5Hrj5BDMk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-Y-wCtGtvN-Cq9ZI_OYXuog-1; Thu, 14 Jan 2021 08:36:23 -0500
X-MC-Unique: Y-wCtGtvN-Cq9ZI_OYXuog-1
Received: by mail-wm1-f72.google.com with SMTP id h21so1910017wmq.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tSfio2q5RBRlg5NAapGbI7i1M7231NEa7Vs9xhfvBxs=;
 b=AmfQWcgQCQ++HY5q7vvZjOvsI0Jc2wQsW+SQW5rpVlJ4eSIoUjrC9z+DztpIeFi41l
 G2/n3AvSQ50aKAA4aa26nPcfRMXzLbYmd1if1LlH4VvVUCrkJBgqMV7n3pv9mcmBkf+h
 34H8XMbBE/IpNIeVWx5R8+JSotUYsp99fY83wMg+pwhIN3D94XkbYzPS6N954KtF/o4U
 xJmrvSHJTPoHYOXiNVpP+ByLFD8HlQWeE/hYrdU+Qg/N2azrOYkqKpPOxzwnQbrJDjVh
 x7oqvoTQqJPt0azlW0MB9UWYScf8fNb2TdDo/21dSd1Txuufflw5dEUeDYm9Y649SSla
 k7Yw==
X-Gm-Message-State: AOAM530O4s1qpfk7WOHwL0YrLmvsbmE/nUqdlUlI4yW+0dwIi2fBxJFb
 bNoek22fzK/y8y3bHXJ6COEpLifbWgE97nyV8pUWsmYiKKwLRVI/1+1fnOhpmrh879//1KA/T4E
 PAcGhNfeE8pn8ReE=
X-Received: by 2002:a5d:4104:: with SMTP id l4mr8205501wrp.340.1610631382416; 
 Thu, 14 Jan 2021 05:36:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoaiC5SI6N2OFtPDE2Qng8cK3F3Yqj0tr3V9CRkQfahlBFycx4PKoQAN6ZqvfW4BKHiikHtQ==
X-Received: by 2002:a5d:4104:: with SMTP id l4mr8205488wrp.340.1610631382291; 
 Thu, 14 Jan 2021 05:36:22 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d2sm9570403wre.39.2021.01.14.05.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:36:21 -0800 (PST)
Subject: Re: [PATCH v2 20/25] tests/docker: auto-generate centos8 with lcitool
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-21-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a99ec39d-49b0-cf5f-34cd-a49dc6995a1b@redhat.com>
Date: Thu, 14 Jan 2021 14:36:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-21-berrange@redhat.com>
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
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
>  tests/docker/dockerfiles/centos8.docker | 221 +++++++++++++-----------
>  tests/docker/dockerfiles/refresh        |   1 +
>  2 files changed, 121 insertions(+), 101 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


