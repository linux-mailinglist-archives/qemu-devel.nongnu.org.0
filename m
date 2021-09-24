Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B7417B70
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:04:51 +0200 (CEST)
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqV7-0002sD-KG
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqNQ-0002fS-Kh
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:56:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqNM-0004Xo-7R
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632509807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARoIG1s7sICDost83MIH3aA5rdjVN8sBPObMzetBla0=;
 b=TCEPbF96tn3xhSMWX9dsCqr8FTwiSrL/sJJpR8zerOhrUXa8ssciFMGQxnfLqodnqjx52T
 gV3UM9Z20zruPOAUOFguL/EdapRlSNPkh3T6Hv7sy5Z1KHuzgOHN5zLfLzL9hJMFTzfSw8
 z3t+u+28y+bUI6MRo9BEkcKd+sQwYl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-nrlPzodfOQqwUVx9bUr-eQ-1; Fri, 24 Sep 2021 14:56:46 -0400
X-MC-Unique: nrlPzodfOQqwUVx9bUr-eQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50B901927801;
 Fri, 24 Sep 2021 18:56:45 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A03E019C87;
 Fri, 24 Sep 2021 18:56:44 +0000 (UTC)
Date: Fri, 24 Sep 2021 13:56:43 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
Message-ID: <20210924185643.zatpxo5pvusjz7as@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210924090427.9218-10-kwolf@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: pkrempa@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 11:04:25AM +0200, Kevin Wolf wrote:
> Directly call qdev_device_add_from_qdict() for QMP device_add instead of
> first going through QemuOpts and converting back to QDict.
> 
> Note that this changes the behaviour of device_add, though in ways that
> should be considered bug fixes:
> 
> QemuOpts ignores differences between data types, so you could
> successfully pass a string "123" for an integer property, or a string
> "on" for a boolean property (and vice versa).  After this change, the
> correct data type for the property must be used in the JSON input.
> 
> qemu_opts_from_qdict() also silently ignores any options whose value is
> a QDict, QList or QNull.
> 
> To illustrate, the following QMP command was accepted before and is now
> rejected for both reasons:
> 
> { "execute": "device_add",
>   "arguments": { "driver": "scsi-cd",
>                  "drive": { "completely": "invalid" },
>                  "physical_block_size": "4096" } }
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  softmmu/qdev-monitor.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


