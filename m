Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D950549D41C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:06:31 +0100 (CET)
Received: from localhost ([::1]:44670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpUs-0007F6-NL
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:06:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpRG-0005fB-0I
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:02:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpRE-0004g7-Ji
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643230964;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=A+qjt5pYMXwVD1c0+Cz6IcDexR2/vtOGKeCWSioJ9ec=;
 b=CqMcDlY2YQtrn5iOHJzTbRxQmLajKQ8WmQHRibCoY7u8byRXwFq4DpqC7iZVbphKiEFWlu
 g3p5bzXNBg7srmdmPjifsuUekIGrQ9i7Z/2UU0MShJywAZsEFxbrkamguOS/83SVmqpPwW
 gawOQ0X3l+0/GYeAmoi5ZJoYeEpuhys=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-DfJN6Y9AOgOYPTmsV0_9rQ-1; Wed, 26 Jan 2022 16:02:42 -0500
X-MC-Unique: DfJN6Y9AOgOYPTmsV0_9rQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 x4-20020adfbb44000000b001d83e815683so175521wrg.8
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=A+qjt5pYMXwVD1c0+Cz6IcDexR2/vtOGKeCWSioJ9ec=;
 b=ErnCjQI5kTKxRDuD8EriNvTEFnMJks3k6N7tM0PgfjZjqz0nHPus7o1ItyTKtBCfKV
 G9XeTKvOyD+SVMI+iOBN3b9+DzPcA2urlQhGzwuK/ivF5ae/ftP40ynjgjNOUortJDaA
 Zq+gsFe4wbSk++qzkxpRiRLW/Gi6C6liTsxOmeQH69wZLELqRhRRxWFIbhM/OXjZzft4
 AzcgyeHLCZHaPbbyw+CsKlEntQpqyi9BwBdA0UuoEJgmM21V4GuSsJnGeh9qXAib1gaY
 /7B1Thsx/yMprRcZlqqab43nuS5Gt8f+FUqAS6WSXK6WIMs14pItzBPG7mRgl/jv4JHu
 +lcQ==
X-Gm-Message-State: AOAM531h7wy7bLAsIfK97GuAVof+qfScl6b+Tq8ZXKa4FLkvOkkMaaHx
 hd36utaIlff6TOJoiZ41G0HgWpaycgib/YPfJfMXlXwB/yAWmmv2Vf8zCvSm9r10ZX1jYNMJ+0z
 jo47Tzw4GqucOPY0=
X-Received: by 2002:a05:600c:4f50:: with SMTP id
 m16mr3758016wmq.132.1643230961624; 
 Wed, 26 Jan 2022 13:02:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGED4pTCd6dXamGb7Tr69C0bBTdb5sBVQOGumffpYofOk7WxUxJVkg0DOgoLFiycl9jZT0XA==
X-Received: by 2002:a05:600c:4f50:: with SMTP id
 m16mr3757997wmq.132.1643230961401; 
 Wed, 26 Jan 2022 13:02:41 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id t17sm349865wrs.10.2022.01.26.13.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:02:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/7] migration: Drop dead code of ram_debug_dump_bitmap()
In-Reply-To: <20211207115016.73195-2-peterx@redhat.com> (Peter Xu's message of
 "Tue, 7 Dec 2021 19:50:10 +0800")
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 22:02:40 +0100
Message-ID: <87a6finrbj.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> I planned to add "#ifdef DEBUG_POSTCOPY" around the function too because
> otherwise it'll be compiled into qemu binary even if it'll never be used.  Then
> I found that maybe it's easier to just drop it for good..
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


