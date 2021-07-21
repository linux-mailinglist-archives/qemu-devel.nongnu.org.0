Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E133D11CA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:02:46 +0200 (CEST)
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6DkD-0002yY-C6
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m6DiP-0001UW-6q
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m6DiM-0003TA-V3
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626879649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COmSraRiwfpwChBMZyo/0mtM70wEzNEE9bf3wF27RXI=;
 b=e5zvZxkjG/QjTCHIFftuRWJFi/VuKamM3qfpr3w57JOzwl8UMrxqdruYk3ugCoySnjSoyn
 Pnu0dLQI+7SdO1hGK6plGNo/qnKoU0Nzeahc3eY8EDucqMIjLmsUEq2FlQAxc2V0Jzy7LM
 e8ZazEHPdzEgcY7FuYs7asUsIIBpQws=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-U9AjS63RNDSxzk0aJjIjYQ-1; Wed, 21 Jul 2021 11:00:47 -0400
X-MC-Unique: U9AjS63RNDSxzk0aJjIjYQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 j5-20020ab06ca50000b02902a1305400e5so925214uaa.13
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=COmSraRiwfpwChBMZyo/0mtM70wEzNEE9bf3wF27RXI=;
 b=cxGvCVHnkecMqsVwpefsZYIyrkVCwYxj6uOpKgW7y9CsMx2SQx9MQXgcAuqep+Le7l
 Zm4BclHJ5qabpmVix6gmG/5KPfCDRNVlZekwYu4Rq6Tt2EkbJwFz7AKKrrtQlwlc2Rbs
 Qi8tBZYy99uqD/eMUJff6zxa+xMR9zCKlunXmsMhRKDsaiz6YtRpheAyESKLauIBteNN
 wypE5ADO6flmPr/gb7ILQQDkpRuviSkWvUwmhzf0A7eDW25F6fxUVATPrKyC2xdjbl49
 THlhOkCJBnTg/OyhWho50v2QhTUmVfkPoAvhF4eFqcQOvAOOGcyjg5r7vyFc01bBIiLe
 J21g==
X-Gm-Message-State: AOAM532PDp0e2+bXmxzMTR/EkXYBYyjhne8/fm0x016AX/0sFJ1cuesO
 Vb4DVho/Lq9JBYSdZZg3r/rzU5HjnAdwAgvZy5sgx2aRAT9K4kfpJG7ceRr8FTPx84OqGORQD+/
 k7fTH6s38dO5ImOUmIxqggwhZEwlociM=
X-Received: by 2002:ab0:35d3:: with SMTP id x19mr37361536uat.124.1626879647069; 
 Wed, 21 Jul 2021 08:00:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVoUye/UEbJ1jxzLCvGmv/1UifDVCknjVRbp5A5zF0mq6KJrHwRQOFbYGfEQjJMIFsoZjbivL1vD2sqLxbUhg=
X-Received: by 2002:ab0:35d3:: with SMTP id x19mr37361489uat.124.1626879646701; 
 Wed, 21 Jul 2021 08:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210720232703.10650-1-alex.bennee@linaro.org>
 <20210720232703.10650-28-alex.bennee@linaro.org>
In-Reply-To: <20210720232703.10650-28-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 21 Jul 2021 12:00:20 -0300
Message-ID: <CAKJDGDbJpnVzHtF5RRAaKWaUwbhbVaOtK5eHmPtRRcNnAB+kZQ@mail.gmail.com>
Subject: Re: [PATCH v1 27/29] gitlab: enable a very minimal build with the
 tricore container
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 8:34 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Rather than base of the shared Debian 10 container which would require
> us to bring in even more dependencies just bring in what is needed for
> building tricore-softmmu in GitLab. We don't even remove the container
> from the DOCKER_PARTIAL_IMAGES lest we cause more confusion.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20210720114057.32053-4-alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/buildtest.yml                    | 11 ++++++
>  .../dockerfiles/debian-tricore-cross.docker   | 34 ++++++++++++++++---
>  2 files changed, 40 insertions(+), 5 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


