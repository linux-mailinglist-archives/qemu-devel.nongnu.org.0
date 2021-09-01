Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D3E3FD8D0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:33:47 +0200 (CEST)
Received: from localhost ([::1]:58054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOV0-0001kX-C3
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLOP8-00043n-3u
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:27:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLOP6-0007Wo-Jh
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630495659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xqrPYWuWt9ilqeo22SnuQmF8xhnohTA4WP6q+h5KJPo=;
 b=ZkCzij5oxwt5ChrZ2G4OPyoPxjsLn7D57hjaIg5/99j3DLDLCsZNqZ5Y08vzmTxYzNiXaG
 KUYjQC9yY44JOcCi4eC1vhQPgQZ7YDFtKOkA89ASfN7ESiZ+dndfswVCeSzWgB0qaruoWC
 MdZdJiYzjE2tMJFTdhmurtYVDSB0Heg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353--AF5SZ8INbiR5GLnaoZmuA-1; Wed, 01 Sep 2021 07:27:36 -0400
X-MC-Unique: -AF5SZ8INbiR5GLnaoZmuA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so891573wmq.8
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 04:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xqrPYWuWt9ilqeo22SnuQmF8xhnohTA4WP6q+h5KJPo=;
 b=lF2zmJtMoBWTrRia31iQyU78bCYhJmTzEwFrqHcKQwMGwxkJTbhM1Qw2KLcqjJjNck
 XEnsUXm9P9Oyjf9wgyu94MplaRqhGHeNV4yYdqb2d0KlA/IEcy2X+wDfaspkab54xa6s
 Obli8T2IceRJQPgdOZ/xJuxDwZXnq5AQxN0c07q5RF2aeuKfJIVijroeMmJ+6PNPz/B0
 LasKBR52T7iPLunJgS2E8iEt93spqtFJuJAvJ2gdl4yXK1WAe/EVHsz7BGYlLujL3lpS
 8UIVjB0cs3d5oun4onHHcWMKb1gJd6emqD/XcJ5fPzj5KkkNtkaN4iXS4v1GTQbRkaRM
 IgXQ==
X-Gm-Message-State: AOAM5306mYQu2898fyTDpzhWT02ASyaDQ3h8MNCVtZIdcxRQ7Qt2XKUS
 GmzfUXGNH+UDLGiHk60xOu2t8e6zhFy3H6zky3sGLppksu/vFPDw23NNP0ejqMIP7D0MOAvoBj/
 Bzcu8rH8lJpbaWPM=
X-Received: by 2002:a1c:a78a:: with SMTP id q132mr9170036wme.91.1630495655135; 
 Wed, 01 Sep 2021 04:27:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg16JoY0jxrodQ/3+P3xGc2mam/DgDTu1Q5CmJ1MUhvJbtWkwMlBB7H+CbLsBNY0eMVUyZlg==
X-Received: by 2002:a1c:a78a:: with SMTP id q132mr9169998wme.91.1630495654743; 
 Wed, 01 Sep 2021 04:27:34 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 q13sm4871186wmj.46.2021.09.01.04.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 04:27:34 -0700 (PDT)
Subject: Re: [PATCH v5] block/file-win32: add reopen handlers
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>, philmd@redhat.com,
 kwolf@redhat.com, sw@weilnetz.de, yan@daynix.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210825173625.19415-1-viktor.prutyanov@phystech.edu>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <6519cf03-2fc8-799b-cf38-355eb9f1a3da@redhat.com>
Date: Wed, 1 Sep 2021 13:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825173625.19415-1-viktor.prutyanov@phystech.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Helge Konetzka <hk@zapateado.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.08.21 19:36, Viktor Prutyanov wrote:
> Make 'qemu-img commit' work on Windows.
>
> Command 'commit' requires reopening backing file in RW mode. So,
> add reopen prepare/commit/abort handlers and change dwShareMode
> for CreateFile call in order to allow further read/write reopening.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/418
>
> Suggested-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> Tested-by: Helge Konetzka <hk@zapateado.de>
> ---
>   v2:
>      - fix indentation in raw_reopen_prepare
>      - free rs if raw_reopen_prepare fails
>   v3:
>      - restore suggested-by field missed in v2
>   v4:
>      - add file type check
>      - add comment about options
>      - replace rs check with assert in raw_reopen_commit
>   v5:
>      - add CloseHandle at AIO attach fail
>
>   block/file-win32.c | 101 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 100 insertions(+), 1 deletion(-)

Thanks!  I’ve applied this patch to my block branch:

https://github.com/XanClic/qemu/commits/block

Hanna


