Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1823E680543
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:50:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMM78-0006Hb-68; Sun, 29 Jan 2023 23:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM76-0006HS-NX
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:49:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM75-0006NO-8C
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:49:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054190;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ThVoZqsuHUBYewYKCS0+SinP4APVYKtPAhTJCKr2Kog=;
 b=EH6iQ29VcwlYQ4kpdfMlTbQa8ZlaxFBbNELKqh9k9XM7nSkWFTjVF9N0Z3+iTvMzJj9QOw
 0BPsRXmVJiobQ/u7bloNTi4oop1k0MscpwxESmZM6y8u5PWkmQO2rktrJ/iEvF1f3zD+dY
 t9AOAKT/Z9M6IRLqu1LeHwc5cV9i4no=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-M6KIJnMUNqSs0Vpnstvd6A-1; Sun, 29 Jan 2023 23:49:42 -0500
X-MC-Unique: M6KIJnMUNqSs0Vpnstvd6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 l8-20020a05600c1d0800b003dc25f6bb5dso6947387wms.0
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ThVoZqsuHUBYewYKCS0+SinP4APVYKtPAhTJCKr2Kog=;
 b=AZad3i6EBgsKtUXJ5y0hLJCHsEvk/sJRgDhZtt+Ujuo7nSE/eY3CrZMNaT4JSgTKN9
 S3mg88bplYX1RLIt18MyLX/bi5BGGAu8THshG3+Ky0SLkHF4mBLO0B4DSYvk2HKJ+VZG
 yynCQumedYSR6qD5k6t1hP7C68WxJUxVoS6hqJeRUW12zj2NDVg9W625ht/MqP2UGugl
 lZ6jI09zcaX3/dKig8pT+RPkJRYhg68MwZ6fIdGw2NW6ZKrihGPODzME2XUTRLqEBfgB
 rzkWAb+qspjg0A61dGPaVe5AuiKfh6wL7WdrIY8I1/9F/conuw5IRt05zxXMZlxpoisB
 6/mA==
X-Gm-Message-State: AO0yUKUYmqO+PKCXgBUafho8pVxd5D0bURaJv4VBWiUlduYTZLSN518d
 cE4aEXW1Syu5tWSsSU9ish8gzH6IEJp/LUz4WJCa1cNi93jxU7uHZ0fszn2GW5ySqRqHx+rLOuN
 8ezA/dAUpIynUJdg=
X-Received: by 2002:a05:600c:3ca8:b0:3dc:5321:8457 with SMTP id
 bg40-20020a05600c3ca800b003dc53218457mr3921630wmb.5.1675054181416; 
 Sun, 29 Jan 2023 20:49:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8zOvrx5Uv8DFaOsldXdQvX0fpgSV6uILe4aj/SmK67TCPigE5DFv+82AGUh6ngXKWOECNw/Q==
X-Received: by 2002:a05:600c:3ca8:b0:3dc:5321:8457 with SMTP id
 bg40-20020a05600c3ca800b003dc53218457mr3921623wmb.5.1675054181199; 
 Sun, 29 Jan 2023 20:49:41 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c26d300b003dc50c38921sm4648759wmv.35.2023.01.29.20.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:49:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  dgilbert@redhat.com
Subject: Re: [PATCH 1/2] MAINTAINERS: Cover userfaultfd
In-Reply-To: <20230119091545.3116376-2-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 19 Jan 2023 10:15:44 +0100")
References: <20230119091545.3116376-1-armbru@redhat.com>
 <20230119091545.3116376-2-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:49:39 +0100
Message-ID: <87k014lj8c.fsf@secure.mitica>
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

Markus Armbruster <armbru@redhat.com> wrote:
> Commit 0e9b5cd6b2 "migration: introduce UFFD-WP low-level interface
> helpers" added util/userfaultfd.c without covering it in MAINTAINERS.
> Add it to section "Migration".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


