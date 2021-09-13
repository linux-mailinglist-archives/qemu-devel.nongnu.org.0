Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31504409AA9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 19:28:08 +0200 (CEST)
Received: from localhost ([::1]:50916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPpkV-0006FD-9w
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 13:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mPpgF-00041j-Lg
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 13:23:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mPpgD-0000ef-7L
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 13:23:43 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DG4GQm007637; 
 Mon, 13 Sep 2021 17:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=XCgVmgwd/vpOjOJyfuvHepy3GRhYPCgKkeuQSUQgue8=;
 b=WVR8vJ1lQ+l06kMXscZOEg+mTAyNTtSOE/olXfAf/QkRkxGnLKE/z4/XLsYY6IjKUPfP
 PGmM3Au1dRbKssNTmG7aHmLdsQCp1vW+tnNl7F1IFeoJwPPNfUWDmInRJ7UizohYGWbw
 RZbex3qdaNOLmTithaqh55OYv0+PbH1SkljyhTSPh6taN9kLhygz08NDrFAIm0QUrOyk
 0LKFBZAIOmAYd1CFffi3nl1JoaUekllVVWUgcXyTgKp/qhDFTTeSy7TV6hGnzGnDNj8Q
 NysBNuaxyfwmz1/iVXa1E9Ajl0e7owzmCchykZDyP+wPNI4Icvq/4gJxugB3qv2kAvdc Nw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=XCgVmgwd/vpOjOJyfuvHepy3GRhYPCgKkeuQSUQgue8=;
 b=iplDiKKHfHFoP8nyK5cT4oAcYRa4G4ptqaoqXYeNC84xenSAwWIU213I58yAxQx3L4K8
 5+45LaTgUp1NQNbMSmvEcZMkKnDb2LFnSmyjWE0FJkz7R68DhBxH9q5eqDnmh68zB10S
 yS1jvqRpFpONSGvYDRIzwCrzsFopBWFxVgD4dgGjTw8y76uJJfV89NqS+3ow747BTBFW
 0GgVP95qLRYHK0yR3GtgBx5CJ2Cx85+r7akYH5Txp/nJijb6uOSwLiO++lSQIP2OmhhU
 ikGrb7j1m4tH9SbzESY4+pZA+29ruw/wetVlRWFt+dH4kg8ADEBAHOP5vpRNEpTYoRCI Tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b1k8sbgrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 17:23:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18DHLNuN117721;
 Mon, 13 Sep 2021 17:23:36 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by userp3030.oracle.com with ESMTP id 3b0hjtt6qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 17:23:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceIKXKHJeWRWTFLA0tIHyJw4GZLo6/yiy4Q1R9+ddfAeyy3rJCgE1JfEdQ8eqgg0Rd5ObC6aRrvvmuikaxZKdkurttVDOUjpBhTXwasK4UGN8rjOoJ2FQAu6CPrJhSf6lavUFxhxofMdbfKA72Nm8PXL8TTKaxCKxCKpoQmKjiFHHbIWC7zRGfPYmd49uj60wFLPsr8+9Sx+YEePjn37eisl3r9R59DQbvfQcsZutK7JFu6UYEXMugN7gVkXI0HLMrojncYUOpjop0bKaujd0ZDYhq5qGlfDGQYK+WMxguAnC73aCS9RHsIp79sofcSZTpnG/sUgG7UFa+B3/Y8R9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=XCgVmgwd/vpOjOJyfuvHepy3GRhYPCgKkeuQSUQgue8=;
 b=g+1HkVcLTJVpVaGazRqOjgV9MXEDuU0CDH6kqNT/cZfkBPJv5oG75WqTQk2xytaLxxflNERWyQYOwVONLP8NnE0un86wy5KI2pMWXtM/CwrEvlT6hMZTOPW4FLweP7/ybG+jvGXXDiia1ZNf2RN67ihOHUKi/06uO/9kCPXi88DxK6koyguKeawkkL02p1LnpoywIzS4DXJGqOLMwbkK3CrcfKgthwjzImWJTF5M0bC/S3RkEXlg/P5t8AQaxeYOH7xbhyu3XLclcgqRdRrEIXmpJEn9QcGAFvpTxnlEqF6mxbH0X5l7oAEZAVz/PwL4N9F8DrpCIG5yM0qvEuqL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCgVmgwd/vpOjOJyfuvHepy3GRhYPCgKkeuQSUQgue8=;
 b=ceKStSuzMgiD3LpYDE2rD2viDvh53XJF42RiWg/c+Sjn6iRNoRZE99Sche6j28gMiKP8d7Q9Mr+uNsIL7oghHNbuLU+IkG7WU0FrqmJioA/6k5RmcPye2LYtLyRzbuAxABA7wC5WM3xYiEyrS5/EU7JV4ZrBurrgMfSmrwsHn1Q=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by CO1PR10MB4804.namprd10.prod.outlook.com
 (2603:10b6:303:94::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 17:23:33 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 17:23:33 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Topic: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Index: AQHXkr3ElMGqWLWPTUyD8mY3/VudXauCv3UAgAixeACADUAUgIACm+QAgAAVpICAAYBwAIAFf7EA
Date: Mon, 13 Sep 2021 17:23:33 +0000
Message-ID: <B1D64D41-DC76-42A2-85C2-85D6DF9D973A@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <YST++FLqV02TlusW@stefanha-x1.localdomain>
 <924FF1F2-E7AF-4044-B5A4-94A2F1504110@oracle.com>
 <YTdnT27fLn4nwp2n@stefanha-x1.localdomain>
 <22CBE2AD-14EB-4162-9E97-FB7D279480AA@oracle.com>
 <YTmpu6BQ8NNrl8gk@stefanha-x1.localdomain>
 <9F0B3728-7F6C-4FBB-BF4C-49F29324F1F5@oracle.com>
In-Reply-To: <9F0B3728-7F6C-4FBB-BF4C-49F29324F1F5@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b44323ee-721e-441a-ff4c-08d976db36c7
x-ms-traffictypediagnostic: CO1PR10MB4804:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR10MB4804D01D5CEEE64E0523BDB0B6D99@CO1PR10MB4804.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: roo0nKyQg3t6ui12if1tib8rgv7H6ez09SZCWDooAXB7NvN5mBTUqA1S7B+gFzi5elU8EL6DYWj1pUiOOS9sH394SvRUevsYPC0y0XU9C4UMwkt5gnADtyCXlzAW70DhjER6rSxUGarQKr/Sm64zUvvZTgIyuI+afMNUo6ceNfWVmiVPI4+l0c72Gpzv3mPFIq5jdP5vG6/+UvlglESUTjpB9xL4vBiN15bwLfxjHCfOG1tVb4AeZcLHfMGGyXjY/ML13zZcLfCLncTP/uLqzRlxT9SjIxxlwh7nmlgp735jVhN+XHXZ7JVKJQCy19FlBbQYJQd/8oc4DVDnXfYKltn85QsyNOzjxZjInUJ10mjqnApwpZlEIrEa7Th/pWPCk4zPXnbbZxIQnUSQhM9w0A+JRIWetot2kjYPHIeQM/kCLTPCjCqae8hMZd8ofmn0IxzxO7nt1kPA4OBU1TEcY1DUQELV2wmoqoSnfVF790YCux4naN+FdH5qGnfVfTywZR2sN+ZE9jLlvGb/hWr3UpK1iEJprJrpW8bK31fccemzqm7tiXlWWDbcd6wcmE9vXSVLnKB27p3BN+T/34qBeIof4/jRcXQOZzPxDwIvjv9TRU9E6IEdY2ku3k4ZuqtzjeQlx2Y9dtsDmq61l2Wrtr25xm4VlN3tUX+h06/4RarwhX/1Vmp3LdeMc9HkA2daFKNBsGBQqRxUgo2KTyzGgR2XBNoXq1ew2CF3XNx/ye7JOs6nqosF6wTaMinoT8Re
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(346002)(366004)(39860400002)(26005)(4326008)(316002)(478600001)(6512007)(186003)(6486002)(54906003)(83380400001)(6506007)(33656002)(76116006)(2906002)(91956017)(86362001)(66446008)(53546011)(66476007)(64756008)(66946007)(66556008)(122000001)(5660300002)(8936002)(38070700005)(8676002)(38100700002)(36756003)(2616005)(71200400001)(6916009)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmNlcmtXMEhjRnRZK3pjdnpTT3JGL0FsYkU4Z3loVlBVbEpIODdwK0dZYitn?=
 =?utf-8?B?R0ZOb3M4a3JkRFc5b0hrUUxCVW5QdUcwRnFKZHZncFRhZ3lCS0lXaHRVbE10?=
 =?utf-8?B?ck01TTBWOUx6V1Z4ODFZUDZTZXFPNGJVQ0VPRE1IWUdGV3hFOXd4ZERXL00x?=
 =?utf-8?B?U0lkbHJ4WUZSOEJhQUU5UmZ0TzhramErZktLVFlBR3plaEZCeFMvaHJXM296?=
 =?utf-8?B?ME1FUk9JTVVTbzZFamZNWHJzdXJSWmJaRm5mYm5ZRTE0WXh0UTYzV0RkcXVl?=
 =?utf-8?B?WnJXWCtseTB0YnZRSGM5ekpYR3phdUY1SFdLKzlSTm9MUkpvcVV6M053Wkp0?=
 =?utf-8?B?b21BcnEzTGtMaDJERnBTcE5QYnMzVEtSV3RyR2ZIc2dJTHhmMzlCQXFETEpX?=
 =?utf-8?B?aXBTczNnaG5xRkY3N3QxL1RtZWZnOTJPeWdQbldXd0tRYzFSYjJQR1RQdGxU?=
 =?utf-8?B?eFMyZTIzRnp3Q2dtMFFxb09xdi9wYUhqdkdWVTl1bktJWG82RHdXdlVEYzBh?=
 =?utf-8?B?Q25JZFc0THJ3VEhDYU9hejFGTC9FNDVaU2lLaWllc01WVGpRWkxEMkFtWVd5?=
 =?utf-8?B?V001V21CTERFUGpYYjJUL3dDSXBLalFmZ29LQy9kWklCc3VqZk9aN0phWVZF?=
 =?utf-8?B?b3V0QzhScXNEN1JOcU1ycm9OaWpuMFdSc3l4Y2hrdTloaEpqbUdGSjliaWVz?=
 =?utf-8?B?c09RM3BMTVhyamIzVlFCbFZHYTNhb2kxdmVhR3NscHRlRjZhOENRL1pzcWZ2?=
 =?utf-8?B?VDRvUTZFVWh1cm5PVFQ1S2U3N2F6UWtuQ1JuM05wVU1IbDZMdVNmdytqeVMy?=
 =?utf-8?B?ZmpNNkhuNUM0Q2JPLytRY0hpVzFmRHlkYmdUOGgrVVB1VUREb0VNRm1ROU53?=
 =?utf-8?B?RzF1VnIxTWRWMDRMQVpPYzRYaEVvdzE2VG1QZWcrMUJaUThjRktZSXFuRDhS?=
 =?utf-8?B?c3VVWHMwVGRFUTZ1YjQzSXc0clhGUnRjakxiK0lDVDlWZmE4ZDlNZG5taVBk?=
 =?utf-8?B?NE9oV2hxTUZEVUJiN2crRkRCcFVBWGUrQmovSXZBNDdSR09FdW9LQ1V2a2hp?=
 =?utf-8?B?T1l5bGY3Y3VWdHBLTmQzTlI0cFZpMnIzb1JYY081ZzhEenJGakJJQm9obFpl?=
 =?utf-8?B?a1o3aFBkQ0VPRnRrUFNnSk95NE8rRzUwbGZJdU91WC9qZ3pleEt5K0J3VGNv?=
 =?utf-8?B?TitaZ21nVVJyVjd0a0ZCQyt2UWg4NDRGQ3pHT1hPTEhCRGJEMnlWUUk5Y2Fy?=
 =?utf-8?B?V05sSkpFNGlEMm0vUHBIamd1MFYrdjZObHJsaUxBaCtDVWpoU251alRFSGsx?=
 =?utf-8?B?NUp2YUROeG5WOEt6aGtIMWw3aTR2aTRlbC9ITi9zVmRUUDIva3VsMEJKWHZR?=
 =?utf-8?B?Vi9MaHovMDRyckd1MkZ1aGdBU3djdDhuY21MNlM4U3FKb3h1bVBXcGdFRjVl?=
 =?utf-8?B?UnovdUZ3ZFh5aStKbUVDR1Jwa1ZwZTd1V1dqQXF2T2RjZlhwQUNkT3h4aHpT?=
 =?utf-8?B?N05JZm81R3RUN3d6VWtVMWNFeFVtcU5BTzFSYkprVHl0RzNnQ0FOSVNFQkpB?=
 =?utf-8?B?dTBhdzZYZ1VLdG82WTJIcnY5elMwNlk4cjlySVcydHdWd0FiMk53VEJwSFJY?=
 =?utf-8?B?MGp2K1dGYXBFUzZqZ2l4ZWdRWFU4eWUzcnQ4KzZwRWJ1V05kdGJuM1FDVmpU?=
 =?utf-8?B?WWt0cWJ3ZEtxMGlZTU5keHd4V1NMUzlMQU94cGorV2k0dHRRWFJTak90WDVE?=
 =?utf-8?Q?HCBEG+sTxpjxxL9D4ptMwJgE2QST9VBr+Us2aSc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7475366F37B2FD40B4980071B32DAE01@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44323ee-721e-441a-ff4c-08d976db36c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 17:23:33.6659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8gjeEwSw97kN/Y79ARDB5pOxDP7hyogcQFLcGnNvQWSbtPCd6AJsg0jc9Gid+bVYDV7+6MTmOD8Dxd0dCJzCj5zv9iLm5CUnWnpuuWpa3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4804
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10106
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109130111
X-Proofpoint-GUID: JbZ7ZxPT-f4jNZ4GmS-QfPO69x111OMY
X-Proofpoint-ORIG-GUID: JbZ7ZxPT-f4jNZ4GmS-QfPO69x111OMY
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IA0KPj4gT24gU2VwIDksIDIwMjEsIGF0IDEwOjI1IFBNLCBKb2huIEpvaG5zb24gPGpvaG4u
Zy5qb2huc29uQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4gDQo+PiANCj4+IA0KPj4+IE9uIFNlcCA4
LCAyMDIxLCBhdCAxMToyOSBQTSwgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29t
PiB3cm90ZToNCj4+PiANCj4+PiBPbiBUaHUsIFNlcCAwOSwgMjAyMSBhdCAwNToxMTo0OUFNICsw
MDAwLCBKb2huIEpvaG5zb24gd3JvdGU6DQo+Pj4+IA0KPj4+PiANCj4+Pj4gCUkgZGlkIGxvb2sg
YXQgY29yb3V0aW5lcywgYnV0IHRoZXkgc2VlbWVkIHRvIHdvcmsgd2hlbiB0aGUgc2VuZGVyDQo+
Pj4+IGlzIHRyaWdnZXJpbmcgdGhlIGNvcm91dGluZSBvbiBzZW5kLCBub3Qgd2hlbiByZXF1ZXN0
IHBhY2tldHMgYXJlIGFycml2aW5nDQo+Pj4+IGFzeW5jaHJvbm91c2x5IHRvIHRoZSBzZW5kcy4N
Cj4+PiANCj4+PiBUaGlzIGNhbiBiZSBkb25lIHdpdGggYSByZWNlaXZlciBjb3JvdXRpbmUuIEl0
cyBqb2IgaXMgdG8gYmUgdGhlIG9ubHkNCj4+PiB0aGluZyB0aGF0IHJlYWRzIHZmaW8tdXNlciBt
ZXNzYWdlcyBmcm9tIHRoZSBzb2NrZXQuIEEgcmVjZWl2ZXINCj4+PiBjb3JvdXRpbmUgcmVhZHMg
bWVzc2FnZXMgZnJvbSB0aGUgc29ja2V0IGFuZCB3YWtlcyB1cCB0aGUgd2FpdGluZw0KPj4+IGNv
cm91dGluZSB0aGF0IHlpZWxkZWQgZnJvbSB2ZmlvX3VzZXJfc2VuZF9yZWN2KCkgb3INCj4+PiB2
ZmlvX3VzZXJfcGNpX3Byb2Nlc3NfcmVxKCkuDQo+Pj4gDQo+Pj4gKEFsdGhvdWdoIHZmaW9fdXNl
cl9wY2lfcHJvY2Vzc19yZXEoKSBjb3VsZCBiZSBjYWxsZWQgZGlyZWN0bHkgZnJvbSB0aGUNCj4+
PiByZWNlaXZlciBjb3JvdXRpbmUsIGl0IHNlZW1zIHNhZmVyIHRvIGhhdmUgYSBzZXBhcmF0ZSBj
b3JvdXRpbmUgdGhhdA0KPj4+IHByb2Nlc3NlcyByZXF1ZXN0cyBzbyB0aGF0IHRoZSByZWNlaXZl
ciBpc24ndCBibG9ja2VkIGluIGNhc2UNCj4+PiB2ZmlvX3VzZXJfcGNpX3Byb2Nlc3NfcmVxKCkg
eWllbGRzIHdoaWxlIHByb2Nlc3NpbmcgYSByZXF1ZXN0LikNCj4+PiANCj4+PiBHb2luZyBiYWNr
IHRvIHdoYXQgeW91IG1lbnRpb25lZCBhYm92ZSwgdGhlIHJlY2VpdmVyIGNvcm91dGluZSBkb2Vz
DQo+Pj4gc29tZXRoaW5nIGxpa2UgdGhpczoNCj4+PiANCj4+PiBpZiBpdCdzIGEgcmVwbHkNCj4+
PiAgICAgcmVwbHkgPSBmaW5kX3JlcGx5KC4uLikNCj4+PiAgICAgcWVtdV9jb3JvdXRpbmVfZW50
ZXIocmVwbHktPmNvKSAvLyBpbnN0ZWFkIG9mIHNpZ25hbGxpbmcgcmVwbHktPmN2DQo+Pj4gZWxz
ZQ0KPj4+ICAgICBRU0lNUExFUV9JTlNFUlRfVEFJTCgmcGVuZGluZ19yZXFzLCByZXF1ZXN0LCBu
ZXh0KTsNCj4+PiAgICAgaWYgKHBlbmRpbmdfcmVxc193YXNfZW1wdHkpIHsNCj4+PiAgICAgICAg
IHFlbXVfY29yb3V0aW5lX2VudGVyKHByb2Nlc3NfcmVxdWVzdF9jbyk7DQo+Pj4gICAgIH0NCj4+
PiANCj4+PiBUaGUgcGVuZGluZ19yZXFzIHF1ZXVlIGhvbGRzIGluY29taW5nIHJlcXVlc3RzIHRo
YXQgdGhlDQo+Pj4gcHJvY2Vzc19yZXF1ZXN0X2NvIGNvcm91dGluZSBwcm9jZXNzZXMuDQo+Pj4g
DQo+PiANCj4+IA0KPj4gCUhvdyBkbyBjb3JvdXRpbmVzIHdvcmsgYWNyb3NzIHRocmVhZHM/ICBU
aGVyZSBjYW4gYmUgbXVsdGlwbGUgdkNQVQ0KPj4gdGhyZWFkcyB3YWl0aW5nIGZvciByZXBsaWVz
LCBhbmQgSSB0aGluayB0aGUgcmVjZWl2ZXIgY29yb3V0aW5lIHdpbGwgYmUNCj4+IHJ1bm5pbmcg
aW4gdGhlIG1haW4gbG9vcCB0aHJlYWQuICBXaGVyZSB3b3VsZCBhIHZDUFUgYmxvY2sgd2FpdGlu
ZyBmb3INCj4+IGEgcmVwbHk/ICBJIHRoaW5rIGNvcm91dGluZV95aWVsZCgpIHJldHVybnMgdG8g
aXRzIGNvcm91dGluZV9lbnRlcigpIGNhbGxlcg0KPiANCj4gDQo+IA0KPiBBIHZDUFUgdGhyZWFk
IGhvbGRpbmcgdGhlIEJRTCBjYW4gaXRlcmF0ZSB0aGUgZXZlbnQgbG9vcCBpZiBpdCBoYXMNCj4g
cmVhY2hlZCBhIHN5bmNocm9ub3VzIHBvaW50IHRoYXQgbmVlZHMgdG8gd2FpdCBmb3IgYSByZXBs
eSBiZWZvcmUNCj4gcmV0dXJuaW5nLiBJIHRoaW5rIHdlIGhhdmUgdGhpcyBzaXR1YXRpb24gd2hl
biBhIE1lbW9yeVJlZ2lvbiBpcw0KPiBhY2Nlc3NlZCBvbiB0aGUgcHJveHkgZGV2aWNlLg0KPiAN
Cj4gRm9yIGV4YW1wbGUsIGJsb2NrL2Jsb2NrLWJhY2tlbmQuYzpibGtfcHJ3KCkga2lja3Mgb2Zm
IGEgY29yb3V0aW5lIGFuZA0KPiB0aGVuIHJ1bnMgdGhlIGV2ZW50IGxvb3AgdW50aWwgdGhlIGNv
cm91dGluZSBmaW5pc2hlczoNCj4gDQo+ICAgQ29yb3V0aW5lICpjbyA9IHFlbXVfY29yb3V0aW5l
X2NyZWF0ZShjb19lbnRyeSwgJnJ3Y28pOw0KPiAgIGJkcnZfY29yb3V0aW5lX2VudGVyKGJsa19i
cyhibGspLCBjbyk7DQo+ICAgQkRSVl9QT0xMX1dISUxFKGJsa19icyhibGspLCByd2NvLnJldCA9
PSBOT1RfRE9ORSk7DQo+IA0KPiBCRFJWX1BPTExfV0hJTEUoKSBib2lscyBkb3duIHRvIGEgbG9v
cCBsaWtlIHRoaXM6DQo+IA0KPiAgIHdoaWxlICgoY29uZCkpIHsNCj4gICAgIGFpb19wb2xsKGN0
eCwgdHJ1ZSk7DQo+ICAgfQ0KPiANCg0KCUkgdGhpbmsgdGhhdCB3b3VsZCBtYWtlIHZDUFVzIHNl
bmRpbmcgcmVxdWVzdHMgYW5kIHRoZQ0KcmVjZWl2ZXIgY29yb3V0aW5lIGFsbCBwb2xsIG9uIHRo
ZSBzYW1lIHNvY2tldC4gIElmIHRoZSDigJx3cm9uZ+KAnQ0Kcm91dGluZSByZWFkcyB0aGUgbWVz
c2FnZSwgSeKAmWQgbmVlZCBhIHNlY29uZCBsZXZlbCBvZiBzeW5jaHJvbml6YXRpb24NCnRvIHBh
c3MgdGhlIG1lc3NhZ2UgdG8gdGhlIOKAnHJpZ2h04oCdIG9uZS4gIGUuZy4sIGlmIHRoZSB2Q1BV
IGNvcm91dGluZQ0KcmVhZHMgYSByZXF1ZXN0LCBpdCBuZWVkcyB0byBwYXNzIGl0IHRvIHRoZSBy
ZWNlaXZlcjsgaWYgdGhlIHJlY2VpdmVyDQpjb3JvdXRpbmUgcmVhZHMgYSByZXBseSwgaXQgbmVl
ZHMgdG8gcGFzcyBpdCB0byBhIHZDUFUuDQoNCglBdm9pZGluZyB0aGlzIGNvbXBsZXhpdHkgaXMg
b25lIG9mIHRoZSByZWFzb25zIEkgd2VudCB3aXRoDQphIHNlcGFyYXRlIHRocmVhZCB0aGF0IG9u
bHkgcmVhZHMgdGhlIHNvY2tldCBvdmVyIHRoZSBtcC1xZW11IG1vZGVsLA0Kd2hpY2ggZG9lcyBo
YXZlIHRoZSBzZW5kZXIgcG9sbCwgYnV0IGRvZXNu4oCZdCBuZWVkIHRvIGhhbmRsZSBpbmNvbWlu
Zw0KcmVxdWVzdHMuDQoNCg0KDQo+IEkgYWxzbyB3YW50IHRvIGNoZWNrIHRoYXQgSSB1bmRlcnN0
YW5kIHRoZSBzY2VuYXJpb3MgaW4gd2hpY2ggdGhlDQo+IHZmaW8tdXNlciBjb21tdW5pY2F0aW9u
IGNvZGUgaXMgdXNlZDoNCj4gDQo+IDEuIHZob3N0LXVzZXItc2VydmVyDQo+IA0KPiBUaGUgdmZp
by11c2VyIGNvbW11bmljYXRpb24gY29kZSBzaG91bGQgcnVuIGluIGEgZ2l2ZW4gQWlvQ29udGV4
dCAoaXQNCj4gd2lsbCBiZSB0aGUgbWFpbiBsb29wIGJ5IGRlZmF1bHQgYnV0IG1heWJlIHRoZSB1
c2VyIHdpbGwgYmUgYWJsZSB0bw0KPiBjb25maWd1cmUgYSBzcGVjaWZpYyBJT1RocmVhZCBpbiB0
aGUgZnV0dXJlKS4NCj4gDQoNCglKYWcgd291bGQga25vdyBtb3JlLCBidXQgSSBiZWxpZXZlIGl0
IHJ1bnMgb2ZmIHRoZSBtYWluIGxvb3AuDQpSdW5uaW5nIGl0IGluIGFuIGlvdGhyZWFkIGRvZXNu
4oCZdCBnYWluIG11Y2gsIHNpbmNlIGl0IG5lZWRzIEJRTCB0bw0KcnVuIHRoZSBkZXZpY2UgZW11
bGF0aW9uIGNvZGUuDQoNCg0KPiAyLiB2Q1BVIHRocmVhZCB2ZmlvLXVzZXIgY2xpZW50cw0KPiAN
Cj4gVGhlIHZmaW8tdXNlciBjb21tdW5pY2F0aW9uIGNvZGUgaXMgY2FsbGVkIGZyb20gdGhlIHZD
UFUgdGhyZWFkIHdoZXJlDQo+IHRoZSBwcm94eSBkZXZpY2UgZXhlY3V0ZXMuIFRoZSBNZW1vcnlS
ZWdpb24tPnJlYWQoKS93cml0ZSgpIGNhbGxiYWNrcw0KPiBhcmUgc3luY2hyb25vdXMsIHNvIHRo
ZSB0aHJlYWQgbmVlZHMgdG8gd2FpdCBmb3IgYSB2ZmlvLXVzZXIgcmVwbHkNCj4gYmVmb3JlIGl0
IGNhbiByZXR1cm4uDQo+IA0KPiBJcyB0aGlzIHdoYXQgeW91IGhhZCBpbiBtaW5kPw0KDQoJVGhl
IGNsaWVudCBpcyBhbHNvIGNhbGxlZCBmcm9tIHRoZSBtYWluIHRocmVhZCAtIHRoZSBHRVRfKg0K
bWVzc2FnZXMgZnJvbSB2ZmlvX3VzZXJfcGNpX3JlYWxpemUoKSBhcyB3ZWxsIGFzIE1BUC9ERU1B
UCBtZXNzYWdlcw0KZnJvbSBndWVzdCBhZGRyZXNzIHNwYWNlIGNoYW5nZSB0cmFuc2FjdGlvbnMu
ICBJdCBpcyBhbHNvIGNhbGxlZCBieQ0KdGhlIG1pZ3JhdGlvbiB0aHJlYWQsIHdoaWNoIGlzIGEg
c2VwYXJhdGUgdGhyZWFkIHRoYXQgZG9lcyBub3QgcnVuDQpob2xkaW5nIEJRTC4NCg0KCQkJCQkJ
CUpKDQoNCg==

