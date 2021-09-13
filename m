Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC3C40827B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 03:15:55 +0200 (CEST)
Received: from localhost ([::1]:40212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPaZe-0004J4-5W
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 21:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mPaYJ-0003ct-Tx
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 21:14:32 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mPaYH-0002aT-MG
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 21:14:31 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18CEPBd2006131; 
 Mon, 13 Sep 2021 01:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=quH+lwcIjmazqk3q54jndrQutJ+VatEgybaa3CVjpNk=;
 b=u6B0iqVp/bD9w4fQSWnU+pePZfcwufp7mjUWnmNjo5wqGhEfjqVeFzJZN/djp469Qafj
 A/FX3uKIqkyA6qAfXBF1poC/nLJzgmXqKyY/jlVUJaaE29JrnSlrQEQ9WsUw7+w0Z/vG
 +SdEWyDk0DzMVtUBBIgxtK+ZGB/UGxmbbBKMobwMXWXNDAszpIZa7iy3ZNQiS9Ck1LuV
 L48cCzSjcgUlQRzLfYHStD42lV9CsiAz0CC/uRWHU8zSoBYxenhKGz5P4ibZkCa6zbQL
 4og4jC0iv/mUZvOXkpSkDtrSOC2RQL0fnFArHGXQ+nvpm4/P8qmCIxGg60rzCzjIq2U5 tQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=quH+lwcIjmazqk3q54jndrQutJ+VatEgybaa3CVjpNk=;
 b=DUkoZILkHpUVhfoY6ZJBJqPK9GnIHVlStKCVL4oB2hveqYsrVxckMwh8drWbEMdkqAHS
 dq10cJxZMX8Q5ABg2IIeTdX9DXZGMXsBZHNKp9ZXPEyqq85eC5GRblED/F4iwgonk0zw
 dXM7KgohONshQXlRu5M6aTsEaYnyAezBtAgj3oNOEz1quB8hlTQkVLIqSmc4sCh3GKMu
 AQws2iSQNU6tSMySFIDFXccWzrhxbVCILHQzEjweuk2EBeYsOSfkgg555h1kbc6hKVyI
 tBKmCoa1DaZpdxfTmtXHS2amH+o838fCwebZIQpUoOpUa9xF16Y+Ob9kFkbGEaXnouXQ nw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b1k9rrsgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 01:14:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18D16QXK110242;
 Mon, 13 Sep 2021 01:14:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by aserp3030.oracle.com with ESMTP id 3b0jgavx9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 01:14:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O91CCpX4pVcuCmH0p2/3PPZmFtgGd1y+kIN0DSx4NigqiorsS6cG3Zzt7owbAeKjVr6UsY2bCgSsyi9eLwIKs2I+O3TCvMcmvGIjmtx1A0VDDtSag+ZdWQh4cTYt9bWZouIiZ/93m/qbvAVN+T5ZU0tthLbmGs2WHE6BCdk4YHTZNofZHUHtOujA++nUI/g9JTGn1W+y9frb/ouAJQEoqmQXcN4WlLhjCcVx3P9LJp33VmxJQvot6mJl2H3AZXW8fNdaJ4PCdEQ5Uyoor+GOmErpf2aUo4z+nzUvuictQ8ykrNF1TzbmA8m0GTvtDUc4o4eCSf6ACJM++rPTbwNyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=quH+lwcIjmazqk3q54jndrQutJ+VatEgybaa3CVjpNk=;
 b=lr7SKzw1gXq8YoRJMaQqKpKEPPI/LO9Vw9uvdxV7AKJkz7K/4BMR7bZbFknKfPzS5iEXQGY2Xn7MRvF+xOnYvK6///NXLiQUwUjYVwV9UiGuX2KotViCxrk1hipTmvFwNZWC1mKma+uXLtqjkum1O4sbz8mxcKpFYtC1ejk6EGxYi5KBvLrqnOysjrvtailfkM2vvD/U09BaU8npUiAgGrkJeaUN/3sngD2lWwdYskIocKnmUak46HPTzynk+umcKsrmMAwQeJqKpNpssUpOZ8UUmoVDcyyZwW67SFQI74EPAaBrxKAA7z3tyjZC3AYcoSaDlY4v3+PnGVCMc5sEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quH+lwcIjmazqk3q54jndrQutJ+VatEgybaa3CVjpNk=;
 b=WJAcq5jLFzRUOD3/4ZTY5Xbj7IJbi45fi6ySiCEAT8Fn+0txGiNfttN5gRZXZfQn6sUc8m+59YVihB+UuTPXst+2PXlITE4OE44PJP/bKrWLUk31fivzyy0NNPAJAQ/SOyOA3O05SBeVFjj65QEeEbiDefz054qUJEv0FgiNMeY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4190.namprd10.prod.outlook.com (2603:10b6:208:19a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 01:14:16 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92%6]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 01:14:16 +0000
From: Jag Raman <jag.raman@oracle.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: Help adding package to gitlab runners
Thread-Topic: Help adding package to gitlab runners
Thread-Index: AQHXqDysaoQKKseRQkChbGKpukNscQ==
Date: Mon, 13 Sep 2021 01:14:16 +0000
Message-ID: <2CFBCC64-910E-43DF-8A57-8F20671DD7D4@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b94fdf1-ee38-45a4-1051-08d97653ce8f
x-ms-traffictypediagnostic: MN2PR10MB4190:
x-microsoft-antispam-prvs: <MN2PR10MB419069D36570C7215426527E90D99@MN2PR10MB4190.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l7wto6EKvc/sQ7Mqeu4gfkzEoZ4QUHqGuL6VdNb4iprCANuPJpFK7xKUf8ciJ1ZahABU5UxuQud+U4dwFxZrmeCtAv1y+BKFrdkxBrNu078dTZ/+PrGwr6jPgADzaR3haVRUlSy8g/GhBjD/HQotCmaHJAUSnRiXNhkBkuipo9gTl13na0bA4D+0HDybSzoZqugrhzRb7gad7RMXieWs8mUhvPGrebKNrilR8hArM76B1BWrP0GURJITybANk+VER9SKAzdV4Af3GyYWgKq0Qqx4j7cyxMZ5D9v/Q5XLUJVcqz4shbu+BV3FSL1kD8kfLjzcjzuWWhl+FviAp0AHHVGvdy5CBQZexWu7Ie/7y3Y97BHT3Haq+r7vDMoEVZfDokZxrEYvCfT7SAupBQIj2YiOaMc/cEUkmdBx+GaooahEx7S4XDlgSTEktx33o3PoA1H0SN7A45sMi2k62jlL8KhiIlfYduIR0WqKS+xY99IOwNd7Wmr2tiBovoRUMq3erPwE8vL9q3vwPi+2Er/sDwr/iUobLOqoryt0B/RQrZVJlOqrXauFfud9EQfZe4sNnMoyxGD6Bfi4aXG0Aa315neo8uk1aCnOMRSBiCwT7aWRd95/5oJtG17anVUmnYmiEGukDB9K7t8P7MjpMNO9WxSnNkW66Ypn9TZKKu2Q9qClnna1JARS+AnaDAgTd+6mFlc3FpkwziCufoOV6gWkGjJgmO5uFNSmBeilEMDJtoQxZF0p16UVi5q1RPfTEzO7ewcbGiW0xY9halXS0Ny2kUE0F0yEU+V4UCfZBwCtX/kZPYdLc47VITdPcwK9+3v1Oor81kbjg/LxSciyN+hEDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(136003)(346002)(366004)(376002)(478600001)(316002)(122000001)(66556008)(44832011)(71200400001)(8936002)(5660300002)(6916009)(966005)(38100700002)(6486002)(33656002)(2906002)(8676002)(86362001)(4326008)(2616005)(26005)(186003)(54906003)(36756003)(38070700005)(6512007)(76116006)(66476007)(64756008)(66446008)(6506007)(66946007)(4744005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wImo7E1I8bPQh4droReiBnXXs+gHIbA7SvXGJ65ZJsF/XKnD62MllttLVi?=
 =?iso-8859-1?Q?9NMMJXgLE3XbD8mIa0lpJSkFdTdaA0KZjTj+BlpXhcFgnbAtUlJyW71xIX?=
 =?iso-8859-1?Q?uTkZ9wpW4eby4AseN4qrlL1FpRjGUVAm6f3vQRj+839fDPJVrf2yuS8rHb?=
 =?iso-8859-1?Q?93kLlpx9dXE434FbUmdK0OujCQoxiS0JyWIdVg02ZQv95RxlegOKJN6/e5?=
 =?iso-8859-1?Q?O4zZBMXJQ6vquYdk8EEjOfitVHGInUt40MwHj7tdBM7+wQIt34wOmuFv+D?=
 =?iso-8859-1?Q?rD695V6zbZe2qwOfxqtNQQ1I3yn+sA8MFW4oA/l3iLTN9LEbOXr7M3OVmN?=
 =?iso-8859-1?Q?jWeGNOTJZQJe3OXY9N3oVyopLJkbCbcg0ji3nyYLFwl7k4sbbvSknBBax0?=
 =?iso-8859-1?Q?Wi0Sq/JaAPEMmGSw75nsW1pz7015A002JNzPTdMT4RQ0SzBfDgNQLE0sax?=
 =?iso-8859-1?Q?M7qdV7zN1Gc6a1PwLDdPVuYcyzkq/Q4ufl6BX9MeT/golMzovcGjwK+BDG?=
 =?iso-8859-1?Q?UNkbsQuixzX8upsxBX5RMcNNmlZZ/1CWuopx9ovT18hi9THV5EGpquDngN?=
 =?iso-8859-1?Q?hKk8lCE/f3Ii8ueYFnUzSMPQkkxJjHf26wQibw/QSCOwdFwxumyw0loxzi?=
 =?iso-8859-1?Q?AZmR0Ugttkl9jvw9Di61Sa6lNXmO5lo47PyAsKLmIuN+TocTc2i/0/kcNo?=
 =?iso-8859-1?Q?LGIymL0iBlfBUX+llbV04JLV+ZJgRTTa/UzBY2exp0Nxk2Yr5eMCNSJhg7?=
 =?iso-8859-1?Q?fmelcT5A4ZFYv26FV0IbD19suB+fXnX6s/Z7vbD9Zp2hHkInyRMfxuIoYj?=
 =?iso-8859-1?Q?KamFaFuYPmj2FqlKZ/lH7/1CBq8nkfZPWGXj9HIcTjyZ13MyTxz34nJLJu?=
 =?iso-8859-1?Q?FSKyd6y3OKy0x1DBLVQu+XnyScoGoD4Jl/f4pfBl1M8qzTw33BgV0ko0zQ?=
 =?iso-8859-1?Q?4UEh2vR72r1Knbgc5vX7eWoocQcYAQtB2KQ9gzzxxJwtWtnT/rsvnCCZKE?=
 =?iso-8859-1?Q?5adE6tIw347h35Wc/QWGEBZjhHHkWwteCZ6iEdaygug3TcEYj2fIqfincu?=
 =?iso-8859-1?Q?4nS3/S8ZAU+kTVB0/4ZEIz0cVElppej1vTPFXyi9acM7Qja9tTCo2MBYzu?=
 =?iso-8859-1?Q?bJYY+RmQlhstYx9BQt4HUliMeeswk5kxtR/OTYpMm1NLBdhcXyZYZXHlk7?=
 =?iso-8859-1?Q?fw3UvbHgdt/M998rNAH0dGvp/NxNb+kx5bBbAK1ZGt6CMLoMZiER62VrsX?=
 =?iso-8859-1?Q?AsA9fGNS7ubEQCFeSYQcMSVYDUso9MdsiIPmftRrV+ufbAYKM9Y/IUJJcv?=
 =?iso-8859-1?Q?3Y7KVQbA85p8sVaTZca6a0QRSgDJw8yVhsvGrcDDaTOQVQEEEi9ZJcT6wR?=
 =?iso-8859-1?Q?h29hBwqIa7?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <72B17C8C94557246981225A5FD9B3B17@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b94fdf1-ee38-45a4-1051-08d97653ce8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 01:14:16.8751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ex85+4VHH3WPBor0k5BpgJfHmVdF2dE+KGRRi10my8kKQz/TBQ3I6fgupaiP6fZz19KT/DhbW4oz92P5Dfks4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4190
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10105
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=919 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130007
X-Proofpoint-ORIG-GUID: Q-G-5akWfibq1L2njmqZpKW3bDTqLhJU
X-Proofpoint-GUID: Q-G-5akWfibq1L2njmqZpKW3bDTqLhJU
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'm wondering about the best way to install a dependency package on
GitLab runners.

I'm adding libvfio-user [1] as a submodule to QEMU. libvfio-user depends
on the availability of the "json-c" package. As such, we need to install th=
is
package to build the library as part of QEMU.

I saw that we could add a "before_script" section to the jobs in
".gitlab-ci.d/buildtest.yml" - this section could have commands to install =
the
"json-c" package before running the job. However, this option is specific t=
o
a job.

I wonder if there is a way to do this for all jobs. I saw that
"scripts/ci/setup/build-environment.yml" has a list of packages needed to
build QEMU - this one seems Ubuntu-specific.

How long does it take for changes made to this file (build-environment.yml)
to propagate? Are all QEMU's GitLab runners Ubuntu-based?

Thank you very much!
--
Jag

[1]: https://github.com/nutanix/libvfio-user=

