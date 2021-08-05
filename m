Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E651B3E1728
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:45:31 +0200 (CEST)
Received: from localhost ([::1]:36632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBecl-0002xo-0H
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBebN-0002J8-7Z
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:44:05 -0400
Received: from mail-mw2nam08on2041.outbound.protection.outlook.com
 ([40.107.101.41]:48897 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBebL-00083L-5Z
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:44:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuiwQw+UV4X1KIGGuvvIDmp8/5FP0W7oO9QF5GrkF6yuLyJ2kiu1CXwQ4BLoEujPPqCvARx9mczkc+4vloWnYlkhlaVwZTLzbFkSBB7Xae1WYm0beljfiCT2e00mWAVOYs1OlZ5sWtEsIUfaVzrcF6N+YW70+kMfIz7Guq3k0Y2UiR1aX6vjYWR8rjwyWgMPffn8zqsJzyVHh/nZoXTl1RN4/14SGmjVoiqPV9n+L/xpUz+0lxtEIInqjw9yf8WfHhr+9ozPZ0mnTnEuV3RJV7MoBzizW7LAYzUPHyE/Gl6EZdEOGHf05syrCKixygXlazEl8VfKBY04hAOFpHeMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BKL4gs+RBOq6W7j1gFDL/4QfeajL9Q3PLXmd4Yk2lo=;
 b=ankh3+fA7U3Kblt9P82piKgKeWSWpkOkuZ9mzSFQVRbxCfUQVxgjKoohMtyFTRS0uq54ydQhMkXc3XC5RaPFbRM8xIKQuXRXNCg7VhjCy0HagBd5u0IOlIEvm7gDC5oWLRiHtwD2B6dbnzVebZIOv+6z7HdRe604amaBy0XbfdsiAaeWbzQ+80bd7Sa0y9sCaZTDNioeeU7g7+lAsoj9gqiBGkeTCfC0Y2syjziQL3Ib6GZvbzfkQEaLOBLATXOPoZwTgMVeCc1Gs35fzrT4boacQ7oQGMIjezw8dGJEVbfS/8Yb4/MF4bGkC11XuE34WjVEPLxUuSLfFTWuPKbf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BKL4gs+RBOq6W7j1gFDL/4QfeajL9Q3PLXmd4Yk2lo=;
 b=xS7jvzKI3OCDrbYwMV2yXMS55NlFSxI77w4N4WDaM02B3R+LoHxhTJDYtssfsZvX76uZesqn14F3mmtC+bCDzSIWOdKBETzq3fJwQMq3/h4GgF7zVR7DKCmW5uXLatT/9lYG3o9qNN0tTL6LbkVNZoI0BsURNplm5K9GKkNdJFQ=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN1PR12MB2365.namprd12.prod.outlook.com (2603:10b6:802:2e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 14:43:59 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 14:43:59 +0000
Date: Thu, 5 Aug 2021 14:43:57 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, Thomas.Lendacky@amd.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, ehabkost@redhat.com,
 dovmurik@linux.vnet.ibm.com, tobin@ibm.com, jejb@linux.ibm.com
Subject: Re: [PATCH v4 04/14] confidential guest support: introduce
 ConfidentialGuestMemoryEncryptionOps for encrypted VMs
Message-ID: <20210805144357.GD23670@ashkalra_ubuntu_server>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <74fce7be9bd219ce902851c0b27192fdefbf9ef1.1628076205.git.ashish.kalra@amd.com>
 <a608f479-1eca-6738-d96b-75145c334b29@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a608f479-1eca-6738-d96b-75145c334b29@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SN4PR0701CA0008.namprd07.prod.outlook.com
 (2603:10b6:803:28::18) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 SN4PR0701CA0008.namprd07.prod.outlook.com (2603:10b6:803:28::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Thu, 5 Aug 2021 14:43:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09799ca6-43b7-447f-63c7-08d9581f75d7
X-MS-TrafficTypeDiagnostic: SN1PR12MB2365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23659010C6D58667CBE2C0AE8EF29@SN1PR12MB2365.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FFHszI/zwGNXLkaeLXNTXRbZfxSI8Mkr5DOakYxtQa6k3PGoOXTioSL7SC4bj0CB2/4MLvzH2y6ysuP3orYzk/1UfWjtPfRdGXmq9nbWRJB6w5ncTvPQcYBZOB9df5AwVxvN9wRPZjBrQRLDeDuX2ytSLpzeninss3+rKv9M5P7/GQ8ujkI5vAcDrJWp/MogKKjmQKaNw2O0eYD50dpao+0FOsZdnmEptwX7kplzxHjg8x/jLgnbWvRSZSRoysB9ekIMTLa1rdHTo1iqECjE7GryOGXgBSMO5V2Nm16Cj9hEaSW+AWW777FBtmmeRqhPE4p40HcXSufAU8A/ikf23r0OZDM138t6xlUeN5ZsCqKTqDMpxfrcWG1CexymjOvz6ri2XZwi9CM97mEZgdj8EkNeedJk0Xs8y9xLG82N0T4Q7UU8QweftR7SHbbu6L37pO6VTR/Q3ssAsfZZxo6D4PZTIOrLV49KQgsaDsf12YQ/fHsW0v5DwuyRjNK4MttukiKOKF3jP3yB9p5E9nWOhcVS88tH3fhKWynAt5AWONGx+XZQWe6+HNj+7VlsWNpf9YOWsA4zL1ULzTRi0Jk6nQTyaedurhScPrzMOCY2DkeYa1XOsOOD7Cx+qdUdFZ0ZdcpKKa2TZR4hNQxBp8/W5g+b7eHW2SsaQv4Z7uGMhG6S/cG14O4L5S53SU6KduEc+EMFqcfzVS1fReMqZ6qDGk1oYEd3bJSTIU9KeLBsLwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(66476007)(66556008)(66946007)(52116002)(316002)(33716001)(6496006)(8936002)(8676002)(9686003)(86362001)(33656002)(44832011)(26005)(6916009)(2906002)(1076003)(55016002)(5660300002)(186003)(38350700002)(956004)(478600001)(38100700002)(53546011)(4326008)(213903007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EEZo2Z4mqGNKzKjNqj3omG6osQWP/SNPo391XVRneQsSC+o+GrAsAuwhzQBn?=
 =?us-ascii?Q?RgKVPuz7+5k5EtWR0IXWWxY21vkKvF7gLb+dccFN7J2xcsq6resu4SfztqPH?=
 =?us-ascii?Q?xlfQBlmDKPAewwwi++vtKXKQ17Uc8fxPsPGeUPS4oDuk97EtH5m/YRRUbik3?=
 =?us-ascii?Q?1B7YKL7fL9Yjt+h0gEfrljt/v72qtWcVOjmCz+UqEl2ABRD+ZfL/wxdxjsvW?=
 =?us-ascii?Q?c4V7FOfAlh7AlU92+AjzBFKmGifiuBUjSMNRMp23w4KsSm0YT2W0+Urxxn6B?=
 =?us-ascii?Q?ZmEw9Jr11T7EMvopp9F7Byp7bd6STQ1RnarkG8pJvaQd3VVVwPw6+ZQosKUk?=
 =?us-ascii?Q?2H9KZEYsy/GBvVWxgRX1L9Flr+NVmHoXluiTTRT+ln3dqBi0KdpIATrmj2yR?=
 =?us-ascii?Q?AsZXrhvoAEq7Jbdz6KT/l0oi3EqCcZRD5tGmMxSKMWNUIOP/wJiTncpSnOP+?=
 =?us-ascii?Q?aC/faDOVpWfnRz25S+8MfKhpGHR59MuwZiysZ/7KiLnM8L0bGV+azKSmZf0X?=
 =?us-ascii?Q?4h1lu06a/PnYGCNsXxf9ipSsgSfMFCo5Sm340RADcpQVwt2ipcAJZkPxTxxY?=
 =?us-ascii?Q?jrm3yqXcaX15TuqjNI4pkQs2ZpIR5HyWEVOxexZPmOvf8JUq85epbjLvW8BI?=
 =?us-ascii?Q?Yz/ED3k3XSm8kqyIJIRl2E4D4fDr0/YWkmqqTixp/31dXVTFxT9ldNYzCiWP?=
 =?us-ascii?Q?9Uyno6QBaFyLwaTEzxQz98Zazy8ImRT020Ab2I5/C7CFLaROm8vTpzUxF1Q1?=
 =?us-ascii?Q?0kt6sIGG4tejRjAxjHOx8f42rxpRYqpNmzcPFRieGZ5JlCvk+/fZA6HprWaF?=
 =?us-ascii?Q?e1U+VKecd7c4I9+zU0LjOl5dI2usawUc+97WwvUiU5MtzVvy2WM/cLPJoGO0?=
 =?us-ascii?Q?BOIhWutxAHVPVLOxXhgZ+AoiK9g6oTaXfChzEw9XfcLhYEmxc4BDGG0NdyiX?=
 =?us-ascii?Q?pqChT4fMvvUe33UX8FfqouRWkk5HW36DdYQAcWIUY897rJQonX7zre6KmCe9?=
 =?us-ascii?Q?zQ4r+xmTCnNKH7pjTDwmQTP6bl/zS5VMOe6QiEB6ehM9kJtbo9OCaB54fdFp?=
 =?us-ascii?Q?7CO3CRNjBCktdIb6iT0ZtO0mAiC8NQ5ZMCVWHJI6AOcVN80KLK06iKqtRNry?=
 =?us-ascii?Q?xTMaSQ00Q06h2711+RlIVb58JiN9BkLea4vZ3Z8jTh+MYQn8ZSlD/NraWAuA?=
 =?us-ascii?Q?HJhXe9amrvA5txymzAlGJtoyJcr1/R6FFVz4RZShIRoRlfWnqw9lRRDf57KN?=
 =?us-ascii?Q?TloVWzVmZNeY+WR9Sl6thQkD9yZfHHcm03BPhqC6ydlDXXH1UHPat+Zh6rBM?=
 =?us-ascii?Q?nLgkZu1u7gLzMWeaLELewTd0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09799ca6-43b7-447f-63c7-08d9581f75d7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 14:43:59.5525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyHepDw4lVo86RktA3aq+gFFI7G5MY4KMWFsqAuxd8A9OwE9MRo3kPvj3IcqlaZli7fQsQ5/kJzFfcc39hMF5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2365
Received-SPF: softfail client-ip=40.107.101.41;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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

Hello Dov,

On Thu, Aug 05, 2021 at 03:20:50PM +0300, Dov Murik wrote:
> 
> 
> On 04/08/2021 14:55, Ashish Kalra wrote:
> > From: Brijesh Singh <brijesh.singh@amd.com>
> > 
> > When memory encryption is enabled in VM, the guest RAM will be encrypted
> > with the guest-specific key, to protect the confidentiality of data while
> > in transit we need to platform specific hooks to save or migrate the
> > guest RAM.
> > 
> > Introduce the new ConfidentialGuestMemoryEncryptionOps in this patch
> > which will be later used by the encrypted guest for migration.
> 
> Do we already have SEV / ConfidentialGuest debug operations? (for
> reading SEV guest memory from gdb if debug is allowed in policy)
> 
> Are they supposed to be in the same Ops struct? Another?
> 

Not currently, the SEV debug patches were submitted as an independent
patch-set way before the ConfidentialGuestSupport was introduced, in the
future they may need to be rebased on this support.

Thanks,
Ashish

> 
> > 
> > Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> > Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
> > Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> > ---
> >  include/exec/confidential-guest-support.h | 27 +++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
> > index ba2dd4b5df..d8b4bd4c42 100644
> > --- a/include/exec/confidential-guest-support.h
> > +++ b/include/exec/confidential-guest-support.h
> > @@ -20,6 +20,7 @@
> > 
> >  #ifndef CONFIG_USER_ONLY
> > 
> > +#include <qapi/qapi-types-migration.h>
> >  #include "qom/object.h"
> > 
> >  #define TYPE_CONFIDENTIAL_GUEST_SUPPORT "confidential-guest-support"
> > @@ -53,8 +54,34 @@ struct ConfidentialGuestSupport {
> >      bool ready;
> >  };
> > 
> > +/**
> > + * The functions registers with ConfidentialGuestMemoryEncryptionOps will be
> > + * used during the encrypted guest migration.
> > + */
> > +struct ConfidentialGuestMemoryEncryptionOps {
> 
> [style] in QEMU you should add a 'typedef' at the beginning and call the
> type ConfidentialGuestMemoryEncryptionOps, and then you don't use the
> keyword 'struct' when you refer to it.  See for example the definition
> of ConfidentialGuestSupportClass below.
> 
> 
> > +    /* Initialize the platform specific state before starting the migration */
> > +    int (*save_setup)(MigrationParameters *p);
> > +
> > +    /* Write the encrypted page and metadata associated with it */
> > +    int (*save_outgoing_page)(QEMUFile *f, uint8_t *ptr, uint32_t size,
> > +                              uint64_t *bytes_sent);
> > +
> > +    /* Load the incoming encrypted page into guest memory */
> > +    int (*load_incoming_page)(QEMUFile *f, uint8_t *ptr);
> > +
> > +    /* Check if gfn is in shared/unencrypted region */
> > +    bool (*is_gfn_in_unshared_region)(unsigned long gfn);
> 
> The comment says "shared/unencrypted", but the function name talks about
> "unshared".  I prefer:
> 
>     /* Check if gfn is in encrypted region */
>     bool (*is_gfn_in_encrypted_region)(unsigned long gfn);
> 
> (and then maybe the comment is useless?)
> 
> 
> > +
> > +    /* Write the shared regions list */
> > +    int (*save_outgoing_shared_regions_list)(QEMUFile *f);
> > +
> > +    /* Load the shared regions list */
> > +    int (*load_incoming_shared_regions_list)(QEMUFile *f);
> > +};
> > +
> >  typedef struct ConfidentialGuestSupportClass {
> >      ObjectClass parent;
> > +    struct ConfidentialGuestMemoryEncryptionOps *memory_encryption_ops;
> 
> per above, remove 'struct'.
> 
> 
> >  } ConfidentialGuestSupportClass;
> > 
> >  #endif /* !CONFIG_USER_ONLY */
> > 

