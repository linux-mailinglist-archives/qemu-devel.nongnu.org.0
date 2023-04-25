Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2156EDC60
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:22:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prD0O-0001DQ-Na; Tue, 25 Apr 2023 03:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prD0I-0001BM-Ai
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:22:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prD0G-0002we-JX
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682407339;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=X99CnDJopSiQiCkC8Exu1PWT3ipcXAh23g/gUFEaduk=;
 b=UwDUc2P4Z1lEY1zmL+5mb7x052NoKif0R1zeChQ6Mjfe50ODQfcQ9KG6zwT5c45WI65o3A
 stAxbl8+Ng4e7wcIULlupu7B2DRmP8ZkY8BclvVgdCx5+22R8yWJ9Xc9ykY1wCjt1k329+
 ICOV1SihBKV7AI0Bg+0txAxQrHZMFps=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-Aiz4tESFNYGtX06R63iCBQ-1; Tue, 25 Apr 2023 03:22:17 -0400
X-MC-Unique: Aiz4tESFNYGtX06R63iCBQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb2easo1695157f8f.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682407336; x=1684999336;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X99CnDJopSiQiCkC8Exu1PWT3ipcXAh23g/gUFEaduk=;
 b=LL18vMOtnOyVW8xkGLpdh4q7kXcV+6n5sXri77JMeoACNlmnfptSz2rjEwu45VuQIL
 IvXl2nBcFp3cDZChQ9zcAqTRIohw8u3fTTHXBBMHS7K2Y9wQlbgVPF/+ZNlBiy8fvAZJ
 Qjm5PlETjtoR7Kx7/cBhE+gFDfI/XUZSDX2bz8u/nvkEBZC9W93lnCluJrjljDSNrPKz
 3NZST/etQN/hf75Jehe8KHEnydByF2t4iNggETY0rVLSIJC+/39Tows9fI0RMEH7rQuk
 oUz69BourzcQSvug9/4GzJNBNw2ol1MGO7+Y3bN31E1DYW4Q8q5/doyILL1e6OK5fNUO
 fWdQ==
X-Gm-Message-State: AAQBX9c/dsyVr+jC6Z8WuGn7oHYu6nLqpfjGvgXmXYH5nKyOletivp8l
 /UKmF/Jzf8GMjWhMZ9mPA+2wRkFtGzvXLHnOnw8brqOiBal/FjeqdcAkxAhyRynfp+DDH511mT8
 44rjtDdPClMcAQlU=
X-Received: by 2002:adf:fe47:0:b0:2d0:d739:f901 with SMTP id
 m7-20020adffe47000000b002d0d739f901mr10931842wrs.20.1682407336612; 
 Tue, 25 Apr 2023 00:22:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350amowHhtGeczEWO3qguJBigd1dXWaRxgMNqXk5aS+Z+FfVlirqxGsxIgLbLqN4RfmCTEaU96g==
X-Received: by 2002:adf:fe47:0:b0:2d0:d739:f901 with SMTP id
 m7-20020adffe47000000b002d0d739f901mr10931825wrs.20.1682407336294; 
 Tue, 25 Apr 2023 00:22:16 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 i6-20020a5d6306000000b002fed865c55esm12396181wru.56.2023.04.25.00.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:22:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 1/1] migration: Disable postcopy + multifd migration
In-Reply-To: <20230425033307.484921-1-leobras@redhat.com> (Leonardo Bras's
 message of "Tue, 25 Apr 2023 00:33:08 -0300")
References: <20230425033307.484921-1-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 25 Apr 2023 09:22:11 +0200
Message-ID: <87zg6ws9y4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Leonardo Bras <leobras@redhat.com> wrote:
> Since the introduction of multifd, it's possible to perform a multifd
> migration and finish it using postcopy.
>
> A bug introduced by yank (fixed on cfc3bcf373) was previously preventing
> a successful use of this migration scenario, and now thing should be
> working on most scenarios.
>
> But since there is not enough testing/support nor any reported users for
> this scenario, we should disable this combination before it may cause any
> problems for users.
>
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Acked-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


