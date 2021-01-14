Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8712F629B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:02:53 +0100 (CET)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03DA-0003AC-RO
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l039c-0001LG-0t
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:59:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l039Z-0006m7-Mp
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610632749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0bEojdkIiuwCZt04k6h8BaofCsyDp7QxprHrjuRxVA=;
 b=jNMGNCbHEqSXk2GnthgCKKqDDPOQaHzj2qY1nVPyiHebizSdWtMqFeC+jNUqQrj/CsOtVM
 JbRH9NXXtZvtKC/JSHVvDSMpKH/J9hboAwWDtdlzlHnV0zOCh8UE7hG6+WTfCG/kVIxkTj
 dQfNpiculVPKiy4TRe1RaJuU6Tm0YP0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-jcWbUvq4MFKG3-OUVtChtg-1; Thu, 14 Jan 2021 08:59:07 -0500
X-MC-Unique: jcWbUvq4MFKG3-OUVtChtg-1
Received: by mail-wm1-f71.google.com with SMTP id b194so814937wmd.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k0bEojdkIiuwCZt04k6h8BaofCsyDp7QxprHrjuRxVA=;
 b=lsMJErasOwEEL/ydx0Jb6DTn5jZV4F6mfowrQrnpymNOva0fzLGfAt4XOTz7HrqfCX
 ew5UhvZuE7S1ojM0DTnjT5sLgoX1yj6dZCJNrqwYOdQI9CTrZvddR5iplYNlavc6u5qV
 T0F7fO8G3k1O/fu+iqbUoVW5OAtyUbkfOi8eOxZYKf57BR/mK06O0vOYcIJZ5fmdIjRK
 hVej2eiCVzY7LOxTpoEGsq1RxH5xgfkWwHswibqWOQ7F4dlzIAJJPFuR4dvh29ACC9Ap
 1vwV+YSjcZ9GcloATItNcFl0zrB/71H7swFuuYDuMF8YzE50Nm/1eO/9sm4+etvjRUE2
 PXyg==
X-Gm-Message-State: AOAM533mWqb5sWoK7ggaGoL+uivsGT/4vDA8ulllblAjyMfShhMere2/
 Q5oRqWXtxqp+FEtzYF5h3Z350ykCr9GIEHc2RM4U/I/4a41oyOs0ZfYQTsfbBHpazI2eH7kxv9E
 jm54g/nUHv1k6MCU=
X-Received: by 2002:a5d:4fc4:: with SMTP id h4mr7812082wrw.129.1610632746367; 
 Thu, 14 Jan 2021 05:59:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzutXFhQZ9mgWLdZnGyfKus8bsaDlDmkySmdxD11fn9AG2WGS5t3kaxxvPWrIHrb5l17JLP2w==
X-Received: by 2002:a5d:4fc4:: with SMTP id h4mr7812071wrw.129.1610632746224; 
 Thu, 14 Jan 2021 05:59:06 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n16sm9838755wrj.26.2021.01.14.05.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:59:05 -0800 (PST)
Subject: Re: [PATCH v2 17/25] tests/docker: expand ubuntu2004 package list
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-18-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5c78853d-6a2b-ab06-6e8a-a611ab7e7cc5@redhat.com>
Date: Thu, 14 Jan 2021 14:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-18-berrange@redhat.com>
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
> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/ubuntu2004.docker | 46 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


