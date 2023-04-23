Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9536EBC7C
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 04:43:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqPfm-0007Eb-VR; Sat, 22 Apr 2023 22:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pqPfk-0007CX-RC; Sat, 22 Apr 2023 22:41:52 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pqPfh-0002qF-IS; Sat, 22 Apr 2023 22:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682217709; x=1713753709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QBPeQw4fBYPSW6JMjtYj6D0iCGRr8RUu8ahfkQOkfws=;
 b=BSteqgp0xctOuRkooKorXV2txpC0vPIAthTrK/efWzEsq3vtqkv/qTDt
 cU+DAv65fUZdjAJAnFkVUTvZCZahWgM8T6E3qLizYFw2iw1t/K0QWYmqU
 lRZNJYJL8hv5pTQe2JJhr/lEpEXu+xmobiQ172OI4ZBbUTW2TK3LNLihe
 GepADvloxYXzASQTDWKlf83k2BCkRJQB1TpAFodkgMTqFbpRDeB8dbqeV
 kVhBpaJFiSJVWhKztw3Wzb0T2f0t4gv+ladc7w74DpowPAzUdZ0L1XcNV
 LPdLuCdDrXeDejhJ2hGJ9+Q+uIvMng6FaUSwUklk+vMg0faqmsrDyVPcw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="349026987"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="349026987"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 19:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="938894588"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="938894588"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2023 19:41:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 19:41:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 22 Apr 2023 19:41:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 22 Apr 2023 19:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHwHezAIluwuvU/WsZiLaniwRNRq5ZLL6zTtGWCQ/Qrm85tqyjf6MzsTHO2Noul18LYhZsd4a19hzNpOTsCEBnKIPBce37Tyi39+rT0L5YLmty5Pa2lC9QkSUODE/tK6yzQv+/Cz7zuvjJppRy1xRPKCckau4Urjex2Dtrys8ChECidbnGKd4yVLFPu52sNkfhcAdiX3ot+cwNFETf11uwMJMk6yc3HFhY6Ggcs5vnX5i785DmRQ0kts3zyYNVsVhXj8nE2OfshgLRLK0fGbonz6YUkhFU6N8R7a9QR3P73R2kr5JANl+OOyUkMCBv7jDaqcKGaTd5yMEQMUzOeIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcQWtrVxB84SOaGlwTBkxyNTLHgbLtmB09h9Q+wkM+8=;
 b=QaE2znuZMBvCvIZrPM8z/zn3buHFraQ99ceVtGuIuUSLX+oPRWc65GzE406ibXopi+nUGuNzZo7tpP9OBTa5pFEeCPf/+7ldbxRYhf5whlir/tbBWXuBGeTyiLr8aY46SWRAuXCVh7ja9wQ4WjzbT/bCAKMzEwu1PY+EScrYRu/rBaw3+/NkZqqz+g8G359o0S8m/Q9XQlklVZ96GV2uZLiuTRkENK7Bhlhar009jJIaOKlCu1HCjfVSMZBZsC5DK5xRUUZ8DuVPtjWfEo0/MwBsQON4Ze4UQ/Wu26hCE9kK6YrgS6QC/2LKVCMW51i7mUsbxSk/fk2Zoey+ZZ9/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.28; Sun, 23 Apr
 2023 02:41:36 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6319.022; Sun, 23 Apr 2023
 02:41:35 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, John Snow
 <jsnow@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>, Juan Quintela
 <quintela@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Subject: RE: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow
 mode
Thread-Topic: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow
 mode
Thread-Index: AQHZdHTKShhY+wqne0aVVDdWYPck2a84MImw
Date: Sun, 23 Apr 2023 02:41:35 +0000
Message-ID: <MWHPR11MB0031E5A085809AEAA22AFB519B669@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-7-berrange@redhat.com>
In-Reply-To: <20230421171411.566300-7-berrange@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|CH3PR11MB7794:EE_
x-ms-office365-filtering-correlation-id: 49aedcf5-8a1c-4bff-b90a-08db43a4417e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aK5kHaWDEoSqGmhfbpmTQq7f6IfR/HJg2Dv2qsgis02biiPv2ivnNMub+r40hhcr+7lJAT5m0Y10Zj17ty9t+6OjZMUOl74OfZ7nsEa0BeptJOAOBmvHM+IfrwD5rnDMp3BFs9/j9bePHx1AyEjPRIxEZxAQVCLWZAB5djv/ZvH0CPO6k9nye7LW1n3eo08M8vFwvgCbQc64Ze2tZequGE4vur5K5mT4xcmubNC7KIUK3PC5znOj0/doc5qdO51gyY8Pw0KYJVSmkXENLyD+cxtSGhfH1M71HcxWszIXzdNjut9Chv4Imf+7YMC3YpamXlgBX5PieFYIwph87dqiwFHu42dJeTWWnCqZs2pMGCTLJgQIqjOx4ytSyYdXt0rjVWVhvDtCA/tp1LEpc6s1sTQTMbVDiXP8Ueu0rwSwZnjYadnAMh71wN4r7BnavadSEdVf1ls3QxStuSSWbfxY5oJLp8V+hXHtewSfjHi24oUVa7vo1VmE8tqlOOAh53XK8hBeoSPfRejJgu5Tftbfb/WSre3blfRsvJgjHdAj/Huo/TxVUBsIBFg6hRMLul8XlJbXhoD2WupOU4QnqTu/AEqDkpOdCKYPj+hRv8PypULJ+aY91jbNnV14xrmi1oRa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(38100700002)(55016003)(316002)(26005)(6506007)(186003)(4326008)(53546011)(9686003)(41300700001)(83380400001)(478600001)(110136005)(54906003)(64756008)(66476007)(66556008)(71200400001)(7696005)(66946007)(122000001)(2906002)(82960400001)(66446008)(33656002)(76116006)(38070700005)(86362001)(8676002)(8936002)(7416002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?H3yAOuqNSkRxyefF9MPlBJ6rmPVD+8FEeNRjMJS1C+KEQ7luZNirwzi5oC?=
 =?iso-8859-1?Q?gnE+yheaQZwPeWeG25Bs/muULEus0BLpo7YZM04ri3aKiGDZ/kXGFfq+0f?=
 =?iso-8859-1?Q?4Ns5aTeNSYglrfNAzJJeI91yM1jT/lrFECX2ya+AjsPeyl08rssO36eGhj?=
 =?iso-8859-1?Q?jr4deyN9GsaqbYYFwJaV0EUD3fqqZW2YSUnsCTfyy2/tNx25cAMo25f1cZ?=
 =?iso-8859-1?Q?5FMp6JP+Ea0DPm+7mX6S7yp/TeqfWAygq+biCpIQ3HSzdlwA3AV5yPLb5u?=
 =?iso-8859-1?Q?SHY3wyeYymfquyuQKrFtmmGTIO9/V4rueT19bEMTNI7URApmifSgPOxfF2?=
 =?iso-8859-1?Q?ZBXkIHIBcw+YUXvw6lSVzFyMLWgxDcOy8/6ok9Hivq3kI2GocPAzJ/scZ0?=
 =?iso-8859-1?Q?ZYRr6JwRRA9LWLup36QORFK+J0a9XTnxPn4TZ5GUKecAOyE6RmibkzFUkm?=
 =?iso-8859-1?Q?nZwK45eVp8itZ6eBm06hAww5XFxo6DjjwKsvoHIXCIMurzplTqDm9uLEBD?=
 =?iso-8859-1?Q?DaumD6et8/iPuZUK1WJa41C/vY7KXIYSsS1+FkOy3WcvCHbkEUlt8z/0kv?=
 =?iso-8859-1?Q?sX1HDQWGZK448tfS5JKz3sH5yXSh5mvW43xJLZo8LexOx4GOLjxPe7SNB+?=
 =?iso-8859-1?Q?MEshBMhGnvg1vxkMc9avFr+3Mb9/nbyGhA71ax06xkspj7x2Zvy4QSqeZq?=
 =?iso-8859-1?Q?TBJbDFcvm64xH2KAPUWPI0buMvq8YKrAhzLvXwWA3cfV1A84BX241a3uuD?=
 =?iso-8859-1?Q?Tej8DA5JhCuqlfzmYOzNnyuhJ7mL5vtzTQyywuvsttzv1R3NxADI6uOmoq?=
 =?iso-8859-1?Q?2Y1gRoCrYjSewmuXGMtcabnr5n2/DS5gf40GGIoCeZ6tstqff/BQSNfdUR?=
 =?iso-8859-1?Q?k6HuAfp1/xyTfIzQEWhetGnzQXKp5McQmq9X+hKaMm2+V3pV/GaitS2V/F?=
 =?iso-8859-1?Q?cVOmNt1O1SwMN3U92zad8OQLzPIPYciWQmKAAm9OurAbmiZ28yghskk3Rm?=
 =?iso-8859-1?Q?o+L9e9vQ4uVbckoAKNhZS3BPsq/ZMhduJcIa6cl5ERM9m5xYH0prXSRRou?=
 =?iso-8859-1?Q?m4UZP+pZHTFI6G9GFSPSvsnIRh6SbCdjV1uSlQZqRvVLOmj62gp2Tl04nO?=
 =?iso-8859-1?Q?MDgkbL4Fq2JhdpDxgYbD9YhZAJ8W7lhOd/ZwvX/skXDPvIPUhEiFdDINgD?=
 =?iso-8859-1?Q?Qx1Ybfekx3SIqiwqkwEALPrWq+kVNw16HXwmiA0u13aOuZNrecUD2UsqFn?=
 =?iso-8859-1?Q?b7p978eNM+C44cBDlz1eJDBsXf5WCI3kEMp49yDcRY1GCt2r8Pk3r3ekxd?=
 =?iso-8859-1?Q?fauZZUR3nnorO29CYbBsxSIQol7eTUh9JA04ojK4HDrKB0eKsp7SI8FR8l?=
 =?iso-8859-1?Q?9mCMZRZ2gm2dpFoE6kHb1lUzy36CnFNEOEQ7JD+CryCFQUIjhyIcWfKOtB?=
 =?iso-8859-1?Q?3gLh7zdxp9KiOwDVTV4Y9/cCNiT05i/Wl530sAGYed28HDJenRRb6hrF94?=
 =?iso-8859-1?Q?qnvSwNmJutZvRpcRFJXlwCGlelplZ7ji2x0b9KeFG5XohQpK50LTJyxQoy?=
 =?iso-8859-1?Q?UZ38MgPPjbSu5+9GOFgflXtW0v0/pUUv2oC+zl7Z4/uIiDlO7BvgDDRAX+?=
 =?iso-8859-1?Q?3Vs0ssWQHpMPI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49aedcf5-8a1c-4bff-b90a-08db43a4417e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2023 02:41:35.5118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bzjUJqf5TdpJbS5p0R0+141dZv3oeCQVIrFt2bi23gQZu5vhVnqn7diIcu11WUW2tr8mB2xJLySDfWS1cet7Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> -----Original Message-----
> From: Daniel P. Berrang=E9 <berrange@redhat.com>
> Sent: Saturday, April 22, 2023 1:14 AM
> To: qemu-devel@nongnu.org
> Cc: qemu-block@nongnu.org; Paolo Bonzini <pbonzini@redhat.com>;
> Thomas Huth <thuth@redhat.com>; John Snow <jsnow@redhat.com>; Li
> Zhijian <lizhijian@fujitsu.com>; Juan Quintela <quintela@redhat.com>;
> Stefan Hajnoczi <stefanha@redhat.com>; Zhang, Chen
> <chen.zhang@intel.com>; Laurent Vivier <lvivier@redhat.com>
> Subject: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow
> mode
>=20

What kind of scenario will the qtest open this g_test_init() -m slow to tri=
gger the slow mode?

Thanks
Chen

> From: Juan Quintela <quintela@redhat.com>
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  tests/qtest/migration-test.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c =
index
> 63bd8a1893..9ed178aa03 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1877,6 +1877,21 @@ static void test_validate_uuid_dst_not_set(void)
>      do_test_validate_uuid(&args, false);  }
>=20
> +/*
> + * The way auto_converge works, we need to do too many passes to
> + * run this test.  Auto_converge logic is only run once every
> + * three iterations, so:
> + *
> + * - 3 iterations without auto_converge enabled
> + * - 3 iterations with pct =3D 5
> + * - 3 iterations with pct =3D 30
> + * - 3 iterations with pct =3D 55
> + * - 3 iterations with pct =3D 80
> + * - 3 iterations with pct =3D 95 (max(95, 80 + 25))
> + *
> + * To make things even worse, we need to run the initial stage at
> + * 3MB/s so we enter autoconverge even when host is (over)loaded.
> + */
>  static void test_migrate_auto_converge(void)  {
>      g_autofree char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs)=
; @@ -
> 2660,8 +2675,12 @@ int main(int argc, char **argv)
>                     test_validate_uuid_src_not_set);
>      qtest_add_func("/migration/validate_uuid_dst_not_set",
>                     test_validate_uuid_dst_not_set);
> -
> -    qtest_add_func("/migration/auto_converge",
> test_migrate_auto_converge);
> +    /*
> +     * See explanation why this test is slow on function definition
> +     */
> +    if (g_test_slow()) {
> +        qtest_add_func("/migration/auto_converge",
> test_migrate_auto_converge);
> +    }
>      qtest_add_func("/migration/multifd/tcp/plain/none",
>                     test_multifd_tcp_none);
>      /*
> --
> 2.40.0


