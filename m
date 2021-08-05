Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923963E1743
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:47:21 +0200 (CEST)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBeeW-0004eE-LC
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBecx-0003nl-HH
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:45:43 -0400
Received: from mail-dm6nam08on2084.outbound.protection.outlook.com
 ([40.107.102.84]:30689 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBecv-0000lG-Go
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:45:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qb5Bvg783a3AeWUv8ef46KFKLq3eW4qtB+Q9KXFLfXrFbdoeJGbdW3ZBz6FMGsgVsEPeMNB4OUOt518Qx+iVzVd7A3FIpbiaHWX0BY9oeEnM2VdBEogA7Gxgxz3BGYcdyDuzUocHf4WrOpOoRn6mugONRw5k0BofnvPSOrffdyQB6tjuXMPtZ4RQuAuBG9jI08Fs0WgAR7oHKcK8wAquQJeOwWToxBPldlo7z63xyyf+mTM5qa6hjKk+sPk3N5zTHmjC0cVW39vzia2Kc/4KiQoSyltr0YmAnaP91kpKPuO6/db4kVkvDa/rsZr/B4EnCgAldAMCC/uJviZqCSLR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LNtRP4myXfzctfSthQqhWmuodsTMqA3gBjVNNUzeGw=;
 b=jnsLwo4xnCvZOYyr7DmdV5vYLXzJ1qWb0Jt1Pnr1L6+VkOzKFCj7NFxK7ozW7U6SUmHdluzzt6Hec1Cu5xR4vv6AcuiOuoJOrcDe5WCTK1VCgQmi+r+okWgLTaKBNeZfh0V2JyoFy6ESkCiUMnwtxn3F0RiE1ME4iRpxfVNh4qbegWfkB9ljnCCaGqapFTtwaFuU4KbyKd/6vb8HQ0mPqQUPOowGNBm18sfvyF9XXvm8Zw15dk4MicqZ0b8pPy4ckZPSYVFfUQ0gnb4+HkZDEkD0ay1pXn8s7b2lUYwZV20urdQVwTm14qTjvLaEqSgKnoW1Tp0QhhUnLE+WoKJHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LNtRP4myXfzctfSthQqhWmuodsTMqA3gBjVNNUzeGw=;
 b=qPHRj0qrLVxEVXYadLJvwwNesT2pUs3fOWNZ1L28gvyFLRX17Nz4oPSi632cb32Ny58jGHRKX6wuGVvHgYsrjlsvuARvJwZ7XM2irwckQQwY4/M6/6w6pExvo2q3MKY4TsnBnNEQbYz4teH9BvsQYStc6ZGqhL++r3Hpv1yHABo=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Thu, 5 Aug
 2021 14:45:38 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 14:45:37 +0000
Date: Thu, 5 Aug 2021 14:45:35 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, Thomas.Lendacky@amd.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, ehabkost@redhat.com,
 dovmurik@linux.vnet.ibm.com, tobin@ibm.com, jejb@linux.ibm.com
Subject: Re: [PATCH v4 05/14] target/i386: sev: provide callback to setup
 outgoing context
Message-ID: <20210805144535.GE23670@ashkalra_ubuntu_server>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <7521883afc073960728f6f0837dac9be1641dcb6.1628076205.git.ashish.kalra@amd.com>
 <d0fd1154-669a-c5af-188e-9e7ba15b989e@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0fd1154-669a-c5af-188e-9e7ba15b989e@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SA0PR11CA0186.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::11) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 SA0PR11CA0186.namprd11.prod.outlook.com (2603:10b6:806:1bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Thu, 5 Aug 2021 14:45:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 631a05eb-4d1b-4aa0-aebe-08d9581fb06f
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB278218FCB14C7C96937F0E3F8EF29@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KKgZzbQSOWY1KBdLk/UJmi6LTjrXWDfs692cElXWLoEsrBeXkn8IQ1/lsuRWbMnn1jr/EG00/itprx8vKR3PgRw3hvSDnrgNEclc67sIxnzkLD9S1dW86AJgkQVUQ7YBPOW4VglMGWIMrDhYpwHavudqYAw1vMd91rjJ3Hon58m3mVM+wlWvtNZVp1QYsrxmvE5Mn8UzFWXTzTpjUtVY86EU7VDywzN40py7yiIHnRtdYgzr0F8iTmerMIZtJDTHgwPwFtKUbeuStBL6u9C87de/cXzNswHEqtf0AIkoZo/puvMSfzdRTTTcacLs/G/E0lSTwvmBCkGFoGvcm5DjH0ttCIwgihiUi6L2A9iVQp7nJDIVtDe0EegbvQH5rLNFtFVu4o4lmj2QFCbqNiBwj1sH+nsXAvm9Ww5BR+jvmkqqsD0wnah8hd/VaqHnAfUY3QhMHLLnnuaZPeAz+C6q77DW2cajNlknTfXyMPqs/3nV/T31AnjuX0staQ2aoi5gvPHMH7sLLvO+sKQ3bd8bEn1P7SCRg2pOssGk9GMozdtjqD6zqjfKRe82rm+ULLvxQYbkZrUsfftj7zJYi0m4AsqbJNspOdnZSq/D2GSRt6kCnOHf/PnAhaSwjVKSPb4tbc3M53hWejSjYFROjypBSU88KEVbueMz+akj8+bZxaa8QC9k+6lKbMLqRf2M5Sa896Nbs3LLp4F2dihvcBkp5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(6916009)(8936002)(316002)(26005)(4326008)(478600001)(83380400001)(66946007)(1076003)(66556008)(66476007)(186003)(53546011)(8676002)(86362001)(44832011)(52116002)(956004)(6496006)(5660300002)(38350700002)(38100700002)(9686003)(55016002)(2906002)(33656002)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Ad/DYLALOltAcTOXY0W26Fu5EOcf/Z+3EOEg4lQdliLV6kM1TKbKcRf9uDu?=
 =?us-ascii?Q?y906KdlzeoKAMuLZf808E8WF83OcYPVPCMHrqmjpnelcO9MvBLDO6a/bP26d?=
 =?us-ascii?Q?tYkDQE0DbIP/3hGIxEn0k14Xr25FkQZ760132PFYVQFXetYQlEkl4ZXl/zwY?=
 =?us-ascii?Q?2qmj/YUx3FG060jVY0wokcTHfYsXUCma5TcVq4bmQsdtWF1sl5Uf90DLNdbC?=
 =?us-ascii?Q?J6YlplH8O5DSlXaH6vCyXmEoVy1T63yFeXPZtyqPeJ9q0VishtH43XfUmw2d?=
 =?us-ascii?Q?UCJO9A1daQLgHy/mUxNDnGp0U7m2iytqBtwEufPVXw6wCPU+aLJ3dRDPIcPX?=
 =?us-ascii?Q?uCQ15TxfkJL78kG+gB/Y18wF6XUjidE7+IjzxBKQ2BybZTXOP0LdrZSgUqbZ?=
 =?us-ascii?Q?GQJ1qrzMll2TyPrKwNVqaMlppA7It379dT6FXBTD9h+pSt66oPwDgB4Sqt+i?=
 =?us-ascii?Q?pVAteTWpsGvSF8tcJxUGRh1rT24ukWzVjPEN2DInGDEcKwPF5N6ujr3WE2yD?=
 =?us-ascii?Q?yb12cNQryx32j9Du8W/JtWVFJihqjn+iL8ZKjTeSauaN/SqcJdZQMS32+BgJ?=
 =?us-ascii?Q?1lRWl6KxobfkPLP/hQYWPE39sVfxMAvhgTwz/7u114dRMcTb5ISlIzfcvwT0?=
 =?us-ascii?Q?d23fJkxvI8YbfVel8dQ6IR45CSu1jfqGBr5SMmFx0LlsWNaWg0U5yipkO16p?=
 =?us-ascii?Q?4Y6w3pmABI2oDf2tVugoaBtLhefj1+Pz+/iEgUQh/n++0SirG/unnR7c9Ado?=
 =?us-ascii?Q?0CLn1byl4RuhJKP1f93enFUG1S/IyJfyIQ40CsbSmiSzA1WkvY3FSeJ7Df81?=
 =?us-ascii?Q?Ew+C3oZvGK0GxS5GBpI9w54ncPuN8CuWeHiX2uUBW+iznvp78aJBoT3GWN43?=
 =?us-ascii?Q?w6RFrXYosoJp3zwIZVr5DPGWmf2L1RyKTUsNV2JoS6134boLRBQjHWmuvMrf?=
 =?us-ascii?Q?8LPA+ON/WRnt+JQZGl5FBeTPk67vm9f/sUf//xU4WRqKhqufzUKGyy3Aywny?=
 =?us-ascii?Q?tvRtz2cYJS5oHX9jvrEtUitOzWSuz3VVLAhNSyxoBQ7/6iB58fu77TZ/8MoC?=
 =?us-ascii?Q?RTBtdlOn5IuuA789xjRZ4AazUmdiR+53vNs7+wudmf8wtv1kwX3V06n6Q8Mq?=
 =?us-ascii?Q?2mpAsHpKtKDTvnsuhj6G1g6w2z3O8akwv/YoCDUqVy7ZhwR83bLmOvZwaT4q?=
 =?us-ascii?Q?efXchKKNw0FED9Lxm+aazHRIPhUwW5vH0BuXSD+mrugzVOtBr2ckaB/GD6gS?=
 =?us-ascii?Q?g0sQbFwI0oZjKBI8+MAhsgpw1o2mQbHyaspeM4CLm1RNTl4NARfKoAnzeKrr?=
 =?us-ascii?Q?Z749OFh7ksE/Ys/TEIQkAqPl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 631a05eb-4d1b-4aa0-aebe-08d9581fb06f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 14:45:37.8124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc0BvhBDLc4hJLCEK0Tj7+CsRkz2dejcMGVqH/v/yxUhEdWIgyRv/u7hp9BhRt1jukQLUq8gcfvgVDHP5ZZqPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
Received-SPF: softfail client-ip=40.107.102.84;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 04:06:27PM +0300, Dov Murik wrote:
> 
> 
> On 04/08/2021 14:56, Ashish Kalra wrote:
> > From: Brijesh Singh <brijesh.singh@amd.com>
> > 
> > The user provides the target machine's Platform Diffie-Hellman key (PDH)
> > and certificate chain before starting the SEV guest migration. Cache the
> > certificate chain as we need them while creating the outgoing context.
> > 
> > Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> > Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
> > Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> > ---
> >  include/sysemu/sev.h |  2 ++
> >  target/i386/sev.c    | 61 ++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 63 insertions(+)
> > 
> > diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
> > index 94d821d737..64fc88d3c5 100644
> > --- a/include/sysemu/sev.h
> > +++ b/include/sysemu/sev.h
> > @@ -14,11 +14,13 @@
> >  #ifndef QEMU_SEV_H
> >  #define QEMU_SEV_H
> > 
> > +#include <qapi/qapi-types-migration.h>
> >  #include "sysemu/kvm.h"
> > 
> >  bool sev_enabled(void);
> >  int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> >  int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
> > +int sev_save_setup(MigrationParameters *p);
> >  int sev_inject_launch_secret(const char *hdr, const char *secret,
> >                               uint64_t gpa, Error **errp);
> > 
> > diff --git a/target/i386/sev.c b/target/i386/sev.c
> > index 83df8c09f6..5e7c87764c 100644
> > --- a/target/i386/sev.c
> > +++ b/target/i386/sev.c
> > @@ -24,6 +24,7 @@
> >  #include "qemu/module.h"
> >  #include "qemu/uuid.h"
> >  #include "sysemu/kvm.h"
> > +#include "sysemu/sev.h"
> >  #include "sev_i386.h"
> >  #include "sysemu/sysemu.h"
> >  #include "sysemu/runstate.h"
> > @@ -68,6 +69,12 @@ struct SevGuestState {
> >      int sev_fd;
> >      SevState state;
> >      gchar *measurement;
> > +    guchar *remote_pdh;
> > +    size_t remote_pdh_len;
> > +    guchar *remote_plat_cert;
> > +    size_t remote_plat_cert_len;
> > +    guchar *amd_cert;
> > +    size_t amd_cert_len;
> > 
> >      uint32_t reset_cs;
> >      uint32_t reset_ip;
> > @@ -116,6 +123,12 @@ static const char *const sev_fw_errlist[] = {
> > 
> >  #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
> > 
> > +#define SEV_FW_BLOB_MAX_SIZE            0x4000          /* 16KB */
> > +
> > +static struct ConfidentialGuestMemoryEncryptionOps sev_memory_encryption_ops = {
> > +    .save_setup = sev_save_setup,
> > +};
> > +
> >  static int
> >  sev_ioctl(int fd, int cmd, void *data, int *error)
> >  {
> > @@ -772,6 +785,50 @@ sev_vm_state_change(void *opaque, bool running, RunState state)
> >      }
> >  }
> > 
> > +static inline bool check_blob_length(size_t value)
> > +{
> > +    if (value > SEV_FW_BLOB_MAX_SIZE) {
> > +        error_report("invalid length max=%d got=%ld",
> > +                     SEV_FW_BLOB_MAX_SIZE, value);
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +int sev_save_setup(MigrationParameters *p)
> > +{
> > +    SevGuestState *s = sev_guest;
> > +    const char *pdh = p->sev_pdh;
> > +    const char *plat_cert = p->sev_plat_cert;
> > +    const char *amd_cert = p->sev_amd_cert;
> > +
> > +    s->remote_pdh = g_base64_decode(pdh, &s->remote_pdh_len);
> 
> You should check    if (!s->remote_pdh)   to detect decoding failure
> (for all g_base64_decode calls here).
> 
Ok.

Thanks,
Ashish

> Though I must say, it would be better to check validity of the
> user-supplied base64 earlier (when migrate-set-parameters QMP call
> occurs), and not later when migration starts.
> 
> 
> > +    if (!check_blob_length(s->remote_pdh_len)) {
> > +        goto error;
> > +    }
> > +
> > +    s->remote_plat_cert = g_base64_decode(plat_cert,
> > +                                          &s->remote_plat_cert_len);
> > +    if (!check_blob_length(s->remote_plat_cert_len)) {
> > +        goto error;
> > +    }
> > +
> > +    s->amd_cert = g_base64_decode(amd_cert, &s->amd_cert_len);
> > +    if (!check_blob_length(s->amd_cert_len)) {
> > +        goto error;
> > +    }
> > +
> > +    return 0;
> > +
> > +error:
> > +    g_free(s->remote_pdh);
> > +    g_free(s->remote_plat_cert);
> > +    g_free(s->amd_cert);
> > +
> > +    return 1;
> > +}
> > +
> >  int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
> >  {
> >      SevGuestState *sev
> > @@ -781,6 +838,8 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
> >      uint32_t ebx;
> >      uint32_t host_cbitpos;
> >      struct sev_user_data_status status = {};
> > +    ConfidentialGuestSupportClass *cgs_class =
> > +        (ConfidentialGuestSupportClass *) object_get_class(OBJECT(cgs));
> > 
> >      if (!sev) {
> >          return 0;
> > @@ -870,6 +929,8 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
> >      qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
> >      qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
> > 
> > +    cgs_class->memory_encryption_ops = &sev_memory_encryption_ops;
> > +
> >      cgs->ready = true;
> > 
> >      return 0;
> > 

