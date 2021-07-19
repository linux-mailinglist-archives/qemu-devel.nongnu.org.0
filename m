Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456D03CEAD3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:03:31 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Xc1-0000XI-Mi
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5Xar-0008I3-RL
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:02:17 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:51010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5Xan-0002AH-SH
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:02:17 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JHm3iT006462; Mon, 19 Jul 2021 11:02:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=+z4rzC5C7HW5eVIch2LKLvN0GegOpeB18QzIcJmRcgQ=;
 b=bo4b1jXZfbqXbnVaN3/FWa7pCL7qBEQGMFosZ218d9Gy+oOOjJXfiOJILkly3w307yLA
 7GJaMiJbU9i2r9AsKGBtzaPXtbwHJ5xdqExkRoDTcrAc9rpweMq3f4cKatTLNkSkdUwG
 Qq/t68WzlvvaXRgfvlUQiWln4t+MgxEwxDiOQxF+ld3B1gmJfCwdxuwnjnlX6iYsx6/j
 zwF4fZGvD7+6n8TOWxVH4qcMdB1iLiB2b5Wq4wlj1c5scrKEBw5j3VVBmeLvNTsEfY+W
 FslYUEZXrMNtzyqC6psTr4kd4wJRX57trm2AX0owQIhUArCu+UnnIqC4YhWM2HLNZaVB 9Q== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by mx0a-002c1b01.pphosted.com with ESMTP id 39w4jh97bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 11:02:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TS1ZDBEVtprAydLI/eOtbaWad1LONi/LAB24E73JMvvLY5VnLhOBvmSX3EtU+jQFLuLzUdaGu/ZKN35mZndcRjtmCzd1mJ7tnNu5OeuGKI17Gxr4TsW0il9NERRytC9iGBJhURDNNnMJNZ9nmI59/pfsTshZ/S5ax5HSc/FbkSapa4s0k9X0AEOphJRtv5PHR4bDaHqgOqGGEgwkOMyKs/1UT2DOo7R9ofwriYNx26+UcDDoW/yp21tWFYate8kosS5SPmEFchDOwbyLX7tKd/PvA+QRyogEyZa9sR5Edz9XLQCOfV6kPlxXFE36new7LaFLwcPINPA2yVPbwo7S/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+z4rzC5C7HW5eVIch2LKLvN0GegOpeB18QzIcJmRcgQ=;
 b=L5pzdBZ7k97XG6PIqQs4XpUvMxqminyw+JUcN2RNFLQPw9hMhhOVumzBIpolCXG07ZyhicfCo1pMxApPn9b2xj47y/A5XO3iWvoCmwgeTN6lKVijXPRS7lxz/9VzID9c8DKScpBjd2jx0Q8EcfvUK1qrornR1ivMf9K+pXyKRfjwWvTgmgC7tqbyAqZSdWUZGT7HpE5QiFjRp8P1hidoLVGzWsokWo8dZW90+f5Qhm8kLsnmA8IiZIgzF/4ShNvf01UlO7jeE5cs6t3vf8sCtE6DZ9TeI8HPhQS/ipONlTLk99DjZQwqa5XfSM0RId4qbi+AeK/yDUx3hOO6zXqcqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH2PR02MB6455.namprd02.prod.outlook.com (2603:10b6:610:1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.30; Mon, 19 Jul
 2021 18:02:09 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b%9]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 18:02:08 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: Question on memory commit during MR finalize()
Thread-Topic: Question on memory commit during MR finalize()
Thread-Index: AQHWF1blDKoce5BcwE+aLVbWV0XOZKiCivmAgAAd6oCAAKsXAIAAEMEAgsN1h+CAAEdvgIABHU1QgAAtSoCABLlmgIAAGMwAgAAi0xQ=
Date: Mon, 19 Jul 2021 18:02:08 +0000
Message-ID: <CH0PR02MB789857DE73B0A9B1FC29593E8BE19@CH0PR02MB7898.namprd02.prod.outlook.com>
References: <20200420210049.GA420399@xz-x1>
 <fe73a74b-2324-68a5-a37f-530a6bb03ebc@redhat.com>
 <20200420233115.GB420399@xz-x1>
 <5ed295a3-9e4a-0dca-adc6-5361dc78a83c@redhat.com>
 <20200421104334.GC420399@xz-x1>
 <CH0PR02MB78989C2F77880AA5355037748B129@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPB/8f0pv7mDR310@t490s>
 <CH0PR02MB7898ACD1C68149CE11314EB08B119@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YPGVQ0ONUc/qPSNz@t490s>
 <CH0PR02MB7898BB81DCB85237D38E07638BE19@CH0PR02MB7898.namprd02.prod.outlook.com>,
 <YPWglNqZFegBRZjM@t490s>
In-Reply-To: <YPWglNqZFegBRZjM@t490s>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2452856-1148-4e61-1377-08d94adf5371
x-ms-traffictypediagnostic: CH2PR02MB6455:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6455B89F6904DA08DB7BE2A88BE19@CH2PR02MB6455.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:249;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AcvRvIGwWLau7cqfu/Amh2wdfDC7/e4qw+u8ac2d7A6tdRKZujraJ+mPqA0WREhXfQ+I0tV32jTrCB4+GYX6cSQwwBwl6IFuOQ3xMEl4D1oIAYiSMSsoDdsblGcgsq6XRZ0mUA81lTqbp9hO/pYIvtUdEW6h7uKJpiMvlTSDKMKGpPRZx0sU1gP/Tr/LlIH7N/I9u6gX6tW8/uDtmpDJjsZQetpQannAT4lFgPg82rqc0PC1Gd7oaR3B9V3SBGWwqPdWaKcGAsjZWFcPz4+Tl5durIxjZxP95YRUWJeD5mtYWJq76bq5ZvvQgBrL6uqFMZJRuZPoho7TC0GMQbxWV11W/TD8m9dAxbn2R1vx/GfWezYbcd1KEJgcWxQadVzBt5GOwJDlfg53MUhJxHD04p9KR9pDGCbwckaytbi4NxGJK4CSUy3MCj80nPcaiQoQvghojf6PN1c4Qt/TMG5g/wUndYxQ3RMoHQ6+XzbwsY3JCSu4oVSBKSq9NzR8tmbuRa5TwGdGPpqOKu+svVKPHPKMhfNEw7oEUIuCf9WHhp0EpAttwABiRga1Ubz6UZcMXsWpV1v61MPmfsKGtojspQ1+Gb+Q1VqP6DUKl6DlYZ9diwfZ2ZOErlMa+Acp1oBAcVAup1YeH0WW3OFx8jF9CKHuS6aM4x3iqMQ+KwZQPM0fRW8/Y+yM932aPIIBqMLfNHYwtUS8+p+MJT0Hpkd2Jlimg5L6BEplUribcJRmlNWAu0HxaKSExEtd8SFLNQ4l+RwbHSQxM17Anc045LWHPDEnCAmgCLhly9SyNofRs7U7TJNfZEyme4HNT3XUGTa63qtcxErOomntNjw0ZlPDpWKBdof0GCh503W87vsY2MQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(366004)(136003)(376002)(6916009)(66946007)(91956017)(76116006)(54906003)(966005)(166002)(18265965003)(86362001)(8936002)(66446008)(64756008)(66556008)(66476007)(83380400001)(2906002)(71200400001)(33656002)(6506007)(55016002)(38100700002)(122000001)(186003)(7696005)(478600001)(52536014)(9686003)(316002)(53546011)(44832011)(5660300002)(26005)(8676002)(4326008)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4eh8K73vtOP8QlAIiZkH5LWpJfQF/bIB0o4N1xojznPrlMtygJ8796J99xcp?=
 =?us-ascii?Q?EpzG9KlntnWEvxyrRRt6BF2OgKRYrIOHCWIZhrINaTj94ttw1hoX+NJGfaAG?=
 =?us-ascii?Q?UupMcVs9iPVWujvrpu/O84bQAeWJ9N0ZMtJMHMkpF7JKr9tPBNFfa6oUpgnY?=
 =?us-ascii?Q?Xx5foFH0/fm6A1mVwdjt5riKEMZ/+shkf59T/2v4y+LFcOEBHQS1F51puSla?=
 =?us-ascii?Q?fG5WQirdkUS9U6QYsZQhJ6KPGGBMVQDZplnSDgdXi5fku6iOb9J/SmzKxhfO?=
 =?us-ascii?Q?yCD+jytQ8g+5eq9s4YMP1Gfv0nl0+axi+ErGzoRmLP2nMOC1BlHhEUvfIR/f?=
 =?us-ascii?Q?KG0Ayx7po5lTeSEBQbhtpp2kFEAcaHggi8uMJ6R+hp2/1oDUWVKXfcvv1AuT?=
 =?us-ascii?Q?dUsDm34Jw53ef1BTIqF4pf3RYRhES3eAjqEMAm6TnwbpP9BuSPOgV57UIuZz?=
 =?us-ascii?Q?Nbf1JLNSPBrNXdyvMs07yabD3ZBZvJCjuj9aDHBFKF7eBp3R3PEGfnj0R903?=
 =?us-ascii?Q?CZCxkRszDli1YNaDDcvPWA0CbX/F4UHaty6gduT/mFyRFmDOBARjNdkcrHEJ?=
 =?us-ascii?Q?S0f4jVh3laj3HTjyZjsEM4fxJjIWTZaq8Ey6aBz568gwl95uCAWUG+I1fHCE?=
 =?us-ascii?Q?hHt5guX7b+8M7TvYR/WXYOfULqYmsRk5EQhVH70806JJBOugx/LKfrJU/z2W?=
 =?us-ascii?Q?6Hr5zXBn2S6PYiPevxQAgCIGdmSXFUm8BxcCfl+5vkp8b647nNueFK2mq/BM?=
 =?us-ascii?Q?ivSGXp/cVqe/He6aj/mX9fhw1edVsSqygiN/kWjVgHJLAcC1kV/OX47wMHfP?=
 =?us-ascii?Q?ZYrijNYKLASKIHLDgLbyKt7HNd9hVUfgmmwExUmPfbQfdbw82aI98DjtZ7WT?=
 =?us-ascii?Q?5wTnJ1BJhNtSeLuQKX5PfRXA6Z7dw1d1N3OyNVHzfDHeGZ1pZqQFCccjUHd9?=
 =?us-ascii?Q?WZQ9W8wZNpflGCt5KbUAWDCvgnhwX57E6HumKIpn5dml7tFGPsEjtk28J3a+?=
 =?us-ascii?Q?LCdzOhaYWwiZlLuMKT/72/DXDQW5vHxyqVqHcK/jHk67jbpLIdtjdz5v8pso?=
 =?us-ascii?Q?hyLqjY4E+CEw+qWeAw4zB+o9MMZcX6xbFuB801ZZ9dMwcW0NFm3Qa/TlOdiJ?=
 =?us-ascii?Q?LEiRn7W/4MHXQOI8C0vPxJCO2zms5hcdYV6xVNQMTUKTF/0/OaQT8Y6rH9Jo?=
 =?us-ascii?Q?fwExlKzvc18VN20sUaYkv+dVEU4d03EADSsgaukNiZEGmgRmPeCU2xqfNBKy?=
 =?us-ascii?Q?zj/dG8f2iumDgSq+yDpIF/n+9hNxWNjLjVgIOjBjaVlkaRyNuOW8OWgiRppj?=
 =?us-ascii?Q?z9RsMr4hFC1KH+nC99i7Jci/?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR02MB789857DE73B0A9B1FC29593E8BE19CH0PR02MB7898namp_"
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2452856-1148-4e61-1377-08d94adf5371
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 18:02:08.6353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+M5AfA9n63+k4qbE+X/xnVzXo4Sqex0k7544R7u0YqhHN+A1muJkyV2DzP6cnNDRzFH0hjqbgagWJEEf7+D99UQnVXyDGCOmUCMx+5GPZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6455
X-Proofpoint-ORIG-GUID: qoyRsxT6cpINHVld4fPQvDgCmMpfIrJX
X-Proofpoint-GUID: qoyRsxT6cpINHVld4fPQvDgCmMpfIrJX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_09:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) DKIMWL_WL_HIGH=-1.469, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Levon <john.levon@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CH0PR02MB789857DE73B0A9B1FC29593E8BE19CH0PR02MB7898namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Omg I don't know how I missed that, of course I'll ignore SIGUSR1 and retes=
t!

________________________________
From: Peter Xu <peterx@redhat.com>
Sent: Monday, 19 July 2021, 16:58
To: Thanos Makatos
Cc: Paolo Bonzini; Markus Armbruster; QEMU Devel Mailing List; John Levon; =
John G Johnson
Subject: Re: Question on memory commit during MR finalize()

Hi, Thanos,

On Mon, Jul 19, 2021 at 02:38:52PM +0000, Thanos Makatos wrote:
> I can trivially trigger an assertion with a build where I merged the rece=
nt vfio-user patches (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__patchew.org_QEMU_cover.1626675354.git.elena.ufimtseva-40oracle.com_&d=3DD=
wIBaQ&c=3Ds883GpUCOChKOHiocYtGcg&r=3DXTpYsh5Ps2zJvtw6ogtti46atk736SI4vgsJiU=
KIyDE&m=3DLvALaULnrxZWlgXFcaxGAl95UIwq3a6LI8OnG_5r4XY&s=3DmoFPVchYp27xozQcv=
vxG4nb4nC2QmMnqQ1Wmt4Z3dNE&e=3D ) to master and then merging the result int=
o your xzpeter/memory-sanity branch, I've pushed the branch here: https://u=
rldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_tmakatos_qemu_tree=
_memory-2Dsanity&d=3DDwIBaQ&c=3Ds883GpUCOChKOHiocYtGcg&r=3DXTpYsh5Ps2zJvtw6=
ogtti46atk736SI4vgsJiUKIyDE&m=3DLvALaULnrxZWlgXFcaxGAl95UIwq3a6LI8OnG_5r4XY=
&s=3DveyjdkkFkGSYNDZOuksB-kbHmdQaw9RYxyZp8Qo7nW4&e=3D . I explain the repro=
 steps below in case you want to take a look:
>
> Build as follows:
>
> ./configure --prefix=3D/opt/qemu-xzpeter --target-list=3Dx86_64-softmmu -=
-enable-kvm  --enable-debug --enable-multiprocess && make -j `nproc` && mak=
e install
>
> Then build and run the GPIO sample from libvfio-user (https://urldefense.=
proofpoint.com/v2/url?u=3Dhttps-3A__github.com_nutanix_libvfio-2Duser&d=3DD=
wIBaQ&c=3Ds883GpUCOChKOHiocYtGcg&r=3DXTpYsh5Ps2zJvtw6ogtti46atk736SI4vgsJiU=
KIyDE&m=3DLvALaULnrxZWlgXFcaxGAl95UIwq3a6LI8OnG_5r4XY&s=3DHYP5NmDMGuS13pdyV=
83x3HzyhGbE-oP1T8NLtu0d1U8&e=3D ):
>
> libvfio-user/build/dbg/samples/gpio-pci-idio-16 -v /var/run/vfio-user.soc=
k
>
> And then run QEMU as follows:
>
> gdb --args /opt/qemu-xzpeter/bin/qemu-system-x86_64 -cpu host -enable-kvm=
 -smp 4 -m 2G -object memory-backend-file,id=3Dmem0,size=3D2G,mem-path=3D/d=
ev/hugepages,share=3Don,prealloc=3Dyes -numa node,memdev=3Dmem0 -kernel bio=
nic-server-cloudimg-amd64-vmlinuz-generic -initrd bionic-server-cloudimg-am=
d64-initrd-generic -append 'console=3DttyS0 root=3D/dev/sda1 single' -hda b=
ionic-server-cloudimg-amd64-0.raw -nic user,model=3Dvirtio-net-pci -machine=
 pc-q35-3.1 -device vfio-user-pci,socket=3D/var/run/vfio-user.sock -nograph=
ic
>
> I immediately get the following stack trace:
>
> Thread 5 "qemu-system-x86" received signal SIGUSR1, User defined signal 1=
.

This is SIGUSR1.  QEMU uses it for general vcpu ipis.

> [Switching to Thread 0x7fffe6e82700 (LWP 151973)]
> __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:10=
3
> 103     ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S: No such file or=
 directory.
> (gdb) bt
> #0  0x00007ffff655d29c in __lll_lock_wait () at ../sysdeps/unix/sysv/linu=
x/x86_64/lowlevellock.S:103
> #1  0x00007ffff6558642 in __pthread_mutex_cond_lock (mutex=3Dmutex@entry=
=3D0x5555568bb280 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
> #2  0x00007ffff6559ef8 in __pthread_cond_wait_common (abstime=3D0x0, mute=
x=3D0x5555568bb280 <qemu_global_mutex>, cond=3D0x555556cecc30) at pthread_c=
ond_wait.c:645
> #3  0x00007ffff6559ef8 in __pthread_cond_wait (cond=3D0x555556cecc30, mut=
ex=3D0x5555568bb280 <qemu_global_mutex>) at pthread_cond_wait.c:655
> #4  0x000055555604f717 in qemu_cond_wait_impl (cond=3D0x555556cecc30, mut=
ex=3D0x5555568bb280 <qemu_global_mutex>, file=3D0x5555561ca869 "../softmmu/=
cpus.c", line=3D514) at ../util/qemu-thread-posix.c:194
> #5  0x0000555555d28a4a in qemu_cond_wait_iothread (cond=3D0x555556cecc30)=
 at ../softmmu/cpus.c:514
> #6  0x0000555555d28781 in qemu_wait_io_event (cpu=3D0x555556ce02c0) at ..=
/softmmu/cpus.c:425
> #7  0x0000555555e5da75 in kvm_vcpu_thread_fn (arg=3D0x555556ce02c0) at ..=
/accel/kvm/kvm-accel-ops.c:54
> #8  0x000055555604feed in qemu_thread_start (args=3D0x555556cecc70) at ..=
/util/qemu-thread-posix.c:541
> #9  0x00007ffff6553fa3 in start_thread (arg=3D<optimized out>) at pthread=
_create.c:486
> #10 0x00007ffff64824cf in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

Would you please add below to your ~/.gdbinit script?

  handle SIGUSR1 nostop noprint

Or just run without gdb and wait it to crash with SIGABRT.

Thanks,

--
Peter Xu



--_000_CH0PR02MB789857DE73B0A9B1FC29593E8BE19CH0PR02MB7898namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div id=3D"id-545096c6-f533-4922-8fcd-59a4c6c06649" class=3D"ms-outlook-mob=
ile-reference-message" dir=3D"auto">
<div style=3D"font-family: sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;" dir=3D"auto">
Omg I don't know how I missed that, of course I'll ignore SIGUSR1 and retes=
t!</div>
<div style=3D"font-family: sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;" dir=3D"auto">
<br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg"><strong>From:</strong> Peter Xu &lt;peterx@redhat=
.com&gt;<br>
<strong>Sent:</strong> Monday, 19 July 2021, 16:58<br>
<strong>To:</strong> Thanos Makatos<br>
<strong>Cc:</strong> Paolo Bonzini; Markus Armbruster; QEMU Devel Mailing L=
ist; John Levon; John G Johnson<br>
<strong>Subject:</strong> Re: Question on memory commit during MR finalize(=
)<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style><font size=3D"=
2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Hi, Thanos,<br>
<br>
On Mon, Jul 19, 2021 at 02:38:52PM +0000, Thanos Makatos wrote:<br>
&gt; I can trivially trigger an assertion with a build where I merged the r=
ecent vfio-user patches (<a href=3D""></a>https://urldefense.proofpoint.com=
/v2/url?u=3Dhttps-3A__patchew.org_QEMU_cover.1626675354.git.elena.ufimtseva=
-40oracle.com_&amp;d=3DDwIBaQ&amp;c=3Ds883GpUCOChKOHiocYtGcg&amp;r=3DXTpYsh=
5Ps2zJvtw6ogtti46atk736SI4vgsJiUKIyDE&amp;m=3DLvALaULnrxZWlgXFcaxGAl95UIwq3=
a6LI8OnG_5r4XY&amp;s=3DmoFPVchYp27xozQcvvxG4nb4nC2QmMnqQ1Wmt4Z3dNE&amp;e=3D
 ) to master and then merging the result into your xzpeter/memory-sanity br=
anch, I've pushed the branch here:
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.co=
m_tmakatos_qemu_tree_memory-2Dsanity&amp;d=3DDwIBaQ&amp;c=3Ds883GpUCOChKOHi=
ocYtGcg&amp;r=3DXTpYsh5Ps2zJvtw6ogtti46atk736SI4vgsJiUKIyDE&amp;m=3DLvALaUL=
nrxZWlgXFcaxGAl95UIwq3a6LI8OnG_5r4XY&amp;s=3DveyjdkkFkGSYNDZOuksB-kbHmdQaw9=
RYxyZp8Qo7nW4&amp;e=3D">
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_tmakatos_=
qemu_tree_memory-2Dsanity&amp;d=3DDwIBaQ&amp;c=3Ds883GpUCOChKOHiocYtGcg&amp=
;r=3DXTpYsh5Ps2zJvtw6ogtti46atk736SI4vgsJiUKIyDE&amp;m=3DLvALaULnrxZWlgXFca=
xGAl95UIwq3a6LI8OnG_5r4XY&amp;s=3DveyjdkkFkGSYNDZOuksB-kbHmdQaw9RYxyZp8Qo7n=
W4&amp;e=3D</a>
 . I explain the repro steps below in case you want to take a look:<br>
&gt; <br>
&gt; Build as follows:<br>
&gt; <br>
&gt; ./configure --prefix=3D/opt/qemu-xzpeter --target-list=3Dx86_64-softmm=
u --enable-kvm&nbsp; --enable-debug --enable-multiprocess &amp;&amp; make -=
j `nproc` &amp;&amp; make install<br>
&gt; <br>
&gt; Then build and run the GPIO sample from libvfio-user (<a href=3D""></a=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_nutanix_=
libvfio-2Duser&amp;d=3DDwIBaQ&amp;c=3Ds883GpUCOChKOHiocYtGcg&amp;r=3DXTpYsh=
5Ps2zJvtw6ogtti46atk736SI4vgsJiUKIyDE&amp;m=3DLvALaULnrxZWlgXFcaxGAl95UIwq3=
a6LI8OnG_5r4XY&amp;s=3DHYP5NmDMGuS13pdyV83x3HzyhGbE-oP1T8NLtu0d1U8&amp;e=3D
 ):<br>
&gt; <br>
&gt; libvfio-user/build/dbg/samples/gpio-pci-idio-16 -v /var/run/vfio-user.=
sock<br>
&gt; <br>
&gt; And then run QEMU as follows:<br>
&gt; <br>
&gt; gdb --args /opt/qemu-xzpeter/bin/qemu-system-x86_64 -cpu host -enable-=
kvm -smp 4 -m 2G -object memory-backend-file,id=3Dmem0,size=3D2G,mem-path=
=3D/dev/hugepages,share=3Don,prealloc=3Dyes -numa node,memdev=3Dmem0 -kerne=
l bionic-server-cloudimg-amd64-vmlinuz-generic -initrd
 bionic-server-cloudimg-amd64-initrd-generic -append 'console=3DttyS0 root=
=3D/dev/sda1 single' -hda bionic-server-cloudimg-amd64-0.raw -nic user,mode=
l=3Dvirtio-net-pci -machine pc-q35-3.1 -device vfio-user-pci,socket=3D/var/=
run/vfio-user.sock -nographic<br>
&gt; <br>
&gt; I immediately get the following stack trace:<br>
&gt; <br>
&gt; Thread 5 &quot;qemu-system-x86&quot; received signal SIGUSR1, User def=
ined signal 1.<br>
<br>
This is SIGUSR1.&nbsp; QEMU uses it for general vcpu ipis.<br>
<br>
&gt; [Switching to Thread 0x7fffe6e82700 (LWP 151973)]<br>
&gt; __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S=
:103<br>
&gt; 103&nbsp;&nbsp;&nbsp;&nbsp; ../sysdeps/unix/sysv/linux/x86_64/lowlevel=
lock.S: No such file or directory.<br>
&gt; (gdb) bt<br>
&gt; #0&nbsp; 0x00007ffff655d29c in __lll_lock_wait () at ../sysdeps/unix/s=
ysv/linux/x86_64/lowlevellock.S:103<br>
&gt; #1&nbsp; 0x00007ffff6558642 in __pthread_mutex_cond_lock (mutex=3Dmute=
x@entry=3D0x5555568bb280 &lt;qemu_global_mutex&gt;) at ../nptl/pthread_mute=
x_lock.c:80<br>
&gt; #2&nbsp; 0x00007ffff6559ef8 in __pthread_cond_wait_common (abstime=3D0=
x0, mutex=3D0x5555568bb280 &lt;qemu_global_mutex&gt;, cond=3D0x555556cecc30=
) at pthread_cond_wait.c:645<br>
&gt; #3&nbsp; 0x00007ffff6559ef8 in __pthread_cond_wait (cond=3D0x555556cec=
c30, mutex=3D0x5555568bb280 &lt;qemu_global_mutex&gt;) at pthread_cond_wait=
.c:655<br>
&gt; #4&nbsp; 0x000055555604f717 in qemu_cond_wait_impl (cond=3D0x555556cec=
c30, mutex=3D0x5555568bb280 &lt;qemu_global_mutex&gt;, file=3D0x5555561ca86=
9 &quot;../softmmu/cpus.c&quot;, line=3D514) at ../util/qemu-thread-posix.c=
:194<br>
&gt; #5&nbsp; 0x0000555555d28a4a in qemu_cond_wait_iothread (cond=3D0x55555=
6cecc30) at ../softmmu/cpus.c:514<br>
&gt; #6&nbsp; 0x0000555555d28781 in qemu_wait_io_event (cpu=3D0x555556ce02c=
0) at ../softmmu/cpus.c:425<br>
&gt; #7&nbsp; 0x0000555555e5da75 in kvm_vcpu_thread_fn (arg=3D0x555556ce02c=
0) at ../accel/kvm/kvm-accel-ops.c:54<br>
&gt; #8&nbsp; 0x000055555604feed in qemu_thread_start (args=3D0x555556cecc7=
0) at ../util/qemu-thread-posix.c:541<br>
&gt; #9&nbsp; 0x00007ffff6553fa3 in start_thread (arg=3D&lt;optimized out&g=
t;) at pthread_create.c:486<br>
&gt; #10 0x00007ffff64824cf in clone () at ../sysdeps/unix/sysv/linux/x86_6=
4/clone.S:95<br>
<br>
Would you please add below to your ~/.gdbinit script?<br>
<br>
&nbsp; handle SIGUSR1 nostop noprint<br>
<br>
Or just run without gdb and wait it to crash with SIGABRT.<br>
<br>
Thanks,<br>
<br>
-- <br>
Peter Xu<br>
<br>
</div>
</span></font><br>
</div>
</body>
</html>

--_000_CH0PR02MB789857DE73B0A9B1FC29593E8BE19CH0PR02MB7898namp_--

