Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA203CF172
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:41:12 +0200 (CEST)
Received: from localhost ([::1]:46022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ekx-0005IH-Il
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1m5ejJ-0003y6-Pw
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:39:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:1978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1m5ejH-00009k-Ls
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:39:29 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16K1UZTO015626; Tue, 20 Jul 2021 01:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=tg/uelKTjfmGlD3JqpzJN/Nalw5DTRijsbL9MovPeqk=;
 b=UVwjZbgoddJo0Z5cmuq0NeE6COMMojPeGfQnDHXKZzUFwdXzid7v1xxzwQShyO32LMd0
 JXGBnmZuoNcVoZnp6ol6xsrmrHbkBQUkmFNV2fBK+0zZUYrkjsbgva7l5YujqUjLOUMJ
 knqKl2By2HOWaQ+fSlH5KcwJFFUgADjDJrp8achvWhq4C1f94uVpYhZHCDOgeFFlw+3s
 N63ltPromijS9jNA1kpmggpaVIB3afVFgoCX+xQYhAQSphis1Q1Xer67T6bCAMSxp/hp
 vpafVPcZj4zy/S5iV+PfqrbqB4ylu6JNZ5PI0npQMEyPL/9As7jnUo5BoCzjyslzF21C EA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=tg/uelKTjfmGlD3JqpzJN/Nalw5DTRijsbL9MovPeqk=;
 b=toU2HpE6eHesHZb0GrV663ypdRbcswQsZ4FvDAe3Qr/mWMQT1klIBvROjM12n4HjAlWV
 5xZ0Fsm4x//FCYTxSSaH6KsWe3h1kFOT73X1gupb+mjndAwltGYI+OqbyYsvWB8m0FGW
 wFqYNIOKBjpAYhYXKCqn8MKIajEBI4eGOI6mhtoj5DvM24yFbNQSYiNKBxqaCjlvQJxP
 SPMOLdD7bGzvGscKD3B47zPfyi4hZnbDTfHWbKDcrS7HryyGuGR3YptfxR1PwU82Dgo/
 xsmfEor8Iihnh/CJFERltQcR9CTWnygGNnkITQMSBnmnTQxtatN4wyoMELvl71J9fVEL 6A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwtsja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 01:39:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16K1UH98031258;
 Tue, 20 Jul 2021 01:39:24 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by userp3020.oracle.com with ESMTP id 39v8ytvp6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 01:39:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZemBSUQwDECjmB7TbinJoFb2TWFT4PX0mKZ4sPMtsEx8AR9/OhbSoOcC3oUkx4k023uTeYF2/Pan05QwBUytgO/MPzGAdYt4wiMiDXGWb1eAPwEvZicXFvTw7ndrRkwjQj6H7qYfJ4XJOK5YdHcNlqtjkjJB+XGuMhLvlvQctbqFZkFsMnbbMjbUvQ2FU8Vl2VWjw3PH6brZM3YY5CL9la78JPYbkuZlIr8fG85HWFPRjwPT2Zcl5UYz3ZfFnsfcpX/fc946HvcCY5g4D2bs4dSm2iQWdQZfoAz4tFGBpW15Tuw+yy+8VLPH2OI+EDn/UpafDFiWCxdWSssmaXZWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tg/uelKTjfmGlD3JqpzJN/Nalw5DTRijsbL9MovPeqk=;
 b=isXsl0XS5IxODzOyEkUwmLx0vYWhT2zLVUbnYnSKRx3Ys1mt/2Fdx+LjZVHA2Qwbm5fBC/lQjg6cmINBzKsS//q/t3bFpxBW1kgSOWAHoDUQEVSsGqjEkIJgdAnqCcOd3uWGps/5o25yF7N0Gs+PLEDG6BLdZmpRq4uNhgCISJGHeNI5z361uPUNnKtxattFQKK3B9AjxfWIQ2/IZNWGieEqB+9/Sgpg/sapPu+AJmadvgz+6a9hBh5/oQgFfjAgQdHC7AMMEhhASph0RS/guY9q/qZeweaPPgPA44NBISFJOHy8eUGu8AP7fNCV263/lls9jFqH0mdsZFrns8QLuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tg/uelKTjfmGlD3JqpzJN/Nalw5DTRijsbL9MovPeqk=;
 b=Bb1UNw2CbQn9NC8QFwkaYLOfPwBbXrhQEJSviq02Owh6aTW41icIOpmypjgurREVjWHZw7Kbg9XMdf3te+BC+7AlE5UXddGN3f0qLcerT+Z4BfxCIt2zCm6WWzPhVwDR7AtzlUn/w/MQF11kYXpS1JH/EIT8r/VOlBIxnN/B25A=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR10MB1503.namprd10.prod.outlook.com
 (2603:10b6:300:22::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 01:39:21 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::58c6:846d:3bc3:ba3f]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::58c6:846d:3bc3:ba3f%7]) with mapi id 15.20.4331.032; Tue, 20 Jul 2021
 01:39:21 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH RFC 12/19] vfio-user: probe remote device's BARs
Thread-Topic: [PATCH RFC 12/19] vfio-user: probe remote device's BARs
Thread-Index: AQHXfGc+OwHp0eBwTUCvjAJlmCe+bqtK6sqAgAAshgA=
Date: Tue, 20 Jul 2021 01:39:21 +0000
Message-ID: <9D721628-1C4A-4710-B2AE-1F4C8E616233@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <e3db340f0300db92604f6c9611897df4d2ab901e.1626675354.git.elena.ufimtseva@oracle.com>
 <20210719165959.23439f39.alex.williamson@redhat.com>
In-Reply-To: <20210719165959.23439f39.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d82a01a3-8e3d-4189-033c-08d94b1f329a
x-ms-traffictypediagnostic: MWHPR10MB1503:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB15033A7837F32CD145AAF252B6E29@MWHPR10MB1503.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ryL8Qag9CbqBUo/PSFPUIII+pT84MoxgcLAidI81sZL47s6vR59/5Vw2zXK3V53awuCQYN8PVMUMfpJDhw4YF15yFgdi/ePtIh5nENlLUMfMBv5KLDp9HFqN2K7v5r1DBtg9YAnd1w3lSZiYKe5Lqnpqh6hQ9BEa/GOTjmtYwjS9eN0BLF89rca8cIvsNbzqLs/0BqIKWHumyc6g0PDmftiamA2spwa6NeSFOISrUHkOfCDAG/4kmJ2ws5/Am75RXtvlP7sAVWQJQ1ryt9bdOb2tV7uAg8gCzvEeXIZykrwp6cGWJOQeiQosDDYxsrZzMxHWfS4D3/SEwhc7Vvc/DhJXPG0W//q+Ypbrgavf99vWx5G9mzGl+HtQ/W+/q7HwQSMQbO+76jhdEIFEvi00Xke98UlpJBWFxPMIqEedBd3HDWrvy0qQrtelTIG6TGVjIOv3sYNEFIJJgMqQOCwZFBNZ1kPAqWwUqn9SFHMLx/CNXLFiXI5KCEDQ507nVXMIfPEiYNxXoi4+fXoz3eBsqqUR0/7SYWUXo+r67gABJR63ZcFwGEzb+fssXD1xUAl+Tz2OeXNA3jzmLyiQV4OaFh1OMdVDTWzIEYD8nOxaLa6xa4ubmJUfX5byI8+d7lHzzgbcN1d0RDF0dZg0N3h9k2oXrh81vXoja1VjlwCfuzK2T/T57T3wtA1oe/hbM9agMdAkSzGZTaIewXOHMc8LkSZEIwMlJx/yLCnDbFTvFB2p7A/enV/68OIUgUTqbmSM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(376002)(39860400002)(136003)(366004)(8936002)(186003)(86362001)(64756008)(66556008)(66476007)(2616005)(6486002)(66446008)(54906003)(6506007)(53546011)(5660300002)(36756003)(4326008)(8676002)(316002)(6512007)(122000001)(478600001)(76116006)(66946007)(26005)(2906002)(71200400001)(38100700002)(33656002)(6916009)(91956017)(38070700004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h6m8XD0hLjptAQTMfqkJ6FVLdOuPVoY+dyFRTPn0SmD/pqebRnIM1KEtPH6d?=
 =?us-ascii?Q?0DDcx291Fr6XsOMh4QHBOM/b01NxUPs+RutgaFPKxT3Uc8KcQT4SBGYvoSzY?=
 =?us-ascii?Q?I9nmOzTuZ4qGVXFL7fsTnE+ZSqo97ZYB5iPenTF32sBUv+bIey9MQzsr9L6G?=
 =?us-ascii?Q?JqNTzUIsYfHOouPbhDhRMmFEov2aOJHEb94Nh8FD1wJ9vmswcWorvF0ZO0wH?=
 =?us-ascii?Q?sSObdHiSBok8GDAb5Ey+UI2zIcXHfWOkNMfANjl2zndiRRhp3758KbqxX7hE?=
 =?us-ascii?Q?PrcAr5FdY10v+OJCVP/MknaWCEvJoO0/zBX1x4xy0IC9hi5LgJAhmlsZUi06?=
 =?us-ascii?Q?onu93i1ztml4X1gdTQLHin2XenlNcQ3rO1VyOk2COkt+5PC6YPzA2/wu+trl?=
 =?us-ascii?Q?ouI9NYLo4Sx2m9FxAUiZudGkRBHWyZXpZ94qbk+gIcXAH9cgZZpY0DnI116n?=
 =?us-ascii?Q?vJcBzs7K5WH909VmHcDa98F7BXFa8369FY5hQixjU2weR5Fsbm2Xkl5waj0z?=
 =?us-ascii?Q?EdT6SSv6gUny6QuSG0470wMix8Hs4bJQTych5IRLDbhxLvXBG8tTyp9RZXS0?=
 =?us-ascii?Q?1V70ehiLNM3zEtSKzj2FGs0dk5tKSZWr5lvNDLd8FshkYjYOdeQD//gUNyYS?=
 =?us-ascii?Q?IhFpmjUnZJJSH4BKzQa+WGwUVMRhtYOHJUGXcKhAXJSsWzqzoDIJ3N+LzKXY?=
 =?us-ascii?Q?Mw4Egj72iRc3Q2uoTW3ik6+Viu8ib9JLPepT3+INLTzaejX07GvOxRbrRnqD?=
 =?us-ascii?Q?sbiGhFECgIHM4dncvaydAkycj5PUJb2D2Is3rtzaN8cDYVcxzE602dG9qNcP?=
 =?us-ascii?Q?AUJ9MpGKp1xyleVk/9rzXBMO1fynfQuzQpqrWNkY2tCC5K2fb07cgTj3hkuO?=
 =?us-ascii?Q?+pIK61SeQJYCiZd1FnYhoGnaO/Tolmb6uQFUVvbrRgoDWpWAiDk0SKXNtIq/?=
 =?us-ascii?Q?SDhw7aopIAhafCcjZe+2meFZfuLmzCmq8O6hsrw9ayvrecNnDjP/yFZ0dJKM?=
 =?us-ascii?Q?lXz/Exe/BK9pUDe3cgbI65gyp8WzX1T6v3w2wkMY9Lg5viLwCJUV/YUmrLqh?=
 =?us-ascii?Q?rDbFX9UvYc42hLZRokGVkBl9onOuS7dvzICDHawqe0R2uPC6ZYMMtsJp1Bcy?=
 =?us-ascii?Q?pmYHOi21kZ/cFT16r7X4tSagcGqOg1TX5sXXJamVNw2dJkn5aLllgSfrcWm4?=
 =?us-ascii?Q?JtvzP/BhxDAiHFA8xZUyinR6T/2NGmi8pVaFkMseW7fJVf0HLD+lR0Zp7WDy?=
 =?us-ascii?Q?DNiYH7FyEraR0MBhUqDfCeoLPMeV2HezozgmjZX4YZxGP2yEfnjLge3IXBkr?=
 =?us-ascii?Q?A6wZ4ZZ0TfApnLE7oavmPTfC?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <102EA74FE9149844A669507C1C2332ED@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82a01a3-8e3d-4189-033c-08d94b1f329a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 01:39:21.3310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oJqOvaWp8TRbhb+oAHJqV+xCfCmTfTfvhAHMP9WAyXFz7UCRFKTkA/iMiVNRmPMPTgdPCgF0Ba2zyjUmD6wLzgJ2I+0T9uSQbEoDeLmPdw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1503
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107200007
X-Proofpoint-ORIG-GUID: IHKCLC12rdMtQl15FjZBbBwbt0CYOopa
X-Proofpoint-GUID: IHKCLC12rdMtQl15FjZBbBwbt0CYOopa
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 19, 2021, at 3:59 PM, Alex Williamson <alex.williamson@redhat.com>=
 wrote:
>=20
> On Sun, 18 Jul 2021 23:27:51 -0700
> Elena Ufimtseva <elena.ufimtseva@oracle.com> wrote:
>> @@ -3442,6 +3448,22 @@ static void vfio_user_pci_realize(PCIDevice *pdev=
, Error **errp)
>>     /* QEMU can also add or extend BARs */
>>     memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4)=
;
>>=20
>> +    /*
>> +     * Local QEMU overrides aren't allowed
>> +     * They must be done in the device process
>> +     */
>> +    if (pdev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
>> +        error_setg(errp, "Multi-function must be specified by device pr=
ocess");
>> +        goto error;
>> +    }
>> +    if (pdev->romfile) {
>> +        error_setg(errp, "Romfile must be specified by device process")=
;
>> +        goto error;
>> +    }
>=20
> For what reason?  PCI functions can operate completely independently,
> there could be different servers for different functions, a QEMU user
> may wish to apply a different option ROM image than provided by the
> server.  This all creates unnecessary incompatibilities.  Thanks,
>=20

	The idea is to have all the device options specified on the remote
server, and have the vfio client just be a pass-through device.  I thought
having them specified in 2 places would cause more confusion.

								JJ


