Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166EB52BDAA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:08:10 +0200 (CEST)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLHV-0006um-0S
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrLEw-0004gQ-Oj
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrLEu-0001Wu-RA
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652886327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yX6a7hp1I679oGPrEnPBuC0QTZ7tMa+sMVmzVUNSIGA=;
 b=ZSngxnZtbt4UKXySVvXA6BuDxNIgnoCiOSrvSU7do+BFEPbIF9Di3B59qfR4hfFIct5lL1
 vB27oIewWXUiyTzqqJJE2Czgc/mKeRHBljX/J2dFo8NJH/6mYrHzEMrUx1YtC+rhAgTDgb
 HndK1CkE9UIWgfMWYHVF4iYtP4LdRDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-i65A6sVBMfm3TT4eBRaagw-1; Wed, 18 May 2022 11:05:21 -0400
X-MC-Unique: i65A6sVBMfm3TT4eBRaagw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9C5B18A666C;
 Wed, 18 May 2022 15:05:07 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ED0D400E400;
 Wed, 18 May 2022 15:05:06 +0000 (UTC)
Date: Wed, 18 May 2022 10:05:04 -0500
From: Eric Blake <eblake@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC 1/6] qapi/migration: Introduce vcpu-dirtylimit-period
 parameters
Message-ID: <20220518150504.w3atejqy6xalap5g@redhat.com>
References: <cover.1652762652.git.huangy81@chinatelecom.cn>
 <23b507e7d9d230f1ea46bfe907acc09315505174.1652762652.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23b507e7d9d230f1ea46bfe907acc09315505174.1652762652.git.huangy81@chinatelecom.cn>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 17, 2022 at 02:35:01PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce "vcpu-dirtylimit-period" migration parameters,
> which is used to makes dirtyrate calculation period

make

> configurable.
> 
> To implement that, refactor vcpu_dirty_rate_stat_collect
> so that period can be configured instead of hardcode.

hardcoded

> 
> Meanwhile, introduce migrate_dirtylimit function to help
> check if dirtylimit enabled during live migration, set
> it false by default.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---

Focusing just on UI...

> +++ b/qapi/migration.json
> @@ -760,6 +760,9 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
> +#                          Defaults to 500ms. (Since 7.0)

The next release is 7.1.  You'll need to fix this and all other references.

Do we want 'dirty-limit' instead of 'dirtylimit'?  There was a recent
thread on how to translate QAPI to other languages that are a bit more
insistent on MixedCase, where properly separating English words makes
it easier to translate to the expected case.

>  ##
>  # @migrate-set-parameters:
> @@ -1125,6 +1132,9 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
> +#                          Defaults to 500ms. (Since 7.0)
> +#
>  # Features:
>  # @unstable: Member @x-checkpoint-delay is experimental.

Is this feature ready for prime time, or do we want to initially name
it x-vcpu-dirty[-]limit-period to mark it experimental?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


