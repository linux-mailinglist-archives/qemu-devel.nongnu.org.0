Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A154068C3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 10:54:19 +0200 (CEST)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOcIc-0007K4-6v
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 04:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mOcHG-0005XR-HK
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:52:55 -0400
Received: from mail-bn8nam11on20608.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::608]:58977
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mOcHD-00048U-QJ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:52:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDhSm+Reql1JdVpCDFRxJtgupsSofSjsaXm5HLS3BKB9v0of8Gv5q/8cJnX6RInXvcW9aB7iWuHwgphf/sFKYon9GyKAmYK0zn5GUSYsI48dh1bZxNSdIdQGA5mKAtnZ4/KDaotsrvomV4RnyCQIDNd2cy3zsDhkOypJ9JYwyvfW+xmog3EYP/Wbu3DjfTGewvS5QW07Gt9CJOSJoKXBHnJyGTupg3gn3+eYc8A1RhllH1r2t7l5Ml4tP7LK9V1POPy6ue88Axk5CxGFxCEJIFBdDWwqpKu05USyhYU+kovBA6GJAngMKzwsZQ4IkakjeJ6kFxa+q4jVfdpJO7x+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zvslgwpU+aeXJlB1dqnqxCM2KHXUKZk1gu/ip98fF6g=;
 b=H1SZeIP0WQjmiJ2Rl3BG7w++cv02L24taADEPqis7jDvMxWqQGVEKeEEP8YibJZS9j4HWu5ODmsRldD7CegaXHGvvPhvaQtRb9r/8vNORHj+SxEUTo7Cx0jGBTrmASoPK7f5mBODeyJhoVTddxiJhDUHwfm2u9MzNl9LbCG3YIyX00O/ku4B3tR1cjaD0Fl59UMo9pwwqIkB76yszMzkjU2MdVQyBvB1F4/4jRLaQJktrY+XS0ptZ8cvU7odnjsuIg0EyHpoNN2jP2XhTLZP0mmR1SUEV18FsJpx5crp2M9OJfQ+BHparJ0fiKs/qyrjkH5DLjQ+sroN+IpZx+ecJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvslgwpU+aeXJlB1dqnqxCM2KHXUKZk1gu/ip98fF6g=;
 b=VgY+0cCD4hYcTKR7VjoqpUURmzp/6FrYECXF5LbPi4ARTF/96g6fkyEe8780lkSdFnmC8GPgkg8bue6KNV2UYzgYfJdlqycCY7GowwfHhZ26qC43f+67BN7LAmfRXUCR6i9eslkP21GIFWh5oDq6qNR0W3ywVw60oviUEg+WMkE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN6PR12MB4751.namprd12.prod.outlook.com (2603:10b6:805:df::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 08:47:47 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4478.026; Fri, 10 Sep 2021
 08:47:46 +0000
Date: Fri, 10 Sep 2021 08:47:40 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Thomas.Lendacky@amd.com" <Thomas.Lendacky@amd.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "dovmurik@linux.vnet.ibm.com" <dovmurik@linux.vnet.ibm.com>,
 "tobin@ibm.com" <tobin@ibm.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Subject: Re: [PATCH v4 10/14] migration: add support to migrate shared
 regions list
Message-ID: <20210910084740.GA2686@ashkalra_ubuntu_server>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <9236f522e48b67fe7136de7620276f7dc193be37.1628076205.git.ashish.kalra@amd.com>
 <6a48e7c8b6e14933aa0085d12e2c5ff7@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a48e7c8b6e14933aa0085d12e2c5ff7@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SN6PR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:805:66::40) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 SN6PR08CA0027.namprd08.prod.outlook.com (2603:10b6:805:66::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 08:47:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e956af3e-8793-429b-c193-08d97437a96f
X-MS-TrafficTypeDiagnostic: SN6PR12MB4751:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB475129AF8680F0EC0D378FAD8ED69@SN6PR12MB4751.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: En80fIKcnMg+Hl4n/TdNGNyLlFTknHwEJE5oMcddg/i56hwRC8nu7r4kc6F0UGIV2PefwC4z0PGq4ruB5s5cL6ej+fuyWNwh4aowRvpFKepQxT/IVHSwWi88pNWqOepjQSRJIiPEbUT6WBX073GLDDYRt2KOvcQxIJ30oNAuA4xanltElwaRlS+1ruM19IinMDXkHD98reXe45peMG7sdIdUeYssBlKcP3nKwN6pbKRiTDsGTBVA30kaIb3YIH3cv7FFMxGSHujzCuwknnQEXtbSkfaDRgcuDWtehGgeR1Tkt1SVp2GHjB7ozd841+3QK2VLQGGcgKnoS+FHhWIlspS6sm/l1AyGSq+wuQXQcTokptDg3qPogwuOnm06s69A0cqsA0PXjrbIcrD78IAaSW8YMGc8qHgLtGT7R9Vz+Swl5qB5qW7TvVpW4YW9jarUJZASUmyIY++4fP/BoigCWHjVuwnDJA5j8i9EkNzxdrtk2u4RCh72lVIDF/L81lrMRRGlpbra6SqMzeCvwUuvGwzUguQYbstmWb1VgfjA3gVK/t7xyVhGphfqcqquIE4w2XjChvTfi7BW6gikuaehEnWSuFfROXSF/Wz9i/yfW5rvfW8YdOSLEqc63ITcQEqNPCPaJAtjJ/oHdMfYuNHV5XJRu0IIl3UrzQ2m1tUInJ0DF+Wjir8QCkdo+OID9DLszXcHPCSaElcEl3cKVslvGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(8936002)(55016002)(66946007)(6666004)(6916009)(9686003)(26005)(33716001)(52116002)(4326008)(83380400001)(5660300002)(66556008)(86362001)(6496006)(956004)(44832011)(66476007)(478600001)(316002)(38100700002)(54906003)(38350700002)(186003)(33656002)(8676002)(1076003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZbUhbsUYp41OAvcb68vfNWj5/RBjRGJ8BE771shrEZCOKvaSmw1EdPEOnxGj?=
 =?us-ascii?Q?/quDon40OpizQqmDj3XT45gzPDGVpoouFYxV+cmeJ4xudUm+SI6MDSSOduQO?=
 =?us-ascii?Q?5+q8xk1XXGITdHcZtYRQnKmxje2NlbTddZyIZ4FX8LJuPch1pU5NUI9q9BUt?=
 =?us-ascii?Q?Kv4/R5PAe3B85g4ua/5TVMnPn/nwrHG2fjkq1keDoHAArV981onNNPwNHQjw?=
 =?us-ascii?Q?beKzcrYo3KKlcD25RPnmK9yPkORMdudO4d4+KGmD5tNOR/CVmy+EorLraTyM?=
 =?us-ascii?Q?x4ktx22KMc+1UPIESCTNhZRem/2ZkmXxzNyOcxPiv4/7gsCeBQJcNcgK7VpG?=
 =?us-ascii?Q?Cg7Uvtl0VujCgXEAzfbLYQ5p2F/doK8LiheLkfx77/NF879v6PRpzMISG5mx?=
 =?us-ascii?Q?L5CQNaD/mQlGQHijpFJF2h31e4eqOVpcAOwZXP7MXOVTyVwCa1TEbpNo9V2F?=
 =?us-ascii?Q?IDDTmPyp5piEJXuNmG5h5EUnzyv5biKSbnTA0m97zT0eXj2bt3Z/hBF0Mvc/?=
 =?us-ascii?Q?YJBv/enEoVAAvOHOdsJ3XrcINdQwSEmxC8PPBolloHSB2dtdnKEcCA3TJQLB?=
 =?us-ascii?Q?FtPAPEG+hSJInHVmIncPgF64uOMN/OcF7Mwdef+t+5JyUA/u9gylqQlShqm4?=
 =?us-ascii?Q?TkJ8yQxjxyf10tJJ7S0TUNYmwulFUJ9/awA17AomJi7DBdwO57shjWoz80JT?=
 =?us-ascii?Q?jbs29v4cd7ieI+ykFumnvCHkiQR0EvdbDHh6t870VZ1mD1KML6lpwjuuSKo9?=
 =?us-ascii?Q?MvJ+xFc/r2Tggk3ei8NKwuwuWjsqPAKT89Q2HhM9HDei8dMkPsoAygsXnZlL?=
 =?us-ascii?Q?2EfOWld8SOjytmApLBE0VyRMokhGtsidmQZT0h38e/RVcsS6TlL/EuZuL+My?=
 =?us-ascii?Q?bUEkdPOgEimUeK/07s5olXbVPwI4bv5IsUs8CXkol37czjDznzPbKRXm2kp2?=
 =?us-ascii?Q?NyL5I7f0uiZ/rYOcyWX4C4ed34RNiSO7BPy+4E75pZzHo79ZYYD9sXHsQt5K?=
 =?us-ascii?Q?2sQO/ESrfoaCyCQwmy3nYVryJ6KhneskXDXgL+KphovaGce35zwSpeL0KZ2J?=
 =?us-ascii?Q?CYn42AGwscNhcajBg8wlTXJMHSk3VU1O2r93YSewel4GVVMu/3oVPrEBygOt?=
 =?us-ascii?Q?8by00lrMd68T20KnAJQuIJdF5nt2yBpIyrOOU1Dbl+JaJF+iPBljvOenQ3NF?=
 =?us-ascii?Q?unx1bqU+LYipDl2pSwPNfskMaWVZasVtuQyH84MFu/tNdYp9dr7W0/o0R+6d?=
 =?us-ascii?Q?nNefmCUY0+I1NbkWo7MMzVBWTo4kTUDYL/vrarZR9t7YnNsrdIyAM74pKhl8?=
 =?us-ascii?Q?BC/JF3XqQfWYQk+HhlbtOxOZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e956af3e-8793-429b-c193-08d97437a96f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 08:47:46.8420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBDC/I81v+sxlhuvQomzKP1i9Lcz+9EGu7i8Yqg9OyoGzauGOBCt7asKw1HXC+oG68ZvxihYIGybEzaSoQIkuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4751
Received-SPF: softfail client-ip=2a01:111:f400:7eae::608;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

Hello Wang, 

On Fri, Sep 10, 2021 at 07:54:10AM +0000, Wang, Wei W wrote:
> > From: Brijesh Singh <brijesh.singh@amd.com>
> > 
> > When memory encryption is enabled, the hypervisor maintains a shared
> > regions list which is referred by hypervisor during migration to check if page is
> > private or shared. This list is built during the VM bootup and must be migrated
> > to the target host so that hypervisor on target host can use it for future
> > migration.
> > 
> > Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> > Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
> > Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> > ---
> >  include/sysemu/sev.h |  2 ++
> >  target/i386/sev.c    | 43
> > +++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h index
> > 3b913518c0..118ee66406 100644
> > --- a/include/sysemu/sev.h
> > +++ b/include/sysemu/sev.h
> > @@ -32,5 +32,7 @@ void sev_es_set_reset_vector(CPUState *cpu);  int
> > sev_remove_shared_regions_list(unsigned long gfn_start,
> >                                     unsigned long gfn_end);  int
> > sev_add_shared_regions_list(unsigned long gfn_start, unsigned long gfn_end);
> > +int sev_save_outgoing_shared_regions_list(QEMUFile *f); int
> > +sev_load_incoming_shared_regions_list(QEMUFile *f);
> > 
> >  #endif
> > diff --git a/target/i386/sev.c b/target/i386/sev.c index
> > 6d44b7ad21..789051f7b4 100644
> > --- a/target/i386/sev.c
> > +++ b/target/i386/sev.c
> > @@ -135,10 +135,15 @@ static const char *const sev_fw_errlist[] = {
> > 
> >  #define SEV_FW_BLOB_MAX_SIZE            0x4000          /* 16KB
> > */
> > 
> > +#define SHARED_REGION_LIST_CONT     0x1
> > +#define SHARED_REGION_LIST_END      0x2
> > +
> >  static struct ConfidentialGuestMemoryEncryptionOps
> > sev_memory_encryption_ops = {
> >      .save_setup = sev_save_setup,
> >      .save_outgoing_page = sev_save_outgoing_page,
> >      .load_incoming_page = sev_load_incoming_page,
> > +    .save_outgoing_shared_regions_list =
> > sev_save_outgoing_shared_regions_list,
> > +    .load_incoming_shared_regions_list =
> > + sev_load_incoming_shared_regions_list,
> 
> Hi Ashish,
> I have some questions about the callbacks:
> 
> 1) why using a list of shared regions, instead of bitmaps to record private/shared state?
> I saw that the KVM side implementation used bitmaps in the first place and changed to
> shared regions since v10, but don't find the reason.
> 

There has been a long discussion on this implementation on KVM mailing
list. Tracking shared memory via a list of ranges instead of using bitmap
is more optimal. Most of the guest memory will be private and the
unencrypted/shared regions are basically ranges/intervals, so easy to
implement and maintain using lists.

A list will consume much less memory than a bitmap. 

The bitmap will consume more memory as it will need to be sized as per
guest RAM size and will remain sparsely populated due to limited amount
of shared/unencrypted guest memory regions.

> 2) why is the save/load of shared region list (or bitmap) made vendor specific?
> I think it can be a common interface and data structure, e.g. KVM maintains a per memory slot
> bitmap to be obtained by QEMU.
> 

As the shared regions list current implementation is vendor specific,
it's migration is also vendor specific.

But you are right, this can be implemented as a common interface and
data stucture in qemu, but it is a separate data structure and not
maintained as the per memory slot bitmap in KVM and obtained as such by
qemu.

Thanks,
Ashish

