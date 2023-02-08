Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121BC68F1DF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:20:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmDn-0004hI-B5; Wed, 08 Feb 2023 10:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pPmDh-0004gm-3a
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:18:49 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pPmDe-0002NR-T0
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:18:48 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318BSI1T013285; Wed, 8 Feb 2023 15:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=cGxKhhtLg2rEF71Z7vIefZCKVufD368t6njjKlli/9w=;
 b=dm+DEuh9SXT6wKg0RsjONpCg5RPRt+/dHOVQbOD58ugoXUTddCOusM/ftN5T2p+9K7zQ
 PBtpy/csdouZ/vIfZQEGRON+h1vKSM/sfttz5Al4jNwvyOrIA94gHNybi5ro6EP27b28
 YUG1g6+TwHlxOjfsRYFWi9DK7lpUlg0e7OgMYXcsaf9lXgXq6pi1mNWZCFzW0oo/1ijT
 Jokn2UXpY3I2L2c3rrDggfHCuohSPTOtG/LWiOgveJKbliUwE+9Jb3Kk9YQM/WeeHmFD
 N2aoI2wgz23lrsjEPyKR5cH0FqjWAOHJW8VWiOeKyfwEeKEJU8Y6v2WHpy8DxMe4/nXP cw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkgafmh0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 15:18:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APpijEGYwWJgfnc7QGyyrI4OMNz9ggEedcJAewo7p5VI8odufm16wydQAUVJjfUn2VFprFwgzweAL2JyBe+xCugz/akky7V9g4YLM9CJlBONz13NrYJvpImwIWbmkfAflCnse+Tf1vpjtiOmuj3B/bXeyKYl6wQVV7spGkyBdtkcdC3P1u/x9+W3hlKqt4R+kgly66mrkSimnGANZiWHjxoVXDrmpqPnmOVgWGIqaUb/Grs0EImD+lToVSZT7DfdTlxVcg1BzsquVrew318WzBY8w1ntOefZiS5zQfaiGeppBcJgmun07U3JGOpP+OV0mOlvkmLIUU/xjqwnTWFBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGxKhhtLg2rEF71Z7vIefZCKVufD368t6njjKlli/9w=;
 b=ls1anCfR2LfGvJDSRmE0eH06zO10WpS/U8euTgYCQykdvE2isD8INSgUzlR62MtwMjUMwTGFIMdfh9GNsq+Fhwr7iaCQ2UO1xfrz2djpqtcIGGr4FpmgzkbADfChyVHBGBJtaMDXZimCdEr1bIQU1VJlEK7inVZBj1KhY9DKrSw7v+/dxhxOg9c5ktWzXyH3GSoaOla2DHkYEMGgH9tYFbLLzPzEYqHO5vfISJfhwGtRqdB2xhkFniQ/xVatTTyMpglPhWJsC7xKsbKuz4AvybGOhxzpqknMDgXmIke5tLpUMvYwLTQCd77rFFeV0AMS/QDxI5Wtu2jT1kTNOQtFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BY5PR02MB6993.namprd02.prod.outlook.com
 (2603:10b6:a03:23f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 15:18:40 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86%9]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 15:18:40 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v5 10/14] Hexagon (tests/tcg/hexagon) Enable HVX tests
Thread-Topic: [PATCH v5 10/14] Hexagon (tests/tcg/hexagon) Enable HVX tests
Thread-Index: AQHZNcdUby6Dyhx/rUqgp8E2nf+XW67FDVKAgAAoFdA=
Date: Wed, 8 Feb 2023 15:18:40 +0000
Message-ID: <SN4PR0201MB8808D841E660E90F4C1C965FDED89@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-11-tsimpson@quicinc.com>
 <591bba23-012c-84d4-b9b7-69f355da9a93@rev.ng>
In-Reply-To: <591bba23-012c-84d4-b9b7-69f355da9a93@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BY5PR02MB6993:EE_
x-ms-office365-filtering-correlation-id: 9d930d13-4e73-43cc-527d-08db09e7c257
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1mooMuWtpZYFF/9dLtFLFrqP9S10mAJTAck9Y4nSIKVSuk3cr31bnI7nji3LqQzPL9YU0NoHXUmUaodSp5XkRmoj+5uWZ+mGLnRWFksRuv7CG6zGvddRpOTT6ozZz1U3Fckp8OrnTglovXYsysJUn5tgajVJ4+X9qteeC0klzSLUpo7OcC8GuLd2WNwf5lsmvgL5XesFwCd8sCJSBeow7+ubU0h8X1oZXdxaCfFDmG4pnswqGvfCT0ghaQWrjtNwaiTAlmkng1411D8dQZ+yzqwDTH9wRykZTp8t406mJJgFqmzzjZlvFPS3Md+rTZSLn96YSj/od3/M/2YYlW5DZmrgdv6MjxwqAp6gQwiLZ2yn3QwjT9fkyAkuW9sV/mT+nrT6Ya7iE8XMhcCYMHhMgh1dn1k/cFPMO5pcvBR7MJ1ctTgOYxfXiLbFVNkzqxLpl5XK5G/2YBbqR25arFQguChysLjr1kcemK0uEGwc8tbshNCnR5ZNNuua4WyEwu2b/BV7XZL5uM7oUXo2LqWA3ZQ1qf9ewvrRmUyXr1T9sZcDIqNz4m12cZBpDSiofV+OFHEbUKL3I6df2gOjtAi7l1iCwULA48DQCG8ibdWxIHTjM1ycEmMvumrA+ZA+e1tfmgCLggeoUvmSqkw+6HahR9iAmO9iULRNVj+di3vpZ3XYKxBrRZiJ2i2gF04Lz4OFtDQFHMP4NZb72lk3lCP1oQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199018)(76116006)(55016003)(38070700005)(316002)(110136005)(2906002)(54906003)(5660300002)(8936002)(86362001)(52536014)(8676002)(66946007)(64756008)(66556008)(4326008)(6506007)(41300700001)(107886003)(53546011)(66476007)(186003)(66446008)(9686003)(33656002)(26005)(7696005)(38100700002)(71200400001)(122000001)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnQ3VlVhZmtaS05jTk9ZamZFVlh1N2VVM0RaRzJKY0JhN29UK3RIclJ4UlRJ?=
 =?utf-8?B?U3VBWjN4eFlJdVpWb2VRZ3ZGWGcvT3hyVk9pVGtDVmFsM1JoMUhWS1VFQWo0?=
 =?utf-8?B?bjhPaHljN1ZmbmtNblRsOVppdVVnREhFMXVrR0d2aHJoQklqaGtqZWNFZGRk?=
 =?utf-8?B?enIxcDFjK0ZrSmk2TmtOaDJuRGJxYTRNbEZ5SGVJVnV3Qmt3MXlTZm9FamR3?=
 =?utf-8?B?ZmxUOEowV3pGMFMvdjloNWJJRGhPK0FyTnV5OUgzazdGNU9ldWkyT1NsdzIr?=
 =?utf-8?B?S0ZrbXBSdEFxT25HU2dPUTErakdFa09QckE4TGpSdFBoUFBvZkZ6alRiazdk?=
 =?utf-8?B?NGxpMlNKKy8xL1lvRC80S2poUUVGUktXeitYNE9UQWNmTFpFZklHaURmUkta?=
 =?utf-8?B?OWVRRkFmODJxeW9PK0FEYWVuNUluU1BDcGtRQmk5L25hdVFTelZSbEVhWGVr?=
 =?utf-8?B?UTlXOW5SNnZWYy9FaGhZL0Jua2xwUXB5NjJobUJka0NwaDg4cHNKVzFKWlVl?=
 =?utf-8?B?dmRTVWpTYlN6R29lTytUeUdvcSthQmVSMTEyOE5QK3A4RkNLYVI2MWtFSGNQ?=
 =?utf-8?B?allTWkJ3L0tDL1FqWTVPQzkzeGdIUys5bnU1bXNLRFNSUHhOM0ZEYS9OeUtL?=
 =?utf-8?B?bjNmNWExRWlKOTd3bkpWVFAxUmJ0VTMwb0pDYk85RzYyYk1TYjA4MmpOSnN2?=
 =?utf-8?B?aFg0V2QzaGFocnhiNHVXSU1DbXpDT1lUb250RVNQRkZ3VDBFSkppdEZEMUND?=
 =?utf-8?B?RWY5UkFCRWkwL2R3enN2VE4zdUVqb0FueHFjaGY0OGJqQ2lFNXR4VGticjFi?=
 =?utf-8?B?dXJXVzc2bkI0MVhURnlHOGRXK3p2aWQvMU9xczNRdVJZT2tpaFBYU2YxN3da?=
 =?utf-8?B?RjVxWDhja3EvZUN0OFlXL1ZpTmtXSU43NGlkU1Q0bVZYd3ZXZEVRYjVTbWg2?=
 =?utf-8?B?TmNJdmc5VUtOVjhsYng2WWhqWlovRVMzNU1HWXJpWUUvYzdkS2tZSGpQNDQx?=
 =?utf-8?B?R1k3UTRObUN1bmFRNktpZnRxT0tVQW83K2dyRUplUWdtdjFWd2c2cGszcHEx?=
 =?utf-8?B?WWZ0OGpWd3MySjRWblVuYVgrNEZBVjJXTmxQVTZub3Q1a2Rwc1o4SnNMMXdn?=
 =?utf-8?B?elR3eVRPbkhpMHJqSmRHWGVrVzBDRDIrb2w4SDZET2VwK2ViZUg0Nnp6ZXdy?=
 =?utf-8?B?dTFCb2JhWW8vRXlpRVJxYjZ1M2t0c3ZLcGh0UkJsQ0VCNytYeXhaMCtxVndN?=
 =?utf-8?B?bnFkRzVUUHpDOVpZOGNtOTlUbjZ5c1AvU1BQUWQ2bjRPVVZJUDA2YTJmcXNB?=
 =?utf-8?B?cXExMklXY0NtZ1NmM3FNbFI1dWNERFBoS2NMdmZVKzdFcDUrSnpSczQ4cExI?=
 =?utf-8?B?V3RKdDY1UE1FVHFPTStEYisxL2F6cXo5YmlIYnhMK0QybC9WRUM3ZzkzSUo1?=
 =?utf-8?B?dzZUUTlNa3NNNmtxeDM0K1F2amFkMHJpMWVtTThwVXJmaWFwZHNKbjlqSHBk?=
 =?utf-8?B?bm1OWENQVndHdmEvWHZkaE50YzhTcjJPN0k1RXdrMEFKRlgrUVI1TjhnRGUr?=
 =?utf-8?B?TVNDd0ZLYjJyZEFURkdMcHRSZUcvb21OZ1VtUGdIYzR3eXpmdlI2eStTRUFV?=
 =?utf-8?B?SnBtSUtNWjZtVHJnS04xdFYvclFJNWVQZTJiRjdrSlNuY204eElScmJ6Qmww?=
 =?utf-8?B?V3AySGY5SXVEYmY5WEltOFgrL00zb1oyT3RRUU9JNnZpZXk0ZlluMHdlNUEz?=
 =?utf-8?B?L2xHU2pIdHJ4cU5rMDRQOVZlenJ1SlNybXNSUytSZnQ3UTNzSE8rdC9sa1BI?=
 =?utf-8?B?NTJBdTVXNUd5WGFNSXNVREVLb1JMQSszVEdSeG5jYVlsak4rd2lqckRaK081?=
 =?utf-8?B?N1Q4RmV4QzlMVlExVFd1YzB2V3JNb00rbENBaWVQakIxTlk3Z0hHQldFU0ZZ?=
 =?utf-8?B?UGRMcEZpUlMxeHNzeXpLcEd4V1BFOUdxVnZtMG5xanBCMjcrU2crTC9iS3hs?=
 =?utf-8?B?NXg5a2F2QVNxaUhVY3dZOWNoR2UyMDNaSzd5eU1xOSsvNEE4aTNhbC9DWm94?=
 =?utf-8?B?eXVuVXVFMEZWQmtYbCs2ZXltemxOVzJlekwydGdMdlh0aldtczdGREFMYzRw?=
 =?utf-8?Q?jxgdQ54e7yUOCe0Y9HyonGL68?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: cWu0/ECLyz4Md8GURa0MMevJy0W8j7ERjpdEgaQ+L4SgkkRpu2Cca0uHdSLMBOm6UxPjig7CfXN25ZhXWnRdkWbKBFXkRdYyUJyCGU8/tMzXPg4SCU2ISt/PsjUucJtRqsIn8XhexAksRXSYVYlC8FAMaG+Fr0dkR3MMUGCcYeKyF8IbXVkjExhBjrbmrfWs++gxUgdr5a7K9Cg4oJEHW0cPB1OC20Y+honBSCLR/XlAeSrjdMx7pCdprFHr142zOmvG0w4g64LSLyYFq3nPfa2xf0TDTSzGKqWSzgtlGo3iX1aBafmSa6OaA+7FVTqX2oiBIVKU0etgleV/IIv3LEOSu+MChyZeZSDLxgdWA3KsK81vC75Hy1qoqTBzbx3vKVAbWfZ37NTij/8t551EaRc/Sm/7Kb3zmxqZ89kWGO2q+Wgypa6JlhJq+bkRhm2dQt7DcRgsV3oYxAZnf1E0w/vBRiT4Bvk4WANSij5PTOZE7YXLu7ZcAGlep+65DfXhl/YspyBdbw8fJWGLIc5tiJxnmjWLxDp604uazGnCHXCJ+8e9LMIFSdxrn50udVhxI+OsVAQQv0W2WGoAUkykONL9HwbmcMlg+HTHZ9uO/Xmj2G/6lsI3uHP77okuwyvPyRUSxeSKFuTt4RFX5UODt+JtZ2lihCZWkuFiYILEqV09pJC4i8utGyP6QwCQ7LE6iPPWGdjZB8zazSfMR2EibWMPPsFLseNIIiFhsdGsVjFa3MpwN59WD+L9V4IbBOCvQpUt5RnNjeP2A+Lig26MN8iozv9YERC5uspS/a1xGQfTKngZ3LmZXJzgDNvlxCpk
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d930d13-4e73-43cc-527d-08db09e7c257
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 15:18:40.5030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTuu+DmlCTbqLQwoltSn/a7v04CDBdhny4s1qWiLc4h7QZs9cuN80fGtzGqMIrwc3GKLQduag5lAe9TLO34Cwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6993
X-Proofpoint-GUID: zQWLRk3HDZb3Jh8cgLlKfmH7Y7LnW7EN
X-Proofpoint-ORIG-GUID: zQWLRk3HDZb3Jh8cgLlKfmH7Y7LnW7EN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_06,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 mlxlogscore=750 mlxscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302080135
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSA4LCAyMDIzIDY6NTQg
QU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZw0KPiBDYzogcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgcGhpbG1k
QGxpbmFyby5vcmc7IGFsZUByZXYubmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29t
PjsgTWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxMC8xNF0gSGV4YWdvbiAodGVzdHMvdGNnL2hl
eGFnb24pIEVuYWJsZSBIVlggdGVzdHMNCj4gDQo+IFdBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2lu
YXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5DQo+IG9mIGFueSBs
aW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KPiANCj4gT24g
MS8zMS8yMyAyMzo1NiwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4gK0hFWF9URVNUUyArPSBo
dnhfaGlzdG9ncmFtDQo+ID4NCj4gPiAgIEhFWF9URVNUUyArPSB0ZXN0X2Ficw0KPiA+ICAgSEVY
X1RFU1RTICs9IHRlc3RfYml0Y250DQo+ID4gQEAgLTc4LDMgKzgyLDEwIEBAIFRFU1RTICs9ICQo
SEVYX1RFU1RTKQ0KPiA+ICAgdXNyOiB1c3IuYw0KPiA+ICAgICAgICQoQ0MpICQoQ0ZMQUdTKSAt
bXY2N3QgLU8yIC1Xbm8taW5saW5lLWFzbQ0KPiA+IC1Xbm8tZXhwYW5zaW9uLXRvLWRlZmluZWQg
JDwgLW8gJEAgJChMREZMQUdTKQ0KPiA+DQo+ID4gK3NjYXR0ZXJfZ2F0aGVyOiBDRkxBR1MgKz0g
LW1odngNCj4gPiArdmVjdG9yX2FkZF9pbnQ6IENGTEFHUyArPSAtbWh2eCAtZnZlY3Rvcml6ZQ0K
PiA+ICtodnhfbWlzYzogQ0ZMQUdTICs9IC1taHZ4DQo+ID4gK2h2eF9oaXN0b2dyYW06IENGTEFH
UyArPSAtbWh2eCAtV25vLWdudS1mb2xkaW5nLWNvbnN0YW50DQo+ID4gKw0KPiA+ICtodnhfaGlz
dG9ncmFtOiBodnhfaGlzdG9ncmFtLmMgaHZ4X2hpc3RvZ3JhbV9yb3cuUw0KPiA+ICsgICAgICQo
Q0MpICQoQ0ZMQUdTKSAkKENST1NTX0NDX0dVRVNUX0NGTEFHUykgJF4gLW8gJEANCj4gDQo+IEkg
YW0gbm90IGFibGUgdG8gcnVuIGNoZWNrLXRjZyBsb2NhbGx5LCBodnhfaGlzdG9ncmFtIGZhaWxz
IGR1ZSB0byBtaXNzaW5nIGxkLQ0KPiBtdXNsLWhleGFnb24NCj4gDQo+ICAgICAgVEVTVCAgICBo
dnhfaGlzdG9ncmFtIG9uIGhleGFnb24NCj4gICAgcWVtdS1oZXhhZ29uOiBDb3VsZCBub3Qgb3Bl
biAnL2xpYi9sZC1tdXNsLWhleGFnb24uc28uMSc6IE5vIHN1Y2ggZmlsZSBvcg0KPiBkaXJlY3Rv
cnkNCj4gDQo+IC0tDQo+IEFudG9uIEpvaGFuc3NvbiwNCj4gcmV2Lm5nIExhYnMgU3JsLg0KDQpT
dHJhbmdlLiAgVGhlc2UgYXJlIHN1cHBvc2VkIHRvIGJ1aWxkIHN0YXRpY2FsbHkuICBJJ2xsIGlu
dmVzdGlnYXRlLg0K

