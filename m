Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16DE4D2CF9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:19:41 +0100 (CET)
Received: from localhost ([::1]:48714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtPw-0002np-VT
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:19:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nRtO0-00082m-TE
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:17:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nRtNy-0005Yf-7Y
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646821054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02Zcveb/W8oRnbelWDZVfvlRce7QUGYpUvmLgp4caGI=;
 b=Cy/AwgyNvXC2/9mh8xww5TcIY5kLAYC5yxCkIxIQu/qJ3f2uL9UcXCDenIK/lRKEwgfBuE
 zrTLzucxV/Hm4dH6P+ap/BnZBA5ElCDT41lnjI02ImQdBFT2pPcKl8egwUIr/VOU0qJVMV
 RYPvhI9xteDZxN7/+trX9d+hZByIE5g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353--V6CLNF2MPmMGLZWUU7xhA-1; Wed, 09 Mar 2022 05:17:33 -0500
X-MC-Unique: -V6CLNF2MPmMGLZWUU7xhA-1
Received: by mail-ed1-f71.google.com with SMTP id
 r9-20020a05640251c900b00412d54ea618so1037712edd.3
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:17:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=02Zcveb/W8oRnbelWDZVfvlRce7QUGYpUvmLgp4caGI=;
 b=7G9i8ab/XQwZ+rT8Sgd58t4/UssNEY5jt9HbEb9YTYB7YZE4awILHfLl/u891r9K5N
 idwvO73oNBgLN1Gz07O/n54aNlHkQMHLNZbzW187MqF9gcuH7AV+89hcYvWy2qKFvdNK
 MCwNUxL+F+KXvUki3C3quUfYRktWuN4SNGx0gVrNiAnxDtXGrwFNpaxRE0OCsGhg6pN8
 6v66owAykDNDnF4yquWj8mTlpAGhCzRupE7gIUr+iJ3Wdll3Q99896z49i6B9gfvM44k
 Izb1VZpM8d+NNH2FQClbqxsK6pMeNxuOA5YOB8CSDoSd182dqBz+OIHtoIuCyQLi7OLQ
 POcg==
X-Gm-Message-State: AOAM531vuRYUtfS0v2ANxtU6bSh/Y2fd1g1Rs+7mXBo38C9vcwMDwI8R
 VWT8z2TIgMXPsxXzbTuqLYP0Z5LDAS7iRSR88xfIV9jg1V445j8sqPUsY8HIGPIM0WvyhB1LIOc
 7NeTo3cJ5m+5djyU=
X-Received: by 2002:a17:907:3da1:b0:6d7:9f9:8d3c with SMTP id
 he33-20020a1709073da100b006d709f98d3cmr16860856ejc.503.1646821051511; 
 Wed, 09 Mar 2022 02:17:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbHUY3K9luhZVHCKV0HouXgTNYKdh9APi7/mKxsq24MQhoVjG+wXRC2J+3ZpI76gWu1QVKjA==
X-Received: by 2002:a17:907:3da1:b0:6d7:9f9:8d3c with SMTP id
 he33-20020a1709073da100b006d709f98d3cmr16860836ejc.503.1646821051316; 
 Wed, 09 Mar 2022 02:17:31 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm615348edt.80.2022.03.09.02.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 02:17:30 -0800 (PST)
Date: Wed, 9 Mar 2022 11:17:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 07/11] tests/acpi: update expected data files
Message-ID: <20220309111729.2a8ecb5e@redhat.com>
In-Reply-To: <20220308145521.3106395-8-kraxel@redhat.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-8-kraxel@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  8 Mar 2022 15:55:17 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

I'd duplicate table changes fro 6/11 here,
so whoever looks on this commit later won't have to be a detective.

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  tests/data/acpi/virt/SSDT.memhp | Bin 736 -> 736 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
> index 375d7b6fc85a484f492a26ccd355c205f2c34473..4c363a6d95a7e2e826568c85f5719127748e7932 100644
> GIT binary patch
> delta 22
> dcmaFB`hb-yIM^lR0TTlQqx43uD@;sZodHo~2HXGu
> 
> delta 22
> dcmaFB`hb-yIM^lR0TTlQqy0v%D@;rmodHrj2HXGu
> 


