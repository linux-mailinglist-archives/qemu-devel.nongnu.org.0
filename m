Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40A36A6C28
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:14:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLLi-0007cb-Ms; Wed, 01 Mar 2023 07:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXLLf-0007bs-JV
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:14:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXLLc-0005Mi-VH
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677672856;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lv40Kn/Y24+MEtMwfFUGc9IW8P9QonFwfp/VQszCnYw=;
 b=U3CI/dnvNq9mgdU5BMdnU1cWpSnU8B22S3EiaOM2IYM5yfrbV0fB25wVf1b6QiGddPhtP6
 xA5FaWPgZSwUxX5oaWIfAIwHNd5lF3jt1Q2Iyo+UeW4dE7VBb3rLqqAtvosRVuZLwsO6jc
 78i1X8ick4BhCuFoa0FYP72Hft2IHGU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-mHillx30Pvm9jJxj8Cwu4g-1; Wed, 01 Mar 2023 07:14:14 -0500
X-MC-Unique: mHillx30Pvm9jJxj8Cwu4g-1
Received: by mail-wm1-f72.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so4018387wmq.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 04:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677672853;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lv40Kn/Y24+MEtMwfFUGc9IW8P9QonFwfp/VQszCnYw=;
 b=VsZvdre1JMSpR2h7kB19r14NfHCatsBVUdf3pQFSsy+megUoTkp+8W4uXaE4hyt14L
 wrkOaimgU8YmcNE3+z6r38933CJyn+hBCgql0rO1T2ur7xvfLTdYYGjDqewk+LyqquBO
 0RFpFKuYyVGunigdDcPxVQlmEMc43Q9ToZQnTEl7E0gqWqx/DGBJVXJL3jCcM07Sg5r/
 azqDT6UZcJpro1z2xyjigp4Vt1rY1TD/ihMKzl58ckiAr8EQ8AVMHzAFuiSKnvRtx7c4
 rLqTfcOxGEOBvRjavS/obePXUcTwTMcDrOOWGpMDs4qxvAXXlHW3dTAHsd1fEFTeiaOj
 H44A==
X-Gm-Message-State: AO0yUKU/ThIkF1xwV6PvZgQ6kMFwIo/2J/nqxNbolQ3KyOHV+flTTjFH
 DhAIijdZ8EiSnl8NqNyxM+SfO1fv14tl9G6UKmQZ+/HfEK3GU6Ktj9ECLtCxjNelqpBBrxbhc3p
 vhYluC7Pi7mXOerc=
X-Received: by 2002:adf:ce91:0:b0:2c9:bb03:7843 with SMTP id
 r17-20020adfce91000000b002c9bb037843mr4527881wrn.69.1677672853679; 
 Wed, 01 Mar 2023 04:14:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9UMKW2qVLma3nPlex8WZefMjjRMObmYrl+OQiRsqsB9RquqmHRBiTaFHEVDbRz/WeHy1VAaw==
X-Received: by 2002:adf:ce91:0:b0:2c9:bb03:7843 with SMTP id
 r17-20020adfce91000000b002c9bb037843mr4527842wrn.69.1677672853321; 
 Wed, 01 Mar 2023 04:14:13 -0800 (PST)
Received: from redhat.com ([47.63.153.28]) by smtp.gmail.com with ESMTPSA id
 i2-20020adfdec2000000b002c71dd1109fsm12453879wrn.47.2023.03.01.04.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 04:14:12 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,  Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Claudio
 Fontana <cfontana@suse.de>,  Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>,  Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Igor Mammedov
 <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
In-Reply-To: <20230228192628.26140-10-farosas@suse.de> (Fabiano Rosas's
 message of "Tue, 28 Feb 2023 16:26:28 -0300")
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Mar 2023 13:14:10 +0100
Message-ID: <87a60wk6st.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fabiano Rosas <farosas@suse.de> wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.

Ouch.

Just curious: why are they needed?

>
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
>
> Fix tests that crash or hang in the above scenario. Do not include any
> test cases if TCG and KVM are missing.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> This currently affects Arm, but will also affect x86 after the xenpvh
> series gets merged. This patch fixes both scenarios.

Reviewed-by: Juan Quintela <quintela@redhat.com>


