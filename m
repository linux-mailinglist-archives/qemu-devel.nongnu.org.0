Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9641407046
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 19:11:23 +0200 (CEST)
Received: from localhost ([::1]:47128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOk3e-0006GJ-SA
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 13:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOk0r-0003uQ-OQ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:08:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOk0p-0005dj-7G
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:08:28 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18AGPRck007227; 
 Fri, 10 Sep 2021 17:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=mVEQg032mf4+lcxd8zbu9n5vGqgMSE4TaRUbbM5HjE8=;
 b=iMgNO8DAxk/5xjG8wtQE+0ZfU3AnVfcVzjEjmI9GV+sTn96YzS8LFBuvSkim+bkAGyST
 IPFXCT4XNLq2cALszs6LN8pNuylogvSBpj4NMIIDiE4I2CG5SyWrlMnEsN1v+OSaQ8Ea
 PQSfK82fOpyM80nsE85f9mVBBVw19L5ktAWl1PFMurU0dElN1NjRqDOXbNmypQ/TzSvQ
 2Y0HTKAKmt6rKVBP7SvP0+tlXUysdom8tjFornofb5lzO7HNsBBS11rb9Cv7PcHqHZCi
 eJr7240Pu4COjViMqhq0ryswhcLqPRUtRT/tWT9fYL+cljhw2bSzOp5dVy5zgYFluOho PA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=mVEQg032mf4+lcxd8zbu9n5vGqgMSE4TaRUbbM5HjE8=;
 b=yuW1HfYhSK8gzLSIPXJ6xciDc3TxKmjuZ/NagSNty0z3H9bsL9hJDc3pShNrxdufGqbp
 B2iUOvucf1mv8Bf3jpERkh4IuY2RrAV6TfdXRqfbxGgXGEqVIjg/o/RTSsYc2tUDG9X6
 2rlJ53xODZEyWdmlf7l+JU11Ay2fg58uyzmfl+B0cTj5PEC2xiYHHsXJwYXuVhbs9EwE
 ex+dU3/bMtKe83mIFpzrJMJM5+olHCz+PLHu8wU0/ZosjlDcFV4o+Qm4y9/vxvRC5fzI
 jvgRUTX5Ug9BmSTcjUGM1M5ODEu+QwX+wXFbLxGXZomjBCxd7hdN+Wt5NdnXXR4S5Q5k 2A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ayttbjjw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 17:08:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18AH70jd143310;
 Fri, 10 Sep 2021 17:08:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by userp3020.oracle.com with ESMTP id 3aytfdnf0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 17:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAFNaDk/r3hUTVfQYdaMjPNiKQYw101mRWa+ZmGujJLXC4l54OPSrPcN7cSZlp1RzWMPa148B3r4tyPsvTR4lgNlXcMyimRrExw9vjTYtgKYVKeijV2jh36si6dWy3Ol5wRGWdMo8NA6Xpxu4ToAFEwntFyju8v/WhAS0knaekDQD9B1utyjToDaT9r2vffRJyzeZ1w/XqPHic+Jp+wtwSjJRPVnc1HEW8WrUclqbDee4oyjWQK/jHtBRJpUMDIHDTyULOGhpLVJ0RwXyyK2a8GHCPQqiDdEhsDSghlwAtwboGBC90enUTLLW90/3204Q2uDE/nZHooxKtecRQPVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=mVEQg032mf4+lcxd8zbu9n5vGqgMSE4TaRUbbM5HjE8=;
 b=jxZX52uTZfCd3iZym5IVrGjmcoOrNoJbhhZGPnXtxTQWvKSNjfQQaDup/xUeBF3Y8bUUIwfrmJj3jNMUc5GMhcjiGaPrdDTACDZwpkIv4j+kqQkd/BHfE1eJQ1/tQm+agi4J6PqXhE+9sbxTcY4kL2OO1JmpVljF+n5ttSkUhJQJW8su+xzDkDfNWRIxWzJyq+95qFa6LmrR/Z7JuJk+m8sKZ4e7tntk42oULPZuA5IKbnPL6goQB44eHMI7TriE7eUOQMEe2HJFLHcPJGIjofJqLc6XxmKKYy8GOttZcVUfmCrGXY2lgDnL8TbnF+CktwWRVlbsbDG50IV0mnA3Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVEQg032mf4+lcxd8zbu9n5vGqgMSE4TaRUbbM5HjE8=;
 b=MW3w+y6GsqYzLHy6+aL1+u5lIrbrW7ssUX2/azOVbDH51IEqo6m1YjxNlIhZB3Y3H6TBBxOLPNx4qRZosRX1De+j83wqsClqvenwG+Kme7U4w4XTJGp2mXppUH56KiPfzjEtX60svxfW2njG9ghIDnn38LsQ5np52zg26zqO8m8=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by CH0PR10MB5257.namprd10.prod.outlook.com (2603:10b6:610:df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 17:08:20 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::18f4:28d6:63f1:58e8]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::18f4:28d6:63f1:58e8%5]) with mapi id 15.20.4500.018; Fri, 10 Sep 2021
 17:08:20 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH RFC server v2 01/11] vfio-user: build library
Thread-Topic: [PATCH RFC server v2 01/11] vfio-user: build library
Thread-Index: AQHXm2a73T+62xCt1k2axheiChVl6audd+GAgAAeNwA=
Date: Fri, 10 Sep 2021 17:08:20 +0000
Message-ID: <A81D439C-C462-476F-A258-EB91AA353210@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
 <16c06c73-3b1b-1178-805d-3dceab4d41de@redhat.com>
In-Reply-To: <16c06c73-3b1b-1178-805d-3dceab4d41de@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04e85192-520b-4b41-aa68-08d9747d971e
x-ms-traffictypediagnostic: CH0PR10MB5257:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH0PR10MB525721CA15B232A534FDA2CF90D69@CH0PR10MB5257.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7W4olcak5HW0gQI3KW+MfvrBDabaNhrFdzQa1ZzMf5IccJ+bJQQ2BKzPkt0LuJJjgkGueNgjbxOg/db+HVfxj5/WoT+VKaxrCqtDObHOewhW5EoVDr4McCOdNek6EjcB40em1BjTLNl5vgK8vNaIrkdyCd69erG465exYrCkVBwQD6NK5HwSGVSdtNw0BBP5i5TtjmdlrjrEYGkRC/xKJAIoBtEzr2tZbR6KO3aL/s+RsePfQ4UQtZKnhBv9z6cWbaKhZGdMAeiMMCI2oTIFPJv/lpu1ybDRkY39DSKyh3h8n0eLM14uUIi51ECUaUJrR5Ne7ZHf/wD0ib8Sa9IUd1q7dG4ysiGRK+O5ROBziYPC+SmUpI1YQgoJNKkfgse20HLThLmwIELlbFNRLON+/LXs3NN1rCNYoOjP99PiKr/8ADO1vxcmrvxnshntnqBqFKHJkmvy+JXJ2ltARrHpozDtaobizxBra1fOZ/yG8nVoLTjgrsphaUuMFn3ZUfBYrslTJOEuMJzm2tu3ntIpegq/fAOH8f2uca121yUiL9Wy5idCMNsZKRdPNd3ole3t9Xk7t261FhO1Ij0zNVg23ROsRmi0QjPUuwoWkm12hQCrPOCfw4lHU9AS5ADT78ZGUF5pxMxhcQMCBEO8bWodkWxFiBow7faI9n++YZPJNUM2yzYcXdXheYatViKB3M6Bgxfk3aNowiAThkPpHp0svTRcgeeFSW9QGqnRKxcxRjc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(38070700005)(71200400001)(508600001)(6506007)(53546011)(54906003)(8676002)(6512007)(66946007)(66476007)(6486002)(4326008)(186003)(4744005)(6916009)(76116006)(36756003)(7416002)(122000001)(2616005)(38100700002)(64756008)(66446008)(44832011)(316002)(8936002)(66556008)(91956017)(2906002)(86362001)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUhab1EzYiswcDAzZFRaTmN3dTluRWZ1L0dWZnBLcWdaamdVbGZyY1g2cUd1?=
 =?utf-8?B?QTFqaGxMc3VZSHFQOUZrVUUxdGUydFZlbUJSSzRCaUYwUWNKelZ0TkVuNmxa?=
 =?utf-8?B?TmFhMC8yK0o3Q1FiUTVualZSUEQ5Y0V1UHViVHdJb2I0V1d1TFI2L2x4YzRN?=
 =?utf-8?B?T2pRNkROSi82U1RPZXJRbi94dm9iR0t4V0d4OC9sSFYxQTBQaVNjV2c3bEI5?=
 =?utf-8?B?bmlVNUZpdXZzTXE2VFpzVnEzQ0ZWQ0U3eUZCc0Ftazl1WHNVM3F0bmtiUGxy?=
 =?utf-8?B?K04yRWVoZ0M0ZFVuai8vS0krbHVtV1RUcXhmd3J4eG1nTmFoUHJzVDM2Wkwy?=
 =?utf-8?B?Z2kwZ0NFUlc1TDFMck10NnJNd1lmV0xRT1dXeEhHdnQ0aW9UUVprWnA4TVYx?=
 =?utf-8?B?cE1leTdsdnRLcVoySFFnMjBxbkJwUTQwNW9PcXpkUzZiNlNLZHdSYlk1QldL?=
 =?utf-8?B?Qm12QUw5TVVTY0h1QXBhQksvWHFrMm9RQnlQYzF0bXZ3Wi9xUFNQQ3c4UW9w?=
 =?utf-8?B?RTFuYWxUQWhURW1FL1Y1aGVTUjJ4RVVqdjZ0cm83M3lpd01XUG53VDl3WUhn?=
 =?utf-8?B?N3N1RzJuYVhLc2VXTkZlcFVHWjBPdVNHWERNTytFSU5YblVobHNmL2hjUHg4?=
 =?utf-8?B?T0ZZREtYc2YzUXhEYitQdU5BZ0RKVGpiQ3JxVEhpbDVxejBEWkxDbWFSSGYw?=
 =?utf-8?B?Z1BaZ0FJSDR0R2RVbnQ3ZVZoZ2lqWHdILzRLbGVHcWUyaDN4TVp5cTN4R051?=
 =?utf-8?B?cHZQR3FzTGM4OEJXUXROTTR6dTBKeGt6ZklEMFNaRlJCSS9ET0dsNnQwREZS?=
 =?utf-8?B?VG9VZUYwVmZQeTVTNHRUQVJQREFKWmZOeE1mbFZVaUVxNHBpSFJCc2RDU3Yy?=
 =?utf-8?B?R0R5TWhxa3FkWE83cEVHMDIvOVFlOUx4RUlJTFBrUVRUbEU0bWROeko2NkVQ?=
 =?utf-8?B?bC8wZmMyRzZXODNieDl3eUlPMUlKLzl1RWRubGFVeWFqNUpyYTZIS3pHSnMr?=
 =?utf-8?B?UERZTy83aEtCT0RYM2RxbmFwd1ZEcXVTa0lSR1psaEkwVzYvSEYwdHBPcGpa?=
 =?utf-8?B?MWZjeVIvN3NNQkErNFN2WkIwcEFscFpBWEYydHFRR3REZStiZjlscUtRZy8r?=
 =?utf-8?B?Zk9QQldFOVEwdjc3UytsdXZoZFc1RUVSWklMNTg3MnNvRUxXNktKQzNrU3RI?=
 =?utf-8?B?enV1dDBpWTBQNmV2RnJqeXNrY3VrY3FycFZCc2ZnMzFXU2M3QTEyVytTWk83?=
 =?utf-8?B?bDc2VlpCOWYydmFoa0J1bkY2R2tQZkRNRTluUFVtUmNRcXdmeVhwcHhsT3FY?=
 =?utf-8?B?dGowS2ticy91VWVOOVZ1OVBYQWxmMVA4K3FRdnF3TzFpSDlSSmI4TjR0THhs?=
 =?utf-8?B?R0c0N0VNZ0hUMFFMdmJhR0pLdXU0Q0E4UllEaVFZdncvZ2NmZUoxREVxT0tV?=
 =?utf-8?B?UEpQNEVJZEVjMDJBNGpvcEp5cmZCRVE1Ri9ZWS9GNDV2WkxDczM2NXNRaUha?=
 =?utf-8?B?djFndGpKMm5BUGtMUVRUa1lHQzg0VlJ4RXJnS3doUG5HdnE4ZE1XSTBSQlNJ?=
 =?utf-8?B?WjZnbSt0OGloR0hQWm1UNjRDa3ViU01rU1crejU1dEYyL3BEYkF3OGRjb0wz?=
 =?utf-8?B?Sm8vMmZUMURVWEZxakR1UmZjUDFLSTFFd29ic2E2K2ZSelBiaGh1YVJ1MHVT?=
 =?utf-8?B?dll3RVkzZGJ5MXVtOW9ROUp5T3dvT1hRNTlGSGFreEdxSUJEaXNIZ2IrNVRu?=
 =?utf-8?B?S0hacUVmYVdRRStuVExoc3lzS0JyMTBxTnZ1Z0FBK01wYWlkVldCV29RazhE?=
 =?utf-8?Q?rXgRU4Nk7S/nXMcA7K+NCs98jcggnCdjpZcUs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C224F5619720D4B9B5D5B318F3B3F5F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e85192-520b-4b41-aa68-08d9747d971e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 17:08:20.3389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wl90KCuK/xMB9UqnQvWHSR0ezU3hogdfw5zBSbw7TzT4aTWt1xq6OknHXj8Ka5jKdf/GZ6/imIgj7UHnQFjnrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5257
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10103
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109100100
X-Proofpoint-GUID: u7NR_7XwENjB1xBEERGtRPzvaUERlK1K
X-Proofpoint-ORIG-GUID: u7NR_7XwENjB1xBEERGtRPzvaUERlK1K
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDEwLCAyMDIxLCBhdCAxMToyMCBBTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPHBoaWxtZEByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIDgvMjcvMjEgNzo1MyBQTSwg
SmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiBhZGQgdGhlIGxpYnZmaW8tdXNlciBsaWJyYXJ5
IGFzIGEgc3VibW9kdWxlLiBidWlsZCBpdCBhcyBhIGNtYWtlDQo+PiBzdWJwcm9qZWN0Lg0KPj4g
DQo+PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFj
bGUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29u
QG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJh
bWFuQG9yYWNsZS5jb20+DQo+PiAtLS0NCj4+IGNvbmZpZ3VyZSAgICAgICAgICAgICAgICB8IDEx
ICsrKysrKysrKysrDQo+PiBtZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAyOCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+PiAuZ2l0bW9kdWxlcyAgICAgICAgICAgICAgfCAgMyArKysN
Cj4+IE1BSU5UQUlORVJTICAgICAgICAgICAgICB8ICA3ICsrKysrKysNCj4+IGh3L3JlbW90ZS9t
ZXNvbi5idWlsZCAgICB8ICAyICsrDQo+PiBzdWJwcm9qZWN0cy9saWJ2ZmlvLXVzZXIgfCAgMSAr
DQo+PiA2IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4+IGNyZWF0ZSBtb2RlIDE2
MDAwMCBzdWJwcm9qZWN0cy9saWJ2ZmlvLXVzZXINCj4gDQo+PiBkaWZmIC0tZ2l0IGEvc3VicHJv
amVjdHMvbGlidmZpby11c2VyIGIvc3VicHJvamVjdHMvbGlidmZpby11c2VyDQo+PiBuZXcgZmls
ZSBtb2RlIDE2MDAwMA0KPj4gaW5kZXggMDAwMDAwMC4uNjQ3YzkzNA0KPj4gLS0tIC9kZXYvbnVs
bA0KPj4gKysrIGIvc3VicHJvamVjdHMvbGlidmZpby11c2VyDQo+PiBAQCAtMCwwICsxIEBADQo+
PiArU3VicHJvamVjdCBjb21taXQgNjQ3YzkzNDFkMmUwNjI2NmE3MTBkZGQwNzVmNjljOTVkZDNi
ODQ0Ng0KPj4gDQo+IA0KPiBDb3VsZCB3ZSBwb2ludCB0byBhIHNoYTEgb2YgYSByZWxlYXNlZCB0
YWcgaW5zdGVhZD8NCg0KT0ssIHdpbGwgZG8uDQoNCi0tDQpKYWcNCg0KPiANCg0K

