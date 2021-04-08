Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24075357BCE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 07:24:11 +0200 (CEST)
Received: from localhost ([::1]:45622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUN9G-0007YA-6Y
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 01:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUN7I-0006U7-C9
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 01:22:08 -0400
Received: from mga18.intel.com ([134.134.136.126]:62951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUN7F-0002t7-09
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 01:22:08 -0400
IronPort-SDR: p6ASHCAoozy5TbvyujJ62GahDtCexZj9IncGwYaydhhYBf2gqlJBR9rAAlLvmam19AF0Aqapf8
 yNI0BpqB1dvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="181003547"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="181003547"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 22:22:02 -0700
IronPort-SDR: nCDfSGQPX29uu4ImhyoYt8oSBvbFfFfpP5muPDqq/37MEs6PC0zpAfo/lHwWKtMkKY2cac7sZH
 H6xCnxoTbagA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="448520075"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2021 22:22:02 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 22:22:01 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 13:21:59 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 8 Apr 2021 13:21:59 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "lizhijian@cn.fujitsu.com"
 <lizhijian@cn.fujitsu.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH v5 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Thread-Topic: [PATCH v5 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Thread-Index: AQHXJs6Cf6eNzlI8pUque5+NNl3DY6qqIIbw
Date: Thu, 8 Apr 2021 05:21:59 +0000
Message-ID: <90e9f537e1ad40c28afcabfe832bc2fd@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
 <1617263249-54501-3-git-send-email-lei.rao@intel.com>
In-Reply-To: <1617263249-54501-3-git-send-email-lei.rao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Rao, Lei <lei.rao@intel.com>
> Sent: Thursday, April 1, 2021 3:47 PM
> To: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com; quintela@redhat.com; dgilbert@redhat.com;
> pbonzini@redhat.com; lukasstraub2@web.de
> Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>
> Subject: [PATCH v5 02/10] Fix the qemu crash when guest shutdown during
> checkpoint
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> This patch fixes the following:
>     qemu-system-x86_64: invalid runstate transition: 'colo' ->'shutdown'
>     Aborted (core dumped)
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

> ---
>  softmmu/runstate.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c index
> ce8977c..1564057 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -126,6 +126,7 @@ static const RunStateTransition
> runstate_transitions_def[] =3D {
>      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
>=20
>      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> +    { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
>=20
>      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
>      { RUN_STATE_RUNNING, RUN_STATE_INTERNAL_ERROR },
> --
> 1.8.3.1


