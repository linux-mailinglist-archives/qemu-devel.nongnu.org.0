Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0E35136CF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:23:58 +0200 (CEST)
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk53l-0002Dg-Gf
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nk4le-0003we-6m
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nk4lY-00089q-LD
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651154706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d79mdozVJV3SKx0gJRcQ4P9TA1xz3qLL2yGBtfpP42o=;
 b=KNfs6vV5RyHMDgHMVuNgacEofeiVOzR2fcRk8hOrOyzgRAsbYu4XJkXzfq/gEXeOc5yM6M
 mQNzQlFMKnUL1jOAG8mfyA7p+VlZ4jfEyqOR6wTeYbrMBRRrwaRBzE37tfD+sIfaKPYceQ
 24TvH2Ertz9Oswezd1CRbpI3V7wtd/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-6qoOFubAMwiwPC-5GuqSTw-1; Thu, 28 Apr 2022 10:05:05 -0400
X-MC-Unique: 6qoOFubAMwiwPC-5GuqSTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C205618A6581
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 14:05:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F48040D2821;
 Thu, 28 Apr 2022 14:05:04 +0000 (UTC)
Date: Thu, 28 Apr 2022 09:05:02 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 7/9] tests: add multifd migration tests of TLS with
 PSK credentials
Message-ID: <20220428140502.vwvuek74yjvj5bgq@redhat.com>
References: <20220426160048.812266-1-berrange@redhat.com>
 <20220426160048.812266-8-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426160048.812266-8-berrange@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Tue, Apr 26, 2022 at 05:00:46PM +0100, Daniel P. Berrangé wrote:
> This validates that we correctly handle multifd migration success
> and failure scenarios when using TLS with pre shared keys.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qtest/migration-test.c | 60 +++++++++++++++++++++++++++++++++---
>  1 file changed, 56 insertions(+), 4 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


