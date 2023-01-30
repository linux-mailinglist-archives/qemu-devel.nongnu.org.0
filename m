Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FF868054D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:58:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMEW-00086U-93; Sun, 29 Jan 2023 23:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMEU-00086A-H8
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:57:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMET-0007Zk-5w
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054647;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9yj2TEQSCx5Bi7L2qqCBIZsuN3+vff9/dQ1OCVz+Gvw=;
 b=AtsixiW8PDilaSERPidTGIIC6PnCib03/ZQBM3SPgy/pM6mukFcBsQ54zPk5KPCB4F1SFf
 52AGgRJ09/ty23PfSsFF7mO8oe4itoEqo2agv2iZJFj/nxALDDSbOnX+Gr4LqZxiIDhDW6
 7mvWYMVw1ceNWycgexrohWrAX3XLLR0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-kyLLLH-6P2ufT8QLolO0GA-1; Sun, 29 Jan 2023 23:57:21 -0500
X-MC-Unique: kyLLLH-6P2ufT8QLolO0GA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bd21-20020a05600c1f1500b003dc5cb10dcfso342852wmb.9
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9yj2TEQSCx5Bi7L2qqCBIZsuN3+vff9/dQ1OCVz+Gvw=;
 b=xftSiphYR/H0U79XCqsCQiQ5+koc2XgehcCTFa/jbGBxwcU8aQFlj0kWmBBw/aJeWz
 AedDO0hxR6F1S+IqGRTvEFwBzofgNXSGna+AadZr8XN0BvlVKnb5rJ9WhHtO2d2Dl0Ll
 56gzuxLmvD/qm/LhNT+14M+KC1ArXfOQnOmq1o6339trrosouXBgrgUn9LiBXFNKtCQW
 jbjul8Mx7DJ1IljPjGR+ih9XtWHD+meRoW9YTqknXl5Tl+K2XjiBjuMUf5IHkyJI6UgR
 n7WXwIlnHWiVRoi6ZNl6pazML3fXs0wZw9EfqYqY9/IvzN4YyVj66Nuki8E9NySLKFlV
 Zh8Q==
X-Gm-Message-State: AFqh2koUNyw1Mkfk5aWVSxwmU9eIMHDKtbbemTwT0UFWUJClsnfSg0hR
 TikgyjQYEzDJiEmu4zGfdfJmhif2HkMc3BaCuyOlVM8ye7T/GOTTFX+JBONB3xKCACkjZXkCBFk
 Eh8SgeQGbPAQCLzc=
X-Received: by 2002:a05:600c:4f82:b0:3db:25a0:ca5b with SMTP id
 n2-20020a05600c4f8200b003db25a0ca5bmr40237008wmq.37.1675054640366; 
 Sun, 29 Jan 2023 20:57:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvkQYbUHqPYvNSxeFXUkXFrZdZtHvc1yaBAgXaCp75NMZ0JQnSYLEEPRBH3YG/JQF9XZjBWuw==
X-Received: by 2002:a05:600c:4f82:b0:3db:25a0:ca5b with SMTP id
 n2-20020a05600c4f8200b003db25a0ca5bmr40236996wmq.37.1675054640140; 
 Sun, 29 Jan 2023 20:57:20 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 d33-20020a05600c4c2100b003dc41a9836esm7731918wmp.43.2023.01.29.20.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:57:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
Subject: Re: [PATCH RFC 02/21] util: Include osdep.h first in util/mmap-alloc.c
In-Reply-To: <20230117220914.2062125-3-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:08:55 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:57:18 +0100
Message-ID: <87y1pkk4b5.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> Without it, we never have CONFIG_LINUX defined even if on linux, so
> linux/mman.h is never really included.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Markus is working on this right now, Markus?


