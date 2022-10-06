Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040965F6DB3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:50:25 +0200 (CEST)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVwt-0001Ie-Gx
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogVlF-0001DE-Ni
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:38:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogVlC-0004BI-Fk
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665081497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tzc7W+1m3uA9huygwYNFGTLtV80/jzrfdb3v96kQppI=;
 b=L3L3ng/gfRHOpQGuCk0tXaiGtRRRFbowTZyrT8DdTXhdXGaxpkcksN4xxVKnlH8sKGpdJw
 hPfVTdNZuj4Fd9FeEmYLaAwCNOCADFa/CDUjfzz2hhDEnlGfMD3oY1Qc6ahCHYWbaymryf
 UPrMT3qVPMsMYXxFH/Gyq9CbQIua6eA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-lzXgoB05M7ynYNuAV1Nhdg-1; Thu, 06 Oct 2022 14:38:16 -0400
X-MC-Unique: lzXgoB05M7ynYNuAV1Nhdg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c3-20020a7bc843000000b003b486fc6a40so855047wml.7
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 11:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Tzc7W+1m3uA9huygwYNFGTLtV80/jzrfdb3v96kQppI=;
 b=lJDMHXj7xjyRKQGmvWvKtVQqnG6HkrAjksGmzpPSf/dXBnacVuichUNSpgekVEhNhb
 pZQOOJT8mNQYPfeUnsVibUlvSGN1koA8iXzZOSY1B5Y0DCusHudZ0oyy9oG5EcFX20fQ
 VGE7gew9NZDUh9mo6eUyb1ZsI1TjulpE37IPHOkSQclDpVXIpQQbz0u8OHeQKDYtLePx
 aIkrYgz4f8IYzcsI2cKkxS1HGaCELMbaHaH/WvbyIYMs6ZRFlHUtxHwCZQyx5sOpiupW
 smekz/yv62F8dq+dZGAf2g0YiZ6T7sRx7+nE6zXxn3vM1XrM0CMlXrooHFC6hDE+v0/P
 HXzg==
X-Gm-Message-State: ACrzQf36MZ0z19y07dRhRYkpSD5A6LAvu/o8T7Vbvut/Quy4Ok1DJIp4
 tVZO4H0kTF3m6Rilt8+Qsx/bijVTa16+Gfc2U+bk43JI4qTnCmwkEDkYvDCNrWxfAM1WV1O3yxB
 fzbhesZSf3ouDgMs=
X-Received: by 2002:a5d:620c:0:b0:22b:e59:8d3a with SMTP id
 y12-20020a5d620c000000b0022b0e598d3amr863265wru.28.1665081495295; 
 Thu, 06 Oct 2022 11:38:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6NtOW/XH+eEiiyzJNSwj10KMaY/Bijno2W55Ihsy3WUdEnjfj2NA8AanYF/Hv/HUuVeE8DzQ==
X-Received: by 2002:a5d:620c:0:b0:22b:e59:8d3a with SMTP id
 y12-20020a5d620c000000b0022b0e598d3amr863248wru.28.1665081495096; 
 Thu, 06 Oct 2022 11:38:15 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n3-20020a1ca403000000b003b49bd61b19sm5514169wme.15.2022.10.06.11.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 11:38:14 -0700 (PDT)
Date: Thu, 6 Oct 2022 19:38:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 11/14] migration: Move last_sent_block into
 PageSearchStatus
Message-ID: <Yz8glN4mmxNOn9UA@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225223.49052-1-peterx@redhat.com>
 <Yz8Jhyd6b5DscLxr@work-vm> <Yz8fx2wO5f3gNPsJ@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz8fx2wO5f3gNPsJ@x1n>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Thu, Oct 06, 2022 at 05:59:51PM +0100, Dr. David Alan Gilbert wrote:
> > > @@ -2999,8 +3010,8 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms)
> > >      migration_bitmap_sync(rs);
> > >  
> > >      /* Easiest way to make sure we don't resume in the middle of a host-page */
> > > +    rs->pss[RAM_CHANNEL_PRECOPY].last_sent_block = NULL;
> > 
> > Why don't we reset the postcopy one here as well?
> 
> Because ram_postcopy_send_discard_bitmap() is only called before postcopy
> starts, so the other field should be NULL already.  Thanks,

Ah, yes, OK


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


