Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2154F3EDA2B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:49:36 +0200 (CEST)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFern-0006qy-6x
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mFeqt-0006BO-P7
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mFeqr-0004Pp-Hj
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629128916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eqGNycDCKHG3gHGbGWPwugw7NM25Pzy7TXVzDcO4Xdo=;
 b=CFbgDLxnbTve9HBXRs3vIC5WdqKubvBcAqhHzPZgKkLz3jqQ7hhKXGmm6olKPl2cFXflYH
 kOZ4g+ZyiQxRm5yeqYiFNQzOjajV3swUaxZpEwVxdXsuUIk7b0XgvxwbF3DHnqcX2F+LBU
 ZItPkc9Sy5NvtOj/+nSFZI4FT797uVM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-TuSM-NQOOqK5cmEQYQX62Q-1; Mon, 16 Aug 2021 11:48:33 -0400
X-MC-Unique: TuSM-NQOOqK5cmEQYQX62Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so6334370wmj.8
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 08:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eqGNycDCKHG3gHGbGWPwugw7NM25Pzy7TXVzDcO4Xdo=;
 b=DpSGdFtBxqgI8bym38HK3dQ8j2UGutRm+z747A5xaJIeWMUAuO576h/xZX+C9xotl7
 ttPOkkjDTn6WRMJZZWmHvYcPIIuARmY3fAWqW2qzOydEEaRSnGIW0xGYbH5fFNkXPFXQ
 0C0t3bizVaUF6HHxynzEZgaCCPdHbeqzB/avu6pJ9QciIo3C7FlZw5djNyi10HZ7DIIg
 pKVyIRSgbAOw3SXQIsePPQqR/iqrkxjZ8s5AV5a3F9+aWAo+3dc9rrByeOYXDQt4Uixq
 mc7SVWcyeR/LvHjQIcXnVsWyFBmKziUO4y79NqHJdXDOo5evA5YkDePE0sx5l2DEgEAi
 Cafw==
X-Gm-Message-State: AOAM533pYNOp9JxEn1r9wuAscgr1Cp50jeT4zB7DAAwWY725f9vzJ0zY
 ohbGMvr+cfkJ3NitBzp2CLlhn+hm3Arw4TnhywQs8t7clGn+0lymrovuZzQoijwqosHQldAcap3
 UFNcL1SI3hwGRD+Y=
X-Received: by 2002:a1c:3c8b:: with SMTP id j133mr16015214wma.9.1629128912357; 
 Mon, 16 Aug 2021 08:48:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzic1CE5/4fFpbEDhx9cZg3AlxsIbchSr8P37vgecT5Us/BKgF6gpJ/21AQSbOiQvBw9bdd+A==
X-Received: by 2002:a1c:3c8b:: with SMTP id j133mr16015204wma.9.1629128912219; 
 Mon, 16 Aug 2021 08:48:32 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id b13sm12098776wrf.86.2021.08.16.08.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 08:48:31 -0700 (PDT)
Date: Mon, 16 Aug 2021 16:48:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YRqIzcsQM2OhhXrg@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <20210816144413.GA29881@ashkalra_ubuntu_server>
 <b25a1cf9-5675-99da-7dd6-302b04cc7bbc@redhat.com>
 <20210816151349.GA29903@ashkalra_ubuntu_server>
 <f7cf142b-02e4-5c87-3102-f3acd8b07288@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f7cf142b-02e4-5c87-3102-f3acd8b07288@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <ashish.kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, frankeh@us.ibm.com,
 dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 16/08/21 17:13, Ashish Kalra wrote:
> > > > I think that once the mirror VM starts booting and running the UEFI
> > > > code, it might be only during the PEI or DXE phase where it will
> > > > start actually running the MH code, so mirror VM probably still need
> > > > to handles KVM_EXIT_IO when SEC phase does I/O, I can see PIC
> > > > accesses and Debug Agent initialization stuff in SEC startup code.
> > > That may be a design of the migration helper code that you were working
> > > with, but it's not necessary.
> > > 
> > Actually my comments are about a more generic MH code.
> 
> I don't think that would be a good idea; designing QEMU's migration helper
> interface to be as constrained as possible is a good thing.  The migration
> helper is extremely security sensitive code, so it should not expose itself
> to the attack surface of the whole of QEMU.

It's also odd in that it's provided by the guest and acting on behalf of
the migration code; that's an unusually trusting relationship.

Dave

> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


