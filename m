Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F84927636A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 23:58:31 +0200 (CEST)
Received: from localhost ([::1]:45366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLCmU-0002J1-7U
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 17:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1kLCl1-0001dc-BK
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 17:56:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1kLCkz-0000Ja-P4
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 17:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600898216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H9Cuh0nkVAYxNUWwTVmVHqbtw5SJpFnY7WUIWoDDEDQ=;
 b=bbWq3nqgRzvqRqr33ZfYEog2wY/kVpOTrOxAGYghIAr1n7hYajmbYwBKAjLM23pY8Ajf1C
 u9oOv5Tx15DUS9NcATbezxmr8vPIj/wcJKci88UK2Dw+G9ptrJ/WACxvHdCN/ommCS9K+C
 NylDMwkZyaeiXmsJ9fpPkGMMJ+4wSa0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-92mEQeNaMpaPIJMvh-pWag-1; Wed, 23 Sep 2020 17:56:55 -0400
X-MC-Unique: 92mEQeNaMpaPIJMvh-pWag-1
Received: by mail-ot1-f72.google.com with SMTP id m8so317879otf.23
 for <qemu-devel@nongnu.org>; Wed, 23 Sep 2020 14:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9Cuh0nkVAYxNUWwTVmVHqbtw5SJpFnY7WUIWoDDEDQ=;
 b=Lx5PZ3H70H5Mx3PJIquVfxxMxSt4sbz+qbmu6zZMoPMQogaLsJM6cmuijpyarxxgOI
 WB3FtSboLZl80aRtM2da2NlgRbrlv7TGueb0SYXY0Zg+CKe+F2qpBOOJH/4ZIvF8f4RJ
 UU7aRTUIsf9unn8RxzMhcW6tktjd6G0SeHBQnuef5cmZIqoouombeTaEjYEOF4QLtX+V
 EfutMrgtluGeFpInPwk9Q5WFf3kqisJ5SD00pG41sjLn7SgrHLcDnWtDso48IzWKBU6N
 tEruFKLwd+nKtCC5Jsz1nUn8luXjIdNjjYYCZscwRB/3PHuPXHurjLh5j8EoYlRN0dHX
 U8FA==
X-Gm-Message-State: AOAM530DUlo1bM0eOlpdGmXLYRu81eqNz8YXWdxVDZLy8L7WQ1oAXTc3
 EhYEZ3EnsSF/GBMZ0pGpm7ieW9159t91FBDKdPoEDYA2fSrQbz1erW4xIGqlq1wFqNDZuIHaQ4Z
 51NcvjlHFaWnNapbZoH7LVFd+WBtcCUo=
X-Received: by 2002:aca:d4cc:: with SMTP id l195mr945765oig.16.1600898214141; 
 Wed, 23 Sep 2020 14:56:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy763dyek9uOmpYwDAAxYjViezZ/cgEyalKLLXiO9JUl97DWFH+9B+H4UMN/EnEiBv9XbP64Ot07PmkiqkcoBg=
X-Received: by 2002:aca:d4cc:: with SMTP id l195mr945754oig.16.1600898213875; 
 Wed, 23 Sep 2020 14:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200923203719.732958-1-eblake@redhat.com>
In-Reply-To: <20200923203719.732958-1-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 24 Sep 2020 00:56:38 +0300
Message-ID: <CAMRbyytkQDyB6s_+SEOr-09aAVDAWK9=PxGK-_wzsNeeKiU39w@mail.gmail.com>
Subject: Re: [PATCH] docs: Better mention of qemu-img amend limitations
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 23, 2020 at 11:38 PM Eric Blake <eblake@redhat.com> wrote:
>
> Missed during merge resolution of commit bc5ee6da71.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/tools/qemu-img.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index c35bd6482203..2b5891b54db7 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -265,6 +265,10 @@ Command description:
>    --force allows some unsafe operations. Currently for -f luks, it allows to
>    erase the last encryption key, and to overwrite an active encryption key.
>
> +  The set of options that can be amended are dependent on the image
> +  format, but note that amending the backing chain relationship should
> +  instead be performed with ``qemu-img rebase``.

Because of the backing format?

> +
>  .. option:: bench [-c COUNT] [-d DEPTH] [-f FMT] [--flush-interval=FLUSH_INTERVAL] [-i AIO] [-n] [--no-drain] [-o OFFSET] [--pattern=PATTERN] [-q] [-s BUFFER_SIZE] [-S STEP_SIZE] [-t CACHE] [-w] [-U] FILENAME
>
>    Run a simple sequential I/O benchmark on the specified image. If ``-w`` is
> --
> 2.28.0
>
>


