Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38402E212C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 21:14:44 +0100 (CET)
Received: from localhost ([::1]:57332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksAWw-00019d-Vt
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 15:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgreid@dylanreid.com>)
 id 1ksAVY-0000EX-0y
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 15:13:16 -0500
Received: from mail-bn7nam10olkn2018.outbound.protection.outlook.com
 ([40.92.40.18]:1985 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgreid@dylanreid.com>)
 id 1ksAVW-0002ln-AJ
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 15:13:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7rVOxToq3guuNbEagifm0z/dAcpbznfGbnAbwUdENuEu3AZWHtXW7QjetwtWnPeqPZEJRFQSepiHfqf9woBPC4emuDRiozFHWHxS5AFIDFe6kdgt2J/DohbxgjI7K1wBxNKTSF/SOlWbY9u9mQRR8tYYgvtWdMrTeRZeyrOuKD+uK2Jv8UaEINatDpiqzu+faTixSzl8C+/T6E5p0lTIoe6+UBY8Bdf6M0DEtDobqGPU4gf3jHfCRWY9AwGkMtX0DNMC9Vk8H902BQijQiIg9HYcZ5wEsvRkyIl2a7oXm1QoyijOOCYSAbu3Go75uxOGPDUlm9Clq/i2WZq82Re+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzFhleinHZn4FPqzWpUmLjqT2zWiNUgV+UMp9RuLyBw=;
 b=iN/RQuNe/yL/1SB2Gw9Cjk2GgjLuNjPXIVCX6KZJRj+75zjFDKPdHXNoLDpV25x02LoctdVDWNpam7ZW07O60SVzYto0+ZhvP5XjTRdGLFO6vZ+GZdKsSY/sUXBTLDw+qdrch9L3i3vMk88ALy9Ypxl0f/fVo79BnyMBj0FHpdDgQ/UdeBH/wLYc2eA5doKeJRczCTkIYpYPkhxhwknluwoA/RgYs/9RP0Z4FR0mZm6/5V/GE/CeA+/ToEUR9C6FsMw1XWqn78pkYKIv+obHqzOBuaPmm9vZwvme9fwJQaMM5XEgXSydQYW9+1tKdpl7Fme3mf8pKVRa3RJpe+k+Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6NAM10FT043.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e86::47) by
 DM6NAM10HT047.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e86::383)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Wed, 23 Dec
 2020 20:13:11 +0000
Received: from BYAPR08MB4648.namprd08.prod.outlook.com
 (2a01:111:e400:7e86::41) by DM6NAM10FT043.mail.protection.outlook.com
 (2a01:111:e400:7e86::421) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Wed, 23 Dec 2020 20:13:11 +0000
Received: from BYAPR08MB4648.namprd08.prod.outlook.com
 ([fe80::74f4:99e9:5170:d31f]) by BYAPR08MB4648.namprd08.prod.outlook.com
 ([fe80::74f4:99e9:5170:d31f%3]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 20:13:11 +0000
From: Dylan Reid <dgreid@dylanreid.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] vhost-user: Check vhost features for CONFIGURE_MEM_SLOTS
Thread-Topic: [PATCH] vhost-user: Check vhost features for CONFIGURE_MEM_SLOTS
Thread-Index: AQHW2Lv8q5HPhLTiikOgtiSKGPTxZKoEIWCAgAD8KxQ=
Date: Wed, 23 Dec 2020 20:13:11 +0000
Message-ID: <BYAPR08MB4648E8BF2FE7357BE340A114C8DE0@BYAPR08MB4648.namprd08.prod.outlook.com>
References: <BYAPR08MB464854F9582554185F3B36AFC8DF0@BYAPR08MB4648.namprd08.prod.outlook.com>,
 <55D3E635-B98B-467F-8A73-D15F20965983@nutanix.com>
In-Reply-To: <55D3E635-B98B-467F-8A73-D15F20965983@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:4EEBE0E87325DBF45563140F3C658247256E09910624342AC83849522255F4E8;
 UpperCasedChecksum:F68CCFB73BBE0DC99B82E68DEA47513C7878934AE797CE33AEA779BF09D6605E;
 SizeAsReceived:7017; Count:44
x-tmn: [EiQcoeVPuR234rZiSFAvb5gLxtNvjNv3]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 7dd0271d-b168-4976-4e48-08d8a77f2bea
x-ms-traffictypediagnostic: DM6NAM10HT047:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ICmT0gTTKoSrmpTsTddnEtVJF41zjl7aXvtZgFwCd6e2U5iI1b484TErwBTNnsEmc4Cd5YgIxviFr41PpNvHzK9SqGXZLVzpy3gVZB0SnN6CfPtIR4x6rD7dqijVdNwLsweAUT8eLCq504b0/jP03fsZeKrcbJoXwai777ld0e7AS1rnbN2VWx+Gj8tR2JCA7moCFdkuZVKu96CIlLBs1aFhfbmqlnWUld9GIM76gS/9YrvdXIZ7lwjVEj6me6qz
x-ms-exchange-antispam-messagedata: TcDs4cAHrXrIOBDRSfyKVGARV8sM9BDah0S+QhoBJy9ahPNeYzuijkT8UChcHg3WcGH/mPyPbfQv1YMmG0wi6M0RXE/zu5MA2CZkcoWkxqU9+Z2g8jqXDKTG2Ce4cUnLTt6s7zQR7o6geXlNfvFO0A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT043.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd0271d-b168-4976-4e48-08d8a77f2bea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 20:13:11.1706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM10HT047
Received-SPF: none client-ip=40.92.40.18; envelope-from=dgreid@dylanreid.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>Agreed - VHOST_USER_PROTCOL_F_CONFIGURE_MEM_SLOTS is negotiated at the=0A=
>vhost-user, not virtio layer. The dev->protocol_features flags are taken=
=0A=
>from the VHOST_USER_GET_PROTOCOL_FEATURES message, which retrieves the=0A=
>supported vhost-user features from the backend. See libvhost-user for a=0A=
>simple reference implementation.=0A=
>=0A=
>The VHOST_USER_GET_FEATURES message retrieves the virtio protocol=0A=
>features, so checking features instead of dev->protocol_features would=0A=
>incorrectly check the supported virtio features instead of the vhost-user=
=0A=
>ones.=0A=
>=0A=
>Am I missing something here?=0A=
=0A=
No, you're not missing anything, I am(so is the code I was working with).=
=0A=
I hade the message number and feature bit backwards.=0A=
=0A=
Thanks for taking the time to read this, your explaination got me back on t=
he right track, I'll go fix the library I was using.=0A=
=0A=

