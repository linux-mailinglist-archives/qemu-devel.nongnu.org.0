Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FCF2C58DE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:58:01 +0100 (CET)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJeh-0007Tb-Ni
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kiJVB-0003Aw-Dw
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:48:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kiJV8-0001Gg-NC
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606405683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MVi08JgjSTmPtTKYKqRTm05b2PHdbNBM5u+Dq1pymaE=;
 b=huEEDLYFz4B8j/m+fmeivWA69B5thDa5t6RuQmB6mqHOHnZpkYH7BtW6Uwp0wLN8Y/BJVf
 J6wXOJm2qxqcS6UNzMZqrPxsalX4i8FgPR0dPi+kICRlE332xIZEHNjhFrnUya0vJ1uCFu
 AJbuijaLjVZcUgxURJhWl/VTLTZRMpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411--pIotlCLPPqgydaM14adFA-1; Thu, 26 Nov 2020 10:48:01 -0500
X-MC-Unique: -pIotlCLPPqgydaM14adFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 975E380734F;
 Thu, 26 Nov 2020 15:48:00 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E48E560862;
 Thu, 26 Nov 2020 15:47:54 +0000 (UTC)
Date: Thu, 26 Nov 2020 16:47:51 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201126154751.GH2366@angien.pipo.sk>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
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
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
> 
> Currently the only way to make (external) live VM snapshot is using existing
> dirty page logging migration mechanism. The main problem is that it tends to
> produce a lot of page duplicates while running VM goes on updating already
> saved pages. That leads to the fact that vmstate image size is commonly several
> times bigger then non-zero part of virtual machine's RSS. Time required to
> converge RAM migration and the size of snapshot image severely depend on the
> guest memory write rate, sometimes resulting in unacceptably long snapshot
> creation time and huge image size.
> 
> This series propose a way to solve the aforementioned problems. This is done
> by using different RAM migration mechanism based on UFFD write protection
> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
> guest RAM content using write-protection and iteratively release protection
> for memory ranges that have already been saved to the migration stream.
> At the same time we read in pending UFFD write fault events and save those
> pages out-of-order with higher priority.

This sounds amazing! Based on your description I assume that the final
memory image contains state image from the beginning of the migration.

This would make it desirable for the 'migrate' qmp command to be used as
part of a 'transaction' qmp command so that we can do an instant disk
and memory snapshot without any extraneous pausing of the VM.

I'll have a look at using this mechanism in libvirt natively.


