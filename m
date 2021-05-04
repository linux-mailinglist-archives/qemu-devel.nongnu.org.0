Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC8372C1B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:35:32 +0200 (CEST)
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldw95-0001jd-CB
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1ldw5m-0007r9-Sp
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:32:07 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:37962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1ldw5i-0002r4-Sw
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:32:06 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144ERC13017709; Tue, 4 May 2021 07:31:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=GI+N9+N4kTJuFQ0AEzlGb5KvQ9yUO3fsouKZN5fvahc=;
 b=lpzp4YkU+xr5lbeqlYsoq6Q7tPLIQd1QFd+CuitngXvN1v6kEqYG7X2v3lsTaYkMzS03
 Kiq3h98j6H3G9xL0nyhNusTz7QcTXzGEXqePZOcm835uftjxC9qzBxBP3N0NgpjeQXEi
 TImQUG6n4Txme4Cq3xEVlmuKBYoQWibwACzcYp4+F0Eth/9iueq4a+sfwkOfOTdVxIuD
 23mbNkjUzFCHRYo8WyuQfskeic1DFQTxNwdc8hV+QnxD4BYxDgRBkwZy4EqUSsB+PuW6
 Eqd5mYnHJ1SvUd3W31gHpKYOh+AGGc50mm7Dyd4V54H6n7jwbl+734AE4/cxern5i3Ys 5A== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by mx0a-002c1b01.pphosted.com with ESMTP id 38a9d1bga2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 07:31:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOmF7hlxj2TpGPKfbtWD/qPvC4W/WujiwRtYm/TXRbPTmdw8oUvOlRmznV4C/gZhAjZoTpQa7zZZ3P5pcSK4OwdUPL4ATSRWh6gOfiDkUZ02Rr/3X668L75uX85/7rCtmHA3rPHKxPnhyDb1IGrmINO4mPk5VqFSg641zoMrpBIGjiwMmv0eXpEjnYkCh/7fh5aa4zHmpQNNMN283lfazWm5DM43ulEnmbV+tsGfkRlySikNISxFZLs5enlxUOtxhn5gzjDM10L2Ylm063x/iv6qa4koNdm4XqQqFNDdEDdQ5JrG9dorRAWAGuR5s7cPnmG5rel4AiWY3oqGhtwjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GI+N9+N4kTJuFQ0AEzlGb5KvQ9yUO3fsouKZN5fvahc=;
 b=Rt/xEfUGB9jLVJSGR7GhQovuZo3aGE+UW6eW2ssYRC5ylvtlMSVR43VGgkbJ5jPWeodux8bJ8vBcVzTfUm2dfeUHauhMev+hwLL6l6HhvH4xwQYLud3QlUUYXc6v4F/fk82SoJSAaMCNlU3FvpUbECWyTUyqe3WK9gHNC+dmFU7A0kcp9tWaxefHEygxnMGPQ7NrB84E71HLFZWGMHhsETWSRV6Een78TT9EctMujQ3OQDlnwXfAP8MrrR2SQEi6HDz7RnnygDW7EobsxYAzkY07pd1ZUlXjgfxEHhdUqRfuCAfrVbntcgAjhhe8ebrGSJOqf5h29dnVjVfiH7Fb8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by MN2PR02MB6319.namprd02.prod.outlook.com (2603:10b6:208:180::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.43; Tue, 4 May
 2021 14:31:45 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::c97f:ebc7:b7e8:29ad]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::c97f:ebc7:b7e8:29ad%7]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 14:31:45 +0000
From: John Levon <john.levon@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Thread-Topic: [PATCH v8] introduce vfio-user protocol specification
Thread-Index: AQHXMSMgb7SIFmt51kWnbVuTmfaYAKrTdveAgAALKIA=
Date: Tue, 4 May 2021 14:31:45 +0000
Message-ID: <20210504143141.GA1078723@sent>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YJFRcdvcOlwm2bd7@stefanha-x1.localdomain>
In-Reply-To: <YJFRcdvcOlwm2bd7@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [88.98.93.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 279e4acd-5c9e-428b-57ec-08d90f095837
x-ms-traffictypediagnostic: MN2PR02MB6319:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR02MB6319E03062F2A5D64C3254A9975A9@MN2PR02MB6319.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4S5FGEvvoDDfBZTAzVNG7hveb8qyN4ut1Onrlz5gflLyEhHSf/GTxl9B3lP6XGJACU7V46jrEu/G3KOzq41Es/5CnuRWs8Mbd+DGNFyUFkPeGII+jbW1nBuleCLDcgzB1Zeumg5a9Ot8AxunQAazyUtKb5x2hpaaigDgCjN18encXPJpmImg4Fy+p3esF1HOO5TkUCQhqdhMtZKEtr7lmlIPsohX6npaLoZ+EUFQQvb719uHXi4H/627SNhej5t6vn4zz0GtEPxOVGIrDhlCxajF/e6XHt2HxEeja+LZAWe6YLqE+lP815MfWdgnisVGIZbv6Pa3rusAI32kH4U1/cpxTNwo0toxfaK0+akkuG4++o4hLzE//+SICWqrFf3ZuVuBRlzz2L4CfPFf91T1lyfmVfjXtetthwgo0t9sRbWdNMcn1C67/moe3DL+4QGhEWJnjozieJbSkZVWvP4FuJ8amd352Wik32DFOKjdhEIAzJwRnk57F3UXBUNkaBWxplz+qIW4o26jm8AKDZmYI5hbD2dURmRWXLrSTnt5vL0TVd4tKj5W3srNLz1XvImtBoLcQkQ9ZXMrBIx1jRy8dUj/CK8NixiuyGziTxZoXlE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(376002)(396003)(346002)(366004)(136003)(44832011)(2906002)(4326008)(54906003)(64756008)(33656002)(9686003)(71200400001)(122000001)(186003)(66476007)(6506007)(86362001)(66556008)(316002)(66946007)(38100700002)(76116006)(33716001)(7416002)(6486002)(66446008)(83380400001)(91956017)(26005)(8676002)(6916009)(1076003)(8936002)(478600001)(5660300002)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7lmny7d9jiGuBjZ/hseC0Cq3M79IE1+ipkrWxbe8AHga/pKMjn88HSd7gpsK?=
 =?us-ascii?Q?eQME3Gi0BRSyTFATLMPJX94Hry8ijTR6CDXGOhD0mDoCsihKUBU4fOWFhq3r?=
 =?us-ascii?Q?d+Vvl5uC2htGSrUkTJbFHrH/Kwql6y6ChUOoxQ+oJ8N+RYJL58Yte7zj8ynU?=
 =?us-ascii?Q?DTL0dXMFvZioQ8r1h4uN8E5sdPqJgPQj/0/Zql056mRdC1bi2kaZaALCdc7P?=
 =?us-ascii?Q?iqGEC6wFHTK2BldQKel1v7uFUJtfYymRnde0uXDv43UVDUrUxieN1XqeM/3j?=
 =?us-ascii?Q?EqPyiYzb6ph8PX32gDTfjr/hpSq+HQ8kvyd2bKcqOaTLVnN+/1N9vwsCY+fo?=
 =?us-ascii?Q?KFKb+06aKx5f9tSem8twQkFT9071IbMnq394gklD6cqx6IhRWQpS+haxelek?=
 =?us-ascii?Q?ZDQ2x52VznJrN89GqsIy4lc9UZal1YP5u61SIMHY3jA4rGvJrEyXsOCGlzGa?=
 =?us-ascii?Q?0FU+kajtDQ12+E9zcOFyEritJjAqLge8jxHuWp8k4fd8exll9ErYVOlhywID?=
 =?us-ascii?Q?Bjc0486kYZzNQR2F9XtiQzv8gCOBejDoEeXKok4+FEmOEi0hjVVwXZ9MlUb8?=
 =?us-ascii?Q?gxC4xE7LW/whucuxlxCZhmugL3/FWW5daiYLnoe9jdVtfbWufQbcQmmSllgx?=
 =?us-ascii?Q?jjcKZ/KMmDcH59pHitFcATCkAIxqQkNmzuGO7/ebvLKRgmwF+0F1DvF71raE?=
 =?us-ascii?Q?4vm18xtcVHRMu99aJW9kIOuFC/PP3AoXNJOr+fUFDGJc4HhGRrIZqAWNQGbH?=
 =?us-ascii?Q?Salq+8HQfMEC9mHm+Z6HFWZ3MJoEOnSCLwT/fHWltFSnoSJoXJZwolONv+rp?=
 =?us-ascii?Q?KT8SaO4CBzJqbBcPlLWOJyKwG/ReA3IxyjxOd9gNNV5FoEkTv/JgVJvEsbeh?=
 =?us-ascii?Q?scR3DhMl7XaJeQaQQ/RQjhXi180xIWQUaIF9/VxK0jabyDgJRo55E5EQdlHD?=
 =?us-ascii?Q?WXSNdS12ZMf+2nYA4day7sjQ1r8Eov8JjLp9lvM29/XqIyBGY1pY07XDCv89?=
 =?us-ascii?Q?JEROjIEsbNakpVfJAmaTdcEaHhdFM9R0MZDHlkowqwYQoeXuEvU4mh+Dk9gi?=
 =?us-ascii?Q?ehkoIOLt7l92cIDmBBpStZ4S2Kx5RjL/MSodn7p4L4EAVm0Py7Fx/4JY3l8h?=
 =?us-ascii?Q?7oK9ZvgmdDSQSf3Scewn6ouULCq+DBnZx1cg9M56HecoiIr7qd4om8leMAYN?=
 =?us-ascii?Q?4piIq6mTkwwZQABQdWq+jWEplkp/SW70AkktYj+CW5bXjNildX8sRR6E0Xir?=
 =?us-ascii?Q?WIm00IS3KjAyW6JAGxCh8iqRjFQabJHRpenOvXpuF67O2OQXp2PMWj0jyYM7?=
 =?us-ascii?Q?N8voiUM9Qys52kY18aSg+QMs?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2086AF828EE65144A98E27972C3C2594@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279e4acd-5c9e-428b-57ec-08d90f095837
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2021 14:31:45.7280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J8k1Iw7NrRZagQhSwUgFSl6QIXr1zJng38IenNM24JOStues/rQoSedu2YFASldfov2ZmxhYKKcE+vorkXDpSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6319
X-Proofpoint-GUID: Uo4_G5h0_PyHZaIsIPg3JN_wDC54irix
X-Proofpoint-ORIG-GUID: Uo4_G5h0_PyHZaIsIPg3JN_wDC54irix
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_08:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=john.levon@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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

> On Wed, Apr 14, 2021 at 04:41:22AM -0700, Thanos Makatos wrote:
> > This patch introduces the vfio-user protocol specification (formerly
> > known as VFIO-over-socket), which is designed to allow devices to be

Thanks for your review so far Stefan!

We'll make sure to respond to all your comments as needed, so this is just =
a
partial response.

> > +Socket Disconnection Behavior
> > +-----------------------------
> > +The server and the client can disconnect from each other, either inten=
tionally
> > +or unexpectedly. Both the client and the server need to know how to ha=
ndle such
> > +events.
> > +
> > +Server Disconnection
> > +^^^^^^^^^^^^^^^^^^^^
> > +A server disconnecting from the client may indicate that:
> > +
> > +1) A virtual device has been restarted, either intentionally (e.g. bec=
ause of a
> > +   device update) or unintentionally (e.g. because of a crash).
> > +2) A virtual device has been shut down with no intention to be restart=
ed.
> > +
> > +It is impossible for the client to know whether or not a failure is
> > +intermittent or innocuous and should be retried, therefore the client =
should
> > +reset the VFIO device when it detects the socket has been disconnected=
.
> > +Error recovery will be driven by the guest's device error handling
> > +behavior.
> > +
> > +Client Disconnection
> > +^^^^^^^^^^^^^^^^^^^^
> > +The client disconnecting from the server primarily means that the clie=
nt
> > +has exited. Currently, this means that the guest is shut down so the d=
evice is
> > +no longer needed therefore the server can automatically exit. However,=
 there
> > +can be cases where a client disconnection should not result in a serve=
r exit:
> > +
> > +1) A single server serving multiple clients.
> > +2) A multi-process QEMU upgrading itself step by step, which is not ye=
t
> > +   implemented.
> > +
> > +Therefore in order for the protocol to be forward compatible the serve=
r should
> > +take no action when the client disconnects. If anything happens to the=
 client
> > +the control stack will know about it and can clean up resources
> > +accordingly.
>=20
> Also, hot unplug?
>=20
> Does anything need to be said about mmaps and file descriptors on
> disconnected? I guess they need to be cleaned up and are not retained
> for future reconnection?

Yes. We're still iterating on the implications of these scenarios and tryin=
g to
figure out the right approaches, so a lot of this is still very much
under-specified.

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

It's certainly the case that implementation-wise right now these are issues=
, at
least on the library side. I think I'm probably OK with requiring responses=
 to
be provided prior to async messages like VM_INTERRUPT.

> > +The version data is an optional JSON byte array with the following for=
mat:
>=20
> RFC 7159 The JavaScript Object Notation section 8.1. Character Encoding
> says:
>=20
>   JSON text SHALL be encoded in UTF-8, UTF-16, or UTF-32.
>=20
> Please indicate the character encoding. I guess it is always UTF-8?

Yes.

> > +| ``"max_fds"``      | number           | Maximum number of file descr=
iptors  |
> > +|                    |                  | the can be received by the s=
ender.  |
> > +|                    |                  | Optional. If not specified t=
hen the |
> > +|                    |                  | receiver must assume        =
        |
> > +|                    |                  | ``"max_fds"=3D1``.          =
          |
>=20
> Maximum per message? Please clarify and consider renaming it to
> max_msg_fds (it's also more consistent with max_msg_size).

Yes, that's a much better name.

> > +| Name         | Type   | Description                                 =
  |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| ``"pgsize"`` | number | Page size of dirty pages bitmap. The smalles=
t |
> > +|              |        | between the client and the server is used.  =
  |
> > ++--------------+--------+---------------------------------------------=
--+
>=20
> "in bytes"?

We'll add to the prelude that all memory sizes are in byte units unless
specified otherwise.

> > +Versioning and Feature Support
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +Upon establishing a connection, the client must send a VFIO_USER_VERSI=
ON message
> > +proposing a protocol version and a set of capabilities. The server com=
pares
> > +these with the versions and capabilities it supports and sends a
> > +VFIO_USER_VERSION reply according to the following rules.
> > +
> > +* The major version in the reply must be the same as proposed. If the =
client
> > +  does not support the proposed major, it closes the connection.
> > +* The minor version in the reply must be equal to or less than the min=
or
> > +  version proposed.
> > +* The capability list must be a subset of those proposed. If the serve=
r
> > +  requires a capability the client did not include, it closes the conn=
ection.
>=20
> Does the server echo back all capabilities it has accepted so the client
> can still close the connection if it sees the server didn't accept a
> capability?

Yes, if a client *requires* a cap that the server doesn't report back, it w=
ill
be missing from the server response JSON. The spec needs more detail here.

The response reflects the server's state. If a server doesn't support a cap=
, it
won't appear in the server's response at all. If a client doesn't support a=
 cap,
it *will* appear in the server's response anyway.

The values for each capability have cap-specific semantics. For example, fo=
r
max_msg_fds, the client->server JSON lets a client give a maximum number of=
 fd's
supported in server->client messages. The server's response JSON, in turn, =
lets
a server give a maximum number of fd's supported in client->server messages=
.

migration::pgsize is a min() function instead as you can see above, etc.

> By the way, this DMA mapping design is the eager mapping approach.  Anoth=
er
> approach is the lazy mapping approach where the server requests translati=
ons
> as necessary. The advantage is that the client does not have to send each
> mapping to the server. In the case of VFIO_USER_DMA_READ/WRITE no mapping=
s
> need to be sent at all. Only mmaps need mapping messages.

Are you arguing that we should implement this? It would non-trivially compl=
icate
the implementations on the server-side, where the library "owns" the mappin=
gs
logic, but an API user is responsible for doing actual read/writes.

> How do potentially large messages work around max_msg_size? It is hard
> for the client/server to anticipate the maximum message size that will
> be required ahead of time, so they can't really know if they will hit a
> situation where max_msg_size is too low.

Are there specific messages you're worried about? would it help to add a
specification stipulation as to minimum size that clients and servers must
support?

Ultimately the max msg size exists solely to ease implementation: with a
reasonable fixed size, we can always consume the entire data in one go, rat=
her
than doing partial reads. Obviously that needs a limit to avoid unbounded
allocations.

> > +VFIO_USER_DEVICE_GET_INFO
> > +-------------------------
> > +
> > +Message format
> > +^^^^^^^^^^^^^^
> > +
> > ++--------------+----------------------------+
> > +| Name         | Value                      |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| Message ID   | <ID>                       |
> > ++--------------+----------------------------+
> > +| Command      | 4                          |
> > ++--------------+----------------------------+
> > +| Message size | 32                         |
> > ++--------------+----------------------------+
> > +| Flags        | Reply bit set in reply     |
> > ++--------------+----------------------------+
> > +| Error        | 0/errno                    |
> > ++--------------+----------------------------+
> > +| Device info  | VFIO device info           |
> > ++--------------+----------------------------+
> > +
> > +This command message is sent by the client to the server to query for =
basic
> > +information about the device. The VFIO device info structure is define=
d in
> > +``<linux/vfio.h>`` (``struct vfio_device_info``).
>=20
> Wait, "VFIO device info format" below is missing the cap_offset field,
> so it's exactly not the same as <linux/vfio.h>?

We had to move away from directly consuming struct vfio_device_info when
cap_offset was added. Generally trying to use vfio.h at all seems like a ba=
d
idea. That's an implementation thing, but this was a dangling reference we =
need
to clean up.

regards
john=

