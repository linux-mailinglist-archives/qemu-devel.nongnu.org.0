Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E10852BFBB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:20:58 +0200 (CEST)
Received: from localhost ([::1]:58438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMPv-0005Pd-CQ
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nrMM3-0002B8-U8
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:16:56 -0400
Received: from mail-bn8nam12on20623.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::623]:63073
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nrMM1-0004EW-7v
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:16:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+1vmHGOhEAIUZVH8zTkGIhyzldz/Hyta3xP8bGE3tdC8NhfeA9CgrGW1daLrtVtbhQJFM0KVKZJChsxAoh2msn2OzGUTpuDg0z4hC5BIrkXLEL0XWMu3o3l7Ki/rJCpUPutLKuvy2PFOMPzksdXynXJu7wunQevMctxfngm27ksdnnIDdScofYhVuUx0tYnfCQdIOdbxKBNgJuQskxqZJsxZloJ6d7jg5Q44V0a+EAsxmdqA/60GZKs1WtI1smRgKHIY1cectYwXqSD4B0faEsFu3GmJCvC0GAcGcMWVlROuMl+hKsHYV11tL9ZERfHPg+MixNYYMey7v0VOfRvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lojoDlHA6VMQeUVm2dhI782J2Eolzd2hOOR8FEmoojo=;
 b=Py/uQzPTia/FNdpDfcaRp+74fFAzI2KUBpU4rSrV+qC/xeaN+qZLYH7gu8KlFof+q9u1wymx/YyyD9vlIYJdjEkz9Kr746qwk9JwRLFncPn7LmOQgYCP2U1JoFHZs3FhmwemmveWnEnSOvKjUErWqkQfdGFQmz5JcmMpgRZp7+qc/gKMnUaFQSPISM69Pfrgf3ajRdgajklZFJK8r7jgERIomAAU7U95auaH2izP3pij0FB1f+7rH4KBNhaJCoTtG+NptzlQ1zInys7ZPwqVjDgHtP4nOltNoPX2zR+s3Lflks7t06dP3+J/KejuntR1IRpGLgqDK2SENXX3hRynBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lojoDlHA6VMQeUVm2dhI782J2Eolzd2hOOR8FEmoojo=;
 b=PijxFuTjsrQKTQTF2wAxWCcmQI3fZpbm2JZshigcGYb69XJib/K9M6vE++LuigjsgxuGVxGBMfSjxQt9Or6s0uVwvZ2fldfr87f49lm7eWUbkAwXvIkf2IQk8e3Wb9RWGT7UlmJt67yiStjt9GwCNtsyJiY3mXDN7DI/0hf2liiadpDJllhd9fEjUzLxCIKf1om4UK+igYfrbfafUfBLHfsYPqBROcpz0llhS175M2/g1L/u27HVI2kHt/XCSM5XeRPe3CYJ5ZPV7siO4dOq6OASBFNvcYPZtXDwceWCSXIfHqJjJK+Vrk9X0Zwj0aXMXgqlkJyX95FcNiUi60WsYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH2PR12MB4873.namprd12.prod.outlook.com (2603:10b6:610:63::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Wed, 18 May
 2022 16:16:49 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 16:16:49 +0000
Date: Wed, 18 May 2022 13:16:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 5/9] migration/qemu-file: Add qemu_file_get_to_fd()
Message-ID: <20220518161648.GO1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-6-avihaih@nvidia.com>
 <87czgdsohs.fsf@secure.mitica>
 <970f0e4c-19bc-6528-2c4c-9cf7fbd5a789@nvidia.com>
 <87ee0rf43p.fsf@secure.mitica>
 <20220518154237.GK1343366@nvidia.com> <YoUYGhgILYFIwBvS@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoUYGhgILYFIwBvS@redhat.com>
X-ClientProxiedBy: BLAPR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:208:329::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 454b661c-bf30-4b6c-51f5-08da38e9cfb7
X-MS-TrafficTypeDiagnostic: CH2PR12MB4873:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB48735C4256141FC14D034DFAC2D19@CH2PR12MB4873.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8xOZJmJa1aSGeqEMVWIhWvZGEMtvg0cQt9MMtW3erJjvY//wiODnJWiebYNu5rDAmxLwEezyw2LSrMNyu092uSBJwbLwQsKbVBf7UFRgDwgLTPjJt2GIgikDkB3XAcGXzfe4kqAvBOtXt86XVo6g/IY6O8ND0P9/DKhBeMcEa7jkXpprsyqvLfAL0mLrua6jDSnD3kkZ4QruTR7d3bF17gGz7NzPYeZO9DvB8NKzT2Q39B5ZbonIcwh1R5SihiazaOzHE7CnPX0LCMq2QKaQHeNxslrDYFYgcMOOh00gNb3mvPRTL47sFe0yPJJV45zYtxounjWeCwTf//AWnAclZObcEj/Qt4a1CffsXFIGjmJ4U+PP5O0ivHUWHT30W1uaOTxRH9fmUDqQ7TAFGbSCBzJ42+OL0DYl56J8XOYejlfqWLjcVvH/Orkn1bOv7hhQGMqTF2ELmOYhtYR36H8mFprIb5+OBrrRopjWmKwhnNFOSBLXcOEa1BTbwe7QMnYrUsnxA0o6hL8+nsS6dBGinoy4ytTWrMja8pLsJWSnBoSJQg/PPZ5zROH86uYSBOOCRzlrgrgFAmWKbUNnCuusm9oVjAywDT9R3WBD4C9QV89/jupKDQ/ktZ7VR1lRM0vvRoFj5QWBalSddeao2Y8jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(316002)(54906003)(1076003)(36756003)(2616005)(186003)(6512007)(83380400001)(26005)(6506007)(86362001)(6486002)(66476007)(2906002)(66946007)(4326008)(8676002)(66556008)(38100700002)(33656002)(6916009)(508600001)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1dXelVReFhZODVHem5JdUhDVi9rZWJYZ0hHdm1hM3RhSjV6c1Y0NCtUanY0?=
 =?utf-8?B?K3AyY1J2MTNpRU15V0ZzUmVybk5FRElhcmdTdkg1akUwRWxiMittNU4vSW1V?=
 =?utf-8?B?RkFIc2tDZmQ5dkQrWVRiNGd2a0Y3blp0MWtqR3J2ck1PTFJiZGdYT04xMEJ2?=
 =?utf-8?B?Vyt2dVlOS0hVTnE4RHB6czVneEhsUVZ2K2dTWUpkQUI1eStWcEhyVE04dVlQ?=
 =?utf-8?B?Sk9XUENpSllMK2lvc0Q4aXhvbUFxRGtoTXVvdnhzRWEzZ3pQWW1xcWpLMUZW?=
 =?utf-8?B?eVVHait6aVJMSFVMZkk0VkhIVUxTVk90VzRoc2VjQnNDa3U5Q2doa3pkdXRB?=
 =?utf-8?B?aTV6MWErNW9PR3Y1R3d2bWZhSFdTUVBwY0NQcjhsM0FYWTBHSEVNZTU4dys4?=
 =?utf-8?B?RHNpVzh1M1I1aXFDSzhKRkFBVjdWcGxnNzFBYlQrZlo2cTZtTjB5TnhlL3pH?=
 =?utf-8?B?bGp2c0Rnc3pzenRjU012emswNXdVdHVUQm1ZVnpUbG9kTTVkb3ZEYUVvaHhs?=
 =?utf-8?B?QldCalQwaHF5bEh5aEFudWdralc4WXZXUUV4NkpNQnVEelZtVkpkMGd4V25h?=
 =?utf-8?B?cU5BeXh4dFd1alhDM0hKek5vSkFwczZ2N3pzSFkyUGpsZFZkTE5PM0tuVFkz?=
 =?utf-8?B?VXdOQVBLUCsxUWxqei9wc3NBbUpwd0hkdGFtSWpLY1lwY2p2SEhodG42U21Q?=
 =?utf-8?B?UGhSRjQ4aHh2bWJBYytKSVFzR1VGNFNvTHIvU280SlRZc2NpZFlHWERKTFpK?=
 =?utf-8?B?aFVGanNidm1pTE5uaHBaNFBTNlpZQWFLSHFXZGt1QjRqMVduL0lyZHZMdExo?=
 =?utf-8?B?UVFkN2Rzd3BlaFFxVms2bjVLSmw3blNzc013SjRUdGlaVHQxUzd5QitBUHRE?=
 =?utf-8?B?R2pKYUVEWjA5RmJWZHRtM2QxVDJZZDErVm5hRW05U2NuUFhsOUNwYzZ1MTkx?=
 =?utf-8?B?NzNFR3VyRjVSbGgyaCsxVGlTdktob2dCVjJjMlVQeWRaNFhVSmtpUE9hcjM1?=
 =?utf-8?B?L2tpanRNNjhrVEluT1E1ZEJQeE4vWHlXc3lBRWRwVndKVU95bVZRRmpGVmpu?=
 =?utf-8?B?VzBZNkpsc25DL2RwMTdLZWdIalpJdTZyTW8rc3V2dk1YeXNWR3dtRXJkV0Fh?=
 =?utf-8?B?MUZuUDVxZm4yWVA0N0hrWWJnUHhkOXROcE1VTmh1Y3NZWHBsU05pdjJTdVgy?=
 =?utf-8?B?VzZiYkU5cG0wQU5kRGJ1RFRKTlFpTkxlNlhaMEpWWHZ0aXh2d2NoSFdwbWhU?=
 =?utf-8?B?U2FOYzlnR0cycWpMQUU5WTJwVGZ0YTVpQWtERkpXNVFXcmgvb0g2ZURGMzR0?=
 =?utf-8?B?cGJkaGpKeWlKL2hQU21YbzNWMitLZ3VYbmVOelVyeTl6aTYvM05nVXlJOEVI?=
 =?utf-8?B?c2VRQ2t0RGJMWGNySldtRU9YdWtkb0cwcTZ5dWJVaHo0VmJtOU5NbTUvcC96?=
 =?utf-8?B?blpoZ05OdTFDeTJhbEh6WkMrUnFTM1RibVY4Z1NKV1RoWi9nRFpPN00yeG1R?=
 =?utf-8?B?bnNGQ1dCU1IwblBiTGhjQzRlVlZzWFFtSk1INlFpL0hFVTlEaWtITVl0eHFM?=
 =?utf-8?B?b0RuOXlGb3dVR2F6bnZDc1A0dGhiUmk3ZTZkVElEenJudktMT2FWdlduK09T?=
 =?utf-8?B?Q21RNkpERGhlNXEvS2RINjAvRWVWV3c5RFgrWU1vZXNKSlIwczUwaHpkR2d3?=
 =?utf-8?B?M2tSSGNXS3RwVkgwUVoyU09rVzNJdGUxa1M3WDBsNDEzRFVQRkw5M3MxWXhK?=
 =?utf-8?B?bHpubmhGQXZiRWlaMVVSME1DSnZlMXpIbHNyRjJ5c2ZaTzVkZm90WkEyUmVN?=
 =?utf-8?B?RDN1b2NXUXo1N1kvQjZVODh1dE9DMVFKOEhmK3NTVXAvU1k4SlZPZ1YvSzNy?=
 =?utf-8?B?dVZBcTRlSWdhbHZDME1ZTWsrSVBHS0RLSUVaL1l6QW1KZ2hiSExUc0l0c3RH?=
 =?utf-8?B?LzRVTVBSTjNmY3djeG52Q3VnYlNBV1lnWTl0bExmdVdLUEd6NmdFbW01aUUy?=
 =?utf-8?B?cHBIdm1zZER4bk9vMi80V2o2bWw5KzBvbG14N2VyM1FoYU9CN0gzWU9iZnly?=
 =?utf-8?B?dEVSZ0VyN3hhUHpWNUhpRXo0Ym1MTWxWT0w0azRXVG9qaDRpYlVUVG91YWlx?=
 =?utf-8?B?aGo2OXY3MTJ0R0M1L081WC9FSm5zRjYzMXhIS3hGcEQ3a01WcXNHajQzb0gr?=
 =?utf-8?B?ejZydEdFZHQ5NDkwbnYxOEdFQ0FtNWYyUTF2WnhXQW1HQnhNY1Fqd2o0dmt3?=
 =?utf-8?B?aVo2OGg0cUYydjRKa3lYWmhNTk1NUTBDT0dhWE1aWFJTS0J5Q1dISlExMDd1?=
 =?utf-8?B?Qk9wTGRnR1ZCb2hkb05KNXVVSWo1TjZSQWxmQ2lMUHh2UlRPZ0hWdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454b661c-bf30-4b6c-51f5-08da38e9cfb7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 16:16:49.1185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPUyBYmbZnlN0JTfASGfhKVcrozR2rKfRfvbKeaJjWkO8gk0CDkntuO+lGYupgEo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4873
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::623;
 envelope-from=jgg@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

On Wed, May 18, 2022 at 05:00:26PM +0100, Daniel P. Berrangé wrote:
> On Wed, May 18, 2022 at 12:42:37PM -0300, Jason Gunthorpe wrote:
> > On Wed, May 18, 2022 at 01:54:34PM +0200, Juan Quintela wrote:
> > 
> > > >> Is there a really performance difference to just use:
> > > >>
> > > >> uint8_t buffer[size];
> > > >>
> > > >> qemu_get_buffer(f, buffer, size);
> > > >> write(fd, buffer, size);
> > > >>
> > > >> Or telling it otherwise, what sizes are we talking here?
> > > >
> > > > It depends on the device, but It can range from a few MBs to several
> > > > GBs AFAIK.
> > > 
> > > a few MB is ok.
> > > 
> > > Several GB on the main migration channel without a single
> > > header/whatever?
> > 
> > IIRC it iterates in multi-megabyte chunks each which gets a header.
> > 
> > The chunking size is set by the size of the buffer mmap
> > 
> > The overall point is that memcpying GB's is going to be taxing so we
> > want to eliminate copies on this path, especially copies that result
> > in more system calls.
> > 
> > We are expecting to look into further optimization down the road here
> > because even this is still too slow.
> 
> Considering the possibility of future optimization, IMHO adding this
> kind of API at the QEMUFile level is too high. We'd be better pushing
> the impl down into the QIOChannel API level.
> 
>    int64_t qio_channel_copy_range(QIOCHannel *srcioc,
>                                   QIOChannel *tgtioc,
> 				  size_t len);
> 
> The QIOChannel impl can do pretty much what you showed in the general
> case, but in special cases it could have the option to offload to the
> kernel copy_range() syscall to avoid the context sitches.

This is probably something to do down the road when we figure out
exactly what is best.

Currently we don't have kernel support for optimized copy_file_range()
(ie fops splice_read) inside the VFIO drivers so copy_file_range()
will just fail.

I didn't look closely again but IIRC the challenge is that the
QIOChannel doesn't have a ready large temporary buffer to use for a
non-splice fallback path.

Jason

