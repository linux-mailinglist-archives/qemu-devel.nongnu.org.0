Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD8B406DD6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:00:01 +0200 (CEST)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOi0W-00066j-Bg
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOhzR-0005Ic-EU
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:58:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOhzP-0002GW-3B
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:58:52 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ADwY9W002721; 
 Fri, 10 Sep 2021 14:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=99eNXp011yRUAVaUcMAaEwv1lKDZ/P/CVQYl8y/1Lwk=;
 b=w/UQ471urYt8ZXWYwXkxLkpa6QqPjwShVaaJTp8goVAARYFpUqcdY/3cfiQuocOZjLca
 OpoxtsqIM1IjG13Leg8sH8B2Rg2HIwhnx3t3QQYJvcOyDJhwrgTpLLkXlpw050bNlXpN
 SEOjb7VPRVcy8uY+a6plPKpodphzGzXZCA9vtkl1pW3fO7+2MzH9SkWpNafWWA4gKkRa
 IkdP6l0OEJD6QDYGj4m95F3FadymSUWDmqcHwsUqQEoL7nBwf4kuz3K/7d3WFLSCiG5Q
 6zKDBvtL3DndygRMiwqEDFcVOxv25L/qmtCHKnxh8bGHkE9CgLdv1xt9VDJWlNCCKr5A LA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=99eNXp011yRUAVaUcMAaEwv1lKDZ/P/CVQYl8y/1Lwk=;
 b=m4RrVSN2xKGrCgw6zymVmsEQKh0MkP7tYk+m86GlkEMEt9hZX33+6GIz0OBTn5QgPrT5
 8U9eqAylEDbBqTFZYOEhG5nQM/0m45Jh30zE2Ep0Q7nInlWuNGJnf/EEXfMMmk14caNL
 dcGCA7CZZPiUU/TS7CmewYSSYXG8TsqDaIKKufiZ4fRnhyu0Ru9Urwu/YgjwyBGtL0dX
 fBmhvFT6cQhNFjYPUJyEqO5xgrNE2JYnwICq7TBJ9LPy62xBoMPwqC+LZQejnO3o8P+L
 DwkFWz9BIaise3goVvebWskCGw6RQxsoCydMBCTWpNG0CAPoE1EAme8mxMJ6urLJl3t1 XQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aytx4t5nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:58:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18AEowhB105095;
 Fri, 10 Sep 2021 14:58:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by userp3030.oracle.com with ESMTP id 3aytfu0vy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:58:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WddVnnm/UZve4IGehcMzygiPluejWNpC5mxlB9cZoOjgD8Bm4lhTaBl+QkeYnVH/hKbrXU56kyG2RGVhayxk2v2pr+2bho4LRM2viN98VZfgl1jnfGZ/32E2A6PO3KzwTiMgwOce1sOO3bcSHphlhqIw9WDQnp1lo3ktX54MBcefp6AkciNz0t3xLCudC728Aqfdftz8DsxmBqQnZiWmYIyvFz76gCpzWn2Jf6yC8vssP9cIMONBFrOCtSFyuIEBycQXVVo/vZAeiNuOvLED8rEU5TrMhbt3ZS0YcggIY9IT6SEQe70JGJNwMC1vNMINEGU9JaFvVb1OU7josUs6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=99eNXp011yRUAVaUcMAaEwv1lKDZ/P/CVQYl8y/1Lwk=;
 b=AW9mHF961CSl6YDk+YnRp66pzAXRmbsLnyxXcDOSlt+PBS2MTZt1TSZRVIqXlGWPDfdTuNA0p/gk8jML6VJCnqqamuHW64l7FmngIw9Onlo7j/bRtrO0LX/sJ7yC8TAKZv2aBhOEGeLMSl0lpq/WHsavN5W5emEGiRy5IIyMweuyt1oIcviL0P/YHv6ytBab30ffBFs8UQlz2pxc3QVaj9noFUPbaOeGEfe15nFeAqT3l2aBJSburgUY/ciJFR/3+AKqf2ARl4zkZgQrNDvUJb1LuEDPhVacCHaW+u/DojEFH5laFShmoVNjO4rXFPloOPR2tQH+8wFjXuvcvUzTdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99eNXp011yRUAVaUcMAaEwv1lKDZ/P/CVQYl8y/1Lwk=;
 b=hlGPevCYRZvba+3AbJGl8fX4uj+uTNKh8H5q9CrWFtn7n9VzVSzIskdoolSnGwvMbPZhaefm0mPNlUs0qVHEozVcKL3gNkwudSRODicU2H+mV6bsQTz62BThhrK7RGMHLCJ+xGrHh6n0e/KvLC7sUpzbco60WfdrLCCuvb+KxIY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3790.namprd10.prod.outlook.com (2603:10b6:208:1b5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 14:58:42 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 14:58:42 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC server v2 03/11] vfio-user: instantiate vfio-user
 context
Thread-Topic: [PATCH RFC server v2 03/11] vfio-user: instantiate vfio-user
 context
Thread-Index: AQHXm2a7/igOf+aR8kCLwlanOh4grquaJqYAgANLO4A=
Date: Fri, 10 Sep 2021 14:58:41 +0000
Message-ID: <EFF8EAAC-BF13-4411-A3C4-B4AF64E875A2@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <4bf892091b1c08c79907ee2460f5f7aa797139af.1630084211.git.jag.raman@oracle.com>
 <YTivRjPEi8mF+gK0@stefanha-x1.localdomain>
In-Reply-To: <YTivRjPEi8mF+gK0@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3a8e0f1-b4a4-4d53-30ca-08d9746b7ad7
x-ms-traffictypediagnostic: MN2PR10MB3790:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB3790265DF4A49E5D7A9C746C90D69@MN2PR10MB3790.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o3XrL9Pm4dAu5j1ruotsEA2y4GiPBtO19/85V8hbpFvYYFAEPgy+FscU3IF7ngboeFVn/5ucLEU4avB0MXtV2O8M/23CtRJlfIMK9qi2/W6HpjpnFj8zBe9k08RTg55KlaA9T+fnFMGscwd2sp0Obw6UuWcV1YbYU3LFaCc6Ckt1yAkun3FLL8kIB2EZ/3oHbCIMUjS+wjfSRIXovZ6rPJ1eVgAK9TLQwuACSoO1npLQjfw6Mt/l8mirEjvF4HJ3eRQ2/hsqWxdON+RXi7flg7xRTdSRHjeH5C93AKRQkhBIYzKxJ8f6P6KtkN3MVycIV/vfC6968LRPAUibD85ssm296GZtX07d1qxsu4QghRx8ju4c7e+x8hxN0ASq+nQGL9Rn/Dkhj3O2+Y5Tjmsk6LoC/3Jqz9CQ8ck7clIKXKAl1cMyThwQlMYhNaAPgccv/vstdj+X9BHMwlsiuT1BmzJnC9r/iYcR2dm9I9JaE/flRr0Dca0pc7l0ifRQalJzoJoVg9PfAc1lA6lbRgsdEzAsNlhc3xXWv4yZOUVvThIjI3QcXWtKuCEk/Jp1pUoXCsyeAxi4wuXN3J3/EGZtViKxPFNnXzufyEbyvFotHAFa8P1QrSgbfxJvMxdVw4EdWykbQeYVxjmdOwHA30IHbbvaAQ0OJQkpGLLll2XI+Mgbb82oG1tOW9fjbzEbkxKGYoBtMu7NXe83WE0NB9KrXKlNqwZoj7SM/tRII7KtdDbsuntLsNvTEM9N++hoPeBN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(122000001)(4326008)(38100700002)(186003)(66946007)(76116006)(91956017)(44832011)(8936002)(316002)(66476007)(66556008)(54906003)(64756008)(66446008)(6512007)(508600001)(8676002)(2906002)(71200400001)(36756003)(38070700005)(5660300002)(2616005)(33656002)(6916009)(7416002)(86362001)(6506007)(53546011)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHZuY2FFcFlUTEJCUEtCSGY1TjRlZGV1V3NhbUhtazlkY3BpY0xUNnpCbEdG?=
 =?utf-8?B?ZiszcXFWMmN3ZDhYdnZBYTZiRzdyT1BVTFVQVExEUkl6YVgrcml6aDBkL081?=
 =?utf-8?B?T2FUL0JDOExHQU9TVnFaUWpHZ2xNWm9DZXZJLzFTNGtyQnp5RUlVemZrTWpn?=
 =?utf-8?B?cWJQZWNvWjR6Z2lUVEVvdTVmanRaN3IwVG9MMG52Wk5rSVdUSDNSSnV4Z05u?=
 =?utf-8?B?b1dqbEhvems3Uy8rTjFSUGpFMitGU3h0WUw0VFhHbW5TZUdRT08rTmFPbTV0?=
 =?utf-8?B?S3JVN0tycHBhZ1J6Q2NDeVpYd1ZxQ3dYTTZEWFdoNHA0Z2dUTDJqVFAycFQv?=
 =?utf-8?B?OXJOZ1MvQ0p5eGtFa2lqS3c4LzN5MWFYV1VNRGFsUUVndlZKNUsrRldvSG1Q?=
 =?utf-8?B?V2JycDFJdkJxMDhKcERmcThUSE84REVNNzVwdUl2L2ord2hSNXZubHFqQlFi?=
 =?utf-8?B?ZTQ2YkZEZzJuN05kNTh3RGlhMU5rSVo2aFZMNUxOQ1ErQ3VpbE5qTTdCcDJj?=
 =?utf-8?B?bmJmYisyNGhLTUdiZUQrWTgzS1grSHVjTGVpTkpoeFhaOHkyQzZ5eWVjSWdM?=
 =?utf-8?B?YWtnaW9tQlJSMy91ZmtrUEFPdVBZSFRyMjZVcU1UUHdlQjdBekY0QWZpSDMr?=
 =?utf-8?B?NFJTZ05IZExoZE9Yd0l5OVhUQTR1dy92MTdsWER6dkhESnNScHFEbVhWd0Jz?=
 =?utf-8?B?YkdkR25TMENocDU1UXMwcG9qdHBjTFN2dThnY1pjQUJpMzhzN0hvZnpxbURn?=
 =?utf-8?B?WVNnTWt1cDBqS08vQmVFeHMwdkVJWWNsVGRtWUI4U2FNVnU3MGV4S2hveGZz?=
 =?utf-8?B?RFhmOUVWMGxGblBGcUd3L29IODFhUHh1bzhDVWREZXBaY1g4UmFpWUJpZE5I?=
 =?utf-8?B?eVhqOUc3MVZSZTF4dmlqTnY1YUI0RWgyY1gyWWwvQTJsS1pSZURTaVVsWGtS?=
 =?utf-8?B?Zm1IWklXclQrMHVzd1NOb2pvUUo5V1BpNk0zcE0xaEltTE1WZUxKUmRVeGZW?=
 =?utf-8?B?QXJzMjI2S1NldGJJZ3BvMmNGa09GdWx4TG5RWStKRWZQN2ppb0dXbVI5MERZ?=
 =?utf-8?B?SGpDYmwxYWZzZjh1RlZRQWN1T0xKeW1RbW5QTUxTbzdtTTdPNDFWWFpzdU5X?=
 =?utf-8?B?a1RQOTNXalI5VEpuRlI0SlhsQ09adUNTeGdIRHpNUFF4OXFwdW9NWEQrbXpt?=
 =?utf-8?B?VmgzMnM3aldJV2RPMEl3V2xHNlFtMnBkZ2VFS09MOTRaVUxwZG1JV1lVS0Uy?=
 =?utf-8?B?VDNxcHo3dWl3b3J5NVgzdktiU3RhUUtlZkFxM2Z0RFNIeTM3RWdGZE14dlJV?=
 =?utf-8?B?NWlEY1dXcFVYbFJUZEpYbFF1dHIyb3hWbklZZWw2cEdYLzVscmhQTEpUL3h3?=
 =?utf-8?B?R1JHeWNnL3htbXJPemR5NDB1YjIxK25HR2REampKRDFnd1NKZlhPVWN6Um9u?=
 =?utf-8?B?alJvVE9rd0lxRXdkeDU0eEVIbkNobE42bU9wV0ZXZ0tOTTdYSTlYWFd3MHM5?=
 =?utf-8?B?THFObXZQVWFMV2xxR1dyZ21HMi9saUd3L0p6Q0lPYlpnWkZDbGI2QzNVM0pN?=
 =?utf-8?B?ZmJaWEtCa0JpNmRYdFFncjNFYXhtU1dHWUZDSUF0YVphNFhNTk5LZEJGcjlu?=
 =?utf-8?B?L2FUeS95Qnd3dUF0U0NtclBHK241YUsyNDVGSHE3WGZFbnBDM3l2UHZOc3lC?=
 =?utf-8?B?Tk1rOU1sd1J1eFdtWll2MjlvbnkvMmlnR3NGUk5rMnNUS2NnT2gwUEI4eStT?=
 =?utf-8?B?WW1mZE1CRFp1Q05QZWRhd1JCK0RxMnNQelM2UlFVZkJIZzV6d3htbkliMmRO?=
 =?utf-8?Q?b0JYhliAiGJTs4E1LEtL8SlTQYeon98hifbUY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C016AE7AA09674EB2F664B253FB00A2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a8e0f1-b4a4-4d53-30ca-08d9746b7ad7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 14:58:41.8692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86GLGv9JfchTCsIiJJnT/CgbC6DCPOx34Ed588UK8BI2cirHvy+mj5oYmpdaveEpEjlvg7LebhcO8F5uXRjM5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3790
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10103
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109100085
X-Proofpoint-ORIG-GUID: KI30hFlbrc5WyaxfdBMKhjRW6bBl2rBb
X-Proofpoint-GUID: KI30hFlbrc5WyaxfdBMKhjRW6bBl2rBb
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
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDgsIDIwMjEsIGF0IDg6NDAgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEF1ZyAyNywgMjAyMSBhdCAwMTo1
MzoyMlBNIC0wNDAwLCBKYWdhbm5hdGhhbiBSYW1hbiB3cm90ZToNCj4+IGNyZWF0ZSBhIGNvbnRl
eHQgd2l0aCB0aGUgdmZpby11c2VyIGxpYnJhcnkgdG8gcnVuIGEgUENJIGRldmljZQ0KPj4gDQo+
PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUu
Y29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9y
YWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFu
QG9yYWNsZS5jb20+DQo+PiAtLS0NCj4+IGh3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMgfCAyOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gMSBmaWxlIGNoYW5nZWQsIDI5IGluc2Vy
dGlvbnMoKykNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2h3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMg
Yi9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jDQo+PiBpbmRleCA0YTFlMjk3Li45OWQzZGQxIDEw
MDY0NA0KPj4gLS0tIGEvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouYw0KPj4gKysrIGIvaHcvcmVt
b3RlL3ZmaW8tdXNlci1vYmouYw0KPj4gQEAgLTI3LDExICsyNywxNyBAQA0KPj4gI2luY2x1ZGUg
InFlbXUvb3NkZXAuaCINCj4+ICNpbmNsdWRlICJxZW11LWNvbW1vbi5oIg0KPj4gDQo+PiArI2lu
Y2x1ZGUgPGVycm5vLmg+DQo+IA0KPiBxZW11L29zZGVwLmggYWxyZWFkeSBpbmNsdWRlcyA8ZXJy
bm8uaD4NCj4gDQo+PiArDQo+PiAjaW5jbHVkZSAicW9tL29iamVjdC5oIg0KPj4gI2luY2x1ZGUg
InFvbS9vYmplY3RfaW50ZXJmYWNlcy5oIg0KPj4gI2luY2x1ZGUgInFlbXUvZXJyb3ItcmVwb3J0
LmgiDQo+PiAjaW5jbHVkZSAidHJhY2UuaCINCj4+ICNpbmNsdWRlICJzeXNlbXUvcnVuc3RhdGUu
aCINCj4+ICsjaW5jbHVkZSAicWVtdS9ub3RpZnkuaCINCj4+ICsjaW5jbHVkZSAicWFwaS9lcnJv
ci5oIg0KPj4gKyNpbmNsdWRlICJzeXNlbXUvc3lzZW11LmgiDQo+PiArI2luY2x1ZGUgImxpYnZm
aW8tdXNlci5oIg0KPj4gDQo+PiAjZGVmaW5lIFRZUEVfVkZVX09CSkVDVCAidmZpby11c2VyIg0K
Pj4gT0JKRUNUX0RFQ0xBUkVfVFlQRShWZnVPYmplY3QsIFZmdU9iamVjdENsYXNzLCBWRlVfT0JK
RUNUKQ0KPj4gQEAgLTUxLDYgKzU3LDEwIEBAIHN0cnVjdCBWZnVPYmplY3Qgew0KPj4gDQo+PiAg
ICAgY2hhciAqc29ja2V0Ow0KPj4gICAgIGNoYXIgKmRldmlkOw0KPj4gKw0KPj4gKyAgICBOb3Rp
ZmllciBtYWNoaW5lX2RvbmU7DQo+PiArDQo+PiArICAgIHZmdV9jdHhfdCAqdmZ1X2N0eDsNCj4+
IH07DQo+PiANCj4+IHN0YXRpYyB2b2lkIHZmdV9vYmplY3Rfc2V0X3NvY2tldChPYmplY3QgKm9i
aiwgY29uc3QgY2hhciAqc3RyLCBFcnJvciAqKmVycnApDQo+PiBAQCAtNzUsOSArODUsMjMgQEAg
c3RhdGljIHZvaWQgdmZ1X29iamVjdF9zZXRfZGV2aWQoT2JqZWN0ICpvYmosIGNvbnN0IGNoYXIg
KnN0ciwgRXJyb3IgKiplcnJwKQ0KPj4gICAgIHRyYWNlX3ZmdV9wcm9wKCJkZXZpZCIsIHN0cik7
DQo+PiB9DQo+PiANCj4+ICtzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X21hY2hpbmVfZG9uZShOb3Rp
ZmllciAqbm90aWZpZXIsIHZvaWQgKmRhdGEpDQo+IA0KPiBQbGVhc2UgZG9jdW1lbnQgdGhlIHJl
YXNvbiBmb3IgdXNpbmcgYSBtYWNoaW5lIGluaXQgZG9uZSBub3RpZmllci4NCg0KT0ssIHdpbGwg
ZG8uDQoNCj4gDQo+PiArew0KPj4gKyAgICBWZnVPYmplY3QgKm8gPSBjb250YWluZXJfb2Yobm90
aWZpZXIsIFZmdU9iamVjdCwgbWFjaGluZV9kb25lKTsNCj4+ICsNCj4+ICsgICAgby0+dmZ1X2N0
eCA9IHZmdV9jcmVhdGVfY3R4KFZGVV9UUkFOU19TT0NLLCBvLT5zb2NrZXQsIDAsDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvLCBWRlVfREVWX1RZUEVfUENJKTsNCj4+ICsg
ICAgaWYgKG8tPnZmdV9jdHggPT0gTlVMTCkgew0KPj4gKyAgICAgICAgZXJyb3Jfc2V0ZygmZXJy
b3JfYWJvcnQsICJ2ZnU6IEZhaWxlZCB0byBjcmVhdGUgY29udGV4dCAtICVzIiwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgc3RyZXJyb3IoZXJybm8pKTsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+
ICsgICAgfQ0KPj4gK30NCj4+ICsNCj4+IHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfaW5pdChPYmpl
Y3QgKm9iaikNCj4+IHsNCj4+ICAgICBWZnVPYmplY3RDbGFzcyAqayA9IFZGVV9PQkpFQ1RfR0VU
X0NMQVNTKG9iaik7DQo+PiArICAgIFZmdU9iamVjdCAqbyA9IFZGVV9PQkpFQ1Qob2JqKTsNCj4+
IA0KPj4gICAgIGlmICghb2JqZWN0X2R5bmFtaWNfY2FzdChPQkpFQ1QoY3VycmVudF9tYWNoaW5l
KSwgVFlQRV9SRU1PVEVfTUFDSElORSkpIHsNCj4+ICAgICAgICAgZXJyb3JfcmVwb3J0KCJ2ZnU6
ICVzIG9ubHkgY29tcGF0aWJsZSB3aXRoICVzIG1hY2hpbmUiLA0KPj4gQEAgLTkyLDYgKzExNiw5
IEBAIHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfaW5pdChPYmplY3QgKm9iaikNCj4+ICAgICB9DQo+
PiANCj4+ICAgICBrLT5ucl9kZXZzKys7DQo+PiArDQo+PiArICAgIG8tPm1hY2hpbmVfZG9uZS5u
b3RpZnkgPSB2ZnVfb2JqZWN0X21hY2hpbmVfZG9uZTsNCj4+ICsgICAgcWVtdV9hZGRfbWFjaGlu
ZV9pbml0X2RvbmVfbm90aWZpZXIoJm8tPm1hY2hpbmVfZG9uZSk7DQo+PiB9DQo+PiANCj4+IHN0
YXRpYyB2b2lkIHZmdV9vYmplY3RfZmluYWxpemUoT2JqZWN0ICpvYmopDQo+PiBAQCAtMTAxLDYg
KzEyOCw4IEBAIHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfZmluYWxpemUoT2JqZWN0ICpvYmopDQo+
PiANCj4+ICAgICBrLT5ucl9kZXZzLS07DQo+PiANCj4+ICsgICAgdmZ1X2Rlc3Ryb3lfY3R4KG8t
PnZmdV9jdHgpOw0KPiANCj4gV2lsbCB0aGlzIGZ1bmN0aW9uIGV2ZXIgYmUgY2FsbGVkIGJlZm9y
ZSB2ZnVfb2JqZWN0X21hY2hpbmVfZG9uZSgpIGlzDQo+IGNhbGxlZD8gSW4gdGhhdCBjYXNlIHZm
dV9jdHggaXNuJ3QgaW5pdGlhbGl6ZWQuDQoNClRoZXJlIGFyZSBzb21lIGNhc2Ugd2hlcmUgdmZ1
X29iamVjdF9maW5hbGl6ZSgpIGNvdWxkIGJlIGNhbGxlZCBiZWZvcmUNCnZmdV9vYmplY3RfbWFj
aGluZV9kb25lKCkgZXhlY3V0ZXMuIEluIHRoYXQgY2FzZSBvLT52ZnVfY3R4IHdvdWxkIGJlDQpO
VUxMIC0gd2UgZGlkbuKAmXQgYWNjb3VudCBmb3IgdGhhdCBiZWZvcmUuDQoNCnZmdV9kZXN0cm95
X2N0eCgpIGRvZXMgY2hlY2sgZm9yIE5VTEwgLSBob3dldmVyLCB3ZeKAmWxsIGFkZCBhIGNoZWNr
DQpoZXJlIGFzIHdlbGwgaW4gY2FzZSB2ZnVfZGVzdHJveV9jdHgoKSBjaGFuZ2VzIGluIHRoZSBm
dXR1cmUuDQoNCi0tDQpKYWcNCg0K

