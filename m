Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13145820CB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:11:52 +0200 (CEST)
Received: from localhost ([::1]:55720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbCx-00048F-SP
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1oGayj-0002FE-Hk
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:57:09 -0400
Received: from mail-dm6nam10on20609.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::609]:55264
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1oGayf-0004iV-TL
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:57:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiDFMA5xNUXUTNBVIh41EH/xnCuE0HUIxv3LnZTTmL83lbJ4NXRg+07S6AuApGTf8DFhidEzb5xRceKSOAmgc936YF4mQ75G7FFC91G/RJB/eCpEzhBO7xHKE4h9z/j3et0hUT0JfLCEpsgxJn9Pl9S/69aE30lXiSPDzj7NG60nX23YB8I2Cf22IGu3OmBsM6w9exoeWu4C4J7EdG+8mSiRaUtBv4a4lnLRU556LGHp6iqmbdrWJu/GLhoGVWdT9P+6K4qsq0/LplLlwYerxv5EdWj1V34awQXNMMS/r6h+wBBvVXAzUq3n5qlLZX3coFavBSzeS5re0cTOXYo3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ahf7ji9efRVzYmwVlfPOyZQZfkGT4FW8xkI+lCYNZmA=;
 b=MbxK4xBhj6kvP/cOPDIsJ/0mkvte61rliuE9iL47mp5NZYit8IqaD88btyTnByuin1kXPTc6zQBltgyHXKPKQmC/CKCEzFSqPeRNiQNWCfgdRXdOmCXLo3xSLgPmG1WyAvVkjE2EPCZ2sC8b2iHKT4OitAVeKvOau/C5hC6b3bLcXVZ9ES8A7CCZNG1ZsKS75y1yQ+ouN2/prHwLjFGgKj9ubiRgacECkdsDURQelh8Mc6Ow0fu35x5Ew46sF1Us78tSq9EnKTKfSpd9NLS9o2U5yD+8+qNgamOuJU5ILko1G3fRuTnzMslBwkjj3MrW8lbbDXXTiZ7xnS8K0JcHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ahf7ji9efRVzYmwVlfPOyZQZfkGT4FW8xkI+lCYNZmA=;
 b=D3abUAY/ugJL8X698iwG8FNlEo9/vbes/gyphzj2B0lCQT1LRMNIdzdBjZIDFVIjA25kxLd4q9BKpA7hGS82pD9wubCF2jIj3i10d2f6NNjEav1o1WKL50WrckLMweETsBfNZXrgTR7Q5LI7lus/qxVeaMiEgOZPTZdZHROcAwYbc8iynzuzGnI/BnwJ75MYW7jIP0Eji2sNivVt0smrCphCZIjzvg08i3P97jXDrTCjnNwfr7+8eYpRP2plz0vu2+7sSnxZ2Ww8o4F2LHWZBuQ+Rc8li7XlED+d1rjLOgwq25cDYeAlc2KaJa3Uo3Smt9jbfCCnPFpM7fbztGLsvg==
Received: from DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) by
 DM6PR12MB3243.namprd12.prod.outlook.com (2603:10b6:5:185::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Wed, 27 Jul 2022 06:51:57 +0000
Received: from DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::54d4:93f6:1cfa:948a]) by DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::54d4:93f6:1cfa:948a%4]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 06:51:57 +0000
From: Eli Cohen <elic@nvidia.com>
To: Eugenio Perez Martin <eperezma@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: RE: VIRTIO_NET_F_MTU not negotiated
Thread-Topic: VIRTIO_NET_F_MTU not negotiated
Thread-Index: AdibctjDcRi2EWKMSzmmrEX7B4yyOAAAkbGAAAAkGdAAAGTyoAAB7gYAACC7v/AAAsI8gAAAarJAAAVbDgABV8vWUA==
Date: Wed, 27 Jul 2022 06:51:56 +0000
Message-ID: <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
References: <DM8PR12MB5400869D5921E28CE2DC7263AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220719093841-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400F967A710B1151AD5132CAB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <DM8PR12MB5400AB08EE51E6BF05EEBDE2AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
In-Reply-To: <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba27c68c-eb57-46b6-0ff6-08da6f9c7f6f
x-ms-traffictypediagnostic: DM6PR12MB3243:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wx8y1UdWE4NlTYsetB7dPZ8XTKYbsVmg1NX9ffaT81dsCj3hzRclbjMgsZjF2TZOmuER4ZszLgyPX0zWnniakSiFuKqMrhGPHFe3PS6cGThvqS9EeG8+KY5/bx6XlBJWLvA6+fTROLAGlxswOt7mQnS8j3vtAJSG3nAtmTP3eMOYoFINhtje0NSk3Upy015Hg1U2ow2oUOTZ8hdkbmvFSgz+QUCgpfNz6nmdBsXPenG0HXnDvk5P6RIBXsMWNZE8p9W6BFjyKAyOVoDYg79oJuR/Hup/p7v4gBKuY6b8lj7O0X7P1KUWMtSLomqcX075FMx7VRyDMqU0Tmmal8aFHvhy4Lz/JxD0BbrEptjH4SyE0WS+pWfBa3Ftc4DpxVG5MuU/ooW8AwGLxcwD09dhQ9EAiBhAx8WQnvouCbuUf1sJsHj1g2nFi/GcQ8hvPq9fiobCOJKUHIyZduRMcgLBjdMU4kYHoqUiNplt+2QsBZyxWZhumIDUKU6oYw29AB3UMJR1unM0SJMy6f2Yt0crNeudYYDwDuv8nVeBdC2+d3bDqWwQOIGQcXkdRpLfFuxMwJezuFsgyoILqsv1rpGFooNWGPm5YklD4C1HKRI5GD77aehbdLQlP72GZDqn8hIB2l4iXXDXeW0L34e2YjrFb+QPX35Y3VzZxrznvBsefsgC5QAJqq1FTnMFngDgcTj8XqMak4TSb3asOIGegAgtzoMPVOWW6n7Lx76D/j9166rT2MMbmZ5UOvQNN7PJjZgI0dRnm7Gvy/vBHvQ/LKzZOUhKhkCtTR7XD0B5EpUp1ig+ERbKITmQymWKj99N3byA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5400.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(64756008)(66476007)(83380400001)(7116003)(8676002)(4326008)(66556008)(66446008)(6506007)(26005)(7696005)(55016003)(41300700001)(66946007)(9686003)(76116006)(86362001)(478600001)(71200400001)(33656002)(38070700005)(54906003)(110136005)(316002)(186003)(2906002)(52536014)(5660300002)(8936002)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGVVTUkzTzBScmF1cDdMQi9GNUxQcVVmZmJlS08rUUNqdkNVdU9pM0xSRjZP?=
 =?utf-8?B?UTRlZnh3SG8zRFZza2labzR1dVpweHF3TjJCOXFHcmFDNU9XeUVXWWo5UTdh?=
 =?utf-8?B?Z0M0aWxtTStLTmF4TXR4NEZzU2tOamVjUFV5OEdPMy9HdkZUTmZYdnZ6MU5m?=
 =?utf-8?B?cVpTcDBWMC8rNGpDVFdrTmt6MXJzUVBQYlJ0KzJIS0diU2VVN2UrbDV4dk1D?=
 =?utf-8?B?ZWprRnNaTVpHYWo4YnVwaDZhT3hFSVd2eDRJdFI5T1NCRDlRODdNa2IvUEVK?=
 =?utf-8?B?eVNVV1dyRHp2NmZkMmRVZm83MnZmWTVzQm5kU0t6aGlRQ2h6dDdQQnAvS1FP?=
 =?utf-8?B?alBoM2o2aUo2MVo5a3FWSnBIdndTOExVeVRlanVUdEFXOEJqM3NoQ0JNUVhF?=
 =?utf-8?B?aEFwdE95d2dUTHVlYkFIeHdoTTJ4YjRLWXVtSStIVEFkbTBDOXg2V3dudWU2?=
 =?utf-8?B?bWZoNWZuSDVXcllqdkVwYVRQWHJwV2NDbTkzQnBVcHBoSGNIWHJuTVdEL1JR?=
 =?utf-8?B?UzM3MlAvUC8vaGNyRVNwb0dXRzdZWVdpeWlSTkN2dXQrSWxnWGczdVcwYnNr?=
 =?utf-8?B?UVpzd1lGa1pGbnFCbnJiNFVmRjlGS2dxYlZvK1duK1B2NXhMWHUzUGszTGpI?=
 =?utf-8?B?a0lWSUt4bUprL0NuRkYxeHg3bi83MjJHd3ovL01HSTFnSThRaWhxajhCSzc5?=
 =?utf-8?B?emlGL1NZKzhidm1xMjRiSll3OTk0VVdYb0lISUNYbnZEcCswa05jUzdsbmZj?=
 =?utf-8?B?allWR3NFOWlIQlBYb05yQ0lBVUpRRmIvVFU2OVJPbTRjN2drSGlQK3AvY2Vq?=
 =?utf-8?B?QlIrOGUzMkRJRDNrWG9aR3Q1eFpnbG5xNXNGS20yWFI3QlRTTm9oNjRBbVNS?=
 =?utf-8?B?V2JOWmtDQmhtb05YR2c3NWxvWHkySFZHK2ljTHJkQ1ZEZGVGSnlMa0RBWjNn?=
 =?utf-8?B?NVB0R0d5WHhyUzMrWEhNSXl0RWVLMmZRTmYrakViWXlZK2NwMEFDMzh4Y01S?=
 =?utf-8?B?Um9uQ28rYXpWbnI0T3N5VCtsTFJGTmxQT0JabDZJYU5GaU1RZmg1S0I3R3NH?=
 =?utf-8?B?eDBYcmtVbG16ZGtUcEo5RnoyK2JhN0pSNEcrUkZCeCtCZktuV2R2QlhZc1VO?=
 =?utf-8?B?NHFKWEdtMjJydzl6U1R1L3ltU1Q5LzFQRU42VlJyVS9BWmhnMUEwcStnNTNi?=
 =?utf-8?B?Z2hZdTMyWVhDckJNbzVLc3NrWTd5WXE5eHI2cUs3WEpnTkZPa1RmZUgxYnAv?=
 =?utf-8?B?aWlleHRsS2orOXhDcG82akhaWHVPRzQ3YVZCVFRnT1FNTmNRZmlKRERaOXNB?=
 =?utf-8?B?ZStRbEhuZ1gzb3Q3V2pQVURHMytuVnV0ZVkvb1cvUS9yeUprV1Q2eDBCbG1R?=
 =?utf-8?B?REp2R3JDNjhqL0JPVmtvcndTQ2FTMUZ3ZlRWMUJScEJMVFp0by9kVDZnR29F?=
 =?utf-8?B?WWZybXoxMmZ5M0FvczFkemJubGNKd3UxclduQWEvYUF0ay9YblN5eStGMHhY?=
 =?utf-8?B?dXJnQ3cybWZCSzRGVG1HNjdqQytNZjlWRk9SUWlNakFDOHVvOHFERkFaUXV6?=
 =?utf-8?B?UUdiOE5OWmFKamJReHJqaW1Tb3ZIZGVVV0N4Vi9aeTRVNzlibCt5QXFDYUpo?=
 =?utf-8?B?RUJSYXBTblZYbmRNVG5xeElhNU5MRW81dDBkUWdQbmZGMklJd0VXSXU4WHRy?=
 =?utf-8?B?ZE9ma3JaQlZudkJKUVduRzhpSlFsMkEvRmZha3cySk9CSXJVSWRlWkRFWjhF?=
 =?utf-8?B?RjUzMUMxYk1kWTBkLzV0KzBvQ3VsSmRCNGV6eFh6dnBhUkFNY3pYd2VDWFli?=
 =?utf-8?B?MDkwbG5Ma3JWcStMZ2ZRQ0dNTUdZNlFQYW5PV3YxcUdQUloxOUJ5aE1FMEVB?=
 =?utf-8?B?U3VrUWxPVXdOYWlsWGlvMHFVZ0FaeEFONFlpVDBZUTRQd3lycm42MWt6R2h2?=
 =?utf-8?B?MjhoU2k2YTMreE1RRUxvSlo5Sm5Hamc3RUY1Qzk0anlNSkN2YnVXYjVseE9P?=
 =?utf-8?B?V0tiRFg5Zk9MKzA3UnJzZzJOajFWRVltb2lDTlJTSDJjSVpWRSsxRWRLV0RQ?=
 =?utf-8?B?YkxRZVhzWm0zVmRoc2xLS09FanF4TE1ZeTdWY05RdGlMa1ZFdEFKcWYxNTdp?=
 =?utf-8?Q?raoQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5400.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba27c68c-eb57-46b6-0ff6-08da6f9c7f6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 06:51:56.9444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tk3NaonREoOiA6FB+za+DKRoSSPcXp+G7YQ/vAb6YtNbAlTruO+aCIL6K8RNdQBS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3243
Received-SPF: softfail client-ip=2a01:111:f400:7e88::609;
 envelope-from=elic@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

SSBmb3VuZCBvdXQgdGhhdCB0aGUgcmVhc29uIHdoeSBJIGNvdWxkIG5vdCBlbmZvcmNlIHRoZSBt
dHUgc3RlbXMgZnJvbSB0aGUgZmFjdCB0aGF0IEkgZGlkIG5vdCBjb25maWd1cmUgbWF4IG10dSBm
b3IgdGhlIG5ldCBkZXZpY2UgKGUuZy4gdGhyb3VnaCBsaWJ2aXJ0IDxtdHUgc2l6ZT0iOTAwMCIv
PikuDQpMaWJ2aXJ0IGRvZXMgbm90IGFsbG93IHRoaXMgY29uZmlndXJhdGlvbiBmb3IgdmRwYSBk
ZXZpY2VzIGFuZCBwcm9iYWJseSBmb3IgYSByZWFzb24uIFRoZSB2ZHBhIGJhY2tlbmQgZHJpdmVy
IGhhcyB0aGUgZnJlZWRvbSB0byBkbyBpdCB1c2luZyBpdHMgY29weSBvZiB2aXJ0aW9fbmV0X2Nv
bmZpZy4NCg0KVGhlIGNvZGUgaW4gcWVtdSB0aGF0IGlzIHJlc3BvbnNpYmxlIHRvIGFsbG93IHRv
IGNvbnNpZGVyIHRoZSBkZXZpY2UgTVRVIHJlc3RyaWN0aW9uIGlzIGhlcmU6DQoNCnN0YXRpYyB2
b2lkIHZpcnRpb19uZXRfZGV2aWNlX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKipl
cnJwKQ0Kew0KICAgIFZpcnRJT0RldmljZSAqdmRldiA9IFZJUlRJT19ERVZJQ0UoZGV2KTsNCiAg
ICBWaXJ0SU9OZXQgKm4gPSBWSVJUSU9fTkVUKGRldik7DQogICAgTmV0Q2xpZW50U3RhdGUgKm5j
Ow0KICAgIGludCBpOw0KDQogICAgaWYgKG4tPm5ldF9jb25mLm10dSkgew0KICAgICAgICBuLT5o
b3N0X2ZlYXR1cmVzIHw9ICgxVUxMIDw8IFZJUlRJT19ORVRfRl9NVFUpOw0KICAgIH0NCg0KVGhl
IGFib3ZlIGNvZGUgY2FuIGJlIGludGVycHJldGVkIGFzIGZvbGxvd3M6DQppZiB0aGUgY29tbWFu
ZCBsaW5lIGFyZ3VtZW50cyBvZiBxZW11IGluZGljYXRlcyB0aGF0IG10dSBzaG91bGQgYmUgbGlt
aXRlZCwgdGhlbiB3ZSB3b3VsZCByZWFkIHRoaXMgbXR1IGxpbWl0YXRpb24gZnJvbSB0aGUgZGV2
aWNlICh0aGF0IGFjdHVhbCB2YWx1ZSBpcyBpZ25vcmVkKS4NCg0KSSB3b3JrZWQgYXJvdW5kIHRo
aXMgbGltaXRhdGlvbiBieSB1bmNvbmRpdGlvbmFsbHkgc2V0dGluZyBWSVJUSU9fTkVUX0ZfTVRV
IGluIHRoZSBob3N0IGZlYXR1cmVzLiBBcyBzYWlkLCBpdCBvbmx5IGluZGljYXRlcyB0aGF0IHdl
IHNob3VsZCByZWFkIHRoZSBhY3R1YWwgbGltaXRhdGlvbiBmb3IgdGhlIGRldmljZS4NCg0KSWYg
dGhpcyBtYWtlcyBzZW5zZSBJIGNhbiBzZW5kIGEgcGF0Y2ggdG8gZml4IHRoaXMuDQo=

