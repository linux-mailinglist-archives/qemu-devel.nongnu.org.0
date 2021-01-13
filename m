Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B356B2F4A37
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 12:33:37 +0100 (CET)
Received: from localhost ([::1]:49000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzePA-0000i1-F0
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 06:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kzeNK-0008OK-Qi
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 06:31:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kzeNH-0001fJ-Rd
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 06:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610537498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G4OmLdbHFivFZopS8Q5t3yEN8bD0oEB2D3gsDuMkMDA=;
 b=ECrRFAF1Rd63OlRQuo5Ek8rGH+/wGx+bbO/k5OV+nXKlmP8wKDhRyz3z9pGu88ZlkWMkWE
 gyZehkDYMvfwwLb9/XX6oCaahV5tF4HsBzRj8EtVW1UnSdM7DoqQZ9V5T+Vlmtfk1BI1to
 Z5GQ88K+wJ7SxAOPLsyP1/H0T2qc3xE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-rs1AGfFjNb--rn1-Iy4ODw-1; Wed, 13 Jan 2021 06:31:36 -0500
X-MC-Unique: rs1AGfFjNb--rn1-Iy4ODw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32C17AFA85;
 Wed, 13 Jan 2021 11:31:35 +0000 (UTC)
Received: from work-vm (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6B8610016FE;
 Wed, 13 Jan 2021 11:31:33 +0000 (UTC)
Date: Wed, 13 Jan 2021 11:31:31 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH 07/10] Disable auto-coverge before entering COLO mode.
Message-ID: <20210113113131.GF2938@work-vm>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-8-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
In-Reply-To: <1610505995-144129-8-git-send-email-lei.rao@intel.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, lizhijian@cn.fujitsu.com,
 quintela@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* leirao (lei.rao@intel.com) wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
> 
> If we don't disable the feature of auto-converge for live migration
> before entering COLO mode, it will continue to run with COLO running,
> and eventually the system will hang due to the CPU throttle reaching
> DEFAULT_MIGRATE_MAX_CPU_THROTTLE.
> 
> Signed-off-by: Lei Rao <lei.rao@intel.com>

I don't think that's the right answer, because it would seem reasonable
to use auto-converge to ensure that a COLO snapshot succeeded by
limiting guest CPU time.  Is the right fix here to reset the state of
the auto-converge counters at the start of each colo snapshot?

Dave

> ---
>  migration/migration.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 31417ce..6ab37e5 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1673,6 +1673,20 @@ void migrate_set_block_enabled(bool value, Error **errp)
>      qapi_free_MigrationCapabilityStatusList(cap);
>  }
>  
> +static void colo_auto_converge_enabled(bool value, Error **errp)
> +{
> +    MigrationCapabilityStatusList *cap = NULL;
> +
> +    if (migrate_colo_enabled() && migrate_auto_converge()) {
> +        QAPI_LIST_PREPEND(cap,
> +                          migrate_cap_add(MIGRATION_CAPABILITY_AUTO_CONVERGE,
> +                                          value));
> +        qmp_migrate_set_capabilities(cap, errp);
> +        qapi_free_MigrationCapabilityStatusList(cap);
> +    }
> +    cpu_throttle_stop();
> +}
> +
>  static void migrate_set_block_incremental(MigrationState *s, bool value)
>  {
>      s->parameters.block_incremental = value;
> @@ -3401,7 +3415,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>  static void migration_iteration_finish(MigrationState *s)
>  {
>      /* If we enabled cpu throttling for auto-converge, turn it off. */
> -    cpu_throttle_stop();
> +    colo_auto_converge_enabled(false, &error_abort);
>  
>      qemu_mutex_lock_iothread();
>      switch (s->state) {
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


