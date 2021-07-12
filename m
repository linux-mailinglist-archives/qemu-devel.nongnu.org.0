Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC13C5D88
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:42:34 +0200 (CEST)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wCf-0003cf-Cu
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m2vuw-00005I-OM
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:24:14 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:63070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m2vuu-000892-IS
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:24:14 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CDIEYp019833; Mon, 12 Jul 2021 06:24:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=ZXjslm+rfAspcbfJnnL8KGKLAgwq8+Zf6CMUGeXcHYQ=;
 b=N9rE7RFzvt86cY0R6l4qkkK+hjYncWPfOfuybGShMmQwAKEJec+F3j+gvDTef6QazwUO
 Gt5MgxoayFNbniBVRmxfdDpqS61hTcPNNVjPl21YPMrQQ8Tu1fESM8vnZKsPITvy7lw9
 Bf5oNxZjfvttsZptcNtvC2WhAokcO6ktUwsT+F7VHHd4W5+r4Nt/NwbXCtNW7wovnRCQ
 bJ8qjwThzDc0Mr4KK30WBeDDlygXG9wyCB0VsudQZ4GmvtwSogWx7JhlkcVMf58NNA6m
 r60D/7CLbbSQh/nywXF/tLuN/v9xsXn4j+v3ss6FIBXlepg/S1cCeJNWJe0m3Mn4N1pZ lA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by mx0b-002c1b01.pphosted.com with ESMTP id 39rgms0nfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 06:24:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6gUCZcSLlpxexzDMzzEx/grB8bBc3ccdmPRXMl6dIgMZqMxLDJemFytMWm6eqU3Bw2O7/+4hzgn5zDmwjvW7Sk9fed+FMuVnQZ3OkIjdSaknl0a22xmt5BVNc8sHOm/9oxxfpLIIDIIxDe/VN++miE2GSMFpusrfJoWsXLmIDIa3NjlQ4z3Nbxxv8wp5RcRXyHiUXMyPGZSYjk1fa/Chk55K/QJLtzLJrhCxcoLJ4BTkAuAgnXNbFu0YuIqD6m0Vk98Oak2znTk3qXWhEzVCJJfMc6ufrDUahbEzOoiDRrLcS6NLjoeWHwGW8RNSZZxn7D0nNQ/MQAPrANUkjRdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXjslm+rfAspcbfJnnL8KGKLAgwq8+Zf6CMUGeXcHYQ=;
 b=ch1/d/S+Bl2VaOAViMPTgyDgIC9msHyMUcV6WeWltNcyf9bjKzOWGO/FhA9LuBrbzU+kMMjiwAGXJqNBys11APigkh0CoIDoWDTWd5s/RNEEu/K21rsJsEoV2dWjGqtLCHz4utvjsCd/gfQ5zBG3OMk5elra2JKH4FCuQUOvbfvCRh9AYsb81mixIJysQbhx2aakP2scqACTqUMYU1W6fwWE0nSPpsVaf2Ae6K7LG1ne8S+df5zu5yIo7Caf1lZcPiQoWASBvH3p4E9OGYOv3ePWCBeBT9sNFtQd2lVBhXTp+gGBkFXNKLDCqnVVbWjrFuSOaIybZv/gWuPNZhi0uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH0PR02MB7963.namprd02.prod.outlook.com (2603:10b6:610:104::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 13:24:07 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b%9]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 13:24:07 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: VFIO/vfio-user: specify NVMe namespace to boot from
Thread-Topic: VFIO/vfio-user: specify NVMe namespace to boot from
Thread-Index: Add3IRjipNVw1LSNQ8eSxs0hDldgcA==
Date: Mon, 12 Jul 2021 13:24:07 +0000
Message-ID: <CH0PR02MB789873144D21EEEB6C501D298B159@CH0PR02MB7898.namprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf9905ee-8a96-42b9-2f2c-08d9453853b6
x-ms-traffictypediagnostic: CH0PR02MB7963:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH0PR02MB796325E94733C8020ADE66738B159@CH0PR02MB7963.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z5M0FUF3ysSzsKnHkO9Q87R/JQ821aYSBgVVQhIMA3BQXdlOMthSby4ibJ+lP0Upyl5E7qiTOFZ5REp07mmeeYwZoRYCrASe2VT4fQ5zjwoeZkG45wjEbhrbmwtYexVPdqsOi/fDZoITYAX8oWo813JrbU8OMIH0x7PrnbyLhKksyy4faFRWCOJs71FPThZQrfrVU37ApDRzHJyhEVgfgsOny7L7y0pKNarKi5URwlANDOE5tb91Mz4OhCcROWRpib5BlqaVUh6GH8oxHtPTvvhoqqw60L5pagJbksP1OWF5yFnrHFfhXAnNxnZnZu/NYp6bctRKwW4k5kr/cjEBjzpftM7Yj0nbilSgQQlZzY+/4AWLV91bQoD6pqG4KWu2MZmPyOrC/fXfYo+JrHNrvchvVEdC7N/rm5MzvWlhrH+ZkjUeER3C1Gb1b5UCyfj6wW8njCaI/TzdgTvZ/Vs8Wopt65ridX7go1uXZa7kil+f69Fv/1TGmsyCwgyOJLbRi3pAsekWANUfrN1rOcj1+XI7fQYysG37QTn1Zg6CEfcDqbb2rogun6cJqY4KCcjUAyJBlA/vviN46CTp5H91iMPkmxNM0xgxk3ySpbjaAfqg9Orjdd6/MIOFkNLEPKd+vVdBuh0s27v9qIJfPO3GRLS6wwknmx3aqd+qbGUcOvS6hOMUX04kVSav9EK5tAg+JN/xp+vx4gOTX8RJ5q3K5CvF+TaOze7fvKgk2SPo9ZU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(346002)(39860400002)(136003)(2906002)(33656002)(8676002)(55016002)(71200400001)(9686003)(316002)(54906003)(7696005)(4326008)(8936002)(44832011)(66476007)(6916009)(66556008)(4744005)(52536014)(122000001)(186003)(5660300002)(86362001)(38100700002)(66446008)(64756008)(26005)(76116006)(6506007)(966005)(478600001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zjpFtInkEiXGc650ViCSYNMQFz18+aqztQRtYIl2+ZM/p1Elz4A1jlU3bmnS?=
 =?us-ascii?Q?AkTM/HonhykSBuqGMkdx3OLyMdrcH555BxaKTZJMDqLoPP0JXR7WSwz/AFRq?=
 =?us-ascii?Q?2DHLWeq9MHg+LS5r9p9Ka+WtYfGdL33i6sIrkkOWobvWgF9OOB8HZBHUeq2G?=
 =?us-ascii?Q?396CVP6uIRlnPhZ0PHDxV4AL+RMNANj0ZLrnw7DVYJMsl6U2lZ9h3VFOYA2d?=
 =?us-ascii?Q?s5zlgpZtTAqb8Cxe6sc7ZeS7vLrbuQi6pKgIWFgX+8lvPvDZ7i7X0K9Ur8T0?=
 =?us-ascii?Q?udJuRGno6r6Cb68CDZFuTgEHsFh695n3NYAG19FQbmCBV4uj1HF/5xjwVq/N?=
 =?us-ascii?Q?W6aEmeKsCZeEL20fj1mgdlwnMVu1vxJhTZrrA/9aj611U0XiW+TeIuzv1zPd?=
 =?us-ascii?Q?ib/6vNbVq+WhaslgV48mUX6Ywz1QT7/OtO5fC/FCMapv6Z1FQ5cdIocjrwbr?=
 =?us-ascii?Q?3+qEFHYGfuhrUEI1PrggMpkS9S/ld5T1sSzfDGj3aYzoYONwO7bwgXx3PTGd?=
 =?us-ascii?Q?uSURygvCad0WXKyQxg/+UZ0h+32SIRfzqDeBIx+GljTgUZfDqzdYU216fvSJ?=
 =?us-ascii?Q?TOQJdHSMxpH9lko3ui48S1kfpZEiOAr1qgO6xNM/7VT9qKiiwPOgFq20vDho?=
 =?us-ascii?Q?fURD/Our0VszIrBPfedDIc/RiU2VPM8l7oPfgvKrwrEoZZrdiBTDvYqqxjC6?=
 =?us-ascii?Q?97CAEGn53+TxcKzeoAkbgWwzrTadHU8Qb5EJfWqfZqg8TzWZJdWWfYBIKuqt?=
 =?us-ascii?Q?11BWOpWhXY07GJDGACpwuk+Kg+kONTl8vNjQUajPGmqRBz1k2bA0/WSlCfMq?=
 =?us-ascii?Q?IITM73Jt4z00k4/9vnvwP/vAi45j2uvoWRnuwVh8BVzrDngbV9EbSMxndua0?=
 =?us-ascii?Q?mNN/+lJQpSNJVKX3KbYFG+eix7f9QQiHtn7m2MojS8/uOY/gK03FwMfvwD58?=
 =?us-ascii?Q?HcVlTr6EPuq6WhpqsXo6PCzcbkoSOzTmHMDFjDEBs/zLnh8hw8WlSb8GwZWl?=
 =?us-ascii?Q?cZXzVsY12vO299eC1qh9xggMDKfIhVk32BcQ0fToTuzs+SMeXDU6OLsyE8lQ?=
 =?us-ascii?Q?u1jAYyl4esGco0Cdi2jOLfN4MK9NfOOM1H5SQ6GfzdVaW1Eu6cyT5rxBp+bd?=
 =?us-ascii?Q?UZL4R/BmWb3EZg/+qtX2iHpEtvA9aBCN5rIU2nofRjEQ2nZB9uqH5G1ZTWes?=
 =?us-ascii?Q?JexwC3iGJwJ2xdAlrD8v3JyFxMrA/1hajgZYgFPpP411Q2yUlttnwOEcRBHn?=
 =?us-ascii?Q?afLUNlQz6aTQHaV1EC6qFaMszDG2+qYv1ycgiVW69TfUWkqJyTzPjKHtwQye?=
 =?us-ascii?Q?n08=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9905ee-8a96-42b9-2f2c-08d9453853b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 13:24:07.3643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HVAvgc7Jht3fWzEKhsl3iwoEN3Zu+ZBkHYSvqKRYpVF02weYL4/EeV/aO5Kz+Fk/Ha9duG85a64AQKV926RUdCZvvHhn1PXP2Rsz8Bq8Xh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB7963
X-Proofpoint-GUID: iBanrNDJ642IdLVMWFTFp4uDC6sclsmb
X-Proofpoint-ORIG-GUID: iBanrNDJ642IdLVMWFTFp4uDC6sclsmb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_08:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 John G Johnson <john.g.johnson@oracle.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 John Levon <john.levon@nutanix.com>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're working on implementing a virtual NVMe controller based on SPDK and a=
 multiprocess-qemu branch that uses the vfio-user. We're facing a problem w=
here the existing API doesn't allow us to tell QEMU from which NVMe namespa=
ce we'd like SeaBIOS to boot from.

How can we solve this problem? Can we add a parameter to the '-boot' option=
, e.g. '-boot path=3D/devices/pciblah/...@namespace0'? AFAIK VFIO should ha=
ve the same problem.=20

The corresponding SeaBIOS patch can be found in https://mail.coreboot.org/h=
yperkitty/list/seabios@seabios.org/thread/2Q7NPH7TJNHK6JGPHQL7755HILO23ISN/

