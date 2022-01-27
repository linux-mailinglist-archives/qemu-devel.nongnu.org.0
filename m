Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6032F49DD9E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:16:32 +0100 (CET)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0tL-0004sv-GU
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:16:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD0qB-0003J9-JP
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:13:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD0q9-0004tT-Nr
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643274790;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlUPuWB6UYJZLK0C/C8O54c44q7XbFpOMoLhKzfKAnw=;
 b=UxhdcpYzXk7GWfHpZm8C3Hj129k1XnUr0WMYCsrNPAr5QKsaa+L1HKBOQu7FvxUdMp4MHM
 pfu9RtagKnuq+q7myRiqRUFF8Qg7sTC/hO4rCWGlM/8j8Y2NaIiJ/FGNEEpdCVgNEjPTRe
 kGuz1ZMjDmbQp7X3De0sNGfoj/b7CDM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-hOzvBV5FMTSzePmcHDj6eA-1; Thu, 27 Jan 2022 04:13:02 -0500
X-MC-Unique: hOzvBV5FMTSzePmcHDj6eA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q14-20020adfaa4e000000b001dd761d46c7so821099wrd.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BlUPuWB6UYJZLK0C/C8O54c44q7XbFpOMoLhKzfKAnw=;
 b=d9x5c1LZCFDjgYwh/gUZiF25r2TOBtLZgRZiGWS0BN/TCICdSI3unrRSl3Qbi3mzau
 Pj2u9MpsluLufeWJZAlcxyL5ZTDu/kKVWY/aizDo34YazOH0c0z0rZt8ou0n+pqNhE7x
 OhnZW2QMPTbEtCSMxFxgaIOmd12PItn2iccqj2LxQhT1oqauvzsHFa2DRGQlKdnp5/Ab
 ozXdzoAWhC0GJllgCWzGFk4+oCUMWYVFS1okOnJGqExrmGnT7ZMO1hnyVLBSOq0yArar
 xdbGLkG1c2hia8II1Dx/GAfavQ0ffLgKDfOuK51oSeo237FnoLzquXhYeakkiRuT8fnr
 yGag==
X-Gm-Message-State: AOAM531PE0rA6GXGH+zo1fvQy0gpqH+T2SyPsaZxyiM3uXTn4jinMCDB
 jnrYLyXUfyyAu17Zull+TMBrg8itPCe6xkA6cbwHaDLM2wHmixWunxxgBTi7RUYHOGB7DhDS5yp
 ewekIz0CAxprqUEQ=
X-Received: by 2002:a5d:448e:: with SMTP id j14mr2173869wrq.399.1643274780970; 
 Thu, 27 Jan 2022 01:13:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxg7/qWunjQwGfth4Rbh/jPzZUxO6e3hQXd2p4qbQzpR/wQ7WFjYwaaXQl2WRf38KRYWGV14g==
X-Received: by 2002:a5d:448e:: with SMTP id j14mr2173862wrq.399.1643274780801; 
 Thu, 27 Jan 2022 01:13:00 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id g5sm2042862wri.108.2022.01.27.01.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:13:00 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v3 2/2] migration: Tally pre-copy, downtime and
 post-copy bytes independently
In-Reply-To: <20211221093441.1445590-3-david.edmondson@oracle.com> (David
 Edmondson's message of "Tue, 21 Dec 2021 09:34:41 +0000")
References: <20211221093441.1445590-1-david.edmondson@oracle.com>
 <20211221093441.1445590-3-david.edmondson@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 27 Jan 2022 10:12:59 +0100
Message-ID: <874k5pmtic.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Edmondson <david.edmondson@oracle.com> wrote:
> Provide information on the number of bytes copied in the pre-copy,
> downtime and post-copy phases of migration.
>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.

>  static void ram_transferred_add(uint64_t bytes)
>  {
> +    if (runstate_is_running()) {
> +        ram_counters.precopy_bytes +=3D bytes;
> +    } else if (migration_in_postcopy()) {
> +        ram_counters.postcopy_bytes +=3D bytes;
> +    } else {
> +        ram_counters.downtime_bytes +=3D bytes;
> +    }
>      ram_counters.transferred +=3D bytes;
>  }

Now transferred can be calculated from the other three fields, but
changing it needs too many changes.

Later, Juan.


