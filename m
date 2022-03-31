Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB24EDC16
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 16:50:52 +0200 (CEST)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZw8P-0004Ls-1Z
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 10:50:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nZw4T-0001yR-EQ; Thu, 31 Mar 2022 10:46:45 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:5348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nZw0f-0002rW-4U; Thu, 31 Mar 2022 10:42:51 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22VANOFO001404;
 Thu, 31 Mar 2022 07:42:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=bwJkVDfi6AczydcqolOZnlB9jtC492q/o/7W05V4wBk=;
 b=UbmLBpVQegPOIqkV/R+MvijooQsdACILKh7gCe4zODpIc9NyjZACJvGHeQd7bic5Dhcr
 3FWNAndbSdth11BfhLPKu3BgiU9P6EmlwEbI4l5NLcujQLzyR3DJIutdyi4DQ565xLlb
 RzzyLBBGq0jNP5sy8yH3rXbBV638MFY54i3AgutCOHI867v0cgQVU2hYNd7SYQSzlsWK
 tbc6VYW0lNZRkz/JNn79cUInqar/wIYt8ygqPmz/LLyWqJ+3fVaxPBmXMLb+FXaIGoU2
 ubK5y2UaPvWcUC9WGmQzuVgHp6Wgmk04u02gv4+2gqESZLdoQL7Yvm7GrujyKEqao3PN kA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f1xr8kejp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 07:42:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awfv6Q9ZZT3gmGRsE0cDXaZho/H0hEXlznrnpOOwJXwKUaAstXySrGxKQ+7ShDlDvSmQGBYN2UuWGlxwTIzThTcotSKcMtHbmlb5tGW+7JFV/qv5s4bVrJjsCOo/QtW6sjvrcWjtil8WHVu3FQPWV8/B55yc+Km2duty9W5tgY9yv/v+U9Fe+BgPLBOmBjozwoduiQNH1DQx2xUwIv3OLYTjYEvckmmYHpFfVb7/3zyFeWiP64a1Xmwo+Xs+sf8lCuZ7VarSgRu0L3WqACKNk6V+eu9vBbJiYjTvtci2yo5OrOCTrFlnjYK8VtIhiBzdSeCOvgR/wECb9CXANf0yEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwJkVDfi6AczydcqolOZnlB9jtC492q/o/7W05V4wBk=;
 b=NfK3puRt5vcEcih1V/MSHWQAwrbHA8vV/hh/I20dhwYeZoEMLzW9iJdfj9nH7+sxHoxLpgPMGOgI+tx99XfdTXyCIlrISe9/H/fWoTcJgGNMhAtOTK0rDNT3w0d19qxw0k422nCF8RGrblgtlxirOKLEFTAPvtcWMNaJjssmtPZ9kuGzSRlO5e47mX83L+ZlDAPhd9Di/KxRNzrJUCyMGls7E5SXU+YwQSp1Q6tEpie87Pwk3MExSuMNIi83HNcF1g0Hux1cIym/cdqCUQ8SUZ4m1XFs812Viz1zPJKoD0amdLR7B6sW9Yrcnilr/e/bAobWopJgXHPa/Hh/jTl6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by MWHPR02MB2575.namprd02.prod.outlook.com (2603:10b6:300:46::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Thu, 31 Mar
 2022 14:42:26 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::2065:e953:bdd:ae4b]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::2065:e953:bdd:ae4b%6]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 14:42:26 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Jie Wang <wangjie88@huawei.com>
Subject: Re: [PATCH] hw/vhost-user-blk: fix ioeventfd add failed when start
 reenter
Thread-Topic: [PATCH] hw/vhost-user-blk: fix ioeventfd add failed when start
 reenter
Thread-Index: AQHYQr/UjujdHskRyUm4YOJ+EvLo8KzZlYmA
Date: Thu, 31 Mar 2022 14:42:25 +0000
Message-ID: <20220331144217.GA8689@raphael-debian-dev>
References: <20220328161546.917234-1-wangjie88@huawei.com>
In-Reply-To: <20220328161546.917234-1-wangjie88@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d93eb9d7-2787-43c3-c887-08da1324ac8a
x-ms-traffictypediagnostic: MWHPR02MB2575:EE_
x-microsoft-antispam-prvs: <MWHPR02MB25751F6B2C2916BBCA5E34AAEAE19@MWHPR02MB2575.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cr5JmEs0xk++LXZbAzNT3OtADjpq0bpn9qVo8p8My5l3UujdKaLoSvNADA4Rnwrk5i129bL6EmUZ77fp2X7EmVv4+ScehEVf/TiGENbk7Yb0sSU0KahIBRZFIAhQn5xuloNQ+LfCLv2CIgD78USZVRgon+Hhr/XYkm8wNNlKuapQOJXWbyUTwZkJURY840piyZ9VXv6YHfZErLB9TISleSeNUmq/CLypHpI0EB3fqICwcONiosSQuebS6Cwmw0NQkUREQrgsEUyVBo+h6KnLjeqqK8gKXNo0Nf45kqqR3XFbt4mPMl3aX6sM7hRObI+jBFW/VdIwSqH+vX1chMGv9QCn2b5UBLgZ7sWgCO9nvBoJLtVH3wMoAUbts7CT3awAnqDYB04vcCoXgYxH7DAQbS2b9wkhTa7Or+m2N9b71AxdQXiY4wYmqayNGJcYyjacRTH0JYwKJfobr3z4DihxcQYDjiNEu7YqaSTMfNiQHpbVdvmVEjvJHxZa3d5IRO0Xfur0islLssgG8qw+djKBqCb6WQH3Fl3O7/hUFlBIFBFixBFX2qKBRPHG3c/IANH+UDNIDg6gCiiE6Hg/HPgDZErDtiN1HT97E0O+lUVqWRbDjbCVRRZplfkD9Id6cv935R9SL/y+mxcXHDOp+oVICN30kSnV38TQtaIQCsPWWDMg5h/wyP5l3gY3Ezc1tFzQzxRb8wknWW2c/9Y4VSrytw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6916009)(122000001)(71200400001)(33716001)(54906003)(38100700002)(86362001)(91956017)(4326008)(316002)(38070700005)(8936002)(8676002)(66946007)(66446008)(1076003)(66476007)(64756008)(66556008)(76116006)(26005)(186003)(5660300002)(83380400001)(6486002)(508600001)(9686003)(6512007)(6506007)(33656002)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uh16Y6iKOrrcsSDI8mZ+7qIeRhaJ1MKMYtGtNDCa6hLGiZyKY/QK6B8F2vsk?=
 =?us-ascii?Q?ElzfGaov4dEK6YShwXhWBPI4mAIVHdjCQ5IieO77uOfeXNEIXxZeALg0iqCl?=
 =?us-ascii?Q?ZveGhmVMcu8Kf4qY9CLhak2lJNIzx+LM6krRpwEU3Y3SbVLV0dyiHlfut9BA?=
 =?us-ascii?Q?p03hj1TU5Mi+wxLpIAX1Gi+AhciTpqdZ1gV3Q0xLvcaZOX+XbXCmDm9ss5Hn?=
 =?us-ascii?Q?QPjG5eYAYdJy+y4rBA+07+zLIal3IWcj+pP0YWF2xZXQvpW5JKG8nk9Gc3d2?=
 =?us-ascii?Q?AminhvBEI6FcBzydJgKG7llQ6EMmwRPx+3jHVThYGhnwZ28Yg15eeokjBwhs?=
 =?us-ascii?Q?hvENa/nW3eMhqtakOi2BmnpUgzprL5oy8NFpIUlUaEJkBZ3zXPBP98Ja3a4L?=
 =?us-ascii?Q?eKG1TXGnacAO0K2kV1/I4y41v+s6hvlChErtJhmjHQOVa/vScrQgEYuAYrC+?=
 =?us-ascii?Q?M1AN6BdlSP2J8kLbZ3lpfpClyQ/vOUpnRiOGkSWsIpk+RqBZ3HHuR9KvYSnr?=
 =?us-ascii?Q?at6ePIN9K89V2TtU1l/40o0kPWjAR9AfdhBMhp/BJqSE9zn5QpfPL4M9irNK?=
 =?us-ascii?Q?nHQaIfhkzZvjQoO4M6na7qNAIaCICML7riOkupZ/fnWVE90KFeo20jyf6y3d?=
 =?us-ascii?Q?Oow3jLVD96VYT9/zWPhRq5XA+GqGkbUdGBM2mufG21/Dcqszt2peUOWU5Ket?=
 =?us-ascii?Q?0SqNomDkKUNF4EuKi/m0WmFH22277tWMhv0AcBUiNGzt2StqxwPk9bKGo2Vb?=
 =?us-ascii?Q?O8jyVVIZ6SzCjyFnZcqPWeqsUaQAQVRgj4QiTV9NVYypNMGs437fDS237H98?=
 =?us-ascii?Q?6kqgbvZa6ZtmxLwoyEWak5EGQWyZK0LsWZSW1xiCCP7EmcHYeGs9sgj0n+q1?=
 =?us-ascii?Q?UceU9ftEO8UeuDXNToeJ3nEfFzYmIcgyb5aert0sWULBkiVwmqL/YC/K1iVN?=
 =?us-ascii?Q?vTAIS3NiK3RalA9TJ8L4QHPgyi/arnoYAf0j/1eI2HcX/jz6qRMLzN4Cwezv?=
 =?us-ascii?Q?vAFNmCh72BN0FKyFhBKqwHRq0hXLKVyvyVsQAxKgaO4R3ndX/RatPqItBxdm?=
 =?us-ascii?Q?9oIbuH4YfHON2rEMY/I7nYZI3ege+6hHMK1zWq8MwcNt7nxLfRLAxjg4u/N7?=
 =?us-ascii?Q?s1bSKbGZZjNgZiiVskNSicw6pr2dBcHu/ZX/jYyE/Wtk1Lej6GzT0TRyTeKU?=
 =?us-ascii?Q?YwVXOADCMsZMcBtowQyof0DhGKPC9TmJNyN7I3yYvmGmOkK5abZR2HCjrLMY?=
 =?us-ascii?Q?+GsSDiAavoGs2sxaW/W2FXZ2epvzNgrDeBSv7Dh6Nwze+h208K4MmWsgCv/P?=
 =?us-ascii?Q?QVpEgDNU9YCIW+zscwOB99YShFd3DUYer1FUaVi7L90UJk88fGR5wJjFCAML?=
 =?us-ascii?Q?/g1R4twOXEDCaJ2qAzYSfs25bsO79/ZnyVyaquelcS3z/3UzNl5lvFTigZTy?=
 =?us-ascii?Q?VrjojfdAEiZc9acHT3amcUQmPpjHXN/dYecUrAlXG2BjJ/TTD4zIRyIVWdkP?=
 =?us-ascii?Q?PUyd6g08TU6FfAWpRPGRfQXou3giCyaGaLu1OC0MpDjo5p3bc33WPyCEcmpr?=
 =?us-ascii?Q?CdBPkoo96bcfoGcqp+Yp7zDps6fFD1IT1zlK9u8oc2827nc0fM+xCxJZnN5o?=
 =?us-ascii?Q?C9UyxI0y5Kv7ZDpLVVujN99BCddCOFITPn64myTNHfQVvo0lqDDv7a+bI1xL?=
 =?us-ascii?Q?gRUTY7pcYnInyI2+ygp3evDS70nNsokyuves8hIi0tlRFiJVLaSeGwZ9qung?=
 =?us-ascii?Q?2loWjNtdfjt3nPIYZCeTydanztC7cszH44rvqFGS7cUSxRHfYshD?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C94D24CE3BA53D41AC369FA2DC14DC90@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93eb9d7-2787-43c3-c887-08da1324ac8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 14:42:25.9905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OzAHsSStQZiOp1qPvZ3Vc8p6vmW6VyGNc6YbUei9yH9bd4DR64e8+kpDRDLuXR0urFgiBPOtB1wDr9rg0cx0YhoeTW+Pkz+y2+fOREI1fwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2575
X-Proofpoint-GUID: tMslYfVQmbAbXLMTlGYDL36Ygplrfm0M
X-Proofpoint-ORIG-GUID: tMslYfVQmbAbXLMTlGYDL36Ygplrfm0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_05,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "weidong.huang@huawei.com" <weidong.huang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "hreitz@redhat.com" <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

High level looks good but I have some questions.

Rather than a new boolean I'd rather we re-used started_vu by changing
it to an enum and having different values for starting and started.

On Tue, Mar 29, 2022 at 12:15:46AM +0800, Jie Wang wrote:
> During Virtio1.0 dev(start_on_kick) in vhost_user_blk_start process,
> if spdk abnormal after vhost_dev_enable_notifiers, then vhost_user_blk_st=
art will
> goto vhost_dev_disable_notifiers and reenter vhost_user_blk_start, and
> add ioeventfd again.
>=20
> func call Process as follows:
> vhost_user_blk_start(spdk abnormal after vhost_dev_enable_notifiers)
> ->vhost_dev_disable_notifiers
> ->virtio_bus_cleanup_host_notifier
> ->virtio_queue_host_notifier_read
> ->virtio_queue_notify_vq
> ->vhost_user_blk_handle_output
> ->vhost_user_blk_start
> ->vhost_dev_enable_notifiers
>=20
> then kvm_mem_ioeventfd_add will failed with errno17(File exists) and
> abort().
>=20
> The GDB stack is as follows:
> (gdb) bt
> 0  0x00007fca4264c81b in raise () from /usr/lib64/libc.so.6
> 1  0x00007fca4264db41 in abort () from /usr/lib64/libc.so.6
> 2  0x00007fca423ebe8b in kvm_mem_ioeventfd_add
> 3  0x00007fca4241c816 in address_space_add_del_ioeventfds
> 4  0x00007fca4241ddc6 in address_space_update_ioeventfds
> 5  0x00007fca424203d5 in memory_region_commit ()
> 6  0x00007fca424204e5 in memory_region_transaction_commit ()
> 7  0x00007fca42421861 in memory_region_add_eventfd
> 8  0x00007fca42917a4c in virtio_pci_ioeventfd_assign
> 9  0x00007fca41054178 in virtio_bus_set_host_notifier
> 10 0x00007fca41058729 in vhost_dev_enable_notifiers
> 11 0x00007fca40fdec1e in vhost_user_blk_start
> 12 0x00007fca40fdefa8 in vhost_user_blk_handle_output
> 13 0x00007fca4104e135 in virtio_queue_notify_vq
> 14 0x00007fca4104f192 in virtio_queue_host_notifier_read
> 15 0x00007fca41054054 in virtio_bus_cleanup_host_notifier
> 16 0x00007fca41058916 in vhost_dev_disable_notifiers
> 17 0x00007fca40fdede0 in vhost_user_blk_start
> 18 0x00007fca40fdefa8 in vhost_user_blk_handle_output
> 19 0x00007fca41050a6d in virtio_queue_notify
> 20 0x00007fca4241bbae in memory_region_write_accessor
> 21 0x00007fca4241ab1d in access_with_adjusted_size
> 22 0x00007fca4241e466 in memory_region_dispatch_write
> 23 0x00007fca4242da36 in flatview_write_continue
> 24 0x00007fca4242db75 in flatview_write
> 25 0x00007fca42430beb in address_space_write
> 26 0x00007fca42430c25 in address_space_rw
> 27 0x00007fca423e8ecc in kvm_handle_io
> 28 0x00007fca423ecb48 in kvm_cpu_exec
> 29 0x00007fca424279d5 in qemu_kvm_cpu_thread_fn
> 30 0x00007fca423c9480 in qemu_thread_start
> 31 0x00007fca4257ff3b in ?? () from /usr/lib64/libpthread.so.0
> 32 0x00007fca4270b550 in clone () from /usr/lib64/libc.so.6
>=20
> Signed-off-by: Jie Wang <wangjie88@huawei.com>
> ---
>  hw/block/vhost-user-blk.c          | 12 +++++++++++-
>  include/hw/virtio/vhost-user-blk.h |  2 ++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 1a42ae9187..2182769676 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -124,6 +124,13 @@ static int vhost_user_blk_start(VirtIODevice *vdev, =
Error **errp)
>      VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
>      int i, ret;
>

I would like a comment here explaining the check.

Also wouldn't you want to set starting irrespective of whether
start_on_kick is set?

> +    if (vdev->start_on_kick) {
> +        if (s->starting) {
> +            return 0;
> +        }
> +        s->starting =3D true;
> +    }
> +
>      if (!k->set_guest_notifiers) {
>          error_setg(errp, "binding does not support guest notifiers");
>          return -ENOSYS;
> @@ -178,6 +185,8 @@ static int vhost_user_blk_start(VirtIODevice *vdev, E=
rror **errp)
>          vhost_virtqueue_mask(&s->dev, vdev, i, false);
>      }
> =20
> +    s->starting =3D false;
> +
>      return ret;
> =20
>  err_guest_notifiers:
> @@ -344,7 +353,7 @@ static int vhost_user_blk_connect(DeviceState *dev, E=
rror **errp)
>      }
> =20
>      /* restore vhost state */

Can you explain the case where we could enter this path? If the device
is starting and there is a full reconnect, why would we want to enter
vhost_user_blk_start() again? Seems like allowing it to enter
vhost_user_blk_start could cause the same issue?

> -    if (virtio_device_started(vdev, vdev->status)) {
> +    if (s->starting || virtio_device_started(vdev, vdev->status)) {
>          ret =3D vhost_user_blk_start(vdev, errp);
>          if (ret < 0) {
>              return ret;
> @@ -500,6 +509,7 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>                                          vhost_user_blk_handle_output);
>      }
> =20
> +    s->starting =3D false;
>      s->inflight =3D g_new0(struct vhost_inflight, 1);
>      s->vhost_vqs =3D g_new0(struct vhost_virtqueue, s->num_queues);
> =20
> diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost=
-user-blk.h
> index 7c91f15040..6e67f36962 100644
> --- a/include/hw/virtio/vhost-user-blk.h
> +++ b/include/hw/virtio/vhost-user-blk.h
> @@ -51,6 +51,8 @@ struct VHostUserBlk {
>      bool connected;
>      /* vhost_user_blk_start/vhost_user_blk_stop */
>      bool started_vu;
> +

NIT: Spurious newline

> +    bool starting;
>  };
> =20
>  #endif
> --=20
> 2.23.0
> =

