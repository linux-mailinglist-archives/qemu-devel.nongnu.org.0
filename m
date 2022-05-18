Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B61752BDAC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:11:37 +0200 (CEST)
Received: from localhost ([::1]:45768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLKq-0002dF-DH
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrLG0-0005Fe-Bm
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrLFy-0001np-L0
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652886393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DpZ1RLBQl49h9LfonY7p4W3KvvDcYFRVa/ka/FR/14k=;
 b=I3vVATGvLXgARlTQKkLV0XavV6c18zTRkG6w7A9A5YN4MIXx/dYm5w7lhUCADDlrEKu/IC
 /ctGJEX757C9t/zNuKv7wL/F9eZjR2e+MF2Xz+tPAzptD/cTC6ahhP3uEpCWJZDEi3D4d1
 MqU46b3OpIAFekwFbeWDtdwZVATSNS4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-Xuhww-OxOc23k6xaichxpA-1; Wed, 18 May 2022 11:06:30 -0400
X-MC-Unique: Xuhww-OxOc23k6xaichxpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01A3C384F808;
 Wed, 18 May 2022 15:06:30 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 535DF40C1421;
 Wed, 18 May 2022 15:06:29 +0000 (UTC)
Date: Wed, 18 May 2022 10:06:27 -0500
From: Eric Blake <eblake@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC 2/6] qapi/migration: Introduce vcpu-dirtylimit parameters
Message-ID: <20220518150627.34i33rpzfqy6pvlz@redhat.com>
References: <cover.1652762652.git.huangy81@chinatelecom.cn>
 <2fbc49b77115b5f8fbebbee00476f6f34dad4770.1652762652.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fbc49b77115b5f8fbebbee00476f6f34dad4770.1652762652.git.huangy81@chinatelecom.cn>
User-Agent: NeoMutt/20220429-71-6f7d3e
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 17, 2022 at 02:35:02PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce "vcpu-dirtylimit" migration parameter used
> to limit dirty page rate during live migration.
> 
> "vcpu-dirtylimit" and "vcpu-dirtylimit-period" are
> two dirtylimit-related migration parameters, which can
> be set before and during live migration by qmp
> migrate-set-parameters.
> 
> This two parameters are used to help implement the dirty
> page rate limit algo of migration.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
> +++ b/qapi/migration.json
> @@ -763,6 +763,9 @@
>  # @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
>  #                          Defaults to 500ms. (Since 7.0)
>  #
> +# @vcpu-dirtylimit: Dirtyrate limit (MB/s) during live migration.
> +#                   Defaults to 1. (Since 7.0)
> +#

Same comments as in patch 1 (since 7.1, question on whether
dirty-limit makes more sense).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


