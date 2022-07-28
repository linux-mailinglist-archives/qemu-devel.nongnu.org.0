Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0DB584044
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:47:05 +0200 (CEST)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3qy-0005Ax-Jr
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sheindy.frenkel@intel.com>)
 id 1oH10P-0001NF-Fz
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:44:37 -0400
Received: from mga09.intel.com ([134.134.136.24]:44827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sheindy.frenkel@intel.com>)
 id 1oH10M-0007W4-LP
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659005074; x=1690541074;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=QN3J52iNpY1gzFu/q7YkDcPlRBoygIZezDTSdZPfg9A=;
 b=HOH8ORvjxbWyYt/Fkw8jWv2MgC7SZLU+RfiTTbVEHJf9zFGER/EW+oCa
 fsGVZNeQKFjnYpLyT+M66D5sUFt1pekI61/sC7qchQIP2gF2XTJE4u/I0
 DfkX7XgOKmle+simhowLxoTfM4Mtw3jyRKYaKWucBjC/OoNsgJnoEvh2c
 fWnyKnHHZ7jaXtdhCxOt0HUuD77ecYzqjUipDS8juIy+V3mpydck1naSX
 lgXEbzCmz9E3XNXdz22dLtCHeHLDRM51PR9awcsC3+LnKrzTkwrQy1VJK
 6Z2KRJJ0M0tmWCygmqfRL/u4KCNhDsePTHVZpZ8E6GTcVJbkYb99GcO/7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="289251126"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
 d="scan'208,217";a="289251126"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 03:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
 d="scan'208,217";a="690252133"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2022 03:44:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 03:44:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 03:44:29 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 28 Jul 2022 03:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5T0IVO1gvF1Mz7VQgVOhHhpkT8a0Q3t4+i8we2b6fU9O3O9riFpMicJfjQtEJs4EzDffmwAQFtmOf2gEW32RidvxrNOgBT8vm78KdC5QLBiEvgnznmTWOCow3fr8HoqzPngEi42TC5NZtEDxl5bMdDtstuRfD0mz36oc+nbhnOGDqc9qE+qOYfGdmOuCBk4hqgf+O/grLlf9q5rS7Db80MAQRsMtOp0fX2AkY5HKKpj/Wnn3ubkMA+nWnGthMaTZGAfM0pldekr+nwj/LAcYbLUnmnQgQK+t2WLRFcE0gU20ltjrMDsjNMB7l1GhA9gS0TL1LYuB8RnATPYaMc96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwO94TCmVd4O52+cubu/8zf6N+itl/jhqsf9fLVo91c=;
 b=F7ThQuQMP2KswAHNifCTyPe+C7lx9mCR0/7nt7Nw8IqYHUuX9TLIRg03+1NAG5NfoaQ+rraijMDGLBUzUQxnz9KQt4mOWOdEOUYZ/fPgyrfwb1/U5x80dAe4fMaUVtrRa8dM3/bVqQBsdHPUxe1sVgdIHgNbEhPI8EEfClMIqVKLcv8MHJEl5sjK8b1UWQ0q1tt2OcBcaUWvyFw8F3JK15zUrPUCca9nmS/aQ9Z6Pn1c1a3vfvsyAgxoO2Yx+HDvaIFyHNblpzjm+U8+ExjTJ+6cVFM409JxZlvdZFiL/6twP1B5HvkBmFtBsMSpP0UQYjQajY7htrHuBf40dvAb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13)
 by MN2PR11MB3871.namprd11.prod.outlook.com (2603:10b6:208:13c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 10:44:27 +0000
Received: from BN9PR11MB5258.namprd11.prod.outlook.com
 ([fe80::55a4:9da5:b04e:f60f]) by BN9PR11MB5258.namprd11.prod.outlook.com
 ([fe80::55a4:9da5:b04e:f60f%4]) with mapi id 15.20.5458.026; Thu, 28 Jul 2022
 10:44:27 +0000
From: "Frenkel, Sheindy" <sheindy.frenkel@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Zerbib, Elie" <elie.zerbib@intel.com>
Subject: qtest/libqos: How to find the free PCI slots in a qtest instance?
Thread-Topic: qtest/libqos: How to find the free PCI slots in a qtest instance?
Thread-Index: AQHYomxIFSbfOdQc3EaFqI7wZ49G8w==
Date: Thu, 28 Jul 2022 10:44:27 +0000
Message-ID: <BN9PR11MB5258E1D7B208B0B72C17ABFEF8969@BN9PR11MB5258.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: af27f8ca-5a8d-d67a-4d0a-8564a9b1183a
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e117bb5-3c12-4a70-8f46-08da708624e7
x-ms-traffictypediagnostic: MN2PR11MB3871:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A5sUSNtfNrUPeA2vHs+9FqB+uzf9/udqRmJaLfeuYGGoqR7HTrFbKlfGfgs/k6g+MSzjilUlYXvifU0DBpxX+BZjaxQouOd2fIUZ8Sl5xMhh8yEtVYZqq9dtyITN9liCPGChw8qISTi5J5cBiXleOeQIqVB8z7pmsgJg54Hblr7UPUB3N5PvwQy5cUaTecFco8MWbynvUPx+JXCrrxW7QgkCtAsz3MEs61f4fyUusZUCnAhN2HRMgUB84G8EnTYQahBZKBjasVysm+P2tez1nAW6lo8n0u0XwNiG3cLLQB1h1X5XHW0iUgsTjf4DkP+WtT+jNDVyI2YlM+qjsWd7BsdgpgzsrZBcn4I1cfIZkbBKF4SaKKUZkkKJAEzjsWYrCAZ6QP+qD4EsJdGolkwFPCR+YEzHl6BHvqRfDDY1rpTLyxrHJKE8gqTXx4+0F6a/0d6nDulqxy6BRJ8Gc7XiybeyjbKIqPvtfGAHUpO3qQGP0J7Hg0CqNNPdRF4sLbg0hfXHbXzRzx+db8FtJpcK/+Wj3sE/HyR5EMC1PP2k43zaFmKZnl6TzNOmdt1z602fuZ1TsvAtg9EYfhzhWKkFgQlxp3UATeIhkSlDWsNKR8bJeSeU39NTwIimup3D3jfghnQTo5hhZ+8C3APFCCoWTwZeGNNJo3RTg/9zwXYrlNxkLGBJYQWbMWW7bXYfc8j2y+gn7G0C+oA1sRaooOW6fH3e828lL8Cvkjp3AcOXbp1y/a+IUQ4DHa9YWR/xm6HuhXtZGCH8tk42yPbLgoUpNkiZM/LyT27ZRggtAtwT7pTkXAz1jWlRZeILep3YXYA+ZCdjysIf4LNMTtQ70FQnj6L47AdyiWcuvtRsLdxMbRwUSyyn6TlfXq7Jd0yYKBcv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5258.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(136003)(39860400002)(376002)(4326008)(64756008)(2906002)(66556008)(66446008)(478600001)(71200400001)(55016003)(26005)(7696005)(38070700005)(41300700001)(33656002)(66476007)(91956017)(82960400001)(76116006)(86362001)(8936002)(66946007)(8676002)(52536014)(5660300002)(122000001)(316002)(6506007)(107886003)(4744005)(19627405001)(186003)(6916009)(9686003)(38100700002)(20533002)(37363002)(554374003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/wLo3FaOxUOZpNLaUoFdxH6kl5fH9pxGHtPtmuChN82plbZOMgyBsC1bnE?=
 =?iso-8859-1?Q?7P2qwLyFf7WIkUfC52LlJ4uwjgxAsGwCQxiz+K1iif6wLeJoLlzNDJ8jxS?=
 =?iso-8859-1?Q?N1vfcLCSeqWEGs5ptZH7JZAZqL5VLo1AxyAgt6x5xA44O3d4/p9S9yNhMY?=
 =?iso-8859-1?Q?EHWPIPQwFT51+QD8CyhPbEsRA9Xnc8qjPy9tZgyrIfWKbaEIqAcZ8PJrop?=
 =?iso-8859-1?Q?z6wv9W6PIxixCA2GmIdw7J8mWsOcySu5ukE7V96YrwHpgkVTond9Zf22n6?=
 =?iso-8859-1?Q?Z4aE/uD9E/BmegP5OpqB/iBPKxpaxgTGxtEN5KfRRc6qDw7xyFhztXJefu?=
 =?iso-8859-1?Q?ypW6odAzL7U/FS5d8JpPLeZ4n24D/qUTmZOlKhwpQ0gt77VXU3xLkzaLNS?=
 =?iso-8859-1?Q?YtqT3iN8OBU9YqnnlNTAT2/8yMCzSJ+ns+6rlDRLYYlF8SYFacNulhTc0H?=
 =?iso-8859-1?Q?w5nTAIVkNoTpCMEWYgn86FUuMaX0j75Oyf1zBIM1Df+Lw3QJpVR9ur1u/N?=
 =?iso-8859-1?Q?kDUXeVng5kkS+et9Q1DzjxrI4oNJrEGR3l3il/wv0Ybl8GDMUSI2MGrG5F?=
 =?iso-8859-1?Q?5KuHTpHjDiEYYz594Wfrq3fnA0Wv+n/UWyxLabfrrFy58fmdAWB3Wjns0h?=
 =?iso-8859-1?Q?7I2nbfn4C2EWlvwAw0Z2Mf60F94UFFSCzmQK9wu+lX1G6U9aVUah4acNjm?=
 =?iso-8859-1?Q?heAvKf7XnhVF9T/bOa7bwcQTNPARu99abvMpj2i3wJZUh9aDHdWVfQEdZ5?=
 =?iso-8859-1?Q?e0tY4znQ4j7daIJ18KxclAJFUha5ig0W41528zjVv9fS17XxFMfWLUN5+U?=
 =?iso-8859-1?Q?NSrF+9lOwQyqxo1byV8QeFqab+PePq5u2uC2MFOxpQh9M5m8llBPYX+cWq?=
 =?iso-8859-1?Q?EjLWHmwDJ1a0R/cr+NtBfvxU9xuFb2NR9KGU3ahMqG+TvTd4SbikPjqQHR?=
 =?iso-8859-1?Q?7mxgCyaahAa10cWdU5LkQjeA7E0f6R/pFloqLhnKKqYEUovK8uSUPP72D9?=
 =?iso-8859-1?Q?RDgjtp7YUyLehNCBMe8/qSl5zfcnOT837i1fe/ZGWZ3DqtUSChblP52n7M?=
 =?iso-8859-1?Q?09ZeppW35bns1h8ixjzoy9o3HHZghDbzsB8y8Krn7fmroackk8iNyTNlFb?=
 =?iso-8859-1?Q?1azCYShC/SDdCFcXk0hyhQ4a6Co+7AhUDMNO53qxIaH7IXLslFe6KmFvaw?=
 =?iso-8859-1?Q?Z0zjyWVCEAIYPcM9oEjyrG3rNiG04zy7SnMdVB3OHq3HE74+hRQHDZ5p4P?=
 =?iso-8859-1?Q?WNoQdzXaxF13uzKB1hJfkZTv2STBGLm95qpbHqKZXtCLVRS6mNDDbfWNXj?=
 =?iso-8859-1?Q?Fc7ri/vdnUUP4RGJFvydY/wnbDBWztlBumWDJIHwruyVTG9N8GrKnx2/nu?=
 =?iso-8859-1?Q?Pgmt0J1PKx9y3D1sRl2L8qMQZRgTUIuqYqZyNqKHQuvHqZ+fTA/HZk2izg?=
 =?iso-8859-1?Q?TFHmelLbpWOC9MVYJ0+s1caBDojYtFsVNo6RD3Ji39ijxdIkJDgBBe5oXv?=
 =?iso-8859-1?Q?Uoi7kRyZ0yGw5Jj2dDEGjG+WIZQvdLKqc+VdtiMvBO6CgNh1z+9XCNUoL2?=
 =?iso-8859-1?Q?z/ec/tm8oWay3t/5k8LKEweSrByw5KH/adZowGFYEwuNndnnzaOKGwMfjY?=
 =?iso-8859-1?Q?f54rOT9k5tLD0Vhj9267ZJv+pqFWOQ0Z3q?=
Content-Type: multipart/alternative;
 boundary="_000_BN9PR11MB5258E1D7B208B0B72C17ABFEF8969BN9PR11MB5258namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5258.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e117bb5-3c12-4a70-8f46-08da708624e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 10:44:27.3117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhePQfLxCOO+J5MXicVRSjMxGr/FUO5V1PGfIqueecABovcnbbhfwU7jbzZXrN45WbmWTyOvW7eYRtmymn/lrUcuvFCWNm3ZDBXkD+NHLhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3871
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=sheindy.frenkel@intel.com; helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 28 Jul 2022 09:33:47 -0400
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

--_000_BN9PR11MB5258E1D7B208B0B72C17ABFEF8969BN9PR11MB5258namp_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,
I'm trying to find out how I can get the free PCI slots in a qtest code.
I want to assign a PCI device to a qtest-mode VM. If I assign this device t=
o an unavailable address in the qemu process, I get this assertion: PCI: sl=
ot x function y not available for z.
I'm just wondering if I can avoid this error by checking the free PCI slot =
list with the qtest API. Is it possible?

Thanks,
Sheindy

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--_000_BN9PR11MB5258E1D7B208B0B72C17ABFEF8969BN9PR11MB5258namp_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I'm trying to find out how I can get the free PCI slots in a qtest code.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I want to assign a PCI device to a qtest-mode VM.&nbsp;<span style=3D"color=
: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-si=
ze: 11pt;">If I assign this device to an unavailable address in the qemu pr=
ocess, I get this assertion:
</span><i style=3D"font-size: 11pt; font-variant-ligatures: inherit; font-v=
ariant-caps: inherit; font-weight: inherit;">PCI:&nbsp;slot x function y no=
t available for z.</i></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I'm just wondering if I can avoid this error by checking the free PCI slot =
list with the<b> qtest API</b>. Is it possible?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sheindy</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<p>---------------------------------------------------------------------<br>
Intel Israel (74) Limited</p>

<p>This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</p></body>
</html>

--_000_BN9PR11MB5258E1D7B208B0B72C17ABFEF8969BN9PR11MB5258namp_--


