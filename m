Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A114044D007
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 03:26:55 +0100 (CET)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzni-0007XB-3e
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 21:26:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkzmV-0005mP-8K
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 21:25:39 -0500
Received: from mga03.intel.com ([134.134.136.65]:58079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkzmQ-0000Yz-Cj
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 21:25:36 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="232775738"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="232775738"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 18:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="602445830"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 10 Nov 2021 18:25:32 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Nov 2021 18:25:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 10 Nov 2021 18:25:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 10 Nov 2021 18:25:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOwthvXw3boWDk4e5ToaqFBUqdMOPFjtnO+FghIJb8r5kHh4P6NBNvQo2HyDHegYDPMmtP5v7YiFmBVYoUDHr1nIndyYA2XxgWnNmgrG5Xvs9sfn36mnkz5xfES/8rFpnT7bmv43SmPIdSpnBr3T0rDbJpRNJnXVAYZxHkEkn6/BRSvgV3Ra4ihvhaRBbj3K7CZuPIEV0cvKpKSFDCoqPQSweC4Zwe8T/yTCMey/+1PWYpF3g0HOuC7E2ROF7iSsx/mMECeoc6rdoSo7VdbeaFexMb0WEKQJcUT6cORy7rnCPFYHrcgWSIi+R0ckELKdzURB4GpbOW6hEbHlXlnFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xQCclKqHEv3xPNw3V+KqFwRtQxdlQU8tl/wXqZkg24=;
 b=buNkC9YqnUEWQPUu21WegIl8/SEw6wt3OpqPLhNQ5rmfskIQUheKyG8qVfHkDeHTJe/VsrJJV+DKhjOzSFy0WZs+dCTL7ObSyKcQIKn0LA6v5+apQLrdAQBgJX7p3WuVYxMoSLYVO9FWWztMiK3npXN2J1fe+3cEH+pJBOXlmkEdc2ASy0MGSazU7cfFHuzqk4kfmNxOvo9CSTqV/JFd0nrEqeszeNBnsHP2sVXKDslU3xeDeAy6xNsWEEAH7FXgy25Lj51im5FZ5suSLAu0fOm4IE7OqwPkOuxgRAb+EKmm7wOLfaH12EiVNIIQeSNqIxKitYEbXoxfz3wFPHpuIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xQCclKqHEv3xPNw3V+KqFwRtQxdlQU8tl/wXqZkg24=;
 b=uM3Zot/0uPp/HScyuoEw9k6uryRr3GkdRfViqrAxBWcoBK9OhjZRWJLNQHbFRTG/TSIHYWfQZR1+ZauBNkWCFEa2/ip5InW4FdtyTkOyrtI8EXfbTQtM5Km6TkaKKs5OJhFyZtACkpevk9CluR3d5kx/sCldL34KDCDIg6kjTwY=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1775.namprd11.prod.outlook.com (2603:10b6:300:10e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 02:25:30 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 02:25:30 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "zhang.zhanghailiang@huawei.com"
 <zhang.zhanghailiang@huawei.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: RE: [PATCH v2] Fixed a QEMU hang when guest poweroff in COLO mode
Thread-Topic: [PATCH v2] Fixed a QEMU hang when guest poweroff in COLO mode
Thread-Index: AQHX1qKh/LHSreuBUEGBwZ71e49knKv9mVlw
Date: Thu, 11 Nov 2021 02:25:30 +0000
Message-ID: <MWHPR11MB003101E37745C403858A1B229B949@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <1636596693-8477-1-git-send-email-lei.rao@intel.com>
In-Reply-To: <1636596693-8477-1-git-send-email-lei.rao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e061d265-6a60-4f1a-be38-08d9a4ba885d
x-ms-traffictypediagnostic: MWHPR11MB1775:
x-microsoft-antispam-prvs: <MWHPR11MB1775CA9E45E9666759F268B79B949@MWHPR11MB1775.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:207;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GUsSZfBpQqLGTqYjNoAZB9JpYkJabfgn7aQe7EOFqsD+U0zXWLVYF3mTDmUm+BzIr4vfkAJECY4YbohTnW7D3fE/IDthgS1I+jtKp92NNqSrltVxtkJng2U7c5rgyiBveK3PXv4JjH852QZlapJ77EqpoNNnHdLNRbdzEkqwAfSpC/3zM1uoFl+qHjI/rcJrtfWdKwhKhBlK4dl9NpLBTbi9fdeL5AZlAampLj0Mt1RQMQMkx0VkZDNOGumwbX4zVedS0JWVh0nBwIdpHqgptilr+yu73/JwES+9aTgEWepYjlb2mW9uqSxQ8Csle5ypZWI16d16Q9Yxv5SPqkDqjJ2qFvPd2y9lhBfiUGw+0h6huA7Bcc9aIim51d9CIq81Dvu1Kma9/16f24ZE9gIK4pJK2XNBzEUgF2amFa16pBILhhWFudkzotWa1LDG6/bcYhX+D8FRtbxJD4Cd3qgnMG2BM7vFfAxQEZ+VqCqlBCSE0XhmpReP3gEpBxnnsQ0rh8bSRlAwxon9mEMxCNR7q+MK0gVWawz1DjCWCnUbRYtel5KIB/dWITcBdjirlx+Grg2nZTZT4Cu+HoKlL4DaSkfCtxGjS2V4V14v08KNeg4e2b7s0UfGfBoov0NVdkdjbgeHvacKuK3/FMI4Zg2bsayMfR9mC/jEBtkxISGeCW1EofFtgJWwkv4pKoWBtfXdoCqv45QT3ESi9PTXJUx0EA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(86362001)(4326008)(316002)(53546011)(508600001)(110136005)(2906002)(71200400001)(9686003)(7696005)(55016002)(52536014)(122000001)(33656002)(66556008)(8936002)(64756008)(186003)(26005)(76116006)(6506007)(38100700002)(66446008)(8676002)(38070700005)(82960400001)(66946007)(83380400001)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sp5NSPnN7/CeopDOo8Erv4zAFCc7zOwD0lYGevRpHR2KYMxQuPhbSl7lL/af?=
 =?us-ascii?Q?BNepSB8qCPYWOM+7PeDcmtFCrear7BLmEjoyPGpJQ3s/DKML2dR18M+LQp4e?=
 =?us-ascii?Q?ZlhN4we9itAzfAYmOVZCqxtGJG8eAURKKGodylG7X4QCXfRGwWQ9fX63UjyB?=
 =?us-ascii?Q?efb71cvkL4isuuH1sxr62okPlo0ln+Yq1yG07WJedvZKHlg1j+7uLgeTFV0w?=
 =?us-ascii?Q?RRQ4hokjf0XCZE8hkC5HXrrtWSt68Rhsu05O3F4ptm/udl1e3ha871XdDLEX?=
 =?us-ascii?Q?htCw9+U/vkGTM02IHMgmKZhgniwY/EURPaP3hxaH5A1QRV+ZB3w7TXWIBUP5?=
 =?us-ascii?Q?AD2sdt1mu0vu+Vynw8xeEPbzpCrb69dM/sNpQvHVK+OPX/ZhbnVYBvse6x7y?=
 =?us-ascii?Q?9rr5Q+2g7uTKQIwYeGkexu5h2FMOVzo2r51oQmBMnRiZBr4fY0Qesh4dc+xY?=
 =?us-ascii?Q?XC82ZDKx9LsNdMIZ1YvmCI7CThMZvvhq9RTmOHjrP5pLsTma3zRPTidQBsL8?=
 =?us-ascii?Q?1f5QET0w4ljTKRmS5aB1nmxXBp7I9vMU+3TJ7EPbGStmgTsrYtdRE1u3cSLy?=
 =?us-ascii?Q?ZTH6nzIC9DAQGzrk8mwnjb8UgJFEt2i7qiTmVxi8ga1k4dtcVHzYMsmYeQey?=
 =?us-ascii?Q?0GrHR8ZQzS7ucr+WnCRsOl+A+mGeB846i1NxzoSK+hzykfYkjJcbUGMZGxJf?=
 =?us-ascii?Q?CF6syjOAbgq4GkAfAeevVyTdxKgx7nrZi08ue0qinps4ZKDeYnlNNIfTB88d?=
 =?us-ascii?Q?ZCbhOgO3db+hiJxv2pR7NSjokT8s/QigyA3A7TuueWsL7xul9YmJL3JjcHjA?=
 =?us-ascii?Q?7QxELZyqRj43EjVjtFsD979qbFgWkENmsHd+CBBIBwvwGe2wtPRvcRsMCqOQ?=
 =?us-ascii?Q?oy4nW3ASN2JRvYj6SnvhXOqupv9kdBE0tvcG6yZe9xVcO0iuu/3gOIrve9QG?=
 =?us-ascii?Q?4OOYtFli0ZtH3ymcZ2+la+I1wKRPSpzedD8SZRIV6Oe5g/HO6hQjD0ePTBjo?=
 =?us-ascii?Q?IXA+OQgx+zPdLsJWsGHy5phby12JYWXByz2KNjvIHPZyJitrPz01m5xdd8qr?=
 =?us-ascii?Q?PX8C+SO4R4S0bpB0JErB+tFrotKDH7pshlsfx6hOHAF5+K/Flkl/fVbCW03f?=
 =?us-ascii?Q?n518wjAWAYXD+Zjw+5lK4JubSW8wrOzlokqDKYoJF8kLm58gLKGZza1+dqzb?=
 =?us-ascii?Q?ybrfbOUZfffYmb49OyxfUA1arnTl58Vi/gwVT0F+OC5Iz3hNgI8z7G8HEgI7?=
 =?us-ascii?Q?PWQtbDn8b2GetJq8aw/4OzlM6Eo+ZWH9dEaWqtDTuZz9/qQ58OJK4cWWCX0Y?=
 =?us-ascii?Q?BOeCecVU8+JmvFetoUuaC5YWs0vEVEUhUJj+QFAjQqMtG/e5TQc4dYLWp+0x?=
 =?us-ascii?Q?NB5y+r6NMLrUFJuGBVxbVoTQz0Z2J3cx7F/LNMvaiRBLm3slWmkoEJvMP26t?=
 =?us-ascii?Q?NhnZdECc9x5tYxVlpW5T9bOVVcOIIWChYRVX3PsTeSTCfxJe9mckBS1izI6C?=
 =?us-ascii?Q?Te9knpMTjikibXX1iPqUxVxj5/ZCRYZ4pbWyl/POo7qZUXbKOv2TzcaLNiQ9?=
 =?us-ascii?Q?8zA0qkniBi4yR2JJEftL9MyA+qHr8T1v2fmJsLFiJjU5Rv7Q08QSVb+Jy78B?=
 =?us-ascii?Q?kDvSErtoY0P4QveC0MXrAYQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e061d265-6a60-4f1a-be38-08d9a4ba885d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 02:25:30.7163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GGW1DoDDSKGeSZoYRCT1klyz5JwA9LZaClrQqWzRvvivx8/4u5zL7rt+/xIoZlZoUUDMsdMhJcXZjzZZ7uqNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1775
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Rao, Lei <lei.rao@intel.com>
> Sent: Thursday, November 11, 2021 10:12 AM
> To: Zhang, Chen <chen.zhang@intel.com>;
> zhang.zhanghailiang@huawei.com; quintela@redhat.com;
> dgilbert@redhat.com
> Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>
> Subject: [PATCH v2] Fixed a QEMU hang when guest poweroff in COLO mode
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> When the PVM guest poweroff, the COLO thread may wait a semaphore in
> colo_process_checkpoint().So, we should wake up the COLO thread before
> migration shutdown.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>


Looks good for me.

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  include/migration/colo.h |  1 +
>  migration/colo.c         | 20 ++++++++++++++++++++
>  migration/migration.c    |  6 ++++++
>  3 files changed, 27 insertions(+)
>=20
> diff --git a/include/migration/colo.h b/include/migration/colo.h index
> 768e1f0..5fbe1a6 100644
> --- a/include/migration/colo.h
> +++ b/include/migration/colo.h
> @@ -37,4 +37,5 @@ COLOMode get_colo_mode(void);  void
> colo_do_failover(void);
>=20
>  void colo_checkpoint_notify(void *opaque);
> +void colo_shutdown(void);
>  #endif
> diff --git a/migration/colo.c b/migration/colo.c index 2415325..0d3d98f
> 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -820,6 +820,26 @@ static void
> colo_wait_handle_message(MigrationIncomingState *mis,
>      }
>  }
>=20
> +void colo_shutdown(void)
> +{
> +    MigrationIncomingState *mis =3D NULL;
> +    MigrationState *s =3D NULL;
> +
> +    switch (get_colo_mode()) {
> +    case COLO_MODE_PRIMARY:
> +        s =3D migrate_get_current();
> +        qemu_event_set(&s->colo_checkpoint_event);
> +        qemu_sem_post(&s->colo_exit_sem);
> +        break;
> +    case COLO_MODE_SECONDARY:
> +        mis =3D migration_incoming_get_current();
> +        qemu_sem_post(&mis->colo_incoming_sem);
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
>  void *colo_process_incoming_thread(void *opaque)  {
>      MigrationIncomingState *mis =3D opaque; diff --git a/migration/migra=
tion.c
> b/migration/migration.c index abaf6f9..c0ab86e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -226,6 +226,12 @@ void migration_cancel(const Error *error)  void
> migration_shutdown(void)  {
>      /*
> +     * When the QEMU main thread exit, the COLO thread
> +     * may wait a semaphore. So, we should wakeup the
> +     * COLO thread before migration shutdown.
> +     */
> +    colo_shutdown();
> +    /*
>       * Cancel the current migration - that will (eventually)
>       * stop the migration using this structure
>       */
> --
> 1.8.3.1


