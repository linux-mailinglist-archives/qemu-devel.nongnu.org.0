Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDB68E2F7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:30:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPVXV-0000TJ-JY; Tue, 07 Feb 2023 16:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPVXO-0000Mv-Ge
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:30:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPVXM-0005L2-PX
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675805399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ttDPZNRpZeAt6mv9ppCZbji4e08TYf4oVXtTJptPvwY=;
 b=UC6ZUJHdzwcIkAnf5W7ux0TDkieMeRcQ9bsgN6neqx7hEt9cuQauZZE5KhxNGeTwv/jH+f
 Wfw34wx3vEBverALiV9TIKpzMHFekgCdlBWLHUFFe4NZJZoC1k5SkLeqFkPsujZ+aLBUMf
 RWGiw0AK1J5ptAH/pp97IONbUtJW568=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-u15T33IRPb29wSQW0UAsEA-1; Tue, 07 Feb 2023 16:29:57 -0500
X-MC-Unique: u15T33IRPb29wSQW0UAsEA-1
Received: by mail-qv1-f69.google.com with SMTP id
 i7-20020a056214020700b004ffce246a2bso8396088qvt.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 13:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ttDPZNRpZeAt6mv9ppCZbji4e08TYf4oVXtTJptPvwY=;
 b=07lPKXzo+aUi6tQlZ2/FQ5zZFPvTNogDugWrw36X5Pd4tMq2YVrxm/2ULNgLJOarw7
 4GMBVF/nZTo+ipshjArFS4B1V++B+7v9tIvgzpSjGKQ+9/PluO0vVqYMIkvwZHGDLzbg
 IOrsXNUVPNVZwbFxGLR5wFEDbsrEqAxRFbNwVEwR7mJo4Ej8M5zwcu45u15uqHwfSkF4
 TONvHM/Ehowd3Zy6PRoGRUJcZxIPU0Aec4EvwOJEYsWzhZ7GJe38SGlNR+8D2GTw47lG
 /u7W/Uk5rwb7glp5B9zceBfWtKu7imLvi+Fk8aplf2d5JSX43vlLYDHAyp5iQgJYhPyF
 Lemw==
X-Gm-Message-State: AO0yUKVO3+quTL4/vjuNAGDnzr94u4YSE36voCn/XBu0Jiq0JzOG8OkK
 vBiCH2TkgbMzvLtpIbqgZUsCt86wi9xs/h8jtTX+oiWiIK0Vrq01AdTUa4WYYLD27qxYSFqwdFe
 bE6Pk0Ybj+dv4qE0=
X-Received: by 2002:ac8:5fd2:0:b0:3b8:6d5a:3457 with SMTP id
 k18-20020ac85fd2000000b003b86d5a3457mr10084901qta.6.1675805397173; 
 Tue, 07 Feb 2023 13:29:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/d2Ak++j+B6EWnMb1RAyjIHsh1iabgdnpRQf6YmJ0fTZw5RR4QCbOtTfFfJPgqirhQ9f92BQ==
X-Received: by 2002:ac8:5fd2:0:b0:3b8:6d5a:3457 with SMTP id
 k18-20020ac85fd2000000b003b86d5a3457mr10084876qta.6.1675805396905; 
 Tue, 07 Feb 2023 13:29:56 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 b13-20020ac801cd000000b003a6a19ee4f0sm10152506qtg.33.2023.02.07.13.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 13:29:56 -0800 (PST)
Date: Tue, 7 Feb 2023 16:29:55 -0500
From: Peter Xu <peterx@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH V2] migration: simplify blockers
Message-ID: <Y+LC082KQ3Gdaghp@x1n>
References: <1675796593-235541-1-git-send-email-steven.sistare@oracle.com>
 <Y+Ku/zQOoFogmx0j@x1n>
 <0a757102-0378-db4e-d889-9872f3a2d529@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a757102-0378-db4e-d889-9872f3a2d529@oracle.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 07, 2023 at 04:17:34PM -0500, Steven Sistare wrote:
> >> + * *@reasonp is freed and set to NULL if failure is returned.
> >> + * On success, the caller no longer owns *@reasonp and must not free it.
> > 
> > This statement reads weird.  IMHO the caller still owns @reasonp, but if it
> > succeeded it should only free it with a migrate_del_blocker() later.
> 
> How about:
>   On success, the caller must not free @reasonp, except by calling migrate_del_blocker.

LGTM, thanks.

-- 
Peter Xu


