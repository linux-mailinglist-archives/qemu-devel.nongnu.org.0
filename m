Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BACB51093E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:39:50 +0200 (CEST)
Received: from localhost ([::1]:42696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njR2L-00034s-Jt
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1njQz5-0000MZ-4U
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:36:27 -0400
Received: from mail-mw2nam10on2062f.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::62f]:23297
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1njQz1-0000sa-EJ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:36:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfvRIT25Jvrao5iM8Txo66VAsX7T3v3RnhF3K7JEX3JD/Vd+hv3PuhHirHQp+28ssOYZ5b2gW7jCOTQhUtsbSnt+gMJp8Gr7N1qa7sVJYWGPVRjssjJw2WZYr9C57eHOyyt947YU3/fBNBWZheyuRFP8gJaJk1NN1H/hz0rG3tsjWePDDGT5mNF5UGyEEp37vPNJ8Um8VqKLj/G2VQApo9we80Cq3egqGhvltB8Le5UUCAhzO9mDaCVI8vEODiZcEFHhtcb+Bln98VvgBTiq9Sn77aS0nHHAXVnMKmWX23qAJ0d/db0BpKG3f++ruH6C/Tc+dcCyIeYnriExLMamww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sx7We/cOE17zkXkMNGjxcHHvdbsLE1BCI2r3NS3Do4=;
 b=WfSoSImsbo1nKmlGBH3ssJ/tv94VdTIMTvLM6x8e/Gao+8K5EIL0CjQ9aGIYDtOUTs9QvttPniQd2YL5nuDL2d57kgU/sfy20OA5hOn5bLQsQu1rbyC8H1DUO7jtTOcBeLHEKc7LHew3tbnqUhxk4IlVQ1fer1amXbXtYNtIqG71qmxx4uXnbMfK7wAP6fp4sKBCKDUmi03yVjLO5HUpVL0kDFqQ8DgXFkx7w8kugZQEMFnsBNDWnBmxzafn0sdKo5eGyiz1k2BsZR7e8rZCn7Vmv3+Mli1jUD6pc5dfH0HCB/fUeXY9pcm8zmcIST2GOPJ+JjD/GNmbrpj7Kq/YPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sx7We/cOE17zkXkMNGjxcHHvdbsLE1BCI2r3NS3Do4=;
 b=Jib1vcE1jk5eQwYiPjwBh4wcfZjtBTs/Nn7XjCgr31im3W+AK8IYQ6W0cYMH+eMLV6PmbSpmS8m1ubcE9PkAICfuYWAUPbWx+P/OVFFLbMekZEOMjMaIfwVw2i94SnNvdS1yj5ZoZDUyu4d2NceL+wlvtsM5Sb83P9tXEHuASWjb92Eb7n3JYG+3Q6P2oRmHbtJcqVxzzWzasBbC0O4Pdjp1YwOu9HPg98gk7YrvfEjxI5Ff61gWFwAs/HFTHuO6NH5Wq7HT0BZvEHpa8Va9yZsszeMKBqOJs20CMrQOUUrN1/SolwkT6A0fRkwO1s7eSBPcC0Bl6N7EJpGldJnlWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB3541.namprd12.prod.outlook.com (2603:10b6:a03:13c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 19:36:19 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 19:36:19 +0000
Date: Tue, 26 Apr 2022 16:36:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Liu, Yi L" <yi.l.liu@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "Peng, Chao P" <chao.p.peng@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Laine Stump <laine@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "Sun, Yi Y" <yi.y.sun@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Message-ID: <20220426193617.GT2125828@nvidia.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220422160943.6ff4f330.alex.williamson@redhat.com>
 <YmZzhohO81z1PVKS@redhat.com>
 <20220425083748.3465c50f.alex.williamson@redhat.com>
 <BN9PR11MB5276F549912E03553411736D8CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220426102159.5ece8c1f.alex.williamson@redhat.com>
 <20220426164217.GR2125828@nvidia.com>
 <20220426132435.6ecddd1d.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426132435.6ecddd1d.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::38) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5470c1ea-1ba9-432c-f928-08da27bc0937
X-MS-TrafficTypeDiagnostic: BYAPR12MB3541:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3541CC63FF7A6CC324776CA1C2FB9@BYAPR12MB3541.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gx1ZVNs4YqIScFXY6h9xpeKlwKd0fBQV+kj4DwqstcDrYLwLDq99fC46RDpOLGs4eSM3mB5OQUHUlFB6V0G3/C3UPfVp3QNg9A/hJmyTiGg8g6eyFgBnhcK+uK7RxFtM+l0HmcD3lu4fXkDvCWRldLuvCxzjPi2q9aHL36t7ryGWrqpHQ440YaaQ8qcxEBGzE7GbDTian6xybGqA5/6l2ZRdK6pO2bF+1bV94Oj9AiYpinI+Uwyqw7Wvc01qrYGWSzFpRL9VGz18QwlJEonTI8U5JBJ61qxYJ32Va43AKKw4Yp15tgzg+NbhTN4MYgARklnJQhO4mM6jV3sf6pUgVy+gD2KdX9O1pB49yN2gwP1/VbiUz/MW6CZ/qWFB0M+9n9Mo9Q4zdCLzDYH0LFbVgI+k3C5CDqd+KtZwExcWqMeFHWCWdMLCs5hM9vZWW+VoaCa82g0qxsGanYrWXgW4zYVL0ptYAVghYmkXBd+k3GtjvV3IytXbbzQI1e1kkAeo48NlB+DlvTCS259rPjVq5+ZBCP9Dh9RfYjj0rqeL5vIoFdsKtCHJjyu7yb18fjwWYDEgKO38Fqebu8QMz1KRfPAYi+KnLv4E3gevq1Pl5LHARdoZ8H7Q2GBHNw5HYfK56qw04Tm5Z48yaeikiSY8wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66946007)(6512007)(8936002)(2616005)(7416002)(26005)(66556008)(316002)(2906002)(1076003)(86362001)(38100700002)(6486002)(508600001)(54906003)(6916009)(8676002)(66476007)(83380400001)(186003)(6506007)(33656002)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5gN/dORRIalAAgTe4XVs/gS0fWvPob7zcpxphBndVp/7Rc31bhTetJquL+H0?=
 =?us-ascii?Q?+6Iqu18o+QA+PP/lY3cyQihQMWMq9l1ithvXy+YTwUf1ANg17YX9FrwcqxdQ?=
 =?us-ascii?Q?QP/QPJmn4yZsFUlgEpVaUo0gTl1VWYfidasR7prL6uaBc5Yf+Zly8PDl5oGv?=
 =?us-ascii?Q?61DVgZvyzaMdc8Zeb+fGfSOB8voyBr5i6WbfuAeJcVeP8vdQqBIOEsjSCdmU?=
 =?us-ascii?Q?T9q3CVNp9CrFXOKFp0KKh1fcm66wLxxYnlsTbcUx18MkskycS0LQ7ECCp4uk?=
 =?us-ascii?Q?mk/c494kj7CvmN/5r6SBDOk5Or6tIulwmRQLq3sjQRmS+THsh7N99cxVaAth?=
 =?us-ascii?Q?k04ZEAUIPErU8TDwxSCOOOZFOcCoPnz5Ss3Nrj/OBo2rKbIbq8WOou4+txRv?=
 =?us-ascii?Q?bByNWiwPvXbJmJlbt9xMnm375L1+mi9NOpeBc+w5tOm3a2ZFdHTJqGSsd5eI?=
 =?us-ascii?Q?ubXbPza0geE7SmYQWE2bOysFm4fSn3DTx4XAWhmA1TSJEm9ONmLLFnY+uIC/?=
 =?us-ascii?Q?W0Fv1fCTBvFyZzlOJ99szJR42U04NoP1t+Jr1sCbSfAluEuL1wfDVhsuRGe6?=
 =?us-ascii?Q?URevoKAHOL8LvROzaLxnKEnrQnyQcsh6m3dbDJhu/o6Nnsin8oBtd25TUMIa?=
 =?us-ascii?Q?fbTvcn7bc1bt/JNjt5UQbywUUTgttdRLxTZoDra3L0CuJsBbLZYuHNxOTWeX?=
 =?us-ascii?Q?m6hLlRCcEGaCGJSUda8ggIsCcq8J3PZfNktVDCvBaGJPX+S652KJxOKKqiOi?=
 =?us-ascii?Q?lm0turH5EQWpkvH/wj/SFNSPUeLBVT8RgCDFt8maCy/F3dl2txyU/ylkkb/4?=
 =?us-ascii?Q?xYb36wrJ/bv6prmA7eRpeKMM3jtROb2P6J+dwBDEXs0xClBoOvTuOfGE8gOt?=
 =?us-ascii?Q?gUAVdg5XP1syhIRqLqExSbwjZjDv03NzcfZJgPljuJ3xcIL4EiYVqkRMeWmH?=
 =?us-ascii?Q?a32/wJHoXEpryzJrzx/jF0rraQSdeBe+zmYDNqCxpsew8boxoIRhyLlkLfIJ?=
 =?us-ascii?Q?RJwRC4uRK2ZWMPaRfLl2hbjhsH+zBe6ITD15Z5+/UXfZnU19OmZJUxwVcJPK?=
 =?us-ascii?Q?dhSX423E+ZpTzGcJboylRgeJdDc1Ab627YhrMI8E50OWjRwP8WrZpgDTV2ip?=
 =?us-ascii?Q?tm/7y4sItNRxrLuMf7s9iXvDH4tQ2TDGvOgfP1T9VFMYPt+yu9q9x9N42/4z?=
 =?us-ascii?Q?3UO9O9HwRAzK6v9hLDXwV7GTCbC+aL38kFlUZoECNbKcJmXK5G2RvQRKiDKS?=
 =?us-ascii?Q?vbm8u5H30GXth2qPaoNFyuOLLPK3qZP7nGawKz5Fvht+ZULyNpZWEMrG0vqd?=
 =?us-ascii?Q?PerbhnU51jxNLAapvKSVMCROf+xzabEfEr4TCny+BJDesitvBLTr45wMTSa3?=
 =?us-ascii?Q?5nkDfu8Tx8duTB3uCXz7gGwHsOlIgJENTy3v90MGkNE6RHVN7W0iojb08H1k?=
 =?us-ascii?Q?Zr4pcqttGEqBxet4IEu3D2YEhU02X9OUe9WPTyy1Wid0yY+5pcCJ6Qyb5cT3?=
 =?us-ascii?Q?JRxtc8zSEx2CcUHNbEYyW1vY+SoTyyBLWN1la/9pskmWbXUT8eGew7TNA8KD?=
 =?us-ascii?Q?8EdToqg2l5OYZZHU/xYo1AyPulzIyiW9+lOcqDwrA/qQtrVuaZ0iCVFlRMvI?=
 =?us-ascii?Q?4ILSGEybfnF5lYS7pcT2X/N0D6FxlexXP3yugS+Pv7vNQXr85vIpBECTbVZy?=
 =?us-ascii?Q?Mzt7UdqKpiI+PcM5y5JJ88ErpMPh/6zaw7eyP4dn4LpZHFx0T6zQMlCIyIcF?=
 =?us-ascii?Q?f4hu11fQYA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5470c1ea-1ba9-432c-f928-08da27bc0937
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 19:36:18.9594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEUlvqySfgHoOptY1P6/ZJnnitr6YfYbNv+nZkMdlBSIHUtCYugKWXtjEuC+nqZn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3541
Received-SPF: softfail client-ip=2a01:111:f400:7e89::62f;
 envelope-from=jgg@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 01:24:35PM -0600, Alex Williamson wrote:
> On Tue, 26 Apr 2022 13:42:17 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Tue, Apr 26, 2022 at 10:21:59AM -0600, Alex Williamson wrote:
> > > We also need to be able to advise libvirt as to how each iommufd object
> > > or user of that object factors into the VM locked memory requirement.
> > > When used by vfio-pci, we're only mapping VM RAM, so we'd ask libvirt
> > > to set the locked memory limit to the size of VM RAM per iommufd,
> > > regardless of the number of devices using a given iommufd.  However, I
> > > don't know if all users of iommufd will be exclusively mapping VM RAM.
> > > Combinations of devices where some map VM RAM and others map QEMU
> > > buffer space could still require some incremental increase per device
> > > (I'm not sure if vfio-nvme is such a device).  It seems like heuristics
> > > will still be involved even after iommufd solves the per-device
> > > vfio-pci locked memory limit issue.  Thanks,  
> > 
> > If the model is to pass the FD, how about we put a limit on the FD
> > itself instead of abusing the locked memory limit?
> > 
> > We could have a no-way-out ioctl that directly limits the # of PFNs
> > covered by iopt_pages inside an iommufd.
> 
> FD passing would likely only be the standard for libvirt invoked VMs.
> The QEMU vfio-pci device would still parse a host= or sysfsdev= option
> when invoked by mortals and associate to use the legacy vfio group
> interface or the new vfio device interface based on whether an iommufd
> is specified.

Yes, but perhaps we don't need resource limits in the mortals case..

> Does that rule out your suggestion?  I don't know, please reveal more
> about the mechanics of putting a limit on the FD itself and this
> no-way-out ioctl.  The latter name suggests to me that I should also
> note that we need to support memory hotplug with these devices.  Thanks,

So libvirt uses CAP_SYS_RESOURCE and prlimit to adjust things in
realtime today?

It could still work, instead of no way out iommufd would have to check
for CAP_SYS_RESOURCE to make the limit higher.

It is a pretty simple idea, we just attach a resource limit to the FD
and every PFN that gets mapped into the iommufd counts against that
limit, regardless if it is pinned or not. An ioctl on the FD would set
the limit, defaulting to unlimited.

To me this has the appeal that what is being resourced controlled is
strictly defined - address space mapped into an iommufd - which has a
bunch of nice additional consequences like partially bounding the
amount of kernel memory an iommufd can consume and so forth.

Doesn't interact with iouring or rdma however.

Though we could certianly consider allowing RDMA to consume an iommufd
to access pinned pages much like a vfio-mdev would - I'm not sure what
is ideal for the qemu usage of RDMA for migration..

Jason

