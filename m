Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E0639BC16
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:38:27 +0200 (CEST)
Received: from localhost ([::1]:33092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBty-0002NM-Ew
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpBt3-00012Q-Jf
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpBsy-0005Ah-VI
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622821043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MSm+fmRnDd5dwMoZ0v368kBHeXfAm7WWS4fSrO5fzD0=;
 b=dnWMAdsZMqt4I/9nI2x1fIebSvjP1mIOqRdik/NPAGRCmCMgjENl4zgZRpYLWXwe4Uyfo6
 0tISiJ2c9R7T/66Hzcy4ECjaC3NxCvCtZxYz5h5wjsK3mo5a2gA/MWtq+nyVXKuDharg5+
 BsUxM/N+GDb6t83Jrn6SjngmfPPh8mA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-8KGAaDoHOViKiy9qVQpv2w-1; Fri, 04 Jun 2021 11:37:19 -0400
X-MC-Unique: 8KGAaDoHOViKiy9qVQpv2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A066E8015F8
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 15:37:18 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61679687CE;
 Fri,  4 Jun 2021 15:37:18 +0000 (UTC)
Date: Fri, 4 Jun 2021 10:37:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 07/28] qtest: add a QOM object for qtest
Message-ID: <20210604153716.5doeeoiaxgh6ots7@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
 <20210524164131.383778-8-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210524164131.383778-8-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24, 2021 at 06:41:10PM +0200, Paolo Bonzini wrote:
> The qtest server right now can only be created using the -qtest
> and -qtest-log options.  Allow an alternative way to create it
> using "-object qtest,chardev=...,log=...".
> 
> This is part of the long term plan to make more (or all) of
> QEMU configurable through QMP and preconfig mode.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qapi/qom.json   |  17 +++++
>  softmmu/qtest.c | 185 +++++++++++++++++++++++++++++++++++++++++++++---
>  softmmu/vl.c    |   5 +-
>  3 files changed, 196 insertions(+), 11 deletions(-)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 4f48035831..f7ef30f940 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -644,6 +644,21 @@
>  { 'struct': 'PrManagerHelperProperties',
>    'data': { 'path': 'str' } }
>  
> +##
> +# @QtestProperties:
> +#
> +# Properties for qtest objects.
> +#
> +# @chardev: the chardev to be used to receive qtest commands on.
> +#
> +# @log: the path to a log file
> +#
> +# Since: 6.0

Do we need a followup patch to correct this to 6.1?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


