Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE8F4FA067
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:03:54 +0200 (CEST)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncya1-0006UR-KK
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ncyYi-0005hH-5U; Fri, 08 Apr 2022 20:02:32 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:38638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ncyYf-0002kf-L9; Fri, 08 Apr 2022 20:02:31 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 238Ehpbo029532;
 Fri, 8 Apr 2022 17:02:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=7Z+ZVWJ000nq68W0W0USMmxdbYC0vdhnhvlXCNls11Y=;
 b=IcPQW/EXCZ5mSUlUE/+6kHJTZMwmEriqT9fv1Ec2yzrT3JyAKX44kd15kW7L/XGMEM49
 OICzBw0UAKDgBBj84FVpKJxv/wC1V/y24fOgtxfLMw2d2xBpjloXH3g/1Lryw5KV15KP
 0fZK9PsmsjK7YzdQNwe2T9FzIpfpUgt61bH/wDdF9AC3VK1IbHS/6o3STKcCBPMZjHkB
 04RyweVbAaRcvP3IqqxPVnUDX3iPnPCDiHu7a2gcktoOydqqxTzRTyhLF0YYFHbUAbCB
 IcL3GKX3iHRCaMdFVI+65XHP7/6KqR+bR3A7luyogGJKnsu/KB/iFLeuKVsLVErBTe99 bw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3f6ntn6m3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 17:02:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAcvq+WrnwBBYFRpzXBvgXa4PKhoANXWn50b1UcElkgyrlvJMYajme1uKJ1lTmEV1ZwiOCvI5gb8KARCHcau/qRWObH4QEZWiL2pib+3irR3mKqIuVjLPzalgTnyxyaOz0P8DZ6Wsv4MyUHEYksO2tVUpxD5WnG8+oBCOFwS9iBG6rJOJQvrrSxl+rC5r/zzbeK/NyWpg5iv3O6ejLVjvl8cPPdNJCzxh2VkDJ89jIbgioNjUUWj1SUvKbkHRrZ4aXWpmin+ryaJVDxFv2x61jJThHgPnP+izGWf/8CZlDWYzI/pJ03sEqE2fWh7F9EJuOJlwpB4qgjk7N3Y/nJjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z+ZVWJ000nq68W0W0USMmxdbYC0vdhnhvlXCNls11Y=;
 b=Dd7oMBOGdf9gOPv9baNhqczSFleBSeB3jC68DflROGdyrZ6bhQPQRbK53Wkrki2I+fL485j6sx/PLUeeGWBYLNiSp7PgGo3SXcXAUtZ2szSA5jXYgWbPmvSf9OsDq7AUlFq0e0hRvpM8OvyRRSvAIarycc1dOtLe7AqB+CcU/rOJucQvB63FxNyhJrW+lhtzHNyI/jdO6KXNmPthITSoGpPhV0O8rtniU3iM7w80vcCCbltt4HKjtl1FY8vgqCqgT1t7hsVO9PUTdftfYgDmHyX9X4AP4cck0EpvUMGjxvMDhdR6cWYtOO8Su1T03kRE8fkMENzpcInGHDtlMluXuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BN0PR02MB8191.namprd02.prod.outlook.com (2603:10b6:408:152::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Sat, 9 Apr
 2022 00:02:24 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::2065:e953:bdd:ae4b]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::2065:e953:bdd:ae4b%7]) with mapi id 15.20.5144.026; Sat, 9 Apr 2022
 00:02:24 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/3] docs/vhost-user: Clarifications for
 VHOST_USER_ADD/REM_MEM_REG
Thread-Topic: [PATCH 1/3] docs/vhost-user: Clarifications for
 VHOST_USER_ADD/REM_MEM_REG
Thread-Index: AQHYSoS31imWElZeIEiHnN8afp08nqzmtSGA
Date: Sat, 9 Apr 2022 00:02:24 +0000
Message-ID: <20220409000221.GC10957@raphael-debian-dev>
References: <20220407133657.155281-1-kwolf@redhat.com>
 <20220407133657.155281-2-kwolf@redhat.com>
In-Reply-To: <20220407133657.155281-2-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35d6d926-a650-4815-433e-08da19bc3a28
x-ms-traffictypediagnostic: BN0PR02MB8191:EE_
x-microsoft-antispam-prvs: <BN0PR02MB81913B0819293881029818C9EAE89@BN0PR02MB8191.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7/FzEUdp2AHhA5VEMXJ7nJe1vMfpX4vqZW40QOvaJhsOJOOOFseUTTblOb5gbR+ZXeZINcd5+FBqaCObe8VX3Wa1KfoCtyObDgXWpOP46F6BZMHWqu0zXXcOiGnnbs3pfJ36/XAsEThuPZkLZbIUqe8HycGHxVhdoQG/0g8KZVtEkXAMGVuaDDZ9zo1JT/RDnEmq7QK7r8vNFtGfSd1+JWLINDilz/8JzLcXz2CS7RG6umsuzESdBT86dU3dF2w9r+IrlUZ5mLl4bQ2JXj3gaAuMirn6E2jeiFVflhdMMor1SLGIFYrtsX7iW+bsjzhXIDVXz6HqTSmmYEqYLPncftwFCZkbvgO+qbOurYzHQBQvXuG9WC5p0yvj3kdTb60zbhRb7phwZOkGe+CcJTNJu/AuRyKcfL1xQ/wO6ryK1VTOQhfj0mONVl1kSMszmUDHw2yGi2J5OL4RvsG2pzBU/MjSkQSm0wHZF1ZbU9bNNP4x9gdDTtbMn2OsPsmA98imeAZ/6R/cgd2RgTdk/B5/6ff6VVCaZfOjyAoxyfQq99hovBbD7YRp5A38fNtmAvixEhapSmpjGgYI6MAvITNXWyYad1Cpq43SmD5519SxzT2EE1Zh/I4CAlvCSLEDowpGz5xBw1WbcapdOfNVcokoVV6SJiYWKDPX60qWgJ0zaDngXdC8zHHH+xFdDmfsKle8SHVXJctd01InOvZYB0Vd0g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(76116006)(64756008)(66446008)(66556008)(5660300002)(66476007)(4326008)(8676002)(38100700002)(186003)(91956017)(6486002)(66946007)(44832011)(122000001)(8936002)(6506007)(83380400001)(1076003)(6916009)(54906003)(2906002)(38070700005)(86362001)(316002)(508600001)(6512007)(9686003)(71200400001)(33656002)(33716001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9NWmKC84C8OOgz1bouFjauAQ1Dxj/qgHilpX1cAmt0t19bNgCiGZ0a2H+192?=
 =?us-ascii?Q?0+ExVPFugA4MrKgLD+s6dG0tRWWtohQxZRnc8z7XULngf/6EBw23lj/CNF+r?=
 =?us-ascii?Q?MDBLqOOmOXNs9QHnCSf99G1AzehpL22IWm7gexguVjXumvts3iGwjZeH7HhA?=
 =?us-ascii?Q?mdltftmLqgpvOKy5UtjaMHHNZlvWGtuCT1UE56hjJuMhOOrviadGQabTaH4j?=
 =?us-ascii?Q?0VIzd0ZI+IqM8YndoXQnBUm2w9K5tW5HhERvvNALg2JQF1pfTSVwAKs+/g59?=
 =?us-ascii?Q?5jMNl3hqoNDv0sjmT7ecJ4/SXI1yahG6UXh1tA4XslnqsXC0rClZwf3tE4C/?=
 =?us-ascii?Q?Mm2LFkqh73XKl0FJ4YFED1AxRRnx459NpmrXZfS9i4goQdXNuVtI3SANjfn/?=
 =?us-ascii?Q?C+MOtJucVy2LIaVB2tw//6wvd9PU3cX1pQvyRqt/6pzPWwRzwiVc5++ZdgP0?=
 =?us-ascii?Q?u/8FUX6Tb7ryPKCOT8XSIoT3maL0oW3SP/kakJgFZFAvIg7WTJklMd673d2p?=
 =?us-ascii?Q?i06hvM8MygGU9gYLxEbDYENTJ3okui65TIxCFvwHUlwbM8Pc3M6S4wNm/41P?=
 =?us-ascii?Q?FioLxacwPXdNILV4TvpwipFau2pSJ9pZHc4R+D9vrOHlvwE2YbO6kAZp1o1a?=
 =?us-ascii?Q?MRnbpTdMyTFCLO8XKHP1EmhqhCR9v2nCAeUMJYr6cBqMSdl+aDJST0UYcYEw?=
 =?us-ascii?Q?PYyBTHOFMu14lKY57MbUM3pTn5rThkQ1dJCuqzSlVSpAFThs801nj9iedxwB?=
 =?us-ascii?Q?bzqJyDTL981orLylAGwA/lKlKDnvPABdprCgluB7GmGZVpexw83r7QrJB+wJ?=
 =?us-ascii?Q?C7pOvfoSZrfV4IQUAMVcVFjmYryJZXb08hzKlPsdam23gF8PbcuVnOYS10kV?=
 =?us-ascii?Q?RYCn4XAznj65UStFKsQfaWhef2G8fbJQnR0jXKIUK2gN8KGdbrdxxYcz904F?=
 =?us-ascii?Q?5cOVmaKAZURRDua+WI7/2TGWyusUZD9KBBamo3UkN0ttcSl4R/KMLFd3uKMi?=
 =?us-ascii?Q?d50rhMRVSAtD5yDXFt8fAzQxW2BBlcl+JbyA+WBS5uP/gD6hqw2Ed7qd3Kwv?=
 =?us-ascii?Q?R5aKvC9wOob3G4Mv9z5HJg3w9kkWFsA38pQ/f4EtIFYAYnHkKNhgzEwR0MGg?=
 =?us-ascii?Q?QlBEoQDMXWbEazIhW/mW5z2wuwCsbk+akWZPoD07jQDTajJdc6NxrbHrnu2i?=
 =?us-ascii?Q?xA/ZPekjI2s9kNMOEEWm6cyEsN+2Qddqjv06Ny44r2PMJ4EAWO1Pu4pDf/fM?=
 =?us-ascii?Q?kv5w4xJOHeFls5tEsUL0NW8pYJAxv4wAj7HstUKogYLJ89ahIbeZUpnATOBl?=
 =?us-ascii?Q?ytmPatl0u0NfGMd4Pau6KhpQ+x2UiLGXchVMrG/xrtMogUXPOwp3duUpSNCC?=
 =?us-ascii?Q?2tQr/JOkWi1Iw5Vyg/rLoOcoduNH0wiKoi3vWGCyOvQlFlpq5PAi85MHumU9?=
 =?us-ascii?Q?ArfDNsm8/EwRaBhwCPw7UAqMJygm1kaViYNW8E3v96V/VgwMoIhlyYpWFCj0?=
 =?us-ascii?Q?KoujvnfPiZMZExPytNnHL9NID0ELChlLl+PIHb7BdyrG21794d4o8b9WhcaK?=
 =?us-ascii?Q?pZoh+mypyeFnXe6TfHbf7N3Vgw3fb8w6tJj7aygHlAec8qCZ0Dk0WLcPx+Te?=
 =?us-ascii?Q?n1aZYqra1KruiBJ3CcgKOMbtskrHSvU3mg9KgqALLJbcoYfhY2S+hMqU5ha8?=
 =?us-ascii?Q?MlPaGtP+i4K7umM2HO8XHwAjBbl6lBu/jshhLPhRubf1ooGg18SQUYmKI8Od?=
 =?us-ascii?Q?EgLRFvt9ESBDZQP2lBAUFhHMk7arC7/FEcjCulgPI2/VSN9Byw9D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <23BE0B1389404E48B4612B16B759501A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d6d926-a650-4815-433e-08da19bc3a28
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2022 00:02:24.6140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7BM2CIWoPCgveQtjW8AohsydVnOfa28SmM3Dn/lQ7N6VJB3Fp/ZeKBwuM9+YDIe7zYSUv2zCFeT1Z3vVBGCC4PBYO+HfRr2tYbbAmtx/do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8191
X-Proofpoint-ORIG-GUID: 9sAvHi5mwBQjsZ6Eew8LAELdQ8TXzBvA
X-Proofpoint-GUID: 9sAvHi5mwBQjsZ6Eew8LAELdQ8TXzBvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_09,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Cc: "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 03:36:55PM +0200, Kevin Wolf wrote:
> The specification for VHOST_USER_ADD/REM_MEM_REG messages is unclear
> in several points, which has led to clients having incompatible
> implementations. This changes the specification to be more explicit
> about them:
>=20
> * VHOST_USER_ADD_MEM_REG is not specified as receiving a file
>   descriptor, though it obviously does need to do so. All
>   implementations agree on this one, fix the specification.
>=20
> * VHOST_USER_REM_MEM_REG is not specified as receiving a file
>   descriptor either, and it also has no reason to do so. rust-vmm does
>   not send file descriptors for removing a memory region (in agreement
>   with the specification), libvhost-user and QEMU do (which is a bug),
>   though libvhost-user doesn't actually make any use of it.
>=20
>   Change the specification so that for compatibility QEMU's behaviour
>   becomes legal, even if discouraged, but rust-vmm's behaviour becomes
>   the explicitly recommended mode of operation.
>=20
> * VHOST_USER_ADD_MEM_REG doesn't have a documented return value, which
>   is the desired behaviour in the non-postcopy case. It also implemented
>   like this in QEMU and rust-vmm, though libvhost-user is buggy and
>   sometimes sends an unexpected reply. This will be fixed in a separate
>   patch.
>=20
>   However, in postcopy mode it does reply like VHOST_USER_SET_MEM_TABLE.
>   This behaviour is shared between libvhost-user and QEMU; rust-vmm
>   doesn't implement postcopy mode yet. Mention it explicitly in the
>   spec.
>=20
> * The specification doesn't mention how VHOST_USER_REM_MEM_REG
>   identifies the memory region to be removed. Change it to describe the
>   existing behaviour of libvhost-user (guest address, user address and
>   size must match).
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  docs/interop/vhost-user.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 4dbc84fd00..f9e721ba5f 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -308,6 +308,7 @@ replies. Here is a list of the ones that do:
>  There are several messages that the master sends with file descriptors p=
assed
>  in the ancillary data:
> =20
> +* ``VHOST_USER_ADD_MEM_REG``
>  * ``VHOST_USER_SET_MEM_TABLE``
>  * ``VHOST_USER_SET_LOG_BASE`` (if ``VHOST_USER_PROTOCOL_F_LOG_SHMFD``)
>  * ``VHOST_USER_SET_LOG_FD``
> @@ -1334,6 +1335,14 @@ Master message types
>    ``VHOST_USER_REM_MEM_REG`` message, this message is used to set and
>    update the memory tables of the slave device.
> =20
> +  Exactly one file descriptor from which the memory is mapped is
> +  passed in the ancillary data.
> +
> +  In postcopy mode (see ``VHOST_USER_POSTCOPY_LISTEN``), the slave
> +  replies with the bases of the memory mapped region to the master.
> +  For further details on postcopy, see ``VHOST_USER_SET_MEM_TABLE``.
> +  They apply to ``VHOST_USER_ADD_MEM_REG`` accordingly.
> +
>  ``VHOST_USER_REM_MEM_REG``
>    :id: 38
>    :equivalent ioctl: N/A
> @@ -1349,6 +1358,14 @@ Master message types
>    ``VHOST_USER_ADD_MEM_REG`` message, this message is used to set and
>    update the memory tables of the slave device.
> =20
> +  The memory region to be removed is identified by its guest address,
> +  user address and size. The mmap offset is ignored.
> +
> +  No file descriptors SHOULD be passed in the ancillary data. For
> +  compatibility with existing incorrect implementations, the slave MAY
> +  accept messages with one file descriptor. If a file descriptor is
> +  passed, the slave MUST close it without using it otherwise.
> +
>  ``VHOST_USER_SET_STATUS``
>    :id: 39
>    :equivalent ioctl: VHOST_VDPA_SET_STATUS
> --=20
> 2.35.1
> =

