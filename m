Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110EF47943A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 19:47:49 +0100 (CET)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myIGh-0000vj-Gt
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 13:47:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myIE9-0008Qo-4o
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 13:45:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myIE5-0005on-7B
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 13:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639766703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50PU/FBCKiU3HR+4LlW7hXhBGraocr9E9phEc1AiUCY=;
 b=gPbf6D2sETirYMrZaHs1HYglkEGBAFKpsArgqOrFOS1v1m2oM0V2VZZGv3xPrnY3MwUuze
 j+ZjsTOzRDbPjHtUx7nErMN5synOSYFkIJab7hGOzbBTPQ/CYG9Mq4gVC2MIB66fzJfwl4
 CzFCIkQqUgsDpIh4mtBY3v0OAV65j5Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-ALV00n9FPheBo6pUIuw_9Q-1; Fri, 17 Dec 2021 13:45:01 -0500
X-MC-Unique: ALV00n9FPheBo6pUIuw_9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 v190-20020a1cacc7000000b003456d598510so3318561wme.6
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 10:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=50PU/FBCKiU3HR+4LlW7hXhBGraocr9E9phEc1AiUCY=;
 b=z9G95tnGigSBfpAArUmQD7HmlnoHHJsos4hTyZKP8pdcFHPkEVjFNE7A0TgQa8fx78
 wGYjwyDFFeEgMDpG9LKFgKoPY6KentjfuJhl6m7WYOvSxOLsczhaZqvgVVCWLDn9q/Bc
 ITRlntFrfIk9ImTWmjQkyK0uNquaWttnKVi+y/G1hAEwUFr86DDcKxDFagLG8MzRCswg
 ulCTKfMxjMhJJqNns10cWW+P3sVTj799N2W/n88GHVjJ8RfAQRvw9v1x7/OnqAIB2aYr
 8cFUKP1+ZSkqbYjQjApAhDDpYn/4l5OEQaJGZglhURRzBq/Cm2q+6oCOMnEmq7wPjrVB
 /iPg==
X-Gm-Message-State: AOAM531uBRa0CD6F5ZV4WHZ1pXITbVZjEjycsW1//KCnebKlBih2h1O7
 1lpqXpkRM/Uu/xaT108Zl+KHusGzDGJDhrqT4BLLfIMQEMnp3vLBc9IO2yMiSNRBRxHk0tdRhsw
 Wfzn1nWBSVkvonzI=
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr3486009wru.156.1639766700259; 
 Fri, 17 Dec 2021 10:45:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5ZMDGmKhAfx84ot6BIGcTCQZIyfL7ZTbql4XQbHShc30mFD3h3nSgS4a8cjRouRpqqE0FuQ==
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr3486002wru.156.1639766700050; 
 Fri, 17 Dec 2021 10:45:00 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id e1sm6058480wrc.74.2021.12.17.10.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 10:44:59 -0800 (PST)
Message-ID: <6324e754-7c03-0648-a284-906f0d85aa67@redhat.com>
Date: Fri, 17 Dec 2021 19:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] docs/devel: more documentation on the use of suffixes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211217171902.2668674-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211217171902.2668674-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 18:19, Alex Bennée wrote:
> Using _qemu is a little confusing. Let's use _compat for these sorts
> of things. We should also mention _impl which is another common suffix
> in the code base.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/style.rst  | 7 +++++++
>  include/glib-compat.h | 6 +++---
>  2 files changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


