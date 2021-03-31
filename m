Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45190350010
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 14:20:01 +0200 (CEST)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRZpI-0006kZ-Af
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 08:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lRZnV-0006IU-Cs
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 08:18:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lRZnO-0003PU-PO
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 08:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617193080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oIrClaWX9FZp15Pf+XKihrwXKPSa05vmiBjqYapKHns=;
 b=c1zYBSVEbpcGvuZg/CVQjGxVZ5wu0+Zp3992W/Uq1rrZFXqBPnSmF+wRBrczejAWvZM/Xm
 Yzzn2xctFGAnmZfuswmSaJZiIsLOk7SEps0AcpdB+3Vi2V+nwED8SNDckRV7az2JBpzapY
 4lk9Y0TYovuAL74KuB5gNxKLJ0oZwCw=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-m1_gUET1PuO16xjPcHXslw-1; Wed, 31 Mar 2021 08:17:57 -0400
X-MC-Unique: m1_gUET1PuO16xjPcHXslw-1
Received: by mail-vk1-f198.google.com with SMTP id 131so655050vkz.2
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 05:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIrClaWX9FZp15Pf+XKihrwXKPSa05vmiBjqYapKHns=;
 b=lLuNF1n2WNGJ4TZnaAJnj0+m6J8o46Ah7OdERphLVjdM/DfiGWDGzi4naG1sC/UDz7
 s7M6pDfzzK0yJySdjHGnMsaYLe4y8LLHcvS07GG4nDijXbghBgwU7eX/9B1UoNt/FOWt
 B2osl4iujf4AFfkAq8JuHZqLZ7f2pH6YiOCpaGmstkE7H1KO5as3L6z8+H3Yqnuwb5gb
 3OngdsCzbC/Mf7TfoQR5j/pT2CRkgP/D9evaLcnc0Qvr+YUzRuOmRxdyDEC1LICfcZuu
 KHvNu1cZ6UQhQlLrOkoqSolyowYVNvGsJzZ0WUlUvTQnqZhODNrlwYrc/JrUU8qEdmZn
 SdxQ==
X-Gm-Message-State: AOAM533FUEPc12ByJ544vt3bhCATDFSm6Vqw0hFtHUqJgi+OBOOCmIBI
 0AfQleTGSRHHE3B0Y3XqUWHOnouwLL2/7EgfPZfanSveg8FAsILg3uHhRMVVz1lVByNKn5AVuq0
 6c0jV6SPGzzPNmjbIZ0SHUA908GHL4cg=
X-Received: by 2002:ac5:cbee:: with SMTP id i14mr1471597vkn.1.1617193077218;
 Wed, 31 Mar 2021 05:17:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5pYgv02vlrc52gg+/ln3soOaI3D2/DHQu8Ylulm0adKtnO2lG+O3UyViX3tHZFdz/s7ELd+ZUU0A0EVEhahE=
X-Received: by 2002:ac5:cbee:: with SMTP id i14mr1471583vkn.1.1617193077065;
 Wed, 31 Mar 2021 05:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210331073316.2965928-1-thuth@redhat.com>
In-Reply-To: <20210331073316.2965928-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 31 Mar 2021 09:17:31 -0300
Message-ID: <CAKJDGDaZPhe62o0DGhrkrmd-35EjCGhifCymDAvRxAxZ6Z-NQg@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci.yml: Fix the filtering for the git submodules
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Mar 31, 2021 at 4:33 AM Thomas Huth <thuth@redhat.com> wrote:
>
> Commit 7d7dbf9dc15be6e introduced a new line starting with
> "GIT_SUBMODULES_ACTION=" in the config-host.mak file. The grep that
> tries to determine the submodules in the gitlab-ci.yml file matches
> this new line, too, causing a warning message when updating the modules:
>
>  warn: ignoring non-existent submodule GIT_SUBMODULES_ACTION=update
>
> Fix it by matching the "GIT_SUBMODULES=..." line only.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


