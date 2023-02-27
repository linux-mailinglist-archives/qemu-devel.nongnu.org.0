Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7366A47E0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:27:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhFk-0002D5-Dg; Mon, 27 Feb 2023 12:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWhFi-0002Cu-D7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:25:30 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWhFf-0007CD-97
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:25:29 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RAolL9022989; Mon, 27 Feb 2023 17:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=TzKB5yD1Wmi2mvAUXNPI4lf1aolBHH2JbykQpxgI3eU=;
 b=V2hOjb9NxMdeepLycAemrgR+hBjHetFf/VI87gXjpruaqgatfQvC4VkCAEH+P75oxKdo
 3ltuJhtqPIHdfGr8Br6JA5eGz6rvhI48+K8HbSYL3as0mu2ydTCv/VT0DpPjII10IAEm
 eAsRtEk8kAXM2aoKe+ZtHyGuTS4uvIlJG93wqnOJU59HaKEf0Xrv79Y0TppxnnTXDO6u
 ro0MQt4MqtKmC23aDD19/X17gMn3hxbcd51lpMUHTsc+6OBonBbInVNwEHuZRoZY2s3G
 M53XArG4QX0A/bIz/qIpWKGcxo01tYBKAv5XkvwB7RdF/J/6nlTWSxjHTuMLDM6y9St0 FA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p0u458y0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 17:24:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlHUNdjZjRfreg2W22TfC78wQ9P9ETB7OSJCXwm0XnVaazieeCn2GzbDaQYjytIO1ZLllZTW/1GZ4YjMpiNJyoKs9QOzNzhiWl0Ac0SHFZvIL3OEWcqYC1Z351uW7CR0yp/xikMbkcAdI13i/bNiyMlGTqzC0ArVGi2NWeGFH927cksuCFW/8VwV3wj+HyYQpJNLXODYd0EoLElYtt1iCewq2x931S4lPN18x3vw+CtZA/8g0Fni5o00dSzs2OglhM1FpDNthD2NobcLVtoABTy0mdjmXOQS/abNWXq7V/u5rEwtoF1U8EfgS7uR/+Isfk0k0ONvYg+cH7fE6WnstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzKB5yD1Wmi2mvAUXNPI4lf1aolBHH2JbykQpxgI3eU=;
 b=EZ3H2RgAtGw31/T8qvkWw1ikYrI2ucKJLy233fYkzhel02tNn/l0Pan1cxWkR19Fpap0AHtaybqfhqTAEstPk6Mtk/4Oc0YGTZ5QOBu2zKRS5F9Cyp6f/i7bGmyek88MkDHlxBx55Y8vHZHqpwEL6C8exhXjwSpSwysmkvqh/azMGNunCXnNGi+b/PusFulHlr033ff0RUdLqyZDxD4r376XrmSfUdvIz54gdphV9aXYgtIouBoUmfJRAr2Kz4xub4pjotRDUWKwvmajI72MSmGCMe/aF2dPlHgkbc78/nJz1fk7E9Y6/8Lm0A4EgxqXYJTcYmhT8L66iplJFDc2ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CO6PR02MB7828.namprd02.prod.outlook.com
 (2603:10b6:303:a8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 17:24:52 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 17:24:52 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "ale@rev.ng" <ale@rev.ng>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "mrolnik@gmail.com" <mrolnik@gmail.com>,
 "gaosong@loongson.cn" <gaosong@loongson.cn>, "yangxiaojuan@loongson.cn"
 <yangxiaojuan@loongson.cn>, "edgar.iglesias@gmail.com"
 <edgar.iglesias@gmail.com>, "philmd@linaro.org" <philmd@linaro.org>,
 "shorne@gmail.com" <shorne@gmail.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>,
 "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "atar4qemu@gmail.com" <atar4qemu@gmail.com>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>
Subject: RE: [PATCH v3 24/27] target/hexagon: Replace `tb_pc()` with `tb->pc`
Thread-Topic: [PATCH v3 24/27] target/hexagon: Replace `tb_pc()` with `tb->pc`
Thread-Index: AQHZSrLEMAdCbAYmiU+jMPo5wGjueq7jCzTw
Date: Mon, 27 Feb 2023 17:24:52 +0000
Message-ID: <SN4PR0201MB88087BFB2F3BDF818D93FB29DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227135202.9710-1-anjo@rev.ng>
 <20230227135202.9710-25-anjo@rev.ng>
In-Reply-To: <20230227135202.9710-25-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CO6PR02MB7828:EE_
x-ms-office365-filtering-correlation-id: 48385284-3976-4f85-b25d-08db18e7892d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /o1E0DI9Lh/fp3YPXFmMaAeoO4qfgw/b6fO4GSijLMkjBEstWdD+9FJUIr+6xpSzpI0TaaFjiZpvdBhBU5XfBR3+tOvaxHVUdlF+OVc3WpumTcg47kBIX2VLcCp3yfMrbqrPGEDtRSWPT9zPzfLLAfLOSEMYN2tGO+pXQo5JM6IGyeT5+VPrbdGkLOAiDMjA/kwhhht50uCpIVLIwIricaJ1zAHkU172CGuzOitxMdSZXkZ780UOH+vQwkAuYiTOczAB944t3/d0UibHIIGyVocb3I45hvaHcuQopvc1jrMg6wYWkwcS+M1OHqjmOPMUR6vmynyK5jopJEeGWk3MtZXULB1t7VKY+WDy1/CfZyrJW+YLqMK/Q3xAOFwxnE58oOSB8Jow67NSg01XpE/k0I++L8aYGabsrCEJJ1TXiY9qtCalaK8ln+XtX3/nrwxQ6gG04gRlWcqz9kf6hVMyDsDe4bzDmB2urrztASGqJ1tYEZE82ayDbCzOjXzdoeAf3I+ppMqZIPklKLb27urVxZwfqmIijdK6VdJmCbhsTL86ld/bVmvb9mhU/xWeQ76vx+vocFzJ1st6+zcB4miu2gY1DTuPXEX2zlhEe0XhSVPaoSgr5qQy7Ni3fP/TEFMLVekE2RppuJYEjgkh+3+Axomfwom7HSF2wdGbH9bGEYjdCp69TP+He99nSv+OpmyD/d8AGq6y9Y3n728t/qskm2k+dTCsA/o4PzkeWUisslQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199018)(7416002)(33656002)(5660300002)(52536014)(86362001)(55016003)(8936002)(83380400001)(478600001)(7696005)(71200400001)(66476007)(26005)(9686003)(66946007)(186003)(8676002)(76116006)(53546011)(66556008)(41300700001)(38100700002)(38070700005)(6506007)(66446008)(54906003)(4326008)(110136005)(64756008)(316002)(122000001)(2906002)(81973001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUpRbkh1ZmJnKzVLNzNsQkdQeTdiQlQwQkJSWlA4c0ZQSGdtK2xIQmcvbWwv?=
 =?utf-8?B?RzVnZWlqV1RobVlySVVvaWhSNUFiOGxDVjBtMnp1clp5NFF4ZnNLdHRvWW96?=
 =?utf-8?B?cG1tZTB1MUtkMUxtTk9FREg0dFcrQlZPekU0L1BUa0I0RlpoUzBFcFRjTmhD?=
 =?utf-8?B?SXlZM1pVbDZRT0thZ0RsbTY1SXN0NGJkVTNoM1E3bmw0SXRDYWZUZzJGaUtD?=
 =?utf-8?B?RDF5VTBRTDRreml0VHgybk9MMnZOR1U3bGhPWFk5NkVzbWsxNEVDQzVUNXk1?=
 =?utf-8?B?WFdRaVdyazAwSUdvK0Q3aHA5ZkZ2b1lKVmFoUTRmV1FCYnZobm44WHloSmpK?=
 =?utf-8?B?U2lnWGJJSDh3L3BZV0t1S2t6d2ZveXVzZDFSZVhrZlFJMDZWVGxJYkg4RnN2?=
 =?utf-8?B?Tit6NktXcURvT1MrdEZoajB6THpiT1BVcWdJa3VLVlljTFRBcmZ0KzM4aWpR?=
 =?utf-8?B?Z0xFRFF2bkc2MlZwR2tjczVwdXFoVXFLWldjYkZMdjFMRytNdm1qZDV3dmYx?=
 =?utf-8?B?K0ZON2MzOGV6bzAvOTRXNCtXcWlWTmEwdTFRNHZGUm9Ya0kzNE9Yb1JYQ1BK?=
 =?utf-8?B?dlpvUGlEenNJUzN5RUxqQnZ6aWsxVGdkQU1IRnpJcnQrNFZFRVBYR2QwQUU1?=
 =?utf-8?B?QVBsUEMyTlNncldWVnU1ZGMxSEY3anRSQTF5eTNGOGZONzc0NnNYNlBSdUhW?=
 =?utf-8?B?YmpHQ2thZ2lVQnNGbnQ5MjFTbjRFZjVkaXd2Rk1IR2NUUHJWZE9XNXd5QmVC?=
 =?utf-8?B?WHJ6TGZJUzQxRkM0NW9SWHlJaUVMczRhUlkvb0gzREZpMUJXeVhLUEw3aldR?=
 =?utf-8?B?dTM5bmdmWi9INlVncmlNNElsaGR1QXVOc1AwZ2tjMWhlRUZBK1JlN2NiYnN3?=
 =?utf-8?B?Q2d5elNLNS93K2lNcTRIZDZ0RzhWdExBTVJ2R3llZmVsRmhVRnZmbmF1Nnln?=
 =?utf-8?B?Y3U2UnQ2NTR1eDZ6YWszdU4rREhza1E4MmV5ODF2Mkc1QXBpMUh1cytISlpy?=
 =?utf-8?B?MGhEdlpjMzBES3YrNk82RUhxQVJ2bTlydVlWNlAwUmtjTzBWWHRhV0ZCVFlm?=
 =?utf-8?B?aGFkZXM2YVQvVjkyMWZQMDdPNHRxeUNwYlBYVWY1U2N0VUw3NEd3azdJWFYy?=
 =?utf-8?B?MkZKMnBsdlBYeS9mSUs4L3Jjcmx0VVJCMUJZMXJUU3hmaVZ3dkVnRUErWTBC?=
 =?utf-8?B?d3lCRFJiYWRDY2FlUHJCdU1kdW5wMjhpR255QmpwWE9DQnlPa1pZcFk4RW1j?=
 =?utf-8?B?MHNGbDM2UXN1SXRhMUtta0lSTXNLT29LVUI4c2c4WUVWK050dllzTWdNY282?=
 =?utf-8?B?eFg3Uy9oV2YvVFdJQUZUc0lmZWFBcDBRTUxpYmsvdGJ3YUF3OW1wM2VpRXNX?=
 =?utf-8?B?MTFVYW5oWVZMWWpCMWoxd1lVSFIxV2MyRlpFWTVRN013UXFOMnRnWndiRFpt?=
 =?utf-8?B?bWlXSHJEanlWdElUcXhwZU5SdHVVdFIwYVgzOE01T3RkeGpRcGtwYW9kbXYr?=
 =?utf-8?B?a3BhSkFHSUZCdmxOcXZnY3ZLL0xZbFR1eTB4VnYybVU1Nnpld0NqVlhHZVBG?=
 =?utf-8?B?Y0s2SkFaWkFONXh0Qmo2NGpqYXpHVmVjWWdDQ2toVVQxSE9VbVlkWG5CYVdO?=
 =?utf-8?B?VUQxb2hEcHZSVXZLQWg1cHFJY2wzT25ySFRLWVJkZUZHcTRwNU56cWRZaVBU?=
 =?utf-8?B?VlZvNjUveHlqRk9oYTE1REJEMzdFSTV0RUxLZEtaekpyQ3R0VkdROGs5K0No?=
 =?utf-8?B?eHRnQnFhczNad3FFb3RJNHh6VlBSY1Z0bHVzbytqVDhkbGNCdThLRGJ2Nmxu?=
 =?utf-8?B?cXppSHN1RWwwNE5kZmJLS254cHhCY29KOGhUSVlXMkVkZkF0Z2JmL2F3cSth?=
 =?utf-8?B?SmlPOUNSZ2xGekduMnVVQWdyZ3lGMmtpSG5scmdlNmh6NVZuT2NwN2ZwRFVV?=
 =?utf-8?B?WnhTQzBnSEMrSG9memxZc21tWWRiMUIveU5sMDkrUXFDcG1pQmlpVHhXUFhK?=
 =?utf-8?B?b0JiOWpZZUYvQU1yREgzUlBIRlMrTHZhNlJkZTcxSVFWTVdoYzQrN0JWY1dj?=
 =?utf-8?B?UEJzckM5UTU4NFZyckZ0cndRQjdyc21rWGl1VkxZU2FNWmRVSFdybmdNbFph?=
 =?utf-8?Q?rxEdqcvU3w+PuWj7X2Gsrs6Kk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?eld6NnV4UHNBS0tTaUdEUENCWGNxQ1pVMk00V00yVnVqR3hLQnpONVVtdFdC?=
 =?utf-8?B?RFROdEROT0ZGVXlIRnNPYWJXUks5KzNBdGp6N2Y5cmdBNjlsend1U2NIMll0?=
 =?utf-8?B?bXNCRWR3SHMzZFpjdjFJdVIzenYvcitDYlJGMHYxNmgzeGVDMWphV1hHR1JK?=
 =?utf-8?B?ZklyeW1FTTFiSVREbzBFVU1XM0VMMk5VUHVpK1BsTXgwM2IyRUcyRGM0bTBi?=
 =?utf-8?B?VGx0OGcwQ2thbUhVc1lTdW9jUVhOZXg4RERSWHVrekJtMWhTczAxZHo1Uytq?=
 =?utf-8?B?MVUvTEFMeG0ycFRWOUJPNEhIWWlNVmZGQ1lxbFFlWndZVnlaZ2NwVjZtbkVo?=
 =?utf-8?B?ZHdwcVVvTGxLUkFHaGpWUit5bFNlazV3YnJ3Rk5EQVl4aVBNckFYK2tUVFBa?=
 =?utf-8?B?TkZMQUpIRXQzMGJHOU14eGVYQWJFSml5UFp1UytRejN1eWZlaTZva0YxLy9N?=
 =?utf-8?B?d2RqaEpXQmU5OG5yK0pXNG5xWkNoN21keGQ0Q2NRdWNBQUZZYkdDRVE4NVd4?=
 =?utf-8?B?b29HN2dPdnFPQkdtNDVibk4wWTVjdktqQnh3bXNWZXhzRHhxYU1NQXJCeVVT?=
 =?utf-8?B?YUZvZWw3SEpVblBhLzNWRThSeE1hZ0J4TU9MQW9pdGh2ZmhML2FUZ3NiWTkz?=
 =?utf-8?B?QUd2Ry9JL2RQWm5mL2hwUk8vRWpOUk9COVNERFlKNEJKeXp4ZThqREg0Wmh2?=
 =?utf-8?B?aWI2Nm1BKzY5d1NpWE9XTjVNeWxvSyttUm1QUzBVZ1k1TnVMZkRyS1EyU0FO?=
 =?utf-8?B?NVUrdDN2cWlKazE3eEpCRUhtR3FBcE9hQjdEbkRaUlM5QVNrajBQc1NjTnNj?=
 =?utf-8?B?U2N4UHhla3g1Wldtb2lEVGloY3FSSEFLY2ZaWTBseFEzVXdBcTZxNmM1MkJS?=
 =?utf-8?B?dlRFbWNCRFRSK3BoZC9FUkhqMWVsUWZZT1l5VWhzMmM2R2E5engwRVBCM0lk?=
 =?utf-8?B?ZzQ2Q2tCY1E4VVhKTlAzTGQ0SVZMOXJabk0vL29vYXZoWlZtWnRMSDNsclJz?=
 =?utf-8?B?bGZxYTBzZnd1VzhxSis0dEZHMXZFQ0hDT01ZNlhDOVdDcjIxVlM2dnhuRllB?=
 =?utf-8?B?eVI3QW5OZ20rUHBpRTBhNnpyd0Y3QjgyT0VIRHhzWkRnQWxtTUFQMG9KV3NL?=
 =?utf-8?B?OEUrVUxPeEZ5NzJwckNiSU10WDNWbEhFeFlSQnp1OVJZMnpDUkJVenBZTFhI?=
 =?utf-8?B?ZGxHMVl1d2ZlbjF0YWpFU09pN1F6c2RNUGJjM1dIdXFyVXFNRXp3SWtOVE9i?=
 =?utf-8?B?OHIrR2MrTGZNcEdKWXQxYW1SV0haeHFtVmpMdnJ1UVZDVTBSWmlhck1YMGpP?=
 =?utf-8?B?V085elprQXF1RHpGV2lybEV5Qm5icVROK0ptS1ZGd0xraGk0L3prOXIyalFV?=
 =?utf-8?B?LzR1TisxcGlCSy9MM0ZMSlVjeEZkaUIxNGhRdFpRSHNEeXA1VFZVQ0FzOTNh?=
 =?utf-8?B?V2JqNTBRUno3NkNUTWhxTm13ZXZHaStxd1VUSjRtZVFqWkRLaFY2bTdpUG85?=
 =?utf-8?B?MjJqeDU0UEptMmcvbU9BNGY5NTVadkVnMlJocG1BcGN4N3ROeVhFcW1HeUsz?=
 =?utf-8?Q?+OZbKDotTw90JNSa8JCTzetNM=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48385284-3976-4f85-b25d-08db18e7892d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 17:24:52.0417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VUPxrhasv0tEmQEl8CE/1iVMl3TI9Oly1/66bawhM33RBcGXxK7Y7iGgbVSd7RxGJe0A9a2M+WWC4u6czCEwxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7828
X-Proofpoint-GUID: NLSOvc6H0NFF4a0tLHjZ-gapamfesI6I
X-Proofpoint-ORIG-GUID: NLSOvc6H0NFF4a0tLHjZ-gapamfesI6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_13,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270135
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
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAyNywgMjAyMyA2OjUyIEFN
DQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGFsZUByZXYubmc7IHJpY2hhcmQu
aGVuZGVyc29uQGxpbmFyby5vcmc7IHBib256aW5pQHJlZGhhdC5jb207DQo+IGVkdWFyZG9AaGFi
a29zdC5uZXQ7IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgbXJvbG5pa0BnbWFpbC5jb207DQo+
IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IGdhb3NvbmdAbG9vbmdzb24u
Y247DQo+IHlhbmd4aWFvanVhbkBsb29uZ3Nvbi5jbjsgZWRnYXIuaWdsZXNpYXNAZ21haWwuY29t
OyBwaGlsbWRAbGluYXJvLm9yZzsNCj4gc2hvcm5lQGdtYWlsLmNvbTsgcGFsbWVyQGRhYmJlbHQu
Y29tOyBhbGlzdGFpci5mcmFuY2lzQHdkYy5jb207DQo+IGJpbi5tZW5nQHdpbmRyaXZlci5jb207
IHlzYXRvQHVzZXJzLnNvdXJjZWZvcmdlLmpwOyBtYXJrLmNhdmUtDQo+IGF5bGFuZEBpbGFuZGUu
Y28udWs7IGF0YXI0cWVtdUBnbWFpbC5jb207IGtiYXN0aWFuQG1haWwudW5pLQ0KPiBwYWRlcmJv
cm4uZGUNCj4gU3ViamVjdDogW1BBVENIIHYzIDI0LzI3XSB0YXJnZXQvaGV4YWdvbjogUmVwbGFj
ZSBgdGJfcGMoKWAgd2l0aCBgdGItPnBjYA0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW50b24gSm9o
YW5zc29uIDxhbmpvQHJldi5uZz4NCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICB0YXJnZXQvaGV4YWdvbi9jcHUuYyB8
IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2NwdS5jIGIvdGFyZ2V0L2hleGFn
b24vY3B1LmMgaW5kZXgNCj4gODA3MDM3YzU4Ni4uYWI0MGNmYzI4MyAxMDA2NDQNCj4gLS0tIGEv
dGFyZ2V0L2hleGFnb24vY3B1LmMNCj4gKysrIGIvdGFyZ2V0L2hleGFnb24vY3B1LmMNCj4gQEAg
LTIzLDYgKzIzLDcgQEANCj4gICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiDQo+ICAjaW5jbHVkZSAi
aHcvcWRldi1wcm9wZXJ0aWVzLmgiDQo+ICAjaW5jbHVkZSAiZnB1L3NvZnRmbG9hdC1oZWxwZXJz
LmgiDQo+ICsjaW5jbHVkZSAidGNnL3RjZy5oIg0KPiANCj4gIHN0YXRpYyB2b2lkIGhleGFnb25f
djY3X2NwdV9pbml0KE9iamVjdCAqb2JqKSAgeyBAQCAtMjYzLDcgKzI2NCw4IEBADQo+IHN0YXRp
YyB2b2lkIGhleGFnb25fY3B1X3N5bmNocm9uaXplX2Zyb21fdGIoQ1BVU3RhdGUgKmNzLCAgew0K
PiAgICAgIEhleGFnb25DUFUgKmNwdSA9IEhFWEFHT05fQ1BVKGNzKTsNCj4gICAgICBDUFVIZXhh
Z29uU3RhdGUgKmVudiA9ICZjcHUtPmVudjsNCj4gLSAgICBlbnYtPmdwcltIRVhfUkVHX1BDXSA9
IHRiX3BjKHRiKTsNCj4gKyAgICB0Y2dfZGVidWdfYXNzZXJ0KCEoY3MtPnRjZ19jZmxhZ3MgJiBD
Rl9QQ1JFTCkpOw0KPiArICAgIGVudi0+Z3ByW0hFWF9SRUdfUENdID0gdGItPnBjOw0KPiAgfQ0K
DQpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KDQo=

