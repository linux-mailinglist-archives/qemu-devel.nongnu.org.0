Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E49397530
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:12:52 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo58V-00010Z-QQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lo575-0007Ea-32
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:11:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lo571-00034j-RU
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622556678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XULftDlp0W3OB77YK758wVf6fL03NCVFXBXhRFhiHek=;
 b=THYl517v8eFAJ0w+Des3514VaTdR+x+9/l6tkSpyc7q609dre//12XCgl3Ys1m4QQ8sHx6
 vBt47fqROD7JN/et4o+5Fy/E+qKLvRd7NAWSY6amld306Tk2IL84D3StPUFRbCw6sOouRC
 uVSgIka6J4wsXWnsoR696sCel6JlPg0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-cNJgRWLoOhutAB0ts60IBA-1; Tue, 01 Jun 2021 10:11:16 -0400
X-MC-Unique: cNJgRWLoOhutAB0ts60IBA-1
Received: by mail-qv1-f72.google.com with SMTP id
 k12-20020a0cfd6c0000b029020df9543019so11632638qvs.14
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 07:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XULftDlp0W3OB77YK758wVf6fL03NCVFXBXhRFhiHek=;
 b=crEJh1NqF5Ki2r1VlYyS9VhVxul5PDOUeRv4nYc8pfmL0c9OHfxH1ifF2NEISbzEJv
 dIoTzYoPCxMXkmJ1Xzb//14oEPokb1dFkaOR/WikR0d4DoThUW3bruqJgXjBPOP3bM0Q
 fV8abLm1DPJ3A5L9dOD/IhkQdgTIbw0F259Zr1F+x88lf3ijydeKHZjDhAETW+eLQrfg
 /aTb/Q2K3bfiA7MEFv70KGr9/yGkLOFg8Rd46eOYoO5OXvLnGWG4ekKTIhdbGPiSNugo
 KdtI/cSAYBsi0U70BsvdPdCh0j8FHrsZq4rYtdG7SsQ5+kVTNrgzmFb0wkeYKIQcKV0q
 PpdQ==
X-Gm-Message-State: AOAM533iODYbtXPBPzRuQGH6a2skMH7W+xwhuGpUilZ77PW/dTcDh6pw
 on3zEmPo3qenWGS8rRb05xfZOZfITg6dadgbhJ5ZvFRZ5XidkWA8q0DbELkn4dtm/SB9opkNfL3
 k/1wynam8SoUCFhE=
X-Received: by 2002:a05:620a:a0d:: with SMTP id
 i13mr22056312qka.278.1622556676112; 
 Tue, 01 Jun 2021 07:11:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJq1XyB+7xDLxwgG9rps6o0TWxjzZCoAwZ1jGd3VXV5jhBOKLInHW2vgq0ecTwHrZc42/raA==
X-Received: by 2002:a05:620a:a0d:: with SMTP id
 i13mr22056277qka.278.1622556675800; 
 Tue, 01 Jun 2021 07:11:15 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id f15sm10467138qtg.25.2021.06.01.07.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:11:15 -0700 (PDT)
Date: Tue, 1 Jun 2021 10:11:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v3] migration/dirtyrate: make sample page count
 configurable
Message-ID: <YLZAApHXm8MTJNFH@t490s>
References: <cover.1620742417.git.huangy81@chinatelecom.cn>
 <1fc52dd5abfa7590f516c3e97878ee263bff105a.1620742417.git.huangy81@chinatelecom.cn>
 <74bd3755-9e38-6e00-8cd1-4bb9ae3af71c@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <74bd3755-9e38-6e00-8cd1-4bb9ae3af71c@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 08:09:34PM +0800, Hyman Huang wrote:
> Ping
> 
> though dirtyrate by sampling page may kind of be inaccurate,
> it still valuable for those who run qemu on non-x86 or kernel
> which does not support dirty ring, this patch is necessary i
> think, what would you think of it ?

Yes I think this patch is okay:

Reviewed-by: Peter Xu <peterx@redhat.com>

Maybe I can pick it up and repost with the hmp cmds as they conflict.

But note that even with this sample_pages parameter, my test still gets this
with a 200MB/s workload:

(qemu) calc_dirty_rate 10 16384
...
(qemu) info dirty_rate
Dirty rate: 21 (MB/s)

I think it means it does not solve the memory locality issue, so it may only be
useful for workload that mostly randomly distributed across all the ram.
However since normally this is used to evaluate "whether this customer VM can
be migrated", it also means maybe the admin has no idea about what type of
workload the guest is running.  Depending on this info will wrongly migrate a
very busy VM as the admin thought it's low loaded.

So I think at last if we want to make this feature to real use, we may need to
depend on either dirty logging or dirty ring to report the real numbers, even
without migration started.

-- 
Peter Xu


