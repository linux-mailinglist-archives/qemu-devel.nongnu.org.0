Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4924066B9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 07:27:02 +0200 (CEST)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOZ41-0008HO-6Z
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 01:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOZ2R-0006uc-Pe
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:25:23 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOZ2P-0000Ye-Dz
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:25:23 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A4ZKH0029669; 
 Fri, 10 Sep 2021 05:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hvjE8XkWHPJxUO1KSeDvkR8aJaQgMOQq4XzdTnPzHTM=;
 b=le8/nyY0Q8mZPd1nK5Q01GewjxaQWZVofxs2/zrl5vupphuM8lbSPm671lcFY6Qn0K+K
 JYVL/OFNFmoKs0qql/2uwD4TCx+No/UBh9VEy0SFIPnqguN5GcY8MmU895yhKSoQZNu+
 4AIiLgyLQ93rWDjzr9oXsXZ9YW/XsBC4Zs92yOe6/EF3GhQOZr191c6nNvFXKY9BrImS
 pF6Tp4iov2J4B3iNS5I/Xa/COxJkal2/YdeS/LY7JQ8fCuyavE000yfh0VJrZo6msAWo
 A9rfwfeV5Atqqu9frTQHwJ3ruTLG4BTKwxkRMd+KMzNM6hV10jNwrXQFsszvP8Fm24iI NA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=hvjE8XkWHPJxUO1KSeDvkR8aJaQgMOQq4XzdTnPzHTM=;
 b=N133EhPWK9jzXJ/FcRB+mTyH794a/hXwGTEvuv558RdZyC3FsIDssVKZLgtJNggY0CE8
 3lr/QBVPK55bkLCUffLHOsNe1Np7fFDF13Ignq6aR91b7rQ26+1Vj7PC4TBfo38uEx7q
 eRmyiBmTEXdkMrEZZ8dBYCilLn9vVUXhn1OGCBI4hcfL65gzD0wZSthdyLahv2Bkxmcm
 IQWAnHYCKTGBKjHGkgbEdSYL2uOPC7BEyf+kB0zKl54lIlEOduUyJHNe9zYd2L7WGXfd
 6ig+ik/qmcCbZGkA5c4GWu8Zq6dQYF+X2xuA6T1e4aeHs3d2n4ikZPzjvmM/nqjsHBgi KA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aytk8rrbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 05:25:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18A5Ou18098495;
 Fri, 10 Sep 2021 05:25:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by userp3030.oracle.com with ESMTP id 3aytftedxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 05:25:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYuPvxA6BlvHbHor6otagkO8+U0mEyLwIL0PjVvauSLEjx2EDu0hfk4tz2g14COqAq3O28PYwbGBeQfiWX2ZGFo9nCCbPO6nzq1Mfc8W7I+G7q1XrDK10HPMqvDUqXvys8wSgI1V9KVUH1Tc+DgC/2XEa5JbJz3I8T2t6WHOEJ7Eio5zIP93bSy80spGEh77HMxlPuoEV4XoZeLTGj7tN/7RraMHoz2Y2x0zJWDL9bcBBU895HpgTQR/WSSDhTHigM/bD+9XnSNKZ7ncobdj+fL2CPmJhQxzXfC66CsVgas5/arvFx9SN3WdZEdfZeSlU9kc8vSwrY2KcHFZk5OFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hvjE8XkWHPJxUO1KSeDvkR8aJaQgMOQq4XzdTnPzHTM=;
 b=eNtOVDRaOPsXgp5wcc3gMmaBS0qhXa+a7O5Y9YT0MXM2n6MR4jgYa+Q4EZtfczRZgGYTgIIBURA4RaGSul8r6pRN1G9t7NaNk4WmuEG0vkk8+W/3qi3KudoPABtmu4i2eHWVzOBtf42QxENdS1eeM4W/lVZ30cTexPuOYAfaRdZqeEP69TUZPMEOUb6ah2xQiYXLAimeP1+bzRCP/1Bvsypmq1QvFC+4lQn7IdXKwb1dc+h/BoTeSuTJAddpeMcr+3J1EniG0dwjZq0uhyoJzxyl7WORLl04TOok20zg3Vi++xdcGTWwfDNg8L/DHHLwX7XSedCF/1EGsNKfvHveZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvjE8XkWHPJxUO1KSeDvkR8aJaQgMOQq4XzdTnPzHTM=;
 b=zYNY/6MfPWF5i4MY4q5c+RbiysCivpgWdl0FWwqAIXQQSm96OvFy6c4Ifm2cQRzv0Hz2FjoP6vvWaAgrghlwVy0zjcsgW6oAMj42GOOpm2GL3LkLplSH+8ufATUhbr2kTlsxwYkj1WQsgCkMzkmdllmYpHm6q4jJiY7HidBg7ZE=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by CO1PR10MB4562.namprd10.prod.outlook.com
 (2603:10b6:303:93::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 05:25:13 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4500.016; Fri, 10 Sep 2021
 05:25:13 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Topic: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Index: AQHXkr3ElMGqWLWPTUyD8mY3/VudXauCv3UAgAixeACADUAUgIACm+QAgAAVpICAAYBwAA==
Date: Fri, 10 Sep 2021 05:25:13 +0000
Message-ID: <9F0B3728-7F6C-4FBB-BF4C-49F29324F1F5@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <YST++FLqV02TlusW@stefanha-x1.localdomain>
 <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
 <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
 <22CBE2AD-14EB-4162-9E97-FB7D279480AA@oracle.com>
 <YTmpu6BQ8NNrl8gk@stefanha-x1.localdomain>
In-Reply-To: <YTmpu6BQ8NNrl8gk@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05e98aa8-5ab1-46f0-4225-08d9741b5dd7
x-ms-traffictypediagnostic: CO1PR10MB4562:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR10MB45620DCF57FABF60AB78DB93B6D69@CO1PR10MB4562.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T1xETex5bidGjtSy+eyQjR2clIHptc9UPbI00paz0+K60oXCqO6f2SLuWR8zL3ozpE7FYc7HeQTh7K+VodqcqQ/mwCc7SF1HaTpdreNCqBziQanCcNp1+N3LpfCeKk6tfmWQ1gzcfMGPzcs7fngA9XPGSna/P3H+GES1XzgBMJAVWTjfxHW2uM9GHvV7wb8BUEJ2T60PCgBRUuzDoHEs5hCFPLekh6L6Sk1TkF+ZX/VzddIC+clGMMT+hGhO01L2WZ3dooXaGqiTmYBjE5CNSKdxxFOEslcQ6VZKQaaMq1fH7cV8VbSBchkhzjBauGxBGExhTkRL2FO4Gnt6sHCNOztXvdZE0r4oBsAtCLA/htDK4+U2QVLPY3k3471sv8NosBOh8JWM/d7vB7w/4QcFSQuGgNjcz8J6dBP76sXFKt21OOi2iA9dQjEVxpbGq4NZxfQY+uhIk7NXu9HLutDxKRyzzrgTircIilibPvO50tRSAdi+MeUyC70FCENgt3G/fiLx3utSyBCG5DbAhamyomp2gWpRKd1AEhj+/hrEMBv1gmnXOy3frS75gngWYUB4LHRyDV4DSy5mq8Ed0NLB+eJoi0Vidkt9UQO8nlSEMCXhvOcAzbAcUz/Le1O/oPZRcAue+71YKa3Ab6it6yDp27nfaWmEYYWMF2S8vQ354gXNs+ZCbwKFkDzHHgk92TLVdsJR+spcGeU+8stxBmRxq/siBfyHQWDlHxWGxJQ+AtxMM3n8bGa7xJsrAUjG5TJl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(39860400002)(396003)(136003)(346002)(2616005)(6506007)(53546011)(71200400001)(2906002)(26005)(83380400001)(186003)(316002)(36756003)(38070700005)(76116006)(5660300002)(4326008)(8676002)(54906003)(6486002)(6512007)(66476007)(8936002)(33656002)(66446008)(64756008)(66556008)(6916009)(66946007)(478600001)(86362001)(122000001)(38100700002)(91956017)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bBMJwAZbknmp2bHrZflYuVcG5gx1IxQMisEdduQQ7CUsWyZd8fM2ue29m6sG?=
 =?us-ascii?Q?dLlvmsjFYAEb14zJKF1DNboB6ABDBlqmFhFEz/ZrRSDy+3qs1cvYTM9S5pV5?=
 =?us-ascii?Q?2qRlOQmSb2Uo79c91xTQuCEJM5vYgCQRhvy5FijRGce8gbULdSFCjF8oMVqC?=
 =?us-ascii?Q?ozJYi1t09G6azgTmcWgPzaHyIhrYc6796NkmW8Ayc+l2DfEM4MhqkLkP4RQJ?=
 =?us-ascii?Q?xqCyEDu2OMCo8rRhgujUY8HIZ9s9NlkunR7l/zSmQnW+U8vdkxzMj7WVuzFB?=
 =?us-ascii?Q?WBrgn3oXZ04AB5yJDGgNymwPX4uL48eKtd+/VwgsfsJBOaBEfjvz2WSjaNq5?=
 =?us-ascii?Q?/Yqs48pmnEFfHfwY1FFWNBc9FMVlzlt87f5NuQCt6FqCbn7j3UdDnmqyKr1i?=
 =?us-ascii?Q?J7k3oaEAJnSiZX2O78ymDaEMMmzuvIrYDCewDMrsUbSpRSJqri6MaftZWr7g?=
 =?us-ascii?Q?0TTPH8pH4c9WPi0hqlOeZxESSR+NEdMvh4Ceu+5hnDOgyFR6dWvWW5Pk6WZz?=
 =?us-ascii?Q?EMpyfATTgpiUNMDiHT7WjsQtylJEirULfQn1K82ifmzYkZnfR0S1XZ011BCu?=
 =?us-ascii?Q?FFrux/L6xHxmnEGC0U01RISB6uOmhi4TvICli3YGUmkpSeEbunz8yfGlfKqH?=
 =?us-ascii?Q?jKPzpJyeX6ML6kb60xmRfUZpdtSLzkfzk0WdrdCkyVtzLMxmW2IUUk0Y0lZ8?=
 =?us-ascii?Q?7bbMkqvSE/S3FS/fzmJ0X6ItPP23qG9v5FkMuBaqHBvh9jD+aLMx4du8nI90?=
 =?us-ascii?Q?iZF2i/D+xMbnO/7nD+Te1ZO/duveWuM/sQGZAZtqVyw6BrCyfwPkc7d8ZooI?=
 =?us-ascii?Q?NxLxfxKJnd6mBHNz4ktjgxw9U/z1jbQC/NrnSdK9pim1ZPqIouBuLUZB07m5?=
 =?us-ascii?Q?7hSjP/F7UqP6rxDqWGmNAwkhQwN0Sg8BxjIeDA03nRkhuDFP9+EV6BrvXduK?=
 =?us-ascii?Q?IMiNql8MG4rfwb2484qMa7nYPOmqcvLdwO1nwbEWA309LKvffilSQ7gi62aV?=
 =?us-ascii?Q?Z3F87RDe9bKPON4qMDJZZAKa7G1RikprkPvnvf/jrbLKZPQfAupB6TUEITWr?=
 =?us-ascii?Q?vaEx08r9vX4sPmnoDClobvmQwGcay8pe5bQKY+gn5aR7MbYD+qxsxaMCjDma?=
 =?us-ascii?Q?E6yFpdM0y2971gyjXYsFsen5kGOR9X4duDzb+XHCRq9lghifLuQuxbN7UJXX?=
 =?us-ascii?Q?1WvrfqDfLTna122IQ7xqQ/k/5lN7BOKR5cMRvi0ZCTPZn275TKD9Ct7314Ja?=
 =?us-ascii?Q?uakfZ87KijxGv8/c7XvBc4llYYpdp8//iqwL2hIhoiqzh4d8QiyEvyIxbch3?=
 =?us-ascii?Q?Sz8yfh8T08whzUp/9wW27ahf?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46CC4CEB22F09D428B5B35C93E9E567D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e98aa8-5ab1-46f0-4225-08d9741b5dd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 05:25:13.5913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4M9DJATUfjGSPH4fc0Tz4kv7YP4jSKquwQKG7C/8X+/xtmln2nmmpi16hFW2xT9ftQtlKbu6pfY5R7XU2R/xBfIrT83yZl1tOX/lXphM7Jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4562
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10102
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109100031
X-Proofpoint-GUID: xoqIP-98ql3CDU2lDjle-fX5tvI_TsaK
X-Proofpoint-ORIG-GUID: xoqIP-98ql3CDU2lDjle-fX5tvI_TsaK
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 8, 2021, at 11:29 PM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Thu, Sep 09, 2021 at 05:11:49AM +0000, John Johnson wrote:
>>=20
>>=20
>> 	I did look at coroutines, but they seemed to work when the sender
>> is triggering the coroutine on send, not when request packets are arrivi=
ng
>> asynchronously to the sends.
>=20
> This can be done with a receiver coroutine. Its job is to be the only
> thing that reads vfio-user messages from the socket. A receiver
> coroutine reads messages from the socket and wakes up the waiting
> coroutine that yielded from vfio_user_send_recv() or
> vfio_user_pci_process_req().
>=20
> (Although vfio_user_pci_process_req() could be called directly from the
> receiver coroutine, it seems safer to have a separate coroutine that
> processes requests so that the receiver isn't blocked in case
> vfio_user_pci_process_req() yields while processing a request.)
>=20
> Going back to what you mentioned above, the receiver coroutine does
> something like this:
>=20
>  if it's a reply
>      reply =3D find_reply(...)
>      qemu_coroutine_enter(reply->co) // instead of signalling reply->cv
>  else
>      QSIMPLEQ_INSERT_TAIL(&pending_reqs, request, next);
>      if (pending_reqs_was_empty) {
>          qemu_coroutine_enter(process_request_co);
>      }
>=20
> The pending_reqs queue holds incoming requests that the
> process_request_co coroutine processes.
>=20


	How do coroutines work across threads?  There can be multiple vCPU
threads waiting for replies, and I think the receiver coroutine will be
running in the main loop thread.  Where would a vCPU block waiting for
a reply?  I think coroutine_yield() returns to its coroutine_enter() caller=
.

							JJ



