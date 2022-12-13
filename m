Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E89064B8F9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:54:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57bC-0007gM-WA; Tue, 13 Dec 2022 10:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mburton@qti.qualcomm.com>)
 id 1p57bA-0007g9-KH
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:53:40 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mburton@qti.qualcomm.com>)
 id 1p57b7-00088p-Uz
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:53:40 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDCUOHu030906; Tue, 13 Dec 2022 15:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=qcppdkim1;
 bh=15143rySI68O8wqoxybJnZCn+Uzrw0sQjqP0aoXueUY=;
 b=gHI7QZjZVn+SUYcgw6HDvJKUryph2R8JUwRWCopZ92N32gsqQQdbSE4loO+AINaLdvwx
 nwVz9uyoBcAyfMxRxph+H45voHMZp4Au20e7NHcEo7reKuxLqm/tNvGJgVmfTSUqauXb
 tXVOe1WHqTtxhQiYmuAVZh51C7swMfn4/4P6QWMlqfB7Ps31AiM3xO8F1TjWVBAYzMB8
 EplyNzwrnep5ffH5/E2+g6M+GW9z351012G8gdJBkvLcDuIGMCKPed7AxhV79y8nSKzG
 ZzNnXEhg+VHgxdbJDp27YP4TcPExaFgTf6OEw2RwBDKQUWH3/7CB2suQ59t/e3D1DXh+ ng== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3me83skehu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 15:52:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBIAycqY9GFfes9QRLUngHGOYOHtaYjIIaAewba3IO933x2sDGOHRlLGAPed2XbmcpI/P1/+ues2JJ3tBciWzbzlFtigsvciwsG87vzbghXSNV/krSsp0VhOkM4hwoYjypS76kRF36WZEXSjxtgCYOOzFazZxO127E6qjzwHZZJtzbUM2Vwmfl7SfndcLBfRx2pgymVwT21aZNm1rQTLXy8Ia6TXoX9e+x4Jr1tBZSIbrVgONoeiLisyf0fuqcuySusD3NNDu2uZ7N3BkPnB7rpdA2k2hkE0Y6UJMkO/vzpgcrh5Qa33756TpPWWSu78jAK0850ii/M3jw4Dw+vtzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15143rySI68O8wqoxybJnZCn+Uzrw0sQjqP0aoXueUY=;
 b=RhFC4Yuv1JWMlmDsjxdrpnw0+EX8dlQOPb6efFfpWBF8N8W42aU82c3Y2KZjY1auqzMTysVhOrr729rzEXCNxq3w8ZbOAcHO14pjZUIj8M0D1NxPDSLTAem397cBMQuwVCVcSPDzYkL+wlVQwYLsqgdja4ddTS1nAECggQwHJIpJlVx83ET5qq0K/fezQ1JbLZ5Li/nFfMzdd22jI942a9kg628o0KbUQe+JCYd5gEH9wtBxRljll1pwzG1XrPIX8XN//E556r6LvyrpGinYbHQInL68IzTHU+qqd/pinY1eOKfpT5IFw1nOHKMTnrkAPCKH/+7sE9SJw+nxedei8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MWHPR0201MB3609.namprd02.prod.outlook.com
 (2603:10b6:301:78::26) by DS0PR02MB9500.namprd02.prod.outlook.com
 (2603:10b6:8:f1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 15:52:43 +0000
Received: from MWHPR0201MB3609.namprd02.prod.outlook.com
 ([fe80::7723:cbdc:1779:6cf4]) by MWHPR0201MB3609.namprd02.prod.outlook.com
 ([fe80::7723:cbdc:1779:6cf4%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 15:52:42 +0000
From: Mark Burton <mburton@qti.qualcomm.com>
To: =?Windows-1252?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 =?Windows-1252?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
CC: Stefan Hajnoczi <stefanha@gmail.com>,
 =?Windows-1252?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?Windows-1252?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, John Snow
 <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Bernhard Beschow <shentey@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Warner Losh <imp@bsdimp.com>, Luc Michel
 <luc@lmichel.fr>, Paul Walmsley <paul.walmsley@sifive.com>, Alessandro Di
 Federico <ale@rev.ng>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu
 <jim.shu@sifive.com>, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?Windows-1252?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Michal Privoznik <mprivozn@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Denis V. Lunev" <den@virtuozzo.com>, Cleber Rosa <cleber@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Dominik Csapak <d.csapak@proxmox.com>, Christophe de
 Dinechin <dinechin@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Kashyap
 Chamarthy <kchamart@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, John G Johnson
 <john.g.johnson@oracle.com>, Dongli Zhang <dongli.zhang@oracle.com>,
 "afaerber@suse.de" <afaerber@suse.de>, "andrea.arcangeli@redhat.com"
 <andrea.arcangeli@redhat.com>, "bazulay@redhat.com" <bazulay@redhat.com>,
 "bbauman@redhat.com" <bbauman@redhat.com>, "cjia@nvidia.com"
 <cjia@nvidia.com>, "cw@f00f.org" <cw@f00f.org>, "digitaleric@google.com"
 <digitaleric@google.com>, "dustin.kirkland@canonical.com"
 <dustin.kirkland@canonical.com>, Eric Blake <eblake@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, "felipe@nutanix.com" <felipe@nutanix.com>,
 "iggy@theiggy.com" <iggy@theiggy.com>, Jan Kiszka <jan.kiszka@web.de>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "jidong.xiao@gmail.com" <jidong.xiao@gmail.com>,
 "jjherne@linux.vnet.ibm.com" <jjherne@linux.vnet.ibm.com>, Joao Martins
 <joao.m.martins@oracle.com>, "mburton@qti.qualcom.com"
 <mburton@qti.qualcom.com>, "mdean@redhat.com" <mdean@redhat.com>,
 "mimu@linux.vnet.ibm.com" <mimu@linux.vnet.ibm.com>, "z.huo@139.com"
 <z.huo@139.com>, "zwu.kernel@gmail.com" <zwu.kernel@gmail.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Thread-Topic: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Thread-Index: AQHZDbo1t1zKK5U+3UGv1sqsPVlsx65r3WiAgAACdACAAAdYgIAAAhiAgAAQpF8=
Date: Tue, 13 Dec 2022 15:52:42 +0000
Message-ID: <MWHPR0201MB3609DA717889858182E101A28FE39@MWHPR0201MB3609.namprd02.prod.outlook.com>
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
 <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
 <3a86be0b-1621-2a10-c5f5-080f6b8c98ea@kaod.org>
 <CAMxuvazoJ0H3r2WFFcOxHY3fqLd4cSX198fJJoRANZSxTg977Q@mail.gmail.com>
In-Reply-To: <CAMxuvazoJ0H3r2WFFcOxHY3fqLd4cSX198fJJoRANZSxTg977Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR0201MB3609:EE_|DS0PR02MB9500:EE_
x-ms-office365-filtering-correlation-id: 8cfc03d4-7bf8-446a-1f72-08dadd2211e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2OUULB9t5AM1yO96h/ttChMq49JQwNg9agYTS988dvQ+tOYvcVIP1ljLhPf9Ialoy2t4cYwMbHGZhCcWAmR2ysoDqMs8KG/tdYszphWC5ubsf/4ejBmsOiqR3gRRqoDI2R593t1RJRsts0DclA6VSIEJrr55LuRONFqiE4C2tsc0U1TWNKXO8AUCLBr6jeNrhk2s4BDjII0Bu5fxAXnx7mo3N+ELnI6WPi5R1TwhJs9d46CkVtGLHopf8o0LY7IquCWx7ux3G9pBXdGD7+3C70+fbaLf2cipjWZYrUm8wb+jbDUWd9XSqxpPyXMAyQYW78El8s70E3HtRi6ZewuaRbiSsLYu21EFgFm7Hbsz/WKj6mS6ABcFwnH3SzHCHTVoS4UTT6QA4DthZp3I38CDSVfBknn40x2Csy+Sf9mSpQ4mImoIGbtz4q+hpqUoZwHPevKM6Z48exkHxYVB5JUgctpUqfq5WShUeipsvA3ApJ8gYDNIbt4NtgZNuBpUYvofFUuaUhi/BMO2oMU+GwxPtco6ToasMbiKMJtMXU9oKjBbgzdiRFUmGMfM3RS83Ql707/dlROd8QKJCoHVlY1tzNjJ5PKtfSMTI/yJv4q4n+zz+JWb0mawQfOJv1xzrZcJPhAShigia7sGNh8TlAkhmWsvobLu4TUJVZMojVAUpkJPpPvYsu/eXefejxFZjkdmRsgP4U6UGQqQ0YK44BNeYZK6Tut8REC3GaRFcBtAD6k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3609.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(122000001)(38100700002)(166002)(966005)(478600001)(86362001)(52536014)(71200400001)(8936002)(91956017)(66446008)(66946007)(76116006)(26005)(8676002)(66476007)(110136005)(54906003)(186003)(7696005)(2906002)(83380400001)(6506007)(316002)(9686003)(64756008)(66574015)(7416002)(53546011)(7366002)(7406005)(5660300002)(38070700005)(66899015)(66556008)(41300700001)(4326008)(55016003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?I6GdBYem0vG1bKIyETGtajXnNlNwSEZZFr9AFAcyL6dUha87WGOS29t4?=
 =?Windows-1252?Q?0R4wnuewj2o5iXvbyzVEHDYwegEvY8MomxFo+J1KurzZCVMjn2E77yuZ?=
 =?Windows-1252?Q?qNdf1oBtYzFmvzHVy40NWcuF9Z2FYSfEdn9c7FYNIzuwIf+1gwLanBH+?=
 =?Windows-1252?Q?82n/nCVDMss6WBZwBiObF+vZ1EfNNNiZTYIxDiWM6rx33D5Wg0nPXfpT?=
 =?Windows-1252?Q?aMebfkW7z5ibGI9wZ8yBxC8yNSE0SNamfO79p1mVX4oI5SgqRwTxBEyt?=
 =?Windows-1252?Q?J/tpIHOlq/ntLFfJzBXtWS5P9MkiWUya99PMeShPPiwUpVwD1GwQuvvb?=
 =?Windows-1252?Q?ITcah+HISL1o4t4HHMdyNgkO7C7mO5VmJsoHS+BdgAuspVcgj/1Zn2do?=
 =?Windows-1252?Q?ZWb0KqOavT8bFmp3Hb6O1heVttoB3XGSGangF5bKAsoi60VTAfiBYVkU?=
 =?Windows-1252?Q?Ry89xBViNAO+gYfV8MprW3EvFCJjN0eisTovDrLuaibNmltsHntLYfjV?=
 =?Windows-1252?Q?7LS3qA7g4pA/h1h7azUYrYTRmTi/YICGWHPPr+L/tkgwibM5TpaU4NZS?=
 =?Windows-1252?Q?3NX5Z1IUCgOt2RSYYUHEsKoF2zcz9VLgqML6Lb9VvecNbljzQw2VKFKR?=
 =?Windows-1252?Q?zAr3TYV15Cm1rWxzlccICq1Q8EwrWxaXxSyiKl41Y2Cpo5YCl4wNV2bH?=
 =?Windows-1252?Q?YxfLOIdYGkfEG/xf2TcjQACkYpwJ/0+mwUzfLTTP8uTdi9VCq4jW4Qg4?=
 =?Windows-1252?Q?G8NfSRabuBxhNl9DqH9SycmFQc8xqmkdwWNMGGU8/rXdpyW4FRGkup9/?=
 =?Windows-1252?Q?uacmCvDdnUGwky/38dOh558Drec4PmV2HvPyJDYAXpaGA3IMtka0zJZh?=
 =?Windows-1252?Q?9R8L/3H3EDXcK21kp9eALJ5x63IdVJjW3aTilKQYhDDykG/hrcoxdwvk?=
 =?Windows-1252?Q?JmYLH5GRzFqEUsDHCH5XGODkmi6l0wM7u01sd1ay3yIbLsDMUzlpptXW?=
 =?Windows-1252?Q?v7wt1Q1FRuAftv+NYx2hn5+kI1bT2QRAAOfC0mbDGnj4oNNTVSjddqss?=
 =?Windows-1252?Q?g9UFijbAe/5lONGPAhI3KwQdK5bRlVYRMmW7ukPRbR62NqDme9hCvILI?=
 =?Windows-1252?Q?Y7W8Quj/9bKfpIOriABy0ppe5nqTNLn+5PGmKIGP1DQASJuVST7cVpCf?=
 =?Windows-1252?Q?T/XielWVvhslXAfpuFh797O5snbz2LMrBK0S21DqiBMZVm77P0/vPEBZ?=
 =?Windows-1252?Q?y2ygOtXeaNU6k5GC6z9/wX9lF674+2k2VOnKXaqKPvTnn0pFgZeM8SsG?=
 =?Windows-1252?Q?KKCokwRPUBgb0B7gL8wkgQNX+nd0MHOto11HdOrhZiXOUl20mQfLwcWV?=
 =?Windows-1252?Q?SXnRoYJ6zIK3wCZQYWwjBc2hfrgqYVPojzhi27T2u7huZRxyO37S1pme?=
 =?Windows-1252?Q?DafZZh2qNMaBIJjhWnVr4/5XPaEs2pEYAZq2/8jl3jjB109tyEfZdeYO?=
 =?Windows-1252?Q?1KyObV08rREjMDhmvs9jCLzF3IaheloNtppJ9wm1GGH1xuaqBBVeX1rY?=
 =?Windows-1252?Q?W2gp9/K0C1ezrjtPoSjyYV7hKwtNEE8vZqAzUOZBGfBf1JZetAGSicTU?=
 =?Windows-1252?Q?5ihKmwCN7+KFE33fnP8XMNDykmp0xlkJUk7WVyy3kPHU3L63b4SoIefe?=
 =?Windows-1252?Q?yrjVz+sSPyWuIB4IEKOylTJPWPR44E8+wTvsH7dCfPNSugg5RHncu/fJ?=
 =?Windows-1252?Q?KjpNdr8tVJ3cuWYNKWw=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MWHPR0201MB3609DA717889858182E101A28FE39MWHPR0201MB3609_"
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3609.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfc03d4-7bf8-446a-1f72-08dadd2211e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 15:52:42.4405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: McJrU7hI/y5JzQLZRKKTzf7RZmNKCgguSRWFGHNEcyk7hW5y8SxWtfwmsA82xvuiVJLcSmMUPy5DkeIQUAsgpvnVWFx5Qi20igVeHvgZnlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9500
X-Proofpoint-GUID: eiKj6--pckOAPMw_ncS-iE-CCw5bcZoF
X-Proofpoint-ORIG-GUID: eiKj6--pckOAPMw_ncS-iE-CCw5bcZoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130140
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mburton@qti.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_MWHPR0201MB3609DA717889858182E101A28FE39MWHPR0201MB3609_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

(BTW, really happy that we use another approach for next time - we only use=
d it because we didn=92t have another quick choice when the meeting didn=92=
t open=85.)

Cheers
Mark


On 13/12/2022, 15:52, "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com> w=
rote:


WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.
Hi

On Tue, Dec 13, 2022 at 6:44 PM C=E9dric Le Goater <clg@kaod.org<mailto:clg=
@kaod.org>> wrote:
On 12/13/22 15:17, Stefan Hajnoczi wrote:
> On Tue, 13 Dec 2022 at 09:08, Philippe Mathieu-Daud=E9 <philmd@linaro.org=
<mailto:philmd@linaro.org>> wrote:
>>
>> On 12/12/22 00:41, Philippe Mathieu-Daud=E9 wrote:
>>> Hi,
>>>
>>> In the last years we had few discussions on "simplifying" QEMU (system
>>> emulation / virtualization), in particular for the "management layer".
>>>
>>> Some of us are interested in having QEMU able to dynamically create
>>> machine models. Mark Burton's current approach is via a Python script
>>> which generates QMP commands. This is just another case of "management
>>> layer".
>>>
>>> Various problems have been raised regarding the current limitations of
>>> QEMU's APIs. We'd like to remember / get a broader idea on these limits
>>> and look at some ideas / proposals which have been discussed / posted
>>> on this list.
>>>
>>> Feel free to complete your thoughts on this public etherpad:
>>> https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
>>>
>>> Topic I remember which can be good starters:
>>>
>>> - Current limitations of QAPI (& QMP) model (Markus Armbruster)
>>>
>>> - Adding a new qemu-runtime-$TARGET / QMP-only binary without today's
>>>     limitations (Daniel P. Berrang=E9 & Paolo Bonzini)
>>>
>>> - Problem with x-exit-preconfig, reworking MachinePhaseInit state
>>>     machine (Paolo Bonzini)
>>>
>>> Markus / Daniel / Paolo expressed their ideas on the list (the
>>> historical threads are referenced in the etherpad) so reading the
>>> relevant threads before the call will help to get in the topic.
>>> These people don't have to be in the call, but if they can attend
>>> that would be very nice :)
>>>
>>> The call will be Tuesday, December 13 at 3pm CET on this Bluejeans link=
:
>>> http://bluejeans.com/quintela
>> We moved the call here:
>>
>> https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtO=
GY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2
>
> Please use a video conferencing system that allows people to join
> without logging in and works across browsers. I gave up on Teams.

I also gave up after 27 or so clicks, redirections, emails checks, etc.
Too complex. There are much simpler alternatives.

Sorry, similar situation here:

"Hmm. Your browser version isn't supported."

firefox-107.0.1-1.fc37.x86_64


--_000_MWHPR0201MB3609DA717889858182E101A28FE39MWHPR0201MB3609_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">(BTW, really happy that we use another approach for next time - we =
only used it because we didn=92t have another quick choice when the meeting=
 didn=92t open=85.)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Cheers<br>
Mark<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">On 13/12/2022, 15:52, &quot;Marc-Andr=E9 Lureau&quot; &lt;marcand=
re.lureau@redhat.com&gt; wrote:<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><o:p>&nbsp;</o:p></span></p>
<p align=3D"center" style=3D"margin-left:36.0pt;text-align:center"><strong>=
<span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;co=
lor:black;background:yellow">WARNING:</span></strong><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black;background:y=
ellow">
 This email originated from outside of Qualcomm. Please be wary of any link=
s or attachments, and do not enable macros.</span><o:p></o:p></p>
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">Hi<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">On Tue, Dec 13, 2022 at 6:44 PM C=E9dric Le Goater &lt;<a href=3D=
"mailto:clg@kaod.org">clg@kaod.org</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:0cm;mar=
gin-bottom:12.0pt;margin-left:36.0pt">
<span style=3D"font-size:11.0pt">On 12/13/22 15:17, Stefan Hajnoczi wrote:<=
br>
&gt; On Tue, 13 Dec 2022 at 09:08, Philippe Mathieu-Daud=E9 &lt;<a href=3D"=
mailto:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt; On 12/12/22 00:41, Philippe Mathieu-Daud=E9 wrote:<br>
&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In the last years we had few discussions on &quot;simplifying&=
quot; QEMU (system<br>
&gt;&gt;&gt; emulation / virtualization), in particular for the &quot;manag=
ement layer&quot;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Some of us are interested in having QEMU able to dynamically c=
reate<br>
&gt;&gt;&gt; machine models. Mark Burton's current approach is via a Python=
 script<br>
&gt;&gt;&gt; which generates QMP commands. This is just another case of &qu=
ot;management<br>
&gt;&gt;&gt; layer&quot;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Various problems have been raised regarding the current limita=
tions of<br>
&gt;&gt;&gt; QEMU's APIs. We'd like to remember / get a broader idea on the=
se limits<br>
&gt;&gt;&gt; and look at some ideas / proposals which have been discussed /=
 posted<br>
&gt;&gt;&gt; on this list.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Feel free to complete your thoughts on this public etherpad:<b=
r>
&gt;&gt;&gt; <a href=3D"https://etherpad.opendev.org/p/qemu-emulation-bof%4=
02022-12-13" target=3D"_blank">
https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Topic I remember which can be good starters:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - Current limitations of QAPI (&amp; QMP) model (Markus Armbru=
ster)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - Adding a new qemu-runtime-$TARGET / QMP-only binary without =
today's<br>
&gt;&gt;&gt;&nbsp; &nbsp; &nbsp;limitations (Daniel P. Berrang=E9 &amp; Pao=
lo Bonzini)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - Problem with x-exit-preconfig, reworking MachinePhaseInit st=
ate<br>
&gt;&gt;&gt;&nbsp; &nbsp; &nbsp;machine (Paolo Bonzini)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Markus / Daniel / Paolo expressed their ideas on the list (the=
<br>
&gt;&gt;&gt; historical threads are referenced in the etherpad) so reading =
the<br>
&gt;&gt;&gt; relevant threads before the call will help to get in the topic=
.<br>
&gt;&gt;&gt; These people don't have to be in the call, but if they can att=
end<br>
&gt;&gt;&gt; that would be very nice :)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The call will be Tuesday, December 13 at 3pm CET on this Bluej=
eans link:<br>
&gt;&gt;&gt; <a href=3D"http://bluejeans.com/quintela" target=3D"_blank">ht=
tp://bluejeans.com/quintela</a><br>
&gt;&gt; We moved the call here:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://teams.microsoft.com/_#/pre-join-calling/19:meet=
ing_MjU2NDhkOGYtOGY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2" target=3D"_=
blank">
https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOGY5=
ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2</a><br>
&gt; <br>
&gt; Please use a video conferencing system that allows people to join<br>
&gt; without logging in and works across browsers. I gave up on Teams.<br>
<br>
I also gave up after 27 or so clicks, redirections, emails checks, etc.<br>
Too complex. There are much simpler alternatives.<o:p></o:p></span></p>
</blockquote>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">Sorry, similar situation here:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">&quot;Hmm. Your browser version isn't supported.&quot;<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">firefox-107.0.1-1.fc37.x86_64<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MWHPR0201MB3609DA717889858182E101A28FE39MWHPR0201MB3609_--

