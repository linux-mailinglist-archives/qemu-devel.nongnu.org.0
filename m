Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5326FF4A6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:39:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7RJ-00015E-D0; Thu, 11 May 2023 10:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1px7RH-00014l-36
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1px7RF-00026R-Gz
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683815917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ghv3nfw0LlPVP/hXtk3QNqkIRfzQt7x7Bu7/y1Fwx+4=;
 b=RBcApto4yy9PvEtvAjEF/MnzFuxghTRYI1EHSoSKUtW3P95zhryYKMSEMn3nmzgbsfkw0I
 TY41ZzcIOpMYRUyLPkLTsPozPq4yPr5Z3dKRW2Uek9sVo54FJpU7R/FLUAWyx6fFqW/tGa
 kircYMDC7tHIIhBerWiL6zWhp4yL6aA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-nafQvSI4MJqXSZv3rnDH-Q-1; Thu, 11 May 2023 10:38:33 -0400
X-MC-Unique: nafQvSI4MJqXSZv3rnDH-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41E2B38294A3;
 Thu, 11 May 2023 14:38:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18625C15BA0;
 Thu, 11 May 2023 14:38:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D65CE21E6806; Thu, 11 May 2023 16:38:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dinah Baum <dinahbaum123@gmail.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Yanan Wang
 <wangyanan55@huawei.com>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2 1/3] qapi/machine-target: refactor machine-target
References: <20230404011956.90375-1-dinahbaum123@gmail.com>
 <20230404011956.90375-2-dinahbaum123@gmail.com>
Date: Thu, 11 May 2023 16:38:28 +0200
In-Reply-To: <20230404011956.90375-2-dinahbaum123@gmail.com> (Dinah Baum's
 message of "Mon, 3 Apr 2023 21:19:54 -0400")
Message-ID: <87fs83hr17.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

First of all, my sincere apologies for the delayed review.

The patch series needs a rebase.  But let me review it first.

Dinah Baum <dinahbaum123@gmail.com> writes:

> Moved architecture agnostic data types to their own
> file to avoid "attempt to use poisoned TARGET_*"
> error that results when including qapi header
> with commands that aren't defined for all architectures.
> Required to implement enabling `query-cpu-model-expansion`
> on all architectures
>
> Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  MAINTAINERS                     |  1 +
>  qapi/machine-target-common.json | 79 +++++++++++++++++++++++++++++++++
>  qapi/machine-target.json        | 73 +-----------------------------
>  qapi/meson.build                |  1 +
>  4 files changed, 82 insertions(+), 72 deletions(-)
>  create mode 100644 qapi/machine-target-common.json

Do we really want to create qapi/machine-target-common.json?  Before we
can answer this, I think I should explain how we use QAPI modules so
far.

You already know about target-independent vs. target-dependent code.

In target-dependent code, a multitude of additional macros are
available, such as TARGET_S390X, TARGET_I386, TARGET_ARM, ...  We poison
them to prevent accidental use in target-independent code.

Since target-dependent code needs to be compiled per target, we try to
keep as much code as we can target-independent.

QAPI-generated code is target-independent except for code generated for
QAPI modules whose name ends with "-target".  Yes, that's a bit of a
hack.  See qapi/meson.build.

When a subsystem needs QAPI schema stuff, we generally put it into its
own module.  For instance, the PCI subsystem's QAPI schema is in the pci
module (qapi/pci.json).  See MAINTAINERS for more.

Most subsystems' QAPI schema is entirely target-independent.  If a
subsystem needs some target-dependence in its schema, we split the QAPI
module into a target-dependent and a target-independent part.  We have
two such pairs: misc and misc-target, machine and machine-target.

Can we stick to this convention?  I.e. move to existing machine.json
instead to new machine-target-common.json.  Let's have a closer look.

This patch moves a few types from (machine-dependent)
machine-target.json to new (and machine-independent)
machine-target-common.json.

The next patch moves another type and a command after removing their
machine-dependence.

After both moves, machine-target.json needs to include
machine-target-common.json for CpuModelInfo and CpuModelCompareResult.

Aside: the latter is only ever used in machine-target.json.  We could
keep it there.

If we move to machine.json instead, then machine-target.json needs to
include that.

Would that work?

If not: I think the name machine-target-common.json is unfortunate,
because it kind of suggests machine-dependence.

[...]


