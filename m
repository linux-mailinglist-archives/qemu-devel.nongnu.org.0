Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BED302281
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 08:43:24 +0100 (CET)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3wWx-0003Bs-Bt
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 02:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l3wVz-0002mR-FR
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:42:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l3wVv-0005JY-Uc
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611560538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HrclD3SmGlikXePcacVp7dmI+sUw4AK+VyyyWPVIx/Q=;
 b=L/aXzCZ8pxfH/xXwOkMJT6R2ov3CEUVuH/GfnscKN0dBGDPydqdjDlJLlDzUtneDWaqSCW
 uJZc/GjUx8bdlu3gjM3wS2okr7LdaVkCvh+S3jaAx4LqHEVVIaRdg1gEfHO0UntXb8/DDl
 i+3UyWxFLPt0+U7RSQlwvkfyVuFzcsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-DLo2W7wqOLapHzpuVr_cMg-1; Mon, 25 Jan 2021 02:42:16 -0500
X-MC-Unique: DLo2W7wqOLapHzpuVr_cMg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96158107ACE3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:42:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65C4310013BD;
 Mon, 25 Jan 2021 07:42:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B7D60113865F; Mon, 25 Jan 2021 08:42:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 29/31] qemu-option: clean up id vs. list->merge_lists
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-30-pbonzini@redhat.com>
Date: Mon, 25 Jan 2021 08:42:13 +0100
In-Reply-To: <20210123143128.1167797-30-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Sat, 23 Jan 2021 09:31:26 -0500")
Message-ID: <878s8hqx7u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Looking at all merge-lists QemuOptsList, here is how they access their
> QemuOpts:
>
> reopen_opts in qemu-io-cmds.c ("qemu-img reopen -o")
> 	qemu_opts_find(&reopen_opts, NULL)
>
> empty_opts in qemu-io.c ("qemu-io open -o")
> 	qemu_opts_find(&empty_opts, NULL)
>
> qemu_rtc_opts ("-rtc")
> 	qemu_find_opts_singleton("rtc")
>
> qemu_machine_opts ("-M")
> 	qemu_find_opts_singleton("machine")
>
> qemu_action_opts ("-name")

Pasto: it's "-action".

> 	qemu_opts_foreach->process_runstate_actions
>
> qemu_boot_opts ("-boot")
> 	in hw/nvram/fw_cfg.c and hw/s390x/ipl.c:
> 	  QTAILQ_FIRST(&qemu_find_opts("bootopts")->head)
> 	in softmmu/vl.c:
> 	  qemu_opts_find(qemu_find_opts("boot-opts"), NULL)
>
> qemu_name_opts ("-name")
> 	qemu_opts_foreach->parse_name
> 	parse_name does not use id
>
> qemu_mem_opts ("-m")
> 	qemu_find_opts_singleton("memory")
>
> qemu_icount_opts ("-icount")
> 	qemu_opts_foreach->do_configure_icount
> 	do_configure_icount->icount_configure
> 	icount_configure does not use id
>
> qemu_smp_opts ("-smp")
> 	qemu_opts_find(qemu_find_opts("smp-opts"), NULL)
>
> qemu_spice_opts ("-spice")
> 	QTAILQ_FIRST(&qemu_spice_opts.head)
>
> i.e. they don't need an id.  Sometimes its presence is ignored
> (e.g. when using qemu_opts_foreach), sometimes all the options
> with the id are skipped, sometimes only the first option on the

Let's insert

    (when using qemu_find_opts_singleton() or qemu_opts_find(list, NULL))

right after skipped, and

> command line is considered.  -boot does two different things

    (when using QTAILQ_FIRST)

right after considered.

> depending on who's looking at the options.
>
> With this patch we just forbid id on merge-lists QemuOptsLists; if the
> command line still works, it has the same semantics as before.
>
> qemu_opts_create's fail_if_exists parameter is now unnecessary:
>
> - it is unused if id is NULL
>
> - opts_parse only passes false if reached from qemu_opts_set_defaults,
> in which case this patch enforces that id must be NULL
>
> - other callers that can pass a non-NULL id always set it to true
>
> Assert that it is true in the only case where "fail_if_exists" matters,
> i.e. "id && !lists->merge_lists".  This means that if an id is present,
> duplicates are always forbidden, which was already the status quo.
>
> Discounting the case that aborts as it's not user-controlled (it's
> "just" a matter of inspecting qemu_opts_create callers), the paths
> through qemu_opts_create can be summarized as:
>
> - merge_lists = true: singleton opts with NULL id; non-NULL id fails
>
> - merge_lists = false: always return new opts; non-NULL id fails if dup
>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


