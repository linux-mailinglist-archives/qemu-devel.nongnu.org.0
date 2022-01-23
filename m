Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0399E4972F3
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 17:17:07 +0100 (CET)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBfY9-0006Wd-KS
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 11:17:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarths@cadence.com>)
 id 1nBfUr-0005pg-Lz
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 11:13:41 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:58356
 helo=mx0a-0014ca01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarths@cadence.com>)
 id 1nBfUo-0001zS-Ln
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 11:13:40 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20N1ojHZ023020
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 08:13:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : subject
 : date : message-id : content-type : mime-version; s=proofpoint;
 bh=4M8InxURqo7qnOBioiJo6tvqwQPlCa3czxfNv9PuEYY=;
 b=ioe05hRwxGAIQGtnNwK2kt+gtOCD7c09WaC69FMvYBt3vz4WfY4l/5nm6iAlB/LivWfb
 raMVflra2Kn3hy/PCJfKBTe6MQtXZtShxBxRshsIalE+hpOocMza48SeXy+RPviWH8pt
 Jacyj/HV0JdwLoK+NQn59hpcMhtzX99EtQx7+k2eqjtuR81SLS0koUKh/DTgTxAzPhqf
 2MJfsfA2m5kx7pirz+P/FXSjqas7sTHaGSRc8yzg8GX2KSVMGtO+CR2apEGp1ez7kVEt
 vxWv1Jsqm5sc6MoP2wr8nPVvPyeDsPfZhyuzKcV9m/k7D+8SiJjgcvZ4KIfHrd6tNLaS 9w== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 3dred2u1bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 08:13:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hd59BhV2m2TV+iK/kegd8pzi6mtRihOqA4Ru4pcmfqY2jrEWsv/iQLK9Cm58wbdhd95gTNONlIiRs45X1Jebe9LHm09m2yPeTFRboPFO4v84fkSwG8g1ojBJeqFuZQsmzwkK6ZRFt0u0w//TSJsGkaBEbYI0ZL9V8u5IGBdE7j4avXRRZjrnKq1RflHbOxUPyBTXDWEk/5sKNH10dlUn4ewOlhpaJq9QAf4zks4G8HfC2j1NFiRaaZX+c1gVPOojaQ+TmzQV+z0/3f1XjLnQfefP8NjAsnfZFSsk8Y/9Yd4zVk7AJrSlwlHr4aJ+IsFF5JqLhWFKSps2BEc+D8Pl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4M8InxURqo7qnOBioiJo6tvqwQPlCa3czxfNv9PuEYY=;
 b=d2qYnZookoSpVjbBIJEBQ9vZrw0cs+Y7C43TwXWtnrzOZntT+4GqRxGXzn8mTlueXEnnq64IfhWau9+gCceAVL0E/W//F5Rf8NJHIaMGmDg5Ok/II+Vt1i6xp9lgnLC/7Er8ct4wSVMwLvwlTz0WbqOynlZUOrzHSuKmUZQiAEth9lKaJAAsTdEG079R9US0DXBSgJ53R0UsqxSfE7DijqASN0NLMN41QnvTWbdO0RvCHpohUuZHtoBi4Dw8WTWbW8lJpX1t22yMmRzcFCyXINm8pF2KFSdy/+CrOHCo6AwGtgYX9GIhFYs/L/I/FxVmuQZpzqVgGuI5/pK2QCGf6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4M8InxURqo7qnOBioiJo6tvqwQPlCa3czxfNv9PuEYY=;
 b=cohqdMJSO7WiKXxPvYCrlAgGuywkwT3SPWmOWUpgi2GaRGwGHHhBidkKWw9ncyxv9sCBw/VRTlCRaUbJ5DcME73dTJDI2+46d/R00Nxamf2y0ceuz+niPLJ5dQn0CE9Zti/DJ78wyOpvSSdQO8os/GXLjQR6JJXUnZmxxC2T0GQ=
Received: from DM8PR07MB8920.namprd07.prod.outlook.com (2603:10b6:8:19::12) by
 DM6PR07MB5354.namprd07.prod.outlook.com (2603:10b6:5:4c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.12; Sun, 23 Jan 2022 16:13:29 +0000
Received: from DM8PR07MB8920.namprd07.prod.outlook.com
 ([fe80::848:5ed5:fba2:ba2c]) by DM8PR07MB8920.namprd07.prod.outlook.com
 ([fe80::848:5ed5:fba2:ba2c%5]) with mapi id 15.20.4909.017; Sun, 23 Jan 2022
 16:13:29 +0000
From: Samarth Saxena <samarths@cadence.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [CXL HDM DECODER PROGRAMMING] - Question: Does Qemu program HDM
 decoder register of the CXL endpoint?
Thread-Topic: [CXL HDM DECODER PROGRAMMING] - Question: Does Qemu program HDM
 decoder register of the CXL endpoint?
Thread-Index: AdgQc7ud3/feMLhQTYeOmIlJlCgwmQ==
Date: Sun, 23 Jan 2022 16:13:29 +0000
Message-ID: <DM8PR07MB8920E2DE0A0435025B4C0E2FDD5D9@DM8PR07MB8920.namprd07.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXHNhbWFydGhzXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctNjNkNDE0ODYtN2M2Ny0xMWVjLTg1ZTctZTRiOTdhMDFmMmI2XGFtZS10ZXN0XDYzZDQxNDg3LTdjNjctMTFlYy04NWU3LWU0Yjk3YTAxZjJiNmJvZHkuaHRtbCIgc3o9IjQ2NjQiIHQ9IjEzMjg3NDI4MDA1MDUzNzk0OSIgaD0iekdSOGFNWG1Cc05pdk9XcVlGY0xsVnFRUm9NPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c14a0171-ce4c-405d-e5be-08d9de8b4b95
x-ms-traffictypediagnostic: DM6PR07MB5354:EE_
x-microsoft-antispam-prvs: <DM6PR07MB53547C60157E6C549A39C911DD5D9@DM6PR07MB5354.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LBBXOOrS25l5HwLCrfOr0k3FxzjsDYMV2+oKyQdJ1gQUSneHVXoAj6LJFbqSiU9jS65BKFxAkDElO3Nqj6UipSgKTmgz6c5mPF+p7FXiiTg0Nh/q8+xENlGlmGNTX9ER+ixdhnX1RVb3epsE4+VNQkkurJ5A7/7huFzUaoxDTvBIhKtsy6XWVTYVzvc6S6ObWRpQV4rKfPAqToQo+MMutFLKaaNojWDO6/nAYeiotfKG2epYMzrcPO1ceY9/RnmRBcSMhX59wnMoDgoIocdeQCGOsrNy/WLEc5K4TjOJhH110tMxATaB01np8X1Q0bU96nF87oySiSsCQLpg6FOFMBPgbp2qbM9dSENpGOdtGAgNHd73mQ3HELaSPqNkJ2yvrPawKUMRNDBfofnuTEaLSwBJN5neOQBwMhilBpYeEvnp4uK+yaba6WbfS9ceu2XtmaftP5NprCqm+7hkZeFeNbqCMsm/etPkIW0cXV6sTVn/QU4mhKu02IpP9RdbzVxeFwYVVdCTejQtMX5370mrc4ios0D0ezGaUpFEEGTTQgjy8xEDDkVpkJrQbIvH9HQIHD0ohIJval5HSniNq0FZm9HAaBXCg45pzjTIo13Nn0uJ4/RA7Ksrmu9EL+vLMgC+J4rT+iScHoN7RtXelpeWBF0JUx0F5yV6SLNnVYizpjUV5f+GR3EW2xKuQlsertgqwxWGpiC4zVq81oBNRkvUGEoPwDbfUVBSZUysPjU4ebEf4Et1/jaWzGOKVOTR2eRs5Ys8J1aAzXZ9dsmbD0DeVLOFzzUC3NIbq92OrI+Cj8ILiNNfPBDIdmqYytn1cyg7vtYnvWg2/hMorwh+cPXk3N9tdkK7LMyz9dcqs7pOmL4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR07MB8920.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36092001)(5660300002)(6916009)(26005)(166002)(33656002)(8936002)(8676002)(316002)(9686003)(71200400001)(4744005)(21615005)(66476007)(52536014)(86362001)(38070700005)(55016003)(186003)(38100700002)(66556008)(64756008)(508600001)(7696005)(6506007)(9326002)(122000001)(66946007)(76116006)(66446008)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?31SFLJT3w3n/hR1O9r2djoBortEGEcFmP+aKnu2b10MfuIbH/E+EjIEse9ej?=
 =?us-ascii?Q?zn8EFwJJo+xLlHFdLIAQ8A8D8Pu/gvAB1C+zh72BAf+hCR9FdUBZQnfMSpfj?=
 =?us-ascii?Q?SmXVIQFq+wRveNZjlVNPkAQFESQNGyvv69fJkPxgnsHw9DV4pQjLadiiD6Bh?=
 =?us-ascii?Q?Y88OCzmFrUx/b1iKvo/LtDhAtmYwNXk17+zgQWslnZkUKL/c+KOiJ71x0Kga?=
 =?us-ascii?Q?jL+hHoERB5SInOA5sydQ8u4hEEeRrN31i35K326nZnUcrAIuoIRlq5QhCPJ2?=
 =?us-ascii?Q?hDUmtz8E5JUZ1DPadCkgpl5kqtct0ydL2vxsK+JKd9Oo8WFb5XsUmninLtAq?=
 =?us-ascii?Q?YsfliADRzjGiLCKanDV/hP9QQdSH9HCtCRrx5f+b577zSNlqCdgYjwx+X19X?=
 =?us-ascii?Q?lNuA1OR9zTV5ViLZMFTfBD69knFE5xJpFAt0QERQ2RxWqr+OOsby/kUDj0zA?=
 =?us-ascii?Q?vR/IsDq50n32Qw83lpFcdN7H9T3QUIp3mIeS660nDhY5cU38wJcg6hzgFAz/?=
 =?us-ascii?Q?Zn/zV0uM8iS51pzdO1+xLJ+0uAM5b4pDSj+l2m92p/8qQin8xOkhbwZTcPsR?=
 =?us-ascii?Q?lzjQhyeXD1IuE8a9LjVPVMP61Yv8qO7VKSrB+vnsyB/ca2ByjIK7NLbfRB8x?=
 =?us-ascii?Q?mQmm4WcG3Yjv7V7iRm1eKHlZAXuSYmNP/zejoLcFQCoLEn/ANynuUvmMs9kc?=
 =?us-ascii?Q?0WIBQwabg6UzAHqBlkR3x9ZM2zJ17+yTuWbzkbhqGHN2/Of6OUUTptvcu03U?=
 =?us-ascii?Q?gkjMq9WQ16UmaV/PkL2ifWxonP5TIkeU59Z8j2t2L9yXvsK+vqV6OgkyK9+l?=
 =?us-ascii?Q?xftXPNLJ7dzISLh7baNdmwZu7pZeUtyEvfZd7sLhlii10n/HHa0ujzLzldJV?=
 =?us-ascii?Q?YycTDXiPSeQ5Yn2ME2NTbauiotAlpnW3YzLW9gihGS2ZHS5sTHtdHiv0AaqY?=
 =?us-ascii?Q?7KZRiQ5exZdzPKz4SQ88rJQssvAwcJgbAbhCtLPol+3qkTVIzaCx9aZUMOBL?=
 =?us-ascii?Q?xH0v3i5tWcHTeQ6nkkIPzdZNc5p6EgoGjhWDe95Tg+vMMMmoAI5qKJwhhkaF?=
 =?us-ascii?Q?1u/RhgMfWKgE1phZEqu+bxbtwxPsoAjh85jfhMppllkflbmRKr1h9Ck4LuXM?=
 =?us-ascii?Q?8gdl9RtzxYSR7ABmsiIz4m3evIEyRHNiiaqsANleet1Ecc+u+t7LTpVNZJaR?=
 =?us-ascii?Q?mIRF4566wTL98Zcrf204Ix08HaW+Yy1Y+2E4K0+VuwGE44rNhdS51i1btQVJ?=
 =?us-ascii?Q?oSxvN6Nme3+GAwkx5WxSk23Rg7kS1pOgoS/J1RTbwd1+v9j0UoXYNKRFtxRU?=
 =?us-ascii?Q?VRFH2S+8VB2b0lQcjQsHtplOPX/ai7LadOREptLTMWotTPnG3zxbih2UrReQ?=
 =?us-ascii?Q?XHWR65tWow276NL7ChV/oqEWpfzOIqorp1x4p2DkJrZ3URISCH0TZUaXW8vA?=
 =?us-ascii?Q?6jDriJgNJuGsKczCWmzgGQkT+2mmd1GHx7Z6d61TmM8p4GQFjG57bemubF4c?=
 =?us-ascii?Q?ritp5alMeXMUCvfdFmXarNbVxNV903WG9hRP0KPjB8qV6K3kgthh6ruBoztt?=
 =?us-ascii?Q?tjAC8hW2Hru/QeJ3QCRpcEQLaUHlLBqSgWkRYOCmICLx2H97bf3fOu+bLCD4?=
 =?us-ascii?Q?polbcutaY4BD/oIWKxT7rpEmDZtKLNfCqDtoDEt1EQngCumy3n9ClNToy9Ms?=
 =?us-ascii?Q?Sc74uA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM8PR07MB8920E2DE0A0435025B4C0E2FDD5D9DM8PR07MB8920namp_"
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR07MB8920.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14a0171-ce4c-405d-e5be-08d9de8b4b95
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2022 16:13:29.9258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CO7s172NLqvrxJBf+sDIGyssyvJZgIYF9JyodKuo/xXYYD+UQnsAz+9vFimbmCUMOTc3Yl9PYgup1M2S01upBex8Ki+T4bNIdPg7MLpV0yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB5354
X-Proofpoint-GUID: vHrz9_SA1BYlCucJPk7n3Ho4jd_61AVs
X-Proofpoint-ORIG-GUID: vHrz9_SA1BYlCucJPk7n3Ho4jd_61AVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-23_05,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=668 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201230127
Received-SPF: pass client-ip=208.86.201.193; envelope-from=samarths@cadence.com;
 helo=mx0a-0014ca01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_DM8PR07MB8920E2DE0A0435025B4C0E2FDD5D9DM8PR07MB8920namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I had a question about the CXL HDM Decoder register programming.
Is there any part of Qemu, that automatically programs the enable bit of th=
e HDM decoder register in the Component registers of the CXL endpoint?
The CDR (component registers) are hosted inside the memory of the CXL endpo=
int.

Regards,
[CadenceLogoRed185Regcopy1583174817new51584636989.png]<https://www.cadence.=
com/en_US/home.html>
Samarth Saxena
Sr Principal Software Engineer
T: 911204308300
[UIcorrectsize1583179003.png]<https://www.cadence.com/en_US/home.html>
[16066EmailSignatureFortune100Best2021White92x1271617625037.png]<https://ww=
w.cadence.com/en_US/home/company/careers.html>





--_000_DM8PR07MB8920E2DE0A0435025B4C0E2FDD5D9DM8PR07MB8920namp_
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
<p class=3D"MsoNormal">I had a question about the CXL HDM Decoder register =
programming.<o:p></o:p></p>
<p class=3D"MsoNormal">Is there any part of Qemu, that automatically progra=
ms the enable bit of the HDM decoder register in the Component registers of=
 the CXL endpoint?<o:p></o:p></p>
<p class=3D"MsoNormal">The CDR (component registers) are hosted inside the =
memory of the CXL endpoint.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
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
T:&nbsp;911204308300&nbsp; &nbsp; </span><o:p></o:p></p>
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

--_000_DM8PR07MB8920E2DE0A0435025B4C0E2FDD5D9DM8PR07MB8920namp_--

