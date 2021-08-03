Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8703DF125
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:12:07 +0200 (CEST)
Received: from localhost ([::1]:54684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAw5N-0008UQ-Vk
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mAw4S-0007AQ-Tp
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mAw4Q-00081X-VD
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628003465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jF0J2jO28GBMDKS9CeIL8dSFedkEzbotPpyBliN6PU4=;
 b=YLNjpj5mhcHokx+ud+LzQ4833EyFMM+jyP3VkMsUSTYOKNTgMD/W+SFFC+lihMO9hCfy2B
 /aebHL7ZgI+tnqnAiwFMFIs0hcAye5wJVIvuRMLNR/yA3PjkjnFgD1VhvDOvQxplt+j65G
 ajbSL/O82CIijVe1Be8tjMiLsDx90RM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-ydmMMMkJPK2P9mzpgjZSzg-1; Tue, 03 Aug 2021 11:11:04 -0400
X-MC-Unique: ydmMMMkJPK2P9mzpgjZSzg-1
Received: by mail-pl1-f199.google.com with SMTP id
 p21-20020a1709028a95b029012c31764588so2702138plo.12
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jF0J2jO28GBMDKS9CeIL8dSFedkEzbotPpyBliN6PU4=;
 b=SCDFMI0m0BP9GL9QqwYeTVizZzR/b0qNF5W23Lo+vfbXkLDtMxpVQXVjwviP6LIVoR
 4tFcX51KMhJvqxU+lCSpnKmBtWsy3IA6eYEm8kUqz3j8R9sI60RsjxNYM7Ssz+jLWCs/
 jhrdQ5oTE+TohR0HbYTHwu6F0IVZwDX+4+fEXQhP/HG6xF+0i8M68CLjd5pMg6odIUZh
 TGZ+9ZVKuSeWEJmlqY9RmceSSy/r83rPerSLdjwcPPowQysjkZwQ6codqT+R7zG55Qnw
 ekx9u+PxabSGi+doCabwzzWVIxM6d6uiUr0KvNXQC1rouIW3ms8aHOX1Axu01OiYH84K
 pliQ==
X-Gm-Message-State: AOAM531u5Xe7qA4xcBGHNNOec1wx4GFcNgWNB6g3xVKRex08nRFZEwow
 V616ho0J0AtKsZGSgFFse0nvqw2/00e7WEQ59PBhpAGIST6Zf6bMloJVhJITHzu7GLoqQKJ0j0p
 oy5M68TLsUh3eovhmzRcA5t5apWDQ/B0=
X-Received: by 2002:a62:1609:0:b029:3ab:afdb:acf3 with SMTP id
 9-20020a6216090000b02903abafdbacf3mr22749128pfw.43.1628003463585; 
 Tue, 03 Aug 2021 08:11:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzREKz5Aqqstl8uDvkT7LxJe/EPuaZvqL0snvw+stC1e8oe0ggmWNAIl2hL8r3cpkExU8oMqKVo2OOU0wjFhm8=
X-Received: by 2002:a62:1609:0:b029:3ab:afdb:acf3 with SMTP id
 9-20020a6216090000b02903abafdbacf3mr22749106pfw.43.1628003463332; Tue, 03 Aug
 2021 08:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210730143809.717079-1-thuth@redhat.com>
 <20210730143809.717079-4-thuth@redhat.com>
In-Reply-To: <20210730143809.717079-4-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 3 Aug 2021 12:10:36 -0300
Message-ID: <CAKJDGDY5WtXHK+QTFYU0ESAZYqbE4GP29nu3cQFD6FKtkT7jnQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] gitlab-ci: Fix ..._RUNNER_AVAILABLE variables and
 document them
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 11:38 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The patch that recently introduced the S390X_RUNNER_AVAILABLE variable
> in custom-runners.yml missed that the bottom half of the file is rather
> about aarch64 than s390x. Thus rename the S390X_RUNNER_AVAILABLE to
> AARCH64_RUNNER_AVAILABLE in those jobs.
>
> Finally mention both variables in our CI documentation, too.
>
> Fixes: c5dd0f0342 ("Improve rules for the staging branch")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml | 12 ++++++------
>  docs/devel/ci.rst               | 13 +++++++++++++
>  2 files changed, 19 insertions(+), 6 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


