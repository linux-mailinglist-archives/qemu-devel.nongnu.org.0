Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DB56A1EFC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:53:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaNH-0003qn-G6; Fri, 24 Feb 2023 10:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pVaNE-0003q5-5g
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:52:40 -0500
Received: from mail-dm6nam11on2081.outbound.protection.outlook.com
 ([40.107.223.81] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pVaNA-000540-Mf
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:52:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGT2YB/09ORYTxg0+mJdTk5/8mM7rwcBfXRyNSP/mCSl/YE62QNQRUWVlrmwGOUrJeZHTJ6mLSzfVAKhACTsEw51K9YgGoj46Ft5ThsSdA3VH8EGvc3b0LW+UCWMH30wh21XFTSnBkgdphYy16nCreWo7l0eOC24s0suBghNlvjYuS0DR7MTpwC8HEsM4dnUu5KLeCMWuG7O+q/MWca2ob1w+0lyrsO84bZgh5rr1lzoz8EN871vUSiT/PY0sWqCaY0HuS0Wf+S8lAa8ZxHiuwXZaeFX6Eej1XZdH/4BGlSocygal0J+UMu1qh/JOV/KtZZnkja1oI6vr3UD/VVaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6foR1TfPDOrW8IOfKWrhtOD+q92wzfjQCXzXgs4kj9E=;
 b=l5vtVSFMHIg/qPPkeL+W8WVHH65i1zqDfsGjIlMgdQ0P91paJJyHJztDGV5jqYvK8IDHWqYqZGj2k0SnYr77vDBn8PeWveVOxF2xj0L6DXd9sITgmWamlcuJzcwKFWvPb/k+1iU0RRAwQCyhM/LBPG7mOKRL7YgaQ2hNRR+Fb6Mh0mGIHTu9A0s5nzbJQx7djUSHRkPRYp8ITl/dN7jJ20DXjR2y/9TLNADafWHPnobt11Oal6O0jmOhbZV2b/3gc5hpl0BwNFhrPoy+0zpg++FUVbHFadlpSaYtZTqdR2U8okSURQb2Iooa36QdTQLsCI2zX+yt+uHn0Kbe8IkIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6foR1TfPDOrW8IOfKWrhtOD+q92wzfjQCXzXgs4kj9E=;
 b=iDYO6m6XiFV0YMpTgrrDyZ22rvZHj5Ilk55yI+5MFzIkQ6OUOpLudwJgUxNGBmwABJ3u7fQ/309HsM+dsJfTsGaGjGq+IXycK0L7Y5kw5iRzD8VNsmIeY8GtVyvGCyMPc23nrGVLYqv5S4V4amQRimKTr7dYXXgy6lwrwjl+LZ2ZXlSq6Cq7fqFZHbJGO5lGta4ea2B1m4iShif0Ev/nF79CBTeXfKH/z3oB8C+VVpp+k1lOdYbOrs40Z2BnLhLvth25qY0qasd2T5XMo2Wxwl0T4vFg8TETu3aunzV4qzv6irqt1tSbBHFjoldU8xHmNJsKPJszeLM6epqJ6MLAbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6073.namprd12.prod.outlook.com (2603:10b6:a03:488::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 15:47:30 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 15:47:29 +0000
Date: Fri, 24 Feb 2023 11:47:28 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page tracking
 with vIOMMU
Message-ID: <Y/jcEB1aQLS6/wd5@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
 <20230222163439.68ad5e63.alex.williamson@redhat.com>
 <Y/bKoUBe17YNhGEA@nvidia.com>
 <20230223130633.4bd07948.alex.williamson@redhat.com>
 <Y/fS2rX+JvYVC9jR@nvidia.com>
 <20230223153309.298af6e1.alex.williamson@redhat.com>
 <Y/f2CJXGLLAtFezU@nvidia.com>
 <3419a4d1-041f-f4f3-1d7d-ab3608bb54ac@oracle.com>
 <c66d2d8e-f042-964a-a797-a3d07c260a3b@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c66d2d8e-f042-964a-a797-a3d07c260a3b@oracle.com>
X-ClientProxiedBy: BL0PR02CA0125.namprd02.prod.outlook.com
 (2603:10b6:208:35::30) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1787aa-aab1-4ea0-8eee-08db167e6f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjH6/xk0nLx9L68YL9f7vWRacxgV075yn4TTjw9VJtyEUPOOJVqod0TNkwPLmxPbr+EP3i/UmDh0yCzQAc+W8XAtZBQOjIX8lxYq3UphvdPf8ZNJOyhobwcw4l/veXvB0Iv3AUs/Ogu9NycbD4ZqI/yUf6LYFnG8aHtpwiGWjjtwMjF02FyaQZx2Zw3DOufEJlZ4/KKded8ffNBcreeLqcPP0Ss7uLpUym5BakqsyqJooBk6aIuepvTU1EQ5U2fNNRY93zAmv6APl9SOvFaSZd09xQihK5x6ktsSG5hR+E3fVDOTsIpLRixJa9MOJGG6GwPcoXKTelSIj4gF0xSQ96JyJ+Yu2ywYy3SJSlvjOjlnsVmfUviLgtyjN/bw7LU9/dqYKZxTB/KinJYMK8At7CesSFHLB3J/T+73/lMxVIDz5mF+cURN1incQcFL3KVoXiVpgWXkUkiy7IXu0thje2OzmP207OLnN+7WeDBsACzZq6K+LMDLSGXL3wXM6ouvQV0WXNdcRZKdJphHqnSVDL+IsTFXKyDa8zg3PGwFKoAW15ZV3heAq0+JqZTA42WP32GtF48A2AhmO2bfxbK6yhRxDETLOesPvaQskQklxxG1KAf5086YzgI+iMRdiLoFzsKP8RF8SVLpPbIEzex84cYvSH8/CogLEg0DVyq6KMZuontN4iKqrr/eZTO6kiEE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199018)(6506007)(83380400001)(36756003)(316002)(38100700002)(54906003)(7416002)(478600001)(26005)(186003)(6486002)(107886003)(6512007)(2906002)(5660300002)(8936002)(4326008)(41300700001)(86362001)(66556008)(66946007)(6916009)(66476007)(2616005)(8676002)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rJDDKNRgR3REc4foAJySRG0Pvyfov4brpOntaCrWbGQl/RAgQoyV2pGZD+AX?=
 =?us-ascii?Q?VFPKV/OOFHQIT3fpzvNDHjwrK5Cu4odAQ8jLN3hf60PMY/FqJkPy74XPRfGQ?=
 =?us-ascii?Q?OGxM47jbRZgn3Eie8IEOj4ehKElfNKiUh2cmD/zPDWKCNUag7YfnnlhMvwr1?=
 =?us-ascii?Q?RoR/IU929MIonxFgdwWowRjK1sbsqxa8mAvqBbiK8/5bDJGsFRT/obuV4L9l?=
 =?us-ascii?Q?Bz/UdgD88lnfVhGVz9epR14dB8JMWauGTdCNYijhc9vhhQMzUXm96qInN15Z?=
 =?us-ascii?Q?fyqLYZvZCObkM1g5Tlmk0kxdsJMIjeaHjHH0ALeiQuNXyK8TejS1SLfmAdKX?=
 =?us-ascii?Q?LVpvj5gRe77ebftBkBWnLMc/nJJwULa77aCON/NMY3WVfqh+BOgB0BwmX2UF?=
 =?us-ascii?Q?0a9ss5a18ibqPtPAoKXieQDgWyWgBrJBzQ152yYVf5dlA3bFc80D3/cWW2h8?=
 =?us-ascii?Q?qRqbLUNYwikgY/Z+P76hXzBAWXWvt0DS24fNnFHooMf5CVYt57l9bQabGREH?=
 =?us-ascii?Q?eH8f8LQ1DOprPenX4hK7bUUIbXSzCzLixIMYT5oo+f2FGlTX23G6i0XOPRn3?=
 =?us-ascii?Q?mIK7kTXwh1ihl8cfmG6ZcoBUgkCFlZdE4yQ8597h93Qk337zbqDNfoEpQTqx?=
 =?us-ascii?Q?Um2nlLCIUJZtrz1h33b5mep11ep1bttnYss3yi2j95kBRusaob4tPHxR0r9J?=
 =?us-ascii?Q?CW8lCamYCFuvQnNHUvMgmbT66Bf6lL7btoKWOc0AGd8fs3TmHvbZfrVG7nbF?=
 =?us-ascii?Q?s+8Gpfp2sL6POs8O2oyvaQ5HistWtsDd9+nzmBoFXd/W+JjoIZy8JptybuRw?=
 =?us-ascii?Q?rBtgQkdhdLR3mNoet2kbziKGFPZ4zM+haWkymNXCtQs31SwIltgxSZRSk2Z/?=
 =?us-ascii?Q?6R3iC+fgLIZEMkvrvU5qRs6Ss0UnNPOy4wFk2nmUjl952//ogeW6H5O3Y6n6?=
 =?us-ascii?Q?Ewjx0PHA/7Qea9XqYVWNFTNAKeTCvc+ulJyV6PFIqR8vVSGR5F1cepeajV8V?=
 =?us-ascii?Q?WvkO+YTJTHiie/FHBEfyemko5ADyUhqBT6Y2L9jLk5ArFWb+ojE7LO/1kO4M?=
 =?us-ascii?Q?GawMM4XUZvFYEzbGOSns6wTFpoS2jX7QAsOVFLe93i/eKQi2wovqnRJ2FyYs?=
 =?us-ascii?Q?eh2/gY85Ek6oQz31CZDfbEVzlJPmUGfxs9HlKszLHjWUCLLlcKRLTRAwUYRv?=
 =?us-ascii?Q?A6+TnN18iBGOG4DcmMaD86c8PQDDj0g5n5+/qnCbOVaQjx8Z9oZdbTFdv6Yz?=
 =?us-ascii?Q?BnkbNct+OIbCo+HdTtmCseo4L724kjQkTQrS8zcy9MGb8CbLKNXyymOCwWGE?=
 =?us-ascii?Q?EktwljWn5EnQzq/WdxoLw0biqnoEj773YKW4+QSSJgaTFFxURP6/UTI9KTRR?=
 =?us-ascii?Q?5XwBrhd+G7zHPqPSLBo70kG2tSmBrE8RroMcw5vvtPov9x6VVrG952Dy4qCQ?=
 =?us-ascii?Q?1AuL//3bkAxHcyNog0fhjHUyrisOAVMkI0YBDC711KZ3ZTc4xvCLLpUD1iSo?=
 =?us-ascii?Q?Gf6ihJA/uhRU+hC63dpSB+O218WE8MRtK+naZEFyK63sDlB4Dr4+piCPYuMg?=
 =?us-ascii?Q?BK6IyXEdsOlWiy2GphRaHsbzPC2w9RHJ6Q9V5KzD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1787aa-aab1-4ea0-8eee-08db167e6f59
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:47:29.5074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qp2mYkCkzQR6OlXd3Lgd3fG125SvnLB4h7qcdQmd1mbTpKx0ohTCKGaoP5tdPiYa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6073
Received-SPF: softfail client-ip=40.107.223.81; envelope-from=jgg@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On Fri, Feb 24, 2023 at 12:53:26PM +0000, Joao Martins wrote:
> > But reading the code this ::bypass_iommu (new to me) apparently tells that
> > vIOMMU is bypassed or not for the PCI devices all the way to avoiding
> > enumerating in the IVRS/DMAR ACPI tables. And I see VFIO double-checks whether
> > PCI device is within the IOMMU address space (or bypassed) prior to DMA maps and
> > such.
> > 
> > You can see from the other email that all of the other options in my head were
> > either bit inconvenient or risky. I wasn't aware of this option for what is
> > worth -- much simpler, should work!
> >
> 
> I say *should*, but on a second thought interrupt remapping may still be
> required to one of these devices that are IOMMU-bypassed. Say to put affinities
> to vcpus above 255? I was trying this out with more than 255 vcpus with a couple
> VFs and at a first glance these VFs fail to probe (these are CX6
> VFs).

It is pretty bizarre, but the Intel iommu driver is responsible for
installing the interrupt remapping irq driver on the devices.

So if there is no iommu driver bound then there won't be any interrupt
remapping capability for the device even if the interrupt remapping HW
is otherwise setup.

The only reason Avihai is touching this is to try and keep the
interrupt remapping emulation usable, we could certainly punt on that
for now if it looks too ugly.

Jason

