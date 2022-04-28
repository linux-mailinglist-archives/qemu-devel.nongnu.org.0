Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3560251349F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:12:27 +0200 (CEST)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3wX-0000bM-RT
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nk3ua-00089k-Pj
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nk3uX-0004bc-MX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651151419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sYm49T+bhgcpxiwFeB72ywmhGyfNufhq19aEoQiITKg=;
 b=UT7yvYpigBtGlFd+2tHfuuFSdbTMh5hnn9+NxgfrrdKirPhcIl7H8ntZvVL/F5SjkxB58S
 S6bMHU3e/P0OHdsgKzIX94UzLsEDymdLnzWA5Vj6Fzk/+1c8W4Skzuf4JBEBruIQz1Vy+5
 YlQaeOwbYVgtZipVekIv8BiEUpJ8xqQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-LKknHVn5PEGzoiy4mL0S3Q-1; Thu, 28 Apr 2022 09:10:18 -0400
X-MC-Unique: LKknHVn5PEGzoiy4mL0S3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5E0929DD9B5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 13:10:17 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE1FB2024CCA;
 Thu, 28 Apr 2022 13:09:58 +0000 (UTC)
Date: Thu, 28 Apr 2022 08:09:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 2/9] tests: add more helper macros for creating TLS
 x509 certs
Message-ID: <20220428130957.fau7n7uy454eri7t@redhat.com>
References: <20220426160048.812266-1-berrange@redhat.com>
 <20220426160048.812266-3-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426160048.812266-3-berrange@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 05:00:41PM +0100, Daniel P. Berrangé wrote:
> These macros are more suited to the general consumers of certs in the
> test suite, where we don't need to exercise every single possible
> permutation.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/unit/crypto-tls-x509-helpers.h | 53 ++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>

No impact until a later patch uses the macros, but the look reasonable.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


