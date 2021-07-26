Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178213D5876
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:27:55 +0200 (CEST)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7ym1-0005FN-Rz
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7ykq-0004S1-Ps
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7ykn-0007KN-Nx
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627298796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MgiuaJroI6/bXha0b8DRyoZ1ksyrmZn5hwqGQhjcmcw=;
 b=ZACKWw2vjMHeIDRUOd7QhW2DSSKganVAarogjuvhB2NA2/JeQywjkGRikjgZ2SexyQnWIw
 nUHrprSV9gPmp9CZacrAOHBCxOyUMjNncrfAIYYPGXBhE9918KYKDGWHz1QzF/zQx+bO68
 z9qpxpvWtQQVBxk3V7PczCPxlycO1Vk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-sppLImFWMmGixBW001lNFA-1; Mon, 26 Jul 2021 07:26:33 -0400
X-MC-Unique: sppLImFWMmGixBW001lNFA-1
Received: by mail-wr1-f72.google.com with SMTP id
 a7-20020adfeec70000b0290140ab4d8389so4634316wrp.10
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 04:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MgiuaJroI6/bXha0b8DRyoZ1ksyrmZn5hwqGQhjcmcw=;
 b=dYixNK+m+PB5QlrNjUpXzxNc7xgmeinWiXqTcOjHQhceo9ha8geTwZ3mYIdwGwxVzi
 or7jG8YWNqrJPP9A574K2oD8GCubEPLfnwSoR8zeBWvLG8cgb+S7sRguep+LbLLDSGCV
 NrAdfCq1ThzvfUOwCydLCngozffKAZmVLOrG8MFY9VYfLlME9SfmXOsew8UGO7r4B0OW
 Zmgin7w7FKbEi6B+tuD5Lr7Ha5O2rcIxXn1RdvZ5XZyZ/3AaPslFjW2uMwIcVyqL3ISe
 TAkiy0IqRACCwjao0nQSeD/XZMd/egn5BVufgkwDIPHS87WCWzuyJcC8Poa73pCiO6wb
 QZmQ==
X-Gm-Message-State: AOAM533cVkiVUPsSiau5hgToB3rFehCQFMYaHNrTrhBFGlfJ/VohhURE
 iKAjZmksKPzkCZVUbfH+xVeyVlh3ry/DwoerDjqDFVztW9fN7An/xmyOQLS1lrJyhOCXqTWIsgD
 DN08/zV+a7xHW11yNqtPxGCZsG7SFvQu8bKqWWep6yQEVJyBx7LoxrYYpRRBFn2QIO2U=
X-Received: by 2002:adf:dd89:: with SMTP id x9mr279670wrl.401.1627298791494;
 Mon, 26 Jul 2021 04:26:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ1t3mZQYyk80ENKmALUGSJ8ArvimwyDb1wA6lbqogE6OZa1I3NI5udN/JU54WfaYDSQq6Zw==
X-Received: by 2002:adf:dd89:: with SMTP id x9mr279642wrl.401.1627298791264;
 Mon, 26 Jul 2021 04:26:31 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id q17sm6977500wre.3.2021.07.26.04.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 04:26:30 -0700 (PDT)
Date: Mon, 26 Jul 2021 12:26:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, thuth@redhat.com, peterx@redhat.com,
 berrange@redhat.com, quintela@redhat.com
Subject: Re: [PATCH] tests/qtest/migration-test.c: use 127.0.0.1 instead of 0
Message-ID: <YP6b5KJ8SuHFnIWU@work-vm>
References: <20210719185217.122105-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210719185217.122105-1-dgilbert@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> OpenBSD doesn't like :0 as an address, switch to using 127.0.0.1
> in baddest; it's really testing the :0 port number that isn't allowed
> on anything.
> 
> (The test doesn't currently run anyway because of the userfault
> problem that Peter noticed, but this gets us closer to being able to
> reenable it)
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued

> ---
>  tests/qtest/migration-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 328d6dbe97..1e8b7784ef 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -787,10 +787,10 @@ static void test_baddest(void)
>  
>      args->hide_stderr = true;
>  
> -    if (test_migrate_start(&from, &to, "tcp:0:0", args)) {
> +    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", args)) {
>          return;
>      }
> -    migrate_qmp(from, "tcp:0:0", "{}");
> +    migrate_qmp(from, "tcp:127.0.0.1:0", "{}");
>      wait_for_migration_fail(from, false);
>      test_migrate_end(from, to, false);
>  }
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


