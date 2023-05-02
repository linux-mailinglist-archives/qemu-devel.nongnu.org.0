Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3F6F499D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:21:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptucA-0002ae-9z; Tue, 02 May 2023 14:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptuc1-0002Vb-UG
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:20:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptuc0-0003dw-48
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683051627;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pSXeG57ayncN+5wWcVB6ylM8TVwpamotq6IoQaauIiI=;
 b=L5bXsDMD7gbvZ6qqyt1Mf7SghBsXDP6GDHjRI4K0UDgNIKcTYJiPbG4tvGn3Xmw0lolh8a
 dtmvJDp2Z5/QQI5cgd5AhM8o4tVFN+XjHu7sMLuoSfQDylbcsRbkBky8+Rk9xeMaFGfEO7
 CyCGROJQipn+ZOSuIBB1EpgoNn4zOYY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-i3vVcFbUNL6Kt5Qx5Wtu7w-1; Tue, 02 May 2023 14:20:25 -0400
X-MC-Unique: i3vVcFbUNL6Kt5Qx5Wtu7w-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f348182ffcso5471005e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 11:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683051624; x=1685643624;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSXeG57ayncN+5wWcVB6ylM8TVwpamotq6IoQaauIiI=;
 b=iZ5x+wpR0jz+LhihgeRZFxzvgGWeCMcOglS+IJUB/wAGVK3ybqYQpPnRFk6X0D3yt9
 Sdyj+MKPtjasF6clCHiMAEve3d450VLDbmW3i/OVQkSu4HcTMjwG2iwx+t3CwKhNPiXm
 VwQGuhr22R/bFshTVqx27FE8rXn0dUgPRG5fCffaz95DRHAHJ8fW5PbHXmOPuwPLlkPB
 mYNqX61kPwv1tx/YTiOyEMg90SMNbicVInMzMS6K1OOS6qxGD+T1DpydACaAdfa4w9a8
 gTw6QTSj+cv5g9ABxlTE/MCeemE7VCeC1o0m1RmF8hHlUSeOtA/lMiVpNpQBIvj1K2LH
 NOMw==
X-Gm-Message-State: AC+VfDwnRUOFn8Wmi+y6TFdPsDA4IB3V0c6r0pu6V7mg3gDyFY1e3HCr
 OHU9zS1ut1Oze46mWr0mZTxjMs2WQcgn05OuUX6m++hFnGVju51he3dt+5i7sWqPk8ZUnPeBrq/
 1mtPphprxvAE8tNc=
X-Received: by 2002:a1c:4c0b:0:b0:3f1:82ba:b03f with SMTP id
 z11-20020a1c4c0b000000b003f182bab03fmr12031873wmf.18.1683051624782; 
 Tue, 02 May 2023 11:20:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6RrpRhxgDnCQYuhUH9gTIxMxNa/fPsTO3wCaD5sn0GAFBtXDktBwS20aMEEyFvMNVrt6s7jw==
X-Received: by 2002:a1c:4c0b:0:b0:3f1:82ba:b03f with SMTP id
 z11-20020a1c4c0b000000b003f182bab03fmr12031867wmf.18.1683051624607; 
 Tue, 02 May 2023 11:20:24 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 j8-20020adff008000000b002f6176cc6desm31649153wro.110.2023.05.02.11.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 11:20:24 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  lukasstraub2@web.de,  chen.zhang@intel.com,
 Peter Xu <peterx@redhat.com>,  Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 06/10] migration: process_incoming_migration_co:
 simplify code flow around ret
In-Reply-To: <20230428194928.1426370-7-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 28 Apr 2023 22:49:24 +0300")
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-7-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 02 May 2023 20:20:20 +0200
Message-ID: <871qjytx23.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Juan Quintela <quintela@redhat.com>


