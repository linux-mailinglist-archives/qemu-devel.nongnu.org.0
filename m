Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F7374350
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:06:26 +0200 (CEST)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKyf-0001MG-Io
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1leKFr-0004Sr-IL
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:20:13 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:50856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1leKFi-0001Dm-Jj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:20:07 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145GHjV7008630; Wed, 5 May 2021 09:19:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=c3qdcPY3uP0U0ILiPZX6Jp46T+FjFozhOXzrm4iQrdY=;
 b=0LXNSXjFFjp02p0G3+PJRwSaSPoPsQKrDdI1/v+v111pUt393PrcxcwZlm3ba/iBolV1
 c5KbkUwoYpxTDGvWGqNTkPBaNvFL9DLflvIedpkfb78VESU7l1QL8bnxImit6jfCNcuc
 YOU0zAvFUOju+iUxvseFHqLC9p8fhM9xUcYdN/5z25CUnVfLM9py46mHQ8o/dIvxkLyz
 tege9Orv8ZqqMWwFCDa3BqxRuRBkCSZsQS1tRJ9IFiQDQsEDF8YDFGq82kUaq9WE2Uco
 uclkY6qd35OeZuI2IQhr3Ihu/FLOBZzkn2yOhvHQGEcU3LsgFjHmUvxc4uJEjswXlnOG PA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by mx0b-002c1b01.pphosted.com with ESMTP id 38begt9wfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 09:19:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lD2LmkM02Vjei9qXfpYrQGwxLiSMQSfx9I4P9CF6EjIVqE5ChEJzHX6fdPzygqEYeXrnf1ET7/VOpU1EYp/CwDFIzycfZupiOtsPDobQ7LL0L0uOAai/Yd2qs8IPChOA6hiaf7rf+h4Yn3hby/rJ0SVenFL6j16fpXSQIv1bIKoz2ePKSXHbOYzZlDKZfH00NTIpXm2qdIxMZd78yTjSk5QlE1IApe4OuutPKLrrbT4wfA5OqpB+9iuOHU5Z9P5Mv9hRLo7aF30SQVBITE5qgeQGNZcMzxCFWMSOyxmUOhk/Bf4oDu7M3GLRf6Kw0UnIgiL2QB1EYINypq6LN75DEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3qdcPY3uP0U0ILiPZX6Jp46T+FjFozhOXzrm4iQrdY=;
 b=DWcGV5XLVTRZ9UPJ5LPfqYCOk/8nnIIVNUwTFVVqxdN3lGe27/H8w0c+OBcSLQMZa1rOLbOM3EHOc/FKRDlJH9wMNXBKCTI/2W0/t/l+KOccNToNc0xGT9dEqf5Dq6s7jxRJZ1gHm5rO76IV9C+ve4l5DjQOeiLkbReUyLxsVG6kjB0bvhPAVYV6+KuTz6uKQmmcCxl/4JTmFQtmniKbXtvJlILGSxIWMfdQiwcNYG9nE3iEFWwThVatzy8ukGcDLOlT9ecU8oOhtLpd64mQ/rLWotMfQC/qXgMR7Vq0yH4/dsZROmD9N7kwioBQAObzPoFe1fpdPlkCCzGsedKoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by BL0PR02MB4674.namprd02.prod.outlook.com (2603:10b6:208:2b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Wed, 5 May
 2021 16:19:46 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::c97f:ebc7:b7e8:29ad]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::c97f:ebc7:b7e8:29ad%7]) with mapi id 15.20.4087.044; Wed, 5 May 2021
 16:19:46 +0000
From: John Levon <john.levon@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Thread-Topic: [PATCH v8] introduce vfio-user protocol specification
Thread-Index: AQHXQcp2CqoJh2k13EyDqbeO4k+A0Q==
Date: Wed, 5 May 2021 16:19:46 +0000
Message-ID: <20210505161942.GA1195642@sent>
In-Reply-To: <YJK+8MrRe3ANcu7y@stefanha-x1.localdomain>
 <YJFRcdvcOlwm2bd7@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [88.98.93.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5bf7889-caa5-4381-25bc-08d90fe1994d
x-ms-traffictypediagnostic: BL0PR02MB4674:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB4674DFD7600A59C616548A4697599@BL0PR02MB4674.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j1mbsWKZqU7ySi71kfazR/cgZlQy07Zk9PekX5QERcoHMWo8cCsOGj9h4tTokluT3blvLdmNgGeKvZQqMYcs6XVaH09l7uYyAIJsudi//pb8CLLx3kiA+0cL9pkih7kiNFD7a7Xxc2EfKI+oHtU96gd8nIIlAmt31axF3RSlCDI154wS4qRvfgMjfWMHJuJZJxCx8GccvlCmxrt0mnT6GwnA7DvDVvvI7jImhyJBAokbIdLAawq5mbK8snK8bcpxk3WDVk1xLYtvbF3ZMM5+m5eRRGXwAiHjPVbGy4YY/E69rnQYYKLko8yHtOKFu6JFpd/Xh5t551RcQjy3jMQ6ZHXmGQkdFhflWkNmkZ+7lOr78jjJmp43/2rZ77YQaz9j104JyMIByfLmM+lwwWtxxJ1ckNl0DMYv32PhjU2iW3bsgOC8kjgyq+IzI+8AQ24t+ew8eC6kPOeMn3IR11IvpYnKZEyT16hous2UkWmlV2JX/iTKbcSEoKD6JGQNMr5O3cs9fTTxQ6B3JQMp5fkNOkHCwXwPXg8H2tva77gT9uhHaUVIHTw9xXao1re/ROHoScCqfKSBaaKUWwM45k3MSSTzMEAFd0ZLkNlPF4uHOJ3tahjP8HVh0qxKcNZI/OeqvD+tZDXdlsLv+uQH8o4UKG1JuYanLN22QUu6vA+znvR3eh9VjkHic7CYMeGqT6fk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(376002)(136003)(39860400002)(396003)(346002)(366004)(26005)(7416002)(9686003)(33656002)(186003)(66446008)(8936002)(6486002)(64756008)(71200400001)(91956017)(66946007)(86362001)(6512007)(316002)(5660300002)(33716001)(4326008)(1076003)(966005)(8676002)(122000001)(6916009)(83380400001)(6506007)(2906002)(478600001)(44832011)(54906003)(66556008)(66476007)(38100700002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pdr9yf8326jQwuFou9UYZKW4gAI6ILyRHONHwlBiLVdFZO0U2+wqPM7VhRrL?=
 =?us-ascii?Q?f9o4SgiY1AULuGHwoGoYWq+7eFl4cm6WlZQz5Sx/3X9OcX5mbIhxawwgZpaQ?=
 =?us-ascii?Q?fgAplK5QnXpAvB8Jah4qUtQf75YA1ymuvEQ5gKyUPEsI2GP81+kO38iIKWT5?=
 =?us-ascii?Q?Cs4Wazk37AmA3ExBDOhlhgP/uatEHyvFVAOq3LHMsNa0WMe2d4ZJq/NMeNZQ?=
 =?us-ascii?Q?/XiM8rjQta5xuMypHwdLff/EwCaWe0/FcP5CSsMPgOcmMSUVL4cqP+2pojoe?=
 =?us-ascii?Q?iCeV+/fqsAitO9cyjaZ2PZneZmOQJ11/oNK4C1aiBydiSlQcHizIOJ9YBWAj?=
 =?us-ascii?Q?LlyylG14XrbC2oMr6baczoMJQnEBZp6w7qzUkqyQ1Rxmx/tcT7A7KvELgly+?=
 =?us-ascii?Q?ykAOshzsS6+pgusEshCbMS4y4K4dO56qWz5Il9sQTx7T6fQeZ3AVvyllwhPx?=
 =?us-ascii?Q?fYBt6iTID992mYHfNfHuzDmwrsCe96oRv7FwMiiwc7f3BRmHUMA7eNO3rjhO?=
 =?us-ascii?Q?8OkdB1Uh8oSrMmNjC00J3LzM2CeQr1WSJxKQ3zCJck1IX1IoBUPCzOx+pGI1?=
 =?us-ascii?Q?0pEa90uwCfAtjbVpnuZHE00cXAU2f2ncQ36lqCT0if56nMR4oo3jfW36M1Ae?=
 =?us-ascii?Q?p3lJh8SvNcnLWaJhSW65gFlBp2SOZkjQB9qhjfc1rdryVB2h1ODZj/5tQr8q?=
 =?us-ascii?Q?dQ7Lww7beQDrb4vf3Yt+zwoX+SnRt7ojZN2xEv1gPdKRI/cyDF0V+Bc2KDzb?=
 =?us-ascii?Q?PoQ8yF4N2MvIdDYm6dTJ1Hcg+zcUL++eB+iwd0F4BdIppwPirwFeIuIJXXP8?=
 =?us-ascii?Q?EPTaqop+yPLuitYczaWu06dd3O96J/KcUS6y6j0OY2NGrhCklKuGRYjF5llm?=
 =?us-ascii?Q?KPMKZFh870yzFjD419U6f8sba2mcSVYwps1/lSd0tO3cOt1PPnaqlWNpVxbL?=
 =?us-ascii?Q?qI6wRH1gGSHkTqvegxarS2ys3sfYKeRtsdlH1GxZxB4DzrSwhOsLw364LvvG?=
 =?us-ascii?Q?Lhb7a8S6GQBmIEOKdALThdUYylAbOFdwNP/UpHtVgQ09oEkgXMw9MyrEnfFM?=
 =?us-ascii?Q?Y2fM3Ecl8n+SBEjY0bOqOJf9uV0HKLNgDLd5sHxHvQFjcOICrNYfIOsUZhFD?=
 =?us-ascii?Q?wD0+jH/7moPShApLU5MuLjJwbfqMOYMW25d82ok6Hwlhj+KT8LKAxUHiKfN1?=
 =?us-ascii?Q?sC6Lxp6pkywyNCTrLcHn93TEuniqqBuyvi50RqUiiH/2eoxdSYSTtrXkxnhf?=
 =?us-ascii?Q?phMgN6zLafewQ1kDLoB3PgTARYFEnXsOpE/LJ78BSSJbFfJ20T+bTC/WdMR7?=
 =?us-ascii?Q?y+Xz96wGwzDTY2liIXWJi8yL?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E4601F55BCC3C418E1145E037512160@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bf7889-caa5-4381-25bc-08d90fe1994d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2021 16:19:46.1685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4c4j+XgX1L01dh/2pU8lYlCGn5I91ZMIGty8nS1l95oI4Do7vzVlO4i5Y4bSHejZ1xLQipeVXEo+YCb4Xe3eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4674
X-Proofpoint-GUID: qnBMphUMGAhGGtw4auNocN22QAoKcZFB
X-Proofpoint-ORIG-GUID: qnBMphUMGAhGGtw4auNocN22QAoKcZFB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_09:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=john.levon@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "benjamin.walker@intel.com" <benjamin.walker@intel.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <levon@movementarian.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "tina.zhang@intel.com" <tina.zhang@intel.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "james.r.harris@intel.com" <james.r.harris@intel.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Kanth.Ghatraju@oracle.com" <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ismael@linux.com" <ismael@linux.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 "mpiszczek@ddn.com" <mpiszczek@ddn.com>, Cornelia Huck <cohuck@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "xiuchun.lu@intel.com" <xiuchun.lu@intel.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 02:51:45PM +0100, Stefan Hajnoczi wrote:

> > +While passing of file descriptors is desirable for performance reasons=
, it is
> > +not necessary neither for the client nor for the server to support it =
in order
>=20
> Double negative. "not" can be removed.

Done. I also took a `:set spell` pass on the whole spec, which should catch=
 your
other typos.

> > +Device Read and Write
> > +^^^^^^^^^^^^^^^^^^^^^
> > +When the guest executes load or store operations to device memory, the=
 client
>=20
> <linux/vfio.h> calls it "device regions", not "device memory".
> s/device memory/unmapped device regions/?

Spec was sloppy here, yes. Fixed up all the instances I noticed.

> Does anything need to be said about mmaps and file descriptors on
> disconnected? I guess they need to be cleaned up and are not retained
> for future reconnection?

Updated:

```
Therefore in order for the protocol to be forward compatible, the server sh=
ould
respond to a client disconnection as follows:

 - all client memory regions are unmapped and cleaned up (including closing=
 any
   passed file descriptors)
 - all IRQ file descriptors passed from the old client are closed
 - the device state should otherwise be retained

The expectation is that when a client reconnects, it will re-establish IRQ =
and
client memory mappings.

If anything happens to the client (such as qemu really did exit), the contr=
ol
stack will know about it and can clean up resources accordingly.
```

> Are there rules for avoiding deadlock between client->server and
> server->client messages? For example, the client sends
> VFIO_USER_REGION_WRITE and the server sends VFIO_USER_VM_INTERRUPT
> before replying to the write message.
>=20
> Multi-threaded clients and servers could end up deadlocking if messages
> are processed while polling threads handle other device activity (e.g.
> I/O requests that cause DMA messages).
>=20
> Pipelining has the nice effect that the oldest message must complete
> before the next pipelined message starts. It imposes a maximum issue
> depth of 1. Still, it seems like it would be relatively easy to hit
> re-entrancy or deadlock issues since both the client and the server can
> initiate messages and may need to wait for a response.

Filed https://github.com/nutanix/libvfio-user/issues/466

> > +* *Offset* is the file offset of the region with respect to the associ=
ated file
> > +  descriptor.
> > +* *Protections* are the region's protection attributes as encoded in
> > +  ``<sys/mman.h>``.
>=20
> Please be more specific. Does it only include PROT_READ and PROT_WRITE?
> What about PROT_EXEC?

Updated to just have PROT_READ/WRITE.

> > +If a DMA region being added can be directly mapped by the server, an a=
rray of
> > +file descriptors must be sent as part of the message meta-data. Each m=
appable
> > +region entry must have a corresponding file descriptor. On AF_UNIX soc=
kets, the
> > +file descriptors must be passed as SCM_RIGHTS type ancillary data. Oth=
erwise,
> > +if a DMA region cannot be directly mapped by the server, it can be acc=
essed by
> > +the server using VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE messages, =
explained
> > +in `Read and Write Operations`_. A command to map over an existing reg=
ion must
> > +be failed by the server with ``EEXIST`` set in error field in the repl=
y.
>=20
> Does this mean a vIOMMU update, like a protections bits change requires
> an unmap command followed by a map command? That is not an atomic
> operation but hopefully guests don't try to update a vIOMMU mapping
> while accessing it.

Filed https://github.com/nutanix/libvfio-user/issues/467

> > +This command message is sent by the client to the server to inform it =
that a
> > +DMA region, previously made available via a VFIO_USER_DMA_MAP command =
message,
> > +is no longer available for DMA. It typically occurs when memory is sub=
tracted
> > +from the client or if the client uses a vIOMMU. If the client does not=
 expect
> > +the server to perform DMA then it does not need to send to the server
> > +VFIO_USER_DMA_UNMAP commands. If the server does not need to perform D=
MA then
> > +it can ignore such commands but it must still reply to them. The table=
 is an
>=20
> I'm a little confused by the last two sentences about not sending or
> ignoring VFIO_USER_DMA_UNMAP. Does it mean that VFIO_USER_DMA_MAP does
> not need to be sent either when the device is known never to need DMA?

If a device is never going to access client memory (either directly mapped =
or
DMA_READ/WRITE), there's no need to inform the server of VM memory.  I remo=
ved
the sentences as they were just confusing, sort of obvious, and not really
relevant to real systems.

> > +* *Address* is the base DMA address of the region.
> > +* *Size* is the size of the region.
> > +* *Offset* is the file offset of the region with respect to the associ=
ated file
> > +  descriptor.
> > +* *Protections* are the region's protection attributes as encoded in
> > +  ``<sys/mman.h>``.
>=20
> Why are offset and protections required for the unmap command?

They are now explicitly listed as ignored.

> > +* *Flags* contains the following region attributes:
> > +
> > +  * *VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP* indicates that a dirty page=
 bitmap
> > +    must be populated before unmapping the DMA region. The client must=
 provide
> > +    a ``struct vfio_bitmap`` in the VFIO bitmaps field for each region=
, with
> > +    the ``vfio_bitmap.pgsize`` and ``vfio_bitmap.size`` fields initial=
ized.
> > +
> > +* *VFIO Bitmaps* contains one ``struct vfio_bitmap`` per region (expla=
ined
> > +  below) if ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags.
>=20
> I'm confused, it's 1 "VFIO Bitmaps" per "Table entry". Why does it
> contain one struct vfio_bitmap per region? What is a "region" in this
> context?

Thanos?

> > +Upon receiving a VFIO_USER_DMA_UNMAP command, if the file descriptor i=
s mapped
> > +then the server must release all references to that DMA region before =
replying,
> > +which includes potentially in flight DMA transactions. Removing a port=
ion of a
> > +DMA region is possible.
>=20
> "Removing a portion of a DMA region is possible"
> -> doing so splits a larger DMA region into one or two smaller remaining =
regions?

We certainly don't have that implemented. Thanos?


On Wed, May 05, 2021 at 04:51:12PM +0100, Stefan Hajnoczi wrote:

> > > How do potentially large messages work around max_msg_size? It is har=
d
> > > for the client/server to anticipate the maximum message size that wil=
l
> > > be required ahead of time, so they can't really know if they will hit=
 a
> > > situation where max_msg_size is too low.
> >=20
> > Are there specific messages you're worried about? would it help to add =
a
> > specification stipulation as to minimum size that clients and servers m=
ust
> > support?
> >=20
> > Ultimately the max msg size exists solely to ease implementation: with =
a
> > reasonable fixed size, we can always consume the entire data in one go,=
 rather
> > than doing partial reads. Obviously that needs a limit to avoid unbound=
ed
> > allocations.
>=20
> It came to mind when reading about the dirty bitmap messages. Memory
> dirty bitmaps can become large. An 8 GB memory region has a 1 MB dirty
> bitmap.

Right, yeah. I filed https://github.com/nutanix/libvfio-user/issues/469 to =
track
it.

regards
john=

