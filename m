Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB86BDE13
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 02:17:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcyiX-0006VM-SZ; Thu, 16 Mar 2023 21:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcyiV-0006VB-Hg
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 21:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcyiU-0002z2-0V
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 21:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679015829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uNBOawNcreteF3XHvkKFBVu5B10HbYFaGGSt0AABsIU=;
 b=a9Ted0aLtXROKPnPl0iSx1cPXiNuotglU+G4XV8+SSeiOi6uMsqyxGo6X6/37p0JUPjpNk
 4RNGwOKRX+ByZhjETtUMPECGqRZVBAkAN69s7wliR1KG4uOJ58TM/c1FfMrWHe9WntsMSc
 8gjrLejjdM3gPGexHUQp7ZTff4k0EuI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387--liodvEdNUmyPBp0vuxkRQ-1; Thu, 16 Mar 2023 21:17:07 -0400
X-MC-Unique: -liodvEdNUmyPBp0vuxkRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2561729A9D2A;
 Fri, 17 Mar 2023 01:17:07 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A18E2027040;
 Fri, 17 Mar 2023 01:17:06 +0000 (UTC)
Date: Thu, 16 Mar 2023 20:17:04 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, jsnow@redhat.com
Subject: Re: [PATCH 14/14] qapi: Require boxed for conditional command and
 event arguments
Message-ID: <20230317011704.unzjvlklwa63nmqv@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-15-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316071325.492471-15-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 16, 2023 at 08:13:25AM +0100, Markus Armbruster wrote:
> The C code generator fails to honor 'if' conditions of command and
> event arguments.
>
...
> 
> Conditional arguments work fine with 'boxed': true, simply because
> complex types with conditional members work fine.  Not worth breaking.
> 
> Reject conditional arguments unless boxed.

Yay - matches my earlier suggestion at how to avoid #if in the middle
of a parameter list.

> 
> Move the tests cases covering unboxed conditional arguments out of
> tests/qapi-schema/qapi-schema-test.json.  Cover boxed conditional
> arguments there instead.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

A big end to the series, but I'm glad we got here.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


