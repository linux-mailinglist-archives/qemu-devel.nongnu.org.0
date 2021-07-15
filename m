Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085C33CA0FA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 16:53:07 +0200 (CEST)
Received: from localhost ([::1]:40490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m42jZ-0002AQ-Id
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 10:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m42i6-0001SD-Ls
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 10:51:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m42i3-0003G2-30
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 10:51:34 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16FEbpT9006578; Thu, 15 Jul 2021 14:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=MOnGtuBY13Y3sky91xBlP3aYbtljVdk3Cn+KkWiONjw=;
 b=NhVZ+tvkkL/F2fKKuLb/5IhAHUsLLYQoU72qqs/KjSPSr2fb7KL0duxDg2FGXqMgZL8e
 BA/KsHK79+nJTxlDHM0REMu9J36QuChdJP5ZkKu1rtMy2KhLyJNboK+B0raPag46Wyk1
 L4KSsBeNllKYhVz2GOVPrTVZoZN6LiheFDf4NExEJc0LVJst8mQJrAgl3XoYLVDUD43Z
 O+2rAr5pdOTUJii+pbtWQi9I92bi3Hio5S7Xf6vVQsXDurNPYSzM0IdkGLa/2yvjbgyw
 PLu+hH55yZnaf/AqYSTvWOtEeiGFf8lp/oN0F04y7Tfo+MOWvkKs49DTRnJktidEuigA qw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=MOnGtuBY13Y3sky91xBlP3aYbtljVdk3Cn+KkWiONjw=;
 b=Ci+0zU7qLFAJ6vW2Q3TdnYLzXsxfxjtzoFcy5yMyX9nysgUutbLv4oFPh6EOeAKJaSJx
 XHIkks8ul+6ACxMki0DI29/BuieyChLYI6oGy1BpaiSVp20/ZJkKHOML49ZH9l8uMAZX
 Bvx+lCMtRLkkpsi/fSnUPt2Weo/NrVV9O5tcjWIvbNppjDy7NCtsVxo1ULefG8lHesaw
 97OCT8himwhHjK0BF40f2yH2m/BnCq0n3tAatXMSPAp0BR6B4NK0EJBR8dmQHM6eVDHr
 1ZMX0qIWiazssa7vGSi7Ksc24CrIIsNeovpyDuc/qwfdya4mSukoR4qEJ0IzpyrlxXRt OQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39tg510ww7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Jul 2021 14:51:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16FEZ9ao100645;
 Thu, 15 Jul 2021 14:51:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by userp3020.oracle.com with ESMTP id 39qnb5x6kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Jul 2021 14:51:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUd7YUqp8Mr1bh9iOydcFQeznUwAqcPY2nV8DRzqFQXz6i++kXDhDUAPBohcGunnBg9g/7HJTgmSnTMva9Gc5VAKTPpYc49qiRoH+to8OLg5xLMjsYlmaqMUomfA1W5vXRg09qDnwRjt6N5flPDUbxAPHZ2E/2Z42YSiedXHTIdDPK9L4+XjV2mm5MAWklHOsgYsLwdk6I3YyhXhnSBist4dyNxwpis4HEhw1eOvTfWU8Ba5BHCT5ji4sLMHvzYLWMj4i4ahY3ur+z9yvK3MEbwSGS97iHWkU2N4ykKEpe8JW0FZHxMSmU23sVQdRqQph+AjhIc5Q6fhXmWfXuct0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOnGtuBY13Y3sky91xBlP3aYbtljVdk3Cn+KkWiONjw=;
 b=cfJGqVIsSTzhF2JYMZRc+1W3B1fHsCndkVQwvNHMlmikGryhnmEIC7Axq+Bkn2gw48sLhqlDc+dToJO7bD89CsZKIWvBGfZb+97ignmaHpK8xD00r448t7izt7E8CCYDkPXuP0TZ0B8mMTMONoCQJYFklQfC2CkE359MPIEkGLFvjXC/1mRBMRtK0WPBG0s+5KQpdG9NQ8MwicASFlfsD915nGxWFcSmrSLpXrb9TQbLCvnLP9csQhYFbJ9WPXf3NCPtRRDRn1SR/WjuRQ4J3xq0i1FkVZuhxIuLcSA/YL5x1ShROfprA4aPFrKFmcwWewMi0reMpu7YB2XASyZm1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOnGtuBY13Y3sky91xBlP3aYbtljVdk3Cn+KkWiONjw=;
 b=dO14nR4MDKSCxpEOK61S8qTS3yktynEWQgzyqmQD0W0l/+5L8uqIK8GqOGhXY00AJVfQ6x5esf4hbD83W45umRhOVFtOoPfbu+9tZ4fJzrZQHNzkzDrJ3Kl8nPMfTc++DkfzKlCRS0OWfrmWqzVtFdRJ+VjX60T1xNOatITxD0o=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4932.namprd10.prod.outlook.com (2603:10b6:208:325::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 14:51:23 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 14:51:23 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: tests/acceptance/multiprocess.py test failure
Thread-Topic: tests/acceptance/multiprocess.py test failure
Thread-Index: AQHXeR0NylCXt+5A8keyEMKNPxfdPKtDsUyAgABTqwCAABqPAA==
Date: Thu, 15 Jul 2021 14:51:23 +0000
Message-ID: <418D3B29-010B-4B5B-A310-F3E3DA110DA9@oracle.com>
References: <CA+bd_6+2zk0N=s-D2OG4FUZ-HirJ+8HkMUktF=Jqyf9_HhyH1w@mail.gmail.com>
 <287d8097-f865-6f89-6062-567a7994987c@redhat.com>
 <87wnpr4t0d.fsf@p50.localhost.localdomain>
In-Reply-To: <87wnpr4t0d.fsf@p50.localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72081406-fd78-4569-c1a7-08d947a003b1
x-ms-traffictypediagnostic: BLAPR10MB4932:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR10MB4932BFA744A38042D3E027BB90129@BLAPR10MB4932.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jYckJhapZxip46YE8pQwXtNXb1HAxToJm3cHUYWvnNCB/vgpMnidM7Jb4N3lYVr++74N9bC+ERbOHy/UQZrvUCbwRMtAuiW0sGd2vOmxj1eKGZfReEg7UrJ/ng4d0TFIkQN/9IlQEhSenXIomIF8roK23RCOllOlodtYXukAb3vOttD9IGSPXKqmldJPNjNxaI4B65uK21ZRjCEGRVCHFA/yBfiEMEcOtEQsROMRivK79nkC+dnCpMrVOA7nCB27OFsup2SfcdX0KZrdsN4mganmmqD6gQKATORV/5B1ZYkil0oHt/bw64ip5h7bcc0ZPCYIXOguYnOkmw121G4RkKZVlaFhAxubECT713QnInHRhvu5RcQG4AV9hmvgeYQmyaxu+7LA0bfXqlpu7Ya6TXFDzBjerjLABcQJCOLYkDOhDxEotTNLqm0lI/7s/nu1LtOPyZNNRhXZPWHyiQPzrIZR9rWkC1o00KIEjeFZA7I/8Sb7wjCawtwFUJa1itFsFj1e9YZT65iosXo26XGwZNuYPD+IMKpJRkbcrYWparnITCIDB5QI3TnX541IbryZ/2udmhQbBpxFP3oMFB76DOxsRChqqv8dbE8UWwMATtPtBL8NFGTpoOq0sd7ud6RxSv04B7/lMMXUY+OPIObF2tNMPClxFORq3tDrEcwg3Lhhwkg+vZQ1IRhS8jUOQVyWB+Jd0uWSAGV1ixXRtQ50GKNdHVymjRA6qxVToWmL+vXKNfSM4mzAD6fMdDEJ3YK1EKanZlPGgu4gmXa7yjQJ679x7pS2afY6zYYdl3IOg3QtA/XMiiI5G/LEPZrF/pkC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(966005)(6486002)(122000001)(33656002)(66946007)(66556008)(64756008)(478600001)(76116006)(66446008)(38100700002)(66476007)(186003)(8936002)(8676002)(4744005)(6506007)(54906003)(86362001)(36756003)(6916009)(2616005)(4326008)(44832011)(316002)(83380400001)(53546011)(6512007)(26005)(5660300002)(71200400001)(38070700004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFNnWlJKU3BEUDRsSWtnZkxsbHVQRjJJSlNHeE11Y21uMkM5WDhkbVJ4MElm?=
 =?utf-8?B?T0dhM3l5dTk2V0hKYVNLQk5pWFU1d3hBM2I3UzRCUVpLK2dzWE9PS0xvUUp0?=
 =?utf-8?B?bllIZXVEVm1RL3FDV1BXRWpBek9OODZNcm1LSXZnU1M3cjNqTVd6TTJ5bkJ2?=
 =?utf-8?B?MVlqcFVINTlJc1pHeTYvZUY3RmZDSjdzSFV6aXN2THNRQmtCWDZMUnBRZnFZ?=
 =?utf-8?B?czdBV0ZWcGJlSXZhK0E0MDlxanBwU0ZTOCtKR3ZWb3drQVh0dzlKSFR6Z2Rt?=
 =?utf-8?B?NDNaaXBUMys5L0FjQVY2cXo5VmR0TDIrbm1YWG1GWHNzTVYvRFlpTG9WUFZl?=
 =?utf-8?B?RzVZaTdZcEM5ei84MERwUnp3UTR5VmRrMXo2QXIrT2hwNWJTckZhTFFFb1RQ?=
 =?utf-8?B?NTc5V1d0R2FHRHphMVZtMlIrakszN3lESEJ4UlB5SkVKOGJOcWM5OUhxZThH?=
 =?utf-8?B?aTZ3NExlRzY5WVZLQ05qRzd2OTVNLzhDKzhuV1ZPeXJZbk0raFNXYndwcHRG?=
 =?utf-8?B?bCs5enpydDVPRVRRenJpUEZQUjdGYUhTNGo3U1FGSE9tSkNjZkZuWVU5SkFJ?=
 =?utf-8?B?THpuek55VTg0VFpDbUh5RnJsK1dFblBWbjNsdDU4cHpnNTgxVG92b3kzVFBr?=
 =?utf-8?B?SmF6N2I4Y1ZkS2xzc3FNWVUvRXRPa2tVbDZCYlYxaUVRU21jV01FOGl5b0cy?=
 =?utf-8?B?ZUtwWlpwYlU5M2NGVWtQR3pvZUl6aitwYi9iVCtjR2xGeUlINjhpL2dLeHVu?=
 =?utf-8?B?bUJlQ3lLTW1aYkltVlhwRHVnZXZ0Y3NHRHhYWHdpR2o0QU92M1BrT0Q5blJp?=
 =?utf-8?B?SEsvbVZmN1lPTmRqdTJQd0p0VW0xeC9wU3NabGR4c2pSTUkzS2tiWVRsb2RC?=
 =?utf-8?B?SUtCWkhDN0FldEY5VnRMK1hMRzdFN3dFU1Q2dnZ0QldJMEtuNVNJSXFpUzQx?=
 =?utf-8?B?ejAxRW0rV1l2REEwdHk4aDVXT2JQK1ZlWXpsRCtuVUZtTnFiWlZzQ3NxYmc3?=
 =?utf-8?B?RXhGZFQ5WThlUTRMUlJEcG5TVUdIV3MxU09lS3dWbXA3dVMrOHhpcXR1eVdT?=
 =?utf-8?B?WklrWDh2bUhXNlFkeDhMNjRMZ3VRVmZqZTlqQnNmZC9ubFBNU2Q5K3pGdUJ3?=
 =?utf-8?B?ZVJwayszeDBHeUR0M3QwemN5ZHJRTWh4ZUlVT3NWd1V3N1hpSEwvT213eVk3?=
 =?utf-8?B?TDh2MGxGUzRQWS9qMFJQcWxJaE5pSThBalNHeExSNW9xNGpTMFQ2VmN1M2tm?=
 =?utf-8?B?a0xLRVMyYTVZbmZzODNESHRGb3p3M1JXYmhuZDRMdmt4OGVFNGF3OWRWcFAr?=
 =?utf-8?B?TnEzOWFpUDlWMHBPOGJ6RGFublNnRnZvZENjNlJzM1MvRkd0eTc5YVorYWsy?=
 =?utf-8?B?dkNEZFVOb1dvWjhsSEJoK1VobzZDVVZSZTR6dVB0Ky9mZU8yUGZIbkJad2Zi?=
 =?utf-8?B?MWc2eDBEdDZ6SHl4LzR6TFQ3bThuSHptcmlob0xWaElLUjBjelo2RU43eEM0?=
 =?utf-8?B?K2xpd1lwUWJ1djNBcDdvNExJd0F4TzNUdHY5bTA1SElXaE5Oc3FxTlVNWGs4?=
 =?utf-8?B?UlVCZzhuYkloWTZ2MVAwTzNKclRtQ0E5RTVpcHVLODBPMW83SEhZVGtVanRK?=
 =?utf-8?B?cS9MRXJWSGZwOGpiejBmOHB0Smx1TnlNV1hPam9hd2VwQkhjcC9TYTh2TitX?=
 =?utf-8?B?ZlFyOXBmZVcwTU4xSTBvMW9kZ1RqWEoxUzNITi9DOUh2bHBpaGlsUUFvS2xo?=
 =?utf-8?Q?YtBdeEZWxRhrm5biTf5z+zCZgw7jdmHWd7bpVLn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29B0A342984F5F44849AC0CF093028B5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72081406-fd78-4569-c1a7-08d947a003b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 14:51:23.1046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGzQBZ37cQKe/a5bQXtDqyP0Ib7xUaJurNABydCXQQ0AIcN3gfrHmPXAkTqv9qIwJt3pIKaaSRAeeWZOjEQmhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4932
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10045
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=980 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107150103
X-Proofpoint-GUID: FRnO8O_ap4E4v8P1F52aFDmIl0VpbmV3
X-Proofpoint-ORIG-GUID: FRnO8O_ap4E4v8P1F52aFDmIl0VpbmV3
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 David Hildenbrand <dhildenb@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVsIDE1LCAyMDIxLCBhdCA5OjE2IEFNLCBDbGViZXIgUm9zYSA8Y3Jvc2FAcmVk
aGF0LmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gRGF2aWQgSGlsZGVuYnJhbmQgd3JpdGVzOg0KPiAN
Cj4+IA0KPj4gSGksDQo+PiANCj4+IG1heWJlDQo+PiANCj4+IGh0dHBzOi8vbGttbC5rZXJuZWwu
b3JnL3IvMjAyMTA3MDkwNTI4MDAuNjM1ODgtMS15YW5nLnpob25nQGludGVsLmNvbQ0KPj4gDQo+
PiByZXNvbHZlcyB5b3VyIGlzc3VlLiBJZiBub3QsIHBsZWFzIGxldCBtZSBrbm93IGFuZCBJJ2xs
IHRyeQ0KPj4gcmVwcm9kdWNpbmcgKHdpbGwgaGF2ZSB0byBpbnN0YWxsIGF2b2NhZG8pLg0KPiAN
Cj4gSGkgRGF2aWQsDQo+IA0KPiBZZXMsIHRoYXQgZml4ZXMgaXQuICBTb3JyeSBmb3IgbWlzc2lu
ZyB0aGF0IHBhdGNoIG9uIHRoZSBtbC4NCj4gDQo+IE1haW50YWluZXJzIChFbGVuYSwgSmFnYW5u
YXRoYW4sIEpvaG4pLA0KPiANCj4gQXJlIHlvdSBwbGFubmluZyBhIFBSIHdpdGggdGhpcyBwYXRj
aD8NCg0KSGkgQ2xlYmVyLA0KDQpXZSBwcmVzZW50bHkgZG9u4oCZdCBoYXZlIHBlcm1pc3Npb25z
IHRvIHNlbmQgYSBQUiB0bw0KdXBzdHJlYW0gKFBldGVyIE1heWRlbGwpLg0KDQpQcmVzZW50bHks
IHdlIGFyZSByZXF1ZXN0aW5nIHNvbWVvbmUgZWxzZSB3aG8gaGFzDQpwZXJtaXNzaW9ucyB0byBk
byBQUnMgb24gb3VyIGJlaGFsZi4gV2Ugd2lsbCB3b3JrDQpvbiBnZXR0aW5nIHBlcm1pc3Npb25z
IHRvIHNlbmQgUFJzIGdvaW5nIGZvcndhcmQuDQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiAN
Cj4gVGhhbmtzLA0KPiANCj4gLS0gDQo+IENsZWJlciBSb3NhDQo+IFsgU3IgU29mdHdhcmUgRW5n
aW5lZXIgLSBWaXJ0dWFsaXphdGlvbiBUZWFtIC0gUmVkIEhhdCBdDQo+IFsgQXZvY2FkbyBUZXN0
IEZyYW1ld29yayAtIGF2b2NhZG8tZnJhbWV3b3JrLmdpdGh1Yi5pbyBdDQo+IFsgIDdBQkIgOTZF
QiA4QjQ2IEI5NEQgNUUwRiAgRTlCQiA2NTdFIDhEMzMgQTVGMiAwOUYzICBdDQo+IA0KDQo=

