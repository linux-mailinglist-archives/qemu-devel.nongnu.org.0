Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBDC3CEE01
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:00:35 +0200 (CEST)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5aNO-0000To-7a
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1m5aLn-0008C6-3B
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:58:55 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1m5aLk-0001d8-It
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:58:54 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JKoYQR017191; Mon, 19 Jul 2021 20:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=gHHo3T+tDskeXGO7LU1PPdIDnH8e0tecDRq3OH12Jqc=;
 b=rUa1Y/SQogAbcQUeLHAMevVHU2z4U2G6Rd6WURSy6wNVOUDBNpDjFTkpFFHoAX+t6hSK
 iZmlogouZyvb/mnSfacFrvUAFpsEIDYYqtdtwR+Z3ZufKp2FY5J0J3NTGfPGHaFL7LYK
 Dy7nAjUXL78ltStLxozmS5eJL9eRZAsjNxtL9RGj2O4p4JR1Dc+VmfKLgP6iDyP1FNij
 WGpmtAtNUyf/bHvJbZr2vn20jB17anF0ndDEVMW7d58DBsmmTje6iP0htvZXglfEe615
 1GIVuGSulxm1srirUYKQZe+yHYkZGoqS4N720oNxVezPArlolrD82RxTX2COvp6P0pp/ sw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=gHHo3T+tDskeXGO7LU1PPdIDnH8e0tecDRq3OH12Jqc=;
 b=Qtv/69t0A9pYl6kYXZGvitXJqNAnrjwxf0CWXEUzOXqhUclzQqGpIO8nb3kmj7V9Zlj2
 uK3/cPoIqSD3/3WYZ1H5PCXT9NKXHFAKDUNRkO4zrc0aIP+dViKVPsBNdXCDpLmthpUk
 HbVOiANkf6AqSlmtFgb+mk5eaTKw8+rmn9dtnzhL7a+G+jglQYPDx+dlsuwF4d2qLMJC
 5YXhACl84D9csbvbVtvUxidX4n3t7EAG1QFANMBner0DdanRIuFLX3KYfA/xPBy2Aywt
 27a16nJJYucb36fEH7kA9HshYhnMEGPMM9gY+EKLVDX0EGtJfSaHi6n761cZo0/Rwkmo ag== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vrn5jdp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:58:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JKpFM4155764;
 Mon, 19 Jul 2021 20:58:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3030.oracle.com with ESMTP id 39upe90400-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chlfvxZVnj8IPQRCqpQcOPEhHyz6Aypg1mjyxX+eR0k1Qe5hC3oS8ixgcSkId2+ULT5UxSOj/fGJoN8P8GcU3SFbIPDIwysMSdV+yAgFEXQPLqIo993nHdC1cWzxhB6YtsFUDq+smxrqXcHhfG4qwJN3JXxP3x/4uXHt9f7T8HFFUKq47FmtzikQvcqXpUdJ0EqIDjvdYnaK6x59GCb5qPwZbo4G+aIzIrsKpMMynbpbfQqCFdyKkGMowA19Oje+bvOG77jg0tfxOX9lbCrwu5wJzkFORYf31wQbhvGynY1NG6cQdXkCFR4LcO3gg6rCFxDrLYRRGRzU642bVFlH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHHo3T+tDskeXGO7LU1PPdIDnH8e0tecDRq3OH12Jqc=;
 b=Mj+dZd8bycWTOopbRSI6fLQWujNJSnDeLy50kAekiErX8i9NfkaX7QcuHUmmFTTzzfDHkV853ra1QNyft9pNwke9ZyHERf4I+Ny0YEDaokIp2P9DlBtP3U5982mJ1AA7HHJaeG48bDfDROkAlLsqaH5cDGmwY2G9SI+n6wGGoGint71jU6nADxVcxkqKIcNADnFNf5klw+U7L7s+JbM3nwIWyIs4WuDped8UP0JaWqRwGXkLEL9gCMNozcVA3p/wdKBX6uxKxjqO8CVM0MqaVrSab9Oc35zz+eLWQ1KoI6B4ng3q3puqGBMHTBZCUyubBRia4qzxjfJtmSQP4HBJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHHo3T+tDskeXGO7LU1PPdIDnH8e0tecDRq3OH12Jqc=;
 b=CNM/zX9UkS0oY/X3PUC+lbB4GNvVd10s0LzNsHhQZqIFz0PWBAOggAiAwRwSHP5jjnGw7KrlncGD134LST3dBIPVYqMjzwwcsufHJaWxfv+633/TKBQj7MHbpY21+DTtFfErFm+in5OGgjOU7DqaDQwkZPxw/o3M/cWPzzej63o=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by CO1PR10MB4450.namprd10.prod.outlook.com
 (2603:10b6:303:93::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 20:58:44 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::58c6:846d:3bc3:ba3f]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::58c6:846d:3bc3:ba3f%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 20:58:44 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: Question on memory commit during MR finalize()
Thread-Topic: Question on memory commit during MR finalize()
Thread-Index: AQHWF1blDKoce5BcwE+aLVbWV0XOZKiCivmAgAAd6oCAAKsXAIAAEMEAgsN1h+CAAEdvgIABHU1QgAAtSoCABLlmgIAAGMwAgAAi0xSAABDV8IAAEEqAgAAQnYA=
Date: Mon, 19 Jul 2021 20:58:44 +0000
Message-ID: <D22C9D84-EE93-4DA8-99DE-98C46E27809C@oracle.com>
References: <5ed295a3-9e4a-0dca-adc6-5361dc78a83c@redhat.com>
 <20200421104334.GC420399@xz-x1>
 <CH0PR02MB78989C2F77880AA5355037748B129@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPB/8f0pv7mDR310@t490s>
 <CH0PR02MB7898ACD1C68149CE11314EB08B119@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPGVQ0ONUc/qPSNz@t490s>
 <CH0PR02MB7898BB81DCB85237D38E07638BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPWglNqZFegBRZjM@t490s>
 <CH0PR02MB789857DE73B0A9B1FC29593E8BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
 <CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPXZkynODtvXXx6c@t490s>
In-Reply-To: <YPXZkynODtvXXx6c@t490s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aaa69ee5-f8d7-4187-b5e1-08d94af7feca
x-ms-traffictypediagnostic: CO1PR10MB4450:
x-microsoft-antispam-prvs: <CO1PR10MB4450F07ED3925B24A725B867B6E19@CO1PR10MB4450.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5b/h2UuN9WGp4aWhLl5DgzrZ0tpPMCM1voyuILRuYpM9J9dFl2XMP5SsbbAc4V39g6x37kPmYEmPdJPaUpPsNTt9soMQcDeM6n+t6aqk/CWAyqi3xl2V+xkb0Hh/sBRVdB/UfdwDyZQD4LzNC4o6Qxe1avr4iUVx3QdTEw9tO1ZCoK1dnzWNNA5z4yCzqfScaIuiB/bfI+0PJDrPP+II0rXvwc7r0hz9HMHOcKkJqGRcTQW7q9MFGCegW9gI2I/bQ+NTyV+XBcKw/EqXlMNZevREBsuZUqtG7F+Eil19qGC0gL+oiRBAyajPe9pbS6rB9n6n82tfKaBuu0In+NS1Y9L26PifrUZQPkg06qRhujzD4yTr3YcYMvNgDqF6LmgZfL9TOVzkTkA6e3E/lybKO06mjV3iR5TvJgGkXVEwxaxrWHi3lbnnL3WU+z9kWbW3F9/hahJO7rnsKeT+W+Yv+6/SQXfhahBXmdVRf5weSgrpvr/TcuMpJ+Y9b8rOBCw4Kn4VNanupiqUytBHjtNqsU+5t4inl4yF3dumaEeATHtyMc4ZkfHegWjAy2BLoL3UIoiyq+0aZ6W19TbeNbB2/C2619sb/tBx+u91BmAk0Hu4KHwDon34pHfMm4LsSJYVGJzOVfavc/az3BPltRP6xJXnjbwnCucxsKMDFQkQm4aHH9oXW7CTD6p6VlOh1U7WMKNglrqWhNL9Fv9kv98CmJyhuEtSOhfwQ6efDAaIeHw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(376002)(346002)(396003)(4326008)(2616005)(53546011)(86362001)(6506007)(76116006)(91956017)(64756008)(66946007)(6486002)(66446008)(66556008)(4744005)(66476007)(316002)(6916009)(36756003)(2906002)(6512007)(83380400001)(33656002)(8676002)(71200400001)(54906003)(186003)(38100700002)(5660300002)(26005)(478600001)(8936002)(122000001)(45980500001)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTdVRk1yY21GbDJBaGdJbWdNc2t0d0FVTnd0Q0UxVWtBVTBhTXlXRzBUV28r?=
 =?utf-8?B?VENZVVpTcUhCV0RQWFV6UFowMVY3b3lueTZFaEpMVDVYQm1jZGQyUjhQVWVo?=
 =?utf-8?B?KzF3bDhCdGJoTnliUDhrY3lzWnBIeUZCdmRFandDMU1MZTQ5ZG00ZFJOSVVq?=
 =?utf-8?B?S2Y0eHI3RnlVd1ZITllYclBLeWt6Qkl6VXB5UlZXUjQwVDQyS1QrbUIwVkhq?=
 =?utf-8?B?dGdQSXJ0YUdZdU9QZGZHQThnT2lEY3FjbG5URld2aFlnd09yWHpiRXQxNlJR?=
 =?utf-8?B?VHR4ZEVlTGhNZEdiN01WN3V0dm1PTm5SU1RFYUJMV3FtRUZmV1ZVS29uQnA1?=
 =?utf-8?B?S3A2cWtZclY1elB0RnVoQ3RMa2ZuR3dIMjEzUTF5cDA5NXY0Rzh6enFVUm1M?=
 =?utf-8?B?RFl4aTQxNHZyLzczK2ExZ0RMZmQvc3dpQis4VEhtaitNa01mdC90TFlUK0V2?=
 =?utf-8?B?K2FoY2VYeUZQcHhWakJMNE54QngyTS9IeHkzN1hrcE01TzRlN0YreS9nbVVv?=
 =?utf-8?B?bE93Q0Y2S2F0WTZWeHpjMlRLa1U4Y3BXNE5UNEZERHFQU09WS1R4YmRHcDdY?=
 =?utf-8?B?aDZGeUZaMzdEbDN0RnZEeTNtWTF2Z1VEZEdTYkpJRDV3NGllZUdWU1JXUGpt?=
 =?utf-8?B?aHJMOVFwdDdaczRZRjBCd1d5eDJBQ0QrZDZ5c0d6RkZ0bUVaU1N3UWRJWmJ4?=
 =?utf-8?B?a0hJcXFJN2ttK3NtNEViRDdIU3ZwS1VWNzNDNTFTVEd6TnprT0FweDV3ZUov?=
 =?utf-8?B?Wm9VMUdNSmhKaEpldnJuOGJmc0hTY1VlbFkrWGY2MnZtVUlCTnVEYXdyNlVG?=
 =?utf-8?B?dlFiQ1pEY3FhWFNJbUMyNW44cXdrK3IweW1RRHg5ZEhtTUd2bDJMNzNyTkVG?=
 =?utf-8?B?Y2cwUUdld3RwQldDYkJBdHRKZ2JyOExtYkh1ZDZaYlZOMXZnMDlhNEtpdkNX?=
 =?utf-8?B?VlZRcllWTEpVY2szNUZLL09oUk9nNEhjbjhCK0E5Znp4YkxwWXl5VmRJTnpX?=
 =?utf-8?B?UkQ1Z2hwOFFvT0lmRjFvcW83dXM5QmYwNnhYVnpKdnpMYzJYN2xsWExIODlt?=
 =?utf-8?B?bUdhUlFXYjNlTTl1MGhIamhPeXkxWE5lL3V1VFFxN0xzK3FBRTBsS0tYNVhN?=
 =?utf-8?B?VDM5UDFFQXIrZDQ0MmhHMDk1MDVoZXZxTE85VGhqRVJBOUR3WjNyak5xamhG?=
 =?utf-8?B?QVhPZ21CWUtIRmRabGhNVW1TM1JvNGVSRHh5MTNudmZSc1loRDJPWWxyMTlW?=
 =?utf-8?B?UFJIcllWOU5HZTByTkRzVkt2cHJ2NDVnU3BPTzdaL2ZwRHBzbmlMRW5EYVhr?=
 =?utf-8?B?QTMzNDkrOGd3TXljN0dKNnI2NFJJNWJmdktBWjlUUkxoY2FreXJkSU04bUVE?=
 =?utf-8?B?cDNOcTAxTzdzNzdKUm5TUnJuUFV4RHFJNXlBZ1pHTnBOR1Mraktrdi9FekZV?=
 =?utf-8?B?RmdBaXdqVzZpcUJjY0pFeWg1TWk2bTNXRHdRWUtuN1VzNkF1cHR6a1o2Y25M?=
 =?utf-8?B?NVdMKy9za3MydkhxK1FJZzVIQkpabU5oNERCMXk5SUpXSHJ4Y0h4U0xFY1V1?=
 =?utf-8?B?a3c5QkRMRmdhU1Y1ZDBoUWdYWmJWNVdkNzZCMUpHYk9pZDZOdklnS0l5RkNB?=
 =?utf-8?B?RzBucXpudDE0QUEvWDVjQkdTT0VLWm8yQ09DdVBDNDZWa1dBL3RGY0NGRzBJ?=
 =?utf-8?B?YUpTVTEwUVNPRGh5enBoNG16L2NWQ0hjWEF1dzZvejhQT0tWTWo5WlFOSFRS?=
 =?utf-8?Q?Kctzv+yUSwyY51OAqfCXH8XBb+HKxnVHHgmAUq1?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB217C34AAB92044BE0FB3616E1A51A6@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa69ee5-f8d7-4187-b5e1-08d94af7feca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 20:58:44.0981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A34ebOTdKgCaV0FcPkMsxHCkA0lpiddLaGPhzYElaODZCg/poGEiwtWDdulamncc11QKrr8mFVWJ8a9kOflAvO7gA7HmTmXUJYRxn9w81JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4450
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190118
X-Proofpoint-GUID: gcg5br2P4UM_RTiH4DmTYvrLlo_Tyl7j
X-Proofpoint-ORIG-GUID: gcg5br2P4UM_RTiH4DmTYvrLlo_Tyl7j
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 John Levon <john.levon@nutanix.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVsIDE5LCAyMDIxLCBhdCAxMjo1OSBQTSwgUGV0ZXIgWHUgPHBldGVyeEByZWRo
YXQuY29tPiB3cm90ZToNCj4gDQo+IA0KPiBIZXJlIHZmaW9fdXNlcl9zZW5kX3JlY3YoKSBsb29r
cyB0cmlja3kgdG8gbWUgLSBpdCByZWxlYXNlcyB0aGUgYnFsIHdpdGhpbiBhDQo+IG1lbW9yeSB1
cGRhdGUgcHJvY2VkdXJlLCBhbmQgSU1ITyBpdCBuZWVkcyBzb21lIHNlcmlvdXMganVzdGlmaWNh
dGlvbiBvbiB3aHkgaXQNCj4gY2FuIGRvIHNvLiBGb3IgZXhhbXBsZSwgd2hhdCBpZiBtZW1vcnkg
bGF5b3V0IGNoYW5nZWQgd2hlbiB3YWl0aW5nIGZvciB0aGUNCj4gcmVwbHk/ICBBcyBpdCBjYW4g
aGFwcGVuIGluIHBhcmFsbGVsIGlmIHdpdGhvdXQgYnFsLCBhZmFpY3QuDQo+IA0KDQoNCglUaGUg
cmVhc29uIGJxbCBpcyBkcm9wcGVkIGlzIHVzdWFsbHkgdGhlIHRocmVhZCB3aWxsIHNsZWVwIHdh
aXRpbmcNCmZvciBhIHJlcGx5IGZyb20gdGhlIHNlcnZlciwgYW5kIEkgZGlkbid0IHRoaW5rIGl0
IHdhcyBhIGdvb2QgaWRlYSB0byBibG9jaw0KYWxsIHRocmVhZHMgaW4gdGhlIG1lYW50aW1lLiAg
TW9zdCB2ZmlvLXVzZXIgcmVxdWVzdHMgcmVzdWx0IGZyb20gYSBndWVzdA0KYWN0aW9uLCBzbyBq
dXN0IGJsb2NraW5nIHRoZSBzaW5nbGUgQ1BVIHRocmVhZCBmb3IgdGhlIHJlcGx5IGlzIGdvb2Qu
DQoNCglUaGUgdmZpby11c2VyIGNvZGUgZG9lc27igJl0IGRlcGVuZCBvbiB0aGUgbWVtb3J5IGxh
eW91dCBiZWluZyBzdGFibGUsDQppdOKAmXMganVzdCBzZW5kaW5nIHRoZSBsYXlvdXQgdXBkYXRl
cyB0byB0aGUgc2VydmVyLiAgV291bGQgaXQgYmUgYmV0dGVyIHRvDQpzZW5kIG1lbW9yeSB1cGRh
dGVzIGFzeW5jaHJvbm91c2x5LCBhbmQgd2FpdCBmb3IgYWxsIHRoZSByZXBsaWVzIGluIHRoZSBj
b21taXQNCmNhbGxiYWNrPw0KDQoJCQkJCQkJCUpKDQoNCg0K

