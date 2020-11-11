Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D5E2AF6A6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:37:11 +0100 (CET)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kct7O-0001XI-Fa
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1kcspb-0001Tj-1o
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:47 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:20342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1kcspX-00086T-TF
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:46 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ABGCSwp032553; Wed, 11 Nov 2020 08:18:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=ja/jzLTmVld1rD9G8NhiZAO+5BcF0KiXW8QeRRtA06Q=;
 b=caoP9pcLiiEDiIC2EKWKf3ic7KAvGjTVP1GRJcyY0k1iIh6HvkMOoVyVRgDFdOl8xPWd
 yQg6R84o74oKaz0y3/qXTSyH4HVpH1n0ST2t5mURw/oDMMiK7ejUijaHX2WKB0UJWFxt
 FfQTDAR1iACu56PZhkHikAPhnGD4NQFK7w9EGHCo3uU/0M/zF6EysXk/Zd9L7Ww4/0eK
 PRdme/MAmf9EE/OORbdcC06ytIqF3AVfzq7IVGkivaTBSMJOn98qL8LVLCyp+Yu5kKvM
 5UfFX+lrL/HjP2P9duNUq5hax577CU75h1n3idw7gPBE11oMXfV0OKBHwJfD+v+oQ1oN og== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by mx0b-002c1b01.pphosted.com with ESMTP id 34nt0ch7vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 08:18:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNk0X/KKGWSZzntBrACtRqs0ND7jMOvMfL/GIii3SADcDshAVMsXBQwVCTRozYkVzPyEGsowddooWv98biP8xbKNJmFXEkJsN04XYPAL6N7OFKwBHJZdjg9bYLmaBQrY+uZ6N23aBCwo9zyQTkU2kUirRBigoeGZapiLcCjDX1a1pYhjP8quBuUJuCrn8r+P+eQpgdPcG0EmaYS/qTc2gEXlS9vLUHXzg7judQwke7NMEZa2xZCihHuNxQyKAhhOndzsfK0/y+ucAYPjVcjseLy3xCMV20BgTWn5q3wtkZGItds0yat/AeG1VM2z2V6VGNMMkXqREZ5CiTOn3piVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ja/jzLTmVld1rD9G8NhiZAO+5BcF0KiXW8QeRRtA06Q=;
 b=e8LLIRA7duKTxRxujxTxYaALIRfeNsUp45bgJB+3CwWwzRFpfFHeEcRxzVSsn35K2zXPSM5R/LAXeJ0HZj1jvqT0hqY0b+jwq7TEXkf4HwV37KgGYTpTEs11dAOjUwXDNXWp2LMgiQD4oIz6njZ4V77va/YL8wmC0v4qS5XfbfxUO/2nUdHgoAYe1quWab87OS+iNkQwgpYLaW6qzmYxAeBlBCIcsuI1emRCjyqlf2ayN6cB47Mr2r+FV1V4r5zTYX3jcM0G5Jl6GC0UuAXHPIhoNcTJuimlnSq5YEnc4gh7r1Vkpg5Amuei7WLvLqHQKzZmNcVq8KwGp3lqsjUmEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from MW2PR02MB3723.namprd02.prod.outlook.com (2603:10b6:907:2::32)
 by MWHPR0201MB3466.namprd02.prod.outlook.com (2603:10b6:301:7b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 11 Nov
 2020 16:18:34 +0000
Received: from MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::950e:a59c:cc5b:4908]) by MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::950e:a59c:cc5b:4908%4]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 16:18:34 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC v3] VFIO Migration
Thread-Topic: [RFC v3] VFIO Migration
Thread-Index: AQHWt0dznKxCdKkxik+L7D07RmYYuanDHCKQ
Date: Wed, 11 Nov 2020 16:18:34 +0000
Message-ID: <MW2PR02MB372398B3CD4B91201A9D84558BE80@MW2PR02MB3723.namprd02.prod.outlook.com>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
In-Reply-To: <20201110095349.GA1082456@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [78.149.9.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7770f071-05b0-4794-3ed0-08d8865d7007
x-ms-traffictypediagnostic: MWHPR0201MB3466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR0201MB34665BA4488F4B97369EC2CF8BE80@MWHPR0201MB3466.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d7YxITCy5mSdLU3Ql0qgUIB2QkzEE3J9H6pcdkc1ongXmIcDYUraCHATISih1nRJ6vmhWuVzwiy2rGoZzI46e1OUr+4U5au12KKWOUNc0yV8+bVl0rzFwBWhCqXOQgI5L5N4xELtKqnpPTGicOiF9fLvpwg4TjKXee6SCOioiB7m7llid0OG51GthrgZUMSIs87y+AdqbH5NvQTucGQ8ieMnbFKnAJas3mDu+LtWBkdGduVoL3TcGQmS/KHyWS6YS5d886lMRp9NW6b6810RW4ImLTyQwIrhsAznvKYNa32dtRMiMW5YWBb+L+NhecFaflAL+GxGAe9gbV03jl5xRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3723.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39860400002)(136003)(366004)(376002)(86362001)(52536014)(76116006)(66946007)(5660300002)(64756008)(7696005)(9686003)(55016002)(71200400001)(26005)(8936002)(66476007)(66446008)(66556008)(33656002)(186003)(8676002)(478600001)(4326008)(316002)(44832011)(54906003)(110136005)(6506007)(7416002)(55236004)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: NuNF/R7AIGG1P4rshyO4EsqO5oKFu1STzIaK2LELSYOcORpnLtYRH0zeLua2LJjLZWtAVhzHPMZdO8c2+xeomEAyotEWRsa5b04TdRKVn4J+QiJydk+qibl0q1w0nKWeNACZ9EMqXKOHki7VkXtTTK+H9H7/fsSgry8EVsY4U4TvvlHP+4G+JciBULaDfHcuhnN0NJZx/Jq5WWgtZxUGdUkQx0WAkZ3gIz65Iv774B7B26odFsqv/AaVoKGTjjVuCXPyclqJZWcpfXNZ9uYIKtzXeXQuwWokm4qVHX+X/3HP5AjGk20mfKf187zJQCrWQ/WyRcu3A9q/seMyHQrS7wORFJ53hbzsQp5ELLN1m9Z3llJk2Vm1qIVnVs6enenlCm0P8L7IWGLRWZckjce/3RCgTJRWa5DL5PyHnB9sg3fLTEIvzbq5m44dneQ7Vs4my1CxJj++Jky8T6W22Z8jJXo68OxLVqvjOLzS7Gir2HRIdmmNkLWmJKWlAXLa45OQc+EvFcglms2tVwXkhe7I2aDKn8fKBVrwZL/MkPQJdmiwliq6j3zjitzR3HwU/zdd9lOMXHaEqCUAmVdhAoIB2ZxhblaSApxAWWl5xt6fIdR0GkDCCwZZxyqE+QBL8VcdhuoLgbfFBS/TJFbCQ+EJWA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3723.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7770f071-05b0-4794-3ed0-08d8865d7007
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 16:18:34.1659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dk9nhPGPvxLC4bT6HVse1bjw+yaLD2+XuAPbenOtVJff3qJ+wyRTKJjm7lZODPzbOXS0DDGSP/+bKILJGJlz05oXwiv9A3ODqiXEteUZgDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3466
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_07:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 11:18:40
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "mtsirkin@redhat.com" <mtsirkin@redhat.com>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "quintela@redhat.com" <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Zeng, Xin" <xin.zeng@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 John Levon <levon@movementarian.org>, Yan Zhao <yan.y.zhao@intel.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> VFIO Migration
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This document describes how to ensure migration compatibility for VFIO
> devices,
> including mdev and vfio-user devices.

Is this something all VFIO/user devices will have to support? If it's not
mandatory, how can a device advertise support?

> Multiple device implementations can support the same device model. Doing
> so
> means that the device implementations can offer migration compatiblity
> because
> they support the same hardware interface, device state representation, an=
d
> migration parameters.

Does the above mean that a passthrough function can be migrated to a vfio-u=
ser
program and vice versa? If so, then it's worth mentioning.

> More complex device emulation programs may host multiple devices. The
> interface
> for configuring these device emulation programs is not standardized.
> Therefore,
> migrating these devices is beyond the scope of this document.

Most likely a device emulation program hosting multile devices would allow
some form of communication for control purposes (e.g. SPDK implements a JSO=
N-RPC
server). So maybe it's possible to define interacting with such programs in
this document?

>=20
> The migration information JSON is printed to standard output by a vfio-us=
er
> device emulation program as follows:
>=20
> .. code:: bash
>=20
>   $ my-device --print-migration-info-json
>=20
> The device is instantiated by launching the destination process with the
> migration parameter list from the source:

Must 'my-device --print-migration-info-json' always generate the same migra=
tion
information JSON? If so, then what if the output generated by
'my-device --print-migration-info-json' depends on additional arguments pas=
sed
to 'my-device' when it was originally started?

