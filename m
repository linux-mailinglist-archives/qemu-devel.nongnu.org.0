Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F2310AA1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:51:32 +0100 (CET)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ze7-0003ll-FJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=36704b62c3=bbhushan2@marvell.com>)
 id 1l7zbR-0003AS-Vo; Fri, 05 Feb 2021 06:48:46 -0500
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:4908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=36704b62c3=bbhushan2@marvell.com>)
 id 1l7zbO-0007wN-M3; Fri, 05 Feb 2021 06:48:45 -0500
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115Bkv2H009225; Fri, 5 Feb 2021 03:48:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pfpt0220; bh=W+xTXYi88OjbMUkdMMOVkscD9abakop+eMZsjxbnbhQ=;
 b=Q/wP67yPL6IX7w6wUn3+NyQKfX8feb/0GcpuTgSAFMTQXWAPcsceAZAGk4yRIYYMl7HD
 ezamNcmINoqE5cLfTG2HxMmu4ytbLydtS6lT5rwVAm9G9f/i5AjMB5N1fwv5QMXQkvyt
 9l58WbXAZZsJsOEQXFB4eB+eJcurRzD90mZ6/PTXt8PYNvE31FMMT2uygAjmUSsog2tT
 HevKKFPqD35lAt++rR6m6s8lp8zCUrcM5ML9vrcieb/IQ3cFDWIlOS5lWfLcW2ecG/Yb
 Zr4aWT2iWjv1RK5yOON5J3pQJT9DBIRgR2omeAraypeud8SkXJmbfFosusejUnG4+IR2 ag== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
 by mx0b-0016f401.pphosted.com with ESMTP id 36fnr68v27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 03:48:35 -0800
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 5 Feb 2021 03:48:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by DC5-EXCH01.marvell.com (10.69.176.38) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 5 Feb 2021 03:48:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVNbKWLQyMgvUVqD3dQ7gkm0UNtUKSuBiew7ue0geK7xpHxnxxPT3GH54/mRD5cb0vCW2zYOjq8ZANnUwJRkyCfiOIS19NW8Agrva8rLlJLt3YzKKGfl/nuLs30P5+jjTVdl/h2LxYXDYSag7QI5XaslyUNGxiJvjcm/HUZZjn8tYpe/8xMSAeSTCezNXIR69NPMCaW84Adb3kNyf+Bl3EG8ePB+Yt89rH8ynCacnffIuJourHrNooyO9Ry2D5577igvC/3vXg8YUkZ5cZAZzN526u7e0DreTmVaFyE7NnbCW6p4KAIk2uWExwADJDkgII9rTgbSUtx4GLZy/eGa+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+xTXYi88OjbMUkdMMOVkscD9abakop+eMZsjxbnbhQ=;
 b=SkyPDcbuKcgvet+VwfEkcyHF4frh4JOie1r0/CQFLNMlzK4C5VrkJ4FxRMAADi5BQb7aFeqHJmc01LwXAiPEjUg3W0y148NLF6qBRA5OlDsSEHuBhRfa6HX2nkWkBSrWS1E7ZmFNhRQDmyhzoQZgDIAr6ll1fJfjGq+qcSM5H6Wgq/cHDwCq9nPx7shGAVjuNtUevyNXHHsuhUbpUINST/KeAn6lr8FA2bstLzzO+iUnr/D+IwHhPper8eajhjmjpCbQmVFIWEcOdixMgcSpREYjsv6R/JPBogyRVX0dEU6+g239V0WkxmlXgdB8Jab7Na9KhewnmLby8F9ytvbL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+xTXYi88OjbMUkdMMOVkscD9abakop+eMZsjxbnbhQ=;
 b=p1dDhRzTvc0TFZj/wxzZIv7Xf95MKmahGX2N8y3IIw/uB01y1vnMck0C8/ENGLTOpOZsphhu9IbnHepTjCu5n6RFfWO/9l8kvYckWecwWxvimE/pF9WekdMs5D5Q4jlnsxVZUUHPmgHfQr57sKHl799SeuEjGhp+T8wZPgfF7+o=
Received: from DM6PR18MB2698.namprd18.prod.outlook.com (2603:10b6:5:16d::28)
 by DM5PR18MB2135.namprd18.prod.outlook.com (2603:10b6:4:b8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 5 Feb
 2021 11:48:31 +0000
Received: from DM6PR18MB2698.namprd18.prod.outlook.com
 ([fe80::9dab:c785:dcf9:24b9]) by DM6PR18MB2698.namprd18.prod.outlook.com
 ([fe80::9dab:c785:dcf9:24b9%4]) with mapi id 15.20.3805.027; Fri, 5 Feb 2021
 11:48:31 +0000
From: Bharat Bhushan <bbhushan2@marvell.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: QEMU v5.2.0: object_new_with_type: assertion failed: (type != NULL)
Thread-Topic: QEMU v5.2.0: object_new_with_type: assertion failed: (type !=
 NULL)
Thread-Index: Adb7s9HYw0ymsqeiRbO4m0AX9oseTQ==
Date: Fri, 5 Feb 2021 11:48:31 +0000
Message-ID: <DM6PR18MB2698B10216D8BD1ED5DE8809E3B29@DM6PR18MB2698.namprd18.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=marvell.com;
x-originating-ip: [122.179.77.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30332400-9c55-4ae5-8a0d-08d8c9cbf62e
x-ms-traffictypediagnostic: DM5PR18MB2135:
x-microsoft-antispam-prvs: <DM5PR18MB2135D773578FE878D2D568D8E3B29@DM5PR18MB2135.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MmFxVnwCG4biXnStL4/M6TcAUpp0c6CBvu/Krg5mSS75nawa70COZFQMu9GmHUilZJR8lqpNb0nO7L8F1K1z1LIa1fxC62dNUjHsxuAQ1onGAVM5aweG36too3GpSVcRWreTelUd/D4YtRg0thaZRsvcdrpEVL2mdynxt2s9FHk0HOvloBuu5sRW6IZmVNBT5MK5iAbFTUVWBNnI1Gw05iCKLzXYCMbQoaGBsvY3iWpwtecv3FrA/pxzaysEqlXzyxepshqVgfe9gXbNimRuT08T+gs9jEvrmlwjwbm6TI+qHW68kpaetIfQNbAPkBDGiZAkedAgSW7HgrPCkNgBT2bVNnASHgkap53ekDF2m6Xyr+uEZ5Ba/mHQo2RAYVLb8gYhLA/uevmNf9ne03Mi3ruw2u/XWGL+/pyvfFYzLHrgNE1DuX69Jsy5r4J1CScCmVJl5z5rZB0eGbifS8CiJbGO1OqhXl7a+SvM80A5lzHeN9Zz8LEfFcyW9nb3o7SXgheUusWkaG/Um2CDVKOBqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR18MB2698.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(450100002)(83380400001)(66476007)(478600001)(66446008)(64756008)(66556008)(110136005)(76116006)(316002)(2906002)(6506007)(186003)(26005)(8936002)(7696005)(33656002)(66946007)(9686003)(55016002)(8676002)(5660300002)(52536014)(86362001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?POahxlCpkMXnHx+H/zFpT7WsrvBiTNSMukrmhtP/k34pRmlLu+K29AMsDB/W?=
 =?us-ascii?Q?J6q21nuYmh1Zu23TPNa7FNTj3ASR0X71XhRuRRFMAhisNVHu4Lf5TIUvErIR?=
 =?us-ascii?Q?BdcdNVl0v278JL7e3UUOlmhR9Srx8nuh7zvwv+sgL2AvbT4dfbM4KVU6QkBH?=
 =?us-ascii?Q?WlQWuESRlA+pj7RzUIzph0W9lPFLOct+EUrIr+jGnUtvGX2+7qkcN+BuE1he?=
 =?us-ascii?Q?8MTodQyahiYq0BZuIflS/+1SzRpJbRMrnwuc/ukkxAuH5u5LaKRZMGkAAkrU?=
 =?us-ascii?Q?8SDh1UET53NWcJEVdk0IRaS2NX3MCvayuPqWFk1/2gF+IzqpwLr6W0QGFIck?=
 =?us-ascii?Q?SuyqnQ4S2Ys+K5mlqQhHa2ZpuO0/siheJJADoTKAyadq5AcU8D7naayDYSgt?=
 =?us-ascii?Q?4WmjdLJ3Wyy2Ltl8J8/4HkAQ0of3LPpahiZP4U9rS/jnGC4bfOrFH1l8bcM2?=
 =?us-ascii?Q?k/iPnXAqWS0c4pOWt4VNdRFXRiBkXpnlgss74EvA+BUrid9nTaD7jLozKWqe?=
 =?us-ascii?Q?S+nrC5TpKl0glit8Oh2HGnJcbi5SHcDglQQlp0ary+MPQMSfixnNaU/mcQye?=
 =?us-ascii?Q?qa+yKTPJiwWwXeeokPodWViUQZDaICuwug15bGwpoB5C6OdyjY4YSxHraoHk?=
 =?us-ascii?Q?5Okc1uoUpp/w8T1eGKl8iHjHbypYo8s6f3GJgd0qMV+0jF30gqBw4P+zCV1U?=
 =?us-ascii?Q?z/+YKRpxs5eC1+aJxym9UfpV17fyConhDRuoivWEAKtDToLPpF7wl/Aay2Vx?=
 =?us-ascii?Q?1RoPpJKldYS3BWx6v55Y0F1qAEZPn8KcZmqoc5vf6Otgcurz/ZjC5IxpUBht?=
 =?us-ascii?Q?AhF9Ed6IjPLk1N3KTT2w0ftz7VMpcSnva9dHtbrqo+pDcDL6cIUzwtZmBzWu?=
 =?us-ascii?Q?eUZeOgKmLX2oKSeA0YhPHyp88M6QNCZG2nRxaXUZ2oUWX93jXH2281CPXqfe?=
 =?us-ascii?Q?K0zoIk9LI6huQMMgmF//mIuG4glcuRXsIkitV/Gs2RruJqLAQ1VPDJZxSSWH?=
 =?us-ascii?Q?2tT4x11/Nx8BBMqmYLxhFOoQ0CnIE8QtelfWALSW2uPwxlNQiuXRTMCq5znA?=
 =?us-ascii?Q?jWx66FvMGvaoq+/STb6swIgEwaL+jOqWiSALJjYzBZSOBQHZM59QypRJoTI4?=
 =?us-ascii?Q?8Sw9RNIT6aA12pK3tQacpOwbtWEEmi0kocjF3aNc76T4AUlE5V5s7BvHpMHi?=
 =?us-ascii?Q?e54d3nyCAiD3Iv5FObPyoXA11tCZU9guUY7nsj119lVEs3PtdM0PXR6rtYl7?=
 =?us-ascii?Q?r+gkT63bxNoVw/jRJ/GWBMDGTBaR1/N8MQVVFiRdLU+jHLUsQLsZlI4iYSyv?=
 =?us-ascii?Q?j7y7drCje9DrfU6+Jb4JwCqL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR18MB2698.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30332400-9c55-4ae5-8a0d-08d8c9cbf62e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 11:48:31.8044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZi67MhIiOfkfDkoGVOWf0JafGskMTRn6prgRZTsQHaFTZKR2DoT/pfppseY00XSYj0ja75H95aChoCq/FLISg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2135
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
Received-SPF: pass client-ip=67.231.156.173;
 envelope-from=prvs=36704b62c3=bbhushan2@marvell.com;
 helo=mx0b-0016f401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi All,

I am using QEMU version "v5.2.0" and getting below error when running on ar=
m64

$ qemu-system-aarch64 --version

ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type !=
=3D NULL)
Bail out! ERROR:../qom/object.c:711:object_new_with_type: assertion failed:=
 (type !=3D NULL)

Running GDB give below information.
Is this something known.

(gdb) run
Starting program: /root/qemu-system-aarch64=20
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
[New Thread 0xfffff703ed90 (LWP 5212)]
**
ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type !=
=3D NULL)
Bail out! ERROR:../qom/object.c:711:object_new_with_type: assertion failed:=
 (type !=3D NULL)

Thread 1 "qemu-system-aar" received signal SIGABRT, Aborted.
0x0000fffff73e380c in raise () from /lib64/libc.so.6
(gdb) bt
#0  0x0000fffff73e380c in raise () from /lib64/libc.so.6
#1  0x0000fffff73d0bcc in abort () from /lib64/libc.so.6
#2  0x0000fffff7b7c058 in g_assertion_message () from /lib64/libglib-2.0.so=
.0
#3  0x0000fffff7b7c0b8 in g_assertion_message_expr () from /lib64/libglib-2=
.0.so.0
#4  0x0000aaaaab2b880c in object_new_with_type (type=3D<optimized out>) at =
../qom/object.c:711
#5  0x0000aaaaab2b8870 in object_new (typename=3Dtypename@entry=3D0xaaaaab5=
0a668 "container") at ../qom/object.c:744
#6  0x0000aaaaab2b9ec4 in object_get_root () at ../qom/object.c:1674
#7  0x0000aaaaab2a4c0c in get_chardevs_root () at ../chardev/char.c:50
#8  0x0000aaaaaaf9f2b4 in chardev_machine_done_hook (notifier=3D<optimized =
out>, unused=3D<optimized out>)
    at ../chardev/chardev-sysemu.c:45
#9  0x0000aaaaab3d4ae8 in module_call_init (type=3Dtype@entry=3DMODULE_INIT=
_QOM) at ../util/module.c:106
#10 0x0000aaaaab235000 in qemu_init (argc=3D1, argv=3D0xfffffffffcb8, envp=
=3D<optimized out>) at ../softmmu/vl.c:2916
#11 0x0000aaaaaad9e084 in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>, envp=3D<optimized out>) at ../softmmu/main.c:49
(gdb)

Thanks
-Bharat

