Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C71947ECB5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:36:00 +0100 (CET)
Received: from localhost ([::1]:49552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0f7O-00046s-Gq
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:35:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0euX-00083n-CB
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 02:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0euU-0008RZ-8q
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 02:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640330552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VG4cX3j8tvzeJJs2GtMqoRgfjCGvvRGrXUXhXOkiAko=;
 b=DRv0Q9ViBj5zPgy1bytvbvezvutVmI6hDxt8cAP/J+mf4jI/0MeLEOo0RhHCXQ/aQDvwEO
 Hj79CC/e8YTVakgLsXk5fu+zIn5lC5HyIZp6V5fHP38BnPe5M6VjRtHlmswCp6lU/8clVU
 PRUSbzprUnjcHZbSArEEPZUR2/vitW0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-B9fK281yMP-eLnn2Ib8vbw-1; Fri, 24 Dec 2021 02:22:31 -0500
X-MC-Unique: B9fK281yMP-eLnn2Ib8vbw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r7-20020adfbb07000000b001a254645f13so1506314wrg.7
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 23:22:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VG4cX3j8tvzeJJs2GtMqoRgfjCGvvRGrXUXhXOkiAko=;
 b=5VeSBrUAlsQp9aLloT1w0cgMI2SB0hE+w7UEVJSL1kckLg8MRCf2NH4gM1VMBsC2Xx
 Nd0E6MAKBh3aSHkt0pQbkMGekV/fhP8XGorJ+aS40oEQ9y3JGotR/TQ5TrS5T6g6cVzk
 9zThc6LT0oRohkdVU+E6/vBy52stWTnXZEwtA/Q/+LsYs4Y4UvJlzgqoRv0uDbbqMefV
 0OXwegv39RA5j07BAG0+TKIuy5jwvMASCz3Y/K1zcPjFks05d+CT3kLR+bohiLgo+gx6
 gvlU+U+D0IX1twJH5TYDV425BkhgUp2KGHUZYyZxgoWhluACovxqS/3NBUDOu1WHp1MH
 gtxw==
X-Gm-Message-State: AOAM532/h25/+HJwncoEEWjwL1aRJweXgk0nt9g+0BwQY3LSrpndLD49
 jSQzTy9LLEKaSyde8FVpLOLbmSfZzj8mivVElhyd9YhvtxQBLbET0XSuEswXzTlEM6ihVxOg/pn
 4rmdVO53jgaPsTrA=
X-Received: by 2002:a05:600c:3c8a:: with SMTP id
 bg10mr4027118wmb.106.1640330549397; 
 Thu, 23 Dec 2021 23:22:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2dIAPvRqPRTC9bvxCMeR2ZnfYluKKZbSYTV0HpkuDB4G536pCNL4PkH/lnuJ57BYIEdx88w==
X-Received: by 2002:a05:600c:3c8a:: with SMTP id
 bg10mr4027108wmb.106.1640330549238; 
 Thu, 23 Dec 2021 23:22:29 -0800 (PST)
Received: from xz-m1.local ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id a198sm6876573wmd.42.2021.12.23.23.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 23:22:28 -0800 (PST)
Date: Fri, 24 Dec 2021 15:22:23 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 2/6] migration: We only need last_stage in two places
Message-ID: <YcV1L1GPcVjM+RHb@xz-m1.local>
References: <20211221125235.67414-1-quintela@redhat.com>
 <20211221125235.67414-3-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211221125235.67414-3-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 01:52:31PM +0100, Juan Quintela wrote:
> We only need last_stage in two places and we are passing it all
> around.  Just add a field to RAMState that passes it.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


