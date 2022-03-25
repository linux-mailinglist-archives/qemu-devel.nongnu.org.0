Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BC64E6C16
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 02:38:11 +0100 (CET)
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXYu2-0000SU-JX
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 21:38:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXYsv-00083R-4u
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 21:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXYst-000564-3t
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 21:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648172218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RnmcoBIbPM70fwsq0HBcjlvTkBnydDBWpRHVkeOpGYk=;
 b=IGhGLXsDZy5EPlRnoZQk2Mo0pTjZwIYEKO7YwvrrKKghQ4dvFYrhGOtFUaGSC3JL1PM8Li
 PkSfRl0Jhkmc9kq+DIGLAjylZobNwhAZihImU/X4BDPyaM/XaER8SqnzlYzLLUh8SbZ2ng
 1x3zwP0UoIWZ436e5hHwPHKqkYcVCJ0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-Pj0fQI27MI6wDSMpO0S9PA-1; Thu, 24 Mar 2022 21:36:16 -0400
X-MC-Unique: Pj0fQI27MI6wDSMpO0S9PA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3908F1C05ED1;
 Fri, 25 Mar 2022 01:36:16 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B872F7AEB;
 Fri, 25 Mar 2022 01:36:08 +0000 (UTC)
Date: Thu, 24 Mar 2022 20:36:06 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 13/17] iotests/migration-permissions: use
 assertRaises() for qemu_io() negative test
Message-ID: <20220325013606.oji7insnjjcbtgfs@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
 <20220324183018.2476551-14-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220324183018.2476551-14-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-512-43304b
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 02:30:14PM -0400, John Snow wrote:
> Modify this test to use assertRaises for its negative testing of
> qemu_io. If the exception raised does not match the one we tell it to
> expect, we get *that* exception unhandled. If we get no exception, we
> get a unittest assertion failure and the provided emsg printed to
> screen.
> 
> If we get the CalledProcessError exception but the output is not what we
> expect, we re-raise the original CalledProcessError.
> 
> Tidy.
> 
> (Note: Yes, you can reference "with" objects after that block ends; it
> just means that ctx.__exit__(...) will have been called on it. It does
> not *actually* go out of scope. unittests expects you to want to inspect
> the Exception object, so they leave it defined post-exit.)

Thanks for adding that paragraph.

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Tested-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> ---

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


