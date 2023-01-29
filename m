Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5086667FCC5
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 05:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLzYH-0000kH-OV; Sat, 28 Jan 2023 23:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pLzYF-0000k3-7T
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 23:44:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pLzYD-0007am-0P
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 23:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674967459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=52B0mCb/eBcWOdIWbePUJDSUskEVchFnGrmdqaKKfs0=;
 b=jQTD0eGJ/uCAyJ4PIYsqYrCd8Kgyp8UV6fQKF0SaYXNiUvrjxEwQDuB527q/RFbUMX6YjT
 NkXUttQMvlMkOgXf9E8vguPgTohc+BOE5mSUiLTypeot1Clz+04OVjcQV9JemUAdgEg3xG
 NzrvglmKYwypuK0+E711z6ovqjfsoI8=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-35aEYl36NlCA7-bgAgu1Tg-1; Sat, 28 Jan 2023 23:44:17 -0500
X-MC-Unique: 35aEYl36NlCA7-bgAgu1Tg-1
Received: by mail-oi1-f199.google.com with SMTP id
 c5-20020a544e85000000b00361126f6443so3775095oiy.16
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 20:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=52B0mCb/eBcWOdIWbePUJDSUskEVchFnGrmdqaKKfs0=;
 b=UV4TzZ4GpgoRdjVtbuxwd2i1VIlR3mtUhvQo4QFLHYpJFDrfCpafrbS7iaM48vrKOh
 DLyjWhT0ln/svfjB+D1sZgnpRkvy0E3WIquHZtoTo9R1ghye8Tr6nZq7HV6xfwJcFByU
 XTEPkD5bBdBGTDSqYIGyHCf6xojdZouPXPKCzHfpCraq0TvnyygFjcD0d8E0bGCAb0PK
 bp2UxQOo6q/9zxiUEAgCS+Vt02PNqJcDhAkA/DVDMU3k8dqUC7mu1p1thZLVvRdtRgUs
 hmX5fAXNIYqQqHVu7NnmzO/i8UfU8tp14pxNtqPwoTA7+6KR+9RguX1o/aYLcxGjFijp
 NIHg==
X-Gm-Message-State: AO0yUKUOzip7OgVAY04RvvmruGfZwliUeXe45ut8sxz35uSjBQdbvlgN
 2rcqLeIVnnn/mrw6T4d2w7bkLdLApR8DStPWTrRpv7Z/CbyI8Eo5xQ5fc12AYCM1LZk4Ta5UOcd
 AouZodbPW1IkwEy5tNOoFr/MfcjRPPhY=
X-Received: by 2002:a05:6870:959e:b0:163:9cea:eea7 with SMTP id
 k30-20020a056870959e00b001639ceaeea7mr110609oao.35.1674967457161; 
 Sat, 28 Jan 2023 20:44:17 -0800 (PST)
X-Google-Smtp-Source: AK7set9p5mmHrsbSQYJjItW3PetBOxePZcLyjbuuWHHiC3vVnlfhGwZZkNakz3JuGyxRPc7FYS5z1sdOkhFizAkt4zo=
X-Received: by 2002:a05:6870:959e:b0:163:9cea:eea7 with SMTP id
 k30-20020a056870959e00b001639ceaeea7mr110603oao.35.1674967456920; Sat, 28 Jan
 2023 20:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20230118120405.1876329-1-lvivier@redhat.com>
 <158b485a-54f8-b921-51f9-97e7c1cb6848@redhat.com>
In-Reply-To: <158b485a-54f8-b921-51f9-97e7c1cb6848@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 29 Jan 2023 12:44:05 +0800
Message-ID: <CACGkMEs7Na0ZPpmv3QbofwvRLcmtrVxMatxmNoA3nniHh0iLzw@mail.gmail.com>
Subject: Re: [PATCH v7] tests/qtest: netdev: test stream and dgram backends
To: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 26, 2023 at 8:48 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 18/01/2023 13.04, Laurent Vivier wrote:
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > Acked-by: Thomas Huth <thuth@redhat.com>
> > ---
> >
> > Notes:
> >      v7:
> >        - disable test_dgram_mcast() on windows
> >        - disable test_dgram_unix() on windows as it also fails
> >          (we test for unix support dynamically but the test is done with
> >           SOCK_STREAM, and it fails here with SOCK_DGRAM)
> >        - Tested with cirrus-ci (Thank you Thomas)
>
> Thanks, added to my staging branch:
>
>   https://gitlab.com/thuth/qemu/-/commits/staging
>
>    Thomas

I've also queued this since it is required for the patch:

[PATCH v4] net: stream: add a new option to automatically reconnect

Thanks

>


