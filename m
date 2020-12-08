Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A2E2D325A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:50:39 +0100 (CET)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmi4M-0005NJ-3E
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmhWz-0005K8-QI
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmhWw-0007wi-Ek
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607451365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pDHsvaqYWUCuL5YU8H12IyKKVc1elYMoINQimL/ExrU=;
 b=UdgNgveo0eUyhq2BMTLO/vDAlkJbI99eDOCly6CAIV90LK+33OId3vug0ZwtjUaZUuQBY+
 kw6JTAY3O1Hk8tixX/OTQJufG9G1EMpZg6sV0baQ1uy9HlxIz3znejtDne8V5hWWIEDufm
 SVNWuaiBATixQhOz9B7Uj3lewil+HzI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-8RTZ3GTRPqSS-MCNPtsJTQ-1; Tue, 08 Dec 2020 13:16:02 -0500
X-MC-Unique: 8RTZ3GTRPqSS-MCNPtsJTQ-1
Received: by mail-qk1-f197.google.com with SMTP id t127so11196353qkf.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pDHsvaqYWUCuL5YU8H12IyKKVc1elYMoINQimL/ExrU=;
 b=IhKb058A8O5vvRErBy8OfGlWRYE3Ca94Oqkywe03AUWxn3IpHPaDxP2SvQMnl4Cwtb
 khQAXRHoDHhc6PdBurp9GzJW9LtWv+FuDecYdOAvS7vsz1I9ucT/Uu90zz5KYhBTYT6J
 XmDqgQFyRgNAFWXJdHOUM9KX9ZRTAK6/5FwnctShlPigRL+5RRl63st7BajwoJakTzk5
 wVRTyuZ+tsAuhgR7bprCKFsWjmYodlvhf817VBIKOrHaxe3p/UrsBM47kq4+SO5dPMmA
 bw9CK81FmwiHwioeZBWUGYX3essEwdyK7evEuICxROlmnbq8KPcVGmmRPZbOkqdFRD8F
 0V4g==
X-Gm-Message-State: AOAM530X4wlWS/YMTZgD2b/KFKdZGVtI9QwEFm8IvvqhehjFMhjendiL
 plu3xypijzzXk1Zneeu5InpWPREdeMyVt3UUYhyfo01HSW6amMNgdI8Knhpg6iTrr/gpCxQPBhj
 N9DvZvT2243nIkLI=
X-Received: by 2002:a05:620a:1526:: with SMTP id
 n6mr9998518qkk.334.1607451362385; 
 Tue, 08 Dec 2020 10:16:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxycft7PWzdpyA9tJqccN6X2+4XApwoADzHS06BPxgXjD4rQtTKVeC95OL3hPBWFmDnsErrwQ==
X-Received: by 2002:a05:620a:1526:: with SMTP id
 n6mr9998491qkk.334.1607451362146; 
 Tue, 08 Dec 2020 10:16:02 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id h125sm14351303qkc.36.2020.12.08.10.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:16:01 -0800 (PST)
Date: Tue, 8 Dec 2020 13:16:00 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v5 4/4] migration: implementation of background snapshot
 thread
Message-ID: <20201208181600.GD21402@xz-x1>
References: <20201204093103.9878-1-andrey.gruzdev@virtuozzo.com>
 <20201204093103.9878-5-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201204093103.9878-5-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Dec 04, 2020 at 12:31:03PM +0300, Andrey Gruzdev wrote:
> Introducing implementation of 'background' snapshot thread
> which in overall follows the logic of precopy migration
> while internally utilizes completely different mechanism
> to 'freeze' vmstate at the start of snapshot creation.
> 
> This mechanism is based on userfault_fd with wr-protection
> support and is Linux-specific.
> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


