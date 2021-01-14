Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADEB2F621F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:38:45 +0100 (CET)
Received: from localhost ([::1]:36326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02po-0002G6-9G
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02nO-0000WH-NI
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:36:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02nN-000521-5F
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:36:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610631372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HjyVqhUaTV5lMVvs8CTWypdz4QsjaqY/bTgqtGUI9E=;
 b=VsDMY/BTaLGy9zd24az5KIKv52CwOsaMJcEc9tSkrUApNoDKgDs3DbV4BcTTnB1erQofIZ
 xplLCeHBgl9fypwnwsL33t6Qfho+3phUUdTzB3uovFbXkZcBUqnk54p83k8bc40yfQ9Dxr
 shx/ALc8FHSXwIHdEDGswLlS2nQfaFI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-sNsbHBFROi6iMkLt6kAg4A-1; Thu, 14 Jan 2021 08:36:10 -0500
X-MC-Unique: sNsbHBFROi6iMkLt6kAg4A-1
Received: by mail-wr1-f70.google.com with SMTP id m20so2614730wrh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9HjyVqhUaTV5lMVvs8CTWypdz4QsjaqY/bTgqtGUI9E=;
 b=nO8uLDFaGKh3CS+m0NzYu1iQJO2BKeKGQFMlRVJfrY2a/dFJwqrDUuGDcBhoVv0AQ9
 xgjs0zHooEgb7BfNT5BggsyN4fkhQ6nzbAJ+OgFhTtRMcsBYQN8v2AQt2ylWSs4uvkXA
 iDMeag5qDOE4a4Ezgb+ZnQytq9szKSjy1lxsHu/+PxD9hfr+9rFnfnC6l/fpVroO1orJ
 N3oK/CAKroOr9biuojb3ts0+ztBg2AGnFIYUqGnlVL+qVEDti864jFNClYhYDZQ591ef
 4RNHw0DLFexVvNIDGolLKGeRWZ3sIl3jBffg0OeIGQ0u+RnlzQ783qNZrs0WVbKPtfNG
 vAQA==
X-Gm-Message-State: AOAM533GWzzK1dJ4usgqTUGXsQkKM3kRt2XDTwLtKJBo9Fb6Z1YogUx5
 CiJGEBeb2OqA2VDO9UiHw8N54F6f9JC9W7aYqDVRegwAWm2GFykjMhkTp+YVRTBACN6nOGJFQEA
 OFUSZqIuBQbYxhvA=
X-Received: by 2002:adf:ea43:: with SMTP id j3mr7950963wrn.393.1610631369736; 
 Thu, 14 Jan 2021 05:36:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+YzZMaTJL29n+FgpFCdDlwqZz3nJQKy+9cQFLjGVnN1QyHnH23m5onL1076G3/9Q4SZIP0w==
X-Received: by 2002:adf:ea43:: with SMTP id j3mr7950952wrn.393.1610631369618; 
 Thu, 14 Jan 2021 05:36:09 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g10sm2704790wmq.3.2021.01.14.05.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:36:09 -0800 (PST)
Subject: Re: [PATCH v2 19/25] tests/docker: auto-generate centos7 with lcitool
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-20-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a36791d0-7eb5-62e2-efb6-fed8e7583207@redhat.com>
Date: Thu, 14 Jan 2021 14:36:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-20-berrange@redhat.com>
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
>  tests/docker/dockerfiles/centos7.docker | 214 +++++++++++++-----------
>  tests/docker/dockerfiles/refresh        |   2 +-
>  2 files changed, 117 insertions(+), 99 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


