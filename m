Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A43B6B29
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 01:07:01 +0200 (CEST)
Received: from localhost ([::1]:51788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly0LE-0006Rl-IA
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 19:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ly0KL-0005gi-Rf
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 19:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ly0KH-0001AE-SU
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 19:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624921560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nOLl823yXKP9LkgdwNt7ujP7Nym/DVoBca4zuq4A2Z8=;
 b=HOzAFS+4DtNbb5/7s+MUy3e/9OZDbeuojhR9P0DtT3kDRocSCbPcl/+8tliq2zTBVLb6dd
 KhsYOoBPUjiYY82EezCyH5e+fox31pOlTJsErFzGfQXDJIPtdZsG3F1DClWRGN46Y/2PpJ
 ryMa1A74meM0ZwTYk+YNa/6pnDrfjoM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-OgrxtuDkOVaI8TqnznaWUg-1; Mon, 28 Jun 2021 19:05:56 -0400
X-MC-Unique: OgrxtuDkOVaI8TqnznaWUg-1
Received: by mail-qt1-f199.google.com with SMTP id
 a12-20020ac8108c0000b029023c90fba3dcso14051234qtj.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 16:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nOLl823yXKP9LkgdwNt7ujP7Nym/DVoBca4zuq4A2Z8=;
 b=Wf0NIQRhXcUEvVyBCQnSIoEjMA9c9pqLWefSyaRidlAHX/gVNf6yw3DXGNawwK2CUW
 LAV/ioQwJalS1hy+CO3wwPWGmk/ZeAQs9M26F2XfohH8Tm2lb0dhoQ2QnnErWSrDi1Y8
 2Wo1RzbyHy5Fb/3xl8cYrebpScvjHc/Kp1E6f+IMvMjkRv2RgsbkHgFYNny+OKlSONbL
 9mMiGq+xadb55NIa7c77aQRmf6j476hbGp7zKSWMyrnlXLfo0bKciGe66ms6dIOlb5dm
 yMkPyY/crt/T2hNbWHkNeH/bZkkxu8Ncjpu1EJ+QUlQIKEEuYr3S6LbFzgfqHusHUvcp
 KU7g==
X-Gm-Message-State: AOAM530yTVNlSXFIv6E5zGIutQou36eJZkfdOpM9vBbLPWCt1EHvewh8
 PbglorfKdV63DPVJMjUnY2Ukng28ZQ5SrCFiIp8/wBKCDQXIQQcKVZJnsDwU8T6nY13hEc8yGpB
 FNeJbWUVpvXlBAU8=
X-Received: by 2002:ad4:5cea:: with SMTP id iv10mr1725528qvb.8.1624921556444; 
 Mon, 28 Jun 2021 16:05:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlKlXoVxsSBVa8uC0okVGdKllIQchDuJDwgntjOvPGzCOyd62ZYz00d4ZAt0ry1Rr0a2cOXw==
X-Received: by 2002:ad4:5cea:: with SMTP id iv10mr1725511qvb.8.1624921556248; 
 Mon, 28 Jun 2021 16:05:56 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id y63sm11252356qke.16.2021.06.28.16.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 16:05:55 -0700 (PDT)
Date: Mon, 28 Jun 2021 19:05:54 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v10 6/6] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
Message-ID: <YNpV0q1nEF3NiNSt@t490s>
References: <cover.1624811188.git.huangy81@chinatelecom.cn>
 <e0cc5b347011b1cef06ff95446bf8b3d6a6584b0.1624811188.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <e0cc5b347011b1cef06ff95446bf8b3d6a6584b0.1624811188.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 12:27:46AM +0800, huangy81@chinatelecom.cn wrote:
> +static void dirtyrate_global_dirty_log_stop(void)
> +{
> +    qemu_mutex_lock_iothread();

One thing I missed: maybe we want to sync dirty before stop, so the value will
be more accurate.  Perhaps a call to memory_global_dirty_log_sync() here?

> +    memory_global_dirty_log_stop(GLOBAL_DIRTY_DIRTY_RATE);
> +    qemu_mutex_unlock_iothread();
> +}

-- 
Peter Xu


