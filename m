Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD66406811
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 09:58:03 +0200 (CEST)
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mObQA-00042F-AZ
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 03:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mObOw-0003Lf-9H
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:56:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:37358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mObOu-00062e-Ea
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:56:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="282038124"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="282038124"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 00:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="540336581"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Sep 2021 00:56:40 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 00:56:39 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 15:56:36 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.012;
 Fri, 10 Sep 2021 15:56:36 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 14/14] kvm: Add support for userspace MSR filtering and
 handling of MSR_KVM_MIGRATION_CONTROL.
Thread-Topic: [PATCH v4 14/14] kvm: Add support for userspace MSR filtering
 and handling of MSR_KVM_MIGRATION_CONTROL.
Thread-Index: AQHXiSjPALimUABevkmUGKAVuEWD1qudGp0Q
Date: Fri, 10 Sep 2021 07:56:36 +0000
Message-ID: <c09f985d7a0741a7ab278b2f4bd4c346@intel.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <67935c3fd5f29a2ba9d67a91255276d3b9ccc99b.1628076205.git.ashish.kalra@amd.com>
In-Reply-To: <67935c3fd5f29a2ba9d67a91255276d3b9ccc99b.1628076205.git.ashish.kalra@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.31; envelope-from=wei.w.wang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Thomas.Lendacky@amd.com" <Thomas.Lendacky@amd.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "tobin@ibm.com" <tobin@ibm.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "dovmurik@linux.vnet.ibm.com" <dovmurik@linux.vnet.ibm.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, August 4, 2021 8:00 PM, Ashish Kalra wrote:
> +/*
> + * Currently this exit is only used by SEV guests for
> + * MSR_KVM_MIGRATION_CONTROL to indicate if the guest
> + * is ready for migration.
> + */
> +static int kvm_handle_x86_msr(X86CPU *cpu, struct kvm_run *run) {
> +    static uint64_t msr_kvm_migration_control;
> +
> +    if (run->msr.index !=3D MSR_KVM_MIGRATION_CONTROL) {
> +        run->msr.error =3D -EINVAL;
> +        return -1;
> +    }
> +
> +    switch (run->exit_reason) {
> +    case KVM_EXIT_X86_RDMSR:
> +        run->msr.error =3D 0;
> +        run->msr.data =3D msr_kvm_migration_control;
> +        break;
> +    case KVM_EXIT_X86_WRMSR:
> +        msr_kvm_migration_control =3D run->msr.data;
> +        if (run->msr.data =3D=3D KVM_MIGRATION_READY) {
> +            sev_del_migrate_blocker();

It seems this is enabled/disabled by the guest, which means that the guest =
can always refuse to be migrated?

Best,
Wei

