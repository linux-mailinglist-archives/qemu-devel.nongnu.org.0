Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ECE406F99
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 18:25:48 +0200 (CEST)
Received: from localhost ([::1]:43350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOjLW-0007fF-N9
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 12:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOjIy-00067i-Bt
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 12:23:08 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOjIw-0006pp-2S
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 12:23:07 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18AE0BZ1002800; 
 Fri, 10 Sep 2021 16:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ly9AaeuGTfEjnVbfA+rCtKmRRKalwTpn4HlJzYVPVVQ=;
 b=hxwJih7QG9Mtzb3Er2pksHh/Cfm+D+cScib4GAl7CYb7NQF3HUQWWTekhwSL+mIwKPGG
 Gd1/N87zUjh61SeKCao+nPmVkU7PsPWg/Mwfx32zhPW6p52tVP0EVALobEXhs9BKWbvm
 BWkTJMWHxA+e9Rqp8D3qqxen5txeejbTnVvrLVCGiY3fU0GUHaxr91CCUp1Uv1pdZuDs
 wd8lcF4d9AUGuLz+GjDtBqJiAzRbdbJ/C6kU80yq+xNRlJrK4uz8qPkj9wXnXRhlCK1/
 ZWhyafCZHZrs8HHRqVsVoI/MVW56Wn1+4VfpMvpJw1XQVXKgeWICqsXvEr1OeQDj0+QQ pQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ly9AaeuGTfEjnVbfA+rCtKmRRKalwTpn4HlJzYVPVVQ=;
 b=Txiv4Xks4oBE/1qL9qG4MgyZrQAzhKq9oXl7hDYrDxLKmsGIFklYVx/oY7AALEjEABDk
 LT3rGN9DbwTlo4m5hwHA3d1xBsxX+I4X/itqobFm1DXYas3CXkG52a8Fws02YAYKXw6d
 PCqHmTgASb90KKy22X35v0DPmI5kfp9glQ9a0fDboSebMjLWWSnhXamrU29QoJC3gVUT
 gW7mXPO4O0QkNO+rT1EDcqaVtu1qcuQRCUViI/5ZPfwdlmxJp86X5KfjBpIXrEdteq9h
 FniyxAYwjqT4mV5mLigmyE2INVB0fMKOQoE9Y/8vT60GmE0jxVZ1FdQ3bJGodf1gtoZU yw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aytx4tedf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 16:23:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18AGGKe8169888;
 Fri, 10 Sep 2021 16:22:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by aserp3030.oracle.com with ESMTP id 3aytges406-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 16:22:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGqsXlS3ST3f3UWCalabvmg1AoIEb+l6xD9lyObasaI4+ZV1V4oUQUVuswiBkm6D2jHvqvdNE1hOxmReok2VdMPdL+vhR1lcBsrxSs1kidDJRAuezcedCtP7Z2GlaTw0SXccG4DTtdG+RkMExRnSEGuy+upIxkdL6WJZz22TCHBmZWtCeTN3FPfZzWUqsvh8E/xylV+F6YZu1pla0KAeHPwXGZifhPYbj35RS3RqQj6rRO/OQhVVTfdTmtDc6zWZZOL38+EHVV6Qul+2JXQI4M5jsk4tL1sImQK7DfElHM/zh3T9v0IJShem4nM80RwMUiPBEN2Slp7UuAVRmTpeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ly9AaeuGTfEjnVbfA+rCtKmRRKalwTpn4HlJzYVPVVQ=;
 b=Z8Rvw2RLgFbIWYrPdCfBz4P44Xym00WY7GDsrL2107Y2O4WYIvQEZjZYhhfSA4zY+kuhKdGslz57yUxDrAI+UBNch+CgeZpwCeeZk1impCIdQpW6h6pEKlL6nu/KVjkXcFaSn3tk7B7TwMR9xON6dMX977fDaTcfVgjqmX1dba7FwWOZMMcp5RNE1Yt38jfez4397KhnBJ9cyTqfL2r4XgUyt6erajFezokSSoOhq5j4ihIfRoHFr8wNHn6oPv29FgjwkqexPAXkVO3OAd/pKP1f8t8zhNbht2pCUi6L90UgdgPzoif8guILliJ1HDiejPZT4ouyB2LxoFRnZANXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly9AaeuGTfEjnVbfA+rCtKmRRKalwTpn4HlJzYVPVVQ=;
 b=hSYw5WmPoRGtEO2MdisApiXlsg48rRxE0yUs7EDyVqCCvBo1P88EFDqFKH9J9RTeUMDmwYQu5nwIKWX40BUVmITYM3tql+thKSUMTt9AOGHSp9bcyUJewVyaz3XZ1XxMhuxCd7fpDhQTO2LhoHrn19+IKnBiPzD++JlsS8MGXuA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4834.namprd10.prod.outlook.com (2603:10b6:208:307::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 16:22:56 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 16:22:56 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC server v2 06/11] vfio-user: handle PCI config space
 accesses
Thread-Topic: [PATCH RFC server v2 06/11] vfio-user: handle PCI config space
 accesses
Thread-Index: AQHXm2a9Kwm6p36MDkWbCuPeBD6LoaubYW0AgAIn/YA=
Date: Fri, 10 Sep 2021 16:22:56 +0000
Message-ID: <23A4AF68-0D0C-475F-B522-6ADAC0CED2AC@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <5f371fa15eb347317ce9ce56a329a24c713129e0.1630084211.git.jag.raman@oracle.com>
 <YTm3VGiIeRh3+JBs@stefanha-x1.localdomain>
In-Reply-To: <YTm3VGiIeRh3+JBs@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8be41e89-6ac8-463a-9761-08d974773f8a
x-ms-traffictypediagnostic: BLAPR10MB4834:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR10MB48349FBAD77559FED6A44A9290D69@BLAPR10MB4834.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9p1QW4HpRt5c8LzFq7W5RbwHttqpibVRjwNIiSoYZ8GAKh7gwkZts4zosjR9wZEJI6hnNdFR/LyO9rPsQp0TYipXoafEpwBX028GLQvJ8bpESaK+425QjZ7MacLLEtZ+yOPV2HGVFbHnKofn66IqpejL1Ij6BsirhOrvJTHxNhv45Au2rfK1/Ox1PrEM6/sD+oJX95TUftyO3IzAm/GTffZ04A60MUx6mWlWIwTYMAA/2guuQ5FuhLfW9+8PNJnVQ1C3u9Ur6BksyTrPufgvOnvryKKvtZgaaLHofVDeE+gtsE/OiK8rbHy49smWcliLhgFLfUaj+clxhYs1bfPXK1N6b/rt6VLvkhcic3qvNoOu1fxC/ARiROcqb+P4o5jPd6MetoI2KMEsIk9jOIAI/IqFCWPRE3NYN3TZUWI8il6JPD8EeztJGk6/H936yvR0md9VRDE3T3VK8YMwoOMDNYF5yfq95WJVNfdUp5J76UfcI+sSh4eReGHfu0P2ucYY/Fr1q53vOStilH5ZFHUkZuf0KT40RfhyBU+HdfBbHVV0RNrMLjhyc4Isj2Rqgfr13hUaHzdxeglRGPBJHo5Ha4dNj0sLMYm2cf6F1yGh6/nB5Q011elCoQA3Um92Dm+5GTy2FV/RaDeOmS35wJykfKTN0WP+KX7CTPbmjkBy11Y6PO/CgZgCdZzvtz0O704KsrRF99FR6dnExNUxo8j2LIZVB+hHkHj0XECnv+hhCamFMpAt8nnVtr38RGPv53Kq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(376002)(39860400002)(366004)(136003)(5660300002)(33656002)(36756003)(6486002)(66476007)(186003)(71200400001)(8676002)(53546011)(122000001)(6506007)(38100700002)(86362001)(7416002)(6512007)(8936002)(6916009)(2906002)(91956017)(76116006)(2616005)(44832011)(66446008)(83380400001)(478600001)(316002)(66946007)(38070700005)(4326008)(64756008)(54906003)(66556008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUlnd1dveG0wNXN4R2xXZE1NOG5MV2ZwSDVKT2poODV1YUVpdWhQc0ZZcXJZ?=
 =?utf-8?B?MnpKeVpDQkdoZ08vS3Y3a0RiVXJQd3BwK2preHl6WCtQZVhaem5IRUNKRnhj?=
 =?utf-8?B?VXdWOUdRSktQcTJTbmk4bFgrZ2dOaFZoWENBQi9vRnZqS2d4RWtVZGFwcDgw?=
 =?utf-8?B?VTgyRkE0QVE2bnJ1T25UaTBwaUZ2UmFHZmNxWGxwaERtalFEVEQ1bzJUOWNN?=
 =?utf-8?B?bE4ra21mTEl2bDNtdXFwUUxkT3pwMWxHQVByQ0VWa0x6SmU0aHhJMFZxeVZN?=
 =?utf-8?B?d0gwTlZHY2RGTitXeTM1WVV0YXV0TjYwc1hKY09EbVJOSDUzeEo5WlJTR1VX?=
 =?utf-8?B?amJTaXRBUWorbU1zZVcxdWtwR1F5VXdid0I1OE5IdmhoeEpSSjZYWHdldmtB?=
 =?utf-8?B?WFppUHB4YXV4bGlqeTlLMU9mU3NsR2Q3NStKSFVmUnhqR3c5RmpLcExMMCtW?=
 =?utf-8?B?NzR5QXZNWUx3T2luQUsrYlJzNGsya1ZYK21LZ0tMN25sK05rODNPMkI1MEVi?=
 =?utf-8?B?SkxrYTYxdzdPa0lxdU9aZzJUenptUHV1cS9WZHQzUjNMTkMxb1RUSzJiVmpp?=
 =?utf-8?B?UXpiQ29YYkFlYk54UVNQSlpHTDlmd2RmbFV2QzhrWXRhYk1iK1pFalVUSkk4?=
 =?utf-8?B?TlpyUWxvMDZBUVc1Qm1ZRWtaUnVsRUlKWXJEVFhIa1E4c1dxUWVFNG1IMmM1?=
 =?utf-8?B?bW9ETDJPTFJtc3J6VTJoUk5Lb0JvaWNMS2p4UzdTZUJzaXNtc24yaTJRT2Nw?=
 =?utf-8?B?OGFyV0xDaVZSTEM5VkRnbENIckNiMFdmUmRGTWxKSnNjdVhNUzdHMG9aaVRU?=
 =?utf-8?B?cDRnT3kvNWQwbkZmRDhDL3pEaXM3aFpvSzZXdGdicy9FNnVNVHN6WXhjVWtK?=
 =?utf-8?B?S0trQ1hkajR4bG4rZldyMXRHTDFxR0lGMHRYdWh1QU8rRlJiZFZvbXlWcGUr?=
 =?utf-8?B?aDY5WW1XOFZQZTJnNlVYNlN4MGxIRkpEWUliK29jV2tTbDJTbzlXbDVQaEdq?=
 =?utf-8?B?V0tYNkd1MlIxcnNkcU82SzlsazdOcUQ3dHhvVGFYcnFWanBHalFMQlh3bFlS?=
 =?utf-8?B?VzNKT0pRWFZVVkYvK1ZUdEl4WkF1T0VNQ0dNd2FZbEFoK3dVRm10YjIzZGRT?=
 =?utf-8?B?RCt3dHl1SlJOZHNVUE9WZlZ5QnVZZWlmZnBLVkJ4ZkYvY2dUNFhDVUtmWHlB?=
 =?utf-8?B?MWlyMzNyRXIzMUVOMllYNm1WbS9FZHJCT3lLRU9OVnlmS1RyR2NTeFpsTnBE?=
 =?utf-8?B?cjhObExGZWU2ZExiOFZkeFc2OHhkOGNPQUVJRTZDcGdLOTZQYkVncThGUDE1?=
 =?utf-8?B?NjVRVllSUXkrVFQ4ZFpMV29XM3lrdS9EWjBkbFZkL3NWV3lDdnowbXNENkNB?=
 =?utf-8?B?bnJ2ZEZ3YllQYVowNjZnaFV4b0VHN1BORFRaZS9PNllaak1NSUtDS0NsNS9m?=
 =?utf-8?B?YW5pUzVBQ3hvRVpLaEUrVDBMMjQxM2FFTVZPWUVHU2xtbGJ0Y21MWGNabWc1?=
 =?utf-8?B?Q3VuMHR4cXJmUDdZK0RQcU5BUlMveFJFL1pOVEdMOGhBZXBZemo5OFNjd21Q?=
 =?utf-8?B?Y05mVFQ0dDZOUEpTdUFUaW9UckREUTV6RmtGZkUraXlGOVlRV3JSbXhid29X?=
 =?utf-8?B?TDFPNVpNdGlxMGhPSVZ2QmlhN3RMTnc4SzlaOGtyeUdUVnFoL0M1M25RblJ2?=
 =?utf-8?B?eDJ2eHI4dTZhb1VSSnRDWWtidnlhSDJTeU1Teld2dDYzWmN5SnRLZkpqN1ZD?=
 =?utf-8?B?V213enp3Ykp6ZlV4a1UwY2pMZDdMNElWOTV3T0todDk2UEdPM3NLUnByNUty?=
 =?utf-8?Q?VTaMcS1f66z+X2aqkJG90wHOr5EyTKpcNh1BE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8298343B30CFC46AA8C7BEE09997107@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be41e89-6ac8-463a-9761-08d974773f8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 16:22:56.4643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U58Lp7c/ukMX7yoxpNHwARuj4//TarxTChtKsNK9uG7WbIVpbFr7Ef+41hmInMRSu4E7QH14bQK4B3V2C1+llQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4834
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10103
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100095
X-Proofpoint-ORIG-GUID: kxK7jsDVcTT6V1SeCNUVEhuboO_7T-9h
X-Proofpoint-GUID: kxK7jsDVcTT6V1SeCNUVEhuboO_7T-9h
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDksIDIwMjEsIGF0IDM6MjcgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEF1ZyAyNywgMjAyMSBhdCAwMTo1
MzoyNVBNIC0wNDAwLCBKYWdhbm5hdGhhbiBSYW1hbiB3cm90ZToNCj4+ICtzdGF0aWMgc3NpemVf
dCB2ZnVfb2JqZWN0X2NmZ19hY2Nlc3ModmZ1X2N0eF90ICp2ZnVfY3R4LCBjaGFyICogY29uc3Qg
YnVmLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgY291
bnQsIGxvZmZfdCBvZmZzZXQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGJvb2wgaXNfd3JpdGUpDQo+PiArew0KPj4gKyAgICBWZnVPYmplY3QgKm8gPSB2
ZnVfZ2V0X3ByaXZhdGUodmZ1X2N0eCk7DQo+PiArICAgIHVpbnQzMl90IHBjaV9hY2Nlc3Nfd2lk
dGggPSBzaXplb2YodWludDMyX3QpOw0KPj4gKyAgICBzaXplX3QgYnl0ZXMgPSBjb3VudDsNCj4+
ICsgICAgdWludDMyX3QgdmFsID0gMDsNCj4+ICsgICAgY2hhciAqcHRyID0gYnVmOw0KPj4gKyAg
ICBpbnQgbGVuOw0KPj4gKw0KPj4gKyAgICB3aGlsZSAoYnl0ZXMgPiAwKSB7DQo+PiArICAgICAg
ICBsZW4gPSAoYnl0ZXMgPiBwY2lfYWNjZXNzX3dpZHRoKSA/IHBjaV9hY2Nlc3Nfd2lkdGggOiBi
eXRlczsNCj4+ICsgICAgICAgIGlmIChpc193cml0ZSkgew0KPj4gKyAgICAgICAgICAgIG1lbWNw
eSgmdmFsLCBwdHIsIGxlbik7DQo+PiArICAgICAgICAgICAgcGNpX2RlZmF1bHRfd3JpdGVfY29u
ZmlnKFBDSV9ERVZJQ0Uoby0+cGNpX2RldiksDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9mZnNldCwgdmFsLCBsZW4pOw0KPj4gKyAgICAgICAgICAgIHRyYWNlX3Zm
dV9jZmdfd3JpdGUob2Zmc2V0LCB2YWwpOw0KPj4gKyAgICAgICAgfSBlbHNlIHsNCj4+ICsgICAg
ICAgICAgICB2YWwgPSBwY2lfZGVmYXVsdF9yZWFkX2NvbmZpZyhQQ0lfREVWSUNFKG8tPnBjaV9k
ZXYpLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNl
dCwgbGVuKTsNCj4+ICsgICAgICAgICAgICBtZW1jcHkocHRyLCAmdmFsLCBsZW4pOw0KPiANCj4g
cGNpX2RlZmF1bHRfcmVhZF9jb25maWcoKSByZXR1cm5zIGEgaG9zdC1lbmRpYW4gMzItYml0IHZh
bHVlLiBUaGlzIGNvZGUNCj4gbG9va3Mgd3JvbmcgYmVjYXVzZSBpdCBjb3BpZXMgZGlmZmVyZW50
IGJ5dGVzIG9uIGJpZy0gYW5kIGxpdHRsZS1lbmRpYW4NCj4gaG9zdHMuDQoNCknigJlsbCBjb2xs
ZWN0IG1vcmUgZGV0YWlscyBvbiB0aGlzIG9uZSwgdHJ5aW5nIHRvIHdyYXAgbXkgaGVhZCBhcm91
bmQgaXQuDQoNCkNvbmNlcm5pbmcgY29uZmlnIHNwYWNlIHdyaXRlcywgaXQgZG9lc27igJl0IGxv
b2sgbGlrZSB3ZSBuZWVkIHRvDQpwZXJmb3JtIGFueSBjb252ZXJzaW9uIGFzIHRoZSBzdG9yZSBv
cGVyYXRpb24gYXV0b21hdGljYWxseSBoYXBwZW5zDQppbiB0aGUgQ1BV4oCZcyBuYXRpdmUgZm9y
bWF0IHdoZW4gd2UgZG8gc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZzoNClBDSURldmljZS0+
Y29uZmlnW2FkZHJdID0gdmFsOw0KDQpDb25jZXJuaW5nIGNvbmZpZyByZWFkLCBJIG9ic2VydmVk
IHRoYXQgcGNpX2RlZmF1bHRfcmVhZF9jb25maWcoKQ0KcGVyZm9ybXMgbGUzMl90b19jcHUoKSBj
b252ZXJzaW9uLiBNYXkgYmUgd2Ugc2hvdWxkIG5vdCByZWx5IG9uDQppdCBkb2luZyB0aGUgY29u
dmVyc2lvbi4NCg0KPiANCj4+ICsgICAgICAgICAgICB0cmFjZV92ZnVfY2ZnX3JlYWQob2Zmc2V0
LCB2YWwpOw0KPj4gKyAgICAgICAgfQ0KPiANCj4gV2h5IGNhbGwgcGNpX2RlZmF1bHRfcmVhZC93
cml0ZV9jb25maWcoKSBkaXJlY3RseSBpbnN0ZWFkIG9mDQo+IHBjaV9kZXYtPmNvbmZpZ19yZWFk
L3dyaXRlKCk/DQoNClRoYXQgbWFrZXMgc2Vuc2UgLSB3ZSBzaG91bGQgYmUgY2FsbGluZyBwY2lf
ZGV2LT5jb25maWdfcmVhZC93cml0ZSgpLg0KDQpBZnRlciBwZXJmb3JtaW5nIHBjaV9kZXYtPmNv
bmZpZ19yZWFkKCksIEnigJlsbCBjb252ZXJ0IGl0IHRvIHRoZSBDUFXigJlzDQplbmRpYW5uZXNz
IGZvcm1hdCB1c2luZyBsZTMyX3RvX2NwdSgpLiBPbiBiaWctZW5kaWFuIHN5c3RlbXMsDQppdCB3
b3VsZCByZS1vcmRlciB0aGUgYnl0ZXMsIGFuZCBvbiBsaXR0bGUtZW5kaWFuIHN5c3RlbXMgaXQg
d291bGQNCmJlIGEgbm8tb3AuDQoNCi0tDQpKYWc=

