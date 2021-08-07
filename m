Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881FD3E355D
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 14:39:41 +0200 (CEST)
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCLc4-0003We-Hp
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 08:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarths@cadence.com>)
 id 1mCLaE-0002Iu-Ab
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:37:46 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:37166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarths@cadence.com>)
 id 1mCLaA-0008RH-T8
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:37:45 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 177CSh5Y027232
 for <qemu-devel@nongnu.org>; Sat, 7 Aug 2021 05:37:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : subject
 : date : message-id : content-type : mime-version; s=proofpoint;
 bh=TGwfMLj7aOZItjS7jfFngxjnLJjDaCk7hQW8miK4qk8=;
 b=UoCH7qasdm9HFQclyRMGLZ8E0ocudLIltssdK8oyvusjA5wyxDEilEromK4GSqFePZNC
 7uchQuydS94C69roGzc5fHwM0iEyUL6Z4aev/k3lumn5Pm6uJ9Xf7AzEmwZTRFFnbKfK
 GkcKrdf8CAlBfTn8px4NyvYRMWdBnQXKBIUomBkqwySDi3P0nNTsOnvQK5WDIuBDTFJV
 NgMletCT48GqUPyeI1GBIjh/WadDJtxoYNetFT7NcGNGUQ6Yy/MY1Pun6vMZqH7lgOyW
 AGIrTDDdSwJsFsy1xE2KCFHL2TrIn82SueKM+Oh0nt3EsFDzHTKpVXR7aJLSu3UDOVLo hg== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
 by mx0a-0014ca01.pphosted.com with ESMTP id 3a9pr2rc90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 05:37:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/8qkFxT9MQXOxILpcRRdZWL7TBONdyCAIz/Z7xvBJ6kecFbuJTDfqWC5J7TP5e6UVei8QYk0U5wSV/N3RiNSUL3+td/cuDFPbHC/8F7Ub6gMSIOHGbmzFcvz2aZ6k8MTZYmk1Tfg9iuazc43Ay5XJoWH8vY9BAYhZ7jeOFYrRBR5UmXybUu+vRLSutu0SueYz72wmGjQHZs8Dx3Sdq13tDKjo91HjEVI4q/AUAYpwXT/KBbgyGcac6nZfK76sVexOOwUBErs+X3CNNI0Kr7n7e8wrG43CiCoPmgOcTv3x1iNWhMCt5fv4kr4kZ7QV3Vmhde9jm2zFpgo7EWkcwhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGwfMLj7aOZItjS7jfFngxjnLJjDaCk7hQW8miK4qk8=;
 b=fqBvL5aHxnaHmC5fqLsfaMckb4A2tD8MyehwAH/8YKj38sCkUqjF2VJiNBjHfIsdQNs7dA5iDTcJki8lyL07EUMOlMeG8v2kgd6v1hxN+cQsTYRUE/B9Gb03/bkmsaeyFGJLI1rc8+f1Hg8SPQcDSj1TkBm6xyM6bGLTt73Cw1A1T3TFHrc3VK1N4/Ez/Hicz2oAIQZviqMCnmesoYTHHufH7RpgQFnB7mfFM6x78UOkbD2RW9UcoMVlTHvCjnJLUi3ut7oCnVDbAtGrCeiZVtJMb/8+BFI8sec7zjB2lO4Dif2/eomM4K6JLm7Z3Zs5b/fwpfLIqBjT/CJdejsIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGwfMLj7aOZItjS7jfFngxjnLJjDaCk7hQW8miK4qk8=;
 b=Uu2FKn0zSG5AoJHBOz4nZWqv0gU04zOLJEb9q6Tlrw7rYsTDjuBtlSjGwt2LxbZbuYdq8Y4X9onXJ/wcCEvdA6DX84bVXxPjjUnO/6dhkX5syurAgKROCIBq5X5OSUk9gtIEa76DC7ZVTB/+v0H80JM1NjbYbtu5W2mYS36fFlE=
Received: from DM6PR07MB8143.namprd07.prod.outlook.com (2603:10b6:5:20c::12)
 by DM6PR07MB6138.namprd07.prod.outlook.com (2603:10b6:5:17f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Sat, 7 Aug
 2021 12:37:35 +0000
Received: from DM6PR07MB8143.namprd07.prod.outlook.com
 ([fe80::4933:4d0c:f4a7:795f]) by DM6PR07MB8143.namprd07.prod.outlook.com
 ([fe80::4933:4d0c:f4a7:795f%7]) with mapi id 15.20.4394.021; Sat, 7 Aug 2021
 12:37:35 +0000
From: Samarth Saxena <samarths@cadence.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [CXL Volatile MEM]: How to change the CXL persistent memory device to
 a volatile memory
Thread-Topic: [CXL Volatile MEM]: How to change the CXL persistent memory
 device to a volatile memory
Thread-Index: AdeLe0RVgusV3RuRQimBk3Av+mMIaA==
Date: Sat, 7 Aug 2021 12:37:35 +0000
Message-ID: <DM6PR07MB8143B8DC1FDD96EA63B023EADDF49@DM6PR07MB8143.namprd07.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXHNhbWFydGhzXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctM2JjOTRiMDAtZjc3Yy0xMWViLTg1YjYtZTRiOTdhMDFmMmI2XGFtZS10ZXN0XDNiYzk0YjAxLWY3N2MtMTFlYi04NWI2LWU0Yjk3YTAxZjJiNmJvZHkuaHRtbCIgc3o9Ijk4MzYiIHQ9IjEzMjcyODEzNDUyODAwOTQyOSIgaD0iRVF5MGhFbWdOTDc2NWQwMnQ2elkxN2xUYmY0PSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=cadence.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c98be3e-a3d8-44f3-f107-08d959a02284
x-ms-traffictypediagnostic: DM6PR07MB6138:
x-microsoft-antispam-prvs: <DM6PR07MB61385983A71C8DE95F8CB1C1DDF49@DM6PR07MB6138.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FAYmgz+Xr6kv/y9zuSh1vTha0eBkgXJQD/Y3yF9wU9E9Kn3KNq81JkW6Ot+TXp9buDLOPp/XTQM1cUI2Ruk6LkMkg0L7cI7ef1GWtfvtO/8lqGtblUIGfezH521KP3cF8yLwusxOF9faZiWWTXtAtgQqhHkKjILwOfwCW0sg9MTuiOqJSbOamakoFF+JV0q/D0rMiGnSOjRAspgTEqOcf78P6i69bzZQ++2LkCN8PK9/qqhzLkE/OGaoiFQ9YVS7z7thWLQWyvOkcp6boN3NRqn5rmEl5/2MHgLr5M1jNWu8okTtTM/X4/O1hRXXzBHUc64LyKzVoDPzwa7VB5dCt4841s4px+h4PQL/Iq73CtbV/j3DBUDDteabTvbrkqq94Hf/2d00F/m/mKlAalZejNKMv2o39HJVVbhrkYFdkQBmYTgC4OiE5JdzA2NG9L+UnBugxBmD+jMjrV0NtXdnJ10Aj8pSxDjdocvUEYGPqm6ChVkPKsaG7lD9tFXwbdB8+s/f7uKXtpkwCWZ3cql1Nmk3t9MIX5OfqDpYwf9v+Ws1bvd1wjbGJo/O8/M8rfTXGjO2UjOWOY+Np6Ccc72P/C1LmwEDVIFxrZttX4CLbcdESAX/WlIAGt746Sef5lfKcPJHPG5CotDNZQ8KOhLXwRMJZL6nMXYZcwxv1akh+I7e8s63Pc1rYPdYd/fMtpIF0vP/UqnMqGCpBMKt4trTIX5llCZerbzNYfGCfBMqLePDYc2l3/LPENcW+LY5aAlBZ7R9EGJmKJjVckuWpx7Ho/vINlE+IDZRbn8lttX7KddCmhiEylVIBbEQ1tE1Bpvnw/UQjmcw8Qok+P9iNKEBcMAJSmR2e09Y/YlPFjmb3Q8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB8143.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(36092001)(33656002)(122000001)(9686003)(86362001)(55016002)(38070700005)(478600001)(2906002)(38100700002)(66446008)(66946007)(66476007)(66556008)(64756008)(21615005)(316002)(52536014)(7696005)(83380400001)(166002)(9326002)(6916009)(5660300002)(8936002)(8676002)(71200400001)(6506007)(26005)(76116006)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jp0OjWjMSuNDIYYOoHetzwGmR7F+N7+0/l3xzrXwC7v5JQSLRqR362PHQdQQ?=
 =?us-ascii?Q?kB30kwl58wMztNHLg0J+QBcRub0J/4isf35mpB01zPWCOftBCuDgUUl6w87f?=
 =?us-ascii?Q?g6e45EnZu7o4ZhHP9tVnagah7eWZQCAc52CHgoGKEMhBHnZ7R2aB1lhanO7e?=
 =?us-ascii?Q?fRY2Eg4NsGuuW9L639H4j+mD0jvCoRh2rOA//HSMCWVcj7loyE/AHjIFeVyO?=
 =?us-ascii?Q?081iujBuyqQnFzo9lEwigkxwF14lzlvM5rdCMgiHcdE9AnUalz78ss7VHtPb?=
 =?us-ascii?Q?vl2hF8g36ipzQWHurusDgWdIfNd08bnkjtqCLNEfbNlB1NXoF/W6uewTcfsG?=
 =?us-ascii?Q?OOGCdGR84PBS9LXlZU38O9wkCmCQLjMDIRcNeDS854Lpzk24b6UcsOxIujQm?=
 =?us-ascii?Q?umhvr7W8gDqZxq+jUa4qXotx6G86wZMoAyjjL/hKxFk2fPSynPn6KF/tUplW?=
 =?us-ascii?Q?0mdGoKNgoR1v2y7KMsPKjgCT5e6RvsmbANYPnyHg+vkNGa4OasuFXP2t2pDt?=
 =?us-ascii?Q?IzKXhc3QQTKXddS7+7UDrvcz9MoU0EU7CEXxj04CW35vCb/LChnAI0iTZymV?=
 =?us-ascii?Q?VdDq9lecoHYlwczoCTCkpH4t37Bj3N0u7V6JBG2DHO8F5SdVKvjZY2bEIJbV?=
 =?us-ascii?Q?rlBO0jha/wa3cX+np1+p7+pXDsA4ybHAlL1EEBxTtdP1aI/5v4AiaLN3Z0o2?=
 =?us-ascii?Q?w8aU+i1pb9/x2dfi2bmbfsviiS8POxAFmMYz5Qz1ufM7tHopcRDFErrm/8XN?=
 =?us-ascii?Q?Q3PCcInRwMZ9+uGD+7capbXEpk3Ds/f5MrQG3DhOnPBLmC3DzsxxPaVfn70s?=
 =?us-ascii?Q?0BpRWaXDD3b7DswOvnfzzgUUPwMY6FEWKBm6RxCDXj1KSTdukVBfMDaZCusn?=
 =?us-ascii?Q?+ovV2BuzngZOLvT9OB9HPHOGJv4gvSb+JvqklJjGPTd9IvFva1eV4VlFjocK?=
 =?us-ascii?Q?nrLuRTEDDP26QezYUGUmbIU7/ox3fS5vZr5J6FlC3jApL4ho+n4eeWHruquK?=
 =?us-ascii?Q?XNrIjtXEg2o/CwTOlbFioRM3tam8P3F/PY2U4K7ZJyg3je+jn1U9mSu5eDBa?=
 =?us-ascii?Q?ehqsmzH0hPFff7yGwFvaUop14VXvjOgZb7Wnbpmq7X8sl3Ku/HjETnukRHxi?=
 =?us-ascii?Q?R0adQwq02vo53zKZx6GZ2YsVkF+YnKFQB94XEpAiet6SR3jp2tAmJxXB+Wvs?=
 =?us-ascii?Q?2xcr8Zui0QHNCZ00keBhLC2tW2MLEfQE9SlCwFmnYOyzyrZHqGMZX7vPDo0G?=
 =?us-ascii?Q?0RtzgH9dUxlIHgz2hdn1WzLMTeX/jkafLzmeHCPYkoF2nr/X8afoaZdvLRrf?=
 =?us-ascii?Q?nPK2dYDfBLS8ZoiAbpNr3urm?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR07MB8143B8DC1FDD96EA63B023EADDF49DM6PR07MB8143namp_"
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB8143.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c98be3e-a3d8-44f3-f107-08d959a02284
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2021 12:37:35.7536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HKL9zuevfsvxOfLZnZKAdVXLjmrP/54GvC5MnF8c5fJYsSmgzYcVYwSj9HZrP2gw/gZ9qf+kl/OJIgx1fFl61es6Wi85PuJaG04wU+6Ruus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6138
X-Proofpoint-GUID: Y_JALN5mjNfsSX_hfuyM1u_PdaueViOS
X-Proofpoint-ORIG-GUID: Y_JALN5mjNfsSX_hfuyM1u_PdaueViOS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-07_04:2021-08-06,
 2021-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1011 phishscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108070086
Received-SPF: pass client-ip=208.84.65.235; envelope-from=samarths@cadence.com;
 helo=mx0a-0014ca01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_REMOTE_IMAGE=0.01 autolearn=ham autolearn_force=no
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

--_000_DM6PR07MB8143B8DC1FDD96EA63B023EADDF49DM6PR07MB8143namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I am trying to modify the CXL persistent memory device, given at:
               hw/mem/cxl_type3.c
to a volatile memory device.

I tried the following:

  *   In hw/cxl/cxl-mailbox-utils.c:
     *   changed the IDENTIFY_MEMORY_DEVICE mailbox handler to return persi=
stent capacity as 0, and expose entire memory as volatile.
     *   changed the IDENTIFY_MEMORY_DEVICE mailbox handler to indicate the=
 lba_size as 0 in  the payload.
  *   In hw/mem/cxl_type3.c
     *   Changed function get_lsa_size to return 0.
     *   Changed function get_lsa to return 0.
     *   In the ct3_class_init function, changed the ps->class_id from PCI_=
CLASS_STORAGE_EXPRESS to PCI_CLASS_MEMORY_RAM
     *   In the ct3_class_init function, set_bit(DEVICE_CLASS_STORGE,dc->ca=
tegories) was commented
     *   In the setup_cxl_memory function, ensured that the non-volatile fl=
ag is false.

Still, when I boot this setup with Kernel 5.14, I see that the device shows=
 up as a persistent memory in /proc/iomem.

What else needs to be changed in the Qemu device and CXL model to support v=
olatile memory?
Is volatile memory Type 3 cxl device not supported in Qemu?

I use the following command:
../build/qemu-system-x86_64 -M q35,accel=3Dkvm,nvdimm=3Don -m 8192M,slots=
=3D4,maxmem=3D40964M -smp 8,sockets=3D2,cores=3D2,threads=3D2 -hda /lan/dsc=
ratch/singhabh/shradha/ubuntu-20.10-64_with_orig_driver_backup.qcow2 -enabl=
e-kvm -usbdevice tablet -L $VB_ROOT/etc/vm/common/ -object memory-backend-f=
ile,id=3Dcxl-mem1,share=3Don,mem-path=3D$PWD/cxl_type_mem,size=3D512M -obje=
ct memory-backend-file,id=3Dcxl-lsa,share=3Don,mem-path=3D$PWD/cxl_lsa_mem,=
size=3D2M -device "pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52,uid=3D0,len-=
window-base=3D1,window-base[0]=3D0x5c0000000,memdev[0]=3Dcxl-mem1" -device =
cxl-rp,id=3Drp0,bus=3Dcxl.0,addr=3D0.0,chassis=3D0,slot=3D0 -device cxl-typ=
e3,bus=3Drp0,memdev=3Dcxl-mem1,id=3Dcxl-pmem0,size=3D256M,lsa=3Dcxl-lsa

Regards,
[CadenceLogoRed185Regcopy1583174817new51584636989.png]<https://www.cadence.=
com/en_US/home.html>
Samarth Saxena
Sr Principal Software Engineer
T: +911204308300
[UIcorrectsize1583179003.png]<https://www.cadence.com/en_US/home.html>
[16066EmailSignatureFortune100Best2021White92x1271617625037.png]<https://ww=
w.cadence.com/en_US/home/company/careers.html>





--_000_DM6PR07MB8143B8DC1FDD96EA63B023EADDF49DM6PR07MB8143namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1633561574;
	mso-list-type:hybrid;
	mso-list-template-ids:545805946 -2030162366 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to modify the CXL persistent memory devi=
ce, given at:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hw/mem/cxl_type3.c<o:p></o:p></p>
<p class=3D"MsoNormal">to a volatile memory device.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I tried the following:<o:p></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">In hw/cxl/cxl-mailbox-utils.c:<o:p></o:p></li><ul style=3D"margin-top=
:0in" type=3D"circle">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level2 =
lfo1">changed the IDENTIFY_MEMORY_DEVICE mailbox handler to return persiste=
nt capacity as 0, and expose entire memory as volatile.<o:p></o:p></li><li =
class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level2 lfo1=
">changed the IDENTIFY_MEMORY_DEVICE mailbox handler to indicate the lba_si=
ze as 0 in&nbsp; the payload.<o:p></o:p></li></ul>
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">In hw/mem/cxl_type3.c<o:p></o:p></li><ul style=3D"margin-top:0in" typ=
e=3D"circle">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level2 =
lfo1">Changed function get_lsa_size to return 0.<o:p></o:p></li><li class=
=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level2 lfo1">Cha=
nged function get_lsa to return 0.<o:p></o:p></li><li class=3D"MsoListParag=
raph" style=3D"margin-left:0in;mso-list:l0 level2 lfo1">In the ct3_class_in=
it function, changed the ps-&gt;class_id from PCI_CLASS_STORAGE_EXPRESS to =
PCI_CLASS_MEMORY_RAM<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D=
"margin-left:0in;mso-list:l0 level2 lfo1">In the ct3_class_init function, s=
et_bit(DEVICE_CLASS_STORGE,dc-&gt;categories) was commented<o:p></o:p></li>=
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level2 =
lfo1">In the setup_cxl_memory function, ensured that the non-volatile flag =
is false.<o:p></o:p></li></ul>
</ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Still, when I boot this setup with Kernel 5.14, I se=
e that the device shows up as a persistent memory in /proc/iomem.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What else needs to be changed in the Qemu device and=
 CXL model to support volatile memory?<o:p></o:p></p>
<p class=3D"MsoNormal">Is volatile memory Type 3 cxl device not supported i=
n Qemu?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I use the following command:<o:p></o:p></p>
<p class=3D"MsoNormal">../build/qemu-system-x86_64 -M q35,accel=3Dkvm,nvdim=
m=3Don -m 8192M,slots=3D4,maxmem=3D40964M -smp 8,sockets=3D2,cores=3D2,thre=
ads=3D2 -hda /lan/dscratch/singhabh/shradha/ubuntu-20.10-64_with_orig_drive=
r_backup.qcow2 -enable-kvm -usbdevice tablet -L
 $VB_ROOT/etc/vm/common/ -object memory-backend-file,id=3Dcxl-mem1,share=3D=
on,mem-path=3D$PWD/cxl_type_mem,size=3D512M -object memory-backend-file,id=
=3Dcxl-lsa,share=3Don,mem-path=3D$PWD/cxl_lsa_mem,size=3D2M -device &quot;p=
xb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52,uid=3D0,len-window-base=3D1,wind=
ow-base[0]=3D0x5c0000000,memdev[0]=3Dcxl-mem1&quot;
 -device cxl-rp,id=3Drp0,bus=3Dcxl.0,addr=3D0.0,chassis=3D0,slot=3D0 -devic=
e cxl-type3,bus=3Drp0,memdev=3Dcxl-mem1,id=3Dcxl-pmem0,size=3D256M,lsa=3Dcx=
l-lsa<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards, &nbsp;&nbsp;<o:p></o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"15" cellpadding=
=3D"0" width=3D"650" style=3D"width:487.5pt">
<tbody>
<tr>
<td width=3D"107" style=3D"width:80.1pt;padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right;mso-line-h=
eight-alt:0pt">
<a href=3D"https://www.cadence.com/en_US/home.html"><span style=3D"color:bl=
ue;text-decoration:none"><img border=3D"0" width=3D"105" height=3D"63" styl=
e=3D"width:1.0916in;height:.6583in" id=3D"_x0000_i1027" src=3D"https://sign=
atures.cadence.com/cf/signature_fields/5dea7803e8b0ad196001582a/CadenceLogo=
Red185Regcopy1583174817new51584636989.png" alt=3D"CadenceLogoRed185Regcopy1=
583174817new51584636989.png"></span></a><o:p></o:p></p>
</td>
<td width=3D"250" style=3D"width:187.5pt;padding:.75pt .75pt .75pt 3.75pt">
<p class=3D"MsoNormal" style=3D"line-height:10.5pt;mso-line-height-rule:exa=
ctly"><b><span style=3D"font-size:8.5pt;font-family:&quot;Arial&quot;,sans-=
serif">Samarth Saxena&nbsp;<br>
</span></b><span style=3D"font-size:8.5pt;font-family:&quot;Arial&quot;,san=
s-serif">Sr Principal Software Engineer
<br>
T:&nbsp;+911204308300&nbsp; &nbsp; </span><o:p></o:p></p>
</td>
<td width=3D"76" style=3D"width:57.3pt;padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:0pt"><a href=3D"https:/=
/www.cadence.com/en_US/home.html"><span style=3D"color:blue;text-decoration=
:none"><img border=3D"0" width=3D"74" height=3D"63" style=3D"width:.775in;h=
eight:.6583in" id=3D"_x0000_i1026" src=3D"https://signatures.cadence.com/cf=
/signature_fields/5dea7803e8b0ad196001582a/UIcorrectsize1583179003.png" alt=
=3D"UIcorrectsize1583179003.png"></span></a><o:p></o:p></p>
</td>
<td width=3D"48" style=3D"width:36.3pt;padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:0pt"><a href=3D"https:/=
/www.cadence.com/en_US/home/company/careers.html"><span style=3D"color:blue=
;text-decoration:none"><img border=3D"0" width=3D"46" height=3D"63" style=
=3D"width:.4833in;height:.6583in" id=3D"_x0000_i1025" src=3D"https://signat=
ures.cadence.com/cf/signature_fields/5dea7803e8b0ad196001582a/16066EmailSig=
natureFortune100Best2021White92x1271617625037.png" alt=3D"16066EmailSignatu=
reFortune100Best2021White92x1271617625037.png"></span></a><o:p></o:p></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
<br>
<o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR07MB8143B8DC1FDD96EA63B023EADDF49DM6PR07MB8143namp_--

