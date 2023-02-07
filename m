Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6E068D1A6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:45:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJbh-0001J1-LI; Tue, 07 Feb 2023 03:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJbP-0001GO-9T
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:45:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJbN-0003fb-4V
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675759519;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0jfXxAsZ0e/Ox7ungrineM9u+CBBn5iRwzZ0QAgIiUU=;
 b=hceXqJOTwu6L8gpUvMt0ITQN62lmcVtyl5U+9dr8a4uhbTPtyzkLX7h66sBHiZ1XFM8BcS
 NkI6veq66LVcLZ4iuc/hO+bM0ip7P/blfYhSyvobkR+wSqgPhYJACieZrjEXzKvLznKF9f
 B1KY9Q8WYQCI4y8/htOPODaNBu33qfg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-355-9sm05yE_Nb6zFONT7MOIQw-1; Tue, 07 Feb 2023 03:45:17 -0500
X-MC-Unique: 9sm05yE_Nb6zFONT7MOIQw-1
Received: by mail-wm1-f69.google.com with SMTP id
 a20-20020a05600c349400b003dfecb98d38so6246494wmq.0
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jfXxAsZ0e/Ox7ungrineM9u+CBBn5iRwzZ0QAgIiUU=;
 b=ysVsdCmpmdgXZkfv9mu5HM4+ga4isNcZbAPAwjOMsgltWBiwVKlWEzZK29ex+O395K
 W/jyjSiKdMF2x9imwCa2bae/Fb2C8hvjxsMd6F4on25CuIn2QKXr9O/QMBfYTbN/TKan
 mL8qxu3gFF5/zJcPAgjafjUpHVbn74LsRVUeFdEl1k9kJuxxUv8chheNCreIlUs7wSFd
 vHukxGBMbmi/c6Io/QATQH8aRScVqGwJlPK9BUctf8UUj3NN33nckjebha790JHPsipI
 clFmmmP3YB1giWppma7pxwaH2XykecXpa6lZLHwvwmKuOK5ztBpwrg3MTdoSN+CfzjyS
 B9wQ==
X-Gm-Message-State: AO0yUKWNkC1s3mR3chVDfPAXeUJ0nqO3B+GlAOcJBmClr9WL7FNHLkEV
 C/0IckIAZQCUybkQRykS942VQsc9Vmn8yoP+Rm+6TyetU5poHHJPNnNgT3E+oQCIIEdbEMuRMTF
 qU/hUjD6FXEl9EqI=
X-Received: by 2002:a5d:6a08:0:b0:2c3:deca:338d with SMTP id
 m8-20020a5d6a08000000b002c3deca338dmr1823998wru.25.1675759516669; 
 Tue, 07 Feb 2023 00:45:16 -0800 (PST)
X-Google-Smtp-Source: AK7set967jhj9qh87aPTzBWPdHxkFXWcv1xmOQ1On9IYqHztUIo3Zm8qym3b7K6cxAwolLp9T/B1Og==
X-Received: by 2002:a5d:6a08:0:b0:2c3:deca:338d with SMTP id
 m8-20020a5d6a08000000b002c3deca338dmr1823970wru.25.1675759516448; 
 Tue, 07 Feb 2023 00:45:16 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d514d000000b002c3f50228afsm921902wrt.3.2023.02.07.00.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:45:15 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 01/12] error: Drop superfluous #include "qapi/qmp/qerror.h"
In-Reply-To: <20230207075115.1525-2-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 7 Feb 2023 08:51:04 +0100")
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-2-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 09:45:14 +0100
Message-ID: <87zg9pc19h.fsf@secure.mitica>
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

Markus Armbruster <armbru@redhat.com> wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  authz/listfile.c               | 1 -
>  backends/cryptodev-vhost.c     | 1 -
>  backends/rng.c                 | 1 -
>  backends/vhost-user.c          | 1 -
>  block/backup.c                 | 1 -
>  block/commit.c                 | 1 -
>  block/mirror.c                 | 1 -
>  block/stream.c                 | 1 -
>  hw/core/machine.c              | 1 -
>  hw/i386/pc.c                   | 1 -
>  hw/i386/x86.c                  | 1 -
>  hw/misc/xlnx-zynqmp-apu-ctrl.c | 1 -
>  migration/colo.c               | 1 -
>  migration/migration-hmp-cmds.c | 1 -
>  qga/main.c                     | 1 -
>  softmmu/qtest.c                | 1 -
>  target/i386/monitor.c          | 1 -
>  target/i386/sev-sysemu-stub.c  | 1 -
>  target/i386/sev.c              | 1 -
>  util/qemu-config.c             | 1 -
>  20 files changed, 20 deletions(-)
>
> diff --git a/authz/listfile.c b/authz/listfile.c

Reviewed-by: Juan Quintela <quintela@redhat.com>


