Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A63A3CF968
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:12:45 +0200 (CEST)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oc8-0003mE-AA
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5oWG-0004Bg-JG
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:06:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5oWE-0004FZ-7p
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:06:40 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KBuhZ6012958; Tue, 20 Jul 2021 12:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=IwhwsKyrJzQddmUgqWqc6kTQSJJf668+BZq1H5GN/rA=;
 b=QySRtqdVoL/5UbOgGN/UIAUsphOHK7ljs0BKipNfPhkDPfWxoyklmvwhQj7toO0wq5gk
 yHKd5QmKZ9sJKpDRiqV6w/xpajTtulPLLlweMFGmxh1YtR/BolbbZCn6FpNXIisnkKVk
 twttTO5BGW8/IQ2MmPL4q/BBDCLqx1JsxpAhBBH9GK0cHdcgyVmuZWLwaT4fZn9j2mVk
 avZDQMD78JAioCqCKCHw+qWBT6c+ZwPw+KUH/XrGK8/XI43dqGUVOWYGItbAyK+783I4
 j51X6clKlJV+NjLZD7cSmzuCN7QWsakLH4f1VcRX8eTtM4XLbYU5rukZuvmJDL295qrx 4A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=IwhwsKyrJzQddmUgqWqc6kTQSJJf668+BZq1H5GN/rA=;
 b=0WGi7WvqGTT1/ILgouxhS/VItNKNZlyXptEqNPJxLKzqAjzAV+2fjfSKivEgIMbnBF2Q
 sxjVZ04oSaui+ZuylZ+BlLiF177i1iEyqmNR4g2UIOQJBOPnbEvXKYNlhQYb15RX4Lkr
 4eOaqLbk5QjlAsw1HQoX1vMyjFpExJHGZQxvQIsqo24LKO9wH1JvcPocLSM2L9IMCmSu
 L/RY6Jj9APhPVA+dC03Q+jXeU9cOJu4zc4GqPfru5cTF65vHooxOD3vDkJgxdOFDdAHz
 SpKKoFyyLUeY4jP3DwaXeAiSfij6gVLGozs39CpgB7iP+G26JcV3AXxL9w05sR7GqvQB Lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w8p0th7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 12:06:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16KC6JBi066969;
 Tue, 20 Jul 2021 12:06:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by userp3020.oracle.com with ESMTP id 39v8yuu03k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 12:06:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhREBnsyOS17UPNi7WzXmEzPiVEL36TWZyEnlt58LEbnlN8JjhCE2zeJGCOFgogedfsFfa+0xtVAOu4BZeH2kpu0CgsQEIrjZD8lkoX5TfEdN0YqJzGE5uMAkQ+jnNktSC3IHOhbMCxj/14xLGkMqJLFu3h06UYA2aRvKpXdkS1IQzPNVuxLhVf9SzToX8h+OHcSiR39Ib7E6xVwSFQ8tqxuCnWjbYNonZsYc/CoqFKKriFlarpa4IY09vGL7Cuy42/0mBUQkyqLRo/yFvxXKlXuR6YNCkTyz3NTZUvTpG4euAivMfMKswuPrb6eQ3wGDo3pxh5dt6U5KZ682R5RAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwhwsKyrJzQddmUgqWqc6kTQSJJf668+BZq1H5GN/rA=;
 b=SEfiBrtePjKe2uOmZWyLiD8ZI60oHHeNi4uNaDI5YArvrY2jOfAHS936djXrY/6XM3VNwGTaR8qFgpUcBssgVQSCdkArEk5Zf2HBSTu8y1hacV97R2YPSBmT4XrDOhxT6iGdRm7FtxlC4j/6l6hMg4j+ZNfVSO+RbJfKVh9SeSgLOZUTSUPRcf6vh8F/J5R9vhaMKPNTXmMi0aMJaD1ShPMPrq9MgEhXEIvu0sZzBg+njMXIXWmvxfFQ3pLw5XI9ctW9/eBklFpoix4XxYAiWDPSgRyHTht8yxUN3ywAjwqB9CGJJlsEQrMP7y69xe3nVOfQRE2WbgtdnO1UJtLXEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwhwsKyrJzQddmUgqWqc6kTQSJJf668+BZq1H5GN/rA=;
 b=ZZSzs+tbuI3ziTeXUOtNHdLxzCcwo6BR7+fwD8jV7cz9OJFtGjh0+cDuNVMpeHTYyIesRc+AfQMrrx11UranRoY48cBrRZwhgWzNEX1/ILyH+wwT/q8WrUUBcL9S4tPRd6FoMG6eKMPuwETo1KkYjqz72HOB3bbjwbA9UCOrFkc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3918.namprd10.prod.outlook.com (2603:10b6:208:1bd::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 12:06:25 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 12:06:25 +0000
From: Jag Raman <jag.raman@oracle.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH RFC server 01/11] vfio-user: build library
Thread-Topic: [PATCH RFC server 01/11] vfio-user: build library
Thread-Index: AQHXfNdu8AuD3dDwpkyqaJzy0J2kG6tKvmEAgAEHQ4A=
Date: Tue, 20 Jul 2021 12:06:25 +0000
Message-ID: <0268673C-D5FD-4288-B7E6-B4B6D3CCCD23@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <5002d6a67cb6c429b2e3d21e106b468176e82a1f.1626722742.git.jag.raman@oracle.com>
 <20210719202409.GB1443636@movementarian.org>
In-Reply-To: <20210719202409.GB1443636@movementarian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
authentication-results: nutanix.com; dkim=none (message not signed)
 header.d=none;nutanix.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dfb41f6-823d-4baf-b2fd-08d94b76cc3c
x-ms-traffictypediagnostic: MN2PR10MB3918:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB391814C65FC8E8AD2442117B90E29@MN2PR10MB3918.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A4adX4MOYT2t0ZVHh5ILLauRMwG3cYWIoCNstAG6nCDB6DCMNIQv5tEMDJ08rkqS3oUCtfSutJ8hYJOQ1/25+RW6w1Ho/KAoA6xUnOisPHcUZHq7fi5jimtpN0MY9hFG+0OvZHEYS8n5hGr6v49XPJLrIC7XCAONTmi9QxXeybz1b5XIV7XHVTJU+9qpmVG3Y4Gsm3dap+qVo7eZjuEhayvIT6IZR42m9AKqJFghQ4csZby3+5UtKS8fH0Mfze8vTqCWcoXpqnsLUA1ZfTBglAcfhuZkTsLg3tLKCOFI9OFrIl3PALV0+QPKbqppM5Uc3SfSFoXV8nmyEk7bJ5/Pr1EuBUlNkkTt8rl1sFV03tnvj/3L06R+iL2B+zkK+lO/SN3wX8xRimUKAU1peCMeyL9REl0cu3pc8Z+xnWCcbPTCXR3ss5U2MaE716iojzYDAhpqAFBIBAaAFBq0VsGJs335yHjI9BcfeWlKMF1Ur4GCLlLwMCileP13+loLQN5lGgHoIBKJapPlVcCRRjliPnyvvbj0Zm9whzR03mhULAmbkuGQk6G29qZ5R1YVAsutaQ7sANs0nUCdSFOIb5z6B9Hewnirj8V/LP+MoUQIv9/QPGHdyhTZBEynk3gNCWwFsjIjjHw/6mD/r0JugQVvQs/CdwXU80cB3T+0TiS8JKhu70CIC2Yuk5335hbEpA1ByN/VLH8kBuPqV57u05bXoHp8obzFglVSU/wh7OIyfgI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(376002)(136003)(39860400002)(54906003)(8936002)(2906002)(6506007)(4326008)(186003)(66946007)(6916009)(316002)(2616005)(71200400001)(7416002)(26005)(296002)(44832011)(122000001)(38100700002)(53546011)(66446008)(64756008)(66556008)(5660300002)(8676002)(66476007)(36756003)(76116006)(91956017)(478600001)(6486002)(33656002)(6512007)(86362001)(38070700004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk5uYVlKM1lLMjJpOWNaeXM4TVlWcjQvM2p4Z3lFa3UvdGN3d05TZ2FybzVR?=
 =?utf-8?B?WlVpb3BhMlllQ20xd0FlRWs5SDB0REZyeks0QkQvOG15anYraE1QY0w2dkFI?=
 =?utf-8?B?TmRJQUNEd29MOTdqNDVISFlDdjAyaUlPN0hHcTh2SUYyOUlBeHBsc1llL0t1?=
 =?utf-8?B?TjFGK1YzVmJXQXFzZ2pTTU1ZQUZvTTgzcUlydlduVkE4ZjAvSGdNUWxNMmVI?=
 =?utf-8?B?Tk5vTUFFbDhvaFNJaUZvNVpjREhucG1md2EwUk1YYloyWGFKOE9WT0xTY1pl?=
 =?utf-8?B?MU9OWWhidkZjeHBKbDBhRGpuU3lkbGNFSDVnc2tkSVlxaXpzekxrQ09GWVRP?=
 =?utf-8?B?WjBBVFQydlcxU0dySVFkSFJxM0w1ZXIzWVJydkVlWnY5Y1J4NTY2aDl4OHAx?=
 =?utf-8?B?THFHckFCbkYvcTJFRmJFU0NucUtuU1JQWVBmSVZ2bFU2Nmo1cEFzZkhYVVIx?=
 =?utf-8?B?Wmlid2dkUzcyTCtQT0NBbDIwZGNYSTVucnppeTV1NEFaQ2JFVTNoeFVqSDdG?=
 =?utf-8?B?SzRnWkp4QU9CcXpZVkxJMSttUEZ6Vmc2QVZSL0FjWFE2T2JCbEQyZmZQQUpT?=
 =?utf-8?B?SWN2Y3RvUUM0RURFSXFrdFVZNngxeWtIODNSTDdKeTdybzQwckE5QXo3UXh4?=
 =?utf-8?B?VEZNcXp4VURReHBuOFpkSEs1UXBkcE80ZTc2YmhrallUeHZncWxiemRBcGhV?=
 =?utf-8?B?MjJWUkpHQWdnTzBWTjg3Rml4WXB2NUptcVFhQVZkYUt4YXFhL1gwWTdSNW0w?=
 =?utf-8?B?RXE4T21QUlhpRU9wdEVmQnVxOWhCaVl3L3BUa1lyc3g4K0l6SGFxd2NkcmNj?=
 =?utf-8?B?azNkSXcyQk1TaEc4aEJ6Z2wzWlE2dnk5TEtPTExRV1lHN3pRTGc0VVJMeE92?=
 =?utf-8?B?ZCtqWnRVNy92QUtBZlB4Z3BId1h3TkRILzJYRW9oSmVtN3BpQmk2blVRTndq?=
 =?utf-8?B?MkFNTno4bUN0eWdxZ0lJOVZPNUtYSll3aGVQbk5LN1hpT0F5V0FpS0FzSFI2?=
 =?utf-8?B?SEl4U0lHdTFwTjArNEluZlBhbTJzOE1IeWFoTlp3cFUwVHlKMU14OUNvNWtS?=
 =?utf-8?B?UE1kekFGSDJYaVlRUGNPZUlUeWtkS21IWThyNWlDVkhYdDVmL1daVzM2RklB?=
 =?utf-8?B?VUZwSXpmWHp6bjFjT2tMQTU2bkhrVUdkeTNJUW5UTjdrWHNjajFIZGRKTDhT?=
 =?utf-8?B?WjlKbEp5dVBXL0RNTEw0dXJ3cUNmdzBtY1FUeVluTXVGVFZCbDNJOG51WVRt?=
 =?utf-8?B?R3BBTStZcElxQXlFekxtdHN4Sno2SnhKcHcwRUZIamJRbUEwdmYyYmJKZEdw?=
 =?utf-8?B?VURFVmxMM3o0UjlYOEMrTTJQenVtdnJaQ0ZBZ2c2VGJtMkh6YkR6bXNBRlZL?=
 =?utf-8?B?aklwSUxwaWFjdHdtTnFBWFk0MWFCOVRPdnlTYnIzOGxBYlcyZmdSVGpRN1Nw?=
 =?utf-8?B?Y3FLVWRFK2hNZFo3TER1bnZkbnMzNE0xMXlMS0JaMFo0WFhPZEJaM1M3aUFv?=
 =?utf-8?B?WjZmbjJvaTk2MVFtajNhWFN3Y1l1b1ZlVGxoUGxUajAwYldhMFBHM25CY2RX?=
 =?utf-8?B?b2F4SUV3VXNDYUFzYjdXbHdTMWNuUXhUR0pVeHBHWjdQUENEelJSVzQrZjdD?=
 =?utf-8?B?S3M3VUQ1dDZaamVRSG9rUGVrWmhyelpkT1M4bXAvMGpXTEhwN0JmMHFEdmU3?=
 =?utf-8?B?S25WaVFiTUNQNzkySWluenA3cXNJc0duNEwza2dvcEVycHRkbzN4TnkzL0ZU?=
 =?utf-8?Q?wB+5CLwnb/L0FbMUmIOavtXvqFm/ockBAG2GBHD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28F53179E147AA4593C4F0623924DC4A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfb41f6-823d-4baf-b2fd-08d94b76cc3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 12:06:25.3460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fHh2F/RK7HVWGdJQmraCTZAjhZq6s8A2kfsYFqQOw2SVDpJQFOrUUk5hoR+nsO22vOK4VFvtMFHA5Cez/cp29w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3918
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107200077
X-Proofpoint-GUID: pvnGWnCmuiMiFbAk6qIvl0Hx8TmNwQaW
X-Proofpoint-ORIG-GUID: pvnGWnCmuiMiFbAk6qIvl0Hx8TmNwQaW
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVsIDE5LCAyMDIxLCBhdCA0OjI0IFBNLCBKb2huIExldm9uIDxqb2huLmxldm9u
QG51dGFuaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgSnVsIDE5LCAyMDIxIGF0IDA0OjAw
OjAzUE0gLTA0MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPiANCj4+IGFkZCB0aGUgbGli
dmZpby11c2VyIGxpYnJhcnkgYXMgYSBzdWJtb2R1bGUuIGJ1aWxkIGl0IGFzIHBhcnQgb2YgUUVN
VQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZA0KPj4gaW5k
ZXggNmU0ZDJkOC4uZjJmOWY4NiAxMDA2NDQNCj4+IC0tLSBhL21lc29uLmJ1aWxkDQo+PiArKysg
Yi9tZXNvbi5idWlsZA0KPj4gQEAgLTE4OTQsNiArMTg5NCw0MSBAQCBpZiBnZXRfb3B0aW9uKCdj
ZmknKSBhbmQgc2xpcnBfb3B0ID09ICdzeXN0ZW0nDQo+PiAgICAgICAgICArICcgUGxlYXNlIGNv
bmZpZ3VyZSB3aXRoIC0tZW5hYmxlLXNsaXJwPWdpdCcpDQo+PiBlbmRpZg0KPj4gDQo+PiArdmZp
b3VzZXIgPSBub3RfZm91bmQNCj4+ICtpZiBoYXZlX3N5c3RlbSBhbmQgbXVsdGlwcm9jZXNzX2Fs
bG93ZWQNCj4+ICsgIGhhdmVfaW50ZXJuYWwgPSBmcy5leGlzdHMobWVzb24uY3VycmVudF9zb3Vy
Y2VfZGlyKCkgLyAnbGlidmZpby11c2VyL01ha2VmaWxlJykNCj4+ICsNCj4+ICsgIGlmIG5vdCBo
YXZlX2ludGVybmFsDQo+PiArICAgIGVycm9yKCdsaWJ2ZmlvLXVzZXIgc291cmNlIG5vdCBmb3Vu
ZCAtIHBsZWFzZSBwdWxsIGdpdCBzdWJtb2R1bGUnKQ0KPj4gKyAgZW5kaWYNCj4+ICsNCj4+ICsg
IHZmaW91c2VyX2ZpbGVzID0gWw0KPj4gKyAgICAnbGlidmZpby11c2VyL2xpYi9kbWEuYycsDQo+
PiArICAgICdsaWJ2ZmlvLXVzZXIvbGliL2lycS5jJywNCj4+ICsgICAgJ2xpYnZmaW8tdXNlci9s
aWIvbGlidmZpby11c2VyLmMnLA0KPj4gKyAgICAnbGlidmZpby11c2VyL2xpYi9taWdyYXRpb24u
YycsDQo+PiArICAgICdsaWJ2ZmlvLXVzZXIvbGliL3BjaS5jJywNCj4+ICsgICAgJ2xpYnZmaW8t
dXNlci9saWIvcGNpX2NhcHMuYycsDQo+PiArICAgICdsaWJ2ZmlvLXVzZXIvbGliL3RyYW5fc29j
ay5jJywNCj4+ICsgIF0NCj4+ICsNCj4+ICsgIHZmaW91c2VyX2luYyA9IGluY2x1ZGVfZGlyZWN0
b3JpZXMoJ2xpYnZmaW8tdXNlci9pbmNsdWRlJywgJ2xpYnZmaW8tdXNlci9saWInKQ0KPj4gKw0K
Pj4gKyAganNvbl9jID0gZGVwZW5kZW5jeSgnanNvbi1jJywgcmVxdWlyZWQ6IGZhbHNlKQ0KPj4g
KyAgaWYgbm90IGpzb25fYy5mb3VuZCgpDQo+PiArICAgIGpzb25fYyA9IGRlcGVuZGVuY3koJ2xp
Ympzb24tYycpDQo+PiArICBlbmRpZg0KPj4gKw0KPj4gKyAgbGlidmZpb3VzZXIgPSBzdGF0aWNf
bGlicmFyeSgndmZpb3VzZXInLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
dWlsZF9ieV9kZWZhdWx0OiBmYWxzZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc291cmNlczogdmZpb3VzZXJfZmlsZXMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGRlcGVuZGVuY2llczoganNvbl9jLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbmNsdWRlX2RpcmVjdG9yaWVzOiB2ZmlvdXNlcl9pbmMpDQo+PiArDQo+PiArICB2
ZmlvdXNlciA9IGRlY2xhcmVfZGVwZW5kZW5jeShsaW5rX3dpdGg6IGxpYnZmaW91c2VyLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5jbHVkZV9kaXJlY3RvcmllczogdmZp
b3VzZXJfaW5jKQ0KPj4gK2VuZGlmDQo+IA0KPiBXaHkgdGhpcyB3YXksIHJhdGhlciB0aGFuIHJl
Y3Vyc2luZyBpbnRvIHRoZSBzdWJtb2R1bGU/IFNlZW1zIGEgYml0IGZyYWdpbGUgdG8NCj4gZW5j
b2RlIGRldGFpbHMgb2YgdGhlIGxpYnJhcnkgaGVyZS4NCg0KK21haW50YWluZXJzIG9mIG1lc29u
LmJ1aWxkLiBJIGFwb2xvZ2l6ZSBmb3Igbm90IGFkZGluZyB0aGVtIHdoZW4gSSBzZW50IHRoZQ0K
cGF0Y2hlcyBvdXQgaW5pdGlhbGx5LiBJIGNvcGllZCB0aGUgZW1haWwgbGlzdCBmcm9tIEVsZW5h
LCBidXQgRWxlbmEgZGlkIG5vdCBtYWtlDQphbnkgY2hhbmdlcyB0byBtZXNvbi5idWlsZCAtIHN0
dXBpZCBtZS4NCg0KSm9obiwgDQoNCiAgICBUaGlzIHdheSBhcHBlYXJzIHRvIGJlIHByZXNlbnQg
Y29udmVudGlvbiB3aXRoIFFFTVUgLSBJ4oCZbSBhbHNvIG5vdCB2ZXJ5IGNsZWFyDQpvbiB0aGUg
cmVhc29uIGZvciBpdC4NCg0KRm9yIGV4YW1wbGUgc3VibW9kdWxlcyBzdWNoIGFzIHNsaXJwIChs
aWJzbGlycCksIGNhcHN0b25lIChsaWJjYXBzdG9uZSksDQpkdGMgKGxpYmZkdCkgYXJlIGJ1aWx0
IHRoaXMgd2F5Lg0KDQpJ4oCZbSBndWVzc2luZyBpdOKAmXMgYmVjYXVzZSBRRU1VIGRvZXNu4oCZ
dCBidWlsZCBhbGwgcGFydHMgb2YgYSBzdWJtb2R1bGUuIEZvcg0KZXhhbXBsZSwgUUVNVSBvbmx5
IGJ1aWxkcyBsaWJmZHQgaW4gdGhlIGRvYyBzdWJtb2R1bGUuIFNpbWlsYXJseSwNCmxpYnZmaW8t
dXNlciBvbmx5IGJ1aWxkcyB0aGUgY29yZSBsaWJyYXJ5IHdpdGhvdXQgYnVpbGRpbmcgdGhlIHRl
c3RzIGFuZCBzYW1wbGVzLg0KDQo+IA0KPiByZWdhcmRzDQo+IGpvaG4NCg0K

