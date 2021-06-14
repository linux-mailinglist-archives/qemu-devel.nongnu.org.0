Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53473A6C5D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:48:24 +0200 (CEST)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspl9-00012T-MZ
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lspje-00007h-Hl
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lspjY-0000Op-M2
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623689203;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NJ0P/uzA+zT9W1qNlwTiKSQ9DozhukuwdV3HKyMwYGM=;
 b=cjb5HyLzKgV05mlBHk5A7+4MR3HdwQ0HorVPG6nFuatF94WSCwMplWkqJ0536YaaJwHBcZ
 Zwtvv21zQZcSb5e1+pTxiJKupT+gAhEl7qmAIq+ztROirXOjEzwcYL4mRopmzjA3JKvBNT
 64CHSVIHv0N3+UtZ+401Q55qrP91ZUQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-MVl0B6zaOM6LOFXvBwXgxw-1; Mon, 14 Jun 2021 12:46:42 -0400
X-MC-Unique: MVl0B6zaOM6LOFXvBwXgxw-1
Received: by mail-wm1-f69.google.com with SMTP id
 g14-20020a05600c4eceb02901b609849650so6358458wmq.6
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 09:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=NJ0P/uzA+zT9W1qNlwTiKSQ9DozhukuwdV3HKyMwYGM=;
 b=ioVLx/BrtMNDYS0RwqRCCA/pWTWrhMDPEN6cvc2Rp4BOHisMg2i8XHQmLPUpQrKKsg
 uBP0dZx/zYdfPm9cbQyitoQWjvbudjVH6TkR5s0EX00FPzxVI1ucNM0dTHgB7Gc9y8HM
 ueQuodZv8IDbRixEo0iAxvRKKP+PbX11S7eBWGhbv5vBGBN1cFQa238LvpKI2R/sYlTW
 k0HulAkmxc0RJm+BlNhYeTAsUyfsXW2RqG0jjFyktObgXOrAX3WBbyTdi/qWubXdiDXX
 aCA/+xfZ9fpRNIug/Cw31AiAnorJKAB8Dh9gwE1dWrVQkN4oYJaep+jRTUuRteP9r+eV
 Gy5g==
X-Gm-Message-State: AOAM532Hs7WhJ2iMhYK35awncCYZBXawwscWOYxWMLGvNFqNm4JIvl/p
 TuFpjih7gsPEOS65UoGXMTCNIQazNGHbgsuJC9s1OI7DmKvs/N/RqhlaNH4lTDK6tLmYjbzw46q
 EDs6KAZeqyK13anU=
X-Received: by 2002:a05:600c:ada:: with SMTP id
 c26mr33326644wmr.189.1623689201042; 
 Mon, 14 Jun 2021 09:46:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2BmwDcLIejxbq7UJtSMjHkDR7mkriHfcEzg7w0fFfNgzENAbRZvYxU6Qy7gEq6wQVEjsxzw==
X-Received: by 2002:a05:600c:ada:: with SMTP id
 c26mr33326629wmr.189.1623689200902; 
 Mon, 14 Jun 2021 09:46:40 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id t66sm12864wma.41.2021.06.14.09.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 09:46:40 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
In-Reply-To: <20210601141805.206582-1-peterx@redhat.com> (Peter Xu's message
 of "Tue, 1 Jun 2021 10:18:05 -0400")
References: <20210601141805.206582-1-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Mon, 14 Jun 2021 18:46:39 +0200
Message-ID: <875yyggzrk.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Reply-To: quintela@redhat.com
Cc: Chuan Zheng <zhengchuan@huawei.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, huangy81@chinatelecom.cn,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> These two commands are missing when adding the QMP sister commands.  Add them,
> so developers can play with them easier.
>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> Cc: Chuan Zheng <zhengchuan@huawei.com>
> Cc: huangy81@chinatelecom.cn
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
> v2:
> - rebase to "migration/dirtyrate: make sample page count configurable"

Reviewed-by: Juan Quintela <quintela@redhat.com>


