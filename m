Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF142F7EA3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:55:42 +0100 (CET)
Received: from localhost ([::1]:58956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QVp-00018l-J2
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l0QUc-0000eM-KK
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:54:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l0QUZ-0001Re-BA
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610722461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J6oHkNzMOQydfTDWC5D5zIEUxgCX6YTsUbJIU5T1pUI=;
 b=X/XSDsvosJ1Xli+gAOxSuOl4vEc4ECzI5OxONp8EuSFAhJMll6/SHbYt5chbAYYTYuJiYp
 THVjhgFxCHpNRbUhyQNmVwcm7JPiEi1ULGvfeD293STUCU1Idn50q4kVRkG6BwORBrYzT4
 dnGU0fg5FyxKSEflca5JuGm1JiCmFrg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-I_LVBl8DOie5wimq5jyM5w-1; Fri, 15 Jan 2021 09:54:20 -0500
X-MC-Unique: I_LVBl8DOie5wimq5jyM5w-1
Received: by mail-qv1-f72.google.com with SMTP id bp20so7868697qvb.20
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 06:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J6oHkNzMOQydfTDWC5D5zIEUxgCX6YTsUbJIU5T1pUI=;
 b=LLA+4hK8wMdjMC7Ab6IDe7uPDch1GfEF1dSXQN+YRadwNXYCgqOGBDb1S71ZruOlXt
 Sy6X3RTaO82WTuCuNhtLuMUZ90gziRAtwpvwiVTamWiO85IS0kXi5epbg6vrlxqlZ0M2
 xeK+5uaHW62wn94jSMvnrQQehLIrQlf2/hFNeLDIAtza1YoeA4hQU5l6bvorhDmwYlUw
 AMvtLUgHNuRMvnSaLjNauo1k4rFfqkSN8D/LjOaCjUkMKWFSWdQ9YiFoRCQB8MqQtj/n
 lMRkrx+dwpIqTwGYjXW0aC1Hb4Z8OHNdQFqE2edmdf1JHmGKaYIWW54j0n2GssmdyOmJ
 c9qA==
X-Gm-Message-State: AOAM531p831LJsrZiYgH0+3ukFlxbGXW9qOgcbfkrVzFUGeqH8arx4XZ
 rdet1oIfR/cSRquNksjw+iPshUV9kJ5iSSpCVa/tW+MjN2qe5l5NB9JgaP/XBH4x3ZomVe/Jahi
 5/Sd6LAO/Jk+lyL4=
X-Received: by 2002:a37:9ecc:: with SMTP id
 h195mr12114818qke.302.1610722459554; 
 Fri, 15 Jan 2021 06:54:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/JXx/+V28uV3AqQaLJNgH1pggdC49EN7dGHUV765aFVkoHtDYAYPdK3XdYoMHc0/lzvgIPQ==
X-Received: by 2002:a37:9ecc:: with SMTP id
 h195mr12114805qke.302.1610722459355; 
 Fri, 15 Jan 2021 06:54:19 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id v47sm247911qtb.42.2021.01.15.06.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:54:18 -0800 (PST)
Date: Fri, 15 Jan 2021 09:54:16 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v11 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210115145416.GC704275@xz-x1>
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
 <b3ca934d-0c24-d940-2df1-2583502ccefb@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b3ca934d-0c24-d940-2df1-2583502ccefb@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 02:34:40PM +0300, Andrey Gruzdev wrote:
> Ping

Dave, Juan,

I really think this series needs some attention...

It'll be a great if QEMU can start to take live snapshot at least to me.
Andrey (and also Denis with the older versions) did a great job working on it
and moving it forward.  IMHO it's something beneficial for the QEMU community
and we should really encourage such behavior on working useful things, working
in collaborative way, and being consistent.

Is there any concern about this series?  Let me know if there's anything I can
help with it.

Thanks!

-- 
Peter Xu


