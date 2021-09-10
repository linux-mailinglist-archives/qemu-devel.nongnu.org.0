Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222D0406717
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 08:09:25 +0200 (CEST)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOZj1-000139-Ma
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 02:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOZhp-0000AK-Gt
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:08:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOZhk-0003xy-4K
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:08:09 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A5PwhK013678; 
 Fri, 10 Sep 2021 06:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=GCQ49Z/Se7+bslYAZqt0D5x+Vy6zeOdF7mnH4E9oFd0=;
 b=uW4WRMGbkoXfJ6JcN6YQdpHfS416Ppf5RiVw5l9swWMcgS0RRW2TWH1cYtNoXwMV/WIc
 OkmJIcBNiMGtz7Hs6TsjzQti4xg8f2eGvXt1yYgNcQ0L8F2WCj/CN/6+Xo5/IIokjVuT
 W/PPDoZWKEvFBeIvr320zNYb7lAK7W47Sup5SO6rwtmAoQtGEuJg/lvHIJtfAT9Qs7rV
 clrh5fFEjNpdLg05eit8UicPXMKHvrxbDoiUc4K3PqJdnwAhjiV8w9dqdzPDyEd+IEdM
 B+jD4c6lTAsmzStvlK9MLdBz0koGtiHfQRuHB46t9gXVPYF+WwCdSZyRiENeiET44/2Y Bw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=GCQ49Z/Se7+bslYAZqt0D5x+Vy6zeOdF7mnH4E9oFd0=;
 b=Y0OIUkN9fGOFkKBklZzOOhzf16m5Ej7LUtPuH2mpifkFu0a1XRLtB61l9Yag19CkH1gu
 XzbHhCkmn8EmbXuWSCd1dPZIAxUCl1IqooqLfLuR6NvFFdc0U8TyMPsaZm1Mg/kE/Dii
 JsC/0LDWC+m2/BWT2ZCOu8OAUO7+TLme+7SrEOF6VCeF3ARlXTKT1VS7M9aN4h/EuqrG
 Z4d5tQYmjfI7NCPo1ZNdQ5Hkwak9WLvvRxAxJdo+lbDiBE2loI4G1PVX0Pb9bEkSVut+
 woewssRKaLx/ZUVK+mlN2kQOdhfw0+W484hbTOmz3K5nIVBVCfoOgBWwo+f7x54FAFU+ FQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ayty48t4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 06:08:01 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18A64vDO114444;
 Fri, 10 Sep 2021 06:08:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by userp3020.oracle.com with ESMTP id 3aytfcyrwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 06:07:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ni9X3GK+1VkLBUCn8bhiOesI+SAEvtMcrnqB3Rw9GXyPexEPw5P/3HKcL1SciDV3HPzK/ou1aPD+Q2ACG43njGldllfemMrdFmpVLQ3PaeUzXcopasKnPp+TYUdeJ2zStHE744/FsdWtN0wr5P6JH5yGp+XFigy/Xqg/7WCum/NLP5q6GAhu4AX1xb95JFuJaac4fRCx4/Nx4OlsbrIU8bWPkHwOk2HnXVHMCEBEoSJAw5iRzLBE+btIxUUXA3kS9hHntpN4xqowectuNGt9KgElWBD0Le3OpOJEVxJNdiPGBqmlrXLGWTmG5fjkmfJdhs6Y6XSnxLtB+iuIPYoYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GCQ49Z/Se7+bslYAZqt0D5x+Vy6zeOdF7mnH4E9oFd0=;
 b=Yr1RL7KXg08jhdOLcYh6cv8arkY/pOLJcSQ4a32cBMC95r7AeMtR1X4eSLST3PwNybamc4+1E0VwKpiGPbzdQZzbFbe/ssZIBlQPjwbLwQXZJJGT1ySklJRaxTZMHqfgPBF/ZExp+k7OjVu8l5N1buWvyhpJ8p50zSQRdWP03O62gxtMmpLGund3kjjNkyTYMQxf48hb+Iz9rK0du+9tGDDvuhLUZOeEgGWxglj7dOhLQCoz9Xul8I0radng0UhwY/in8nYsjNktGxoMhVy3JPHfN0IDvJZB8+SQAyImOtT+JqAZdXj3DSvJl3hGsvXbv1zk8NR81wYuMIxXuYEISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCQ49Z/Se7+bslYAZqt0D5x+Vy6zeOdF7mnH4E9oFd0=;
 b=DMiR7rZ0nwwt/oNmZRblpqnKa4Nskw2F6omCbCZ/7CF6eLlmc1VQz786vWyVV7g4uUmBYaqvxbaRV8PgT4pOlzzex/eCmdsOQzDluoNmrCThZG/qjDOAT+khmY1b93Y6KkBd/IwA2BSk1a6oGTtP7ke7wWKMe5KMdMBW3TxeXdI=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by CO6PR10MB5635.namprd10.prod.outlook.com
 (2603:10b6:303:14a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Fri, 10 Sep
 2021 06:07:56 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4500.016; Fri, 10 Sep 2021
 06:07:56 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH RFC v2 09/16] vfio-user: region read/write
Thread-Topic: [PATCH RFC v2 09/16] vfio-user: region read/write
Thread-Index: AQHXkr3G9jy/LCtCcUyvtTrQze2laquY9OiAgAJloACAAGXWgIABLosA
Date: Fri, 10 Sep 2021 06:07:56 +0000
Message-ID: <7B09AE7B-829E-462B-BCD8-8570CC343B47@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <92fb16181e71a1c4049f9995294dbd7ff4270627.1629131628.git.elena.ufimtseva@oracle.com>
 <YTegRT0DPt50h8VU@movementarian.org>
 <A82F2970-293D-4455-8C92-2C9E58C3E626@oracle.com>
 <YTn4cHE0TRnhwQeJ@movementarian.org>
In-Reply-To: <YTn4cHE0TRnhwQeJ@movementarian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: nutanix.com; dkim=none (message not signed)
 header.d=none;nutanix.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 910328c7-f847-4d95-b548-08d974215574
x-ms-traffictypediagnostic: CO6PR10MB5635:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR10MB563562D693EBA82265F1041CB6D69@CO6PR10MB5635.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qL1iHjXpgTFlCeIeebRrwwiBwy5nBPSkDNliN6Jlz9k/LVK1HJauXpxt6RAsWvD1znCucU1ckpkPH+Y1qbAYHajtCWcgBPKWwH8nlcq+SJxtfH17oOkvSJrZ+Ih8zyVE9kPBQoK6QgVb84Lx4LVI6mv3W9UXxtjLABrUX7BozMvMrd434FGcc0pKkNfzCv7aXDjJ7p1Jb79Z2dIpf1mzDitaulbnmg2aIqZ3MJDD7sdbynb/7O58umzalbFvW35zjLawZYkP2EgGpnzcmG12ABZWc1v5eQmyuG14EHUAXYRP5uEWDiBYd7Oqxvp9yutRaNL4MQOfaUd9PVdllJq+v1dioK+YVVgKD3JKvP+ZUqJ/XmciFyJ72/OgGB01JlSjt9dXbiZSwZi631oYLd1xHUBqRGs/qYNzRrx/LBnNYDLX4nig0EiCW6dCQI/eO8c+gGvtRvGy+akav13HXXR0UJWFhrrasJONSR5tazyk+aLtJN1Jp2k9GpMpLdXqSWlSMG0okE+6niW/q+RQCwuQNwpNAEHHIhgduc+h+lha1ntpeg6C2UfeAj4F5B82vd6VUU6HneYhKdZF0qZUU7P241Fp1OMWxEZwJuwPAgxUfaDP1lfaDTN9QaWigjicYzlZniJX1i/LCKM+t+GDmEL7jrL46RXUaSdIdg9BJsrObT20TqNm0swhQLJwf4EIA6HtFcTx5BQwQqPgdrpXLgHVbAkQ5TmKqOe6zmn8hIXjNPnoyEIInvLCpZkxs+aGLTk+d9fEhimUZgXWSxdBUh3Ff4IvOAEouWKiysoMf77xsIbm2Jb5yE+t7zPeHP0QG8afJpne6TY6uruEMT9Zby4WHArMCfHHwDV0houaGtYuyZw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(376002)(136003)(346002)(86362001)(53546011)(966005)(8936002)(6506007)(2616005)(4326008)(8676002)(186003)(26005)(6916009)(36756003)(33656002)(83380400001)(54906003)(71200400001)(6512007)(2906002)(296002)(6486002)(316002)(66556008)(66446008)(122000001)(478600001)(38100700002)(38070700005)(66946007)(5660300002)(64756008)(76116006)(91956017)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGpWOE5uMmR3eWJrKzV3NzRUTkdnYkxQaVhoakYycXpGcVJTRDh0Yy9RdDRv?=
 =?utf-8?B?WDJyVFJEalV2ZklBc2dMQWFmbTI3UzM0cStjckN2YlMxNURSd1JHWktHWno4?=
 =?utf-8?B?QkFzK2FWS2VNR1NnZmV5Qmk4d1NLWGpIc1dZcFhVM3lUT2Z4c0FHcTl2WVZh?=
 =?utf-8?B?RmpGU1JjRGVhWUNMeTJKQUV5eGwrZE91dXFuOWdtVS8zclF0OGRaMEd2bytO?=
 =?utf-8?B?aVREYzY4eUdhYmd2UGxYcENGdENNZGZKTmVxOVZabDJoMDFTYStuS25QTFhH?=
 =?utf-8?B?NU9aYVptT0pleXg2OHFWaEszbjhvcjRZd3JTOXFoajUyV3dlbHZqNDkxa3do?=
 =?utf-8?B?NExMN0NtYWQ2bTJjei8wUzBYNEhjbFlYT09JU3NhOEF5RmVpbVF1bDc3MjZB?=
 =?utf-8?B?azVJTVduVlN5UW51SzRwU2JqVzJQbG1sMDZIc1gzSlhFMDlmRGdncjRHSVNF?=
 =?utf-8?B?ZUowQWlYblpDODFHQTdEK2xuTDVrRC81ZnNrVWVWMFpsUXVkdGgrWjJIcHNE?=
 =?utf-8?B?a3JwdXcvTTgvcE0rRHBGektIdXgzRWl6MDFaTnRtK2kwKzVqajBYcG5yU1Rj?=
 =?utf-8?B?Lzl0dUpJazk5akRvVVVUbXViMzRyOWRLN3p4YVNiWXJyNWRrSDFMRDNCcWh1?=
 =?utf-8?B?RGF5RkVmMEM5bGNGbmF4c1liQlNCM1BYSHFFVFQza2QrQSsxcGdGZ05lalk2?=
 =?utf-8?B?MFhQVnhmQ1Q3Y3ByN2ExZ2JpWENuSGRUTnZaNkZkajZ4UXhSNUlseXpkNGFs?=
 =?utf-8?B?NG9kU0VaRGljcFA4YWRFZXBucWxjU0RidmM2WG40eTE0WmoyYm5xM1FtbDU1?=
 =?utf-8?B?aWRqalR2ajZ1Tk5ReGdjMTlQVnl5UDJpVG5KNzFZZWI0UXgrZ3ZndHVhS2lF?=
 =?utf-8?B?dUdKTllTSW04VWlwZVg3QUxmeE1Gei9NZFE3ckY5Zi96RWJlaU9HZjFnZkI2?=
 =?utf-8?B?c3VjWGM1WDVEN1lQVUJBMzZMRGg4SUU0RCtucDFIY1Voa1Q1UE0yWHJORWpQ?=
 =?utf-8?B?c0RRcEZxUGdVc1NpbS8zQWxrTHVIQjBaT0o3di9aVFUrLzR6UThBNXBadGFE?=
 =?utf-8?B?Yi9oRDZROWxYeS9zWVA3NDVhQkJOMWJiN05tMWZFTEh5bWpPeHQ4dXhKNkxv?=
 =?utf-8?B?MEZ1V3pGRHFUYmNWWlM2QmxwenUxamIyZEpEaXdXNEsyL1gvRk42TzBIWjBW?=
 =?utf-8?B?NiszeEVBYXZBNUhZTTNwNHEzc2ZQN0FTaEtpVlFzRkxPWjd1V0RaZWxXR2tj?=
 =?utf-8?B?bm15MXNWZ1F2b2x3WTlTd1FwVGtTcmJOa3ozdXRTKzFXRzhiYzg5ZzVzdFdQ?=
 =?utf-8?B?ZkIyUTFBaHBoeFgwc3orOWsrV0tuVzFrOTFETzUxY2pHcFNnaDVnNWM1cFhN?=
 =?utf-8?B?T1BBQ2VMcExIdGlFSkJRQTRyck1zaUxnUU9YdDdVNE44Z0NaSXZFenQ0amRo?=
 =?utf-8?B?ODVFV1NpZURLN2NWQnZOUlM5ajcyNnZuWTY5MFYwUGVlZXFlZlk2ZCtLUXQr?=
 =?utf-8?B?Vk5adjNMR2tzZjdvcml0ZUlXZXBZS3dnUFl2Mk5lS1NESVpMalBvMld4OHZj?=
 =?utf-8?B?SE1JM0s0bVptMDZlZkhjOUlEeENqNlE0R1FtSkp6TkQ5YVJVVWJwMHhwZzdR?=
 =?utf-8?B?ZUxJb2dqMDhSVFpFM0Q2MG4xeEprYmcvNEVra1MyVkNVUE5sNFV0U0lGMmhL?=
 =?utf-8?B?TnB6NW5zZ3FKV09kUU8yNFhTTHBPTzk0SU5CbFJEKzFiOHEvMGxBNm9XaGR6?=
 =?utf-8?Q?I3abYLZui8opAU1VyFTD1dxGmPptcV8oiPCeYh5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EE609C81DB0D14CB28305DAEAC806E8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910328c7-f847-4d95-b548-08d974215574
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 06:07:56.5181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Ad6otp4HZztKN6S7Y8oOb8+Q4F7RkAHDslWbrHguCnAhtS4fp3HpeCxeFQO4GxKmD1exVkXV4tKogbnIlmxaEEIJjubUWifdZu5TG3qSz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5635
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10102
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109100037
X-Proofpoint-ORIG-GUID: Pb1UMjbi7dXo9JtJcqSUAJvoT-GD9fhV
X-Proofpoint-GUID: Pb1UMjbi7dXo9JtJcqSUAJvoT-GD9fhV
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDksIDIwMjEsIGF0IDU6MDUgQU0sIEpvaG4gTGV2b24gPGpvaG4ubGV2b25A
bnV0YW5peC5jb20+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBTZXAgMDksIDIwMjEgYXQgMDY6MDA6
MzZBTSArMDAwMCwgSm9obiBKb2huc29uIHdyb3RlOg0KPiANCj4+PiBPbiBTZXAgNywgMjAyMSwg
YXQgMTA6MjQgQU0sIEpvaG4gTGV2b24gPGpvaG4ubGV2b25AbnV0YW5peC5jb20+IHdyb3RlOg0K
Pj4+IA0KPj4+IE9uIE1vbiwgQXVnIDE2LCAyMDIxIGF0IDA5OjQyOjQyQU0gLTA3MDAsIEVsZW5h
IFVmaW10c2V2YSB3cm90ZToNCj4+PiANCj4+Pj4gK2ludCB2ZmlvX3VzZXJfcmVnaW9uX3dyaXRl
KFZGSU9EZXZpY2UgKnZiYXNlZGV2LCB1aW50MzJfdCBpbmRleCwNCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQ2NF90IG9mZnNldCwgdWludDMyX3QgY291bnQsIHZvaWQgKmRh
dGEpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgZ19hdXRvZnJlZSBWRklPVXNlclJlZ2lvblJXICptc2dw
ID0gTlVMTDsNCj4+Pj4gKyAgICBpbnQgc2l6ZSA9IHNpemVvZigqbXNncCkgKyBjb3VudDsNCj4+
Pj4gKw0KPj4+PiArICAgIG1zZ3AgPSBnX21hbGxvYzAoc2l6ZSk7DQo+Pj4+ICsgICAgdmZpb191
c2VyX3JlcXVlc3RfbXNnKCZtc2dwLT5oZHIsIFZGSU9fVVNFUl9SRUdJT05fV1JJVEUsIHNpemUs
DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIFZGSU9fVVNFUl9OT19SRVBMWSk7DQo+
Pj4gDQo+Pj4gTWlycm9yaW5nIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91
cmw/dT1odHRwcy0zQV9fZ2l0aHViLmNvbV9vcmFjbGVfcWVtdV9pc3N1ZXNfMTAmZD1Ed0lHYVEm
Yz1zODgzR3BVQ09DaEtPSGlvY1l0R2NnJnI9djdTTkxKcXg3YjlWZmM3Wk84MldnNG5uWjhPNVhr
QUNGUTMwYlZLeG90SSZtPVBKMzkwQ2ZLUGRURlVmZlNpMDJ3aE1TcWV5MmVuOE9KdjdkbTlWQVFL
STAmcz1NZnAxeFJLRVQzTEV1Y0VlWndVVlV2U0ozVjB6ekdFa3RPekZ3TXNUZkVFJmU9ICBoZXJl
IGZvciB2aXNpYmlsaXR5Og0KPj4+IA0KPj4+IEN1cnJlbnRseSwgdmZpb191c2VyX3JlZ2lvbl93
cml0ZSB1c2VzIFZGSU9fVVNFUl9OT19SRVBMWSB1bmNvbmRpdGlvbmFsbHksDQo+Pj4gbWVhbmlu
ZyBlc3NlbnRpYWxseSBhbGwgd3JpdGVzIGFyZSBwb3N0ZWQuIEJ1dCB0aGF0IHNob3VsZG4ndCBi
ZSB0aGUgY2FzZSwgZm9yDQo+Pj4gZXhhbXBsZSBmb3IgUENJIGNvbmZpZyBzcGFjZSwgd2hlcmUg
aXQncyBleHBlY3RlZCB0aGF0IHdyaXRlcyB3aWxsIHdhaXQgZm9yIGFuDQo+Pj4gYWNrIGJlZm9y
ZSB0aGUgVkNQVSBjb250aW51ZXMuDQo+PiANCj4+IAlJ4oCZbSBub3Qgc3VyZSBmb2xsb3dpbmcg
dGhlIFBDSSBzcGVjIChtZW0gd3JpdGVzIHBvc3RlZCwgY29uZmlnICYgSU8NCj4+IGFyZSBub3Qp
IGNvbXBsZXRlbHkgc29sdmVzIHRoZSBpc3N1ZSBpZiB0aGUgZGV2aWNlIHVzZXMgc3BhcnNlIG1t
YXAuICBBIHN0b3JlDQo+PiB0byB3ZW50IG92ZXIgdGhlIHNvY2tldCBjYW4gYmUgcGFzc2VkIGJ5
IGEgbG9hZCB0aGF0IGdvZXMgZGlyZWN0bHkgdG8gbWVtb3J5LA0KPj4gd2hpY2ggY291bGQgYnJl
YWsgYSBkcml2ZXIgdGhhdCBhc3N1bWVzIGEgbG9hZCBjb21wbGV0aW9uIG1lYW5zIG9sZGVyIHN0
b3Jlcw0KPj4gdG8gdGhlIHNhbWUgZGV2aWNlIGhhdmUgYWxzbyBjb21wbGV0ZWQuDQo+IA0KPiBT
dXJlLCBidXQgc3BhcnNlIG1tYXBzIGFyZSB1bmRlciB0aGUgZGV2aWNlJ3MgY29udHJvbCAtIHNv
IHdvdWxkbid0IHRoYXQgYmUNCj4gc29tZXRoaW5nIG9mIGEgImRvbid0IGRvIHRoYXQiIHNjZW5h
cmlvPw0KPiANCg0KCVRoZSBzcGFyc2UgbW1hcHMgYXJlIHVuZGVyIHRoZSBlbXVsYXRpb24gcHJv
Z3JhbeKAmXMgY29udHJvbCwgYnV0IGl0DQpkb2VzbuKAmXQga25vdyB3aGF0IHJlZ2lzdGVycyB0
aGUgZ3Vlc3QgZGV2aWNlIGRyaXZlciBpcyB1c2luZyB0byBmb3JjZSBzdG9yZXMNCnRvIGNvbXBs
ZXRlLiAgVGhlIExpbnV4IGRldmljZSBkcml2ZXJzIGRvYyBvbiBrZXJuZWwub3JnIGp1c3Qgc2F5
cyB0aGUgZHJpdmVyDQptdXN0IHJlYWQgZnJvbSB0aGUgc2FtZSBkZXZpY2UuDQoNCgkJCQkJCQkJ
SkoNCg0KDQpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2RyaXZlci1h
cGkvZGV2aWNlLWlvLnJzdA0KDQpXaGlsZSB0aGUgYmFzaWMgZnVuY3Rpb25zIGFyZSBkZWZpbmVk
IHRvIGJlIHN5bmNocm9ub3VzIHdpdGggcmVzcGVjdCB0bw0KZWFjaCBvdGhlciBhbmQgb3JkZXJl
ZCB3aXRoIHJlc3BlY3QgdG8gZWFjaCBvdGhlciB0aGUgYnVzc2VzIHRoZSBkZXZpY2VzDQpzaXQg
b24gbWF5IHRoZW1zZWx2ZXMgaGF2ZSBhc3luY2hyb25pY2l0eS4gSW4gcGFydGljdWxhciBtYW55
IGF1dGhvcnMNCmFyZSBidXJuZWQgYnkgdGhlIGZhY3QgdGhhdCBQQ0kgYnVzIHdyaXRlcyBhcmUg
cG9zdGVkIGFzeW5jaHJvbm91c2x5LiBBDQpkcml2ZXIgYXV0aG9yIG11c3QgaXNzdWUgYSByZWFk
IGZyb20gdGhlIHNhbWUgZGV2aWNlIHRvIGVuc3VyZSB0aGF0DQp3cml0ZXMgaGF2ZSBvY2N1cnJl
ZCBpbiB0aGUgc3BlY2lmaWMgY2FzZXMgdGhlIGF1dGhvciBjYXJlcy4NCg0K

