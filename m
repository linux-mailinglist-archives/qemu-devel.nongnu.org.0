Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849BC5803AC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 19:54:49 +0200 (CEST)
Received: from localhost ([::1]:42042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG2I4-0004vL-C3
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 13:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oG2GD-0002I0-3N
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 13:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oG2G8-0002UK-Ps
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 13:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658771567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2GV0XFBYHquAJLoVt+vsmQpLoEfKTNIJdK7cRyBsqws=;
 b=Wz5bOBfpcQbQJbOOUT/VHKV3i2HhTDGSyPA8Z3Se930G3MzpBa5gMuIfyJ2cp47oyf8xpx
 +Xj+sWhTWXSEkc6je/ResZS+/s2HDiNKjYUOgK1Jnnd3VixbeNjF2uBRrqb93jmbeF8B8n
 Jlcb+BgCtDp5ExJykwvHD7ybEvQjEls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-UE8BF1BxMu-y_82U2CV42w-1; Mon, 25 Jul 2022 13:52:44 -0400
X-MC-Unique: UE8BF1BxMu-y_82U2CV42w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EE6C811E80;
 Mon, 25 Jul 2022 17:52:43 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8C5C1121314;
 Mon, 25 Jul 2022 17:52:42 +0000 (UTC)
Date: Mon, 25 Jul 2022 12:52:41 -0500
From: Eric Blake <eblake@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] qapi: Add exit-failure PanicAction
Message-ID: <20220725175241.76jri4o3hlbh5icd@redhat.com>
References: <20220722233614.7254-1-iii@linux.ibm.com>
 <20220722233614.7254-2-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722233614.7254-2-iii@linux.ibm.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 23, 2022 at 01:36:13AM +0200, Ilya Leoshkevich wrote:
> Currently QEMU exits with code 0 on both panic an shutdown. For tests
> it is useful to return 1 on panic, so that it counts as a test
> failure.
> 
> Introduce a new exit-failure PanicAction that makes main() return
> EXIT_FAILURE. Tests can use -action panic=exit-failure option to
> activate this behavior.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

> +++ b/qapi/run-state.json
> @@ -364,10 +364,12 @@
>  #
>  # @shutdown: Shutdown the VM and exit, according to the shutdown action
>  #
> +# @exit-failure: Shutdown the VM and exit with nonzero status

Missing a '(since 7.1)' tag.  Otherwise a nice addition.

> +#
>  # Since: 6.0
>  ##
>  { 'enum': 'PanicAction',
> -  'data': [ 'pause', 'shutdown', 'none' ] }
> +  'data': [ 'pause', 'shutdown', 'exit-failure', 'none' ] }

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


