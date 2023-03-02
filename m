Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F426A7AAE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 05:57:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXazK-0008If-0H; Wed, 01 Mar 2023 23:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pXazF-00089l-U5
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 23:56:13 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pXazB-0004b8-Kd
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 23:56:11 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3222s3Ga002887; Thu, 2 Mar 2023 04:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=/W2v++y+J0GknElUnKk/fW3v5CuKiez4aYFJQEcirGQ=;
 b=LCHhW4rT9bn6LgjLQsH+avu4Cg+17dguKgTLIMqM3MWJ9QbfLmGVZU1n7E4oSa3sNC+x
 lr+qzGUCdVp1Aj7FTGifDvz7N/qtwj/OjfEnvd7fkpjRwmtr0gI3JPpPKn0Z59YYFFvF
 uiwwfepoOuhvAdSawvAdcIYlf3gufA6aVvH1Yh27tozkwl3ei8TVC9ZwUC5lFgQB04Zo
 NGC8uH8dsbIobXlIrRf02pZku+nhd/abHQDfI0kaK68oHOUhEGWfjWhLyGZwrRfrlrin
 21miztLLZFQGonlQ6BeNdmvtkVk53tzTr33czjmwB93xXTQLTM0UWcMN5bNISVadZglE Aw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p2cur12wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 04:56:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlQ6vJsNH2jx7QOl6W7JOE+RxmMfyjJLd8w4dgUiFLcaXpmnfhGmBhNbfrVqevMophfQB9dqUD3zLgUUwEfI7Mr/5nofkiFK+8HFKQ6afkusEbK0Ffk3VPF+RROH12juA5DXaaieo3dmAn+SxcufFncKlBV04hXYa5bZOb4OUH5pwIZMccxXeL11/UHNzS77VqapKfNqQO81pwxZ4ZgeH86wRKRzGxHHPxiYJRHoMqiIy5nFvOCXEdm25ONGBdAQU9kJTiXpk8U8sGMjPz/UB6h2JTIQD628Y+YW8532lX1UduEC1CyAUHBiODSyxuSW7Fp2MQmlhxvDMmCe3CTBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/W2v++y+J0GknElUnKk/fW3v5CuKiez4aYFJQEcirGQ=;
 b=kyCyQm95tcRLEnciPPckwABvGzftdHRGQjzpu1i33qocN4wK3pMFdkmlDz+1/BybbU/g4AtCgcS39Zg/bzGkZytcv/htkbuixfQ349tfXSHw2j/KQ5Uxc1Ix1eC8IBHfnbkXvJRvncBtztHAAQf7WAh1k5DNDcV1ujCWlBgl2m8lUKESF3cqMn0cxaDmttrk8btOC0MEMmAAblPQEjG4CO9Ccr1MGm1eIADRQnDp8L3YVr6vn1hF5CzYUfHD3uBRINfvJDWXZSwVMc0urJvJP4h/kR77jBW+0/68fxi1jW/7t5F8gBySFPFdpDEScJKTm0yziuXepOYEyRlwmssOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by PH0PR02MB7767.namprd02.prod.outlook.com
 (2603:10b6:510:58::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 04:55:58 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%4]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 04:55:57 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v5 13/14] Hexagon (target/hexagon) Reduce manipulation of
 slot_cancelled
Thread-Topic: [PATCH v5 13/14] Hexagon (target/hexagon) Reduce manipulation of
 slot_cancelled
Thread-Index: AQHZNcdSLZ8znd1odkyLKl8kRdg+da7eS9QAgAjNsEA=
Date: Thu, 2 Mar 2023 04:55:57 +0000
Message-ID: <SN4PR0201MB8808689D2CEADCBB4227855ADEB29@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-14-tsimpson@quicinc.com>
 <2eb2c248-8a14-345c-1a54-7c28a1458123@rev.ng>
In-Reply-To: <2eb2c248-8a14-345c-1a54-7c28a1458123@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|PH0PR02MB7767:EE_
x-ms-office365-filtering-correlation-id: e5765597-2822-4236-0eaf-08db1ada6948
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PGnNe11Y5GlqSZFhi6vX0FrH09SXl0fTtSBhQ+4mVu8Rl3+gr+JRbHwGHgt2ev4Xit+Lukav1faxakxWgulg00L8IMO297KP2nbGZoZPARZKZbidXMTEahf6pY/6MrYETmueuKMtlFIHtysNd70WXRE2KQFFUOiX/HzCRYbXiT/rt7ctmNWOjdn15OTK/o5sNVfjIVVf6ksGeyXU6LzEO5zKgNM6nsOIciLcLJb8MHiadS9I+IJqET5MgRjWkLl5gGCsBmfuecVXp0w6FkacRNmyFC8FSVMORhQzXxJ/ry8RiGFcGWzpQxipUxYBhuDcuwzUxuvm+fmXgRVxumvBdkqiNWq/ipDAuc+VijC2G0swQBM+Np1nv1cbqa7O4FiHshK+dmM/3dEKkmxnYONpAVewVmTTzrjjzsP9DXCehQvACehTlaLwkVGIC3zkaTk3y/toS6i25SQjW4kxaYlMQUqUT/upfwGdmVp08ayc91ugtAVUP7TPKRccVK38Jrnb1NjM8Jt7l7YD/Ljk1nyjB7UvYir2HmbPuWnmScmJmwhQaZd1kD8SdMHVETlksR6MOoZGmFCVPtwQccsAhuZrxvef9Mfl1koOCFKrukNLzy79jaajudV0rnOxfECvbOznC9tWft33f1o4q+jiEafbt7FFaGdMXeTE991wdqg7+J+2xagqpvpfsGvfJNpLDih66n9Eyiac8ctqbOLaC4ukGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199018)(33656002)(107886003)(53546011)(4326008)(6506007)(186003)(71200400001)(9686003)(26005)(41300700001)(316002)(54906003)(110136005)(64756008)(7696005)(66556008)(52536014)(66946007)(4744005)(76116006)(8676002)(2906002)(478600001)(8936002)(5660300002)(122000001)(38100700002)(55016003)(66446008)(38070700005)(86362001)(83380400001)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlNobHBWNnFZMEpTeUZ2SFBuODcxMGpWZitiYkFRVHUwTGxwRDlpbTI5aEJu?=
 =?utf-8?B?Z0VNSm5acVVGSEdtQ1Q4ZjhvWWx2K0Z4Rjc5MjlZQlJ1bFlKcyt2c3VZYnRx?=
 =?utf-8?B?OXhMQnlwclcwdFVKeVRZNEFhQlM1QkV1WnQ5RDNoQmx4alh4UGorMlAxTWFt?=
 =?utf-8?B?UzNxSTZPT3gxRWNnbTZBdkU0TUlrT1ZuZkJFeEZIR2lGY0hTd09LSitHY0Jn?=
 =?utf-8?B?aXh2bTN6aGJpcklJVXdJenlreGRENHFUS0s1UUJ5eTAwN0hWdTNyUzJaS2N3?=
 =?utf-8?B?VURkTzhvRkl2Sm1tWDArNFYzZ0dzUjB4clkyd3k1OG5taTVrOWROc3N1a2pL?=
 =?utf-8?B?K3dKMlVUdFh6czhHTHZQYlhTd2loRkJ5M0YrdzVaVUc2WVFsRVlkL3pTZzJ6?=
 =?utf-8?B?Z24xNnI5Vk5xUUUwcEdkemM3bWZWRDNlTDJ5YUhVbmltS3dub1EvUERJRUNI?=
 =?utf-8?B?clZ0M1pNeUNPcy9pSkdtc2UwTlFVSEtUUFVnTlliaFY1amh4cGtTS2UwUWxp?=
 =?utf-8?B?ZkR3VHJuNWZ3YWk5bUl1NDZkRVhnd1R6OG5KODEyM29YZGY5Z3RrV0Rya2pI?=
 =?utf-8?B?ZTZIbjk3cWJzVE4rdW81YlA2bkJWQk1oM0xJOHlxa3ZSVWRFTUVyS0tYRXV5?=
 =?utf-8?B?MnVaZDZWWUJBbUxtV0dNMU9KZVI2Uy9YL1JydlJhMFZ0YVJ2M1c4VnJ2dGg0?=
 =?utf-8?B?Z0I0S0p3U1VvMjkreGR3bElRbTBZeTh1SllVYXUzeHlXc0hJY3JZczgyb3Nz?=
 =?utf-8?B?VEc0d0w0Z3RRYmZpRFJ1V3locmdxbm5KZ25pK0t6cUNVVCswM1ZONmpVOWRW?=
 =?utf-8?B?MDkwNGh2ZEdjRkVjV3ZYWXhPTzFJMmgvbWRrTjVlY1g0TlJvdEllelFHV1cz?=
 =?utf-8?B?aGFGdWRxVUtVQUVZSlp3b0poSXQ4RHdzek96K2M5K1M2NXVhY0k2dU9BcVpq?=
 =?utf-8?B?NTVKdEx4SzVPbVlkSUpoOVJta2VpNklPS0ZtY3RVNDNvTlJLMWU0b0lIeU9V?=
 =?utf-8?B?aXlQZjByV0g2MzVPdWtZQUZYSjV2aWhPR3JVN3lFSWZDV1pveDI3Vkt3RThp?=
 =?utf-8?B?WFNDaXU1QTV2RFhIZTkrZzVmRjFmUDFFeEhhSHNIMk9ibG9iOTZzRUNnN1lO?=
 =?utf-8?B?Tkdlanl2aWtnOEI1VnVlTGNPRDlDT0gwZlZkQk1PUHZoanR2dWRLK09TdVBZ?=
 =?utf-8?B?MEVsaWJCeStNYlRoVG10SjhoS29NNW1vb2gyL2I1Ymh3ZThDRWFMWEpzeFdL?=
 =?utf-8?B?WVBlV0UwekxrWmQxUmdGcU8xZEV2c3QxZU9vUG1DT2N6UTExcWJjd1RreTdp?=
 =?utf-8?B?T0xmbDB2SDVKZ1hHdjBQdjhKckhlN094aTdEdWw5WE1mVWFXMW5WdlROakNJ?=
 =?utf-8?B?b0J5NS9HY0Evem10L0orbTFXeUVoRVZBcUM3ZmNoVFRhOFhLbEpiblJIajhR?=
 =?utf-8?B?TTY5UlkxZEFTeURSZ0pCMUZLTzRmdVM1eGhUeDhQVDAzTE1yV1pqS1ZkREpN?=
 =?utf-8?B?dzhFZXZuOGgwOEQwc0dEWnFYY1FaOGZQUmxlT3FkSjVPbTBPeTFUZHlJN3ZQ?=
 =?utf-8?B?WG5ZU1JuYWZYRVE4NVZoc1VnY1ZwcDJGMkdqQjA0T3hOOEFqY013UHBjOEM0?=
 =?utf-8?B?MWcrUjduQU4wQkV4QWRGWTV2ajBxOXRxZ3pzUnV6M3VQdGNlVUFOOW9jZFFw?=
 =?utf-8?B?Vzl1c05DRzh2QjBmYWhyTWJwdUV0dURJUVJ3WnRPMkZDcGJDVmJ3NUNzZ0dV?=
 =?utf-8?B?NFZ6WGkrOWhCOHI1NFNLSnJSS2JmbjFJcFhlSExOT0VDRXJtL3FmV1NIZUw0?=
 =?utf-8?B?Wm5RM01NcjBHZitDUkpLTGdzRjZ1akc2d0N3VFQrZmplQmRqbnpabld1b2Fk?=
 =?utf-8?B?cTRoeUV2V2lMQ3hnZWZ2emtUakFXTlFaVENEUXBjQU9HMnh5KzkrWHg1Sm5M?=
 =?utf-8?B?ZXZnY3pqZm4weXJadlcxV003VjdBR3hMOEh6YU9MWnVpYW1qUmhaMzlmUzli?=
 =?utf-8?B?eER0Qk9SVHQyV3BkYU54TXZudTBrNjVwYWFIMU5Cc09FNEVPMFlNMkU5NWNJ?=
 =?utf-8?B?V1k1MTN0dkNaNVA3ZWJ0b3gxWmV2WnJERVAzZXEvVnNnTTNLRjk3aDBsL0o4?=
 =?utf-8?Q?Yf9UgQULL93qfvjzvaJNVyw6r?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Vv6yCg5vddbSDqKGpGEAxiKuwcoNNJVkFxWI50H/4q/0s0F0lOzULN0fKJDU0IfL3O1Es8xjFU+KXhNCqOmpQDLF7YVJll912/EXv56qJg4vt8h+jXBqFv+ANUZJRBDvhZDjT4l25RaitZFwUSJ60/jE4wW7TrdZ84AqAGieH1Zbjmqn5I7RKtlTO/2u6zeyvnRIeQt3ihOMIpoEMXbc36piXpgMDyEV1jZkgnsNvYbEZ/zbx1d/5eKJ+bSd+fMejk1lKg0Xq3QB6qEsIIRkpA0xZYSVu67lj+F8pFW/d4uQhHOyeAukZhGchNuLicWjIdGvw/1cnPlC6TKIpL97TzihkOU4p3Wj9Co5qZqNL2bHmjqsdThVKaEYS0wbhbooKI1pSqtRjfWjz/N6csIi2itgD2smtUGXGICDhgux3lrdRGuHAiiRnKSzzxUw5kIm4izx57mWafH4Czanb8ikgqrNcql4BcurvYejPwy/j0EWpXBJ6NcvcXFYASc2iCiU1GGVT4f7b7VKWbhJhfVcIhtvdYwNyiPJNrVh3PKoVag4DNpsuZRxyHHwdCQDcdf8dxiYtbhTpgFBv6DaCpN7Wc2QPdDYb6jhJm0oDcAHqTGh7f9ExwUeOLXYyjwEQO2XBEHoJP8tATc/4AzVOOL3oX8lGrOSIw61NRU9XyKivdZR37inq6/GVrvWvzBv12QAtfFJa6HnTxNiRbyQB6+T0Xeu1HvqSk1AIhAg4jVNS3n64ukY7J7Q3oba0q9kRYzBvOBEPWeCLenYBYKfOrrrVA4bhpWft3Fvl+GPWY/4Z1qzHoHFutTNNqjt1ukGPh0x
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5765597-2822-4236-0eaf-08db1ada6948
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 04:55:57.4267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aihqWXP0tOLPXd12zoyHQ9u7AaEsBs3MVpPvHOh2m2sv5+RWEGOD2zzdpxmNLqjcLcj0ennNiYIyMlqNgJHc5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7767
X-Proofpoint-GUID: ipGcFkFQTB1HxpJtcB977ccVwDVwCLO6
X-Proofpoint-ORIG-GUID: ipGcFkFQTB1HxpJtcB977ccVwDVwCLO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_01,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=627
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020036
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
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAyNCwgMjAyMyA3OjI0IEFN
DQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+OyBxZW11LWRldmVs
QG5vbmdudS5vcmcNCj4gQ2M6IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7IHBoaWxtZEBs
aW5hcm8ub3JnOyBhbGVAcmV2Lm5nOyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5jLmNvbT47
IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMTMvMTRdIEhleGFnb24gKHRhcmdldC9oZXhhZ29u
KSBSZWR1Y2UNCj4gbWFuaXB1bGF0aW9uIG9mIHNsb3RfY2FuY2VsbGVkDQo+IA0KPiBPbiAxLzMx
LzIzIDIzOjU2LCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiAgIC8qIENhbGxlZCBkdXJpbmcg
cGFja2V0IGNvbW1pdCB3aGVuIHRoZXJlIGFyZSB0d28gc2NhbGFyIHN0b3JlcyAqLw0KPiA+IC12
b2lkIEhFTFBFUihwcm9iZV9wa3Rfc2NhbGFyX3N0b3JlX3MwKShDUFVIZXhhZ29uU3RhdGUgKmVu
diwgaW50DQo+ID4gbW11X2lkeCkNCj4gPiArdm9pZCBIRUxQRVIocHJvYmVfcGt0X3NjYWxhcl9z
dG9yZV9zMCkoQ1BVSGV4YWdvblN0YXRlICplbnYsIGludA0KPiA+ICthcmdzKQ0KPiA+ICAgew0K
PiA+IC0gICAgcHJvYmVfc3RvcmUoZW52LCAwLCBtbXVfaWR4KTsNCj4gPiArICAgIGludCBtbXVf
aWR4ID0gYXJncyAmIDB4MzsNCj4gPiArICAgIGJvb2wgaXNfcHJlZGljYXRlZCA9IChhcmdzID4+
IDIpICYgMTsNCj4gPiArICAgIHByb2JlX3N0b3JlKGVudiwgMCwgbW11X2lkeCwgaXNfcHJlZGlj
YXRlZCk7DQo+ID4gICB9DQo+IENhbiB3ZSB1c2UgYml0bWFza3MgZm9yIHRoZSBmaWVsZHMgb2Yg
YXJncz8NCg0KT0ssIGJ1dCBiZXR0ZXIgdG8gdXNlICJody9yZWdpc3RlcmZpZWxkcy5oIi4NCg0K
VGhhbmtzLA0KVGF5bG9yDQoNCg==

