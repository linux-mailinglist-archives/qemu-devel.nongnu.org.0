Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425BF392261
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:54:29 +0200 (CEST)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1Tw-0000v3-Aj
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lm1Bg-00032h-2P; Wed, 26 May 2021 17:35:36 -0400
Received: from mail-eopbgr800103.outbound.protection.outlook.com
 ([40.107.80.103]:7491 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lm1BZ-00009y-6m; Wed, 26 May 2021 17:35:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JArYi/H7F/BcyV1Z3VfbA9yw3xkJmNpfXjHEedQpcI7/vJbYYxAwfRQ5tMgT/lDn5JE62zJZcMw3GQA56kJ2r+jWn0gXua8IucGdqP4KpxwZtnuoXimhX1R35n8K7BiESbxP9k0NNWXCrjJL/w2THlf7PM8S0p4SDvPfJ8TgGQAY6dU+U6EsKQQAQ7mtIj//03niTgQrtkt+I0fS1jwJxMwrk9B74mJtPgClX0pmYQtCuXFfe2J+MqmwIOQmRtZqFn4F8nqtmxlArNX6i5jz9fJBEmjXLybYqqIqp4Bu1ZxSKDiaRVzWlLAd9mvf9H84JCx25yM71insPQtOuavN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipNb0H1lCo+2N9bzOTVTOYe819bndFeBweE+EfSCHZs=;
 b=H26P9tddasF1qA7FcjsP4hWo8mruvcIsIUp9gI8ZTYaGo1txoMMpBWK8at5DCqXi9OpzvGr9AGYedsEeu9dQZ67fvcEkNyLEQSEosYimn3Rtbzvi5vh5VKhQPBKahjrA2yyCCYgxqwPNWpd7s/z9hw8nEaU2OLICMEyNpEBSlG2JJY3DbMIkLBQ/yKEpQ03X3KnKAEdt7ywqBEVlud20fnVWzz+Ovpy4ZXZYZImQj6GynEDcxc0P5pCP6K3lxGfStHfgaOZTZnlkdMK0Q/nnB2xCQTTJ+7vHbiT4ebjd3m4G/xlnLqDM2eiYnk57Cya4i6TpzPgW0dJCCHidGOLZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipNb0H1lCo+2N9bzOTVTOYe819bndFeBweE+EfSCHZs=;
 b=pksSatAWlKSEGxql9vkN7LqdP1rLDkW4OTsW8Rz8xkIFR4MdHblpQ1VOWIeAK0CgTB9vOY4VeyyFa+W2RlOtIA757eEH2N2Oy1srXD7O6p8cPtjcCmVPVwaSI/ptLGnauhZ/NQMmS8Q5wrjYejUO5PL/7W36XM3xunrWbNYgFUmQm2x6tkpq18mLjmfhpSXO+poU5rpyzGHQ3HIRR0xINgeYZ9ZRl1K32NiGx+FwFwxODGybtuhQ3ZEsnj8r+unkNpriRyf70+x8wYNfa5/YHXfb/fwPuhaVQttH3JgfNYPxO+Do4CBw0596H3qfCfTvO48gkq+rhUtpgQ69EQ+gnw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4370.lamprd80.prod.outlook.com (2603:10d6:102:49::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Wed, 26 May
 2021 21:35:25 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 21:35:25 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 4/5] monitor: removed cpustats command
Thread-Topic: [PATCH 4/5] monitor: removed cpustats command
Thread-Index: AQHXUmzaiuschPL81Um5jvt0S2+bw6r2SMBw
Date: Wed, 26 May 2021 21:35:25 +0000
Message-ID: <CP2PR80MB36684274007DB78C88387FEFDA249@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
In-Reply-To: <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [177.9.76.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43e3497e-09e5-4be3-3eb8-08d9208e2c87
x-ms-traffictypediagnostic: CP2PR80MB4370:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB4370597F176E591A8133DA41DA249@CP2PR80MB4370.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZPleA3jK//9rsTRmvmTtkSISyyaP2+zTLsDU/CobtGytTLRePuIRJQo+fQYvxE5IXR0kajc2Hr5M9x8NrvvSAy9EOs1ui82jUiIxJzKIhFDvP/VIxA7+hZYlBZ5jpRJKDnGS17gtdhD+tG15zy1Gy0nM0BzRaxauzxxx4qGPopUoBQ05qcn4W+Md4Rh37h6pyFCk7JgQ+XZszaQ0b1u6U/apbmIPhHEt8wui6Y/41NK8Jt4hMzBFUu0DaN9A33g9K+DPM4J8msCn8dpu9Ydfx2cQF0+lz3qHrm5Y+wC1/Ua+4UyRq/LM3HRYtklDbeZ8/+7nOdV0thEDNmmdFXgS9JCgCqF7d4oKPhPRl/uQVBRRVFkU/kG/cnvSlbNXSvAmLRbD94GwuLswltIisa5mlUzfDhee9F+4Vj6/RRVKlEHs/scIL8LHIY9PLkzRviSpq4VlNYC+eEJn+RP/tav5XiCbLqzkV6SnA05OVhEud6/FE5NecFsx7ll2WFTcXVtqjmVDGZGobzFRRf2je68p8LD0dlr4RkkbNn2Dc7nhiIfqrjjoyMsGwGT9wQkwWB1LQwuyYf1tRYZhBGZM6DA2pkuLMUmPYyFbjmVQloFD7Hw17u1JL+VwyV1TueoX03tD7C9J8ViRFUhypGxJdME7qD0WC39+ZcLBIPVHOEFaHoum/SsxHVNnRtYiDwqYd2IiwaRsQkigX0piVNtLTOheblbiFu8Bio3xi/LY/zU3WN8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(136003)(39850400004)(4326008)(9686003)(2906002)(83380400001)(8936002)(33656002)(5660300002)(52536014)(122000001)(478600001)(55016002)(186003)(316002)(26005)(54906003)(86362001)(110136005)(4744005)(8676002)(38100700002)(66946007)(76116006)(71200400001)(7696005)(6506007)(66446008)(66476007)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?ml+VGa3mrVqfRvOSWdseJTGerY/vb9Q0JCh+VCdvP462mpfM4gsnc1xOuc?=
 =?iso-8859-1?Q?TMYFy6fN34moO+2+AM0mjXl9Uvf08/F8AE8ExLh7P+8zqhelseD2nW4FGh?=
 =?iso-8859-1?Q?ELYKuXv93V9Ogg8gbXrKFUudMS6zpbFtc7crpVerb5qRroSDnXqcff4DtY?=
 =?iso-8859-1?Q?X02AVibb6ol6Wb9M3yevkUOEFNjmhBbB+kK/BxKWLPXLaVNcuqy+lswETC?=
 =?iso-8859-1?Q?2eqVhEgDaG9V+CIkeACZrDyhbSC8F6EYOt6VXjc2M2Vpo1eNi2IA05C+8f?=
 =?iso-8859-1?Q?asKtwAIXeDoO4/P+7rZOSBl9jmMNl3Z/QGy6l1tmWhOfFwb7rnCBCiZhux?=
 =?iso-8859-1?Q?UJnhApqRMCJVvAjP6KU8Dpsp1OtybHQgKxgpuWVqP8E699AZNOCEGa2gmM?=
 =?iso-8859-1?Q?RWBybAXoSS827Fn6E0JciDsENg2BEwNEeTZN00JwEU+M056LEkjBhconAF?=
 =?iso-8859-1?Q?bNScY2CqbDOWQqLpheCEJo31K0rNnN7CeTlJxVXiJnWs8odC8vFs2RHn20?=
 =?iso-8859-1?Q?fq1I+7VeUS9vvQHnV/mavx9b0vP/EWPAFsE36fCqR75cx7YJn0EBRn2wJ0?=
 =?iso-8859-1?Q?y5IEbWQyaP6dSLU9hgQ1kGy0bruspUk8RaKzy7VIHVhvMjUThqfWcoSOyx?=
 =?iso-8859-1?Q?lZCP6gPX5HN7pi0MjX62567cbMlsIUtLzETEuYZ4HiqTD/9fzpa33lx1+i?=
 =?iso-8859-1?Q?GqrbSI6k2g0vLP+iujCGoB4yBEMnaLopr+lL+/NqIbZYXw9FAzD2A7klLv?=
 =?iso-8859-1?Q?TxnOyETrSZDcCWM27pogSbCdcmYjVhb7ywkLA/5NtS2PKorFTscsNe5TSJ?=
 =?iso-8859-1?Q?22PEUUqXMLPyVdu6ElYUznjUj6PijbNvOnGv5yqOq3+G+n96mhA3bgMtS7?=
 =?iso-8859-1?Q?tcYFxk9Z0qIW9wDciK8yd7OxlZCg35yMzJZpqdCVRn6s+UEtwmoW0xZ+4A?=
 =?iso-8859-1?Q?A0nTt/w6GF5tfjxL653SYP3rKgrLH2q40TICwa8v8QBJlu9SbV0wRSL6LA?=
 =?iso-8859-1?Q?F9EXbqSTt8OUgKD9jBNRTYoUnw/1B9eeBxlBEVqZ0Tg+SHLzT9bIpWI7HP?=
 =?iso-8859-1?Q?F6+lHTfh9vs+Qcc/Id6R6qzxNE/6P6I4RTiB+6sZnYR7qt4vPAGx/JidQR?=
 =?iso-8859-1?Q?aSML0bSxJvj2g0+ZolzHx3nqMxiRQ6B8ppe6LfZli+F/voKuROG7nDjt0L?=
 =?iso-8859-1?Q?NEHUB+AgGowCaN67SA8J9vBy+WjFv63wBM5+sCp5NaQ5XrHHoI2olkoyXk?=
 =?iso-8859-1?Q?MwXbD10RgzBi+o9c4rCIskz00P/sWnN8qtJufkbADu0BPoMypbC7tkMI0P?=
 =?iso-8859-1?Q?psVugGcfdgwkz7whH/SreF4HTOKavtFJFNkWGpKQ1sE0cGU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e3497e-09e5-4be3-3eb8-08d9208e2c87
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 21:35:25.1353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qLy6u7HEY7dMWIxbV4cmFf1GRlqDn8QOd9giFAJimvZ9SS+zsouUSJ/mpGROjfh7X6h8cIeBxOcACcsUlFzubA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4370
Received-SPF: pass client-ip=40.107.80.103;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Since ppc was the last architecture to collect these statistics and it is=
 currently
> phasing this collection out, the command that would query this informatio=
n is
> being removed.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  hmp-commands-info.hx | 13 -------------
>  monitor/misc.c       | 11 -----------
>  2 files changed, 24 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br>
Departamento de Computa=E7=E3o Embarcada
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

