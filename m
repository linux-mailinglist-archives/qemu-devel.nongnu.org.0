Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CC0425667
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:13:11 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYV54-00056y-0r
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYV0D-000193-QK
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 11:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYV08-0008H2-QC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 11:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633619283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z7AjbFAwl85eEj6vwmvjWNFm0igZ1qsG6xMbWgCgBvI=;
 b=f2Fs7vWnZs6NFZd/0Z3ehTI8xJgGEmfTPPho5Kl6PP23fql1slnSab2ABWOaz8Afpo51vW
 7Fx2KZos0CfxWdwU6YVi5In9b7XMgM5EojZtyrV14YHzjbIFg7CG2lVa+e61fKB+9wHuEo
 46df/8WqY6oTacjCu5ghR2UTNbtvRaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-Od5MUCn3MUaNTwJhzi3Nyg-1; Thu, 07 Oct 2021 11:07:58 -0400
X-MC-Unique: Od5MUCn3MUaNTwJhzi3Nyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F57118125C5;
 Thu,  7 Oct 2021 15:07:57 +0000 (UTC)
Received: from redhat.com (ovpn-113-216.phx2.redhat.com [10.3.113.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ECE7100EBD0;
 Thu,  7 Oct 2021 15:07:56 +0000 (UTC)
Date: Thu, 7 Oct 2021 10:07:51 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 12/17] python/machine: Handle QMP errors on close more
 meticulously
Message-ID: <20211007150751.at6pwvncgwk5koaz@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-13-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923004938.3999963-13-jsnow@redhat.com>
User-Agent: NeoMutt/20210205-818-e2615c
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 08:49:33PM -0400, John Snow wrote:
> To use the AQMP backend, Machine just needs to be a little more diligent
> about what happens when closing a QMP connection. The operation is no
> longer a freebie in the async world; it may return errors encountered in
> the async bottom half on incoming message receipt, etc.
> 
> (AQMP's disconnect, ultimately, serves as the quiescence point where all
> async contexts are gathered together, and any final errors reported at
> that point.)
> 
> Because async QMP continues to check for messages asynchronously, it's
> almost certainly likely that the loop will have exited due to EOF after
> issuing the last 'quit' command. That error will ultimately be bubbled
> up when attempting to close the QMP connection. The manager class here
> then is free to discard it -- if it was expected.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> ---
> 
> Yes, I regret that this class has become quite a dumping ground for
> complexity around the exit path. It's in need of a refactor to help
> separate out the exception handling and cleanup mechanisms from the
> VM-related stuff, but it's not a priority to do that just yet -- but
> it's on the list.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

This second S-o-b won't matter.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


