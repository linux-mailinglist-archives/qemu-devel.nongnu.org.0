Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867268692A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:57:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEWg-0003Ab-EC; Wed, 01 Feb 2023 09:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEWc-0002u4-FM
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:55:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEWa-0008Gw-Ha
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675263344;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7dQlAyInA1O6FSItpnxSkIMbEFSr2lLy5NyHC7MNUVk=;
 b=ec0wNqicJCwBxyiDQAoN86gWRW6gah1o5oXwnhiHPZOunLpNYXhSJRkiE5PJTM+XH3N0Yd
 aWiIaA3ZqBSt/fTBYGLycdSH6de1Q4+M8UhFJ6XlkXA0fZXJbG9L4INR8dljJlqEXBp8WU
 thh9yq+eQE6ZSxIJ8nXPGmquF9WnsY0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-t0xNfwXGNfytl0Wm3q7hAw-1; Wed, 01 Feb 2023 09:55:43 -0500
X-MC-Unique: t0xNfwXGNfytl0Wm3q7hAw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg24-20020a05600c3c9800b003db0ddddb6fso10565921wmb.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 06:55:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7dQlAyInA1O6FSItpnxSkIMbEFSr2lLy5NyHC7MNUVk=;
 b=AvqsMNhErXOlREUzhjVREM41PMrE6xWoVyN19Me9mHwVlh7wldYdk7M0EX2qkxGpip
 V/naydL6copKc35Kg9iRLUc/+sMoHT66z8jFg/SDtiZO2Xo4Y7xjPQron0qehtL5gQaM
 MdoCKtCMScWvx/EK6DFJda9Ii090/cJtqgiP/sIqELWKiBX2l1DhN4GHCvtz23BNK4e3
 Aw7IR4Ev+abuy1aUPe1wAgMJrD+0Thwq/voENi40pTjUObdJUTfO7SK4ULbtSjrIwF3u
 1/2H1oimYoBWnktxLUOL8/NEjMt/428YTov4MePRobw95Ybs5WyQKPp+Y73vzSA1z/9y
 R6Wg==
X-Gm-Message-State: AO0yUKVEe556eNYl+p/LVh34z26hXQlIep82Kh5tUFgpJfhgXOE1mUaK
 Z5NVqLL1cCcJMlgo9exMvgLvOBsJWMCKtsqSfBdp/LSP20wsDeXzQpDOQh6NiqcKUMbU5PWHjbV
 EAaYbjeedIytNAfE=
X-Received: by 2002:a5d:5c09:0:b0:2be:5c4a:de6b with SMTP id
 cc9-20020a5d5c09000000b002be5c4ade6bmr3034184wrb.3.1675263342281; 
 Wed, 01 Feb 2023 06:55:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/979tJfsb/Mg5ac7SYZjfMk03uh4cFN5atIsRgVxw0qCu08cl0XDzS+joDbG7itWZxNdT7SQ==
X-Received: by 2002:a5d:5c09:0:b0:2be:5c4a:de6b with SMTP id
 cc9-20020a5d5c09000000b002be5c4ade6bmr3034172wrb.3.1675263342125; 
 Wed, 01 Feb 2023 06:55:42 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b002bdf3809f59sm17089207wrq.38.2023.02.01.06.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 06:55:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  lsoaresp@redhat.com,
 Peter Xu <peterx@redhat.com>,  "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v6 1/2] io: Add support for MSG_PEEK for socket channel
In-Reply-To: <20221220184418.228834-2-manish.mishra@nutanix.com> (manish
 mishra's message of "Tue, 20 Dec 2022 18:44:17 +0000")
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
 <20221220184418.228834-2-manish.mishra@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 15:55:40 +0100
Message-ID: <87357p1llf.fsf@secure.mitica>
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

"manish.mishra" <manish.mishra@nutanix.com> wrote:
> MSG_PEEK peeks at the channel, The data is treated as unread and
> the next read shall still return this data. This support is
> currently added only for socket class. Extra parameter 'flags'
> is added to io_readv calls to pass extra read flags like MSG_PEEK.
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


