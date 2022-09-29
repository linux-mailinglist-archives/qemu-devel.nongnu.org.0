Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F05EF7B9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:36:14 +0200 (CEST)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odudp-0004bc-9y
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ods48-0001M5-FG
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ods3w-0002sP-AO
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664452243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UKAXEe+rektoZxEHcM9MzMeGI6pexiVnrexKX9dg85k=;
 b=fF0R8Yg8X4BcFf0VQhDTptbdOC5FH0B0ofWdHZWqC+d3eu5AiSnrGnUB/8fsUduVd+018/
 sYa975uXtcyMnqgGxUIbVnOf0/EmmSt6Ng1CXfxOUlU7WeoHZLahvUQAcKq3Qi6UB7giF0
 znyONz+MylZBqIrPImRzp2v83RWO/RA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-h22guvwyPzKw9yCE1aNF8g-1; Thu, 29 Sep 2022 07:50:35 -0400
X-MC-Unique: h22guvwyPzKw9yCE1aNF8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2749185A7AB;
 Thu, 29 Sep 2022 11:50:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EBC023177;
 Thu, 29 Sep 2022 11:50:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E17E821E691D; Thu, 29 Sep 2022 13:50:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Bin Meng <bin.meng@windriver.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH v5 1/2] block: Ignore close() failure in get_tmp_filename()
References: <20220928144125.1997128-1-bmeng.cn@gmail.com>
Date: Thu, 29 Sep 2022 13:50:32 +0200
In-Reply-To: <20220928144125.1997128-1-bmeng.cn@gmail.com> (Bin Meng's message
 of "Wed, 28 Sep 2022 22:41:24 +0800")
Message-ID: <87zgeis8l3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> The temporary file has been created and is ready for use. Checking
> return value of close() does not seem useful. The file descriptor
> is almost certainly closed; see close(2) under "Dealing with error
> returns from close()".
>
> Let's simply ignore close() failure here.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v5:
> - new patch: "block: Ignore close() failure in get_tmp_filename()"
>
>  block.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/block.c b/block.c
> index bc85f46eed..582c205307 100644
> --- a/block.c
> +++ b/block.c
> @@ -886,10 +886,7 @@ int get_tmp_filename(char *filename, int size)
>      if (fd < 0) {
>          return -errno;
>      }
> -    if (close(fd) != 0) {
> -        unlink(filename);
> -        return -errno;
> -    }
> +    close(fd);
>      return 0;
>  #endif
>  }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


