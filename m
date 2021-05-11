Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9422D37A872
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:06:33 +0200 (CEST)
Received: from localhost ([::1]:39220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgT1s-0003TZ-M8
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgSys-0001Dh-12
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:03:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgSyi-0005r8-Dv
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620741795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SpoEl24Eoic+pgyBKpgiQ9WVfalnAX50QUU0F3+ZtM=;
 b=Vo1ssgCmH9wVH27qehJEuhO0OugZ92JRDsOSJn/cVP0a5BtrrctdcM7T7Aq3KLrpFpVLeb
 v6/G8IOSbXjPQHBr5iLDn/koIVeXXxh11gPuOY5/BCZt7X9mGb2PdGJU1hV2OQe8tvmTnl
 bQKWPcfrXjyg8yH7oq1zyQQlagydEjU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-s3CZ8qyVOdSFc73TFvo35w-1; Tue, 11 May 2021 10:03:12 -0400
X-MC-Unique: s3CZ8qyVOdSFc73TFvo35w-1
Received: by mail-wm1-f69.google.com with SMTP id
 g206-20020a1c39d70000b029016ac627fbe9so164292wma.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0SpoEl24Eoic+pgyBKpgiQ9WVfalnAX50QUU0F3+ZtM=;
 b=SL+yokpwht233WG71X4GtvTtthZIZsu8BdFddbK2wj8Pz/yfSQCCsqdrlbsFVhZEmE
 U/UyP44ia3dAjijkBgV7p2SS64O/uaJuYeXNbskRxYVPK/fQywYn4YgApS0Bo2nvH/03
 95k17QqS+nvEq85EE6++Xn4tkC4X+9WpbOBHThMOY1fyBjUXk8z1L3oHTlX1YUQLTxiv
 d2NeHXbRB+XErwl4AwVD42HvqA9C2NbupFxbq3fyCKw0hrFUOiV/lDKcXubmdkAL+wBW
 IJFVjQEIthi8XNICc5vnhMNJ11YF26jbCm7te0sv/yfu5pN3NzUWD7BveitvHX7vmM+w
 ELkQ==
X-Gm-Message-State: AOAM530yy7BZaTOo/RgVJoGhPuSD0ujHmkRzNy820zzSVgz37txo5zjZ
 cluzfLCpo1pXUlymnp2b7tlzvBCtQ9TjhlbaWWfZQUOF9YQxGOuDkehE5tkgMEM0RxWEcn0nb65
 ObBRJq5Drra7JQc4=
X-Received: by 2002:adf:d227:: with SMTP id k7mr39157918wrh.390.1620741791769; 
 Tue, 11 May 2021 07:03:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgyxd0TVkDMPHrklwG4dGdd+7bubqhHvjzYcwp5jB1+S3MLFMM71voozXpDqCQcpZQGQfonw==
X-Received: by 2002:adf:d227:: with SMTP id k7mr39157888wrh.390.1620741791603; 
 Tue, 11 May 2021 07:03:11 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id h9sm23982149wmb.35.2021.05.11.07.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:03:11 -0700 (PDT)
Subject: Re: [PATCH 04/12] crypto: drop back compatibility typedefs for nettle
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-5-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <47c5e4e3-0e7b-9710-020c-3137bd92d9c6@redhat.com>
Date: Tue, 11 May 2021 16:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-5-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> Now that we only support modern nettle, we don't need to have local
> typedefs to mask the real nettle types.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   crypto/cipher-nettle.c.inc | 60 ++++++++++++++++----------------------
>   crypto/hash-nettle.c       |  6 ++--
>   crypto/hmac-nettle.c       |  8 ++---
>   3 files changed, 30 insertions(+), 44 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


