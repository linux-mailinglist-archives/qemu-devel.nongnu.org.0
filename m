Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B363E1754
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:51:37 +0200 (CEST)
Received: from localhost ([::1]:45494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBeie-0000iJ-Ji
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBedx-0004cn-6K
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:46:45 -0400
Received: from mail-co1nam11on20613.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::613]:61312
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBedu-0001Ru-TL
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:46:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keXdXavHUnl4PXpD/QWVv9VP9CbXZlKqSFSSNB6Usi9WGQMogHJZUUu0D45GP+IMtOsKNtAE/JxTI9gKN6J6QWYdf5hNz9ZFh+GYaRA0D+lDDci4Fq8FIHQMMoKmB6cMNfj5bMm7sqV9NwGjOmA+d7AgyVZxUYjc5FCmHEUah5PYxtFOTdlHgqUf9jj9UBN+KFVpPXS5jxQQWvPPBLfie/2Ofy80k2/XBvmzhfJlowXEMUOvjokKHTYZhJFX3F66Ju1D/LM2G6nzusBl9RN0W5jqQ2XAYJ3bCXQz9IZArnwC+bZwj0fe+xYa8AROraus/ByXTR7Ol0XfqyCFzpEDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pB7QRF9LvJkj7tYtqJ+7Sbt/bB1pN7CysEg+YToDXU=;
 b=NOYOi3qlnf2evs8Kz/uA59DzKI+1YKSeeD01GNOoDNV3Tp9lZIbGJFZYshVFHBlqoduxZy2M20b0pD4tBZAl3dtr9IFHa4gbfkfv6bvHRRJpGJBJaSdJ8ozloBfWj5HnrUhOoUk2f5g1SW+xQShcTNDJsjkM7N5LVYLovRdxGlp9ytU/gmytyIF7gyYRGjidm6eJDzleenpCb/3XxfP8aQdRGYvL50bSWWgawKEBqLzHHZnl+OeF0WEuvB+44k6z1u+sSNn2vgZR6oS2n/QCOqRT5nTV52XKFVWM4tTxqLScsE0Aj3S3Zjtm66VsLdFEzD3hb631PyhGRMNoI1V+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pB7QRF9LvJkj7tYtqJ+7Sbt/bB1pN7CysEg+YToDXU=;
 b=1UfCRfYdJkaWluFUAzaOXHW3c18JeyWdZmfmUuTdZmj0V6UQiKmnqd4lPU/jSxhIdHEixLBTeNNOb32YKDLc81yFVaptUwZtRgWu2ItlSvdqc6NvcSHHSrTW0QYbFLJ4y6jeFY7coiuAq0FA/XK/asmBfkEwFcnqYgshq2THYbo=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN6PR12MB2783.namprd12.prod.outlook.com (2603:10b6:805:78::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Thu, 5 Aug
 2021 14:41:37 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 14:41:37 +0000
Date: Thu, 5 Aug 2021 14:41:35 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, Thomas.Lendacky@amd.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, ehabkost@redhat.com,
 dovmurik@linux.vnet.ibm.com, tobin@ibm.com, jejb@linux.ibm.com
Subject: Re: [PATCH v4 03/14] migration.json: add AMD SEV specific migration
 parameters
Message-ID: <20210805144135.GC23670@ashkalra_ubuntu_server>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <d6a23bde6b6e10162282e6ea3b4f94ed331f4b3f.1628076205.git.ashish.kalra@amd.com>
 <6ff4ec2b-6441-9f9f-a652-7b7e87bbb45a@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ff4ec2b-6441-9f9f-a652-7b7e87bbb45a@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SN4PR0501CA0022.namprd05.prod.outlook.com
 (2603:10b6:803:40::35) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 SN4PR0501CA0022.namprd05.prod.outlook.com (2603:10b6:803:40::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend
 Transport; Thu, 5 Aug 2021 14:41:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24c7b029-4270-47a5-da3b-08d9581f2141
X-MS-TrafficTypeDiagnostic: SN6PR12MB2783:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2783FFD081E201F32A3639F08EF29@SN6PR12MB2783.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+QGIkkW0kxr8KUFYiYR8lJQ6ujFX83QkuYqj1fSGlCnsseE7gn/JLyleih/Pp1t4FNCSJhvdMb3QTJJDDZSMcisIAuxnoERZr7DLmqfpsYKYfGC53/0nbezlHtTmnKPaUYTQ7phKWgkzz6b84pMzqqwEXPZgoAMfvTradDDcUhye7EdCIOKb1U9xFoEEQpcS9d+OVpyhr0jLujRnp7AEQs3JWG/Wf3/Lxe5R95DJqA+mOvjaaJ3v+cxkNfsFD99Myfl9DB75O8TGWNf5mGBr4/u1G0r5ik9h3/rOAbR8ctr/cKzzs+/dK2DkrYO5qYCAPnQQF5NXImPwtamJjUWZ+fBDgMwhqpsl6RAAbVxtwBfNjSj4ZGl1d2e40tp2nZBO4HirgD+pA0sSwH2vgQzj27vRX6Jveu+DAN1ln8mPh8OGV4oJTURttDL2EEaU4jT2rkdliwrFxj+M01XSQ87NO1NFm527pyIejFEruP+qo7Qg3Mmv2Cl9fMwtYwBac0Z7F8cdciJfAu6JPijc59RT+VF4FwxD/mezZu/HaRYqAYQh2ZrsmjC7Mrrb3GNvmBEw4kfe9kCZBu0D0JRs0lrRl/sM+vFEnwX7U7Xeb3jP36NqewQLPz/ZRdfml6VwTD0XqAjqHQhP4cwGPuL0+6bigZMpTcsn6inxpNVwALsYJ9D7m32M7MJJy4EQvR7+ydSJ0Ski3iAlZ3rP8xrMt21cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(6916009)(38100700002)(1076003)(52116002)(66946007)(5660300002)(6496006)(66476007)(55016002)(86362001)(2906002)(53546011)(66556008)(9686003)(83380400001)(478600001)(38350700002)(33656002)(186003)(33716001)(8936002)(8676002)(4326008)(316002)(44832011)(30864003)(956004)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T8ZeB7Do4vwvm7JtFh8daCTwG8hVhqG6ltawtwcDBq4aht3+Vn6kGxzz4vFQ?=
 =?us-ascii?Q?/4yTFM2VEGCWKjYS9jfLBGd5lyUz6IxAVXVrpfJfeEPiK6ug7y/JqB1HqThq?=
 =?us-ascii?Q?ZzhlUC2dgPttNsmmVRXdplSDUxaYcCYKZuq3QODOnJ3L271uCWrJQ82gOxAT?=
 =?us-ascii?Q?5DIqHO/lGwPk/Fuy5qEx+t/eZCwBf6Yg0asiL65oqYh03rev7Os91uFMU5Vd?=
 =?us-ascii?Q?DBdovemdDbTy/4L2hNhjDM4dR/OkkPZg2XwHvJWx33qk36HbM2CTBKnEgYD3?=
 =?us-ascii?Q?N4adSt9h2PToVG4BFrv+Q7b2EoS6lKo/OK58LUcnEg6i5L+GD5K42OQkKtdI?=
 =?us-ascii?Q?AkGhPaAWSwivVRiBcyP9wBaUqFyN7Kig6LMDNNO9p26f6KZdVD2Rv/kYsrtq?=
 =?us-ascii?Q?UsEMlaCW+unOG6lyGfI8vkZFT9Ji93Sfkfw0sN/t53w1MhM64aKtMHobrMCl?=
 =?us-ascii?Q?oEWCCF12vQiIeTCP3kDHQew29xaXN6XdUr3lhoTAGr/UUB8s/3O+rFZ+zbZC?=
 =?us-ascii?Q?Ratk/IBsvzwWgH/HmyxrrBCTTvZ2HW7Qc8RO3ASraNTiVr+Q72q2LV2KfL+6?=
 =?us-ascii?Q?9y1zyz8K+1T4g+pyZpszH83sA4kPf0fPWxmCiRkdBx4LFxCDMdiGhJHrCN/S?=
 =?us-ascii?Q?5x8NTfmZQO/bDGw59sZLFulsjXDSxXJpLl1aK8dN87zvMMKKvb6pzxp2RcQM?=
 =?us-ascii?Q?k6j8+Ye5hfEJNe9czPH4W4oIRnO8CSzIiF6PJHX3qZCfqUPLl7E+O3UnhcZS?=
 =?us-ascii?Q?ugJ6eJcKRkGx303z1GBlGZfh6H9PCPThgpd6qIuyHao5FV+RG54IlF8DI0Bp?=
 =?us-ascii?Q?fIYNUR7+EnZnlkQ/GBCVMeFveURuJCjKXgE85MO/9KdeD2JXj7qI6/TMnbVG?=
 =?us-ascii?Q?2Z4xi4/wAfTkpuB3K+AMrYugLkoEAysEX8xZeGdM1FAa7drghfgsMvxGql72?=
 =?us-ascii?Q?hwqnF8m8v3dTk/XcJkc7+z34nDNV8n6WnNT+vOoXPydXhgr5qiLPXaFg0CX2?=
 =?us-ascii?Q?O/+4xUOt9xQSuhC4R4IJ+YMEA/FCovAe+UkYb/Lf4xxmIC6TgrKIpo92hiGf?=
 =?us-ascii?Q?+zzyszePjdLg9aDBvG29CrLF3iopiddab1VcRqVtVV2iJYoy55+fPLg9yIbJ?=
 =?us-ascii?Q?od8GwvKDM6iga7XyNASFrztcWrUCfgkNH087Fl9BB7QhWOsDP4eJcKBTClfv?=
 =?us-ascii?Q?rBFMnNwVfqh8RAIMJg8mlpRuyW2h5SobXN5WmLWMERvsZ9dMbXwFnDtOCB4o?=
 =?us-ascii?Q?gvPjSFvn8eeLmM+OTM37iIQW7p5A7gbx3sQK+16o/N/YraFUL7mh92SVvkIK?=
 =?us-ascii?Q?UTKOfRvnqL5nrf7SF2DwOWFT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c7b029-4270-47a5-da3b-08d9581f2141
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 14:41:37.6589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9JVUWxY9Ao+LECPIF+JzT8aLf8S53TQ6E5YNOk91mkabIlECMw2OEm1HRvXMQHiPEIe+QI4TTjd1CzWzAexOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2783
Received-SPF: softfail client-ip=2a01:111:f400:7eab::613;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Hello Dov,

On Thu, Aug 05, 2021 at 12:42:50PM +0300, Dov Murik wrote:
> 
> 
> On 04/08/2021 14:54, Ashish Kalra wrote:
> > From: Brijesh Singh <brijesh.singh@amd.com>
> > 
> > AMD SEV migration flow requires that target machine's public Diffie-Hellman
> > key (PDH) and certificate chain must be passed before initiating the guest
> > migration. User can use QMP 'migrate-set-parameters' to pass the certificate
> > chain. The certificate chain will be used while creating the outgoing
> > encryption context.
> 
> Just making sure: The source QEMU must *not* accept the sev_amd_cert
> from the target, because that will allow a malicious target to give its
> own root cert instead of the official AMD one.  Instead it should use
> its own trusted AMD root certificate.
> 

Actually, it is the responsibility of the VMM management stack to manage
all the certificates, before starting migration the VMM management stack
will retrieve the certs, from either the target or other ways.

KVM/qemu are just facilitating in providing these certs to the PSP via
the SEND_START command, it is the responsibility of the PSP to
validate/authenticate these certs and establish an encryption context
with the target.

Thanks,
Ashish

> 
> > 
> > Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> > Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> > ---
> >  migration/migration.c | 61 +++++++++++++++++++++++++++++++++++++++++++
> >  monitor/hmp-cmds.c    | 18 +++++++++++++
> >  qapi/migration.json   | 40 +++++++++++++++++++++++++---
> >  3 files changed, 116 insertions(+), 3 deletions(-)
> > 
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 041b8451a6..daea3ecd04 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -907,6 +907,12 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
> >      params->announce_rounds = s->parameters.announce_rounds;
> >      params->has_announce_step = true;
> >      params->announce_step = s->parameters.announce_step;
> > +    params->has_sev_pdh = true;
> > +    params->sev_pdh = g_strdup(s->parameters.sev_pdh);
> > +    params->has_sev_plat_cert = true;
> > +    params->sev_plat_cert = g_strdup(s->parameters.sev_plat_cert);
> > +    params->has_sev_amd_cert = true;
> > +    params->sev_amd_cert = g_strdup(s->parameters.sev_amd_cert);
> > 
> >      if (s->parameters.has_block_bitmap_mapping) {
> >          params->has_block_bitmap_mapping = true;
> > @@ -1563,6 +1569,18 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
> >          dest->has_block_bitmap_mapping = true;
> >          dest->block_bitmap_mapping = params->block_bitmap_mapping;
> >      }
> > +    if (params->has_sev_pdh) {
> > +        assert(params->sev_pdh->type == QTYPE_QSTRING);
> > +        dest->sev_pdh = g_strdup(params->sev_pdh->u.s);
> > +    }
> > +    if (params->has_sev_plat_cert) {
> > +        assert(params->sev_plat_cert->type == QTYPE_QSTRING);
> > +        dest->sev_plat_cert = g_strdup(params->sev_plat_cert->u.s);
> > +    }
> > +    if (params->has_sev_amd_cert) {
> > +        assert(params->sev_amd_cert->type == QTYPE_QSTRING);
> > +        dest->sev_amd_cert = g_strdup(params->sev_amd_cert->u.s);
> > +    }
> >  }
> > 
> >  static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
> > @@ -1685,6 +1703,21 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
> >              QAPI_CLONE(BitmapMigrationNodeAliasList,
> >                         params->block_bitmap_mapping);
> >      }
> > +    if (params->has_sev_pdh) {
> > +        g_free(s->parameters.sev_pdh);
> > +        assert(params->sev_pdh->type == QTYPE_QSTRING);
> > +        s->parameters.sev_pdh = g_strdup(params->sev_pdh->u.s);
> > +    }
> > +    if (params->has_sev_plat_cert) {
> > +        g_free(s->parameters.sev_plat_cert);
> > +        assert(params->sev_plat_cert->type == QTYPE_QSTRING);
> > +        s->parameters.sev_plat_cert = g_strdup(params->sev_plat_cert->u.s);
> > +    }
> > +    if (params->has_sev_amd_cert) {
> > +        g_free(s->parameters.sev_amd_cert);
> > +        assert(params->sev_amd_cert->type == QTYPE_QSTRING);
> > +        s->parameters.sev_amd_cert = g_strdup(params->sev_amd_cert->u.s);
> > +    }
> >  }
> > 
> >  void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
> > @@ -1705,6 +1738,27 @@ void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
> >          params->tls_hostname->type = QTYPE_QSTRING;
> >          params->tls_hostname->u.s = strdup("");
> >      }
> > +    /* TODO Rewrite "" to null instead */
> > +    if (params->has_sev_pdh
> > +        && params->sev_pdh->type == QTYPE_QNULL) {
> > +        qobject_unref(params->sev_pdh->u.n);
> > +        params->sev_pdh->type = QTYPE_QSTRING;
> > +        params->sev_pdh->u.s = strdup("");
> > +    }
> > +    /* TODO Rewrite "" to null instead */
> > +    if (params->has_sev_plat_cert
> > +        && params->sev_plat_cert->type == QTYPE_QNULL) {
> > +        qobject_unref(params->sev_plat_cert->u.n);
> > +        params->sev_plat_cert->type = QTYPE_QSTRING;
> > +        params->sev_plat_cert->u.s = strdup("");
> > +    }
> > +    /* TODO Rewrite "" to null instead */
> > +    if (params->has_sev_amd_cert
> > +        && params->sev_amd_cert->type == QTYPE_QNULL) {
> > +        qobject_unref(params->sev_amd_cert->u.n);
> > +        params->sev_amd_cert->type = QTYPE_QSTRING;
> > +        params->sev_amd_cert->u.s = strdup("");
> > +    }
> > 
> >      migrate_params_test_apply(params, &tmp);
> > 
> > @@ -4233,6 +4287,9 @@ static void migration_instance_finalize(Object *obj)
> >      qemu_mutex_destroy(&ms->qemu_file_lock);
> >      g_free(params->tls_hostname);
> >      g_free(params->tls_creds);
> > +    g_free(params->sev_pdh);
> > +    g_free(params->sev_plat_cert);
> > +    g_free(params->sev_amd_cert);
> >      qemu_sem_destroy(&ms->wait_unplug_sem);
> >      qemu_sem_destroy(&ms->rate_limit_sem);
> >      qemu_sem_destroy(&ms->pause_sem);
> > @@ -4280,6 +4337,10 @@ static void migration_instance_init(Object *obj)
> >      params->has_announce_rounds = true;
> >      params->has_announce_step = true;
> > 
> > +    params->sev_pdh = g_strdup("");
> > +    params->sev_plat_cert = g_strdup("");
> > +    params->sev_amd_cert = g_strdup("");
> > +
> 
> TODO: init to NULL instead.
> 
> >      qemu_sem_init(&ms->postcopy_pause_sem, 0);
> >      qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
> >      qemu_sem_init(&ms->rp_state.rp_sem, 0);
> > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > index e00255f7ee..27ca2024bb 100644
> > --- a/monitor/hmp-cmds.c
> > +++ b/monitor/hmp-cmds.c
> > @@ -1399,6 +1399,24 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
> >          error_setg(&err, "The block-bitmap-mapping parameter can only be set "
> >                     "through QMP");
> >          break;
> > +    case MIGRATION_PARAMETER_SEV_PDH:
> > +        p->has_sev_pdh = true;
> > +        p->sev_pdh = g_new0(StrOrNull, 1);
> > +        p->sev_pdh->type = QTYPE_QSTRING;
> > +        visit_type_str(v, param, &p->sev_pdh->u.s, &err);
> > +        break;
> > +    case MIGRATION_PARAMETER_SEV_PLAT_CERT:
> > +        p->has_sev_plat_cert = true;
> > +        p->sev_plat_cert = g_new0(StrOrNull, 1);
> > +        p->sev_plat_cert->type = QTYPE_QSTRING;
> > +        visit_type_str(v, param, &p->sev_plat_cert->u.s, &err);
> > +        break;
> > +    case MIGRATION_PARAMETER_SEV_AMD_CERT:
> > +        p->has_sev_amd_cert = true;
> > +        p->sev_amd_cert = g_new0(StrOrNull, 1);
> > +        p->sev_amd_cert->type = QTYPE_QSTRING;
> > +        visit_type_str(v, param, &p->sev_amd_cert->u.s, &err);
> > +        break;
> >      default:
> >          assert(0);
> >      }
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index 1124a2dda8..69c615ec4d 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -743,6 +743,15 @@
> >  #                        block device name if there is one, and to their node name
> >  #                        otherwise. (Since 5.2)
> >  #
> > +# @sev-pdh: The target host platform diffie-hellman key encoded in base64
> > +#           (Since 4.2)
> 
> Since 6.2, I assume. (same for all the changes in this file)
> 
> 
> > +#
> > +# @sev-plat-cert: The target host platform certificate chain encoded in base64
> > +#                 (Since 4.2)
> > +#
> > +# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
> > +#                base64 (Since 4.2)
> > +#
> >  # Since: 2.4
> >  ##
> >  { 'enum': 'MigrationParameter',
> > @@ -758,7 +767,8 @@
> >             'xbzrle-cache-size', 'max-postcopy-bandwidth',
> >             'max-cpu-throttle', 'multifd-compression',
> >             'multifd-zlib-level' ,'multifd-zstd-level',
> > -           'block-bitmap-mapping' ] }
> > +           'block-bitmap-mapping',
> > +           'sev-pdh', 'sev-plat-cert', 'sev-amd-cert' ] }
> > 
> >  ##
> >  # @MigrateSetParameters:
> > @@ -903,6 +913,15 @@
> >  #                        block device name if there is one, and to their node name
> >  #                        otherwise. (Since 5.2)
> >  #
> > +# @sev-pdh: The target host platform diffie-hellman key encoded in base64
> > +#           (Since 4.2)
> > +#
> > +# @sev-plat-cert: The target host platform certificate chain encoded in base64
> > +#                 (Since 4.2)
> > +#
> > +# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
> > +#                base64 (Since 4.2)
> > +#
> >  # Since: 2.4
> >  ##
> >  # TODO either fuse back into MigrationParameters, or make
> > @@ -934,7 +953,10 @@
> >              '*multifd-compression': 'MultiFDCompression',
> >              '*multifd-zlib-level': 'uint8',
> >              '*multifd-zstd-level': 'uint8',
> > -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> > +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> > +            '*sev-pdh':'StrOrNull',
> > +            '*sev-plat-cert': 'StrOrNull',
> > +            '*sev-amd-cert' : 'StrOrNull' } }
> > 
> >  ##
> >  # @migrate-set-parameters:
> > @@ -1099,6 +1121,15 @@
> >  #                        block device name if there is one, and to their node name
> >  #                        otherwise. (Since 5.2)
> >  #
> > +# @sev-pdh: The target host platform diffie-hellman key encoded in base64
> > +#           (Since 4.2)
> > +#
> > +# @sev-plat-cert: The target host platform certificate chain encoded in base64
> > +#                 (Since 4.2)
> > +#
> > +# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
> > +#                base64 (Since 4.2)
> > +#
> >  # Since: 2.4
> >  ##
> >  { 'struct': 'MigrationParameters',
> > @@ -1128,7 +1159,10 @@
> >              '*multifd-compression': 'MultiFDCompression',
> >              '*multifd-zlib-level': 'uint8',
> >              '*multifd-zstd-level': 'uint8',
> > -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> > +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> > +            '*sev-pdh':'str',
> > +            '*sev-plat-cert': 'str',
> > +            '*sev-amd-cert' : 'str'} }
> > 
> >  ##
> >  # @query-migrate-parameters:
> > 

