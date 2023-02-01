Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D93686EAA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:09:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNITw-0002xz-Dy; Wed, 01 Feb 2023 14:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNITt-0002xm-JK
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:09:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNITr-00066h-Sc
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675278554;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8QpIcP3/AclLsJANHXkKGz0p5eefwkr208B1xz0nqCc=;
 b=YDo/xuSQJVtQGeBFbskDdZrMlG+rWP/vQgGhWWeCTb6gdqcKqyiSsYaBwO0sDpozOnvPUG
 p8y99/gjj22vROpeuVqazG8u4zIIYS7azZ+lhGjuTwkYkTRT30gO2tkKyhtFg464izwE7O
 vMHng9BG6WxSIsOdS1fVnDmA7ODpgHo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-462-aOsl2ZH1PUSdgHk64Ug0vw-1; Wed, 01 Feb 2023 14:09:06 -0500
X-MC-Unique: aOsl2ZH1PUSdgHk64Ug0vw-1
Received: by mail-wm1-f71.google.com with SMTP id
 d18-20020a05600c34d200b003df901ab982so246260wmq.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8QpIcP3/AclLsJANHXkKGz0p5eefwkr208B1xz0nqCc=;
 b=3e1iNbcJw2Zb6khg3hRv/TG2O9myuMVAh0zZCCT0UeSHbWJpFSji9Rc1S3LKGw8U88
 ScyN/PFRqOI3xSHXKwzPJp5VJpt2hBWzmrtEhio+jHIwWeUBVX8H9G6jGYpCgEkNSlCq
 W0swPtQ5ekv/MECLBDAD0c6QxaflZz63nKMyvWhJR68VonFw1Ccx7PcGNrEnK817BWcG
 aInRv/4VR3ewFiBTv3AyxQ8PpmjS7tqOIJqBcyYoogm5XU8WCveSkQi3N2+l9bhUY8cz
 cb8oAAnCjD1+qfDD10fI20+b3GSpioy9W7U1Vr9DnhTh5NwpkQaUoQvcBEQnZiLwhLSy
 gh6g==
X-Gm-Message-State: AO0yUKX1rnAg7Y1yqxa3P3Jpi8yvjULMluCma4PzGzl8Uw+3W+JVZtCA
 CrBE7xXksXXmJhI28KlG6KKyUjuzymP5QCTW+sganOY/ChPoOXpb+7y9eoff0CcVpEbLbfJ1FBU
 fH16clsxqcIKa5Gs=
X-Received: by 2002:adf:ed83:0:b0:2bf:ae4b:8649 with SMTP id
 c3-20020adfed83000000b002bfae4b8649mr7222092wro.29.1675278545000; 
 Wed, 01 Feb 2023 11:09:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/D8zQoMGZQlvOwSl/wBYMtEP++hUhkJ/45Zy0PhevMzPg5cUWOrgvJ59SYo9RyyL25gEHhPQ==
X-Received: by 2002:adf:ed83:0:b0:2bf:ae4b:8649 with SMTP id
 c3-20020adfed83000000b002bfae4b8649mr7222082wro.29.1675278544842; 
 Wed, 01 Feb 2023 11:09:04 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b002be34f87a34sm18194167wrr.1.2023.02.01.11.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 11:09:03 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 18/21] migration: Allow
 postcopy_register_shared_ufd() to fail
In-Reply-To: <20230117220914.2062125-19-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:11 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-19-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 20:09:03 +0100
Message-ID: <87mt5xw6cw.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Peter Xu <peterx@redhat.com> wrote:
> Let's fail double-map for vhost-user and any potential users that can have
> a remote userfaultfd for now.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

But

> -void postcopy_register_shared_ufd(struct PostCopyFD *pcfd)
> +int postcopy_register_shared_ufd(struct PostCopyFD *pcfd)
>  {
>      MigrationIncomingState *mis = migration_incoming_get_current();
>  
> +    if (migrate_hugetlb_doublemap()) {
> +        return -EINVAL;

I am not sure that -EINVAL is the best answer here.
There is not a problem with the value.  The problem is that both
features together don't work.

As an alternative:

ENOSYS 38 Function not implemented

But I am not sure that this is much better :-(

Later, Juan.


