Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3830EF2C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:05:11 +0100 (CET)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7aZa-0008Qq-K2
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7aYU-0007TP-A4
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:04:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7aYS-0000GN-GW
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612429439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwUrj0TZNvFH6QlORmVM2F5UL4Mg1UPFsiNtnb+m7Ys=;
 b=i1rk70bAQrzNPcJW3AfOm9n3LECwwPwsgk8jFG4g0wLxeAMISLlJ5xh1xyDPwGa9LOJA4t
 QP1kZqAsTKhVc3C57KvZLoLa7l2VJOOsDpR/KLKBkDjJP84EOx2zsFrCWn+kZxg5y4vPS3
 Up/H/eiugDpB3FKYzbr4ZNlN7bVbEbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-4zmrSCvUOo-CXO0Hzp-G6A-1; Thu, 04 Feb 2021 04:03:56 -0500
X-MC-Unique: 4zmrSCvUOo-CXO0Hzp-G6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0BE9192CC40;
 Thu,  4 Feb 2021 09:03:55 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77E11194A4;
 Thu,  4 Feb 2021 09:03:51 +0000 (UTC)
Date: Thu, 4 Feb 2021 09:03:51 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
Message-ID: <20210204090351.GN30079@redhat.com>
References: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
 <19D304C1-6401-4D16-AB54-DD19C978D04D@redhat.com>
 <db32a1f5-ad73-a341-f5e7-1c8f592d3d5b@redhat.com>
 <bd7154e1-4d6c-5b98-9e80-ec04f8476373@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bd7154e1-4d6c-5b98-9e80-ec04f8476373@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 09:38:45AM +0100, David Hildenbrand wrote:
> On 04.02.21 08:55, David Hildenbrand wrote:
> >On 04.02.21 07:41, David Hildenbrand wrote:
> >>
> >>>Am 04.02.2021 um 03:22 schrieb Richard Henderson <richard.henderson@linaro.org>:
> >>>
> >>>﻿On 2/1/21 10:45 AM, Richard W.M. Jones wrote:
> >>>>This commit breaks running certain s390x binaries, at least
> >>>>the "mount" command (or a library it uses) breaks.
> >>>>
> >>>>More details in this BZ:
> >>>>
> >>>>https://bugzilla.redhat.com/show_bug.cgi?id=1922248
> >>>>
> >>>>Could we revert this change since it seems to have caused other
> >>>>problems as well?
> >>>
> >>>Well, the other problems have been fixed (which were in fact latent, and could
> >>>have been produced by other means).  I would not like to sideline this patch
> >>>set indefinitely.
> >>>
> >>>Could you give me some help extracting the relevant binaries?  "Begin with an
> >>>s390x host" is a non-starter.
> >>>
> >>
> >>Hi,
> >>
> >>I‘m planning on reproducing it today or tomorrow. Especially, finding a reproducer and trying reproducing on x86-64 host.
> >
> >FWIW, on an x86-64 host, I can boot F32, Fedora rawhide, and RHEL8.X
> >just fine from qcow2 (so "mount" seems to work in that environment as
> >expected). Maybe it's really s390x-host specific? I'll give it a try.
> >
> 
> F33 qcow2 [1] fails booting on an s390x/TCG host.

What did the failure look like?

> I tried "-cpu qemu" and "-qemu qemu=vx=off". The same image boots on
> x86-64/TCG host just fine.
> 
> 
> With
> 
> commit 8f17a975e60b773d7c366a81c0d9bbe304f30859
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date:   Mon Mar 30 19:52:02 2020 -0700
> 
>     tcg/optimize: Adjust TempOptInfo allocation
> 
> The image boots just fine on s390x/TCG as well.

Let me try this in a minute on my original test machine.

Rich.

> 
> [1] https://dl.fedoraproject.org/pub/fedora-secondary/releases/33/Cloud/s390x/images/Fedora-Cloud-Base-33-1.2.s390x.qcow2
> 
> -- 
> Thanks,
> 
> David / dhildenb

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top


