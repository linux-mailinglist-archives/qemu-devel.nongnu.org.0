Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB3B40680C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 09:56:09 +0200 (CEST)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mObOL-0002HT-0x
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 03:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mObMb-00015D-QJ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:54:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:54099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mObMY-0003zB-CW
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:54:21 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="201214534"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="201214534"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 00:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="480069272"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 10 Sep 2021 00:54:13 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 00:54:12 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 15:54:11 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.012;
 Fri, 10 Sep 2021 15:54:11 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 10/14] migration: add support to migrate shared regions
 list
Thread-Topic: [PATCH v4 10/14] migration: add support to migrate shared
 regions list
Thread-Index: AQHXiSixYzJlWQ0zGE+pIA+UAsFsgKt42gHA
Date: Fri, 10 Sep 2021 07:54:10 +0000
Message-ID: <6a48e7c8b6e14933aa0085d12e2c5ff7@intel.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <9236f522e48b67fe7136de7620276f7dc193be37.1628076205.git.ashish.kalra@amd.com>
In-Reply-To: <9236f522e48b67fe7136de7620276f7dc193be37.1628076205.git.ashish.kalra@amd.com>
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
Received-SPF: pass client-ip=192.55.52.151; envelope-from=wei.w.wang@intel.com;
 helo=mga17.intel.com
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
Cc: "Thomas.Lendacky@amd.com" <Thomas.Lendacky@amd.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "tobin@ibm.com" <tobin@ibm.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "dovmurik@linux.vnet.ibm.com" <dovmurik@linux.vnet.ibm.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Brijesh Singh <brijesh.singh@amd.com>
>=20
> When memory encryption is enabled, the hypervisor maintains a shared
> regions list which is referred by hypervisor during migration to check if=
 page is
> private or shared. This list is built during the VM bootup and must be mi=
grated
> to the target host so that hypervisor on target host can use it for futur=
e
> migration.
>=20
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  include/sysemu/sev.h |  2 ++
>  target/i386/sev.c    | 43
> +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>=20
> diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h index
> 3b913518c0..118ee66406 100644
> --- a/include/sysemu/sev.h
> +++ b/include/sysemu/sev.h
> @@ -32,5 +32,7 @@ void sev_es_set_reset_vector(CPUState *cpu);  int
> sev_remove_shared_regions_list(unsigned long gfn_start,
>                                     unsigned long gfn_end);  int
> sev_add_shared_regions_list(unsigned long gfn_start, unsigned long gfn_en=
d);
> +int sev_save_outgoing_shared_regions_list(QEMUFile *f); int
> +sev_load_incoming_shared_regions_list(QEMUFile *f);
>=20
>  #endif
> diff --git a/target/i386/sev.c b/target/i386/sev.c index
> 6d44b7ad21..789051f7b4 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -135,10 +135,15 @@ static const char *const sev_fw_errlist[] =3D {
>=20
>  #define SEV_FW_BLOB_MAX_SIZE            0x4000          /* 16KB
> */
>=20
> +#define SHARED_REGION_LIST_CONT     0x1
> +#define SHARED_REGION_LIST_END      0x2
> +
>  static struct ConfidentialGuestMemoryEncryptionOps
> sev_memory_encryption_ops =3D {
>      .save_setup =3D sev_save_setup,
>      .save_outgoing_page =3D sev_save_outgoing_page,
>      .load_incoming_page =3D sev_load_incoming_page,
> +    .save_outgoing_shared_regions_list =3D
> sev_save_outgoing_shared_regions_list,
> +    .load_incoming_shared_regions_list =3D
> + sev_load_incoming_shared_regions_list,

Hi Ashish,
I have some questions about the callbacks:

1) why using a list of shared regions, instead of bitmaps to record private=
/shared state?
I saw that the KVM side implementation used bitmaps in the first place and =
changed to
shared regions since v10, but don't find the reason.

2) why is the save/load of shared region list (or bitmap) made vendor speci=
fic?
I think it can be a common interface and data structure, e.g. KVM maintains=
 a per memory slot
bitmap to be obtained by QEMU.

Best,
Wei

