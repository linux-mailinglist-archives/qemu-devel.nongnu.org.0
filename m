Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36E49D3F2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 21:58:46 +0100 (CET)
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpNN-0003n6-2d
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 15:58:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpId-0008Ts-Hh
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpIb-0003CM-72
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643230428;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xBWytYui3hk5/F4i+QKuVQkPKwEOmwDOpzyo6jUtzWw=;
 b=EsUBwrm0k5IhRNODyEDA86EQVufNtMNdIsPlDGNvhYclOUOerVSBCpmqgjvo8Mssb/ZaFW
 uqXsmxUP4A7D3g82oiXJJrTm4mrPYiuoWpaI7LHf1s09co77N9NpUfXxtdxKtAMk1pYy3l
 r9UAwDDK2vw/9Z9YWaM2JM1o35cinAI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-elldQw68MDiA9OZ7gY7qbw-1; Wed, 26 Jan 2022 15:53:47 -0500
X-MC-Unique: elldQw68MDiA9OZ7gY7qbw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so3113772wme.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 12:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=xBWytYui3hk5/F4i+QKuVQkPKwEOmwDOpzyo6jUtzWw=;
 b=ao983czdZYK4QuYqG2uOenyA4OmH+vYcfTqL5CFTqv3vBKny7nSaRaY6SCmS7HBfXw
 QRhkb3szNqTkn9oQbXMCYJVPHQc+F4j2kS/FWJG+MPfGDeoTs3dneJtXr1Nu7IXnO3mY
 LabyO3FFY3DcAwrxdKDmo1j48OIyNirfwIW9uPM3Iw5BXXW6fnLQK32dxVFGbW+hB2Yy
 aKy6ot+DJ5UzhckUfdytbui1L4AkY1GU6zdDAEsEAMD/sBwPFZgEqBrtZ0fKfgsnfjky
 7D3GWXaAjZ/j/t4cYHEEh8zmv+uS7Tz9A4k/oXkhUww7ua57KY2N7L5URFwZ5FYfxXFr
 KzxA==
X-Gm-Message-State: AOAM530gr2XD7FY55GrzIdkGMrWZusdas2BJ3xPkrNsLm6AiVCTddhB7
 +qUsgeHkyHKzhKIzjs9hL/W9NLJXKGnw5+BsT/WOVb0caieMdHsNTa/utStKJmTfuqGH/axzYOS
 TL3ATwOWEz7ZpNJQ=
X-Received: by 2002:a5d:6211:: with SMTP id y17mr278195wru.73.1643230426461;
 Wed, 26 Jan 2022 12:53:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZvTqjuokRF/o6vaTpGYrmA9m6kSTkgAyveAuCTxP7vKyiKoCvIJ2ZZf6ftvF2fABFdSRWzA==
X-Received: by 2002:a5d:6211:: with SMTP id y17mr278186wru.73.1643230426311;
 Wed, 26 Jan 2022 12:53:46 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id r12sm293738wrw.73.2022.01.26.12.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:53:45 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 3/3] migration: Perform vmsd structure check during
 tests
In-Reply-To: <20220113194452.254011-4-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Thu, 13 Jan 2022 19:44:52 +0000")
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-4-dgilbert@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 21:53:45 +0100
Message-ID: <87ilu6nrqe.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, lsoaresp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Perform a check on vmsd structures during test runs in the hope
> of catching any missing terminators and other simple screwups.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


