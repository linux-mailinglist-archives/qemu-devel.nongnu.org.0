Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F20375C2F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 22:27:50 +0200 (CEST)
Received: from localhost ([::1]:36762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lekb7-00077G-H2
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 16:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emcclanahan@nvidia.com>)
 id 1lejdf-0004Dy-SZ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:26:24 -0400
Received: from mail-bn7nam10on2070.outbound.protection.outlook.com
 ([40.107.92.70]:6240 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emcclanahan@nvidia.com>)
 id 1lejdc-00047W-1f
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:26:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hruD1btIEEayPXBygbc0vTH3L8k+oCH3hueXTmAN9u9OXlT5AZtakpvztyuAJyaMCgEysmCOF0NcJePEv92yXafb/dXqeTbIWAabg/PFJ5UVInzR7BUl5TXNaZmynePBcO3HTy4cNN3ACQAdHBv5KnJ04Uly7dHHJW4Pp+dzLkXxntd6qKnJnxZP162lAknzZksJjikGxGXukTOSwF159d1yX6FUcSbNA+OGf9VYV6TKoGP4aNV0xpgz8KLu7VSOQFSQRMW0mGXEPcpSj4gQ8qSo8/vkqp4083pkmxqsP6hPqhTCsHC6ezyLExZqoS0ccIeh59sgBN9kW0TZeu5kCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYfnaoyxrAbJJ6v5CuPs7OzV0PB3UIuAJqt3wR63ECc=;
 b=cVWrlQkQ4kGvtu+HxkCH96aYKcHxzi6yEun2yKFSqmj/yCi/MK9kKs+zf7ScI0LrISHgXyQ6XkirRQq6xe6VSgDae3Fffk5uI3EeSiuNVoDml4hBQBnCABbQhVP74KCqZkzKLE0PqyyLaxjyh6DFWHk4qfVMDIXtCZciwPokm5XOxhI1nCpUtDuvH+dRhuqm5x5MhriF15jQHQ9i95kKBw7pGZyfxxuNoiqL3VFEfrk6miN/K/W8KAzWQJH1mHqv1FKHebAj+XymuLth9JJ7bfUNETAbr5OrvzdmPK4d6PvvP4Z27CSVits0kz76lpjdY5hLGF2GHMhRbnk/I7yXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYfnaoyxrAbJJ6v5CuPs7OzV0PB3UIuAJqt3wR63ECc=;
 b=igNrhZw6dlj7osiieGZMdSLFTWcTF1BImIeB+dCoQCwXMxskZ+syWeApCtjdl7owtnIfhjYKluWrOrHv7gCBY4QPf+OlwqhHpZSHjLDaoYez/gyYQkPuIXaZkDbC5+9xZUuYcRi68z6IyjLGq7afNPL40SFaqiFEyRVjxzQ1EVJkZcwkxmi8xKOMk1e4RGeT/XfsMMtcp5R/jzpd+2LqKI+icliTRzc1zVg604XkfP73L6SQe96G83/tKCuYX7fTZ7Ux+KHRnlvPHAKUXs3zHXibkEAkoPnVc6qwXDQFuBFFZIjwsLm6u27hMJXfS5jApOuQyK+4aLf7/BzlLuHVKA==
Received: from BY5PR12MB3809.namprd12.prod.outlook.com (2603:10b6:a03:1aa::22)
 by BYAPR12MB3559.namprd12.prod.outlook.com (2603:10b6:a03:d9::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 19:11:14 +0000
Received: from BY5PR12MB3809.namprd12.prod.outlook.com
 ([fe80::6db7:653:88f0:227e]) by BY5PR12MB3809.namprd12.prod.outlook.com
 ([fe80::6db7:653:88f0:227e%6]) with mapi id 15.20.4108.027; Thu, 6 May 2021
 19:11:14 +0000
From: Edward McClanahan <emcclanahan@nvidia.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "groug@kaod.org"
 <groug@kaod.org>, "jose.carlos.venegas.munoz@intel.com"
 <jose.carlos.venegas.munoz@intel.com>, "ma.mandourr@gmail.com"
 <ma.mandourr@gmail.com>, "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [Virtio-fs] [PULL 01/12] virtiofsd: Fix side-effect in assert()
Thread-Topic: [Virtio-fs] [PULL 01/12] virtiofsd: Fix side-effect in assert()
Thread-Index: AQHXQqmcEWFXMd5eIUSJhEsR4pd916rW0dWA
Date: Thu, 6 May 2021 19:11:14 +0000
Message-ID: <BY5PR12MB3809AA7700A873AEF4CCEB9AC5589@BY5PR12MB3809.namprd12.prod.outlook.com>
References: <20210506185641.284821-1-dgilbert@redhat.com>,
 <20210506185641.284821-2-dgilbert@redhat.com>
In-Reply-To: <20210506185641.284821-2-dgilbert@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [187.191.28.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea057c6f-7690-4577-0636-08d910c2b7e8
x-ms-traffictypediagnostic: BYAPR12MB3559:
x-microsoft-antispam-prvs: <BYAPR12MB35596DC3A9F401A2123D6599C5589@BYAPR12MB3559.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hdxK5ih+Bnr8ADHyYq6C872NItYnjej4C2XXjceLpI1LDnwMuTrEFoBBWn634USowjZsAECbrLLsrdbFse/c0OgoBL3Vku2WDnpcqUsAmXncLGJSSJG6drNc+XOVE/7frZL9f1WMcyqF9Z2nDU102X2pHtuXUTzJKptV4E2TsSiseyaAj7r0hEcqfbC+u+rco1wipd86MylME72NjRsPD2vSIwXFkF5cyLhw6H7U750Eg3Ziyf2Gt7YLAl5b6oMh40/Kvu9dtIbnM8D8LiPJJseHGqTlavOQfFOLtqAcQAyT5AORs729GCMpvYFThYDL0v2/eAqeEpi2Yhta0gkKJmN0GeaR5cmqVLdKTTNhIdPgW28CWQgEPJmg+F7YQR2cl/SwBTn8loNtmLwgN+21Q0TDB1mHBOERpmlfqz+P4+mIKVmkABZt/NfnpHzLEs1CYlQHUBEqYKwTzYhqyPKp/8HoQnqt7c0nsnCexI75RNGRzWmXLQarNkBXviySIu09fYbMo6KN8wAsIwOz/iz71s0PBzfADai+HVrYV41SA0xRM4cew5klTQ12H2pfGgFi9j+r/nfTUjHNWDSCCfmkvsx1M9SrKKeMSFKTr7E1ojkb1rn/CC+YA99YsWXQrhy+wOUphpxtFO+8tkAHr0iVCnh/3IH7DFOiiOy4tNgv2ejZ7p4o/XJUCZYkOoU6AFpp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3809.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(66556008)(122000001)(6506007)(8676002)(55016002)(8936002)(45080400002)(316002)(76116006)(91956017)(5660300002)(38100700002)(55236004)(9686003)(54906003)(26005)(966005)(110136005)(7696005)(66476007)(478600001)(71200400001)(2906002)(33656002)(66946007)(66446008)(186003)(4326008)(83380400001)(53546011)(166002)(86362001)(64756008)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?FYXZMepvv5wCRaFIxiTiIflH7hxeWJBJa+vIwmbUMI35rVq+DbGEvhVlUx?=
 =?iso-8859-1?Q?2Z+zy0JbPvj2dA0H3aJDij+aekofs1hPoMHYC1mfzHXOrRnkOVIyRb4XVn?=
 =?iso-8859-1?Q?pso1HfQ2UT1KkF7RtjtpJwXKxa8jsYA4uQ0RDHJ1iHoeuFXtZ+s1D5whcd?=
 =?iso-8859-1?Q?ndIIJR7d7bw6fLpnyvgjX2JU2P5iiTeBZ2LZCqdA1pJWzZJlNWS7hcSgjf?=
 =?iso-8859-1?Q?VACMc8CJUN3ZAtDHgXUHm93a1H5Bk1UAUUQY/3kXCIKwOnl15ZlTetb/s7?=
 =?iso-8859-1?Q?CpyBSMJF9kSeYntt01Wa3K0Gn1RtY4FuyJfCiPAERdaVWHH4AvNqrDyZvD?=
 =?iso-8859-1?Q?Mk+9toK9TaJipIySzZ8jN5t3uOu1d9Qk7D8AxmJDuxOJbxxou0pW4p3rAS?=
 =?iso-8859-1?Q?vGLawsUzKY6qqaSH2sS+HIjETQxT2TPz0SprvHZbRpWjjY+WzavXu3U/Qm?=
 =?iso-8859-1?Q?4uTsBmYmVCAHPlB0Khe7sci6NLbuavsgeKRZT5AzIzpky5SGv9ZCgQCyMm?=
 =?iso-8859-1?Q?wq5KRko8ZA1fxuy13FTYw53WhqNtHiOnVxtK+jw8BEOACVHqNb5a+0+Abb?=
 =?iso-8859-1?Q?sBL3A0p74aKPIIMCebb4uSrp09tIRhVFX8VaXruUzTWf8LUVrK6HJfXShL?=
 =?iso-8859-1?Q?aN+t3ssDrZgDIMNmdUP+azq5eIMXAAu4twstKgndOa9NUN+FdIt9G3ufbg?=
 =?iso-8859-1?Q?lulqlJKZb5JsAnb07oNcw3HvMwUKxkyDq0iTFC+W2/jgTxiJZaJggL0dgV?=
 =?iso-8859-1?Q?zlW33ydTHnYNciZSWUs8nCg54rGxUFtMrl2ZdWltFPgFFJvnkxQmrj4j/9?=
 =?iso-8859-1?Q?o5QCvBf042BKbWqQjF+wEFPY9UY82qCb0AuD7I2CawMnOWZsfK1N27Pp6J?=
 =?iso-8859-1?Q?yYnMfXPu3qOrMw/mAWpkJG/ZXqyMQf1zXNhDJ2mHyidiVEKFJuNZiVmAcz?=
 =?iso-8859-1?Q?cq3JUSN1H/MnjDqvljayBmJr8D+pCxoYS3oBTNBffWgJlzVS2fPvz0Thbf?=
 =?iso-8859-1?Q?ClbtM1K1Gkl9SzUy+Y/UErUjuZWQSb0vQPa8hXXqLZOKWblmjtxpzmYVkc?=
 =?iso-8859-1?Q?+UJLSlymeGxk8Th/lkzDJjOyidSyqFA/3W6ti8cU6dEytmuTKY6c9n1rw8?=
 =?iso-8859-1?Q?LxFpZ2iWG+4DtBTTkCQnPghI6Q3Ef02W2qHMkV8finudjn1uDbIb7gws9/?=
 =?iso-8859-1?Q?R+OY1+vusP1+iz7AUiA1hCu/rNUzOwoA8gkSyp5RTxAXEZE3SwsL165ZxT?=
 =?iso-8859-1?Q?PiEas4sTUdob2MgyJuHXMN2o2E9XTRE2/kc9U92e+tFJ7QqVCTpA9E5se8?=
 =?iso-8859-1?Q?Dd5XzkZza3TyIprs9b2TM+9nptg4706Fzo4KqQHUZnfEqNtQjvZbM1IqZY?=
 =?iso-8859-1?Q?fnzXGLXeiRgnNxPUMczfhRfrJNvA1KRg=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BY5PR12MB3809AA7700A873AEF4CCEB9AC5589BY5PR12MB3809namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3809.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea057c6f-7690-4577-0636-08d910c2b7e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 19:11:14.2903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUPVoI7cuKz9mcMzN63LBUUpAwfd8cDNg3ume2+6Q1Qh7ivWsuTmIIZFeklq7X8+3dbYyPEOSRCAInLRmNYsiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3559
Received-SPF: softfail client-ip=40.107.92.70;
 envelope-from=emcclanahan@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 May 2021 16:25:45 -0400
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
Cc: "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 "vgoyal@redhat.com" <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BY5PR12MB3809AA7700A873AEF4CCEB9AC5589BY5PR12MB3809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Very nice catch David... Countless times I've gotten bit by this one!

Get Outlook for Android<https://aka.ms/AAb9ysg>

________________________________
From: virtio-fs-bounces@redhat.com <virtio-fs-bounces@redhat.com> on behalf=
 of Dr. David Alan Gilbert (git) <dgilbert@redhat.com>
Sent: Thursday, May 6, 2021 1:56:30 PM
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; groug@kaod.org <groug@ka=
od.org>; jose.carlos.venegas.munoz@intel.com <jose.carlos.venegas.munoz@int=
el.com>; ma.mandourr@gmail.com <ma.mandourr@gmail.com>
Cc: virtio-fs@redhat.com <virtio-fs@redhat.com>; vgoyal@redhat.com <vgoyal@=
redhat.com>
Subject: [Virtio-fs] [PULL 01/12] virtiofsd: Fix side-effect in assert()

External email: Use caution opening links or attachments


From: Greg Kurz <groug@kaod.org>

It is bad practice to put an expression with a side-effect in
assert() because the side-effect won't happen if the code is
compiled with -DNDEBUG.

Use an intermediate variable. Consolidate this in an macro to
have proper line numbers when the assertion is hit.

virtiofsd: ../../tools/virtiofsd/passthrough_ll.c:2797: lo_getxattr:
 Assertion `fchdir_res =3D=3D 0' failed.
Aborted

  2796          /* fchdir should not fail here */
=3D>2797          FCHDIR_NOFAIL(lo->proc_self_fd);
  2798          ret =3D getxattr(procname, name, value, size);
  2799          FCHDIR_NOFAIL(lo->root.fd);

Fixes: bdfd66788349 ("virtiofsd: Fix xattr operations")
Cc: misono.tomohiro@jp.fujitsu.com
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210409100627.451573-1-groug@kaod.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 1553d2ef45..6592f96f68 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2723,6 +2723,11 @@ static int xattr_map_server(const struct lo_data *lo=
, const char *server_name,
     return -ENODATA;
 }

+#define FCHDIR_NOFAIL(fd) do {                         \
+        int fchdir_res =3D fchdir(fd);                   \
+        assert(fchdir_res =3D=3D 0);                       \
+    } while (0)
+
 static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_nam=
e,
                         size_t size)
 {
@@ -2789,9 +2794,9 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t in=
o, const char *in_name,
         ret =3D fgetxattr(fd, name, value, size);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret =3D getxattr(procname, name, value, size);
-        assert(fchdir(lo->root.fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }

     if (ret =3D=3D -1) {
@@ -2864,9 +2869,9 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t i=
no, size_t size)
         ret =3D flistxattr(fd, value, size);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret =3D listxattr(procname, value, size);
-        assert(fchdir(lo->root.fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }

     if (ret =3D=3D -1) {
@@ -3000,9 +3005,9 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t in=
o, const char *in_name,
         ret =3D fsetxattr(fd, name, value, size, flags);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret =3D setxattr(procname, name, value, size, flags);
-        assert(fchdir(lo->root.fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }

     saverr =3D ret =3D=3D -1 ? errno : 0;
@@ -3066,9 +3071,9 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t=
 ino, const char *in_name)
         ret =3D fremovexattr(fd, name);
     } else {
         /* fchdir should not fail here */
-        assert(fchdir(lo->proc_self_fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret =3D removexattr(procname, name);
-        assert(fchdir(lo->root.fd) =3D=3D 0);
+        FCHDIR_NOFAIL(lo->root.fd);
     }

     saverr =3D ret =3D=3D -1 ? errno : 0;
--
2.31.1

_______________________________________________
Virtio-fs mailing list
Virtio-fs@redhat.com
https://listman.redhat.com/mailman/listinfo/virtio-fs

--_000_BY5PR12MB3809AA7700A873AEF4CCEB9AC5589BY5PR12MB3809namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Very nice catch David... Countless times I've gotten bit by this one!<span =
id=3D"ms-outlook-android-cursor"></span><br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
<span id=3D"OutlookSignature">
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Get <a href=3D"https://aka.ms/AAb9ysg">Outlook for Android</a></div>
</span><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> virtio-fs-bounces@red=
hat.com &lt;virtio-fs-bounces@redhat.com&gt; on behalf of Dr. David Alan Gi=
lbert (git) &lt;dgilbert@redhat.com&gt;<br>
<b>Sent:</b> Thursday, May 6, 2021 1:56:30 PM<br>
<b>To:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; groug@kaod.=
org &lt;groug@kaod.org&gt;; jose.carlos.venegas.munoz@intel.com &lt;jose.ca=
rlos.venegas.munoz@intel.com&gt;; ma.mandourr@gmail.com &lt;ma.mandourr@gma=
il.com&gt;<br>
<b>Cc:</b> virtio-fs@redhat.com &lt;virtio-fs@redhat.com&gt;; vgoyal@redhat=
.com &lt;vgoyal@redhat.com&gt;<br>
<b>Subject:</b> [Virtio-fs] [PULL 01/12] virtiofsd: Fix side-effect in asse=
rt()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">External email: Use caution opening links or attac=
hments<br>
<br>
<br>
From: Greg Kurz &lt;groug@kaod.org&gt;<br>
<br>
It is bad practice to put an expression with a side-effect in<br>
assert() because the side-effect won't happen if the code is<br>
compiled with -DNDEBUG.<br>
<br>
Use an intermediate variable. Consolidate this in an macro to<br>
have proper line numbers when the assertion is hit.<br>
<br>
virtiofsd: ../../tools/virtiofsd/passthrough_ll.c:2797: lo_getxattr:<br>
&nbsp;Assertion `fchdir_res =3D=3D 0' failed.<br>
Aborted<br>
<br>
&nbsp; 2796&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* fchdir=
 should not fail here */<br>
=3D&gt;2797&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FCHDIR_NO=
FAIL(lo-&gt;proc_self_fd);<br>
&nbsp; 2798&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D g=
etxattr(procname, name, value, size);<br>
&nbsp; 2799&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FCHDIR_NO=
FAIL(lo-&gt;root.fd);<br>
<br>
Fixes: bdfd66788349 (&quot;virtiofsd: Fix xattr operations&quot;)<br>
Cc: misono.tomohiro@jp.fujitsu.com<br>
Signed-off-by: Greg Kurz &lt;groug@kaod.org&gt;<br>
Message-Id: &lt;20210409100627.451573-1-groug@kaod.org&gt;<br>
Signed-off-by: Dr. David Alan Gilbert &lt;dgilbert@redhat.com&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=E9 &lt;philmd@redhat.com&gt;<br>
---<br>
&nbsp;tools/virtiofsd/passthrough_ll.c | 21 +++++++++++++--------<br>
&nbsp;1 file changed, 13 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c<br>
index 1553d2ef45..6592f96f68 100644<br>
--- a/tools/virtiofsd/passthrough_ll.c<br>
+++ b/tools/virtiofsd/passthrough_ll.c<br>
@@ -2723,6 +2723,11 @@ static int xattr_map_server(const struct lo_data *lo=
, const char *server_name,<br>
&nbsp;&nbsp;&nbsp;&nbsp; return -ENODATA;<br>
&nbsp;}<br>
<br>
+#define FCHDIR_NOFAIL(fd) do {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fchdir_res =3D fchdir(fd);&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fchdir_res =3D=3D 0);&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
+&nbsp;&nbsp;&nbsp; } while (0)<br>
+<br>
&nbsp;static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *i=
n_name,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_=
t size)<br>
&nbsp;{<br>
@@ -2789,9 +2794,9 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t in=
o, const char *in_name,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D fgetxattr(fd, name=
, value, size);<br>
&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* fchdir should not fail =
here */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fchdir(lo-&gt;proc_self_=
fd) =3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FCHDIR_NOFAIL(lo-&gt;proc_self_=
fd);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D getxattr(procname,=
 name, value, size);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fchdir(lo-&gt;root.fd) =
=3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FCHDIR_NOFAIL(lo-&gt;root.fd);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; if (ret =3D=3D -1) {<br>
@@ -2864,9 +2869,9 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t i=
no, size_t size)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D flistxattr(fd, val=
ue, size);<br>
&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* fchdir should not fail =
here */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fchdir(lo-&gt;proc_self_=
fd) =3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FCHDIR_NOFAIL(lo-&gt;proc_self_=
fd);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D listxattr(procname=
, value, size);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fchdir(lo-&gt;root.fd) =
=3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FCHDIR_NOFAIL(lo-&gt;root.fd);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; if (ret =3D=3D -1) {<br>
@@ -3000,9 +3005,9 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t in=
o, const char *in_name,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D fsetxattr(fd, name=
, value, size, flags);<br>
&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* fchdir should not fail =
here */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fchdir(lo-&gt;proc_self_=
fd) =3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FCHDIR_NOFAIL(lo-&gt;proc_self_=
fd);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D setxattr(procname,=
 name, value, size, flags);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fchdir(lo-&gt;root.fd) =
=3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FCHDIR_NOFAIL(lo-&gt;root.fd);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; saverr =3D ret =3D=3D -1 ? errno : 0;<br>
@@ -3066,9 +3071,9 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t=
 ino, const char *in_name)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D fremovexattr(fd, n=
ame);<br>
&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* fchdir should not fail =
here */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fchdir(lo-&gt;proc_self_=
fd) =3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FCHDIR_NOFAIL(lo-&gt;proc_self_=
fd);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D removexattr(procna=
me, name);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fchdir(lo-&gt;root.fd) =
=3D=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FCHDIR_NOFAIL(lo-&gt;root.fd);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; saverr =3D ret =3D=3D -1 ? errno : 0;<br>
--<br>
2.31.1<br>
<br>
_______________________________________________<br>
Virtio-fs mailing list<br>
Virtio-fs@redhat.com<br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/virtio-fs">https://l=
istman.redhat.com/mailman/listinfo/virtio-fs</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BY5PR12MB3809AA7700A873AEF4CCEB9AC5589BY5PR12MB3809namp_--

