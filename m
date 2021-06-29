Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2793B7516
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:20:47 +0200 (CEST)
Received: from localhost ([::1]:43414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFXZ-0004cF-KX
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyFVt-0002zM-UR
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyFVq-0007kj-Au
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624979936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t9oIG6ZHzl/pi/ZZs4YavxTY/hRpYxG+dQ944B30NmI=;
 b=dp0yv3smAi6Q5RLw+mOSBr4lNaPyQQzUz6H8kWFUBNKJbeLYcNj86P5OFvm76CcE7PqYJ6
 XvYjlSkeEmuLi6V9FoJ0tfdaiK2w2VmVwdGKoNEaB2L1FYnxF6NKbnB6dS+zW3UvILOsAe
 yqwy8Y96NRQKi5To9jXYlgIiNGDT5OI=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-yo89Ow_rMliBIZ-8qaG8tQ-1; Tue, 29 Jun 2021 11:18:53 -0400
X-MC-Unique: yo89Ow_rMliBIZ-8qaG8tQ-1
Received: by mail-il1-f199.google.com with SMTP id
 m15-20020a923f0f0000b02901ee102ac952so13315195ila.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 08:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=t9oIG6ZHzl/pi/ZZs4YavxTY/hRpYxG+dQ944B30NmI=;
 b=QxQF38luj0oPJfUzWOPR3SxkRvRHtUxccofXT5PGc8LTXJ0Bj/xqkjjUJCFLb3d9Of
 bxiZrH0F4kWKhOb14Jk0pfRsIHn4GmA92NzbdU2r+yZ1CWPgTZYKkSW4oVfNHlVIC+g8
 ri6odARr9iap5zf9BRfHMaJh6whVv/uSLH2hNKE83eoufPfL9dIcAwQB1wNOVC+d/Abd
 8uj58f0zcYu1stWX0E6BqDeLvvuymfx/qG5zuVUyftDy5Vfx2bwzQT7H8kYx1Ra69GOH
 K+z2ZAEKttOE8DCJI073cuW90Z5EjrX5TmoMBAHD/wxYtEpq49dUlzKWwVVYguASz0or
 Hvkw==
X-Gm-Message-State: AOAM532qfCzFamhXJq+mqAdf6/xuDMzkQOmt5+5/GA0M9ek7igEh+xgw
 +aB2Ze67LmnnV6gz+ORO+at7Z6/vFly9jkRcnRcUgCbxOWlgujiCVTFqM0G4RLRIU/GS+Tv1D5w
 UU0Ugz0LTZOybBJ8=
X-Received: by 2002:a05:6e02:8af:: with SMTP id
 a15mr16747353ilt.307.1624979932551; 
 Tue, 29 Jun 2021 08:18:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx80bBQ3oJ5cwD83HhEA6d+TZQYq1pItwZODzFXDGP2xG6XKrDMq4QXeExTWZHKJK85fFiI+A==
X-Received: by 2002:a05:6e02:8af:: with SMTP id
 a15mr16747335ilt.307.1624979932304; 
 Tue, 29 Jun 2021 08:18:52 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id h10sm1527730ili.27.2021.06.29.08.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 08:18:51 -0700 (PDT)
Date: Tue, 29 Jun 2021 11:18:50 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v10 6/6] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
Message-ID: <YNs52rBi2bqiNq3e@t490s>
References: <cover.1624811188.git.huangy81@chinatelecom.cn>
 <e0cc5b347011b1cef06ff95446bf8b3d6a6584b0.1624811188.git.huangy81@chinatelecom.cn>
 <YNpV0q1nEF3NiNSt@t490s>
 <effca94d-ccb3-846f-3e8d-134d67a52f2e@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <effca94d-ccb3-846f-3e8d-134d67a52f2e@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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

On Tue, Jun 29, 2021 at 09:04:07PM +0800, Hyman wrote:
> 
> 
> 在 2021/6/29 7:05, Peter Xu 写道:
> > On Mon, Jun 28, 2021 at 12:27:46AM +0800, huangy81@chinatelecom.cn wrote:
> > > +static void dirtyrate_global_dirty_log_stop(void)
> > > +{
> > > +    qemu_mutex_lock_iothread();
> > 
> > One thing I missed: maybe we want to sync dirty before stop, so the value will
> > be more accurate.  Perhaps a call to memory_global_dirty_log_sync() here?
> seems good, if the dirty ring reaper is sleeping, we can sync log by
> ourselves, making dirtyrate more accurate.

Btw, I commented here because there has the bql so it's easier; please still
remember to record the pages after sync is done!  Otherwise it'll be an effort
of no real use (which I think that's missing in your latest repost..).

-- 
Peter Xu


