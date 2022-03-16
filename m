Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFBF4DA92C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 05:11:37 +0100 (CET)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUL0Z-0002BE-UX
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 00:11:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nUKyN-0008DZ-Cm
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 00:09:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nUKyK-0007i7-8Y
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 00:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647403754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=welwMKFQaATs8ZnBflqnX+zuDEZLeSf0mAZXvA+7xAU=;
 b=A8v6a6TdRd3N/Rf2m3hEJoewM4ZLGABPPbkDXHvXaC620292FLBfhUAetTuR//omaO0W0E
 afRaE1Rc5jOMtQ8xnLeuCg5LQLl/Pf06SKo0nC6Ll34KrAoZY0AM7cY4wqVbgtZYe5Kwg0
 zWOJ587OWGtr4lD9Io0mmNcdRdRp9SI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-qDUe8DvKPXSNK8cVLM_0sg-1; Wed, 16 Mar 2022 00:09:13 -0400
X-MC-Unique: qDUe8DvKPXSNK8cVLM_0sg-1
Received: by mail-pf1-f197.google.com with SMTP id
 g189-20020a6252c6000000b004f6f5bbaf7cso946618pfb.16
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 21:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=welwMKFQaATs8ZnBflqnX+zuDEZLeSf0mAZXvA+7xAU=;
 b=jFbGnULFnMn/J9wqFkW2trlK5gvGfy0CsrA2Xh0oAsw9U/+SYPuWzjmixewZ6VaXAX
 vXlf8/jKC+XlByt5/CZw1rvYWi8sB375JA5cPiSaJ9XL8rBKRgn0vKOWigouy7A+3uza
 FLcKEB/qLSsK0rK+TuCo65JPvaAzew5PW69YyqG4mjHiVqY8FeYUluvMVO6ZIqgFiBSt
 qcTi0GeH2oPWJAQ3x0+elpsDRoamasqTkFurngVuunRenfmM7favVfGJjGU3FN1WJHpr
 Oncuo68frdmELHcZp0UjmcOmN2Le7MAjgIDtchXVkCgVLQg4YAGewmhODxgeuBajGT9C
 kujg==
X-Gm-Message-State: AOAM532UfdoL1MkREq4sVwkGnU6IenH1bYOzscy8XSGI6AOSoSLDCDAr
 hPUMzsQc1xzrOyFOHF6Xk80J38UVA2w2PSXntdoS1BwXEqimNWCoZqpSBz+YRxovuxUDWt3XMR/
 V8wTCBp93jwsoBvM=
X-Received: by 2002:a17:902:ec87:b0:151:c3f3:ddd5 with SMTP id
 x7-20020a170902ec8700b00151c3f3ddd5mr31250031plg.154.1647403752072; 
 Tue, 15 Mar 2022 21:09:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqgRlYTiMlV5V0zua1H9jV6dHC6fDjN2C96sQuFDrClp8P1nnKbaj7PVYYPfGIDo2obxDbfQ==
X-Received: by 2002:a17:902:ec87:b0:151:c3f3:ddd5 with SMTP id
 x7-20020a170902ec8700b00151c3f3ddd5mr31250007plg.154.1647403751787; 
 Tue, 15 Mar 2022 21:09:11 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.129])
 by smtp.gmail.com with ESMTPSA id
 3-20020a17090a1a0300b001c5d05622fbsm727688pjk.33.2022.03.15.21.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 21:09:11 -0700 (PDT)
Date: Wed, 16 Mar 2022 12:09:05 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v20 8/9] migration-test: Export migration-test util
 funtions
Message-ID: <YjFi4UbB3Rh9iDBV@xz-m1.local>
References: <cover.1647396907.git.huangy81@chinatelecom.cn>
 <5be89638a128ce19c38c2cee8e055ad900b52a9c.1647396907.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <5be89638a128ce19c38c2cee8e055ad900b52a9c.1647396907.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 10:21:38AM +0800, huangy81@chinatelecom.cn wrote:
> +void cleanup(const char *filename)
> +{
> +    g_autofree char *path = g_strdup_printf("%s/%s", tmpfs, filename);
> +
> +    unlink(path);
> +}

If to move most of these tmpfs helpers out anyway, shouldn't we also move
all tmpfs ops into this helper file?  E.g. initializations of tmpfs var is
still separately done.  That's a bit odd.

Ideally IIUC tmpfs doesn't need to be exported in migration-helpers.h at
all below, but hidden.

> diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
> index d63bba9..d08551f 100644
> --- a/tests/qtest/migration-helpers.h
> +++ b/tests/qtest/migration-helpers.h
> @@ -14,7 +14,14 @@
>  
>  #include "libqos/libqtest.h"
>  
> +/* For dirty ring test; so far only x86_64 is supported */
> +#if defined(__linux__) && defined(HOST_X86_64)
> +#include "linux/kvm.h"
> +#endif
> +#include <sys/ioctl.h>
> +
>  extern bool got_stop;
> +extern const char *tmpfs;

-- 
Peter Xu


