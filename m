Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A996FB186
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:29:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0um-0003Ww-Hm; Mon, 08 May 2023 09:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pw0ui-0003V9-TJ
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:28:29 -0400
Received: from pv50p00im-ztdg10011201.me.com ([17.58.6.39])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pw0uf-000632-GH
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683552500; bh=bMT/1ROe3CxgIVwiCc9NTl9XavCEX/72u7JcD/QezSM=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=b3sIHAIZA4DHGuWbFKQByOGuGkrF+SPdFUKP44xm2ZMfGbITWqbd5A5yB6cKBXPI5
 pGQkIX5rcFp4xX5CawriLw1Pd7fNv07oFZQUHvsJVR3Q22a0C804J7nQZ7oUGDeNGX
 KAfZoZEb2hgkv/YZyqI5YIX+j+KXED0oQ4OEZhlxIFC0l+MLQnmIOqHVZdnpDsPriW
 aOLDumjs6fOK1m/8buG2DheELf5hHjxorMs4NVik5xhoKZ7xl6WSRiYSMMjUy4FrVm
 jRn7Nrht6hpo0WL4vn9L9IIpWXLBIioxvwAiSwswYtJbaX1MA02tAUwcTcj6+JHIBY
 JGoT2W3/JxKZg==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10011201.me.com (Postfix) with ESMTPSA id C698368012D;
 Mon,  8 May 2023 13:28:17 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 00/12] simpletrace: refactor and general improvements
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <CAFn=p-Zi-YfAeROOt=u3_xke+p7BT1Kt0Q9Vsm_gag5jW4FmGw@mail.gmail.com>
Date: Mon, 8 May 2023 15:28:04 +0200
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8690784A-9AC1-4D4C-B398-CDE0B047064D@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <CAFn=p-Zi-YfAeROOt=u3_xke+p7BT1Kt0Q9Vsm_gag5jW4FmGw@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Proofpoint-GUID: yW8uUhdq3zJQVddEOReN1jgCD2vAf-23
X-Proofpoint-ORIG-GUID: yW8uUhdq3zJQVddEOReN1jgCD2vAf-23
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 clxscore=1030 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=702 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305080091
Received-SPF: pass client-ip=17.58.6.39; envelope-from=mads@ynddal.dk;
 helo=pv50p00im-ztdg10011201.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


> A question for you: do you think it's possible to move simpletrace =
into qemu/python/utils? This requires cleaning up the code to some =
fairly pedantic standards, but helps protect it against rot as we change =
target python versions.=20
>=20
> No problem if that's too much to ask. just want to know if you had =
looked into it.

Potentially, this would be possible. But `simpletrace.py` imports
`qemu/scripts/tracetool/`, so that would have to be moved as well, or =
installed
as a package. I haven't touched the `tracetool` code itself, so I'm not =
sure how
feasible it is (i.e. how many other places use `tracetool`).=

