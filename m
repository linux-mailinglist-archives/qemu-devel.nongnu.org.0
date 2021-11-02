Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C454442A23
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:13:09 +0100 (CET)
Received: from localhost ([::1]:46858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpqu-0007bw-9S
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhppc-0006pQ-K8
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhppM-0001jU-A7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635844287;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ED6n21h0qeeLKpspZfBjrPkxLZXV9j7rahpiw35FfxM=;
 b=bYIdNw0BU1xpiR6/h9e1MVUsxII/z0G0WexztqRHXbw/DdGQyyEoW/ezPWNyXY/nQtaRmb
 CRQLIP/n3jvHru8YAB5B2nXYY4DjCks/gEstIbWfBf+CYHQNtB9/SugHg5ZwsmSRodkdpL
 lMPS2RtyisxZCOUmhNF0BmPnDaT8vQU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-EHwqtdWnMNm112U6zaO-hA-1; Tue, 02 Nov 2021 05:11:26 -0400
X-MC-Unique: EHwqtdWnMNm112U6zaO-hA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v5-20020a1cac05000000b0032ccf04ba2cso810072wme.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 02:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=ED6n21h0qeeLKpspZfBjrPkxLZXV9j7rahpiw35FfxM=;
 b=33civjTG+bvxsb//WHOBinYR3LTDwobHp6ssFVrgt5FoGBtrtFtw/A0H3WvQD6ismc
 j5U2mn94FaBZjXXRKO6p+vPwPf3rX3TeZN4YQCphCcGlUrTQYwl/ujSFnHYarI3hhJ+z
 tqk8B95Lu2vDt+V+6D5TDoppWG6nHzsaDYPkZcF37Vl4xo3SaTzaYRuOw+HsG4i9znaC
 opYsjhhGunl1YBegLlGf4Bb2YQ6DTChARn5rvJx5BSEMFV8C1HTHiftnKimItxIWKH51
 qnYsA5HwpdZFGWu6An0MBtFiHHbFtyxQUAQzzRJj+7fKRJgVBCAZGaaeULUTsbvwACml
 C97Q==
X-Gm-Message-State: AOAM531OR/tO7jH3bUoW6wqJgFPeHtfyj3T4cacx/SWU8WzPi+00PhJF
 QEKf+586syXADQo9GzUQqPx9gI/7TJStajq+bDgBgkDNJhpyNxgRdOzXWFzbfyQzUDiEsmvSr6b
 9Mbs6eCLt8vImpQA=
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr5839824wri.355.1635844285153; 
 Tue, 02 Nov 2021 02:11:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0B+Zq1jBnIwepcMal+rdTMvl5enbMHbso2iXAOapmKigf0YPynXi5c4WUwsKpuJp9vDYPXQ==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr5839779wri.355.1635844284842; 
 Tue, 02 Nov 2021 02:11:24 -0700 (PDT)
Received: from localhost ([188.26.219.88])
 by smtp.gmail.com with ESMTPSA id q14sm16163737wrr.28.2021.11.02.02.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 02:11:24 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v1 1/2] migration: block-dirty-bitmap: add missing
 qemu_mutex_lock_iothread
In-Reply-To: <20211005080751.3797161-2-eesposit@redhat.com> (Emanuele Giuseppe
 Esposito's message of "Tue, 5 Oct 2021 04:07:50 -0400")
References: <20211005080751.3797161-1-eesposit@redhat.com>
 <20211005080751.3797161-2-eesposit@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 10:11:23 +0100
Message-ID: <87a6imncqs.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Emanuele Giuseppe Esposito <eesposit@redhat.com> wrote:
> init_dirty_bitmap_migration assumes the iothread lock (BQL)
> to be held, but instead it isn't.
>
> Instead of adding the lock to qemu_savevm_state_setup(),
> follow the same pattern as the other ->save_setup callbacks
> and lock+unlock inside dirty_bitmap_save_setup().
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


