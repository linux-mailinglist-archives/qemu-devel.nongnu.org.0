Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A748B42E8CA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:16:48 +0200 (CEST)
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbGWN-0001eB-Ol
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbGSd-0006AS-Gw
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbGSb-0002md-Sk
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634278373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1yYRmbgQqhf9pbzwgSU/XwI65zg5SmNR/3E6K1NF2Y=;
 b=f8RFMFGh1num5LGWF8Kbde18zAZBB3zDFtQXJ2xElfDcIu3LuXORAwmnh38MZ5MhT+vJqV
 Um813qOFK5k7cozUfkdvrbpfvqOxc9NGQmVL4cBuAADQgEFe8wACjvgAZbGS++IoBxkAjK
 FCVDi+hqQo9zzZePYrqzzOpnTHVbzR4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-x85PBs8pMd2uZwrOjevIbA-1; Fri, 15 Oct 2021 02:12:50 -0400
X-MC-Unique: x85PBs8pMd2uZwrOjevIbA-1
Received: by mail-pl1-f198.google.com with SMTP id
 y13-20020a1709029b8d00b0013dc7c668e2so3452119plp.16
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 23:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=V1yYRmbgQqhf9pbzwgSU/XwI65zg5SmNR/3E6K1NF2Y=;
 b=NA/K6yPa5TtmVkZumpa0ItbLCTW4lLkrNf/EnOsDfz5J+ncddexPIBPMfVUibrOdJF
 Dps9/9U4BiFNzSpl8ET5AtgRb3VqwPcXkOxiJsXWs/3n4s9frUn6cnAnPHa8CKMiCu/S
 1O0F533lFCzY2BsNDbgHEmyNfswM3ffzeLI6ukD0f+LKvYYJYX57qUAAl8QyDwZzkHh+
 N+fP8a09j7yQAjV792BSJdn6bVKNkv+u9B3qf/MXeVTr/49iXp6BpQii28aAsTloG4na
 3mi4dsjPuXxy52yDmnwper4HAaGfb42Bmh4KovxtA1tRC1gJH0t9vyO62UrCt9A305SV
 V+tQ==
X-Gm-Message-State: AOAM531VFHzq0UJ8mDNPXpwlUcBV6Avv19Q3hzojvWuJokxCDRWVjJG7
 +an4uhUosHsMtxEFM8W2y7SGkex/rQWDc1iz9wmLoUEDVfi9qe38mJxIIVl8zebSynqN70R6UpK
 g1lbwkPyxkxQ7Vs8=
X-Received: by 2002:a05:6a00:b8f:b0:44c:6220:3396 with SMTP id
 g15-20020a056a000b8f00b0044c62203396mr9842962pfj.58.1634278368367; 
 Thu, 14 Oct 2021 23:12:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf+rzfxV14NiwTVJQgWw72UWHpbHWXweeDvuvWXiiN5B+2IT/crec+mJl6l1rQQFzSMkv/lQ==
X-Received: by 2002:a05:6a00:b8f:b0:44c:6220:3396 with SMTP id
 g15-20020a056a000b8f00b0044c62203396mr9842943pfj.58.1634278367983; 
 Thu, 14 Oct 2021 23:12:47 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r130sm4030255pfc.89.2021.10.14.23.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:12:47 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:12:42 +0800
From: Peter Xu <peterx@redhat.com>
To: lma <lma@suse.de>
Subject: Re: [PATCH 0/3] Postcopy migration: Add userfaultfd- user-mode-only
 capability
Message-ID: <YWkb2rrrkMLC8BwM@t490s>
References: <20211014091551.15201-1-lma@suse.com> <YWjAqX13PYhBgbVh@t490s>
 <7c0161fab24b06fa249061780a7f30d4@suse.de>
MIME-Version: 1.0
In-Reply-To: <7c0161fab24b06fa249061780a7f30d4@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 01:38:06PM +0800, lma wrote:
> 在 2021-10-15 07:43，Peter Xu 写道：
> > On Thu, Oct 14, 2021 at 05:15:48PM +0800, Lin Ma wrote:
> > > Since kernel v5.11, Unprivileged user (without SYS_CAP_PTRACE
> > > capability)
> > > must pass UFFD_USER_MODE_ONLY to userfaultd in case
> > > unprivileged_userfaultfd
> > > sysctl knob is 0.
> > > Please refer to https://lwn.net/Articles/819834/ and the kernel
> > > commits:
> > > 37cd0575 userfaultfd: add UFFD_USER_MODE_ONLY
> > > d0d4730a userfaultfd: add user-mode only option to
> > > unprivileged_userfaultfd sysctl knob
> > > 
> > > This patch set adds a migration capability to pass UFFD_USER_MODE_ONLY
> > > for postcopy migration.
> > 
> > Then it's at least no KVM, no vhost, am I right?  Could I ask is there a
> > real
> > user behind this?  Thanks,
> 
> Well, The "user-mode-only" has nothing to do with qemu's user-mode
> emulation.

I didn't follow why you thought my question was about "user-mode emulation"..

To ask in another way: after this new cap set, qemu will get a SIGBUS and VM
will crash during postcopy migrating as long as either KVM or vhost-kernel
faulted on any of the missing pages, am I right?

Thanks,

-- 
Peter Xu


