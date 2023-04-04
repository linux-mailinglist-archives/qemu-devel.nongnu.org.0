Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517336D62A8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:21:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgZw-0002rj-Vg; Tue, 04 Apr 2023 09:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pjgZk-0002rU-Qo
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:19:52 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pjgZh-0003FR-33
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:19:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id d13so30497113pjh.0
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1680614379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PjVELLAgugpfO/euiR859sBpJpQTB8y5gQ+mLYIkonE=;
 b=UPgYwKYuxA0EGIh25twa4Tt0SjI6sJTN+dqFSgsajbSgXFSeTVyRXt22wd14Uh0b+D
 lMgA+elSQVImtITs0CTniRJ/PFShmgTUOWqryT2KBHJpD+Q4B2iq/dTltFRpChBRtdd7
 5VZbULFBpA+LcR8Gd9Wbr6LtqWgphfYYsiinsM2tyyeGY84k1ZJWAxvlm2YmdbR2/IM3
 mFr5US8apzAcF3ewt7ilY1esFnshMLhaC9Us0k3DbEW2z1ipUX8P+MGpQjNtK2BYFgPW
 G7JCSCwXt/tL4bzkzVeiHAmQDXL5pl63UCYRzaa4s76t2cyyT+3xUBP5ef+S0EKcteya
 2Gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680614379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PjVELLAgugpfO/euiR859sBpJpQTB8y5gQ+mLYIkonE=;
 b=lLJdNgpBNl8oL1fFvzaS3dkyvY2nzw/5KXSk40obnVyS+wJ2zGjzOV9BVYVyQGIJ8e
 nUliqvzVt/4IGmbXx1kuO3pzbUtMfKQZM7cdY3f1X2h6qQyoQkljoYuQ6gSXxpzqdm8d
 rAUBb1G9csfft7V4RyfxxgEm1khMVTTCvzOMQRQq1E/bjgGbCSGEhFlJspzKzSZfujEF
 WQhWZ4Y3Xaz4XLt4DR8dPyaYb5+d/QT2bxTlBakmfjz3ApMv/lj3YuOR5w08YzJTqH+z
 B5m1mIQVZkzYtzEvCDIdHcfDuiLvVbl6RWfYpeICpm08cA+jUNECSQHWUrOV42v8f0mQ
 KiAA==
X-Gm-Message-State: AAQBX9eHPw7upk87fPfk1+FHRXyyxYL2SvMC1UXU7xgnFPa4BnqSJ7vt
 h/LTlw/30OhjyvQvKRgtvslUSw==
X-Google-Smtp-Source: AKy350aD55qsUK8AXdHq7+bUjrvvEv1aoHfmUGkChrttbUOtZzUVDeHv3TflbfXZiKgDFkddQ3+KUQ==
X-Received: by 2002:a05:6a20:7927:b0:de:2799:12ed with SMTP id
 b39-20020a056a20792700b000de279912edmr2222142pzg.29.1680614379173; 
 Tue, 04 Apr 2023 06:19:39 -0700 (PDT)
Received: from [10.5.15.76] ([139.177.225.235])
 by smtp.gmail.com with ESMTPSA id
 t126-20020a635f84000000b004fb26a80875sm7666188pgb.22.2023.04.04.06.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:19:38 -0700 (PDT)
Message-ID: <a28931b4-734e-930a-5e5a-91b1a71ea6fb@bytedance.com>
Date: Tue, 4 Apr 2023 21:19:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 16/16] qapi storage-daemon/qapi: Fix documentation section
 structure
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 quintela@redhat.com, jasowang@redhat.com, yuval.shaia.ml@gmail.com,
 stefanha@redhat.com, kraxel@redhat.com, kkostiuk@redhat.com,
 qemu-block@nongnu.org
References: <20230404115912.2829251-1-armbru@redhat.com>
 <20230404115912.2829251-17-armbru@redhat.com>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230404115912.2829251-17-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Looks good to me, thanks!

Acked-by: zhenwei pi <pizhenwei@bytedance.com>

On 4/4/23 19:59, Markus Armbruster wrote:
> In the QEMU QMP Reference Manual, subsection "Block core (VM
> unrelated)" is empty.  Its contents is at the end of subsection
> "Background jobs" instead.  That's because qapi/job.json is includeded
> first from qapi/block-core.json, which makes qapi/job.json's
> documentation go between qapi/block-core.json's subsection heading and
> contents.
> 
> In the QEMU Storage Daemon QMP Reference Manual, section "Block
> Devices" contains nothing but an empty subsection "Block core (VM
> unrelated)".  The latter's contents is at the end section "Socket data
> types", along with subsection "Block device exports".  Subsection
> "Background jobs" is at the end of section "Cryptography".  All this
> is because storage-daemon/qapi/qapi-schema.json includes modules in a
> confused order.
> 
> Fix both as follows.
> 
> Turn subsection "Background jobs" into a section.
> 
> Move it before section "Block devices" in the QEMU QMP Reference
> Manual, by including qapi/jobs.json right before qapi/block.json.
> 
> Reorder include directives in storage-daemon/qapi/qapi-schema.json to
> match the order in qapi/qapi-schema.json, so that the QEMU Storage
> Daemon QMP Reference Manual's section structure the QEMU QMP Reference
> Manual's.
> 
> In the QEMU QMP Reference Manual, qapi/cryptodev.json's documentation
> is at the end of section "Virtio devices".  That's because it lacks a
> section heading, and therefore gets squashed into whatever section
> happens to precede it.
> 
> Add section heading so it's in section "Cryptography devices".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qapi/cryptodev.json                  |  4 ++++
>   qapi/job.json                        |  2 +-
>   qapi/qapi-schema.json                |  2 +-
>   storage-daemon/qapi/qapi-schema.json | 22 +++++++++++++++-------
>   4 files changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
> index f33f96a692..cf960ea81f 100644
> --- a/qapi/cryptodev.json
> +++ b/qapi/cryptodev.json
> @@ -4,6 +4,10 @@
>   # This work is licensed under the terms of the GNU GPL, version 2 or later.
>   # See the COPYING file in the top-level directory.
>   
> +##
> +# = Cryptography devices
> +##
> +
>   ##
>   # @QCryptodevBackendAlgType:
>   #
> diff --git a/qapi/job.json b/qapi/job.json
> index bc4104757a..9e29a796c5 100644
> --- a/qapi/job.json
> +++ b/qapi/job.json
> @@ -2,7 +2,7 @@
>   # vim: filetype=python
>   
>   ##
> -# == Background jobs
> +# = Background jobs
>   ##
>   
>   ##
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index e57d8ff801..bb7217da26 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -43,11 +43,11 @@
>   { 'include': 'sockets.json' }
>   { 'include': 'run-state.json' }
>   { 'include': 'crypto.json' }
> +{ 'include': 'job.json' }
>   { 'include': 'block.json' }
>   { 'include': 'block-export.json' }
>   { 'include': 'char.json' }
>   { 'include': 'dump.json' }
> -{ 'include': 'job.json' }
>   { 'include': 'net.json' }
>   { 'include': 'rdma.json' }
>   { 'include': 'rocker.json' }
> diff --git a/storage-daemon/qapi/qapi-schema.json b/storage-daemon/qapi/qapi-schema.json
> index 67749d1101..f10c949490 100644
> --- a/storage-daemon/qapi/qapi-schema.json
> +++ b/storage-daemon/qapi/qapi-schema.json
> @@ -15,18 +15,26 @@
>   
>   { 'include': '../../qapi/pragma.json' }
>   
> +# Documentation generated with qapi-gen.py is in source order, with
> +# included sub-schemas inserted at the first include directive
> +# (subsequent include directives have no effect).  To get a sane and
> +# stable order, it's best to include each sub-schema just once, or
> +# include it first right here.
> +
> +{ 'include': '../../qapi/common.json' }
> +{ 'include': '../../qapi/sockets.json' }
> +{ 'include': '../../qapi/crypto.json' }
> +{ 'include': '../../qapi/job.json' }
> +
>   ##
>   # = Block devices
>   ##
>   { 'include': '../../qapi/block-core.json' }
>   { 'include': '../../qapi/block-export.json' }
> +
>   { 'include': '../../qapi/char.json' }
> -{ 'include': '../../qapi/common.json' }
> -{ 'include': '../../qapi/control.json' }
> -{ 'include': '../../qapi/crypto.json' }
> -{ 'include': '../../qapi/introspect.json' }
> -{ 'include': '../../qapi/job.json' }
>   { 'include': '../../qapi/authz.json' }
> -{ 'include': '../../qapi/qom.json' }
> -{ 'include': '../../qapi/sockets.json' }
>   { 'include': '../../qapi/transaction.json' }
> +{ 'include': '../../qapi/control.json' }
> +{ 'include': '../../qapi/introspect.json' }
> +{ 'include': '../../qapi/qom.json' }

-- 
zhenwei pi

