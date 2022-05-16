Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388C527EAD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 09:37:38 +0200 (CEST)
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqVIO-0007vj-Nq
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 03:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqV5p-0006lA-L5
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:24:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqV5o-00006c-7k
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652685875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j664422iCEo/8xsPOKEfneSwhGQ3f8C0JnCm0tT85l4=;
 b=WfwenWMgxBdRHaCIeW0/1YpMv3TMwWWTSsWdZEYjHKx7n3W3Bi2GYYMaoyU4fvaf15NJ0n
 ge2EQwZTf6Xe/0gjTFZnUT4wtbMBXOZ3cCuN1Wjln+pJop43GlV4NPfdjTJCbuRGvUVF6C
 bJZh5t/WyVy1+p7j9oje6jKVSok4duU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-SHhd-LzqO6OcInxntqMzVg-1; Mon, 16 May 2022 03:24:32 -0400
X-MC-Unique: SHhd-LzqO6OcInxntqMzVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C406F3C0D183;
 Mon, 16 May 2022 07:24:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 164532166B25;
 Mon, 16 May 2022 07:24:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 11DB121E690D; Mon, 16 May 2022 09:24:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 06/15] qga: use qemu_open_cloexec() for
 safe_open_or_create()
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-7-marcandre.lureau@redhat.com>
Date: Mon, 16 May 2022 09:24:18 +0200
In-Reply-To: <20220513180821.905149-7-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 13 May 2022 20:08:12 +0200")
Message-ID: <87ee0uey8t.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The function takes care of setting CLOEXEC, and reporting error.
>
> The reported error message will differ, from:
>   "failed to open file 'foo' (mode: 'r')"
> to:
>   "Failed to open file 'foo'"
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I don't like the first message's "(mode: 'r')", because it talks code to
the user.  Better: "for reading".  I'm not sure how useful the "for
reading" bit of information is here.  You decide.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


