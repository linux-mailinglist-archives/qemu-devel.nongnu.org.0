Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1292DC166
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:38:22 +0100 (CET)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpX0Y-0006II-12
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kpWyW-00050R-Iq; Wed, 16 Dec 2020 08:36:16 -0500
Received: from mail-co1nam11on2067.outbound.protection.outlook.com
 ([40.107.220.67]:49505 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kpWyT-0002px-NB; Wed, 16 Dec 2020 08:36:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jgv8wjHkTkGOJ0ZOJogIZb+hxzDat0gpe4VtqPbOYVhbmdfPpbGCaEXgIjKuU3yh/RkC0geBULMmiJ1Ld2TDWO0kROC12m3ldDjlDqDSmiDYR5cWXpOb4JURfjwO7YqurrHXze9716P/EEiajBr6rlARBZH4mlFWAbv7kwZIISOSh/2W/CxZqxPFQT9kt4AA2ntFDwWOp8dfFStb4uHZzmIfdpDd+iFF4l43WVjl2LZf0D73Re7AjrIDc++5N8K0wyDcARXx+o3kv/IJvAPZEnjJV9whfZl2AOTNHj+N2RH5PMwOF1m0xez6seixBKwOxzL316Kjh74fcujbmihw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMKdORwmKYBcCzK3dpdl+2ca0l9KNBND5uGJXfpWdKg=;
 b=AFAfNCwEv/d0S0NSmYAu0nquG/xaKswSupPTFbRrBlYLvHD5KYMjuJze+2793hMiSpVZXZtSBdrvqaFmPvo+oh8oYUoC+lmYJIs+hNAIqrYiNIKIVopf87auDVFaGj+V/RY0e2izxipG0gMrc3hYM6gBPWMI3vivl8dSssc26vauaUUCPeGnIa9awXPUuXYeOb2lSGey3MqtPz9rqdZf6tvba6iw8pP/yUlN6rNTkIhtM5lIqrB5qrRitz3C0z/fGd9QbGHbeX3vVW/cQeQvxEMsyufYSdTI69iJvQsK0GXqiUNEhdLfvaXrrDG4rRYg+vVrQ4kWfEYRuKmIwF9QGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMKdORwmKYBcCzK3dpdl+2ca0l9KNBND5uGJXfpWdKg=;
 b=sVFPrea/y1zwIVlxXzEWewOSwd3186hbkKuLSoWU5aaq5CXNDDbKtibaWXpSf+CJdLi5iVcz5ZTXniv0h1TFJksH2gzR5t16/kaNyoEjLmLNoqA/4gHGmQ8/zzBXxMRQmZyo8RDjPn9AG0MpiBrE5IjIFyKw9ciWsHF2jKjSfmQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4134.namprd12.prod.outlook.com (2603:10b6:610:a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 13:36:09 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e%6]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 13:36:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201216134039.41655931.cohuck@redhat.com>
References: <20201125105417.380317-1-thuth@redhat.com>
 <19721a4f-d566-44d5-6eb6-ff892e5cb502@redhat.com>
 <20201216134039.41655931.cohuck@redhat.com>
Subject: Re: [PATCH for-6.0] qga/commands-posix: Send CCW address on s390x
 with the fsinfo data
From: Michael Roth <michael.roth@amd.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Date: Wed, 16 Dec 2020 07:35:27 -0600
Message-ID: <160812572788.1486402.16905131104247654068@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [165.204.11.250]
X-ClientProxiedBy: BL0PR0102CA0063.prod.exchangelabs.com
 (2603:10b6:208:25::40) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.11.250) by
 BL0PR0102CA0063.prod.exchangelabs.com (2603:10b6:208:25::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 13:36:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f2e6fef-8413-4e67-6aac-08d8a1c78c69
X-MS-TrafficTypeDiagnostic: CH2PR12MB4134:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41341C31D78B8A66E47865BA95C50@CH2PR12MB4134.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBoQEKH91gQ03+r5cE4g6fkBEzxj9RG1iWwTRfjXZzR6g1bYenG+awTwW4+ISBzD3iBImlnsPwkWdGP9LBLzwiQHfbQKfJt4Qk7J8oeSIr1/iXeofwi4LRoc902KJIVVDDhQk0ptHndbPla7ImvvCKEZtro9jw3fNonALL7vwOAWA/xyMJeVTFJs0+TqO6cDk3wYUFhxL/3ao+tnxrzjzhh/VFCaqU2LAlohqUZ8GxuM8C5oP09gPi1KDtS8bm7+nUCv2/HMwEwbUsLT5PbEdO6Nv4n8C6l1ezN8Dt6Y/kV5TgPQ0deAuat7o/x+53ln2FZSXs5UlEh6zr+8WgRo0nyk5Z1lnhGm1qXCSwmQH/1UhijEx3jIVeNE4Mab/Ov3AOrfVORoDU6wQc/WEXTDCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(4001150100001)(110136005)(5660300002)(44832011)(966005)(36756003)(956004)(6496006)(8936002)(4326008)(66946007)(66476007)(316002)(66556008)(2616005)(83380400001)(26005)(86362001)(186003)(45080400002)(16526019)(52116002)(6666004)(8676002)(2906002)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RUlqUk02RWZod1RXN1lmaWY4aXlrcXFPRE8yQnJrSGZaRW1mNWxjd2xJc2Fl?=
 =?utf-8?B?bGRZd2JyaWhCNXpJWUlhNERSdXMzZUhJSVQ4dHhaRlNrZUFSZjZPQ0Q5eFN6?=
 =?utf-8?B?K0ZDWUZ2ZmJ5bEpFWVUvaUZmLy8ra1QvZVM3alVtZG9jZ01yNjVsaFlUanAy?=
 =?utf-8?B?K2ozOUhVWDYvWnNSRDJLTmg2Q1VlUkJkRVM5dzRlaW15Y2MveWZTdjA4QXZt?=
 =?utf-8?B?WDdLaUZER05IL09lZ3RYOWxQSWl0TjJ1dXBNR0V4emI1WXVlbzlQZ1ZVWGtS?=
 =?utf-8?B?Q09LbEsvVFI3emV4Y3UxRmZwcmtpc0VTUDZtS0dUQm9adXBwTmJkOGo4U2Rt?=
 =?utf-8?B?ek1OR3g5UVZweVptMDV3MDFXMVpkbG5zdjBUaUVoY0xzMTlhMDVIUWJabDdX?=
 =?utf-8?B?OG1lWFRnNElGbGU4bFZUREhFdjdHT0lYeUZIZkxWTEtHSmJRNDVGRSsyaVRE?=
 =?utf-8?B?VHdoVTFsWkJWaHYwVmVUY3VxTHZVTzlyRlI4Ymx0Zm85WnB1V1lqUk9NdGhk?=
 =?utf-8?B?K3RMUDhOWUM0a3VVNW9Mc1pwK1psOU5oNTZDVjk2NzVvVDVwdWMrbG0zbkF1?=
 =?utf-8?B?UW9tN2pEZmVETC9NT2xOWjhTVXk5OGprMUN4ekowUzdySDVvQ1hac0RaYmpH?=
 =?utf-8?B?U0tvSEFhVXBLYjBXTFdQV05IdnVVR3EzVVdzRU1YNy9UYmxQemx1UHY4Mkpt?=
 =?utf-8?B?WHpaa1pKdXA5TWRQRHRVYTZ5dTZ6TUNZazJHVm41M2FkUWcyY0FsOU5PemRJ?=
 =?utf-8?B?U0dlaFdKQ2JBMVlQNnJKRGV5R1JtSDFtckNiKzlRY3lQd01WcUJRdXBXaFNV?=
 =?utf-8?B?YUxOQ3JiQzFhcUY1aUVxZjNlSE0wZWRhNEVYSERmbVZjOUF6TGoxSEdmSlJM?=
 =?utf-8?B?bEttWUN2aFJ2aHBtQWxraUp0dnJHTGdDRlFVZ3c3MlhoZmx2Zlk3N1JtMVNm?=
 =?utf-8?B?dXhuem9rOFJLSGVlcW01T2NEdUsrdno4akY5ajBEN3hSbFZkcE9CbmhSWjZK?=
 =?utf-8?B?RnZxZ3hUNWszNjZYT0gwTGx0SEtzc0xGZWZ4RW5PQnk5RDQwSVNvL3o0OUhm?=
 =?utf-8?B?ampndm44RDlsSFNLRnFsK0JaeGQzTWlnTTlIRW1BWE1WUjBxWUZPV3J3RVUy?=
 =?utf-8?B?ZmxUUVp2eVRMNjdydEhONGVTalI5elRMYTZZd1pORkVER2FnNDFJK1JBOEZZ?=
 =?utf-8?B?dUtjVk16SG1FSFpyZWszNkdKODhOOUtubEpzYWVaVU5lZFhCQzNnWWcxS1Ev?=
 =?utf-8?B?bXpEOEE4VGlRaG9ISWlJRHRDK0V0NHgxRG5xd3hiTXpuZFlvN29KNU42cy9I?=
 =?utf-8?Q?Mqo9rPQQWY5H/udgGb22w8JbyR5DtcMyvH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 13:36:09.7575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2e6fef-8413-4e67-6aac-08d8a1c78c69
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2L+W+FFe5REV2IQoo2g4xHqfa9TU1huVDl08bfT0aJ0Xi0wv3HkyZn7YS8XJudqYbbFezYgL+w4wJ7AD/O58pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4134
Received-SPF: softfail client-ip=40.107.220.67;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting Cornelia Huck (2020-12-16 06:40:39)
> On Mon, 14 Dec 2020 09:53:21 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>=20
> > On 25/11/2020 11.54, Thomas Huth wrote:
> > > We need the CCW address on the libvirt side to correctly identify
> > > the disk, so add this information to the GuestDiskAddress on s390x.
> > >=20
> > > Buglink: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1755075&amp;data=3D04%7C0=
1%7Cmichael.roth%40amd.com%7C076a9f00e76749e8885508d8a1bfd02b%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637437192500502101%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DnaAS%2B%2FEl%2BCRwkj%2Fbe0tVEI%2BfAHTQGgZ%2FcoS21pr4%2B3Y%3D&amp=
;reserved=3D0
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >  qga/commands-posix.c | 34 ++++++++++++++++++++++++++++++++++
> > >  qga/qapi-schema.json | 19 ++++++++++++++++++-
> > >  2 files changed, 52 insertions(+), 1 deletion(-)
>=20
> > Ping!
> >=20
> > Michael, any comments on this, or do you think that it ready to go?
>=20
> If nobody objects, I can also merge this (or rather the v2 of this
> patch) through the s390x tree.
>=20

No objections here. v2 looks good. Thanks!

