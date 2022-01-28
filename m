Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B242849FB28
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:02:09 +0100 (CET)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDRpI-0005Tm-5M
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:02:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDRRZ-00035H-Ip
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 08:37:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDRRW-000405-EU
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 08:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643377048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hlCwyaKtsChmbraFGuskqo4Zm7N/3vXrjDg9XbGLW2Q=;
 b=e5jO+FIKJBTVIPTEtcwJzAL56u+yVWpDrltzj2OVZUfE13w8+cCnxdZcPBfLL7/4ScSsCS
 8BExUafNr8+X9ecTPxW42UUnMFhTBQjLJj1PCSLEvF3fJLrKVLa7GFTSizqErJU/0MSXvW
 izl+4VgMiX6BEYPbKlSfNdzbZ0nNFwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-WlGyciGYMz2TqUlSclENmw-1; Fri, 28 Jan 2022 08:37:25 -0500
X-MC-Unique: WlGyciGYMz2TqUlSclENmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B6E91006AA8;
 Fri, 28 Jan 2022 13:37:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34B177DE28;
 Fri, 28 Jan 2022 13:37:10 +0000 (UTC)
Date: Fri, 28 Jan 2022 13:37:10 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: Block alignment of qcow2 compress driver
Message-ID: <20220128133710.GH7596@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
 <20220128114815.GQ1127@redhat.com>
 <26486e0e-adb5-aa3b-e70d-82ab21a0d2be@redhat.com>
 <20220128121803.GS1127@redhat.com>
 <54f3a548-ebea-9ed5-6387-5dda2bf92c4e@redhat.com>
 <20220128133053.GT1127@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220128133053.GT1127@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, eblake@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 01:30:53PM +0000, Richard W.M. Jones wrote:
> I feel like this may be a bug in what qemu-nbd advertises.  Currently
> it is:

Ignore this email, see other reply.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


