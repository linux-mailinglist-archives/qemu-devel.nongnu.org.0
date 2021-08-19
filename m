Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492CB3F1CE5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:34:20 +0200 (CEST)
Received: from localhost ([::1]:48760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGk3e-0004FI-Vr
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mGk1q-0002Y3-Dq
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:32:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mGk1n-0001JY-Je
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:32:25 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JFPwrp004922; Thu, 19 Aug 2021 15:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=7gr+w2MoCYpmgDwtbVZWoakhHsUs/BDzxgcqyYvXX5w=;
 b=rbTA16qIbuvClSS5UAkZuzj/CAHp410q01/Ma9FtuLndZihUIYlNyzFKlmmcptb6Aqhy
 Sf428f9MCUAJGqIBhJE5K+jcZB6vyzMSxDblmNJCEvoVX+M3bXNvG4ldEQxF/RiCSUXy
 i+4Sd+TcpqUIq0OcvMirOwx6zhXpdwSVvEd6AxPaBshxfEtXo1n3fwqUQjqWpc4gbwg1
 kPczQIAUHUrjXOA7CIJiV7qkAXDSOCad7hKFAP+JQZUXrVERUmzJ0xhTUKWpXt/dVxnM
 MXpCpnkU4uc1scyuNUkEgRd/fecvKza9m113RagxPqebpZYHSHZm3gQP4d20v52QHMw1 4Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=7gr+w2MoCYpmgDwtbVZWoakhHsUs/BDzxgcqyYvXX5w=;
 b=b/GDH7VApy0SKgGbbU/3UQpBtWzIR8nh+F+chgZBmuUtbdcMWbl/poQFGOAII4bAP90a
 v7kWruqYrjGvXP9dxmjbuxFbDersj/ehq2kNrLBZLQUx3w4MT9J6Tr7jslrPoPdVDbah
 gvuLRX/jEeASnFBqoWQNh6jJb3zVwzM4CTU4s3HuiMouH81U1DJ/8EsOoFWoJxy41p/q
 zxe00WhZDAZaQllCe0C7wYc1vhE+1vUf25+p8zCupJjmI3RkuJqDLr8w8+/p71dDK3XR
 EhGGnf4q6eomm/GrbKb5XFUQ5Uk0HV7xBD8646Hh+H/X/1JMrUXQuBRx63dvY01v5sps iA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3agw7t41mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 15:32:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17JFFBaA124443;
 Thu, 19 Aug 2021 15:32:20 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by userp3030.oracle.com with ESMTP id 3ae2y4m21j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 15:32:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3XqVTgYKsgXfTV/hOTqBWcElmEaZWrrvA+wRbGg8C5MpbElo2Cy6t9AI5J0ehFQuyepFQZoP7i1DgD9qT5RchdSlyO3viCpEsX8PWVI4Cvb+Z57wPRWVuLLCqIr7GQUWSqhxWSfUxdbEbjFphSOT/bySm+ez7VacK7lLdOZAdB3u5N29VEXL9H2Kbt1dn0m0WRVYj/AiaZwv7mBNoiRSo2r++s/ylGfBk0FE5nxat4uzQZTe3ix3ZVQeDQnyR2SNzjizDarsoqKippn2h0rA9w6iO8CNGhmGNVSgDQ9fzYhzKdOY2kaiBrZBgBjAkbqJ+oLQSFVeOURdAN+qEabqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gr+w2MoCYpmgDwtbVZWoakhHsUs/BDzxgcqyYvXX5w=;
 b=OZZ2vkbxI8qDtwtf2DjUwIxTN+7e8OSSaQB0cRkDZ4ESIQvg5sSQ9H3WMS5wap6gKLDu+G1CELyqkYYp4/860mcZevvKyUGaRLOu8TqydKuxuP65c9yaIIpY4MWGntasAv7jkKpng3GEfBUvpaphtX88hJX+aE/lrOYpqjY4CefninLKIHCxvUi2N5cVsB4Xg4a4JEbFH4JtFlBLmtETw1sXWKeEBMgFVIvh+ZZXNZyhtrOKcthmEyTI/2ovMMkQZIOClBmZuK78P4JGTIEun6fBX4erY5XQGOS9sxMoz0UeMOmMrGkUjZB1oPn4lgKmLKRGbeCpTrU2vTxOqinbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gr+w2MoCYpmgDwtbVZWoakhHsUs/BDzxgcqyYvXX5w=;
 b=FiNOMm+BzgSw9C4PmQFK7WZ6zhDsxAHx7Doq0IOi0FLqGqUxG5/ecC1lflOKk1hL5RrjqpGmdLInCIEb6s9v1cxa+SsoUvvo+J6q/ymC6xa//DSjyjLJve9qC53K7RtjCDhuyBSrLZnqxx5dG2dGlBerZIahBlln/F2MeDOqF0M=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by CO1PR10MB4419.namprd10.prod.outlook.com
 (2603:10b6:303:6e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 15:32:16 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::58c6:846d:3bc3:ba3f]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::58c6:846d:3bc3:ba3f%7]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 15:32:16 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH RFC v2 01/16] vfio-user: introduce vfio-user protocol
 specification
Thread-Topic: [PATCH RFC v2 01/16] vfio-user: introduce vfio-user protocol
 specification
Thread-Index: AQHXkr3EzZTId1mHi061vcC4TV3fbat4UuIAgAKmaIA=
Date: Thu, 19 Aug 2021 15:32:16 +0000
Message-ID: <D15CA27E-B5F8-4ADA-B4F6-94F6C1CA3DFA@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <a928987fdb794e44784186c4aa5135bc6c88d0fc.1629131628.git.elena.ufimtseva@oracle.com>
 <20210817170408.78be6ac7.alex.williamson@redhat.com>
In-Reply-To: <20210817170408.78be6ac7.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d654dee-ac30-438c-ad20-08d963268655
x-ms-traffictypediagnostic: CO1PR10MB4419:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR10MB441964B519906893A2A83B94B6C09@CO1PR10MB4419.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qywrBzRtoMvoNH7TBipYS9AMkOrcSKCRiYjr70wjjBgPfnHXAlktlM+RxGeT0zuPtVjydwoGXdlMIWYEUK+vIPKwEL279CeSX3U4BtMKj6yUv/2F2Kwiw2QlvERLna+RqhN8GYlL+/5Yj3eEsk/cZ5WxAalghJrbZFS2p+/yBCr8rjurSly8ioq5EOJEHzvmv/v0U1V5ItyC3t0RI+js0i0lMOxeZOzbSnmi97hcLrfaUGJsFb/V2AwYCV1Q52j9okkWGGsUkM3xRLbeoyVTSN4fQKrL2r3DFGNucx0axN5P0z2epYpmLPutEgVZMzL4F5SFGyf8ictCNECcYR/V2L1vtgYvfxFDYy+fvoO77gcEDdQHx9eK6JfMJuxq3nty85wogLdinHT0EgYjHMuSs2ZuHQEXvQF0rxLfn4vj5vOahZsdwLmI+pYe9MwkL9oX144+BtM9ZTdJtDX0SyWJpDBQ01N3jl7NubWENyOHq/e3/3Uq3xKiQRgR4uMHngUatJDBt3U2gnIZnyMi+gzrvULA7g18mYtaryuNivom7+Yi8s4M1FQuZuGL9QPSzdABPHqWPytXDJqAFjHKJSE1Sfw8aNQnue0+v9Sc4NZBLz+dynaSvcz1nuw2DIMHFkIShurIfrIygEMzPi4sg0+d3SRmQ2XZFMwDbjH2xuUvOeW3ggj8ttLlEJsRyCFhAUb1S/RGJsUqswYcFqNZGsZjJOwZQi4g7moj1RjN1Fdq9kLP6q64qq2282QVq4pxAunA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(376002)(136003)(346002)(366004)(4326008)(478600001)(8936002)(8676002)(2616005)(6512007)(26005)(6486002)(53546011)(6506007)(186003)(64756008)(66476007)(66446008)(66556008)(2906002)(33656002)(83380400001)(6916009)(36756003)(91956017)(76116006)(66946007)(5660300002)(316002)(86362001)(38100700002)(38070700005)(122000001)(54906003)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjV2ZU14em16czF6Z3ExRzV6WDJvL05GSUQzQi9oUmNoR2FYN0NQQ3FBU2xp?=
 =?utf-8?B?My9TL3lWZnNVeFBXeHpKSEl3Z0E3WlkwNDVBV0pVTWhpZVgvMGVSczFGUXJE?=
 =?utf-8?B?emFxRnRvMXFnT3F2QVMxM1htek9IYmp3WnI2d0dPVkhlN2pCa0pNaXdWZlZN?=
 =?utf-8?B?VGZ1TVluQ21iM0JLRS8rVjZGa2Y0anhjd0xmYk1pR0ViZzNuSURGRmcxZWI1?=
 =?utf-8?B?d096RHBMeXRMTkJpSU9Ja25FTlRqYUdoTi9RdUNsWW9yaXJuUEd4bi9PdXQ3?=
 =?utf-8?B?ODRzY3ZFajljQ0UyN0Y5RE0xM1JaaFVmdkd1TUQ5NlRFbVJ6NVZMRm9kMTQz?=
 =?utf-8?B?bWVvaXN0QWI3bUlVWlVaaUxrN3EyaUNKOUZ0bkw2YmJVNUpqbXhuUklQVjB3?=
 =?utf-8?B?dm1zL0dpbE8zc2swbFFUWk5rR3plaDQ1N0wva3Bna0toWjdEdUZlTFloYkdL?=
 =?utf-8?B?ZWZ0SmRzeUZhSlZXZGNTQkl4SUdiL01KeEFkZjZBYmJ4SUkySk55Ylg4aGVJ?=
 =?utf-8?B?TkZhNjFidjlPZVFybTVVb0JnamhqYlVULzFvaFNrK1J3V2ZPZm9QNnBlQUZW?=
 =?utf-8?B?dzZLbi95SENrZ3Rac3hKbVY0SDlCUVMzY2VBUnBBUDZzVEpyaU9EbDZlZG5Y?=
 =?utf-8?B?TjFuN0JiTzVOSHBycjdJTDRRMmVCRjZjeGlLcll1Tkh1cGtyNjA4dFpmOUY3?=
 =?utf-8?B?QnVIT2tNUzB2ZDFUQTR0akxIR3RJS2kzTS9wVTZDRnhkaUx4WG9OQ045b1Vv?=
 =?utf-8?B?SDROZS91cDRsSEl6UW50c2RzdXduQStoTU1mQW1CdGlCWW9sdUxhOTIwNUl3?=
 =?utf-8?B?elgrdVdXd0dGVkMvTHZjVUhpNVIyNkJNSjAvc01PVFJnbXpud2NrdlV2Rnhj?=
 =?utf-8?B?N1czNlpTTklaelZHMnlzWUltSnB5bjRmNTJtZmsyYlhhWFlzRW5uakN4UCt4?=
 =?utf-8?B?b2RwYVdzZCtMUkJIREwyMkJFYmRlL0dGNUdLMzcrT3NJK1FQWGsxK3ZNRDdT?=
 =?utf-8?B?M2FwOGhqSmNuYzRtbm9FT3R3UHlyejljVGtVT3BxOTBFbE0wd0cyWVNZZzBF?=
 =?utf-8?B?N0tmOXlXcS9OOUVNSWU1S2FWR1U0Wk43dDh1VGQ0RmVacW9RV0xJUXE3RmJT?=
 =?utf-8?B?ZDZPSkRxRmJJd2RXaGQzalhFLy9JcnVtQjFPUUw5dG5rM0VkV3Jzd0NXOU83?=
 =?utf-8?B?bXZ0bzlsMjNXUmxyYlRPNmVhT3R3TEdvMkZwQTdwaGlzV3pXdWpYQ1BFOHV4?=
 =?utf-8?B?T09wOERySzV2QkZPbGFMS0dXMllwYXlsMXJiaE5GVGNqcVpiTVZRZ3ZMWlcy?=
 =?utf-8?B?SXJxT29mMjRoeVczcnJWYWlGK3dIbWNyNW9GTlYvQnMwSTNZSmFxU2Z5S1Zh?=
 =?utf-8?B?STRoOFFjcUVNVmJTcmExazBwNktBV0xmckdPdDd1K2ppT0VXTXhtQnN5ZmpK?=
 =?utf-8?B?R2JXZ2FvLzQ5UXlvQmZnTXRzVEpJS0VBNmFEQjRQMEtZUmJOMHFBMGlGSXFo?=
 =?utf-8?B?V1orRzFOekhFMG5lMiswRU0rVVd0N1VyQy8za2VmZ0tPa1NuNTRsVmRtZmhH?=
 =?utf-8?B?UzhQZWtWMU9tL2gzU29vbkxTdC9OZklFKzJpTVVndHdTTk0zYVo2RUFnVmxa?=
 =?utf-8?B?RG92cGVOUW9jS08zSmN0MVQ0TXpGdVZvVnlxdDlVV2tQTk0xMDRRK29FUFBJ?=
 =?utf-8?B?ZFZ5MHlWY01lTUFlRnA3cEhwRSsyM0wyS201M250MnorbWxpM1NGY3VWQWpr?=
 =?utf-8?Q?pnlxsTW/8YDwGACQtcpQhyzxiOTNGikgRVXzUW1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDD477239E8E504C9B8F6831016E844B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d654dee-ac30-438c-ad20-08d963268655
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 15:32:16.1975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bk1+wMVhboPhRs+AKANjo2eKU6Joz8e9ZZnrNCJ3QXkF6QE91mXvRqPifVgLmgCGtBFYj4AI6pTqgM62I2aDjTB4G5E3HE7eT/MqHZxNK84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4419
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10081
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108190090
X-Proofpoint-ORIG-GUID: dm0hKNp98Gkngn5GcI4mK1iqpvsZ7Eha
X-Proofpoint-GUID: dm0hKNp98Gkngn5GcI4mK1iqpvsZ7Eha
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXVnIDE3LCAyMDIxLCBhdCA3OjA0IFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IA0KPiBUaGUgYWRkcmVzcy9zaXpl
IHBhcmFkaWdtIGZhbGxzIGludG8gdGhlIHNhbWUgaXNzdWVzIGFzIHRoZSB2ZmlvIGtlcm5lbA0K
PiBpbnRlcmZhY2Ugd2hlcmUgd2UgY2FuJ3QgbWFwIG9yIHVubWFwIHRoZSBlbnRpcmUgNjQtYml0
IGFkZHJlc3Mgc3BhY2UsDQo+IGllLiBzaXplIGlzIGxpbWl0ZWQgdG8gMl42NCAtIDEuICBUaGUg
a2VybmVsIGludGVyZmFjZSBhbHNvIHJlcXVpcmVzDQo+IFBBR0VfU0laRSBncmFudWxhcml0eSBm
b3IgdGhlIERNQSwgd2hpY2ggbWVhbnMgdGhlIHByYWN0aWNhbCBsaW1pdCBpcw0KPiAyXjY0IC0g
UEFHRV9TSVpFLiAgSWYgd2UgaGFkIGEgcmVkbyBvbiB0aGUga2VybmVsIGludGVyZmFjZSB3ZSdk
IHVzZQ0KPiBzdGFydC9lbmQgc28gd2UgY2FuIGV4cHJlc3MgYSBzaXplIG9mIChlbmQgLSBzdGFy
dCArIDEpLg0KPiANCj4gSXMgZm9sbG93aW5nIHRoZSB2ZmlvIGtlcm5lbCBpbnRlcmZhY2Ugc3Vm
ZmljaWVudGx5IHdvcnRod2hpbGUgZm9yDQo+IGNvbXBhdGliaWxpdHkgdG8gaW5jdXIgdGhpcyBz
YW1lIGxpbWl0YXRpb24/ICBJIGRvbid0IHJlY2FsbCBpZiB3ZSd2ZQ0KPiBhbHJlYWR5IGRpc2N1
c3NlZCB0aGlzLCBidXQgcGVyaGFwcyB3b3J0aCBhIG5vdGUgaW4gdGhpcyBkZXNpZ24gZG9jIGlm
DQo+IHNpbWlsYXJpdHkgdG8gdGhlIGtlcm5lbCBpbnRlcmZhY2UgaXMgYmVpbmcgZmF2b3JlZCBo
ZXJlLiAgU2VlIGZvcg0KPiBleGFtcGxlIFFFTVUgY29tbWl0IDFiMjk2YzNkZWY0YiAoInZmaW86
IERvbid0IGlzc3VlIGZ1bGwgMl42NCB1bm1hcCIpLg0KPiBUaGFua3MsDQo+IA0KDQoNCglJ4oCZ
ZCBwcmVmZXIgdG8gc3RheSBhcyBjbG9zZSB0byB0aGUga2VybmVsIGkvZiBhcyB3ZSBjYW4uDQpB
biBlYXJsaWVyIHZlcnNpb24gb2YgdGhlIHNwZWMgdXNlZCBhIHZob3N0LXVzZXIgZGVyaXZlZCBz
dHJ1Y3R1cmUNCmZvciBNQVAgJiBVTk1BUC4gIFRoaXMgbWFkZSBpdCBtb3JlIGRpZmZpY3VsdCB0
byBhZGQgdGhlIGJpdG1hcA0KZmllbGQgd2hlbiB2ZmlvIGFkZGVkIG1pZ3JhdGlvbiBjYXBhYmls
aXR5LCBzbyB3ZSBzd2l0Y2hlZCB0byB0aGUNCmlvY3RsKCkgc3RydWN0dXJlLg0KDQoJSXQgbG9v
a3MgbGlrZSB2ZmlvX2RtYV91bm1hcCgpIHRha2VzIGEgNjRiIOKAmHNpemXigJkgYXJnDQoocmFt
X2FkZHJfdCkgIEhvdyBkaWQgeW91IHVubWFwIGFuIGVudGlyZSA2NGIgYWRkcmVzcyBzcGFjZT8g
IFRoZQ0KY29tbWVudCB0aGVyZSBtZW50aW9ucyBhIGJ1ZyB3aGVyZSBpb3ZhK3NpemUgd3JhcHMg
dGhlIGVuZCBvZiB0aGUNCjY0YiBzcGFjZS4NCg0KCQkJCQkJCUpK

