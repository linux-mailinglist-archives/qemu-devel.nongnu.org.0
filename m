Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7885EF7FC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:47:19 +0200 (CEST)
Received: from localhost ([::1]:33766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduoo-0006st-Dg
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ods8P-0003PM-U4
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:55:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ods8O-0003a6-3k
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664452519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2PVy8yW75eKqf2xWdxERQ/sWg3yge3y5Hjk96G2T0Y=;
 b=R4AT3s5EuCGzsFL4KBN/jYuTuCXwnhGGNYpCeAzpTf760Xlf/rpTlMOR+wJ+kaq/dM9oms
 vqQ8X0jEoslZv2DdmflsN7wZrKHuahsXYp+MHI6V9jiEByJNMt6QhEkda62xei24E83qtb
 0HnOiyGD/sY8oUEbcPx7WL0eh+mGyo8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-VipfbthFOC69WmCuadHZzA-1; Thu, 29 Sep 2022 07:55:18 -0400
X-MC-Unique: VipfbthFOC69WmCuadHZzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8807185A7A3;
 Thu, 29 Sep 2022 11:55:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EAE72166B26;
 Thu, 29 Sep 2022 11:55:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 47F6921E691D; Thu, 29 Sep 2022 13:55:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Bin Meng <bin.meng@windriver.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH v5 2/2] block: Refactor get_tmp_filename()
References: <20220928144125.1997128-1-bmeng.cn@gmail.com>
 <20220928144125.1997128-2-bmeng.cn@gmail.com>
Date: Thu, 29 Sep 2022 13:55:16 +0200
In-Reply-To: <20220928144125.1997128-2-bmeng.cn@gmail.com> (Bin Meng's message
 of "Wed, 28 Sep 2022 22:41:25 +0800")
Message-ID: <87v8p6s8d7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present there are two callers of get_tmp_filename() and they are
> inconsistent.
>
> One does:
>
>     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
>     char *tmp_filename = g_malloc0(PATH_MAX + 1);
>     ...
>     ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
>
> while the other does:
>
>     s->qcow_filename = g_malloc(PATH_MAX);
>     ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
>
> As we can see different 'size' arguments are passed. There are also
> platform specific implementations inside the function, and the use
> of snprintf is really undesirable.
>
> The function name is also misleading. It creates a temporary file,
> not just a filename.
>
> Refactor this routine by changing its name and signature to:
>
>     char *create_tmp_file(Error **errp)
>
> and use g_file_open_tmp() for a consistent implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


