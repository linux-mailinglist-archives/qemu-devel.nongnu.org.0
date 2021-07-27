Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF583D7B22
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:37:08 +0200 (CEST)
Received: from localhost ([::1]:34794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Q4p-0007vC-T7
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8Q3e-0005XW-HY
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8Q3d-0003pq-3P
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627403751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O1e+MVZfawvGeWPqmwUghxqq9bCNiIWIVfn5pVdNGmY=;
 b=CALkYDFk5OaEL/BkYnvjHeA6VCrMuxXr6Gy84/hWLAFCizZKBo3VAJO+CRzU1yOjgCrzjD
 DDf7hCNwOyUrfAokpMeEmurtOpnDHM8l0mKW95i0UwpikIojiwIlxGFX9ONiqFW9Dx5QZ4
 06inAMTh2BSyJ7H9vvKeLYJfnSiqZmI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-NyZJ0VlFP7GFOgeownMFpw-1; Tue, 27 Jul 2021 12:35:48 -0400
X-MC-Unique: NyZJ0VlFP7GFOgeownMFpw-1
Received: by mail-wr1-f71.google.com with SMTP id
 f6-20020adfe9060000b0290153abe88c2dso1938903wrm.20
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 09:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O1e+MVZfawvGeWPqmwUghxqq9bCNiIWIVfn5pVdNGmY=;
 b=Xog1Blro0fMv+wH1a2cMsFy7kMltvu90l5MbpMFPAwlq+YQrbNUewlhgze85w0nV2s
 pRHDxi0ZsjyMF7XuF1efwZ2NEgla5fcF86+ko/4IrgDxqtFQK413FgLsTSuDuh7xQr8n
 MskAl8UzI8qmK9YgREFII6IkYTfAZ8LFqSAj2W+zP5wZGEjPkHRJW8zklDV0PXhGxnct
 CqGumxkcuNyG7mBpxQlvjZfUeLaWl4IwD/JSCYra+Z5WOnP4D8yWTG2h/mtmR8NoyOWp
 IKSbhKsl4sheG5piws1qvAwAUwnHutMMMVZxGji0WAMw8U+Dnqj5V/VE02RyCuVxL7Xh
 RXAQ==
X-Gm-Message-State: AOAM531bu7Q+8M0EG0ZeBF93DEqX7jOuNC00w9iCGFtY7M8OWhoUsY9n
 +H3VDTp/meU+Pw6qN5sGEvoJG068puxSfNqRNiYG3eJK46DbpYSP6gCgMfPMpt02uXPRrD1/XXR
 0pLpJeX7uTx9VIJI=
X-Received: by 2002:a5d:4402:: with SMTP id z2mr24682247wrq.44.1627403746824; 
 Tue, 27 Jul 2021 09:35:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyukmY2XPAJ4EnQLhJBO+xCFRPQr6t7RMvTkfv3EBu5JOhZ9oislU7zYXrAhnOygyO4ZQCvXg==
X-Received: by 2002:a5d:4402:: with SMTP id z2mr24682192wrq.44.1627403746203; 
 Tue, 27 Jul 2021 09:35:46 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id q17sm3784943wre.3.2021.07.27.09.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 09:35:45 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci.d/buildtest: Disable iotests 197 and 215
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210727162542.318882-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a424373e-827b-4261-06b5-c0a6489ea522@redhat.com>
Date: Tue, 27 Jul 2021 18:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727162542.318882-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.717, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/21 6:25 PM, Thomas Huth wrote:
> The iotests 197 and 215 are occasionally failing in the gitlab-CI now.
> According to the log, the failure is "./common.rc: Killed" which might
> be an indication that the process has been killed due to out-of-memory
> reasons. Both tests are doing a big read with 2G that likely causes
> this issue. It used to work fine in the gitlab-CI in the past, but
> either the program is now requiring more free memory, or the the CI
> containers have changed, so that the OOM condition now sometimes occurs.
> 
> Anyway, these two tests are not really suitable for CI containers if
> they are doing things like huge reads (which is likely also the reason
> why they haven't been added to the "auto" group in the past), so let's
> simply disable them in the gitlab-CI now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


