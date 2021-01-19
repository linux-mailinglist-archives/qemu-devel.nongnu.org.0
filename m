Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14B52FB61A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 13:34:52 +0100 (CET)
Received: from localhost ([::1]:49270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qDj-00035d-JC
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 07:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1qCl-0002dr-8s
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 07:33:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1qCf-0000gM-9F
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 07:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611059622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/W+/YeMLO/gatubtpPi6rsUUt7MAcBreSZcWixr0ftQ=;
 b=bqqv5YLdNCOsIzMPCaSBmc/ixSY6NMNbEWPpEYTGLjvhsu/k6D2q4TeiMMt6503krkLKmc
 vH+D4ejTEhws9jas4MtrWNT2NgwbT7wBwdedIcMcRYThw6+Y8WaxBuJ11q9O6u88JhANDL
 BqbRFVDcDy//VnKRjLcqE5myU/40wsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-rqVX5hktP3iJMdA_U9IIfg-1; Tue, 19 Jan 2021 07:33:41 -0500
X-MC-Unique: rqVX5hktP3iJMdA_U9IIfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AC82107ACE4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 12:33:40 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-149.ams2.redhat.com [10.36.115.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C45C5C8A7;
 Tue, 19 Jan 2021 12:33:39 +0000 (UTC)
Date: Tue, 19 Jan 2021 13:33:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/25] qemu-option: clean up id vs. list->merge_lists
Message-ID: <20210119123337.GF5012@merkur.fritz.box>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210118163113.780171-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.01.2021 um 17:30 hat Paolo Bonzini geschrieben:
> Looking at all merge-lists QemuOptsList, here is how they access their
> QemuOpts:
> 
> reopen_opts in qemu-io-cmds.c ("qemu-img reopen -o")
> 	qemu_opts_find(&reopen_opts, NULL)
> 
> empty_opts in qemu-io.c ("qemu-io open -o")
> 	qemu_opts_find(&empty_opts, NULL)
> 
> qemu_rtc_opts ("-rtc")
> 	qemu_find_opts_singleton("rtc")
> 
> qemu_machine_opts ("-M")
> 	qemu_find_opts_singleton("machine")
> 
> qemu_boot_opts ("-boot")
> 	QTAILQ_FIRST(&qemu_find_opts("bootopts")->head)
> 
> qemu_name_opts ("-name")
> 	qemu_opts_foreach->parse_name
> 	parse_name does not use id
> 
> qemu_mem_opts ("-m")
> 	qemu_find_opts_singleton("memory")
> 
> qemu_icount_opts ("-icount")
> 	qemu_opts_foreach->do_configuree_icount
> 	do_configure_icount->icount_configure
> 	icount_configure does not use id

qemu_action_opts has been added since the last version of this series.
It's fine, too (gets converted to a QAPI type that doesn't have an "id"
field), but you may want to update the commit message.

With this:
Reviewed-by: Kevin Wolf <kwolf@redhat.com>


