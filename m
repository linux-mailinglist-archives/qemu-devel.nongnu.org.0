Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCFB52ED14
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 15:27:15 +0200 (CEST)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns2ew-00076I-PU
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 09:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1ns2cZ-00068n-TR
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:24:47 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:14428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1ns2cX-0003Se-SO
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1653053085; x=1653657885;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QggnhgAR0iin12AvrQcQw3W6TjZyRRJPjb7BILKH0HM=;
 b=sdzfb3TwflY/oSCOEyT4geGtf0JNo9BujikRplXTRjTehm/zBczt+4Xi
 Z6Mhf44ZXygAZa0MaflINGy6A783GJ2L1maOuK/X6NPAQAIRCkD6exMNf
 Cjzh96bTB3rrUTElmdhZmwwmE6cyF9lWU+mli+7yxWk0htNiSV5e9h52R E=;
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 13:24:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPtDXrQlvP+bUDCiUSCrmvR/8Y4jXlUG0C71ublkb3u3lh/dbX8YAuYGzn9yuFPN/OUgcsZknYoENgp9INwa8j6YWpVKYTrCGncdVajBrcgm87OLi/htAdQXDgmcgXwY/RPsP9ty9GLITl6hQN7Q8oN1YIc3HldoWFOuWj+Q1PuuT6xsGvgVxE3PR6RGSnZ/NXYa1ks/d+yYxdPy/BliGikhGOzPDbtjtm0U2Wbq/8V6ZeDmY+Pgs+xyzuhcuaWlbmOLJ+CmR7ya/NrhraAvVe8j+8nmUcMej24kF0IUdQrSlB12yAs4bDppfNLW9iMyGa1ALA10ldgTtRd2HqAkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QggnhgAR0iin12AvrQcQw3W6TjZyRRJPjb7BILKH0HM=;
 b=lswhFGAWXgCTf242nUn+d+EcnJW1Q3ihuK2bi8nY0Z2TShP2fdR5DbRxW1vnsQxIKVzhyklsuMdq1PWvjcZCZqImMPqzfOyFpGRpczQNliOwwuv1RiuOQ2pZZ4NzOk9LLfkMk8djIcIeuANMf83dLrt3LScnOeTwGFyU7RlNfKd5uMIbsIt7+3pcj/wHvMp61uKLjXqqiGVNMMaKSutTCe+nBj7VoJLQC9mbS4c56+TjHmc1ne4NyMwYVDwOl9CaHudNMTRaYtw4xTMx0345DgBAesX4Vw8vllkyCo+pvId19ylONPPHKNqvmiNnxz3Z7y5ScSDcIkuRPYBoZa5plw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by DM6PR02MB5497.namprd02.prod.outlook.com (2603:10b6:5:7a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Fri, 20 May
 2022 13:24:41 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::40eb:1458:8e6c:68c3]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::40eb:1458:8e6c:68c3%7]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 13:24:41 +0000
From: Brian Cain <bcain@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>
Subject: RE: [PATCH] tests: Remove unused "wcount" from linux-test.c
Thread-Topic: [PATCH] tests: Remove unused "wcount" from linux-test.c
Thread-Index: AdhsSqReCQiW0XIpTEStdckuNm/cZAAAd2EAAAAJHtA=
Date: Fri, 20 May 2022 13:24:41 +0000
Message-ID: <SN6PR02MB420531CD8091D3A8D8FC1E5AB8D39@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <SN6PR02MB4205DA19E31A951F2B5A6C42B8D39@SN6PR02MB4205.namprd02.prod.outlook.com>
 <CAFEAcA8n5r4LP-9gu+v+zgALG=Svx65xJWEqGvx1ba9JmMEpfQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8n5r4LP-9gu+v+zgALG=Svx65xJWEqGvx1ba9JmMEpfQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d31d79e9-ddf3-4fb7-ba0b-08da3a6418bc
x-ms-traffictypediagnostic: DM6PR02MB5497:EE_
x-microsoft-antispam-prvs: <DM6PR02MB549711C3D50A53EC2FD623A5B8D39@DM6PR02MB5497.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nnAKdsVPQXzyd6YquMhmaeZ9huEM7FXlvs2kZwSrcxQ/vvQqs09oyppTQPJJCUTBS1i3tRkMycw0H7VY0UkuIB8EYAjkwo2bPm9qLDRSwlv1HXT1S2EE1W1UGaNriGevCc4lIrrZXqZVJDvMAl6ZN6F1NEegQ5E6lRq3q3C7bqtkh/h6D6w5Tbt+G60OF5sCnne2vMKL8mW0dyn7T6QQsd9eqCRzvDRKzSnp3C/ZN9Ytm9ts7cNBlD8Ndc4i1AlKBcLKWc5QLqVnSmWSWs5Eq2wHx8L+ilm6TkajOv8sN9nF7NZ7zXyoi0YHr4AP6RIcB1CmHWx8BIiW5JtMn7j5xRL6Q3sdm+mZoyiqCNLZKr8gylUrkOYiaNRqglCZ/FvhD3EPomfTAqi3hUAOuTGcNZCZQEldaJwBPwnIK425QxizIfeacq4r1TGO5GXjZAWBlLs6kXrB751oSqxmI55MX4LIZNKJtimjqlVUe/c3+sYvFcp9YUJfP97mxLBDrsN234txJsAI5I+kIr/M6j5SDidLdTmw64L3/jfD+8r6E6byPM5asDaEQczOcTgnV1UGSFFWBVZEUXKgOB39YouHwXUxLCeVqrw3DctGuS+OvOaBGPYvwlgYP5nVQW/AqCRAf4tcd+KeM9pJu/o//cyFmPZbsiEjVgd9NlbDdVmsiHq1oqj1/f6UM2HuuCwd9FYL4KbqTcElr1bHVlu6tVOvNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(66574015)(55016003)(316002)(38070700005)(64756008)(9686003)(83380400001)(6506007)(5660300002)(508600001)(8936002)(52536014)(71200400001)(53546011)(8676002)(26005)(2906002)(186003)(7696005)(6916009)(76116006)(4326008)(86362001)(54906003)(66946007)(66446008)(33656002)(38100700002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VE9xTnhkb3g4T0Y0MWFwdnFRanFFeEVXK0VXS29jSlY4QkU0SHhaWmQ4aGpt?=
 =?utf-8?B?cFBCL0F4cVpReEVPMWZZOTJ1UHpzaWY1N3BrQm94VHZUYnB2cS9LUmRERFFs?=
 =?utf-8?B?WmJyZjNzdStSazFzQloxL3ZuSUR3OUMvM3BNVWZWOXMxZ2JEdm9MOWhVaGMz?=
 =?utf-8?B?QWZXOENpUVhoQWtGVlZobzU5VWQyNW50cmZzKzVTV2o1NGxIRXp4OTM4OVF0?=
 =?utf-8?B?ODB4UWhZbkRJRlNSWDVvZFQvbXdIaS9LWVR3aTlLVkF3M1JFVWtIdGhmUU1K?=
 =?utf-8?B?MXRKV29ZMytKWHg4Y0tPNmJHRmxJRzdtU3RYdjE1SXRWYWh1eW8xY3pXSncw?=
 =?utf-8?B?RG1yN2NkYWs3amFVNDFVSzNERnk3ck80UGtvcmdUZ3g2QjBkZ1E2REY1Rksv?=
 =?utf-8?B?eTBNNUF5bVNVV2FpN1p0YU1MV0ZBYXdiZ3hZaENuRTJNR1NhYW53eHFuV2JV?=
 =?utf-8?B?ZENIbGdLUDl0UTV2dXFuOGFGbks4eEdpcWU1L25nRFg2WmNMUHZXY0YyUytt?=
 =?utf-8?B?RkUxa1lMN3BUSnJzUVNLOER4SVZBZE5zMDBHSnU1UldjdkEvaWdmMXlQK0l4?=
 =?utf-8?B?RVFwK3BtTW5BaVFRMHQ3WUF4eHdHTCszNUlyZmhpK0NSa1M3U3VNSzVTTTJ4?=
 =?utf-8?B?SU53RnNUUFhnYlZvT3RHb2t3Smx4MzdCcXNPL0xBN3RLYjcvK2l0WGtGcm1j?=
 =?utf-8?B?SDBSOXM5Y090MkRaM2pYcmR3d283d2F2Z0lIY0o5cjJvRUpsRFl1WkhOZEZ3?=
 =?utf-8?B?SUNSLzhKY0hYL3lUcnNINURKVU1wcmxQUEZmd2g0RkloZzMrR3dvblRoSEw2?=
 =?utf-8?B?bnlGdndvLzZlaWl5ZVVETFNld05UZ25EbHNkZVpzYm04SnJGdFpHMlVQVFg2?=
 =?utf-8?B?QjdYcEw5QVdsMzVFcGFpekdRTXliNkFsekZsYjZQZEhlMjk1bS9pS1BMc1JT?=
 =?utf-8?B?ZWZpYzJ4M3FlNDBqS09MdE5zeHhuT1NNODlrY2pJUHZwQUpzNzBldUVGaXVG?=
 =?utf-8?B?dmtQSis1bjBVUkZnRThUL0wwTEN6MU9aczk2dFJnVDBncXM4d0RiblIxcjk2?=
 =?utf-8?B?cmRhM3VTN1NSWkJ6eTVqZ2h2TzRMaWg5U3Y5OWtCeXJGOW03SXlkTC83bklo?=
 =?utf-8?B?cDVIamtyaEhDWWRHSDRQL3FVVm9TUHFQcXJYQzNmc3FRT1d0cjBONzVhZUhr?=
 =?utf-8?B?T3ZJajV6SHRnb2o4OW5ENUhIeUlucVU4UHdFS1NOVkFYUHVHZnpMUkxQUStt?=
 =?utf-8?B?dmhLNFFXRU0xMk4vdm1kajdEd01maWJJSDBiUStOak16R1JNc1hUTmpPZWRF?=
 =?utf-8?B?NXpXWXI1dHpYdThUbVBvL1lKeHowZ3dQdjFpN1E5aWo4aWUzUE9Lam5NR0o2?=
 =?utf-8?B?Y1ZqRU9KUnRlVGdJWm5YOGFjSER4OE0yWlgvVy9PQWNha1A4T25tWG01Tmor?=
 =?utf-8?B?S1Z0Y2Y2bkVtbkt1S3NZWjRwbnY4VHBaLzJJZExGcEFxR0ptZHNmNFllcHVx?=
 =?utf-8?B?OXp1eVdacC9DMzhxSDgyREpMZTlUcG5NajlyZ0NDT3hkMlYrYWVmczdmNEdJ?=
 =?utf-8?B?N25tYy90bVUxL3JpREpZbDNqZEFJUjJXellrVjEzZk5QVU1pRTFnUFFYMDdI?=
 =?utf-8?B?d09xMlVDOC9tMFZqK1RFb1hpZ2JIcElXYkhwMmFZQUEyNmF4a0YvMEVBOXpu?=
 =?utf-8?B?NUp5Z1JaNUdNOG95em9lSFlQWjdMYk11WC9GdFl5Y1ZVVVBwb3ZqRVBRcWlU?=
 =?utf-8?B?Wkp2c25kTWYxdXYvS2tKOVlhei9pbGk2dlpwQW1zYzRGb3YyWkhFTVpoRm9x?=
 =?utf-8?B?V1gvL3VrNCtXMDNJZ0ZqS3VFWmJicUVVdGdOMHV6VldZRjZ0Z0xkdlZ5dG03?=
 =?utf-8?B?OC9TR0lZZm9zZFRodzF1NDJLcmNSRW1KMnRKVWJhUGtzNjRXaVdjU0FIckh6?=
 =?utf-8?B?aGF3K3NlOWNpcUtzckxCZytjY0NQZWdtZVdyTkxQQUNMb3k2bXJIZXU3QzNV?=
 =?utf-8?B?ZXFDREpHYmUrZ3lvK3VXYk5YSzNYMVZjL0FDY3dNS0ZULzQyVEJNVG1IN3pQ?=
 =?utf-8?B?dkdXdmpDdTUwZGt4TXhRMGVvN092R1ZNRHhPdnZ3VzdNTnAvZk5La0VyQ1kz?=
 =?utf-8?B?VDV6WGE5d2JyMm5XZllaRUxxazRjT0VIQm5LZjVHZjA1RjZEUUFEbENHMHZT?=
 =?utf-8?B?R0QvY2lxVEd0cUIzVzNKR1JPTi9IZnlCTGlWckhEYmtHZHVpZzFLWWZwRm5u?=
 =?utf-8?B?dFRZbE1wWnViTEFjUGNYL0JudjFaUGFvS0ZhVWYycUYvYzA4M3l5UGpqdzN0?=
 =?utf-8?B?aVRYa1ZJNXAvZ3pIK2tpeThmSFU1dE8zNXpkR2ZlUHE3UjVMbjVIdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d31d79e9-ddf3-4fb7-ba0b-08da3a6418bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 13:24:41.2352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8vxz54Q7Dj6vC8yWNREFI+k8zGvKSuPJNhPBQVoC7P71blbRt2F9N9zRy23epK2rcxSvZkhGhOgc43wrCPqn9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5497
Received-SPF: pass client-ip=216.71.142.165; envelope-from=bcain@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIDxwZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDIwLCAyMDIyIDg6MjEg
QU0NCj4gVG86IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBDYzogRGFuaWVsIFAu
IEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsN
Cj4gQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIXSB0ZXN0czogUmVtb3ZlIHVudXNlZCAid2NvdW50IiBmcm9tIGxpbnV4LXRlc3QuYw0K
PiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFs
Y29tbS4gUGxlYXNlIGJlIHdhcnkgb2YNCj4gYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQg
ZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiBPbiBGcmksIDIwIE1heSAyMDIyIGF0IDE0OjE2
LCBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBjbGFuZyBy
ZXBvcnRzIHRoaXMgdmFyaWFibGUgYXMgJ3NldCBidXQgbm90IHVzZWQnLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+ID4gLS0tDQo+ID4g
IHRlc3RzL3RjZy9tdWx0aWFyY2gvbGludXgvbGludXgtdGVzdC5jIHwgNCArLS0tDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS90ZXN0cy90Y2cvbXVsdGlhcmNoL2xpbnV4L2xpbnV4LXRlc3QuYw0KPiBiL3Rl
c3RzL3RjZy9tdWx0aWFyY2gvbGludXgvbGludXgtdGVzdC5jDQo+ID4gaW5kZXggMDE5ZDgxNzVj
YS4uZDU3ODFiYjQ3NiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy90Y2cvbXVsdGlhcmNoL2xpbnV4
L2xpbnV4LXRlc3QuYw0KPiA+ICsrKyBiL3Rlc3RzL3RjZy9tdWx0aWFyY2gvbGludXgvbGludXgt
dGVzdC5jDQo+ID4gQEAgLTMzMiwxMiArMzMyLDExIEBAIHN0YXRpYyB2b2lkIHRlc3RfcGlwZSh2
b2lkKQ0KPiA+ICAgICAgZmRfc2V0IHJmZHMsIHdmZHM7DQo+ID4gICAgICBpbnQgZmRzWzJdLCBm
ZF9tYXgsIHJldDsNCj4gPiAgICAgIHVpbnQ4X3QgY2g7DQo+ID4gLSAgICBpbnQgd2NvdW50LCBy
Y291bnQ7DQo+ID4gKyAgICBpbnQgcmNvdW50Ow0KPiA+DQo+ID4gICAgICBjaGtfZXJyb3IocGlw
ZShmZHMpKTsNCj4gPiAgICAgIGNoa19lcnJvcihmY250bChmZHNbMF0sIEZfU0VURkwsIE9fTk9O
QkxPQ0spKTsNCj4gPiAgICAgIGNoa19lcnJvcihmY250bChmZHNbMV0sIEZfU0VURkwsIE9fTk9O
QkxPQ0spKTsNCj4gPiAtICAgIHdjb3VudCA9IDA7DQo+ID4gICAgICByY291bnQgPSAwOw0KPiA+
ICAgICAgZm9yKDs7KSB7DQo+ID4gICAgICAgICAgRkRfWkVSTygmcmZkcyk7DQo+ID4gQEAgLTM2
MCw3ICszNTksNiBAQCBzdGF0aWMgdm9pZCB0ZXN0X3BpcGUodm9pZCkNCj4gPiAgICAgICAgICAg
ICAgaWYgKEZEX0lTU0VUKGZkc1sxXSwgJndmZHMpKSB7DQo+ID4gICAgICAgICAgICAgICAgICBj
aCA9ICdhJzsNCj4gPiAgICAgICAgICAgICAgICAgIGNoa19lcnJvcih3cml0ZShmZHNbMV0sICZj
aCwgMSkpOw0KPiA+IC0gICAgICAgICAgICAgICAgd2NvdW50Kys7DQo+ID4gICAgICAgICAgICAg
IH0NCj4gPiAgICAgICAgICB9DQo+ID4gICAgICB9DQo+IA0KPiBBbm90aGVyICdjb3VudCcgcmVs
YXRlZCBvZGRpdHkgaW4gdGhpcyB0ZXN0IGNvZGU6DQo+IA0KPiAgICAgICAgICAgICAgICAgaWYg
KHJjb3VudCA+PSBXQ09VTlRfTUFYKQ0KPiAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiB3
aHkgZG8gd2UgY29tcGFyZSBfcl9jb3VudCBhZ2FpbnN0IF9XX0NPVU5UX01BWCA/DQoNCkkgdGhv
dWdodCBpdCB3YXMgcGVjdWxpYXIgbXlzZWxmIGJ1dCAqcG9zc2libHkqIGludGVudGlvbmFsLiAg
T3IgbWF5YmUgd2NvdW50IHNob3VsZCBiZSBjb21wYXJlZCB3aXRoIFdDT1VOVF9NQVggYW5kIHJj
b3VudCBjb3VsZCBiZSBvbWl0dGVkPw0KDQotQnJpYW4NCg0K

