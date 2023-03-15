Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BFA6BBDF9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 21:32:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcXle-0004I5-DH; Wed, 15 Mar 2023 16:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcXlc-0004Hu-CS
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 16:30:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcXla-0005iV-PU
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 16:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678912232;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNroU4OwaXj+QofMGCsKJc1IHE/7ob3FCwLCk3lREQs=;
 b=WkQubFYEntElj8QlyPXTqMUDZNXuKQ9/w3M/hzbtakCjZnr2KOQeEv9x66Ci+XOUdGcM7P
 30VzJmPxM/Nkt32S2QRiTlQB6d9aa4j3tINgVFOizwsldfCULvPumPBeHqeNyvDFppf5Pa
 43Tjo6/QNlWL8yPfxApOsDEiqoYp0fA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-BWqZLHTlOvylmV-mkdwYhw-1; Wed, 15 Mar 2023 16:30:31 -0400
X-MC-Unique: BWqZLHTlOvylmV-mkdwYhw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o42-20020a05600c512a00b003ed26fa6ebdso1180955wms.7
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 13:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678912230;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RNroU4OwaXj+QofMGCsKJc1IHE/7ob3FCwLCk3lREQs=;
 b=6pbei0kmcU0RIS2b2DpgGHiQBfEHNWZTg4NGMXl7wdpCdoPHHxhTJ72aTxk729RcgA
 ofoV0YddReQCttne7xahSGGxEF+Ky5mgp9Raz0d4vqRYiuxSlxeGxk58uvpiAn5Kb4C7
 BPw7ihsznAzNSFDGLZL+GddhPAcR2UposphpZoalKq0sn5RtlUgWSiWBo0pb3bNhOuws
 K0zE8/fGxYrliCxLgFXmpwq59kXfu18NQCPRBh/NbYqgV0gaKjaF62gYz4HcM6MqT9dl
 GQlZ6aHHjgITsKDJhMSCZ9qmmjRElu5j2UPRro+qtxvC7DdQqhp6x6q4gTwbbEM5XCRs
 BARw==
X-Gm-Message-State: AO0yUKXC4l3E3mCxuFoBnRVj7tNqpTi1K1p6ne8EoIj1aEYU4NXTl8b/
 QRyfZ/rtw+WhmlyiFaaUzmYk71LJWaIBrdlFKxB0EihW8FTgV0v8thAeArmqNYk0HCJddbb6ygo
 fMVe6GnOhu0q16UY=
X-Received: by 2002:a5d:45cc:0:b0:2c7:cbea:1140 with SMTP id
 b12-20020a5d45cc000000b002c7cbea1140mr2731623wrs.71.1678912230118; 
 Wed, 15 Mar 2023 13:30:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set9exaDdystYcpWncCuaT4kEcrX+T+z/tNezm3Z7O3uxfeBROsmeu+KFtXzbdQnaIN9/sbloGA==
X-Received: by 2002:a5d:45cc:0:b0:2c7:cbea:1140 with SMTP id
 b12-20020a5d45cc000000b002c7cbea1140mr2731607wrs.71.1678912229849; 
 Wed, 15 Mar 2023 13:30:29 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adffbcd000000b002c55521903bsm5372022wrs.51.2023.03.15.13.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 13:30:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,  Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Stefan
 Berger <stefanb@linux.vnet.ibm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 1/3] scripts/git.orderfile: Display QAPI script
 changes before schema ones
In-Reply-To: <20230315112811.22355-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 15 Mar 2023 12:28:09
 +0100")
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-2-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Mar 2023 21:30:28 +0100
Message-ID: <87ilf1oizf.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> When modifying QAPI scripts and modifying C files along,
> it makes sense to display QAPI changes first.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


