Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44656CA506
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:59:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmRb-00009u-7Q; Mon, 27 Mar 2023 08:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pgmRY-00009W-HF
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pgmRW-0001yr-JO
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679921961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DDJpn7JJoLNsE5WdCr0CVPqS+pVyowITq8miTFjoPNs=;
 b=Vt1+S1Eada23aQBsm/h+jMat0uNHHaHDprD6raAXP8ADyIkHTNSJLs+b7Pn3mDGDaoVeUY
 gHoHF6wfzhrsGXBx6SYR2+SdD+eGngrn1Oe7YU/EDgFkFGZnvmGOJrwQSCV8kteP1Ie2ij
 eKaiJEz+ETfVG62p1+xqtb7qZdN0vhc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-2ueZ_WAEOH-TrnfaHI2qCw-1; Mon, 27 Mar 2023 08:59:16 -0400
X-MC-Unique: 2ueZ_WAEOH-TrnfaHI2qCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 900298533E3;
 Mon, 27 Mar 2023 12:59:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CA7E202701E;
 Mon, 27 Mar 2023 12:59:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33D0D21E6926; Mon, 27 Mar 2023 14:59:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: pbonzini@redhat.com,  qemu-devel@nongnu.org,  david@redhat.com,
 thuth@redhat.com,  borntraeger@de.ibm.com,  frankja@linux.ibm.com,
 fiuczy@linux.ibm.com,  pasic@linux.ibm.com,  nsg@linux.ibm.com,
 berrange@redhat.com,  alex.bennee@linaro.org
Subject: Re: [PATCH v4 1/1] util/async-teardown: wire up
 query-command-line-options
References: <20230327120357.34743-1-imbrenda@linux.ibm.com>
 <20230327120357.34743-2-imbrenda@linux.ibm.com>
Date: Mon, 27 Mar 2023 14:59:14 +0200
In-Reply-To: <20230327120357.34743-2-imbrenda@linux.ibm.com> (Claudio
 Imbrenda's message of "Mon, 27 Mar 2023 14:03:57 +0200")
Message-ID: <874jq6bba5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Claudio Imbrenda <imbrenda@linux.ibm.com> writes:

> The recently introduced -async-teardown commandline option was not
> wired up properly and did not show up in the output of the QMP command
> query-command-line-options. This means that libvirt had no way to
> discover whether the feature was supported.

Excuse the pedantry...  The option *was* wired up correctly, just in a
way that isn't visible in query-command-line-options.  Suggest "The
recently introduced -async-teardown command line option -async-teardown
is not visible in query-command-line-options."

> This patch fixes the issue by replacing the -async-teardown option with
> a new -teardown option with a new async=on|off parameter.

Why we can drop -async-teardown right away, without a deprecating it
first?  The commit message needs to make the argument.

If we can drop it right away, you need to update
about/removed-features.rst.

Else, you need to update docs/about/deprecated.rst, and emit a warning
when the option is used.  Something like

    warn_reportf("-async-teardown is deprecated, use -teardown async=on instead");

> The new option is correctly wired up so that it appears in the output
> of query-command-line-options.

Suggest

  Add new -teardown option with an async=on|off parameter.  It is
  visible in query-command-line-options.

Then either

  Option -async-teardown is now redundant.  We'd normally deprecate it
  and remove it after a grace period, but <argument goes here...>
  Drop it.

or

  Option -async-teardown is now redundant.  Deprecate it.

> Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>


