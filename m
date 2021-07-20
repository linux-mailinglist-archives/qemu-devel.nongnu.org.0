Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9DB3D0296
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:17:45 +0200 (CEST)
Received: from localhost ([::1]:44580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5wBU-0003dI-D1
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5w7v-0007bu-MU
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:14:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5w7t-0003PJ-6H
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:14:03 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KKAe8g018100; Tue, 20 Jul 2021 20:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=6dFHMQDpfF1AxWx2rhDNlDZviGd1B865bXQvDqZYG3s=;
 b=n3LYsT3zUHjBKYQh5WAfjrmVEYr0+TkwfcIuo1KzSIKdJrHE+sbDbby5OPKjd8uLOehK
 3YSDcWwPlwhC1zq3jPB1UZ1cbRlW80rvLKZ5IPvwSkF+DuhfNrlYSDuLY622PpDZJ+Od
 eFvHSTjOWBDlirWRk7GThqsd9dylsFGyeaRrgtbWtJ9mKuRXYPxEYpc5gq+AusA0RzlT
 Clo1Z9c7ypAwqisbN4LH9FTKz/B+o70VS8xONnRtEzMesmjp/X81CLaETpghuIIQnZ/i
 eSVLXEmaTxu95iJyf3kwzagC//GVw+V9SpK36N497Va9wDicAgm3U9VdNYRNXCl29GfA yA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=6dFHMQDpfF1AxWx2rhDNlDZviGd1B865bXQvDqZYG3s=;
 b=0EURRPnLjdQxy2OeTCmYnY4EHf1sDlOgpbG1u40O12JOU0OaCbZm0QrInm8jtF7v7WRx
 kwoKnUkHWhWuLBq7Hsgreq086xjFvaG3ackTNc4C0QJwvQsxM0UDVtai0Uk+kGf9Fdi1
 hJmawpssYOj95FWOHuWEmINMBewfYUzxUCFVcb4DkIf1dw582tSwqhwUj04VNuGJAlpo
 4B9blGgJ6otTRCUHKZzciSUO7qT8wZBAk38AXYUAkEZztEZa087d6tamAwM0Q6Ja7UX6
 Zo1OvdYuVNifTSJKI7JzDvXyTnDT3BEMxo3ilAlVKUBGM8lMSLtrOXMw/xdiG1O+bSwd 5g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w83cus18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 20:13:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16KK76hH023862;
 Tue, 20 Jul 2021 20:13:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by aserp3020.oracle.com with ESMTP id 39uq17nvfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 20:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW7Tn+/4bXuYp30jgy236bd9Abt2ZeAgFdpeJjOZZLjjrY93x4AMzfpIVQN1O2yQnKCOSlfgtzcL9s/BZ+nakaWTU4264ck2GAlCmQu7oO7KJHWVVKWznMOtBH1VHssyoy++veQiKIjqJfeZ/G2oNs2ejet5QK56mFLSl4iLqkBU0XN1s4TSVmKLAK/JF/lfhj+qQ6MRPxBYB+PjV12WFaWyv13crZQdzMNc5tGltsiILDXZVSdRvy+AyP6vfB4EhvzsBhu3TFlt8BWu23GWps7UpMA6RjSamW2GGs9a1AkPq0ZhiZlL3pup4uwHHBQw4H4tDPrEhYIU0HF4OEbiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dFHMQDpfF1AxWx2rhDNlDZviGd1B865bXQvDqZYG3s=;
 b=esNDrhtu8H34Hc7xgEjTLyd4jlAT+TNtJ1PHZY833KR37p91CXlFcD1vU9a9oKNp8asKr0TIcivjjl/jO17+wbUe4W5YAjZ6I+yCb5A5nF2we0uVO5rQG5vpb3pA+1c4OXvz+bxqBVPYuZhNMkLS7bRjjClEI6Nm1M6Ih8zPMwZrzF+xwvestl4l/1wdJUf/UrtnFS2LdO5xu25ZK6xwDfveCncio54rkVmsaLUeVMMRS0XT59fSmJYSltu/WKnQwNXH6Gt1IXJRibJad5OcOVx9grkkxqXiFangrRBBIKBq8i4vqX6i134jwu3lCdHWBZlv3j/LoHBbyxfoY88Tcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dFHMQDpfF1AxWx2rhDNlDZviGd1B865bXQvDqZYG3s=;
 b=xTcLr6QaTRCvIgb22zcSJAoe0salFm9t1Ir6h67nd9D9uId9k/aJcHATzHQ0omUyGXqyxLxqWexFBfP8LDz7488Lxx6paHe5AzNK6CoJGs29w+aT8iGxjOk5UejDcPOcZZrbIr7oERAs9lL9cxOgvmvYI6/qg+XcW9UjrvXNUqA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5060.namprd10.prod.outlook.com (2603:10b6:208:333::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 20:13:56 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 20:13:56 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: tests/acceptance/multiprocess.py test failure
Thread-Topic: tests/acceptance/multiprocess.py test failure
Thread-Index: AQHXeR0NylCXt+5A8keyEMKNPxfdPKtDsUyAgABTqwCAABqPAIAIG4MAgAAaRIA=
Date: Tue, 20 Jul 2021 20:13:56 +0000
Message-ID: <8D9638C2-D992-416E-9A92-58128F1001CB@oracle.com>
References: <CA+bd_6+2zk0N=s-D2OG4FUZ-HirJ+8HkMUktF=Jqyf9_HhyH1w@mail.gmail.com>
 <287d8097-f865-6f89-6062-567a7994987c@redhat.com>
 <87wnpr4t0d.fsf@p50.localhost.localdomain>
 <418D3B29-010B-4B5B-A310-F3E3DA110DA9@oracle.com>
 <87o8aw3k3p.fsf@p50.localhost.localdomain>
In-Reply-To: <87o8aw3k3p.fsf@p50.localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa30f4b8-9a37-4f09-719e-08d94bbae757
x-ms-traffictypediagnostic: BLAPR10MB5060:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR10MB5060DB42E8B3D61855AA979D90E29@BLAPR10MB5060.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bsf7cZipUDrBElUhkS7Is5MtQki1ByVI/ZdE8gCXJYiL1FZkVToG4zo++d22I7a0nhkA83+Qnkoi3MN8cH7Ir5vZisMYzrecjDZBK9oaFcpysIhk1r5P/V7K7RdbYvnTlU28TEr9yckywlvjjdeEWYt0Md1t2fdLuQpVzooL/xuQqLDOkvI+qtn4dYw7CLfqGa3IbCsZhXY/5Q4/qf9+OtSdXX3jZEuUGKegZZ35e6Sk4AC3ow6dO2u98TwD0Ia3hN9HnmVlSKQLr+0tGzcNBbn2ZlCZ+Hv13UIc3uyFDOVIyMYhUJ4t5lK5LYgRUi/C3/tRlrSb67rfS2DV2JY36/rZqZKbCybr1MVeZHlruNKZF0l9KcKhl1WsLzuG+UwE9JiFFgy7bv7baiEKEkwWRXlUrfbDD1uqIzF9oM+uRv4mYmAfBuD6o2idfYmgVgYjSQ6eFMKWq5JAyf8TrGONsP0i5FIB4Y9JHEJ1KraoOnH1szV7XnI2ycShRSEoSKl4Df2o/ERLqt7jWsvwdAq40MbRhzmRedcsPfi8TJCRy/MRk0tcx+uiwn+cuoZMkYtmBPfKX4n5r7t2D05PPqvukBEvq/8Ketkm70+yPY0LdlQSTJwhPJnyrY60W2s8vknVCFEEWeEV5+Mg6oq3xTrmr1Im6P0O2qy1/VHKuWXjyOYgCPz5XWvbIxRCEda0lpBpmwA2yAxtBdBPnA3vGvRr1gvnigVAh9hjspCLo/CNx2J4JLeJ0SsKgpiIjEIUorqk3N+4EES1OYnq6ccmWubaV2IxqK7aVBOCeMLKkyVrUijcC4Gw8fYnJnW25wbbjiTQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(4326008)(91956017)(76116006)(38100700002)(122000001)(186003)(508600001)(6486002)(6506007)(26005)(53546011)(966005)(6512007)(2616005)(36756003)(54906003)(2906002)(66476007)(6916009)(71200400001)(66446008)(5660300002)(8676002)(316002)(64756008)(83380400001)(66556008)(8936002)(33656002)(66946007)(44832011)(45980500001)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1pvMjBGcWtOU0NuT0tiRkR3VEZGTnJCNXgvL1d1WC9HTGhLZ3Q3WXZESWpn?=
 =?utf-8?B?bHdWMjNLdmxkSVhXTEJwQ3o5WmFEb0REQytzK3N0a1ZFV25rRCtWbnNtZ1FN?=
 =?utf-8?B?bjVaV0VTemYrWkFVYlc5a3FpWW1XZDRIUktOSXRhTUtFYUVxRk55dDlHY0xi?=
 =?utf-8?B?cy9FaTd1M3dTcHhmWkZBbTh6QnRlTzRQcmJMSnNkblpFQnNScVdYQkVWQWRF?=
 =?utf-8?B?RytQV1BTdlo2NUs3OWJqSmJyYm1WR0d5cTRuYkp1OHFtZTQ5NThOTWdrc0xq?=
 =?utf-8?B?Q3V4M2x3QTFLOW5ad2lDZzNxcW1wb3l4NHBxVlkrK1ptRENkRi9qT2pqQXcz?=
 =?utf-8?B?YzgwWVk1UW9CWlpwWTZsU3Q0dmNxUDFOc1RqaHNjcmdlMGFZUzVwU0ZkUVNF?=
 =?utf-8?B?V2V1Wk5YdHJ2RHN0cE1uaTYzbzNKWmQxUkZuNmRXbDlNb0F4NkVJSzBkNktt?=
 =?utf-8?B?ZFdMRjErVDR1dmVTLzZUVUh2WktnTVRiVThFZzhoWVpGOTBtbkJESkJEQnZD?=
 =?utf-8?B?Y2t2MU1INEZqSHBrWlZMc2Y3cEFXVXRLemVrNXFmNFVWM09pMEo4d041Zlk1?=
 =?utf-8?B?eW55cW9WSk5yQnhTNlJYdHFkdzdYd2JZUG41bG56M0htSlFCa2I0K1VJV0lF?=
 =?utf-8?B?d3RIcGlReUZlRjN3T25qV09PdmlsVC9xdmxoU3JBVnFaYnk2UU9wdzdDRHhI?=
 =?utf-8?B?d0xjY25yRDFjWkhqNE5GcXc4QTkxN0JHWFAzMjRzM2ljcm5uR2ZWVjUxYnpB?=
 =?utf-8?B?RXJKblg3MHhyK0tUUFRVdHZIeXdzblhrYzBadTFHQUN4U3ZqQ0JWN1k3eGFJ?=
 =?utf-8?B?ZXlyM0xiZjJ3bWxtSC8yTmM2MEFGUlBITjVjK2FlcjhnY2w3c1V2QXUxUmIy?=
 =?utf-8?B?cHR5cnN1SjNPUDczR3ZkSG5HWE4razBxckN5dUVYK0dsdzFxNVhlNTROdDJD?=
 =?utf-8?B?cThHL2lQbENhNkhaRi9lRmtoSDNDdDlRZzZvbW1qRjFpK2tqbzk3d01Vd01V?=
 =?utf-8?B?Z2t4SjUxWCsvTGVRSHlCK3pWMnVRQ21uTnRjQlM3eUpHMXBvUDcxVklWVnJF?=
 =?utf-8?B?azd3VkFBbHh4Wi9VZDZkV3plSVh2S2J6NmlqSXdMQm1LL242Z1Y5dXRtSHF6?=
 =?utf-8?B?aFhHOHlOa1lCaHExY29BTkFjZzNYRlFOYkNXYk1YVGp6SVZiUTJ3TkNidW1U?=
 =?utf-8?B?QTBJeHBVMEEraGlVbEZQVnBFTnZMdTR3OUNiZFVYUGxjS2d2VUQ5ZlhIYkZ4?=
 =?utf-8?B?MTdvbVEybTJYMTJQaTFCWEc0Q3NqRklCS3ZqbUFGMExUNjlrUUV2ekRybS9P?=
 =?utf-8?B?SmVBUlYxZ2gwTFgvcWhBQkgxWVlsQm9FU001NTlUV0JFQWMvTlcrTmNBOUFt?=
 =?utf-8?B?NHJaY094dlVvVUxPZFpkaTVRem92TGxvUE5VWEpmSEV2MTVqRzc3b0xoRzVy?=
 =?utf-8?B?MVN3dlYwdUlaVmFGWjFWanlCQTRqMlExcng5SmdiOE1KMVhwbDBDNThwOVIv?=
 =?utf-8?B?UUo4ZzliRWFzMGh3VjBQZi9UY25rZGRJLy9HV0hORGhvczhYNUZNbFk4bzNC?=
 =?utf-8?B?Q3V2RmJ0SkptMktXUGZqeXRrSUZycE9LT3NvUEkyeDVPdDVPY3NqY1FDSklm?=
 =?utf-8?B?Vjg0cVJ0SGVqRW1JUGxwTjhRWVJ2MVdYNkFxWU5FZEZZMmpNUjN3Mk9GS0tY?=
 =?utf-8?B?QVVHUGxUYmliQ2xBMDh3NHhZdGpaZnRoZDJaM0FVYkx4d2hGNlAwc3lPbWlJ?=
 =?utf-8?Q?T1Zmn84xJ/xoIKlKYwAhPaZB45UOJ3lsudC3O+4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F928FAE74EDF634697B70E65B03C4953@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa30f4b8-9a37-4f09-719e-08d94bbae757
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 20:13:56.5824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dLL7gl54S/Q3hvc5JYJ/y4uMdWVYkBcbpfRR9cigPpPnQB31YJTryj6WMfyfl6BmnZNMq7Mtc8pX6E7KBJGVZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5060
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10051
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107200128
X-Proofpoint-GUID: AY2r_ywN6L4MBvCVCS1WSQ0uffsMLVee
X-Proofpoint-ORIG-GUID: AY2r_ywN6L4MBvCVCS1WSQ0uffsMLVee
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
 John Johnson <john.g.johnson@oracle.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 David Hildenbrand <dhildenb@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVsIDIwLCAyMDIxLCBhdCAyOjM5IFBNLCBDbGViZXIgUm9zYSA8Y3Jvc2FAcmVk
aGF0LmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gSmFnIFJhbWFuIHdyaXRlczoNCj4gDQo+PiANCj4+
IEhpIENsZWJlciwNCj4+IA0KPj4gV2UgcHJlc2VudGx5IGRvbuKAmXQgaGF2ZSBwZXJtaXNzaW9u
cyB0byBzZW5kIGEgUFIgdG8NCj4+IHVwc3RyZWFtIChQZXRlciBNYXlkZWxsKS4NCj4+IA0KPj4g
UHJlc2VudGx5LCB3ZSBhcmUgcmVxdWVzdGluZyBzb21lb25lIGVsc2Ugd2hvIGhhcw0KPj4gcGVy
bWlzc2lvbnMgdG8gZG8gUFJzIG9uIG91ciBiZWhhbGYuIFdlIHdpbGwgd29yaw0KPj4gb24gZ2V0
dGluZyBwZXJtaXNzaW9ucyB0byBzZW5kIFBScyBnb2luZyBmb3J3YXJkLg0KPj4gDQo+PiBUaGFu
ayB5b3UhDQo+IA0KPiBIaSBKYWcsDQo+IA0KPiBJJ20gZ29pbmcgdG8gaW5jbHVkZSB0aGF0IHBh
dGNoIGluIGFuIHVwY29taW5nIFBSLiAgUGxlYXNlIGxldCBtZSBrbm93DQo+IGlmIHRoaXMgaXMg
bm90IHdoYXQgeW91IGludGVuZGVkLg0KPiANCj4gUFM6IEknbSBub3Qgc3VyZSBJIGZvbGxvdyB3
aGF0IHlvdXIgc3BlY2lmaWMgcGVybWlzc2lvbiBwcm9ibGVtIGlzLCBpZg0KPiBpdCdzIHRlY2hu
aWNhbCBvciBzb21ldGhpbmcgZWxzZS4gIEJ1dCwgaW4gZWl0aGVyIGNhc2UsIEknZCByZWNvbW1l
bmQgeW91DQo+IHN5bmMgdGhlIE1BSU5UQUlORVJTIGZpbGUgZW50cmllcyB3aXRoIHlvdXIgcm9s
ZXMvYWJpbGl0aWVzIHRvIG1haW50YWluDQo+IHRob3NlIGZpbGVzIGxpc3RlZC4NCg0KSGkgQ2xl
YmVyLA0KDQpUaGFuayB5b3UgZm9yIGluY2x1ZGluZyB0aGUgcGF0Y2ggaW4gYSBQUi4NCg0KSSBo
YXZlIG5vdCByZWdpc3RlcmVkIGEgR1BHIGtleXMgdG8gc3VibWl0IFBSIC0gcGxlYXNlIHNlZSBm
b2xsb3dpbmcNCmVtYWlsIGZvciBjb250ZXh0Og0KaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNv
bS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNzY1Nzg4Lmh0bWwNCg0KSeKAmWxsIGdldCBzdGFy
dGVkIG9uIHRoaXMgcHJvY2VzcyBhcyBJIGNhbiBoZWxwIHdpdGggc21hbGxlciBwYXRjaGVzLg0K
DQpUaGFuayB5b3UhDQrigJQNCkphZw0KDQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IC0gQ2xlYmVy
Lg0KPiANCg0KDQo=

