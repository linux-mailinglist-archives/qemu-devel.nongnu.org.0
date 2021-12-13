Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9144725F6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:49:49 +0100 (CET)
Received: from localhost ([::1]:57330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwhxq-0006GH-3l
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:49:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mwhv8-0005NA-Lh; Mon, 13 Dec 2021 04:46:58 -0500
Received: from mga18.intel.com ([134.134.136.126]:56626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mwhv0-00061h-Ic; Mon, 13 Dec 2021 04:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639388810; x=1670924810;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+SpZLxqZGjLc0T5ZZPFb0QarDQqs9eIFUnhgGXT+KIU=;
 b=ASGQGtS7GZ3KnfY798DGxSj+spiGdD9UuQAZYGPJc8WOldjlkr4fG40Z
 tQM4s1HprWI0oBO1zXF+mrmJbwTXogbgT2w7N8dldHnlBvfUJYrKn87nQ
 h4pxDcfOj62hWjq/mhockHxFuSGx0bJsWFVGhlwxnV8yYysUjo5sueO+8
 WoLHPEqamvv1biJ2V8BPrlBR+Qjei7CG3R0BIgo+Iv65F4CODwHBLBjNN
 U8Yj4nfi7u7apLXEvfAcfNHf07lWf4ZXuDVVwVqeE9/u+C4yBV1XmtDtY
 osgzG74NDtM5Jtf4NW0W9qOuK/ZRoKYXXOtuSIS+eryhxqA9IMDbZdiYg A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="225559838"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="225559838"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 01:46:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="608968535"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2021 01:46:20 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 01:46:19 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 01:46:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 01:46:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 01:46:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUSD7T47ntiTXyINmlIe1/E26zW/uyK0SPMUQqtT7DqYlzEiiUQea5VTTd7vj5JaEsmd/sYFLtOCjah8Tutqt2p1ix34/zl9lxJIh9UErUUXxyvDybIgamIJ5J+bpT1NinTG1PSaKW+rWOMmH67q/yBsJC7ePBP4XPhgyLt3cLoMnJ9KWOaWWFgp+IoVGMeFbTquzd/MDqserWAhepdsRp6K2LN2u+iJEqxC5ID3CEWv/jHEhYu8NvUkVLmtG7pehSmwXRZbiNCxiGbIX0mTQRoQPrUa8ZE+9uz5y764HgFc6fnhX5GDnIB1GBQz6JC2+XKpj1ydSjIL8/fMuDu6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ef7RHUuY8cc/ExXUUUFStJwkpspK8e1V/0TTtkD5Fk=;
 b=kC/LuRFfQBsPKt0NighAd61KWMz9hAdi2V7w2i5E3ee6asObqkRUkoW+Dzs/Le/oaogqgFLRh/8Xgk9MgNxl7HLuu3DijpHVrjUhNZJrwIV++b8b9/TlAcr8CAUZlNwlls2h3sFOWw3+yG1+UeGNlAg55beVeA1eCcCyeomPGjczSDJnA6f8RElgwsmIrAjpfiphFJFc7dfyi/C+TTQ62+dSn5fmj0X75h/JGeV5glmC14n1f6BLosi1Uc34Zg3HJfJOsFgjBqsjwUyCfaeEtF4EwQ/FXgflhoIGBYqVsM0h8vii4Tw0GBVKI+RClQatHdw51vzTD9ITOCSkjTdsIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ef7RHUuY8cc/ExXUUUFStJwkpspK8e1V/0TTtkD5Fk=;
 b=theNIdkEf5DEG1LvZmDA9+WsbzKC5F1pihTG7Db7J4mhbjXaPSak3KNGQbp8+PmJ5JVX412AYacGgG/bg7FImOgJJFbH6RX98ZbdBDO1D+A3tEFpz2qAkXrC4LugBRqLlkr0g1bPsPepuDDG6Ranoad12/SrveW+KKFzNAIvEuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5672.namprd11.prod.outlook.com (2603:10b6:8:26::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12; Mon, 13 Dec 2021 09:46:17 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::385a:cb1d:904b:f18]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::385a:cb1d:904b:f18%5]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 09:46:17 +0000
Message-ID: <36925145-0556-f637-2a15-7bdb8d3fee0d@intel.com>
Date: Mon, 13 Dec 2021 17:46:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits
 cleanly in some corner case
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211201075427.155702-1-lei.rao@intel.com>
 <Yac8B76dAulyx+2T@redhat.com>
 <DM8PR11MB5640D2F156E53A0CD644AC71FD689@DM8PR11MB5640.namprd11.prod.outlook.com>
 <a1706788-2f28-9948-f68f-a6fd51b81fa3@virtuozzo.com>
 <836f8fe3-5262-d179-a66a-325935ec7005@intel.com>
 <YaiJgpEahjc1OyR4@redhat.com>
 <baf86cd2-7b88-7206-a215-a9ed91c16fa2@virtuozzo.com>
 <22da77b0-114a-49b0-9ec5-588556697fa2@intel.com>
 <3bfce568-8ec4-420e-482d-8af30de19ab6@intel.com>
 <ad009f7d-7a9c-9c89-47c6-46bc8e8091a2@virtuozzo.com>
From: "Rao, Lei" <lei.rao@intel.com>
In-Reply-To: <ad009f7d-7a9c-9c89-47c6-46bc8e8091a2@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To DM8PR11MB5640.namprd11.prod.outlook.com
 (2603:10b6:8:3f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50f95a19-6914-4942-658d-08d9be1d68dc
X-MS-TrafficTypeDiagnostic: DM8PR11MB5672:EE_
X-Microsoft-Antispam-PRVS: <DM8PR11MB56729A782FEBE78545907A87FD749@DM8PR11MB5672.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w7scEazyEkdT7vbv973EnBDPQtlZ749tREaVFKfNtC1zXWTo/8boUZsql4F5Nx1yfEEb7N1uq1PWOYX/mXCu53G9XeV+PteM9s1yuSmm+Nw8AiqAGz9LyqCQl40S8PxdASdhayfIgrztuc69c2bGDG695w4nes1VzMzqguL4jS+w+yuzZl2RuxThGcdmS6IBZB5iA+MbU+zXImjYNB914aIn7Mz4BOGL8gdxIuHQNI2tOqGzJikOxKkr+AHy6+c1mzdwPvcmdxmmnddA712SI8Cj/nl6r6qAkX07AkiHX2oBcYVXct3DWknnn37QDGYyH4F5a1cQiz9B/yZBNkFyk2xQPogqIqfzTXjoP+rqUZzpDaJ8IwGZww1e7NOeeaXKkwU25NswCp1zzVp/HUf/QrwiU7aBCd74QBm/ZwAHzw6IxUd+EtUZ8iW2YX+H+niRpWfyqB9mzyPFkKojb0K30mebSky6eY4I2HoTezivSNAXHcXS6am1eeWyZrPIIHdTzzBhuoXqUUPy1nzVcywRC7rEydwdqAOKTtgyiu5uPl93twOaJwzuOLFasBzcXjhfH+pz91D5XuzSam9X47k0j2W+qR2tBMW7NMvVRyb5jAg/P8cGTOwUQRZdXliFknjPjaG2gh4+Mp4an9MSIzoi2gmARu08lXq8VvGAHVPYOB2YV4Xo7UcMvCRrOMdtCUX0n7UzHgbVl6IK6JqFjyrcEt6x62gwwHwUFcmhe4/15UzmjicKB/b7FSkzU8FH00cEt89C/+yGeyEIVC3WHU+6hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(6512007)(66946007)(83380400001)(66556008)(6486002)(2616005)(31686004)(4326008)(66476007)(36756003)(2906002)(8936002)(86362001)(26005)(6506007)(53546011)(54906003)(186003)(110136005)(82960400001)(5660300002)(508600001)(38100700002)(30864003)(8676002)(316002)(31696002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1hPS3ludHlsZ0VPN0dtdHlHR0pwMkd0SzBXZ25UT2VpaTljOFdqQVVaUUxK?=
 =?utf-8?B?dnUrOGUxM2xlUU1wSXM1aUxwWTcvTHVCd3d0UFRRUGdQblM0aDNFMDJRd2Y5?=
 =?utf-8?B?aHA4TThQamc5L2VYU1RlZWkwcEg3U0w0OVZVMnhueUp2djZVeEJZRVQ2MzNX?=
 =?utf-8?B?c1lBdnNhSzd5WGlZVHY4Vlh5N09zTlFkZEQzb3drWHZiZmV6VmtuS1B4OEFa?=
 =?utf-8?B?QzhRc0VNb2hGV0I2REtCWit4a2hLV011RkhyV1R6UnNFUUtIL2t4MzNGZWVZ?=
 =?utf-8?B?S0dVSHdPUlQ2K0R0N3YzVmRJTEJKdnRVajhsNG82bTZMK3N3Y3J3WXpqUGpR?=
 =?utf-8?B?UFJMUXd3R1VJNWNKWEJpNktPQzVCUmtFRHQxSEl0RlBNQmtXN3N4eVdSRmtx?=
 =?utf-8?B?a3FpRXNOZHEycm9DR3BEc1VmdWtJWUdITlN4TmxzSU96T2cxUHd1cnhUQ2pi?=
 =?utf-8?B?OW9la2ZSTGNlTXZtWXZRZXRneHZySmF0Mlk4cUltaXowZTFTaXhnQWlzSUY4?=
 =?utf-8?B?WDgrcFl4TEtvZ0VOZS92YWV0ZEYwM0VUVjNUOFpURzRLTzVOMjJUaGJqODlF?=
 =?utf-8?B?QWRxM0diZkl0MHVvdEFQRGRibnV0QzE0QkRISVRkcUdJOW1Fd1lPR0xFYlkz?=
 =?utf-8?B?MWQ2SFhPMTRhMXdSeG1HQzlraSsyT1RhVVgrSGZrZEp3RGRMY0pUYUVzSUdJ?=
 =?utf-8?B?dG0wbWs2c1Izck1kMjJKeDhkTkZDUGxHZE5tN01odVZMMFBYaTlQUS9aUmNs?=
 =?utf-8?B?ZDg5eENodkp5Q1FwMjV2Tkx6N21sbzBrUXZxOHROc1lUcmV3dTdMTUozVUx3?=
 =?utf-8?B?TUtzZUp0N01mN0ltTVRySGlqMld2SEFEZ3Z6akY3dm1aTDN2eHZxbFE3dEhi?=
 =?utf-8?B?cDNaTXB4OFB4UFpEbzkrOWtrdUxyTVFkeWpCbTBqell4MGhrYjhoOE5oWldm?=
 =?utf-8?B?cXptaXd2aHNzSnRib2ZjZlUwQ0Nway9Mdk13YXlOQXBSUkZQU1E0WnlXYXh3?=
 =?utf-8?B?c2h5cHJ2SlRiZHhUTk0xNVBTdkdpWTFGTmo1SDlWcTdndkpndnVnRWZSenlQ?=
 =?utf-8?B?bEtDZWYyZ0JuaFZ1UVNlb01UQWFyQXcwRnA3K2hOc09jbjNlQU9nV2Z5ZnIx?=
 =?utf-8?B?cGVTR0J0NlQ3NGYyN3M2TDM3YkN3WU9xczdYOXpGOUtlbmhTMVhRSitaR3pX?=
 =?utf-8?B?Z1IwV2dJUzQ4NmR0RW8zNHhsbjdSWnNzSlRrNUEvbmNobEllV2FUMVhoRWk4?=
 =?utf-8?B?QWZqRWhIdnlOQWthUFFCa05KR284d2x4M2hVSGlSYU5ha0FtWkN4NWoyd2VQ?=
 =?utf-8?B?RkV2SDdWVldPaHBwQzdkb3ZCbnB5QWd1V2pZb0FDNGpRQXJBeHZlVU1zSGFw?=
 =?utf-8?B?Um0yLzczNzFTM0JqeDUzMlNtSm01cy9nTDZRUEV6c1cvWDNCRHZXZFhQeE82?=
 =?utf-8?B?Q3NJb2xrcmtpa1BXUW9ZdC9wd1krdk56VnVsWk9tM1lmOGVyQ1FTNDB1VEh6?=
 =?utf-8?B?SDhBeVZFTUtFYmlmbHc3aEhFZW1sWm93VmNXZVQ4cTRxOC9aYWV0SXc3aVBB?=
 =?utf-8?B?eng5V25rVEtVK2FrRG9wUWE0cmE2ODVhM2dWNkhRK05vRXQ1RDBJRFVYeWov?=
 =?utf-8?B?UnVMbCtWekZBcTFiMDVZUkI3YjhkNmZtSkc0Q2p1bWh3bkh5S1RMQ1JDOFEr?=
 =?utf-8?B?Y1BIZFFsOFA2MU42RzhXNjhNeFhZZ055UGsvT2hUcEErS3ljWm9zTG95dEJp?=
 =?utf-8?B?a2lUSGFBU05TYktTdGxpTmVlbWQyTHgrQVZSSUhLVVQ1YzZUVUROZ2JqUWNx?=
 =?utf-8?B?cHBIS2ZUWUE3ejA0M3Ryb0VjVGZrakFOR0xTTnhhTS9jaVdLZ2R4dUlibWJK?=
 =?utf-8?B?dUF1Z0QvOENSbEdlK2J4R3MzMUhnWndhalQ5dE5TaTN3b041MEdZcEtSbFBt?=
 =?utf-8?B?dkJVZVNGWjk3TDBhbVI2NUo5bkt1S042cFNDTnBqcG5Pb2FWTXZoNUJNOGxl?=
 =?utf-8?B?ZlR4S1duRkJpQStHd2ZsaHBQT2Q3UWhGR1h1clA4UFdLM3pLb25iSFpyOGw1?=
 =?utf-8?B?QTNyR1JtcmlMc2NTSEZhcHRRWHBKTy9iVXRBelQ5TFdvUmNrY1BVc0NOaE1r?=
 =?utf-8?B?VmFPS0dEellDTzJtdk90Y2doMGxZb0FxY2tEUVA0OTZtS29DeUpOdnFuYTcr?=
 =?utf-8?Q?oUQaGGihx2v49bXUm/ZG/5o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f95a19-6914-4942-658d-08d9be1d68dc
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:46:17.3650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkG+Ez8IXHqPrkv8Gasu5FHtwC1GdTsQzy5QCZO+M5Bnwwp7MczFx0EwYYnEc1dBOYVSyyyrpCXY30gxsl+t8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5672
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126; envelope-from=lei.rao@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -84
X-Spam_score: -8.5
X-Spam_bar: --------
X-Spam_report: (-8.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/13/2021 4:38 PM, Vladimir Sementsov-Ogievskiy wrote:
> 13.12.2021 11:02, Rao, Lei wrote:
>>
>>
>> On 12/3/2021 9:26 AM, Rao, Lei wrote:
>>>
>>>
>>> On 12/2/2021 5:54 PM, Vladimir Sementsov-Ogievskiy wrote:
>>>> 02.12.2021 11:53, Daniel P. Berrangé wrote:
>>>>> On Thu, Dec 02, 2021 at 01:14:47PM +0800, Rao, Lei wrote:
>>>>>> Sorry, resending with correct indentation and quoting.
>>>>>>
>>>>>> On 12/1/2021 10:27 PM, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>> 01.12.2021 12:48, Rao, Lei wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>>>>>>> Sent: Wednesday, December 1, 2021 5:11 PM
>>>>>>>> To: Rao, Lei <lei.rao@intel.com>
>>>>>>>> Cc: Zhang, Chen <chen.zhang@intel.com>; eblake@redhat.com; vsementsov@virtuozzo.com; kwolf@redhat.com; hreitz@redhat.com; qemu-block@nongnu.org; qemu-devel@nongnu.org
>>>>>>>> Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits cleanly in some corner case
>>>>>>>>
>>>>>>>> On Wed, Dec 01, 2021 at 03:54:27PM +0800, Rao, Lei wrote:
>>>>>>>>>       We found that the QIO channel coroutine could not be awakened in some corner cases during our stress test for COLO.
>>>>>>>>>       The patch fixes as follow:
>>>>>>>>>           #0  0x00007fad72e24bf6 in __ppoll (fds=0x5563d75861f0, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>>>>>>>>>           #1  0x00005563d6977c68 in qemu_poll_ns (fds=0x5563d75861f0, nfds=1, timeout=599999697630) at util/qemu-timer.c:348
>>>>>>>>>           #2  0x00005563d697ac44 in aio_poll (ctx=0x5563d755dfa0, blocking=true) at util/aio-posix.c:669
>>>>>>>>>           #3  0x00005563d68ba24f in bdrv_do_drained_begin (bs=0x5563d75ea0c0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:432
>>>>>>>>>           #4  0x00005563d68ba338 in bdrv_drained_begin (bs=0x5563d75ea0c0) at block/io.c:438
>>>>>>>>>           #5  0x00005563d689c6d2 in quorum_del_child (bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block/quorum.c:1063
>>>>>>>>>           #6  0x00005563d684328f in bdrv_del_child (parent_bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block.c:6568
>>>>>>>>>           #7  0x00005563d658499e in qmp_x_blockdev_change (parent=0x5563d80ec4c0 "colo-disk0", has_child=true, child=0x5563d7577d30 "children.1", has_node=false, node=0x0,errp=0x7fff3cf5b960) at blockdev.c:4494
>>>>>>>>>           #8  0x00005563d67e8b4e in qmp_marshal_x_blockdev_change (args=0x7fad6400ada0, ret=0x7fff3cf5b9f8, errp=0x7fff3cf5b9f0) at qapi/qapi-commands-block-core.c:1538
>>>>>>>>>           #9  0x00005563d691cd9e in do_qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true, errp=0x7fff3cf5ba98)
>>>>>>>>>               at qapi/qmp-dispatch.c:132
>>>>>>>>>           #10 0x00005563d691cfab in qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true) at qapi/qmp-dispatch.c:175
>>>>>>>>>           #11 0x00005563d67b7787 in monitor_qmp_dispatch (mon=0x5563d7605d40, req=0x7fad64009d80) at monitor/qmp.c:145
>>>>>>>>>           #12 0x00005563d67b7b24 in monitor_qmp_bh_dispatcher (data=0x0) at monitor/qmp.c:234
>>>>>>>>>           #13 0x00005563d69754c2 in aio_bh_call (bh=0x5563d7473230) at util/async.c:89
>>>>>>>>>           #14 0x00005563d697555e in aio_bh_poll (ctx=0x5563d7471da0) at util/async.c:117
>>>>>>>>>           #15 0x00005563d697a423 in aio_dispatch (ctx=0x5563d7471da0) at util/aio-posix.c:459
>>>>>>>>>           #16 0x00005563d6975917 in aio_ctx_dispatch (source=0x5563d7471da0, callback=0x0, user_data=0x0) at util/async.c:260
>>>>>>>>>           #17 0x00007fad730e1fbd in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
>>>>>>>>>           #18 0x00005563d6978cda in glib_pollfds_poll () at util/main-loop.c:219
>>>>>>>>>           #19 0x00005563d6978d58 in os_host_main_loop_wait (timeout=977650) at util/main-loop.c:242
>>>>>>>>>           #20 0x00005563d6978e69 in main_loop_wait (nonblocking=0) at util/main-loop.c:518
>>>>>>>>>           #21 0x00005563d658f5ed in main_loop () at vl.c:1814
>>>>>>>>>           #22 0x00005563d6596bb7 in main (argc=61, argv=0x7fff3cf5c0c8,
>>>>>>>>> envp=0x7fff3cf5c2b8) at vl.c:450
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Signed-off-by: Lei Rao <lei.rao@intel.com>
>>>>>>>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>>>>>>>> ---
>>>>>>>>>    block/nbd.c          |  5 +++++
>>>>>>>>>    include/io/channel.h | 19 +++++++++++++++++++
>>>>>>>>>    io/channel.c         | 22 ++++++++++++++++++++++
>>>>>>>>>    3 files changed, 46 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/block/nbd.c b/block/nbd.c index 5ef462db1b..5ee4eaaf57
>>>>>>>>> 100644
>>>>>>>>> --- a/block/nbd.c
>>>>>>>>> +++ b/block/nbd.c
>>>>>>>>> @@ -208,6 +208,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>>>>>>>>>        assert(!s->in_flight);
>>>>>>>>>        if (s->ioc) {
>>>>>>>>> +        qio_channel_set_force_quit(s->ioc, true);
>>>>>>>>> +        qio_channel_coroutines_wake(s->ioc);
>>>>>>>>>            qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH,
>>>>>>>>> NULL);
>>>>>>>>
>>>>>>>> Calling shutdown here should already be causing the qio_chanel_readv_all to wakeup and break out of its
>>>>>>>> poll() loop. We shouldn't need to add a second way to break out of the poll().
>>>>>>>>
>>>>>>>> Calling shutdown can wake up the coroutines which is polling. But I think it's not enough. I tried to forcibly wake up the NBD coroutine,
>>>>>>>> It may cause segment fault. The root cause is that it will continue to access ioc->xxx in qio_channel_yield(), but the ioc has been released and set it NULL such as in
>>>>>>>> nbd_co_do_establish_connection(); I think call shutdown will have the same result. So, I add the force_quit, once set it true, it will immediately exit without accessing IOC.
>>>>>>>>
>>>>>>>
>>>>>>> What do you mean by "the NBD coroutine" and by "forcibly wake up"?
>>>>>>>
>>>>>>> In recent Qemu there is no specific NBD coroutine. Only request coroutines should exist.
>>>>>>>
>>>>>>> Forcibly waking up any coroutine is generally unsafe in Qemu, most of the code is not prepared for this, crash is normal result for such try.
>>>>>>>
>>>>>>> Also, there is good mechanism to debug coroutines in gdb:
>>>>>>>
>>>>>>> source scripts/qemu-gdb.py
>>>>>>> qemu coroutine <coroutine pointer>
>>>>>>>
>>>>>>> - it will dump stack trace of a coroutine, it may help.
>>>>>>>
>>>>>>> Also, to find coroutines look at bs->tracked_requests list, all requests of bs are in the list with coroutine pointers in .co field.
>>>>>>
>>>>>> I am sorry for the unclear description. The NBD coroutine means the request coroutines.
>>>>>>
>>>>>> About "the forcibly wake up" I just set the receiving to true before qio_channel_writev_all() in nbd_co_send_request()
>>>>>> to ensure that the request coroutines can be awakened by nbd_recv_coroutine_wake_one(). But that's just a test.
>>>>
>>>> I'm not sure that it's safe. On nbd_channel_error() we call qio_channel_shutdown() - it should wake up everything that sleep in qio_channel code. The .receiving field is only for nbd.c specific internal yield point.
>>>>
>>>> Could your change itself lead to the crash I'm not sure too.
>>>>
>>>> Still, on normal execution paths, there shouldn't be a situation when some qio_channel_writev_full_all() is still executing during nbd_co_do_establish_connection(). If it is - it's a bug in nbd.c of course.
>>>>
>>>> To check it without changing the .receiving field, you should print all stacks of nbd request coroutines at the point of qemu hang. What they all are doing?
>>>>
>>>> If one of them is in nbd_co_do_establish_connection() and another is in nbd_co_do_establish_connection()  - that's a bug.
>>>
>>> OK，I will try to reproduce this bug again, but this may take some time. Previously in our stress test, it usually takes two or three days to hit this issue.
>>
>>
>> The bug can be reproduced in the latest QEMU. But the root cause is different due to QEMU code change.
>> The gdb stack is as follows:
>>
>> #0 0x00007fe00c53dbf6 in __ppoll (fds=0x7fdbcc140f40, nfds=2, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>> #1 0x000055c67de72a11 in qemu_poll_ns (fds=0x7fdbcc140f40, nfds=2, timeout=-1) at ../util/qemu-timer.c:336
>> #2 0x000055c67de43fab in fdmon_poll_wait (ctx=0x55c67ea73ca0, ready_list=0x7fdbec9fe730, timeout=-1) at ../util/fdmon-poll.c:80
>> #3 0x000055c67de4387b in aio_poll (ctx=0x55c67ea73ca0, blocking=true) at ../util/aio-posix.c:607
>> #4 0x000055c67dd1230a in bdrv_drain_all_begin () at ../block/io.c:675
>> #5 0x000055c67dd1271a in bdrv_drain_all () at ../block/io.c:726
>> #6 0x000055c67db3b1a2 in do_vm_stop (state=RUN_STATE_COLO, send_stop=true) at ../softmmu/cpus.c:268
>> #7 0x000055c67db3bec9 in vm_stop (state=RUN_STATE_COLO) at ../softmmu/cpus.c:658
>> #8 0x000055c67db3bf9d in vm_stop_force_state (state=RUN_STATE_COLO) at ../softmmu/cpus.c:707
>> #9 0x000055c67d8159da in colo_incoming_process_checkpoint (mis=0x55c67ed0d550, fb=0x7fdbcc135f40, bioc=0x7fdbcc02d010, errp=0x7fdbec9fe928)at ../migration/colo.c:685
>> #10 0x000055c67d815e3f in colo_wait_handle_message (mis=0x55c67ed0d550, fb=0x7fdbcc135f40, bioc=0x7fdbcc02d010, errp=0x7fdbec9fe928)at ../migration/colo.c:815
>> #11 0x000055c67d81604a in colo_process_incoming_thread (opaque=0x55c67ed0d550) at ../migration/colo.c:883
>> #12 0x000055c67de47e1d in qemu_thread_start (args=0x55c67f1bb380) at ../util/qemu-thread-posix.c:556
>> #13 0x00007fe00c625609 in start_thread (arg=<optimized out>) at pthread_create.c:477
>>
>>  From the call trace, we can see the thread of COLO is hung in bdrv_drain_all(). Specifically, it is hung in blk_root_drained_poll().
>>
>> After analysis, the root cause is that, when the QEMU is draining IO, the nbd_drianed_poll returns true because there are some
>> IO requests not completed. This causes aio_poll having no chance to return.
>>
>> The data dump of the NBD client is as follows:
>>
>> (gdb) p client
>> $41 = (NBDClient *) 0x5639f19754a0
>> (gdb) p *client
>> $42 = {refcount = 3, close_fn = 0x5639ef270bd4 <nbd_blockdev_client_closed>, exp = 0x5639f1d769d0, tlscreds = 0x0, tlsauthz = 0x0, sioc = 0x5639f1d8aa20,
>>    ioc = 0x5639f1d8aa20, recv_coroutine = 0x5639f183bb10, send_lock = {locked = 0, ctx = 0x0, from_push = {slh_first = 0x0}, to_pop = {slh_first = 0x0},
>>      handoff = 0, sequence = 0, holder = 0x0}, send_coroutine = 0x0, read_yielding = false, quiescing = true, next = {tqe_next = 0x0, tqe_circ = {
>>        tql_next = 0x0, tql_prev = 0x5639f1d76a28}}, nb_requests = 1, closing = false, check_align = 1, structured_reply = true, export_meta = {
>>      exp = 0x5639f1d769d0, count = 1, base_allocation = true, allocation_depth = false, bitmaps = 0x0}, opt = 7, optlen = 0}
>>
>> We can see the nb_requests = 1. That means there is an IO request not completed on the NBD server side.
>> And the NBD receive coroutine is as follows:
>>
>> (gdb) qemu coroutine 0x5639f183bb10
>> #0  0x00005639ef3fe50b in qemu_coroutine_switch (from_=0x5639f183bb10, to_=0x7fd0f5fff5a0, action=COROUTINE_YIELD) at ../util/coroutine-ucontext.c:302
>> #1  0x00005639ef40dfc2 in qemu_coroutine_yield () at ../util/qemu-coroutine.c:193
>> #2  0x00005639ef24e4db in qio_channel_yield (ioc=0x5639f1d8aa20, condition=G_IO_IN) at ../io/channel.c:545
>> #3  0x00005639ef24d71a in qio_channel_readv_full_all_eof (ioc=0x5639f1d8aa20, iov=0x7fcc20edcde0, niov=1, fds=0x0, nfds=0x0, errp=0x7fcc20edcf10)
>>      at ../io/channel.c:138
>> #4  0x00005639ef24d8df in qio_channel_readv_full_all (ioc=0x5639f1d8aa20, iov=0x7fcc20edcde0, niov=1, fds=0x0, nfds=0x0, errp=0x7fcc20edcf10)
>>      at ../io/channel.c:202
>> #5  0x00005639ef24d5ec in qio_channel_readv_all (ioc=0x5639f1d8aa20, iov=0x7fcc20edcde0, niov=1, errp=0x7fcc20edcf10) at ../io/channel.c:103
>> #6  0x00005639ef24dd1d in qio_channel_read_all (ioc=0x5639f1d8aa20, buf=0x5639f30eb000 "", buflen=19660800, errp=0x7fcc20edcf10) at ../io/channel.c:320
>> #7  0x00005639ef25ec54 in nbd_read (ioc=0x5639f1d8aa20, buffer=0x5639f30eb000, size=19660800, desc=0x5639ef5ae73a "CMD_WRITE data", errp=0x7fcc20edcf10)
>>      at /home/workspace/qemu/include/block/nbd.h:361
>> #8  0x00005639ef264682 in nbd_co_receive_request (req=0x5639f1744a50, request=0x7fcc20edcf30, errp=0x7fcc20edcf10) at ../nbd/server.c:2328
>> #9  0x00005639ef2652b3 in nbd_trip (opaque=0x5639f19754a0) at ../nbd/server.c:2629
>> #10 0x00005639ef3fe20a in coroutine_trampoline (i0=-243025136, i1=22073) at ../util/coroutine-ucontext.c:173
>> #11 0x00007fd52da17660 in __start_context () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
> 
> 
> So client side hangs in bdrv_drain_all_begin() yes? We see that server side waits for data of NBD_CMD_WRITE, it's normal for server side.
> 
> But what is going on in the client, we don't know. We need also a call stack of coroutine of tracked request on the client side. So on client, you should look bs->tracked_requests list, where bs is BlockDriverState of nbd node, and check .co field of the request, that's a coroutine, and run qemu coroutine command.
> 
> 
>>
>> We can see the NBD server is trying to read data from NBD client, while NBD client can't reply data
>> in time because the QEMU main thread is busy on other tasks. So, the IO request can't be completed
>> Then it will hang here. The point is we can't assume NBD client behaves like local block driver,
>> network/NBD client side maybe have delay,etc...
> 
> Yes, but on channel_shutdown it should finish immediately, isn't it?
> 
> Also, you don't say about any network problems in your environment, so we are not saying about hard disconnect?
> 
> There still may be some bug, that can be fixed.
> 
>>
>> Although this issue happens in COLO stress test, this looks like a generic problem.
>> if NBD is involved, any usage of bdrv_drain_all() will depend on NBD client to complete all the requests.
>> However, generally we shouldn't depend on the NBD client side because all bad things can happen on network.
> 
> 
> Yes, bdrv_drain_all() waits for all in-flight requests to finish, and if we have long requests, we can wait for a long time.
> 
> For example, if nbd reconnect-delay is set to 30 seconds (I don't think that it's your case?), and server disconnected, bdrv_drain_all will hang up to 30 seconds. To avoid this hang on block-job cancelling (assume you have mirror job, you want to cancel it, but you have to wait 30 seconds for drain) there was implemented bdrv_cancel_in_flight(), called from mirror_cancel(), that finally cancel all requests waiting for connection.
> 
> Another example, is hard disconnect of the server: in this case tcp io may hang for a long time. To avoid this, you should setup keep-alive properly.
> 
> But as I understand, that's all not your problems, as network is OK?

There is no network issue. This is COLO usage. There are COLO primary VM and secodary VM running on different physical nodes. Primary VM constantly sync disk data to secondary VM via NBD, in which secondary VM is NBD server and
primary VM is NBD client.

In this specific issue, due to some COLO bugs, primary VM hangs in some scenario which causes NBD client hang, so no data return to NBD server.

We can fix this issue in COLO. However, I am thinking this may also show an issue in NBD. NBD server shouldn't wait forever for client side in the nbd_drained_poll() if nb_requests is not equal to zero. What do you think?

Thanks,
Lei

> 
>>
>> To solve this COLO issue, one option is, we can slightly change COLO operation sequence to drain IO in the
>> a NBD client before the NBD server drains IO.
> 
> What you mean by drain in NBD server? As I see from call stacks, drain is on the client side, and on the server we just serve requsts..
> 
> 
> 

