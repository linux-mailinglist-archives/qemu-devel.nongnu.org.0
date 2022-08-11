Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA6B58FF4D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:28:41 +0200 (CEST)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMA6y-0008L4-Hu
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1oMA0o-0006op-JU
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:22:18 -0400
Received: from esa1.hc1292-66.eu.iphmx.com ([23.90.118.89]:49192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1oMA0m-0007Mh-BB
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=neuroblade.ai; i=@neuroblade.ai; q=dns/txt;
 s=nbselector1; t=1660231336; x=1691767336;
 h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=kdyNsvtPvqtPU51Pz55VwyYSZjQ/YfQkI6NvmI9YyXA=;
 b=LxkywlCt1+A3mhdwhW8O0vcv7WrEOmUO1yb5ANnrfVkVWiAZWAPCnMCu
 c9sZvcmyoaA/C7yPRAKGR5tPjTCV4yUXPDc/vOP1iKNY995dO24IhKWUm
 UHnvqzoT+yqtddofPZq2/lOdWu1vGWKQadGw+kl33kB9acIUXqIsfJ8BF
 QR5yPDRXaYxSZnQgxM/4HGdhWDoY0cCZeZ0ZfiKVP3aZzgS9jV/MUG98x
 9A6om26NikuejmxC8rbCsd8x1QP+WYU25sa1z5gxWhBlc3TMzvr7azEUa
 5xvxkk2hXygtJQiHQKh90k4COcE8J6uWk55FaOr8ktLTbxDCwQyKn4j8S A==;
X-IronPort-RemoteIP: 104.47.17.105
X-IronPort-MID: 112458
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-db8eur05lp2105.outbound.protection.outlook.com (HELO
 EUR05-DB8-obe.outbound.protection.outlook.com) ([104.47.17.105])
 by ob1.hc1292-66.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 18:22:09 +0300
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRirXdmOBvPthUvxhlUszv/o5rqdYZjTwbtEYdiQGDxMPfLsiVRsxn7hRsMzqPEGRpxVii5FtfFTnr1/V99idI/cIZnRYm1sRaza/Q3ftVv2MKQvSxTStOn4JsMX7ORNdArrh8//JPWbRc090hLNvs7wg+yfodgvXCWfuyuK9rhw36clf1s4pikZpPV9XvP4CVHezn1tguvLwwchqejTYcZr9imSGDSGileT4Q/sq1LVc3QLEXuq9MAWnQBeatlNXxSN8gKDFQ7dL9LT+em0NWOXbr/GJWN73YTeNVjj1JuWtAFDA1jDS1JqSS3m78iE2GHLKDgkEemIqRFnmpovjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JamqOoTXqAMGGuK5MLuvEic2q+EHSDzeYt4SfRcZdMc=;
 b=Ud15o1nROWLfKNJcUB0yLu1zNEgSP7lS9qzqgu1bga7EzjaK29uz2arBXFwG+JrQ1Jt/9MrBKjex5VxGq9vhhHN38jjCXmNxWbHoEfkupcZuodgNH9OHvdrvfDmNgo0TrsZgJmI3cqFmhvxw51Z+a9WU2LU2LmTDjRTuqmsLus4xTrcVrHv5w+yKWZh+JYGbkTXuQw75pzMGoRqFYehQzr7MddI3Ab1hzN0/wq3soQkze0mH4YkOeNOE618sPOAx/CoG4++Bxq8E3EprxOn+bSPkgzohe+aRLTEk4ccpHQTlp1NQ7Du1s6xdIcCAC3Rtc3uGBSNfIT7ldkKJVT+MXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by AS4PR09MB5792.eurprd09.prod.outlook.com (2603:10a6:20b:583::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 15:22:08 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::a9e4:1c4e:9fee:f60c]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::a9e4:1c4e:9fee:f60c%5]) with mapi id 15.20.5504.022; Thu, 11 Aug 2022
 15:22:08 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Migrating NVME device
Thread-Topic: Migrating NVME device
Thread-Index: AditjJBj5aaNBWkARmS4yCIYkUFUSA==
Date: Thu, 11 Aug 2022 15:22:07 +0000
Message-ID: <PA4PR09MB4880C2CA0DB88F0330BDFEACEB649@PA4PR09MB4880.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bae35d77-716e-40d5-1967-08da7bad4139
x-ms-traffictypediagnostic: AS4PR09MB5792:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9VHITZj1w53eA/Egij8Rb7O8BoAJWy1FNvyB0d+P0hhJ2mYimRt5uJnUTF/MqAPW4SSEQbuxGZwHaCMywISY7LfcK0XgFjVthVJQe7rOvYLIUDrilQiPhKm1CyDiJz/jco0sf4ghkfKiqpft5Qo4vugab4CSJZ/4c5FvR80cRV2Or+DyyJjRz2pKvPPoNZ8HgVlHbugKSUwUn4E1ucPAHM2SBOxR6tYffu/xBCRnVgBm6LqPoNxv7UGQcgreSfW1ECcpa4TJGjRQbOJE5o2T0DX6D1QDc/01c6QcXN6UOyGMS+mqqYPwPGSpRZFznrUE4T6yYJ/IJVTpfHcOVVMaSwpzV+4Y6dc16ybkSM1tNqF2SAuMwtppTe+3oYCgbJHx1nm5HW4rP6A9CrE0gmAJfVleLo+e/LLlEM2l4wKDO8ZoqTLyJACYFf+yEKHA5V/FGSwcgSKXO6KBIfpDaLYrl14+XY+VgZC43Mn+7Ifrlh6POA7eNqpWiIohNonLijY++lparkmjcwLZQociXKg7wAG5wNXOOpgdz8W6OlCSyDQxlXWPhwcP8BIyJ7GaTzk3ynHnH0QcX8JL+5IPtqNdMDQ59VM1UUVvNRRn2XK2CZrZOHakJU3O16lUxyDrNntUyFVU6yC923nhE6uI7XGDn5wdBHqAMnsAA//kLk0xzpHSYo6LqqL1+OmGPNr3mdMtq1Yoemzh6h5l0sONc9nIF0KPwMr4DQM3vpJYrnLSk7OAZxGonXLa3FSuS9jq0pMZgvxvcbEV3pNGwndayY+XJcHIiRDWBlsrnuzQNjM3YjeAjdSMvhr/edTC+C7O3O9GAVN3e0BZYtYHQ6NFRpiKZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(136003)(396003)(39840400004)(38100700002)(122000001)(44832011)(316002)(86362001)(66476007)(66556008)(64756008)(66946007)(7116003)(66446008)(8676002)(5660300002)(55016003)(76116006)(38070700005)(52536014)(8936002)(6506007)(966005)(83380400001)(478600001)(7696005)(26005)(9686003)(41300700001)(186003)(6916009)(71200400001)(3480700007)(33656002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?48sjOJEjYEEr0LvI4GdgGiSHSC3ShwQLz1x20g1j78bHX5LUJ7/iixoeXJEM?=
 =?us-ascii?Q?LVj8FO8Cl281fsyWZD6mKv3hqxvYrUh6YszJAUIqvbX9ESGR3j/5KTMRuSYt?=
 =?us-ascii?Q?58IATL/pxyrJ5mD397oGky4P5hr0HzL71zOC4fhtYT77WF7gDq/ZA70rU0e0?=
 =?us-ascii?Q?peuzceRiAdrDHqpYsz4XqJAZ9VIK/tHQ2Vr+qW7EhFPO/iXdzY/LLySFIJB2?=
 =?us-ascii?Q?HQ47K1k1wFLXqWBkUcgYlqHXb0h0yoalZDxUQyqbOMuJoID89FFEWtEMW5yc?=
 =?us-ascii?Q?4rGCT798gg7dI6c//sNd3E9bCf9GmloUVqpExiPeCWoWM9U5stO06H6kvnZE?=
 =?us-ascii?Q?CLUrXjlJKEihc0lNEkjbuliE6gtTyrI80bo53RpxHwTO1mZT1F1zV3i6gbcM?=
 =?us-ascii?Q?KjQ0vZLxYUMOYXDImy8z053WLkM0MduzXxz4a23pq3VB9iwuP8o8KSPYmv4d?=
 =?us-ascii?Q?cghlQTealS9coCQUHiIadj+dfKM+CfRaKQCoF/y/iGz2IvZwGhVBtfwP7FQI?=
 =?us-ascii?Q?TXgrm/5Gjhw3MxedK4f9gXH7YM/I7Gk7Wgofa8+ab/ER2zREeYqdYzI+Vmxz?=
 =?us-ascii?Q?4UqmJPTTYvUyErnQta6Ty7S9txz2qDmw+CAcsL5Pp7wcmrsnj10M0PnFtvcG?=
 =?us-ascii?Q?z1YsFYUE3JGIkLnv5abAyE5UQpVFPi+ThjxYvwgvRiQFi1x39yE16M4dCPme?=
 =?us-ascii?Q?f6Ois3+JNEUiK6I37sZROzB6hkcgBre/bdphH00Xv4GygA/Ps4yup1P8uCqJ?=
 =?us-ascii?Q?fj4HlYzeGL5/yUuTUYm3dAHoSOUvW5U/bWyz9QS/R5LAefcV6NuflusBHubp?=
 =?us-ascii?Q?4kAmmVfPy45jA9K/Nc6qMueLopsPpPDWzpsIG7AL68GjAP0ox3MmYEfJkEzq?=
 =?us-ascii?Q?5Wk9mn5uDB+nQDPuzARO+/OxwUQvkn/BhyGBODj4NKhpUyrvFdM+lBtujeKW?=
 =?us-ascii?Q?PTTqukgykriqG5R1xiebDXrYAKpYRAyLCWyPOYqmG9EwRpzw9CN1dMXHWhhJ?=
 =?us-ascii?Q?SWsnXLkKZnOBgRpjpF1VwlmoqXDh2+sQ3MU4Z2zAtsIETBCFYtXg7iOLhaL2?=
 =?us-ascii?Q?4mJTKSVEJ3OYi/4cHRmesT7TAlD8NKkWRwyEepHDCGFDK4ubDL6i5l6QTM49?=
 =?us-ascii?Q?us4BBefbofvu3MfxNyQdGpZyXDMQ1HCJDVWJ2asW5vWQnM0UDTVOP1sarxM6?=
 =?us-ascii?Q?Gn/UcYcae+hmvu50gBAVwFPxIcnn+Gpy4+VveaExKvKQc4ziLc4ZLb+Jy3SC?=
 =?us-ascii?Q?ZxI2Yo1pqzifqQt8xKbStmBl95SqL7QtUs9sfKb6RjpFUtB5VpJo+wSh+0su?=
 =?us-ascii?Q?FrjDFdnBrjE9fEvqnWdG13jjHayDDfR1qIVP5KEyRPk0uLWYMQf+svoVrPMo?=
 =?us-ascii?Q?xGQVpw0/8YhE049W+FQb0eeGx8JqrOohOhhHagyh626GFMP5QJON9h8ZGhuX?=
 =?us-ascii?Q?DfF7dLuLueOhsZ/TbGoh6hMWlgaHDuJXAkxRUx44+wkWkrF5Ii9ZnCKLfF9A?=
 =?us-ascii?Q?uqjDYIa/ulWrhivQty1r3o2Ip7BXh9gF+owPgmpUKKeeZAL/i3SunLh/Vi94?=
 =?us-ascii?Q?CTIzT5iFCof8F/C6q22LNxz2VtANZGEqjq3MjzqXQjsPbVmKoTv16UHt3MeS?=
 =?us-ascii?Q?FA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ZE+G01n+hkHfR6qtvsQIjoSH4kvxfk+Qw0atoZYvGceBJY87gGFKvnMCFaSv6arBq4C/dzBj0kTZYO6zvdXspE8iWVhkXvFDqxEcVpJY8cnyNdTBK3uvk/rCciN92ts0wHqrGjDm8/SdCI3iGlfMsEMW0KWu75UewW+2ZzhaT4QdTYR/VzilUFxm8BPbv+EpXbkTJufKTfWAn1rVsVyhLg0ZnnU8BvrGhpxojHZs2dvNwAyJaZlxThhOzjxsj3ILIdG/eLAakP0iUP+OuJVnTN9dnfwdfzhATHtZHeOwwn1vWOah4nKcaVWlUF5P+RvG6VTKsKy/CutfNNFtnOFqq5wCmqhttBsyFu4pQmMAbtf09gOWL/24qJ3x1spbASlQbStIhxVytaiC5ilDGlq6W0CFD0Gvn7+nAxjkHSHJbrLfyFfBUmrIQpx33DYL/P0fMRl6xo0i+Rn/8fTQvszOFgllq9kBBzRWzoLAhdWFyVv6BR7LyyZAqyMgqJor+iiCBRKI8aHa43mr6ysGkf07Ov2PbybaG8wvtzZkepBSACJ3G7OEmP5rM1vPDSzmwdd8WrGEFfMB72DoylQuaFd4SD9e9FB1xIu8ZIT6L0k4m0QTXSHOQtRh9cZspl+2mc9O6WUTitCZSGSc+77oVJlQNY/PZx5im4KGAWL/4C9swDeVsLKupc+KXp7TZe1Z61aEabcmcHFeLR4MrgDn3ePjIgVf0u/+47IknZ3KrQgPxD4=
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae35d77-716e-40d5-1967-08da7bad4139
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 15:22:07.9541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rDRQvW5PO/hrhiBhAgycnQ7yEalGmNlia3yhkEWMizkD3NiyVDG+dN61msm6Zh55IjKcfEHr6ng5+KuIv5dnPw4A4gWkTlnvGo6s6UudhgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR09MB5792
Received-SPF: pass client-ip=23.90.118.89;
 envelope-from=amir.gonnen@neuroblade.ai; helo=esa1.hc1292-66.eu.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hi,

I'm looking into making NVME device "migratable".
Following previous discussion on https://lists.gnu.org/archive/html/qemu-de=
vel/2017-08/msg05091.html, I would like to implement the VMStateDescription=
 to save and restore the entire controller state, including all the queues.
"NvmeCtrl" defines the queues like this:

    ...
    NvmeSQueue      **sq;
    NvmeCQueue      **cq;
    NvmeSQueue      admin_sq;
    NvmeCQueue      admin_cq;
    ...

typedef struct NvmeCQueue {
    struct NvmeCtrl *ctrl;
    uint8_t     phase;
    ...

My understanding is that I should use VMSTATE_STRUCT to save "admin_sq" and=
 "admin_cq", but how do I save/restore the "ctrl" field of "NvmeCQueue"?
And is there a VMSTATE_ macro I could use for handling "sq" and "cq" fields=
 of "NvmeCtrl"? These are dynamic allocated arrays of pointers to struct, w=
hose size is a device parameter. VMSTATE_STRUCT_VARRAY_ALLOC is close but n=
ot exactly what I need here.
Is there a simple way to achieve this? Or do I need to use pre_save/post_lo=
ad to convert these into a more "serializable" form? Or create a new VMStat=
eInfo customized for this purpose?

I'd appreciate any hint or advice!

Thanks,
Amir


